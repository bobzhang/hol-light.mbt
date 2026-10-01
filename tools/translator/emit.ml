(* Top-level items of a translated file: theorem and value cells with
   accessors, functions, and the ordered load steps. *)
module Emit = struct
  open Typedtree
  module M = Mbti
  open Ir
  open Lower

  (* Phrases ported by hand: the line where the phrase starts, the setup
     function the load steps call there, and the MoonBit names of the values
     it defines (OCaml name -> MoonBit name). *)
  type hand = { line : int; setup : string option; names : (string * string) list }

  let decls = Buffer.create 65536
  let steps = Buffer.create 65536
  let errors = ref 0

  let add_step comment stmts =
    Buffer.add_string steps ("\n  // " ^ comment);
    Buffer.add_string steps (Ir.string_of_stmts stmts |> String.split_on_char '\n' |> String.concat "\n  ")

  let used_names : (string, unit) Hashtbl.t = Hashtbl.create 256

  let fresh_top oname =
    let base = sanitize oname in
    let rec go i =
      let n = if i = 0 then base else Printf.sprintf "%s_%d" base i in
      if Hashtbl.mem used_names n then go (i + 1) else (Hashtbl.add used_names n (); n)
    in
    go 0

  let rec is_function e =
    match e.exp_desc with Texp_function _ -> true | _ -> false

  let generics () =
    let names = Hashtbl.fold (fun _ n acc -> n :: acc) tyvar_names [] in
    match List.sort compare names with [] -> "" | ns -> "[" ^ String.concat ", " ns ^ "]"

  (* `let f p1 ... pn = body` -> `pub fn f(...) -> R raise { ... }` *)
  let emit_function oname id (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = fresh_top oname in
    (* the syntactic parameters *)
    let rec params e acc =
      match e.exp_desc with
      | Texp_function { cases = [ c ]; _ } when acc = [] || true ->
          (match c.c_lhs.pat_desc with
           | _ -> params c.c_rhs (e :: acc))
      | _ -> (List.rev acc, e)
    in
    let fns, body = params e [] in
    let param_tys =
      match fns with
      | [ f ] ->
          (match arrow f.exp_type, (match f.exp_desc with Texp_function { cases = [ c ]; _ } -> Some c.c_lhs | _ -> None) with
           | Some (a, _), Some { pat_desc = Tpat_tuple _; _ } ->
               (match Types.get_desc (expand a) with Types.Ttuple ts -> ts | _ -> [ a ])
           | Some (a, _), _ -> [ a ]
           | _ -> [])
      | _ -> List.filter_map (fun f -> Option.map fst (arrow f.exp_type)) fns
    in
    let want = M.Fun (List.map mty_of param_tys, mty_of body.exp_type, true) in
    Hashtbl.replace own_by_name oname (mname, Function want);
    ignore id;
    let _, lam, _ = lower ~expect:want e in
    match lam with
    | Lam (names, (stmts, result)) ->
        let sig_params =
          String.concat ", " (List.map2 (fun n t -> n ^ " : " ^ show_ty t) names param_tys)
        in
        let ret = show_ty body.exp_type in
        let ret = if String.length ret > 0 && ret.[0] = '(' then "(" ^ ret ^ ")" else ret in
        let body_text = Ir.to_string (fun () -> Ir.pblock (stmts, result)) in
        Buffer.add_string decls
          (Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(%s) -> %s raise %s\n" oname (generics ()) mname sig_params ret body_text)
    | _ -> failwith "emit_function: not a lambda"

  (* `let x = e` -> a cell, an accessor and a load step *)
  let emit_value oname (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = fresh_top oname in
    let ty = show_ty e.exp_type in
    let mty = mty_of e.exp_type in
    let stmts, x, _ = lower ~expect:mty e in
    Buffer.add_string decls
      (Printf.sprintf "\n///|\nlet %s_c : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn %s() -> %s {\n  %s_c.get()\n}\n"
         mname ty (string_lit oname) oname mname ty mname);
    add_step oname (stmts @ [ Do (Call (Atom (mname ^ "_c.set"), [ x ])) ]);
    Hashtbl.replace own_by_name oname (mname, Accessor mty)

  let emit_eval (e : expression) =
    match e.exp_desc with
    | Texp_apply ({ exp_desc = Texp_ident (p, _, _); _ }, _) when Path.name p = "needs" -> ()
    | _ ->
        let stmts, x, _ = lower e in
        let last = if is_unit e.exp_type then Do x else Do (Call (Atom "ignore", [ x ])) in
        let _, line, _ = Location.get_pos_info e.exp_loc.Location.loc_start in
        add_step (Printf.sprintf "%s:%d" !current_file line) (stmts @ [ last ])

  let item ~(hand : hand list) (it : structure_item) =
    let _, line, _ = Location.get_pos_info it.str_loc.Location.loc_start in
    match List.find_opt (fun h -> h.line = line) hand with
    | Some h ->
        (match h.setup with
         | Some f -> add_step (Printf.sprintf "hand-ported (line %d)" line) [ Do (Call (Atom f, [])) ]
         | None -> ());
        List.iter
          (fun (id, _, ty) ->
            let oname = Ident.name id in
            let mname = try List.assoc oname h.names with Not_found -> sanitize oname in
            Hashtbl.replace used_names mname ();
            Hashtbl.replace own_by_name oname (mname, Function (mty_of ty)))
          (match it.str_desc with
           | Tstr_value (_, vbs) -> List.concat_map (fun vb -> pat_bound_idents_full vb.vb_pat) vbs
           | _ -> [])
    | None ->
        (try
           match it.str_desc with
           | Tstr_value (Asttypes.Nonrecursive, [ { vb_pat = { pat_desc = Tpat_var (id, _); _ }; vb_expr; _ } ]) ->
               if is_function vb_expr then emit_function (Ident.name id) id vb_expr
               else emit_value (Ident.name id) vb_expr
           | Tstr_eval (e, _) -> emit_eval e
           | _ -> unsupported it.str_loc "structure item"
         with Unsupported (msg, loc) ->
           incr errors;
           let file, l, c = Location.get_pos_info loc.Location.loc_start in
           Printf.printf "%s:%d:%d: unsupported: %s\n%!" (Filename.basename file) l c msg;
           add_step (Printf.sprintf "UNSUPPORTED at line %d: %s" line msg) [])

  let output ~source ~out =
    let oc = open_out out in
    Printf.fprintf oc
      "// Generated by tools/translator from %s; do not edit.\n// Regenerate with tools/ocaml_ref/translate.sh translate %s.\n%s\n///|\nfn load_steps() -> Unit raise {%s\n}\n"
      source source (Buffer.contents decls) (Buffer.contents steps);
    close_out oc
end
