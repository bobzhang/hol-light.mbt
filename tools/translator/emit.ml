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

  (* The cell of a top-level value: `<name>_c`, unless that is a name of
     the file too (Autoformalization/carleson.ml proves CW_TAIL_LIM and
     CW_TAIL_LIM_C). *)
  let cell_names : (string, string) Hashtbl.t = Hashtbl.create 64
  let file_names : (string, unit) Hashtbl.t Lazy.t =
    lazy (let t = Hashtbl.create 64 in
          Hashtbl.iter (fun n _ -> Hashtbl.replace t (sanitize n) ()) remaining_defs;
          t)

  let cell_of mname =
    match Hashtbl.find_opt cell_names mname with
    | Some c -> c
    | None ->
        let rec go n =
          if Hashtbl.mem used_names n || Hashtbl.mem (Lazy.force file_names) n then go (n ^ "_")
          else (Hashtbl.add used_names n (); n)
        in
        let c = go (mname ^ "_c") in
        Hashtbl.replace cell_names mname c;
        c

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
        let names = lam_params names in
        let sig_params =
          String.concat ", "
            (List.map2 (fun n t -> if String.contains n ':' then n else n ^ " : " ^ show_ty t) names param_tys)
        in
        let ret = show_ty body.exp_type in
        let ret = if String.length ret > 0 && ret.[0] = '(' then "(" ^ ret ^ ")" else ret in
        let body_text = Ir.to_string (fun () -> Ir.pblock (stmts, result)) in
        let tvs = tyvars_of_text (sig_params ^ " " ^ ret) in
        Hashtbl.replace fn_bounds mname (List.filter (Hashtbl.mem bound_tyvars) tvs, want);
        (* the bounds of a recursive group's function may still grow (see
           group_bounds): the generics are printed at output time *)
        let bset = Hashtbl.copy bound_tyvars in
        Hashtbl.replace fn_bound_sets mname (bset, tvs, want);
        add_decl (fun () ->
            let gens = bounded_in bset tvs in
            Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(%s) -> %s raise %s\n" oname gens mname sig_params ret body_text)
    | _ -> failwith "emit_function: not a lambda"

  let paren_fn t = if String.length t > 0 && t.[0] = '(' then "(" ^ t ^ ")" else t

  (* The declarations for a value cell `mname` of OCaml type `oty`: an
     accessor, or for a function a wrapper taking its first argument. *)
  (* The type of a definition as installed by the toplevel (later phrases
     may resolve its weak type variables): filled in after the phrase runs. *)
  let pending_installs : (string * Types.type_expr option ref) list ref = ref []

  (* the translator's own type of each such definition (Lower.link_weak) *)
  let pending_own : (string, Types.type_expr) Hashtbl.t = Hashtbl.create 16

  let () =
    Prov.on_record :=
      fun name vd ->
        match List.assoc_opt name !pending_installs with
        | Some slot ->
            slot := Some vd.Types.val_type;
            pending_installs := List.remove_assoc name !pending_installs;
            (match Hashtbl.find_opt pending_own name with
             | Some own -> Hashtbl.remove pending_own name; link_weak own vd.Types.val_type
             | None -> ())
        | None -> ()

  let install_slot oname own =
    (* keyed by the qualified name: modules may define the same name *)
    let key = String.concat "" (List.rev_map (fun m -> m ^ ".") !module_prefix) ^ oname in
    let slot = ref None in
    pending_installs := (key, slot) :: List.remove_assoc key !pending_installs;
    Hashtbl.replace pending_own key own;
    slot

  let installed_type slot (oty : Types.type_expr) =
    match !slot with Some t -> t | None -> oty

  let cell_decls oname mname (oty0 : Types.type_expr) =
    let mty = mty_of oty0 in
    let slot = install_slot oname oty0 in
    (match mty with
     | M.Fun _ ->
         add_decl (fun () ->
             Hashtbl.reset tyvar_names;
             let oty = installed_type slot oty0 in
             let ty = show_ty oty in
             match arrow oty with
             | Some (a, b) ->
                 Printf.sprintf
                   "\n///|\nlet %s : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn%s %s(x : %s) -> %s raise {\n  (%s.get())(x)\n}\n"
                   (cell_of mname) ty (string_lit oname) oname (generics_of (show_ty a ^ " " ^ show_ty b)) mname (show_ty a) (paren_fn (show_ty b)) (cell_of mname)
             | None -> failwith "cell_decls")
     | _ ->
         add_decl (fun () ->
             Hashtbl.reset tyvar_names;
             let oty = installed_type slot oty0 in
             let ty = show_ty oty in
             Printf.sprintf
               "\n///|\nlet %s : @lib.Cell[%s] = @lib.Cell::new(%s)\n\n///|\n/// `%s`\npub fn%s %s() -> %s {\n  %s.get()\n}\n"
               (cell_of mname) ty (string_lit oname) oname (generics_of ty) mname ty (cell_of mname)));
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

  (* An expression that can be evaluated again without changing the
     program: a syntactic value, a function, or `let`s of such (OCaml's
     non-expansiveness is weaker: `(incr c; fun x -> x)` qualifies). *)
  let rec pure_value (e : expression) =
    match e.exp_desc with
    | Texp_ident _ | Texp_constant _ | Texp_function _ -> true
    | Texp_construct (_, _, args) -> List.for_all pure_value args
    | Texp_tuple es -> List.for_all pure_value es
    | Texp_let (_, vbs, body) -> List.for_all (fun vb -> pure_value vb.vb_expr) vbs && pure_value body
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
         (* typed: a lambda's inner closures may not raise *)
         let text =
           Printf.sprintf "\n///|\n/// `%s`\npub fn%s %s(x : %s) -> %s raise {\n  let f : %s = %s\n  f(x)\n}\n" oname
             (generics_of ~body:body_text ty) mname (show_ty a) (paren_fn (show_ty b)) ty body_text
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
    if pure_value e && tyvars_of_text (show_ty e.exp_type) <> [] then
      emit_poly_value ?id oname mname e
    else begin
    (* not a syntactic value: computed once, so its generalized (covariant)
       type variables take one instance (Lower.frozen_vars) *)
    if tyvars_of_text (show_ty e.exp_type) <> [] then freeze_vars e.exp_type;
    let mty = mty_of e.exp_type in
    let stmts, x, _ = lower ~expect:mty e in
    add_step oname (stmts @ [ Do (Call (Atom (cell_of mname ^ ".set"), [ x ])) ]);
    cell_decls oname mname e.exp_type;
    match id with
    | Some id ->
        Hashtbl.replace own_values (Ident.unique_name id)
          (mname, match mty with M.Fun _ -> Function mty | _ -> Accessor mty)
    | None -> ()
    end

  let camel s =
    String.concat "" (List.map String.capitalize_ascii (String.split_on_char '_' s))

  (* `type t = C1 of a * b | ...` -> an enum; `type t = u` -> an alias *)
  (* MoonBit names of the types emitted so far (distinct local modules may
     declare types of the same name) *)
  let type_names : (string, unit) Hashtbl.t = Hashtbl.create 64

  (* emitted types whose values may hold closures (OCaml's equality,
     compare and hashing raise on them): they get no Eq/OCompare/OHash *)
  let fun_types : (string, unit) Hashtbl.t = Hashtbl.create 32

  let mentions_any table text =
    Hashtbl.fold (fun n () acc -> acc || (let ln = String.length n and lt = String.length text in
                                          let ident c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c = '_' in
                                          let rec at i = i + ln <= lt && ((String.sub text i ln = n && (i = 0 || not (ident text.[i - 1])) && (i + ln = lt || not (ident text.[i + ln]))) || at (i + 1)) in
                                          at 0)) table false

  let carries_fun text = String.contains text '>' || mentions_any fun_types text

  (* types holding a `Ref` (MoonBit's Ref has no Eq): no derive *)
  let noeq_types : (string, unit) Hashtbl.t = Hashtbl.create 32

  let has_ref text =
    let rec at i = i + 4 <= String.length text && (String.sub text i 4 = "Ref[" || at (i + 1)) in
    at 0 || mentions_any noeq_types text

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
    (* which of a (recursive) group's types hold closures or refs, decided
       for the whole group first *)
    let arg_types d =
      Hashtbl.reset tyvar_names;
      match d.typ_kind, d.typ_manifest with
      | Ttype_variant cds, _ ->
          String.concat " " (List.concat_map (fun cd -> match cd.cd_args with Cstr_tuple cts -> List.map (fun ct -> show_ty ct.ctyp_type) cts | _ -> []) cds)
      | Ttype_record lds, _ -> String.concat " " (List.map (fun ld -> show_ty ld.ld_type.ctyp_type) lds)
      | Ttype_abstract, Some ct -> show_ty ct.ctyp_type
      | _ -> ""
    in
    let texts = List.map (fun d -> (mname d, arg_types d)) decls in
    let changed = ref true in
    while !changed do
      changed := false;
      List.iter
        (fun (n, t) ->
          if not (Hashtbl.mem fun_types n) && carries_fun t then (Hashtbl.replace fun_types n (); changed := true);
          if not (Hashtbl.mem noeq_types n) && has_ref t then (Hashtbl.replace noeq_types n (); changed := true))
        texts
    done;
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
            (* the argument types only (a constructor may be spelled like a type) *)
            let arg_text =
              String.concat " "
                (List.concat_map (fun cd -> match cd.cd_args with Cstr_tuple cts -> List.map (fun ct -> show_ty ct.ctyp_type) cts | _ -> []) cds)
            in
            let has_fun = carries_fun arg_text in
            if has_fun then Hashtbl.replace fun_types name ();
            let noeq = has_ref arg_text in
            if noeq then Hashtbl.replace noeq_types name ();
            add_decl (fun () ->
                Printf.sprintf "\n///|\n/// `%s`\npub(all) enum %s%s {\n  %s\n}%s\n"
                  (Ident.name d.typ_id) name gens (String.concat "\n  " ctors)
                  (if has_fun || noeq then "" else " derive(Eq, Debug)"));
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
            let types_text = String.concat " " (List.map (fun (_, _, t) -> show_ty t) fields) in
            let has_fun = carries_fun types_text in
            if has_fun then Hashtbl.replace fun_types name ();
            let noeq = has_ref types_text in
            if noeq then Hashtbl.replace noeq_types name ();
            let text =
              Printf.sprintf "\n///|\n/// `%s`\npub(all) struct %s%s {\n  %s\n}%s\n"
                (Ident.name d.typ_id) name gens (String.concat "\n  " field_lines)
                (if has_fun || noeq then "" else " derive(Eq, Debug)")
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
            (* also by MoonBit name: qualified references (`Literal.literal`) *)
            Hashtbl.replace own_aliases ("=" ^ name) ();
            if prefix = "" && !module_prefix = [] then Hashtbl.replace own_aliases (Ident.name d.typ_id) ();
            if prefix <> "" then Hashtbl.replace own_aliases (prefix ^ "." ^ Ident.name d.typ_id) ();
            let t = show_ty ct.ctyp_type in
            if carries_fun t then Hashtbl.replace fun_types name ();
            if has_ref t then Hashtbl.replace noeq_types name ();
            add_decl (fun () -> Printf.sprintf "\n///|\n/// `%s`\npub type %s%s = %s\n" (Ident.name d.typ_id) name gens t)
        | _ -> unsupported d.typ_loc "type declaration")
      decls

  (* `exception E` / `exception E of t` -> a suberror *)
  let emit_exception (ext : extension_constructor) =
    let oname = Ident.name ext.ext_id in
    Hashtbl.replace own_ctors oname !current_pkg;
    (* a distinct suberror per exception (`Substlist.Unify` and
       `Substarray.Unify` are different exceptions) *)
    let rec go i = let n = if i = 0 then oname else oname ^ string_of_int i in if Hashtbl.mem type_names n then go (i + 1) else n in
    let sname = go 0 in
    Hashtbl.replace type_names sname ();
    Hashtbl.replace own_exns ("#" ^ Ident.unique_name ext.ext_id) (!current_pkg, sname);
    Hashtbl.replace own_exns (String.concat "" (List.rev_map (fun m -> m ^ ".") !module_prefix) ^ oname) (!current_pkg, sname);
    match ext.ext_kind with
    | Text_decl (_, Cstr_tuple [], _) ->
        add_decl (fun () ->
            Printf.sprintf "\n///|\n/// `exception %s`\npub(all) suberror %s {\n  %s\n}\n" oname sname oname)
    | Text_decl (_, Cstr_tuple cts, _) ->
        let args = String.concat ", " (List.map (fun ct -> show_ty ct.ctyp_type) cts) in
        add_decl (fun () ->
            Printf.sprintf "\n///|\n/// `exception %s`\npub(all) suberror %s {\n  %s(%s)\n}\n" oname sname oname args)
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
          Do (Call (Atom (cell_of mname ^ ".set"), [ v ])))
        ids
    in
    (* from now on these are top-level values, not locals *)
    List.iter (fun (id, _, _) -> Hashtbl.remove locals (Ident.unique_name id)) ids;
    let bind =
      if irrefutable vb.vb_pat then [ Let (pat, x) ] @ sets
      else
        (* `let [a; b] = e`: Match_failure unless the pattern matches *)
        let file, line, col = Location.get_pos_info vb.vb_pat.pat_loc.Location.loc_start in
        let fail = Raise (Call (Atom "@lib.MatchFailure", [ Atom (string_lit (Printf.sprintf "%s:%d:%d" (Filename.basename file) line col)) ])) in
        [ Do (Match (x, [ (pat, (sets, Atom "()")); ("_", ([], fail)) ])) ]
    in
    add_step (String.concat ", " (List.map (fun (id, _, _) -> Ident.name id) ids)) (stmts @ bind)

  let emit_eval (e : expression) =
    match e.exp_desc with
    (* `needs "f"` of a file loaded part-way through: loaded here *)
    | Texp_apply ({ exp_desc = Texp_ident (p, _, _); _ }, [ (_, Some { exp_desc = Texp_constant (Asttypes.Const_string (f, _, _)); _ }) ])
      when (Path.name p = "needs" || Path.name p = "loadt") && Hashtbl.mem mid_needs f ->
        (match Names.package_of_file f with
         | Some pkg -> add_step ("needs " ^ f) [ Do (Call (Atom ("@" ^ pkg_alias pkg ^ ".load"), [])) ]
         | None -> failwith ("no package for " ^ f))
    (* `needs "f"` / `loadt "f"`: a dependency, loaded before (load()) *)
    | Texp_apply ({ exp_desc = Texp_ident (p, _, _); _ }, [ (_, Some { exp_desc = Texp_constant (Asttypes.Const_string _); _ }) ])
      when Path.name p = "needs" || Path.name p = "loadt" -> ()
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
            Hashtbl.remove own_aliases full;
            match d.typ_kind with
            | Ttype_variant cds -> List.iter (fun cd -> Hashtbl.replace own_ctors (Ident.name cd.cd_id) pkg) cds
            | Ttype_abstract when d.typ_manifest <> None ->
                (* an abbreviation is the type it stands for (a `goalthm`
                   of Jordan/tactics_ext.ml is applied in
                   Jordan/metric_spaces.ml) *)
                (* by name, as own_types: the installed type's identifier
                   is not the typed phrase's *)
                Hashtbl.replace own_aliases full ()
            | _ -> ())
          decls
    | Tstr_exception te ->
        let n = Ident.name te.tyexn_constructor.ext_id in
        Hashtbl.replace own_ctors n pkg;
        let full = String.concat "." (List.rev !register_path @ [ n ]) in
        let m = match Hashtbl.find_opt (Names.members pkg) ("exn:" ^ full) with Some m -> m | None -> n in
        let rec suffixes = function [] -> [] | _ :: rest as l -> l :: suffixes rest in
        List.iter
          (fun mods -> Hashtbl.replace own_exns (String.concat "." (mods @ [ n ])) (pkg, m))
          (suffixes (List.rev !register_path))
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
                   | _ -> emit_pattern vb)
                 vbs
           | Tstr_type (_, decls) -> emit_types decls
           | Tstr_include { incl_mod = { mod_desc = (Tmod_structure str | Tmod_constraint ({ mod_desc = Tmod_structure str; _ }, _, _, _)); _ }; incl_type; _ } ->
               (* the members of an included structure are this module's *)
               List.iter (fun it -> item ~hand it) str.str_items;
               (* later items refer to them through the include's own
                  (fresh) identifiers *)
               let qual n = String.concat "" (List.rev_map (fun m -> m ^ ".") !module_prefix) ^ n in
               List.iter
                 (function
                   | Types.Sig_value (id, _, _) ->
                       (match Hashtbl.find_opt own_by_name (qual (Ident.name id)) with
                        | Some entry -> Hashtbl.replace own_values (Ident.unique_name id) entry
                        | None -> ())
                   | Types.Sig_type (id, _, _, _) ->
                       (match Hashtbl.find_opt own_types (qual (Ident.name id)) with
                        | Some t -> Hashtbl.replace own_types_id (Ident.unique_name id) t
                        | None -> ())
                   | Types.Sig_module (id, _, _, _, _) ->
                       Hashtbl.replace module_paths (Ident.unique_name id) (List.rev !module_prefix @ [ Ident.name id ])
                   | Types.Sig_typext (id, _, _, _) ->
                       (match Hashtbl.find_opt own_exns (qual (Ident.name id)) with
                        | Some e -> Hashtbl.replace own_exns ("#" ^ Ident.unique_name id) e
                        | None -> ())
                   | _ -> ())
                 incl_type
           | Tstr_include { incl_mod = { mod_desc = (Tmod_ident (p, _) | Tmod_constraint ({ mod_desc = Tmod_ident (p, _); _ }, _, _, _)); _ }; incl_type; _ } ->
               (* `include M` of a translated module re-exports its members
                  (e.g. `include Sub` in a specialized functor) *)
               let here n = String.concat "" (List.rev_map (fun m -> m ^ ".") !module_prefix) ^ n in
               (* a member another file defines keeps that file's
                  declaration; it is re-exported under this module *)
               let foreign_member p id =
                 match Prov.lookup (Path.Pdot (p, Ident.name id)) with
                 | Some (file, qname) when file <> !current_file ->
                     Hashtbl.replace Prov.table (Ident.unique_name id) (file, qname);
                     Hashtbl.replace reexports (here (Ident.name id)) (file, qname)
                 | _ -> ()
               in
               (match module_path p with
                | None ->
                    (* a module another file translated (`include Pa` in
                       Functionspaces/utils.ml, over Library/q.ml's Pa):
                       its members keep that file's declarations *)
                    List.iter (function Types.Sig_value (id, _, _) -> foreign_member p id | _ -> ()) incl_type
                | Some src ->
                    let skey n = String.concat "." (src @ [ n ]) in
                    List.iter
                      (function
                        | Types.Sig_value (id, _, _) ->
                            (match Hashtbl.find_opt own_by_name (skey (Ident.name id)) with
                             | Some entry ->
                                 Hashtbl.replace own_values (Ident.unique_name id) entry;
                                 Hashtbl.replace own_by_name (here (Ident.name id)) entry
                             | None -> foreign_member p id)
                        | Types.Sig_type (id, _, _, _) ->
                            (match Hashtbl.find_opt own_types (skey (Ident.name id)) with
                             | Some t ->
                                 Hashtbl.replace own_types_id (Ident.unique_name id) t;
                                 Hashtbl.replace own_types (String.concat "." (List.rev !module_prefix @ [ Ident.name id ])) t
                             | None -> ())
                        | Types.Sig_typext (id, _, _, _) ->
                            (match Hashtbl.find_opt own_exns (skey (Ident.name id)) with
                             | Some e ->
                                 Hashtbl.replace own_exns ("#" ^ Ident.unique_name id) e;
                                 Hashtbl.replace own_exns (here (Ident.name id)) e
                             | None -> ())
                        | Types.Sig_module (id, _, _, _, _) ->
                            Hashtbl.replace module_paths (Ident.unique_name id) (src @ [ Ident.name id ]);
                            set_alias (String.concat "." (List.rev !module_prefix @ [ Ident.name id ])) (src @ [ Ident.name id ])
                        | _ -> ())
                      incl_type)
           | Tstr_include _ -> () (* e.g. `include List` in a module *)
           | Tstr_open _ | Tstr_modtype _ -> ()
           | Tstr_exception te -> emit_exception te.tyexn_constructor
           | Tstr_module { mb_id; mb_expr = { mod_desc = (Tmod_structure str | Tmod_constraint ({ mod_desc = Tmod_structure str; _ }, _, _, _)); _ }; _ } ->
               (* a module's members are flattened into the package *)
               let saved = !module_prefix in
               let name = match mb_id with Some id -> Ident.name id | None -> "_" in
               module_prefix := name :: saved;
               (* a new module of this name: aliases under the old one go,
                  once its body (which may still refer to them) is done *)
               let full = String.concat "." (List.rev !module_prefix) in
               let stale = Hashtbl.fold (fun k _ acc -> if k = full || (String.length k > String.length full && String.sub k 0 (String.length full + 1) = full ^ ".") then (k, Hashtbl.find_opt alias_gen k) :: acc else acc) module_aliases [] in
               (match mb_id with
                | Some id -> Hashtbl.replace module_paths (Ident.unique_name id) (List.rev !module_prefix)
                | None -> ());
               Fun.protect
                 ~finally:(fun () ->
                   module_prefix := saved;
                   (* stale entries the new body did not redefine *)
                   List.iter (fun (k, g) -> if Hashtbl.find_opt alias_gen k = g then Hashtbl.remove module_aliases k) stale)
                 (fun () -> List.iter (fun it -> item ~hand it) str.str_items)
           | Tstr_module { mb_id = Some id; mb_expr = { mod_desc = Tmod_ident (p, _); _ }; _ } ->
               (* a module alias (e.g. a specialized functor's parameter) *)
               let full = String.concat "." (List.rev !module_prefix @ [ Ident.name id ]) in
               let stale = Hashtbl.fold (fun k _ acc -> if k = full || (String.length k > String.length full && String.sub k 0 (String.length full + 1) = full ^ ".") then k :: acc else acc) module_aliases [] in
               List.iter (Hashtbl.remove module_aliases) stale;
               (match module_path p with
                | Some path ->
                    Hashtbl.replace module_paths (Ident.unique_name id) path;
                    (* also reached through dotted paths (`W.B`) *)
                    set_alias (String.concat "." (List.rev !module_prefix @ [ Ident.name id ])) path
                | None -> ())
           | Tstr_module { mb_expr = { mod_desc = (Tmod_functor _ | Tmod_constraint ({ mod_desc = Tmod_functor _; _ }, _, _, _)); _ }; _ } ->
               (* applications are specialized (Functors) *)
               ()
           | Tstr_value (Asttypes.Nonrecursive, [ vb ]) -> emit_pattern vb
           | Tstr_value (Asttypes.Recursive, [ vb ]) when not (is_function vb.vb_expr) ->
               let rec fn_after_lets e =
                 match e.exp_desc with
                 | Texp_function _ -> true
                 | Texp_let (_, _, b) -> fn_after_lets b
                 | _ -> false
               in
               (match vb.vb_pat.pat_desc with
                | Tpat_var (id, name) when fn_after_lets vb.vb_expr ->
                    (* `let rec f = let c = e in fun x -> ... f ...`: the
                       value of the expression `let rec f' = ... in f'`
                       (Rqe/simplify.ml's SIMPLIFY_CONV). The inner function
                       has its own identifier: the definition and it would
                       get the same local name. *)
                    let e = vb.vb_expr in
                    let id' = Ident.create_local (Ident.name id ^ "_rec") in
                    let mapper =
                      { Tast_mapper.default with
                        expr =
                          (fun sub x ->
                            match x.exp_desc with
                            | Texp_ident (Path.Pident i, lid, vd) when Ident.same i id ->
                                { x with exp_desc = Texp_ident (Path.Pident id', lid, vd) }
                            | _ -> Tast_mapper.default.expr sub x) }
                    in
                    let inner =
                      { vb with vb_pat = { vb.vb_pat with pat_desc = Tpat_var (id', name) }; vb_expr = mapper.expr mapper e }
                    in
                    let vd =
                      { Types.val_type = e.exp_type; val_kind = Types.Val_reg; val_loc = e.exp_loc;
                        val_attributes = []; val_uid = Types.Uid.internal_not_actually_unique }
                    in
                    let self =
                      { e with exp_desc = Texp_ident (Path.Pident id', { name with Location.txt = Longident.Lident (Ident.name id') }, vd) }
                    in
                    (* as a definition of one name: polymorphic when the
                       prefix is of functions only (Functionspaces/utils.ml's
                       simp_horn_conv), a generic wrapper then *)
                    emit_value ~id (Ident.name id) { e with exp_desc = Texp_let (Asttypes.Recursive, [ inner ], self) }
                | _ ->
                    (* `let rec x = e` with `e` not a function cannot
                       mention `x`: an ordinary definition (Model/syntax.ml's
                       `let rec sizeof = define ...`) *)
                    emit_pattern vb)
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
                         Hashtbl.replace toplevel_group_ids (Ident.unique_name id) ();
                         (mname, id, vb)
                     | _ -> unsupported vb.vb_loc "recursive value")
                   vbs
               in
               group_members := List.map (fun (m, _, _) -> m) named;
               pending_calls := [];
               List.iter
                 (fun (mname, id, vb) -> current_fn := mname; emit_function ~mname (Ident.name id) id vb.vb_expr)
                 named;
               current_fn := "";
               group_members := [];
               (* a caller bounds what it instantiates a callee's bounded
                  generics with, until nothing changes *)
               let changed = ref true in
               while !changed do
                 changed := false;
                 List.iter
                   (fun (caller, callee, inst) ->
                     match Hashtbl.find_opt fn_bound_sets caller, Hashtbl.find_opt fn_bound_sets callee with
                     | Some (cset, _, _), Some (eset, _, decl) ->
                         let pairs = inst_pairs decl inst [] in
                         List.iter
                           (fun (v, t) ->
                             if Hashtbl.mem eset v then
                               List.iter
                                 (fun w -> if not (Hashtbl.mem cset w) then (Hashtbl.replace cset w (); changed := true))
                                 (mty_tyvars t []))
                           pairs
                     | _ -> ())
                   !pending_calls
               done;
               List.iter
                 (fun (m, _, _) ->
                   match Hashtbl.find_opt fn_bound_sets m with
                   | Some (set, tvs, want) -> Hashtbl.replace fn_bounds m (List.filter (Hashtbl.mem set) tvs, want)
                   | None -> ())
                 named;
               pending_calls := []
           | Tstr_eval (e, _) -> emit_eval e
           | _ -> unsupported it.str_loc "structure item"
         with Unsupported (msg, loc) ->
           incr errors;
           let file, l, c = Location.get_pos_info loc.Location.loc_start in
           Printf.printf "%s:%d:%d: unsupported: %s\n%!" (Filename.basename file) l c msg;
           add_step (Printf.sprintf "UNSUPPORTED at line %d: %s" line msg) []);
        flush_lifted ()

  (* The placeholders of weak type variables (Lower.weak_name) become their
     types as resolved by now. One that nothing resolved has no value whose
     type matters: Unit. *)
  let resolve_weak text =
    let replace_all text name by =
      let n = String.length name and b = Buffer.create (String.length text) in
      let i = ref 0 in
      while !i < String.length text do
        if !i + n <= String.length text && String.sub text !i n = name then (Buffer.add_string b by; i := !i + n)
        else (Buffer.add_char b text.[!i]; incr i)
      done;
      Buffer.contents b
    in
    let contains text name =
      let n = String.length name in
      let rec at i = i + n <= String.length text && (String.sub text i n = name || at (i + 1)) in
      at 0
    in
    let rec go text rounds =
      let present = Hashtbl.fold (fun name ty acc -> if contains text name then (name, ty) :: acc else acc) weak_vars [] in
      if present = [] || rounds = 0 then text
      else
        go
          (List.fold_left
             (fun text (name, ty) ->
               let by = match weak_resolved ty with Some t -> show_ty t | None -> "Unit" in
               replace_all text name by)
             text present)
          (rounds - 1)
    in
    go text 8

  let output ~source ~out =
    let oc = open_out out in
    output_string oc
      (resolve_weak
         (Printf.sprintf
            "// Generated by tools/translator from %s; do not edit.\n// Regenerate with tools/ocaml_ref/translate.sh translate %s.\n%s%s"
            source source (String.concat "" (List.rev_map (fun f -> f ()) !decls))
            (* a file of definitions only has nothing to load; a package
               set up by theory.py calls load_steps all the same
               (Rqe/rqe_lib.ml) *)
            (if Buffer.length steps = 0 then
               (if Sys.file_exists (Filename.concat (Filename.dirname out) "init.mbt")
                then "\n///|\nfn load_steps() -> Unit raise {\n  ()\n}\n"
                else "")
             else Printf.sprintf "\n///|\nfn load_steps() -> Unit raise {%s\n}\n" (Buffer.contents steps))));
    close_out oc;
    (* module members' MoonBit names, for packages translated later
       (`A.f` and `B.f` cannot both be `f`) *)
    (* every top-level and module member name: dependent packages resolve
       exactly (`EXP` is `exp` although OCaml's Stdlib has an `exp`) *)
    let members = Hashtbl.fold (fun k (m, _) acc -> (k, m) :: acc) own_by_name [] in
    (* the names chosen for this package's types (`T1` for a second `t`) *)
    let members =
      Hashtbl.fold (fun k (pkg, m) acc -> if pkg = !current_pkg then ("type:" ^ k, m) :: acc else acc) own_types members
    in
    let members =
      Hashtbl.fold
        (fun k (pkg, m) acc -> if pkg = !current_pkg && k <> "" && k.[0] <> '#' then ("exn:" ^ k, m) :: acc else acc)
        own_exns members
    in
    let oc = open_out (Filename.concat (Filename.dirname out) "translated_names.txt") in
    output_string oc "# Generated by tools/translator: qualified upstream name -> MoonBit name.\n";
    List.iter (fun (k, m) -> Printf.fprintf oc "%s %s\n" k m) (List.sort compare members);
    (* re-exported members of another file's module (Names.resolve) *)
    Hashtbl.iter (fun k (file, name) -> Printf.fprintf oc "%s =%s:%s\n" k file name) reexports;
    Hashtbl.reset reexports;
    close_out oc
end
