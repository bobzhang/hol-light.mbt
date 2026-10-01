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

  (* declarations are printed at output time, when later phrases have
     resolved weak type variables (e.g. of `ref []`) *)
  let decls : (unit -> string) list ref = ref []
  let add_decl f = decls := f :: !decls
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
    let param_tys, body = function_signature e in
    let want = M.Fun (List.map mty_of param_tys, mty_of body.exp_type, true) in
    ignore id;
    scope_tyvars := tyvars_of_text (String.concat " " (List.map show_ty (body.exp_type :: param_tys)));
    let _, lam, _ = lower ~expect:want e in
    scope_tyvars := [];
    (* registered after its body: a non-recursive redefinition refers to
       the previous binding *)
    Hashtbl.replace own_by_name oname (mname, Function want);
    match lam with
    | Lam (names, (stmts, result)) ->
        let sig_params =
          String.concat ", "
            (List.map2 (fun n t -> if String.contains n ':' then n else n ^ " : " ^ show_ty t) names param_tys)
        in
        let ret = show_ty body.exp_type in
        let ret = if String.length ret > 0 && ret.[0] = '(' then "(" ^ ret ^ ")" else ret in
        let body_text = Ir.to_string (fun () -> Ir.pblock (stmts, result)) in
        let text = Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(%s) -> %s raise %s\n" oname (generics ()) mname sig_params ret body_text in
        add_decl (fun () -> text)
    | _ -> failwith "emit_function: not a lambda"

  let paren_fn t = if String.length t > 0 && t.[0] = '(' then "(" ^ t ^ ")" else t

  (* The declarations for a value cell `mname` of OCaml type `oty`: an
     accessor, or for a function a wrapper taking its first argument. *)
  let installed_type oname (oty : Types.type_expr) =
    match Env.find_value_by_name (Longident.Lident oname) !Toploop.toplevel_env with
    | (_, vd) -> vd.Types.val_type
    | exception Not_found -> oty

  let cell_decls oname mname (oty0 : Types.type_expr) =
    let mty = mty_of oty0 in
    (match mty with
     | M.Fun _ ->
         add_decl (fun () ->
             Hashtbl.reset tyvar_names;
             let oty = installed_type oname oty0 in
             let ty = show_ty oty in
             match arrow oty with
             | Some (a, b) ->
                 Printf.sprintf
                   "\n///|\nlet %s_c : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn%s %s(x : %s) -> %s raise {\n  (%s_c.get())(x)\n}\n"
                   mname ty (string_lit oname) oname (generics ()) mname (show_ty a) (paren_fn (show_ty b)) mname
             | None -> failwith "cell_decls")
     | _ ->
         add_decl (fun () ->
             Hashtbl.reset tyvar_names;
             let oty = installed_type oname oty0 in
             let ty = show_ty oty in
             Printf.sprintf
               "\n///|\nlet %s_c : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn%s %s() -> %s {\n  %s_c.get()\n}\n"
               mname ty (string_lit oname) oname (generics ()) mname ty mname));
    Hashtbl.replace own_by_name oname
      (mname, match mty with M.Fun _ -> Function mty | _ -> Accessor mty)

  (* `let x = e` -> a cell, an accessor (or wrapper) and a load step *)
  let emit_value oname (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = fresh_top oname in
    let mty = mty_of e.exp_type in
    let stmts, x, _ = lower ~expect:mty e in
    add_step oname (stmts @ [ Do (Call (Atom (mname ^ "_c.set"), [ x ])) ]);
    cell_decls oname mname e.exp_type

  (* `let p = e` for an irrefutable pattern binding several values *)
  let emit_pattern (vb : value_binding) =
    Hashtbl.reset tyvar_names;
    let stmts, x, t = lower vb.vb_expr in
    let pat = pattern ~mty:t vb.vb_pat in
    let ids = pat_bound_idents_full vb.vb_pat in
    let sets =
      List.map
        (fun (id, _, ty) ->
          let oname = Ident.name id in
          let mname = fresh_top oname in
          let local = (Hashtbl.find locals (Ident.unique_name id)).name in
          cell_decls oname mname ty;
          Do (Call (Atom (mname ^ "_c.set"), [ Atom local ])))
        ids
    in
    add_step (String.concat ", " (List.map (fun (id, _, _) -> Ident.name id) ids))
      (stmts @ [ Let (pat, x) ] @ sets)

  let emit_eval (e : expression) =
    match e.exp_desc with
    | Texp_apply ({ exp_desc = Texp_ident (p, _, _); _ }, _) when Path.name p = "needs" -> ()
    | _ ->
        let stmts, x, _ = lower e in
        let last = if is_unit e.exp_type then Do x else Do (Call (Atom "ignore", [ x ])) in
        let _, line, _ = Location.get_pos_info e.exp_loc.Location.loc_start in
        add_step (Printf.sprintf "%s:%d" !current_file line) (stmts @ [ last ])

  let flush_lifted () =
    List.iter (fun text -> add_decl (fun () -> text)) (List.rev !lifted);
    lifted := []

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
        Hashtbl.reset local_names;
        (try
           match it.str_desc with
           | Tstr_value (Asttypes.Nonrecursive, [ { vb_pat = { pat_desc = Tpat_var (id, _); _ }; vb_expr; _ } ]) ->
               if is_function vb_expr then emit_function (Ident.name id) id vb_expr
               else emit_value (Ident.name id) vb_expr
           | Tstr_value (Asttypes.Nonrecursive, [ vb ]) when irrefutable vb.vb_pat -> emit_pattern vb
           | Tstr_value (Asttypes.Recursive, vbs) ->
               (* register every function first: they may call each other *)
               List.iter
                 (fun vb ->
                   match vb.vb_pat.pat_desc with
                   | Tpat_var (id, _) ->
                       let param_tys, body = function_signature vb.vb_expr in
                       let want = M.Fun (List.map mty_of param_tys, mty_of body.exp_type, true) in
                       Hashtbl.replace own_by_name (Ident.name id) (sanitize (Ident.name id), Function want)
                   | _ -> unsupported vb.vb_loc "recursive value")
                 vbs;
               List.iter
                 (fun vb ->
                   match vb.vb_pat.pat_desc with
                   | Tpat_var (id, _) -> emit_function (Ident.name id) id vb.vb_expr
                   | _ -> ())
                 vbs
           | Tstr_eval (e, _) -> emit_eval e
           | _ -> unsupported it.str_loc "structure item"
         with Unsupported (msg, loc) ->
           incr errors;
           let file, l, c = Location.get_pos_info loc.Location.loc_start in
           Printf.printf "%s:%d:%d: unsupported: %s\n%!" (Filename.basename file) l c msg;
           add_step (Printf.sprintf "UNSUPPORTED at line %d: %s" line msg) []);
        flush_lifted ()

  let output ~source ~out =
    let oc = open_out out in
    Printf.fprintf oc
      "// Generated by tools/translator from %s; do not edit.\n// Regenerate with tools/ocaml_ref/translate.sh translate %s.\n%s\n///|\nfn load_steps() -> Unit raise {%s\n}\n"
      source source (String.concat "" (List.rev_map (fun f -> f ()) !decls)) (Buffer.contents steps);
    close_out oc
end
