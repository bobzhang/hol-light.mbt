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

  (* the module path of the item being translated (`Meson.` ...) *)
  let module_prefix : string list ref = ref []

  (* registrations waiting until a `let ... and ...` is fully lowered *)
  let deferred : (unit -> unit) list option ref = ref None

  let register_own oname entry =
    let key = String.concat "" (List.rev_map (fun m -> m ^ ".") !module_prefix) ^ oname in
    let doit () = Hashtbl.replace own_by_name key entry in
    match !deferred with Some l -> deferred := Some (doit :: l) | None -> doit ()
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
  let generics_of ?(body = "==") text = bounded (tyvars_of_text text) body

  (* `let f p1 ... pn = body` -> `pub fn f(...) -> R raise { ... }` *)
  let emit_function ?mname oname id (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = match mname with Some m -> m | None -> fresh_top oname in
    let param_tys, body = function_signature e in
    let want = M.Fun (List.map mty_of param_tys, mty_of body.exp_type, true) in
    ignore id;
    scope_tyvars := tyvars_of_text (String.concat " " (List.map show_ty (body.exp_type :: param_tys)));
    Hashtbl.reset bound_tyvars;
    let _, lam, _ = lower ~expect:want e in
    scope_tyvars := [];
    (* registered after its body: a non-recursive redefinition refers to
       the previous binding *)
    register_own oname (mname, Function want);
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
        let tvs = tyvars_of_text (sig_params ^ " " ^ ret) in
        Hashtbl.replace fn_bounds mname (List.filter (Hashtbl.mem bound_tyvars) tvs, want);
        let text = Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(%s) -> %s raise %s\n" oname (generics_of ~body:body_text (sig_params ^ " " ^ ret)) mname sig_params ret body_text in
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
    register_own oname
      (mname, match mty with M.Fun _ -> Function mty | _ -> Accessor mty)

  (* `let x = e` -> a cell, an accessor (or wrapper) and a load step *)
  (* An expression OCaml generalizes (no effects, nothing allocated that
     identity could observe): a path, constant, or constructor of such. *)
  let rec syntactic_value (e : expression) =
    match e.exp_desc with
    | Texp_ident _ | Texp_constant _ -> true
    | Texp_construct (_, _, args) -> List.for_all syntactic_value args
    | Texp_tuple es -> List.for_all syntactic_value es
    | _ -> false

  (* A polymorphic value (`let empty = Empty`, `let choose = min_binding`):
     MoonBit globals are monomorphic, so it becomes a generic accessor, or
     for a function a generic wrapper (eta-expansion is safe: no effects). *)
  let emit_poly_value ?id oname mname (e : expression) =
    let mty = mty_of e.exp_type in
    Hashtbl.reset bound_tyvars;
    (* the statements only bind temporaries (the expression is pure) *)
    let stmts, x, _ = lower ~expect:mty e in
    let ty = show_ty e.exp_type in
    let body_text = string_of_exp (if stmts = [] then x else Blk (stmts, x)) in
    (* callers bound what this value's bounded generics become *)
    let tvs = tyvars_of_text ty in
    Hashtbl.replace fn_bounds mname (List.filter (Hashtbl.mem bound_tyvars) tvs, mty);
    Hashtbl.replace fn_bounds (mname ^ "()") (List.filter (Hashtbl.mem bound_tyvars) tvs, mty);
    (match arrow e.exp_type with
     | Some (a, b) ->
         let text =
           Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(x : %s) -> %s raise {\n  (%s)(x)\n}\n" oname
             (generics_of ~body:body_text ty) mname (show_ty a) (paren_fn (show_ty b)) body_text
         in
         add_decl (fun () -> text)
     | None ->
         let text =
           Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s() -> %s {\n  %s\n}\n" oname
             (generics_of ~body:body_text ty) mname ty body_text
         in
         add_decl (fun () -> text));
    let entry = (mname, match mty with M.Fun _ -> Function mty | _ -> Accessor mty) in
    register_own oname entry;
    match id with Some id -> Hashtbl.replace own_values (Ident.unique_name id) entry | None -> ()

  let emit_value ?id oname (e : expression) =
    Hashtbl.reset tyvar_names;
    let mname = fresh_top oname in
    if syntactic_value e && tyvars_of_text (show_ty e.exp_type) <> [] then emit_poly_value ?id oname mname e
    else
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
  (* MoonBit names of the types emitted so far (distinct local modules may
     declare types of the same name) *)
  let type_names : (string, unit) Hashtbl.t = Hashtbl.create 64

  (* emitted types whose values may hold closures (OCaml's equality,
     compare and hashing raise on them): they get no Eq/OCompare/OHash *)
  let fun_types : (string, unit) Hashtbl.t = Hashtbl.create 32

  let carries_fun text =
    String.contains text '>'
    || Hashtbl.fold (fun n () acc -> acc || (let ln = String.length n and lt = String.length text in
                                             let ident c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c = '_' in
                                             let rec at i = i + ln <= lt && ((String.sub text i ln = n && (i = 0 || not (ident text.[i - 1])) && (i + ln = lt || not (ident text.[i + ln]))) || at (i + 1)) in
                                             at 0)) fun_types false

  (* `pub impl[TA : T, ...] T for Name[TA, ...]` *)
  let impl_head trait name params =
    if params = [] then Printf.sprintf "pub impl %s for %s" trait name
    else
      Printf.sprintf "pub impl[%s] %s for %s[%s]" (String.concat ", " (List.map (fun p -> p ^ " : " ^ trait) params)) trait name
        (String.concat ", " params)

  let emit_types ?(prefix = "") (decls : type_declaration list) =
    let chosen = Hashtbl.create 4 in
    List.iter
      (fun d ->
        let base = camel ((if prefix = "" then "" else prefix ^ "_") ^ Ident.name d.typ_id) in
        let rec go i =
          let n = if i = 0 then base else base ^ string_of_int i in
          if Hashtbl.mem type_names n then go (i + 1) else n
        in
        let n = go 0 in
        Hashtbl.replace type_names n ();
        Hashtbl.replace chosen (Ident.unique_name d.typ_id) n)
      decls;
    let mname d = Hashtbl.find chosen (Ident.unique_name d.typ_id) in
    (* register every name first: the types may be mutually recursive *)
    List.iter
      (fun d ->
        Hashtbl.replace own_types_id (Ident.unique_name d.typ_id) (!current_pkg, mname d);
        if prefix = "" then begin
          (* a module's types are known by qualified names only (a bare `t`
             would capture every other `t`) *)
          if !module_prefix = [] then Hashtbl.replace own_types (Ident.name d.typ_id) (!current_pkg, mname d);
          (* in a module: also by every qualified form (`Term.term` inside
             `Metis_prover`, `Metis_prover.Term.term` outside) *)
          let rec suffixes = function [] -> [] | _ :: rest as l -> l :: suffixes rest in
          List.iter
            (fun mods -> Hashtbl.replace own_types (String.concat "." (mods @ [ Ident.name d.typ_id ])) (!current_pkg, mname d))
            (suffixes (List.rev !module_prefix))
        end
        else Hashtbl.replace own_types (prefix ^ "." ^ Ident.name d.typ_id) (!current_pkg, mname d))
      decls;
    List.iter
      (fun d ->
        Hashtbl.reset tyvar_names;
        let name = mname d in
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
            (* OCaml's equality raises on closures: such types derive nothing *)
            let has_fun = carries_fun (String.concat " " ctors) in
            if has_fun then Hashtbl.replace fun_types name ();
            add_decl (fun () ->
                Printf.sprintf "\n///|\n/// `%s`\npub(all) enum %s%s {\n  %s\n}%s\n"
                  (Ident.name d.typ_id) name gens (String.concat "\n  " ctors)
                  (if has_fun then "" else " derive(Eq, Debug)"));
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
            if not has_fun then
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
                    "\n///|\nfn%s ocaml_rank_%s(x : %s%s) -> Int {\n  match x {\n%s\n  }\n}\n\n///|\n%s with fn ocompare(self, other) {\n  match (self, other) {\n%s\n    _ => ocaml_rank_%s(self).compare(ocaml_rank_%s(other))\n  }\n}\n\n///|\n%s with fn ohash_visit(self, h) {\n  match self {\n%s\n  }\n}\n"
                    gens name name gens (String.concat "\n" rank_arms) (impl_head "@lib.OCompare" name params)
                    (String.concat "\n" cmp_arms) name name (impl_head "@lib.OHash" name params)
                    (String.concat "\n" hash_arms))
        | Ttype_record lds, _ ->
            let fields =
              List.map
                (fun ld ->
                  (Asttypes.(ld.ld_mutable = Mutable), field_name (Ident.name ld.ld_id), ld.ld_type.ctyp_type))
                lds
            in
            (* printed now: the type variable names are this declaration's *)
            let field_lines = List.map (fun (m, f, t) -> (if m then "mut " else "") ^ f ^ " : " ^ show_ty t) fields in
            let has_fun = carries_fun (String.concat " " field_lines) in
            if has_fun then Hashtbl.replace fun_types name ();
            let text =
              Printf.sprintf "\n///|\n/// `%s`\npub(all) struct %s%s {\n  %s\n}%s\n"
                (Ident.name d.typ_id) name gens (String.concat "\n  " field_lines)
                (if has_fun then "" else " derive(Eq, Debug)")
            in
            add_decl (fun () -> text);
            if not has_fun then
              (* a record is a block with tag 0 and its fields in order *)
              add_decl (fun () ->
                  let n = List.length fields in
                  let names = List.map (fun (_, f, _) -> f) fields in
                  let steps =
                    List.filteri (fun i _ -> i < n - 1) names
                    |> List.map (fun f -> Printf.sprintf "let c = @lib.compare(self.%s, other.%s)\n  if c != 0 {\n    return c\n  }" f f)
                  in
                  Printf.sprintf
                    "\n///|\n%s with fn ocompare(self, other) {\n  %s\n  @lib.compare(self.%s, other.%s)\n}\n\n///|\n%s with fn ohash_visit(self, h) {\n  h.block(0, %d)\n  %s\n}\n"
                    (impl_head "@lib.OCompare" name params) (String.concat "\n  " steps) (List.nth names (n - 1)) (List.nth names (n - 1))
                    (impl_head "@lib.OHash" name params) n
                    (String.concat "\n  " (List.map (fun f -> "h.field(self." ^ f ^ ")") names)))
        | Ttype_abstract, Some ct ->
            Hashtbl.replace own_aliases (Ident.unique_name d.typ_id) ();
            if prefix = "" then Hashtbl.replace own_aliases (Ident.name d.typ_id) ();
            if prefix <> "" then Hashtbl.replace own_aliases (prefix ^ "." ^ Ident.name d.typ_id) ();
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

  (* register the types, constructors and exceptions of an already
     translated file being loaded as a prefix *)
  let register_path : string list ref = ref []

  let rec register pkg (it : structure_item) =
    match it.str_desc with
    | Tstr_type (_, decls) ->
        List.iter
          (fun d ->
            (* the MoonBit name the package chose (translated_names.txt) *)
            let full = String.concat "." (List.rev !register_path @ [ Ident.name d.typ_id ]) in
            let mname =
              match Hashtbl.find_opt (Names.members pkg) ("type:" ^ full) with
              | Some m -> m
              | None -> camel (Ident.name d.typ_id)
            in
            if !register_path = [] then Hashtbl.replace own_types (Ident.name d.typ_id) (pkg, mname);
            let rec suffixes = function [] -> [] | _ :: rest as l -> l :: suffixes rest in
            List.iter
              (fun mods -> Hashtbl.replace own_types (String.concat "." (mods @ [ Ident.name d.typ_id ])) (pkg, mname))
              (suffixes (List.rev !register_path));
            match d.typ_kind with
            | Ttype_variant cds -> List.iter (fun cd -> Hashtbl.replace own_ctors (Ident.name cd.cd_id) pkg) cds
            | _ -> ())
          decls
    | Tstr_exception te -> Hashtbl.replace own_ctors (Ident.name te.tyexn_constructor.ext_id) pkg
    | Tstr_module { mb_id; mb_expr = { mod_desc = (Tmod_structure str | Tmod_constraint ({ mod_desc = Tmod_structure str; _ }, _, _, _)); _ }; _ } ->
        let saved = !register_path in
        register_path := (match mb_id with Some id -> Ident.name id | None -> "_") :: saved;
        Fun.protect ~finally:(fun () -> register_path := saved) (fun () -> List.iter (register pkg) str.str_items)
    | _ -> ()

  let () =
    emit_types_hook :=
      fun prefix decls ->
        (* emitted in the middle of a function: keep its type variable names *)
        let saved = Hashtbl.copy tyvar_names in
        Fun.protect
          ~finally:(fun () -> Hashtbl.reset tyvar_names; Hashtbl.iter (Hashtbl.replace tyvar_names) saved)
          (fun () -> emit_types ~prefix decls)

  let rec item ~(hand : hand list) (it : structure_item) =
    item_env := Some it.str_env;
    Hashtbl.reset bound_tyvars;
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
            register_own oname (mname, Function (mty_of ty)))
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
               (* every right-hand side sees the bindings before this phrase *)
               deferred := Some [];
               Fun.protect ~finally:(fun () ->
                   let l = match !deferred with Some l -> l | None -> [] in
                   deferred := None;
                   List.iter (fun f -> f ()) (List.rev l))
               @@ fun () ->
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
           | Tstr_include { incl_mod = { mod_desc = (Tmod_structure str | Tmod_constraint ({ mod_desc = Tmod_structure str; _ }, _, _, _)); _ }; _ } ->
               (* the members of an included structure are this module's *)
               List.iter (fun it -> item ~hand it) str.str_items
           | Tstr_include _ -> () (* e.g. `include List` in a module *)
           | Tstr_open _ | Tstr_modtype _ -> ()
           | Tstr_exception te -> emit_exception te.tyexn_constructor
           | Tstr_module { mb_id; mb_expr = { mod_desc = (Tmod_structure str | Tmod_constraint ({ mod_desc = Tmod_structure str; _ }, _, _, _)); _ }; _ } ->
               (* a module's members are flattened into the package *)
               let saved = !module_prefix in
               let name = match mb_id with Some id -> Ident.name id | None -> "_" in
               module_prefix := name :: saved;
               (match mb_id with
                | Some id -> Hashtbl.replace module_paths (Ident.unique_name id) (List.rev !module_prefix)
                | None -> ());
               Fun.protect ~finally:(fun () -> module_prefix := saved)
                 (fun () -> List.iter (fun it -> item ~hand it) str.str_items)
           | Tstr_module { mb_id = Some id; mb_expr = { mod_desc = Tmod_ident (p, _); _ }; _ } ->
               (* a module alias (e.g. a specialized functor's parameter) *)
               (match module_path p with
                | Some path -> Hashtbl.replace module_paths (Ident.unique_name id) path
                | None -> ())
           | Tstr_module { mb_expr = { mod_desc = (Tmod_functor _ | Tmod_constraint ({ mod_desc = Tmod_functor _; _ }, _, _, _)); _ }; _ } ->
               (* applications are specialized (Functors) *)
               ()
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
                         register_own (Ident.name id) (mname, Function want);
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
      "// Generated by tools/translator from %s; do not edit.\n// Regenerate with tools/ocaml_ref/translate.sh translate %s.\n%s%s"
      source source (String.concat "" (List.rev_map (fun f -> f ()) !decls))
      (* a file of definitions only has nothing to load *)
      (if Buffer.length steps = 0 then ""
       else Printf.sprintf "\n///|\nfn load_steps() -> Unit raise {%s\n}\n" (Buffer.contents steps));
    close_out oc;
    (* module members' MoonBit names, for packages translated later
       (`A.f` and `B.f` cannot both be `f`) *)
    let members = Hashtbl.fold (fun k (m, _) acc -> if String.contains k '.' then (k, m) :: acc else acc) own_by_name [] in
    (* the names chosen for this package's types (`T1` for a second `t`) *)
    let members =
      Hashtbl.fold (fun k (pkg, m) acc -> if pkg = !current_pkg then ("type:" ^ k, m) :: acc else acc) own_types members
    in
    let oc = open_out (Filename.concat (Filename.dirname out) "translated_names.txt") in
    output_string oc "# Generated by tools/translator: qualified upstream name -> MoonBit name.\n";
    List.iter (fun (k, m) -> Printf.fprintf oc "%s %s\n" k m) (List.sort compare members);
    close_out oc
end
