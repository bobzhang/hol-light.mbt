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

  (* each upstream phrase's load-time work is its own function (one huge
     initializer overflows the wasm stack) *)
  let step_count = ref 0

  let add_step comment stmts =
    incr step_count;
    let name = reserve_top (Printf.sprintf "step_%d" !step_count) in
    let body = Ir.to_string (fun () -> Ir.indent := 1; List.iter Ir.pstmt stmts) in
    add_decl (fun () -> Printf.sprintf "\n///|\n/// %s\nfn %s() -> Unit raise {%s\n}\n" comment name body);
    Buffer.add_string steps ("\n  " ^ name ^ "()")

  let used_names = top_names

  (* OCaml name -> number of its top-level definitions not yet translated
     (from a pre-scan of the file): the last definition of a name gets the
     plain MoonBit name, earlier ones a numbered one. *)
  let remaining_defs : (string, int) Hashtbl.t = Hashtbl.create 64

  let fresh_top oname =
    let base = sanitize oname in
    let left = try Hashtbl.find remaining_defs oname with Not_found -> 1 in
    Hashtbl.replace remaining_defs oname (left - 1);
    let rec go i =
      let n = if i = 0 then base else Printf.sprintf "%s_v%d" base i in
      if Hashtbl.mem used_names n || (i = 0 && left > 1) then go (i + 1)
      else (Hashtbl.add used_names n (); n)
    in
    go 0

  let rec is_function e =
    match e.exp_desc with Texp_function _ -> true | _ -> false

  (* the type parameters a signature mentions, with OCaml's polymorphic
     equality, comparison and hashing *)
  let generics_of text =
    match tyvars_of_text text with
    | [] -> ""
    | ns -> "[" ^ String.concat ", " (List.map (fun g -> g ^ " : Eq + @lib.OCompare + @lib.OHash") ns) ^ "]"

  (* `let f p1 ... pn = body` -> `pub fn f(...) -> R raise { ... }` *)
  let emit_function ?mname oname id (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = match mname with Some m -> m | None -> fresh_top oname in
    let param_tys, body = function_signature e in
    let want = M.Fun (List.map mty_of param_tys, mty_of body.exp_type, true) in
    ignore id;
    scope_tyvars := tyvars_of_text (String.concat " " (List.map show_ty (body.exp_type :: param_tys)));
    let _, lam, _ = lower ~expect:want e in
    scope_tyvars := [];
    (* registered after its body: a non-recursive redefinition refers to
       the previous binding *)
    Hashtbl.replace own_by_name oname (mname, Function want);
    Hashtbl.replace own_values (Ident.unique_name id) (mname, Function want);
    match lam with
    | Lam (names, (stmts, result)) ->
        let sig_params =
          String.concat ", "
            (List.map2 (fun n t -> if String.contains n ':' then n else n ^ " : " ^ show_ty t) names param_tys)
        in
        let ret = show_ty body.exp_type in
        let ret = if String.length ret > 0 && ret.[0] = '(' then "(" ^ ret ^ ")" else ret in
        let body_text = Ir.to_string (fun () -> Ir.pblock (stmts, result)) in
        let text = Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(%s) -> %s raise %s\n" oname (generics_of (sig_params ^ " " ^ ret)) mname sig_params ret body_text in
        add_decl (fun () -> text)
    | _ -> failwith "emit_function: not a lambda"

  let paren_fn t = if String.length t > 0 && t.[0] = '(' then "(" ^ t ^ ")" else t

  (* The declarations for a value cell `mname` of OCaml type `oty`: an
     accessor, or for a function a wrapper taking its first argument. *)
  (* The type of a definition as installed by the toplevel (later phrases
     may resolve its weak type variables): filled in after the phrase runs. *)
  let pending_installs : (string * Types.type_expr option ref) list ref = ref []

  let () =
    Prov.on_record :=
      fun name vd ->
        match List.assoc_opt name !pending_installs with
        | Some slot ->
            slot := Some vd.Types.val_type;
            pending_installs := List.remove_assoc name !pending_installs
        | None -> ()

  let install_slot oname =
    let slot = ref None in
    pending_installs := (oname, slot) :: List.remove_assoc oname !pending_installs;
    slot

  let installed_type slot (oty : Types.type_expr) =
    match !slot with Some t -> t | None -> oty

  let cell_decls oname mname (oty0 : Types.type_expr) =
    let mty = mty_of oty0 in
    let slot = install_slot oname in
    (match mty with
     | M.Fun _ ->
         add_decl (fun () ->
             Hashtbl.reset tyvar_names;
             let oty = installed_type slot oty0 in
             let ty = show_ty oty in
             match arrow oty with
             | Some (a, b) ->
                 Printf.sprintf
                   "\n///|\nlet %s_c : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn%s %s(x : %s) -> %s raise {\n  (%s_c.get())(x)\n}\n"
                   mname ty (string_lit oname) oname (generics_of (show_ty a ^ " " ^ show_ty b)) mname (show_ty a) (paren_fn (show_ty b)) mname
             | None -> failwith "cell_decls")
     | _ ->
         add_decl (fun () ->
             Hashtbl.reset tyvar_names;
             let oty = installed_type slot oty0 in
             let ty = show_ty oty in
             Printf.sprintf
               "\n///|\nlet %s_c : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn%s %s() -> %s {\n  %s_c.get()\n}\n"
               mname ty (string_lit oname) oname (generics_of ty) mname ty mname));
    Hashtbl.replace own_by_name oname
      (mname, match mty with M.Fun _ -> Function mty | _ -> Accessor mty)

  (* `let x = e` -> a cell, an accessor (or wrapper) and a load step *)
  let emit_value ?id oname (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = fresh_top oname in
    let mty = mty_of e.exp_type in
    let stmts, x, _ = lower ~expect:mty e in
    add_step oname (stmts @ [ Do (Call (Atom (mname ^ "_c.set"), [ x ])) ]);
    cell_decls oname mname e.exp_type;
    match id with
    | Some id ->
        Hashtbl.replace own_values (Ident.unique_name id)
          (mname, match mty with M.Fun _ -> Function mty | _ -> Accessor mty)
    | None -> ()

  let camel s =
    String.concat "" (List.map String.capitalize_ascii (String.split_on_char '_' s))

  (* `type t = C1 of a * b | ...` -> an enum; `type t = u` -> an alias *)
  let emit_types (decls : type_declaration list) =
    (* register every name first: the types may be mutually recursive *)
    List.iter (fun d -> Hashtbl.replace own_types (Ident.name d.typ_id) (!current_pkg, camel (Ident.name d.typ_id))) decls;
    List.iter
      (fun d ->
        Hashtbl.reset tyvar_names;
        let name = camel (Ident.name d.typ_id) in
        let params = List.map (fun (ct, _) -> show_ty ct.ctyp_type) d.typ_params in
        let gens = if params = [] then "" else "[" ^ String.concat ", " params ^ "]" in
        match d.typ_kind, d.typ_manifest with
        | Ttype_variant cds, _ ->
            let ctors =
              List.map
                (fun cd ->
                  let cname = Ident.name cd.cd_id in
                  Hashtbl.replace own_ctors cname !current_pkg;
                  match cd.cd_args with
                  | Cstr_tuple [] -> cname
                  | Cstr_tuple cts -> cname ^ "(" ^ String.concat ", " (List.map (fun ct -> show_ty ct.ctyp_type) cts) ^ ")"
                  | Cstr_record _ -> unsupported d.typ_loc "record constructor")
                cds
            in
            add_decl (fun () ->
                Printf.sprintf "\n///|\n/// `%s`\npub(all) enum %s%s {\n  %s\n} derive(Eq, Debug)\n"
                  (Ident.name d.typ_id) name gens (String.concat "\n  " ctors));
            (* OCaml's structural compare and Hashtbl.hash: constant
               constructors are immediates (their index), the others blocks
               (tag = index among the non-constant ones) *)
            let arities = List.map (fun cd -> (Ident.name cd.cd_id, match cd.cd_args with Cstr_tuple l -> List.length l | _ -> 0)) cds in
            let const_idx = ref 0 and block_idx = ref 0 in
            let ranks =
              List.map
                (fun (c, n) ->
                  if n = 0 then (let i = !const_idx in incr const_idx; (c, n, `Imm i))
                  else (let i = !block_idx in incr block_idx; (c, n, `Block i)))
                arities
            in
            if params = [] then
              add_decl (fun () ->
                  let vars p n = List.init n (fun i -> Printf.sprintf "%s%d" p i) in
                  let rank_arms =
                    List.map
                      (fun (c, n, r) ->
                        let pat = if n = 0 then c else c ^ "(" ^ String.concat ", " (List.init n (fun _ -> "_")) ^ ")" in
                        match r with
                        | `Imm i -> Printf.sprintf "    %s => %d" pat i
                        | `Block i -> Printf.sprintf "    %s => %d" pat (1000000 + i))
                      ranks
                  in
                  let cmp_arms =
                    List.filter_map
                      (fun (c, n, _) ->
                        if n = 0 then None
                        else
                          let a = vars "a" n and b = vars "b" n in
                          let steps =
                            List.map2 (fun x y -> Printf.sprintf "let c = @lib.compare(%s, %s)\n      if c != 0 {\n        return c\n      }" x y)
                              (List.filteri (fun i _ -> i < n - 1) a) (List.filteri (fun i _ -> i < n - 1) b)
                          in
                          Some
                            (Printf.sprintf "    (%s(%s), %s(%s)) => {\n      %s\n      @lib.compare(%s, %s)\n    }" c
                               (String.concat ", " a) c (String.concat ", " b)
                               (String.concat "\n      " steps) (List.nth a (n - 1)) (List.nth b (n - 1))))
                      ranks
                  in
                  let hash_arms =
                    List.map
                      (fun (c, n, r) ->
                        match r with
                        | `Imm i -> Printf.sprintf "    %s => h.int(%dL)" c i
                        | `Block i ->
                            let a = vars "a" n in
                            Printf.sprintf "    %s(%s) => {\n      h.block(%d, %d)\n      %s\n    }" c (String.concat ", " a) i n
                              (String.concat "\n      " (List.map (fun x -> "h.field(" ^ x ^ ")") a)))
                      ranks
                  in
                  Printf.sprintf
                    "\n///|\nfn ocaml_rank_%s(x : %s) -> Int {\n  match x {\n%s\n  }\n}\n\n///|\npub impl @lib.OCompare for %s with fn ocompare(self, other) {\n  match (self, other) {\n%s\n    _ => ocaml_rank_%s(self).compare(ocaml_rank_%s(other))\n  }\n}\n\n///|\npub impl @lib.OHash for %s with fn ohash_visit(self, h) {\n  match self {\n%s\n  }\n}\n"
                    name name (String.concat "\n" rank_arms) name (String.concat "\n" cmp_arms) name name name
                    (String.concat "\n" hash_arms))
        | Ttype_abstract, Some ct ->
            let t = show_ty ct.ctyp_type in
            add_decl (fun () -> Printf.sprintf "\n///|\n/// `%s`\npub type %s%s = %s\n" (Ident.name d.typ_id) name gens t)
        | _ -> unsupported d.typ_loc "type declaration")
      decls

  (* `exception E` / `exception E of t` -> a suberror *)
  let emit_exception (ext : extension_constructor) =
    let name = Ident.name ext.ext_id in
    Hashtbl.replace own_ctors name !current_pkg;
    match ext.ext_kind with
    | Text_decl (_, Cstr_tuple [], _) ->
        add_decl (fun () -> Printf.sprintf "\n///|\n/// `exception %s`\npub(all) suberror %s\n" name name)
    | Text_decl (_, Cstr_tuple cts, _) ->
        add_decl (fun () ->
            Printf.sprintf "\n///|\n/// `exception %s`\npub(all) suberror %s {\n  %s(%s)\n}\n" name name name
              (String.concat ", " (List.map (fun ct -> show_ty ct.ctyp_type) cts)))
    | _ -> unsupported ext.ext_loc "exception"

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
          let local = Hashtbl.find locals (Ident.unique_name id) in
          cell_decls oname mname ty;
          Hashtbl.replace own_values (Ident.unique_name id)
            (mname, match mty_of ty with M.Fun _ as t -> Function t | t -> Accessor t);
          let _, v = adapt ([], Atom local.name) local.mty (mty_of ty) in
          Do (Call (Atom (mname ^ "_c.set"), [ v ])))
        ids
    in
    (* from now on these are top-level values, not locals *)
    List.iter (fun (id, _, _) -> Hashtbl.remove locals (Ident.unique_name id)) ids;
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

  let trace = Sys.getenv_opt "TRANSLATOR_TRACE" <> None

  let rec item ~(hand : hand list) (it : structure_item) =
    let _, line, _ = Location.get_pos_info it.str_loc.Location.loc_start in
    if trace then Printf.eprintf "item at line %d\n%!" line;
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
               else emit_value ~id (Ident.name id) vb_expr
           | Tstr_value (Asttypes.Nonrecursive, (_ :: _ :: _ as vbs)) ->
               List.iter
                 (fun vb ->
                   match vb.vb_pat.pat_desc with
                   | Tpat_var (id, _) ->
                       if is_function vb.vb_expr then emit_function (Ident.name id) id vb.vb_expr
                       else emit_value ~id (Ident.name id) vb.vb_expr
                   | _ when irrefutable vb.vb_pat -> emit_pattern vb
                   | _ -> unsupported vb.vb_loc "refutable top-level binding")
                 vbs
           | Tstr_type (_, decls) -> emit_types decls
           | Tstr_exception te -> emit_exception te.tyexn_constructor
           | Tstr_module { mb_expr = { mod_desc = Tmod_structure str; _ }; _ } ->
               (* a module's members are flattened into the package *)
               List.iter (fun it -> item ~hand it) str.str_items
           | Tstr_value (Asttypes.Nonrecursive, [ vb ]) when irrefutable vb.vb_pat -> emit_pattern vb
           | Tstr_value (Asttypes.Recursive, vbs) ->
               (* name and register every function first: they may call
                  each other (and themselves, through local identifiers) *)
               let named =
                 List.map
                   (fun vb ->
                     match vb.vb_pat.pat_desc with
                     | Tpat_var (id, _) ->
                         let param_tys, body = function_signature vb.vb_expr in
                         let want = M.Fun (List.map mty_of param_tys, mty_of body.exp_type, true) in
                         let mname = fresh_top (Ident.name id) in
                         Hashtbl.replace local_names mname ();
                         Hashtbl.replace own_by_name (Ident.name id) (mname, Function want);
                         Hashtbl.replace locals (Ident.unique_name id)
                           { name = mname; mty = want; loty = Some vb.vb_expr.exp_type };
                         (mname, id, vb)
                     | _ -> unsupported vb.vb_loc "recursive value")
                   vbs
               in
               List.iter (fun (mname, id, vb) -> emit_function ~mname (Ident.name id) id vb.vb_expr) named
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
