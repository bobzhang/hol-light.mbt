(* Lowering of typed OCaml (HOL Light scripts) to the MoonBit IR.

   Evaluation order: OCaml 4.14 evaluates application arguments right to
   left and then the function; tuples, constructor arguments and list
   literals right to left; `let ... and ...` left to right. Every lowered
   expression is a list of statements plus a final expression; when two
   sibling computations are both ordered (may have an effect), all but the
   last one in OCaml order are bound to temporaries first.

   Function values: every MoonBit value has a MoonBit type (`Mbti.ty`);
   function types give its parameter groups. Values are adapted to the
   expected MoonBit type at each use. OCaml curried parameters are aligned
   with MoonBit groups: a group of k > 1 parameters takes either k curried
   OCaml arguments or one k-tuple argument (decided from the declared OCaml
   type, never an instantiated one). *)
module Lower = struct
  open Typedtree
  module M = Mbti
  open Ir

  (* A constructor of a predefined exception (Failure, Not_found, ...), not
     a user exception of the same name *)
  let predef_exn (cd : Types.constructor_description) =
    match cd.cstr_tag with
    | Cstr_extension (Path.Pident id, _) -> Ident.is_predef id
    | Cstr_extension (Path.Pdot (Path.Pident m, _), _) -> Ident.name m = "Stdlib" && Ident.global m
    | _ -> false

  (* An OCaml int (Int64) from a MoonBit Int, and back (checked); a literal
     is converted in place *)
  let widen e =
    match e with
    | Atom a when a <> "" && (match a.[0] with '0' .. '9' -> true | _ -> false) && String.for_all (function '0' .. '9' -> true | _ -> false) a -> Atom (a ^ "L")
    | _ -> Call (Atom "Int::to_int64", [ e ])

  let narrow e =
    let lit a = String.length a > 1 && a.[String.length a - 1] = 'L' && String.for_all (function '0' .. '9' -> true | _ -> false) (String.sub a 0 (String.length a - 1)) in
    match e with
    | Atom a when lit a && String.length a <= 10 -> Atom (String.sub a 0 (String.length a - 1))
    | _ -> Call (Atom "@lib.int63_to_int", [ e ])

  (* MoonBit rejects a bare `match`/`if`/block expression as a pattern guard *)
  let guard_str g =
    match g with
    | If _ | Match _ | Blk _ | Try _ -> " if (" ^ string_of_exp g ^ ")"
    | _ -> " if " ^ string_of_exp g

  exception Unsupported of string * Location.t

  let unsupported loc fmt = Printf.ksprintf (fun s -> raise (Unsupported (s, loc))) fmt

  (* ---------------------------------------------------------------- *)
  (* Types                                                              *)
  (* ---------------------------------------------------------------- *)

  (* the typing environment of the item being translated (inside a module
     it includes the module's earlier items) *)
  let item_env : Env.t option ref = ref None

  (* the environment of the expression being lowered (it knows types
     declared locally, e.g. in a `let module`) *)
  let exp_env : Env.t option ref = ref None

  let env () =
    match !exp_env with
    | Some e -> e
    | None -> (match !item_env with Some e -> e | None -> !Toploop.toplevel_env)

  let tyvar_names : (int, string) Hashtbl.t = Hashtbl.create 16

  (* type variable id -> instance, while printing a monomorphised local
     function *)
  let tyvar_subst : (int, Types.type_expr) Hashtbl.t = Hashtbl.create 16

  let tyvar_name ty =
    let id = Types.get_id ty in
    match Hashtbl.find_opt tyvar_names id with
    | Some n -> n
    | None ->
        (* `TA`, `TB`, ...: distinct from the one-letter generics of the
           package interfaces *)
        let rec letters k = if k < 26 then String.make 1 (Char.chr (Char.code 'A' + k)) else letters (k / 26) ^ String.make 1 (Char.chr (Char.code 'A' + k mod 26)) in
        let n = "T" ^ letters (Hashtbl.length tyvar_names) in
        Hashtbl.add tyvar_names id n;
        n

  (* A weak type variable (`'_weak1`: left by a phrase that is not
     generalized, such as `let f = let th = prove ... in fun avs -> ...`
     where nothing fixes the type of `avs`): a later phrase of the file may
     resolve it. Its text is a placeholder that Emit replaces when the file
     is written (as the declarations of toplevel values are printed then).
     Complex/quelim.ml: MPOLY_NORM_CONV and the local functions using it. *)
  let weak_vars : (string, Types.type_expr) Hashtbl.t = Hashtbl.create 16

  (* Generalized type variables treated like weak ones: those of a value
     that is computed once (not a syntactic value), which OCaml generalizes
     when they are covariant (`goal -> meta * 'a list * justification` for a
     tactic returning `[]`: Examples/mizar.ml). MoonBit needs one type for
     its cell: the instance its uses take (`note_instance`). *)
  let frozen_vars : (int, unit) Hashtbl.t = Hashtbl.create 16

  let is_weak ty =
    (match Types.get_desc ty with Types.Tvar _ -> true | _ -> false)
    && (Types.get_level ty <> Btype.generic_level || Hashtbl.mem frozen_vars (Types.get_id ty))

  let rec freeze_vars ty =
    match Types.get_desc ty with
    | Types.Tvar _ -> Hashtbl.replace frozen_vars (Types.get_id ty) ()
    | Types.Tarrow (_, a, b, _) -> freeze_vars a; freeze_vars b
    | Types.Ttuple ts | Types.Tconstr (_, ts, _) -> List.iter freeze_vars ts
    | _ -> ()

  let weak_name ty =
    let n = Printf.sprintf "Weak_%d_" (Types.get_id ty) in
    Hashtbl.replace weak_vars n ty;
    n

  (* The translator types a phrase itself; the toplevel types it again when
     it runs it, and only that copy's weak variables are the ones later
     phrases resolve. `link_weak own installed` records, for each weak
     variable of the translator's type of a definition, the corresponding
     part of the type the toplevel installed. *)
  let weak_alias : (int, Types.type_expr) Hashtbl.t = Hashtbl.create 16

  let rec link_weak (own : Types.type_expr) (installed : Types.type_expr) =
    match Types.get_desc own, Types.get_desc installed with
    | Types.Tvar _, _ when is_weak own ->
        if not (Hashtbl.mem weak_alias (Types.get_id own)) && Types.get_id own <> Types.get_id installed then begin
          Hashtbl.replace weak_alias (Types.get_id own) installed;
          (* a frozen variable's installed counterpart is resolved by the
             uses of the value *)
          if Hashtbl.mem frozen_vars (Types.get_id own) then freeze_vars installed
        end
    | Types.Tarrow (_, a1, b1, _), Types.Tarrow (_, a2, b2, _) -> link_weak a1 a2; link_weak b1 b2
    | Types.Ttuple l1, Types.Ttuple l2 when List.length l1 = List.length l2 -> List.iter2 link_weak l1 l2
    | Types.Tconstr (p1, l1, _), Types.Tconstr (p2, l2, _) when Path.same p1 p2 && List.length l1 = List.length l2 ->
        List.iter2 link_weak l1 l2
    | _ -> ()

  (* a use of a value at an instance of its type: a frozen variable of the
     scheme stands for the corresponding part of the first instance *)
  let rec note_instance (scheme : Types.type_expr) (inst : Types.type_expr) =
    match Types.get_desc scheme, Types.get_desc inst with
    | Types.Tvar _, d when Hashtbl.mem frozen_vars (Types.get_id scheme) ->
        (match d with
         | Types.Tvar _ -> ()
         | _ -> if not (Hashtbl.mem weak_alias (Types.get_id scheme)) then Hashtbl.replace weak_alias (Types.get_id scheme) inst)
    | Types.Tarrow (_, a1, b1, _), Types.Tarrow (_, a2, b2, _) -> note_instance a1 a2; note_instance b1 b2
    | Types.Ttuple l1, Types.Ttuple l2 when List.length l1 = List.length l2 -> List.iter2 note_instance l1 l2
    | Types.Tconstr (p1, l1, _), Types.Tconstr (p2, l2, _) when Path.same p1 p2 && List.length l1 = List.length l2 ->
        List.iter2 note_instance l1 l2
    | (Types.Tconstr _, _ | _, Types.Tconstr _) ->
        (* an abbreviation on one side (`tactic`) *)
        let s' = Ctype.expand_head (env ()) scheme and i' = Ctype.expand_head (env ()) inst in
        if not (s' == scheme && i' == inst) then note_instance s' i'
    | _ -> ()

  (* the type a weak variable stands for by now, if anything resolved it *)
  let rec weak_resolved ty =
    match Types.get_desc ty with
    | Types.Tvar _ -> Option.bind (Hashtbl.find_opt weak_alias (Types.get_id ty)) weak_resolved
    | _ -> Some ty

  (* Type abbreviations with a MoonBit alias of the same meaning. *)
  let alias = function
    | "conv" -> Some "@equal.Conv"
    | "tactic" -> Some "@tactics.Tactic"
    | "thm_tactic" -> Some "@tactics.ThmTactic"
    | "thm_tactical" -> Some "@tactics.ThmTactical"
    | "goal" -> Some "@tactics.Goal"
    | "goalstate" -> Some "@tactics.Goalstate"
    | "justification" -> Some "@tactics.Justification"
    | "instantiation" -> Some "@drule.Instantiation"
    | "refinement" -> Some "@tactics.Refinement"
    | "goalstack" -> Some "@tactics.Goalstack"
    | "strategy" -> Some "@simp.Strategy"
    | _ -> None

  (* Types and constructors defined by translated files: OCaml type name ->
     (package, MoonBit name); constructor name -> package. *)
  let own_types : (string, string * string) Hashtbl.t = Hashtbl.create 32

  (* type abbreviations: printed by name, but expanded for shapes *)
  let own_aliases : (string, unit) Hashtbl.t = Hashtbl.create 32
  let own_ctors : (string, string) Hashtbl.t = Hashtbl.create 64

  (* constructors of hand-ported packages *)
  let () =
    List.iter
      (fun (c, p) -> Hashtbl.replace own_ctors c p)
      [ ("Varp", "preterm"); ("Constp", "preterm"); ("Combp", "preterm"); ("Absp", "preterm");
        ("Typing", "preterm"); ("Utv", "preterm"); ("Ptycon", "preterm"); ("Stv", "preterm");
        ("Ident", "parser"); ("Resword", "parser") ]
  let current_pkg = ref ""

  (* a package's import alias: its directory's last component
     (`library/prime` is `@prime`) *)
  let pkg_alias pkg = Filename.basename pkg

  let qualified (pkg, name) = if pkg = !current_pkg then name else "@" ^ pkg_alias pkg ^ "." ^ name

  let own_type name = Option.map qualified (Hashtbl.find_opt own_types name)

  (* types declared by translated items, by identifier (local modules may
     each have their own `t`) *)
  let own_types_id : (string, string * string) Hashtbl.t = Hashtbl.create 32

  (* Modules of the file being translated: Ident.unique_name -> the full
     module path (`["Metis_prover"; "Intmap"]`); an alias maps to the path
     of its target. *)
  let module_paths : (string, string list) Hashtbl.t = Hashtbl.create 64

  (* module aliases by full name (`Metis_prover.W.B`) -> target path, and
     the generation of each registration *)
  let module_aliases : (string, string list) Hashtbl.t = Hashtbl.create 32
  let alias_gen : (string, int) Hashtbl.t = Hashtbl.create 32
  let alias_counter = ref 0
  let set_alias k v = incr alias_counter; Hashtbl.replace module_aliases k v; Hashtbl.replace alias_gen k !alias_counter

  let rec module_path (p : Path.t) =
    match p with
    | Path.Pident id ->
        (match Hashtbl.find_opt module_paths (Ident.unique_name id) with
         | Some l -> Some l
         | None -> Some [ Ident.name id ] (* a module of an earlier phrase *))
    | Path.Pdot (q, n) ->
        Option.map
          (fun l -> let l = l @ [ n ] in match Hashtbl.find_opt module_aliases (String.concat "." l) with Some t -> t | None -> l)
          (module_path q)
    | Path.Papply _ -> None

  (* the full name of a module member (`Metis_prover.Intmap.add`) *)
  let member_name (p : Path.t) =
    match p with
    | Path.Pdot (q, n) -> Option.map (fun l -> String.concat "." (l @ [ n ])) (module_path q)
    | _ -> None

  let own_type_path p =
    match p with
    | Path.Pident id ->
        (match Hashtbl.find_opt own_types_id (Ident.unique_name id) with
         | Some t -> Some (qualified t)
         | None -> own_type (Path.name p))
    | _ ->
        (match Option.bind (member_name p) own_type with
         | Some t -> Some t
         | None -> own_type (Path.name p))

  let base_type0 = function
    | "thm" -> Some "@kernel.Thm"
    | "term" -> Some "@kernel.Term"
    | "hol_type" -> Some "@kernel.HolType"
    | "list" -> Some "@list.List"
    | "string" -> Some "String"
    | "int" -> Some "Int64"
    | "bool" -> Some "Bool"
    | "unit" -> Some "Unit"
    | "exn" -> Some "Error"
    | "char" -> Some "Char"
    | "option" -> Some "Option"
    | "ref" -> Some "Ref"
    | "num" | "Num.num" -> Some "@num.Num"
    | "lexcode" -> Some "@parser.Lexcode"
    | "func" -> Some "@lib.Func"
    | "float" -> Some "Double"
    | "Stdlib.ref" -> Some "Ref"
    | "array" -> Some "FixedArray"
    | "Hashtbl.t" | "Stdlib.Hashtbl.t" | "Stdlib__Hashtbl.t" -> Some "@lib.OHashtbl"
    | "Lazy.t" | "lazy_t" | "Stdlib.Lazy.t" | "CamlinternalLazy.t" -> Some "@lib.OLazy"
    | "Format.formatter" | "Stdlib__Format.formatter" | "Stdlib.Format.formatter" | "formatter" -> Some "@pp.Formatter"
    | "net" -> Some "@nets.Net"
    | "gconv" -> Some "@simp.Gconv"
    | "prover" -> Some "@simp.Prover"
    | "simpset" -> Some "@simp.Simpset"
    | "preterm" -> Some "@preterm.Preterm"
    | "pretype" -> Some "@preterm.Pretype"
    | _ -> None

  let base_type n = match own_type n with Some t -> Some t | None -> base_type0 n

  (* Exceptions of translated files: Ident.unique_name or qualified name
     (`Metis_prover.Heap.Empty`) -> (package, suberror name) *)
  let own_exns : (string, string * string) Hashtbl.t = Hashtbl.create 32

  (* A constructor of a translated variant type is qualified by its type
     (`@pkg.Type::Ctor`): packages and types may share constructor names.
     An exception is `Suberror::Name`. *)
  let ctor_name ?cd name =
    let by_type =
      match cd with
      | Some cd ->
          (match Types.get_desc cd.Types.cstr_res, cd.Types.cstr_tag with
           | Types.Tconstr (p, _, _), (Types.Cstr_constant _ | Types.Cstr_block _ | Types.Cstr_unboxed) ->
               (match own_type_path p with
                | Some t -> Some (t ^ "::" ^ name)
                | None ->
                    (* a hand-ported type (term, hol_type, preterm, ...) *)
                    (match base_type0 (Path.name p) with
                     | Some t when String.length t > 1 && t.[0] = '@' && t <> "@list.List" -> Some (t ^ "::" ^ name)
                     | _ -> None))
           | _, Types.Cstr_extension (p, _) ->
               let key =
                 match p with
                 | Path.Pident id -> Some ("#" ^ Ident.unique_name id)
                 | _ -> member_name p
               in
               (match Option.bind key (Hashtbl.find_opt own_exns) with
                | Some (pkg, m) -> Some (qualified (pkg, m) ^ "::" ^ name)
                | None ->
                    (match Hashtbl.find_opt own_exns (Path.name p) with
                     | Some (pkg, m) -> Some (qualified (pkg, m) ^ "::" ^ name)
                     | None -> None))
           | _ -> None)
      | None -> None
    in
    match by_type with
    | Some n -> n
    | None ->
    match Hashtbl.find_opt own_ctors name with
    | Some pkg -> qualified (pkg, name)
    | None -> name


  (* The MoonBit type behind an aliased OCaml abbreviation (e.g. the
     uncurried `@tactics.Justification`), read from the package interface. *)
  let alias_mty name =
    match alias name with
    | None -> None
    | Some q ->
        (match String.index_opt q '.' with
         | Some i ->
             let pkg = String.sub q 1 (i - 1) in
             let n = String.sub q (i + 1) (String.length q - i - 1) in
             (match M.find ~root:!Names.root pkg n with Some (M.Alias t) -> Some t | _ -> None)
         | None -> None)

  (* `int * (term -> 'a)`: an element of simp's rewrite nets (gconv when
     'a is thm), expanded; its function part. `net_of_conv` takes any
     payload: a function of another type too (Complex/quelim.ml) *)
  let gconv_fun ty =
    let name t = match Types.get_desc (Ctype.expand_head (env ()) t) with Types.Tconstr (p, [], _) -> Path.last p | _ -> "" in
    match Types.get_desc (Ctype.expand_head (env ()) ty) with
    | Types.Ttuple [ a; f ] when name a = "int" ->
        (match Types.get_desc (Ctype.expand_head (env ()) f) with
         | Types.Tarrow _ -> Some f
         | _ -> None)
    | _ -> None

  let is_gconv_tuple ty = gconv_fun ty <> None

  (* The canonical MoonBit type of an OCaml type: curried unary functions
     (a tuple parameter stays one tuple parameter), every function raising. *)
  let rec mty_of ty =
    match Types.get_desc ty with
    | Types.Tvar _ | Types.Tunivar _ ->
        (match Hashtbl.find_opt tyvar_subst (Types.get_id ty) with
         | Some inst -> Hashtbl.remove tyvar_subst (Types.get_id ty);
             let r = mty_of inst in
             Hashtbl.replace tyvar_subst (Types.get_id ty) inst; r
         | None when is_weak ty -> M.Named (weak_name ty, [])
         | None -> M.Named (tyvar_name ty, []))
    | Types.Tarrow (_, a, b, _) -> M.Fun ([ mty_of a ], mty_of b, true)
    | Types.Ttuple ts -> M.Tuple (List.map mty_of ts)
    | Types.Tconstr (p, [ arg ], _) when Path.name p = "net" && is_gconv_tuple arg ->
        (* `gconv net` seen through the abbreviation `gconv = int * conv`
           (or `(int * (term -> 'a)) net`): simp's nets hold GconvOf structs *)
        let f = Option.get (gconv_fun arg) in
        M.Named ("@nets.Net", [ M.Named ("@simp.GconvOf", [ mty_of f ]) ])
    | Types.Tconstr (p, args, _) ->
        let own = match own_type_path p with Some t -> Some t | None -> base_type0 (Path.name p) in
        let is_alias =
          Hashtbl.mem own_aliases (Path.name p)
          || (match p with Path.Pident id -> Hashtbl.mem own_aliases (Ident.unique_name id) | _ -> false)
          || (match own with Some n -> Hashtbl.mem own_aliases ("=" ^ n) | None -> false)
        in
        (* a translated type of the same name (metis's `conv`) is not the
           hand-ported alias *)
        let hand_alias = if own_type_path p <> None then None else alias_mty (Path.name p) in
        (match hand_alias, (if is_alias then None else own) with
         | Some t, _ -> t
         | None, Some n -> M.Named (n, List.map mty_of args)
         | None, None ->
             let same ty' =
               Types.get_id ty' = Types.get_id ty
               || (match Types.get_desc ty' with Types.Tconstr (p', _, _) -> Path.same p p' | _ -> false)
             in
             let ty' = Ctype.expand_head (env ()) ty in
             let ty' = if same ty' then Ctype.expand_head !Toploop.toplevel_env ty else ty' in
             if same ty' && own <> None then M.Named (Option.get own, List.map mty_of args)
             else if same ty' then begin
               if Sys.getenv_opt "TRANSLATOR_DEBUG" <> None then
                 Printf.eprintf "cannot expand %s (unique %s): in item env %b, toplevel %b\n%!" (Path.name p)
                   (match p with Path.Pident id -> Ident.unique_name id | _ -> "-")
                   (try ignore (Env.find_type p (env ())); true with Not_found -> false)
                   (try ignore (Env.find_type p !Toploop.toplevel_env); true with Not_found -> false);
               M.Named ("?" ^ Path.name p, List.map mty_of args)
             end
             else mty_of ty')
    | Types.Tpoly (t, _) -> mty_of t
    | _ -> M.Named ("?", [])

  and is_arrow ty =
    match Types.get_desc ty with
    | Types.Tarrow _ -> true
    | Types.Tconstr (p, _, _) when alias (Path.name p) = None && base_type (Path.name p) = None ->
        (match Types.get_desc (Ctype.expand_head (env ()) ty) with Types.Tarrow _ -> true | _ -> false)
    | _ -> false

  (* MoonBit source text of an OCaml type, using aliases where they exist. *)
  and show_ty ty =
    match Types.get_desc ty with
    | Types.Tvar _ | Types.Tunivar _ ->
        (match Hashtbl.find_opt tyvar_subst (Types.get_id ty) with
         | Some inst -> Hashtbl.remove tyvar_subst (Types.get_id ty);
             let r = show_ty inst in
             Hashtbl.replace tyvar_subst (Types.get_id ty) inst; r
         | None when is_weak ty -> weak_name ty
         | None -> tyvar_name ty)
    | Types.Tarrow (_, a, b, _) ->
        let r = show_ty b in
        let r = if String.length r > 0 && r.[0] = '(' && is_arrow b then "(" ^ r ^ ")" else r in
        "(" ^ show_ty a ^ ") -> " ^ r ^ " raise"
    | Types.Ttuple ts -> "(" ^ String.concat ", " (List.map show_ty ts) ^ ")"
    | Types.Tconstr (p, [ arg ], _) when Path.name p = "net" && is_gconv_tuple arg ->
        "@nets.Net[@simp.GconvOf[" ^ show_ty (Option.get (gconv_fun arg)) ^ "]]"
    | Types.Tconstr (p, args, _) ->
        let name = Path.name p in
        let own = match own_type_path p with Some t -> Some t | None -> base_type0 name in
        (match (if own_type_path p <> None then None else alias name), own with
         | Some a, _ -> a
         | None, Some "Option" ->
             let a = show_ty (List.hd args) in
             (* `T?` of a function type needs parentheses *)
             if is_arrow (List.hd args) then "(" ^ a ^ ")?" else a ^ "?"
         | None, Some n ->
             if args = [] then n
             else n ^ "[" ^ String.concat ", " (List.map show_ty args) ^ "]"
         | None, None ->
             let ty' = Ctype.expand_head (env ()) ty in
             if Types.get_id ty' = Types.get_id ty then "?" ^ name else show_ty ty')
    | Types.Tpoly (t, _) -> show_ty t
    | _ -> "?"

  let expand ty = Ctype.expand_head (env ()) ty

  let scope_tyvars_fwd : string list ref = ref []

  (* print unknown parts of a type as `_` (for local annotations) *)
  let partial_types = ref false

  let is_our_tyvar v =
    String.length v >= 2 && v.[0] = 'T' && String.for_all (fun c -> c >= 'A' && c <= 'Z') (String.sub v 1 (String.length v - 1))

  (* The MoonBit text of a type when it is concrete (no type variables
     except those in scope). *)
  let rec show_mty (t : M.ty) : string option =
    let all l = List.fold_right (fun x acc -> match x, acc with Some a, Some b -> Some (a :: b) | _ -> None) l (Some []) in
    match t with
    | M.Named (v, []) when String.length v = 1 && v.[0] >= 'A' && v.[0] <= 'Z' -> if !partial_types then Some "_" else None
    | M.Named (v, []) when is_our_tyvar v ->
        if List.mem v !scope_tyvars_fwd then Some v else if !partial_types then Some "_" else None
    | M.Named (n, _) when String.length n > 0 && n.[0] = '?' -> None
    | M.Named ("Option", [ a ]) -> Option.map (fun s -> match a with M.Fun _ -> "(" ^ s ^ ")?" | _ -> s ^ "?") (show_mty a)
    | M.Named (n, []) -> Some n
    | M.Named (n, args) -> Option.map (fun a -> n ^ "[" ^ String.concat ", " a ^ "]") (all (List.map show_mty args))
    | M.Tuple ts -> Option.map (fun a -> "(" ^ String.concat ", " a ^ ")") (all (List.map show_mty ts))
    | M.Fun (ps, r, raises) ->
        (match all (List.map show_mty ps), show_mty r with
         | Some ps, Some r ->
             let r = match t with M.Fun (_, M.Fun _, _) -> "(" ^ r ^ ")" | _ -> r in
             Some ("(" ^ String.concat ", " ps ^ ") -> " ^ r ^ (if raises then " raise" else ""))
         | _ -> None)

  (* A lambda parameter, annotated when its type is concrete. *)
  let param x t = match show_mty t with Some s -> x ^ " : " ^ s | None -> x

  (* the parameters of a lowered lambda, without its "-> R" annotation *)
  let lam_params ps = List.filter (fun x -> not (String.length x > 3 && String.sub x 0 3 = "-> ")) ps

  (* a lambda with fully known parameter and result types is an annotated
     raising `fn` (Ir: a last "-> R" parameter) *)
  let typed_lam ps (ret : M.ty) body =
    let ps' = if List.for_all (fun x -> String.contains x ':') ps then
        (match show_mty ret with Some r -> ps @ [ "-> " ^ (match ret with M.Fun _ -> "(" ^ r ^ ")" | _ -> r) ] | None -> ps)
      else ps in
    Ir.Lam (ps', body)

  (* The parameters of a declared OCaml function type, expanding
     abbreviations (e.g. `tactic`) only when more parameters are needed. *)
  let arrow ty =
    match Types.get_desc ty with
    | Types.Tarrow (_, a, b, _) -> Some (a, b)
    | _ ->
        (match Types.get_desc (expand ty) with
         | Types.Tarrow (_, a, b, _) -> Some (a, b)
         | _ -> None)

  let tuple_size ty =
    match Types.get_desc (expand ty) with
    | Types.Ttuple ts -> List.length ts
    | _ -> 0

  let is_unit ty =
    match Types.get_desc (expand ty) with
    | Types.Tconstr (p, [], _) -> Path.name p = "unit"
    | _ -> false

  let is_int ty =
    match Types.get_desc (expand ty) with
    | Types.Tconstr (p, [], _) -> Path.name p = "int"
    | _ -> false

  (* ---------------------------------------------------------------- *)
  (* Names                                                              *)
  (* ---------------------------------------------------------------- *)

  let keywords =
    [ "as"; "break"; "catch"; "const"; "continue"; "else"; "enum"; "extern"; "var"; "traitalias";
      "enumview"; "lexmatch"; "derive"; "declare"; "fnalias"; "region"; "entry"; "recur"; "spawn"; "loopify";
      "false"; "fn"; "for"; "guard"; "if"; "impl"; "in"; "is"; "let"; "loop";
      "match"; "mut"; "priv"; "pub"; "raise"; "return"; "self"; "struct";
      "suberror"; "test"; "trait"; "true"; "try"; "type"; "typealias";
      "while"; "with"; "using"; "extend"; "async"; "defer"; "errdefer";
      "noraise"; "orelse"; "asm"; "module"; "move"; "ref"; "static"; "super";
      "unsafe"; "use"; "where"; "await"; "dyn"; "abstract"; "do"; "final";
      "macro"; "override"; "package"; "private"; "protected"; "throw";
      "sizeof"; "virtual"; "yield"; "init"; "main"; "lazy"; "pure"; "drop";
      "readonly"; "enumview"; "Self";
      (* prelude functions the generated test driver calls unqualified: a
         package's own `ignore` (Rqe/rqe_tactics_ext.ml's IGNORE) would
         capture them *)
      "ignore"; "not";
      (* init.mbt calls abort; `and` joins recursive local functions
         (Examples/prog.ml defines ABORT and AND) *)
      "abort"; "and" ]

  let rec sanitize name =
    match Names.op_name name with
    | Some n -> n
    | None ->
    let b = Buffer.create (String.length name) in
    String.iter
      (fun c ->
        match c with
        | 'a' .. 'z' | '0' .. '9' | '_' -> Buffer.add_char b c
        | 'A' .. 'Z' -> Buffer.add_char b (Char.lowercase_ascii c)
        | '\'' -> Buffer.add_string b "_p"
        | _ -> Buffer.add_char b '_')
      name;
    let s = Buffer.contents b in
    let s = if s = "" || (s.[0] >= '0' && s.[0] <= '9') then "v" ^ s else s in
    if List.mem s keywords then s ^ "_" else s

  (* a record label's MoonBit field: OCaml's `ref` is MoonBit's Ref (`val`) *)
  let label_name (ld : Types.label_description) =
    match Types.get_desc ld.Types.lbl_res with
    | Types.Tconstr (p, _, _) when ld.Types.lbl_name = "contents" && Path.name p = "Stdlib.ref" -> "val"
    | _ -> sanitize ld.Types.lbl_name

  let counter = ref 0

  (* names taken in the current item (see `unique_local`) *)
  let taken_names : (string, unit) Hashtbl.t = Hashtbl.create 64

  let rec fresh base =
    incr counter;
    let n = Printf.sprintf "%s%d" base !counter in
    if Hashtbl.mem taken_names n then fresh base else (Hashtbl.add taken_names n (); n)

  (* ---------------------------------------------------------------- *)
  (* Environment                                                        *)
  (* ---------------------------------------------------------------- *)

  type local = { name : string; mty : M.ty; loty : Types.type_expr option }

  (* Ident.unique_name -> local *)
  let locals : (string, local) Hashtbl.t = Hashtbl.create 64

  (* MoonBit top-level names of the package being generated *)
  let top_names : (string, unit) Hashtbl.t = Hashtbl.create 256

  (* MoonBit names of the locals of the current item: each binding gets a
     distinct name, since lowering flattens nested scopes. *)
  let local_names = taken_names

  let unique_local base =
    let rec go i =
      let n = if i = 0 then base else Printf.sprintf "%s_%d" base i in
      (* nor a top-level name the body may call *)
      if Hashtbl.mem local_names n || Hashtbl.mem top_names n then go (i + 1) else (Hashtbl.add local_names n (); n)
    in
    go 0

  let bind_local ?oty id mty =
    (* the alternatives of an or-pattern bind the same identifier *)
    match Hashtbl.find_opt locals (Ident.unique_name id) with
    | Some l -> l.name
    | None ->
    let name = unique_local (sanitize (Ident.name id)) in
    Hashtbl.replace locals (Ident.unique_name id) { name; mty; loty = oty };
    name

  (* Values defined earlier in the file being translated:
     Ident.unique_name of the installed binding -> (MoonBit name, kind) *)
  type own = Accessor of M.ty | Function of M.ty
  let own_values : (string, string * own) Hashtbl.t = Hashtbl.create 256
  let own_by_name : (string, string * own) Hashtbl.t = Hashtbl.create 256

  (* Members this file's modules re-export from a module another file
     translated (`module Pa = struct include Pa ... end` in
     Functionspaces/utils.ml, over Library/q.ml's Pa): qualified name here
     -> (the file that defines it, its qualified name there) *)
  let reexports : (string, string * string) Hashtbl.t = Hashtbl.create 16

  let current_file = ref ""

  (* Type variables bound by the enclosing top-level function's generics. *)
  let scope_tyvars : string list ref = scope_tyvars_fwd

  (* Local recursive functions lifted to the top level (MoonBit has no
     generic local functions): their source text. *)
  let lifted : string list ref = ref []

  (* unique names of the local functions lifted to top-level functions *)
  let lifted_ids : (string, unit) Hashtbl.t = Hashtbl.create 16


  let reserve_top base =
    let rec go i =
      let n = if i = 0 then base else Printf.sprintf "%s_%d" base i in
      if Hashtbl.mem top_names n then go (i + 1) else (Hashtbl.add top_names n (); n)
    in
    go 0

  (* Whether generated code needs OCaml's polymorphic equality,
     comparison or hashing on its type parameters. *)
  let needs_bounds text =
    let has sub =
      let n = String.length sub and m = String.length text in
      let rec go i = i + n <= m && (String.sub text i n = sub || go (i + 1)) in
      go 0
    in
    List.exists has
      [ "=="; "!="; "@lib.compare"; "@lib.mem("; "@lib.assoc"; "@lib.rev_assoc"; "@lib.union";
        "@lib.insert"; "@lib.subtract"; "@lib.setify"; "@lib.intersect"; "@lib.list_assoc";
        "@lib.list_mem_assoc"; "@lib.list_remove_assoc"; "@lib.hash"; "@lib.uniq"; "@lib.subset";
        "@lib.set_eq"; "@lib.apply"; "@lib.update"; "@lib.defined"; "@lib.undefine"; "@lib.sort";
        "@lib.merge"; "@lib.mergesort"; "@lib.increasing"; "@lib.decreasing"; "@lib.list_sort";
        "@lib.unions"; "@lib.list_mem"; "@lib.remove"; "@lib.do_list"; ".ocompare" ]

  (* type variables that need OCaml's polymorphic equality, comparison or
     hashing: those in the argument types of comparison primitives and of
     interface functions with bounded generics *)
  let bound_tyvars : (string, unit) Hashtbl.t = Hashtbl.create 16

  (* a group function's declared type by MoonBit name *)
  let own_by_name_m : (string, M.ty) Hashtbl.t = Hashtbl.create 64

  let bounded_in set gens =
    if gens = [] then ""
    else "[" ^ String.concat ", " (List.map (fun g -> if Hashtbl.mem set g then g ^ " : Eq + @lib.OCompare + @lib.OHash" else g) gens) ^ "]"

  let bounded gens _text =
    if gens = [] then ""
    else
      "["
      ^ String.concat ", "
          (List.map (fun g -> if Hashtbl.mem bound_tyvars g then g ^ " : Eq + @lib.OCompare + @lib.OHash" else g) gens)
      ^ "]"

  let tyvars_of_text s =
    let acc = ref [] in
    let n = String.length s in
    let ident c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c = '_' in
    let i = ref 0 in
    while !i < n do
      if s.[!i] = 'T' && (!i = 0 || not (ident s.[!i - 1] || s.[!i - 1] = '.' || s.[!i - 1] = '@')) then begin
        let j = ref (!i + 1) in
        while !j < n && s.[!j] >= 'A' && s.[!j] <= 'Z' do incr j done;
        if !j > !i + 1 && (!j >= n || not (ident s.[!j])) then begin
          let v = String.sub s !i (!j - !i) in
          if not (List.mem v !acc) then acc := v :: !acc
        end;
        i := !j
      end else incr i
    done;
    List.sort compare !acc

  (* The local variables (already bound outside) that an expression uses,
     with their types. *)
  (* members of local modules: "<module unique name>.<member>" -> member
     unique name *)
  let local_module_members : (string, string) Hashtbl.t = Hashtbl.create 16

  (* the functions of top-level recursive groups (globals, never captured) *)
  let toplevel_group_ids : (string, unit) Hashtbl.t = Hashtbl.create 64

  (* polymorphic local functions used through fresh lambdas: their
     captured variables (unique name, OCaml type) *)
  let poly_caps : (string, (string * Types.type_expr) list) Hashtbl.t = Hashtbl.create 16

  let captures_typed (e : Typedtree.expression) =
    let acc = ref [] in
    let open Tast_iterator in
    let expr sub e =
      (match e.Typedtree.exp_desc with
       | Typedtree.Texp_ident (Path.Pident id, _, _) when Hashtbl.mem toplevel_group_ids (Ident.unique_name id) -> ()
       | Typedtree.Texp_ident (Path.Pident id, _, _) when Hashtbl.mem poly_caps (Ident.unique_name id) ->
           List.iter (fun (u, t) -> if not (List.mem_assoc u !acc) then acc := (u, t) :: !acc) (Hashtbl.find poly_caps (Ident.unique_name id))
       | Typedtree.Texp_ident (Path.Pident id, _, _) when Hashtbl.mem locals (Ident.unique_name id) ->
           if not (List.mem_assoc (Ident.unique_name id) !acc) then
             acc := (Ident.unique_name id, e.Typedtree.exp_type) :: !acc
       | Typedtree.Texp_ident (Path.Pdot (Path.Pident mid, name), _, _)
         when Hashtbl.mem local_module_members (Ident.unique_name mid ^ "." ^ name) ->
           let u = Hashtbl.find local_module_members (Ident.unique_name mid ^ "." ^ name) in
           if not (List.mem_assoc u !acc) then acc := (u, e.Typedtree.exp_type) :: !acc
       | _ -> ());
      default_iterator.expr sub e
    in
    let it = { default_iterator with expr } in
    it.expr it e;
    List.rev !acc

  let captures e = List.map fst (captures_typed e)

  (* ---------------------------------------------------------------- *)
  (* Callees                                                            *)
  (* ---------------------------------------------------------------- *)

  type head = {
    hstmts : stmt list;
    hexp : exp;        (* the function value, or a value *)
    hmty : M.ty;       (* its MoonBit type *)
    hoty : Types.type_expr option;  (* declared OCaml type, for alignment *)
  }

  let rec mty_of_decl = function
    | M.Func (_, ps, r, raises) -> M.Fun (ps, r, raises)
    | M.Value t | M.Alias t -> t

  and _unused = ()

  (* A global value: package declaration resolved from provenance. *)
  let global_head loc path (vd : Types.value_description) =
    let oty = vd.Types.val_type in
    let own_unique =
      match path with
      | Path.Pident id -> Hashtbl.find_opt own_values (Ident.unique_name id)
      | _ -> None
    in
    let own_unique =
      match own_unique with
      | Some _ -> own_unique
      | None -> Option.bind (member_name path) (Hashtbl.find_opt own_by_name)
    in
    match own_unique with
    | Some (mname, Accessor t) -> { hstmts = []; hexp = Atom (mname ^ "()"); hmty = t; hoty = Some oty }
    | Some (mname, Function t) -> { hstmts = []; hexp = Atom mname; hmty = t; hoty = Some oty }
    | None ->
    let prov =
      match Prov.lookup path with
      | Some (file, name) when file = !current_file && not (Hashtbl.mem own_by_name name) && Hashtbl.mem reexports name ->
          Some (Hashtbl.find reexports name)
      | r -> r
    in
    match prov with
    | Some (file, name) when file = !current_file ->
        (match Hashtbl.find_opt own_by_name name with
         | Some (mname, Accessor t) ->
             { hstmts = []; hexp = Atom (mname ^ "()"); hmty = t; hoty = Some oty }
         | Some (mname, Function t) ->
             { hstmts = []; hexp = Atom mname; hmty = t; hoty = Some oty }
         | None -> unsupported loc "value %s of this file is not translated" name)
    | Some (file, name) ->
        (match Names.resolve file name with
         | None -> unsupported loc "no MoonBit declaration for %s:%s" file name
         | Some (pkg, mname, decl) ->
             let q = "@" ^ pkg_alias pkg ^ "." ^ mname in
             (match decl with
              | M.Func (_, [], r, _) when not (match arrow oty with Some (a, _) -> is_unit a | None -> false) ->
                  (* an accessor: `pub fn x() -> T` for an OCaml value *)
                  { hstmts = []; hexp = Atom (q ^ "()"); hmty = r; hoty = Some oty }
              | _ -> { hstmts = []; hexp = Atom q; hmty = mty_of_decl decl; hoty = Some oty }))
    | None ->
        (* the Num library (nums): the num package *)
        (match String.split_on_char '.' (Path.name path) with
         | [ "Num"; "num_of_string" ] ->
             (* the Num library's parser differs from lib.ml's
                `num_of_string`, the one the num package has *)
             unsupported loc "Num library's own %s" (Path.name path)
         | [ "Num"; n ] ->
             (* OCaml ints are 63-bit (Int64) *)
             let n = match n with "int_of_num" -> "int63_of_num" | "num_of_int" -> "num_of_int64" | n -> n in
             (match M.find ~root:!Names.root "num" n with
              | Some decl -> { hstmts = []; hexp = Atom ("@num." ^ n); hmty = mty_of_decl decl; hoty = Some oty }
              | None -> unsupported loc "no MoonBit declaration for Num.%s" n)
         | [ n ] ->
             (* bignum_num.ml (loaded before HOL Light): the num package *)
             let n' =
               match n with
               | "num" | "num_of_int" -> "num_of_int64"
               | "int_of_num" -> "int63_of_num"
               | "=/" -> "eq_num" | "</" -> "lt_num" | "<=/" -> "le_num" | ">/" -> "gt_num" | ">=/" -> "ge_num"
               | "<>/" -> "neq_num" | "+/" -> "add_num" | "-/" -> "sub_num" | "*/" -> "mult_num" | "//" -> "div_num"
               | "**/" -> "power_num" | "quo_num" | "mod_num" -> n
               | _ -> n
             in
             (match M.find ~root:!Names.root "num" n' with
              | Some decl -> { hstmts = []; hexp = Atom ("@num." ^ n'); hmty = mty_of_decl decl; hoty = Some oty }
              | None -> unsupported loc "no provenance for %s" n)
         | _ -> unsupported loc "no provenance for %s" (Path.name path))

  (* ---------------------------------------------------------------- *)
  (* Scheduling                                                         *)
  (* ---------------------------------------------------------------- *)

  let is_ordered (stmts, e) = stmts <> [] || ordered e

  (* Bind an ordered expression to a temporary. *)
  let hoist (stmts, e) =
    if ordered e then
      let t = fresh "t" in
      (stmts @ [ Let (t, e) ], Atom t)
    else (stmts, e)

  (* Siblings given in OCaml evaluation order; `inline_ok i` says whether
     sibling i may stay inline when it is the last ordered one. Returns the
     statements and the sibling expressions (in the same order). *)
  let schedule ?(inline_ok = fun _ -> true) sibs =
    let n = List.length sibs in
    let last =
      let r = ref (-1) in
      List.iteri (fun i s -> if is_ordered s then r := i) sibs;
      !r
    in
    let stmts = ref [] in
    let exps =
      List.mapi
        (fun i (ss, e) ->
          if i = last && inline_ok i then begin
            stmts := !stmts @ ss; e
          end else if is_ordered (ss, e) then begin
            let ss', e' = hoist (ss, e) in
            stmts := !stmts @ ss'; e'
          end else begin
            stmts := !stmts @ ss; e
          end)
        sibs
    in
    ignore n;
    (!stmts, exps)


  (* ---------------------------------------------------------------- *)
  (* Adaptation                                                         *)
  (* ---------------------------------------------------------------- *)

  let rec same_shape a b =
    match a, b with
    | M.Fun (ps1, r1, _), M.Fun (ps2, r2, _) ->
        List.length ps1 = List.length ps2 && List.for_all2 same_shape ps1 ps2
        && same_shape r1 r2
    | M.Fun _, _ | _, M.Fun _ -> false
    | M.Tuple ts1, M.Tuple ts2 when List.length ts1 = List.length ts2 -> List.for_all2 same_shape ts1 ts2
    | _ -> true

  (* Whether a value of type `have` must be eta-expanded to be used at type
     `want`: different grouping, or a non-raising function where a raising
     one is expected (MoonBit does not convert function values). *)
  let rec needs_eta have want =
    match have, want with
    | M.Fun (ps1, r1, raises1), M.Fun (ps2, r2, raises2) ->
        (raises2 && not raises1) || not (same_shape have want)
        || List.exists2 (fun p1 p2 -> needs_eta p2 p1) ps1 ps2
        || needs_eta r1 r2
    | M.Tuple hs, M.Tuple ws when List.length hs = List.length ws -> List.exists2 needs_eta hs ws
    | M.Named ("Int", []), M.Named ("Int64", []) | M.Named ("Int64", []), M.Named ("Int", []) -> true
    | _ -> false

  let rec groups = function
    | M.Fun (ps, r, _) -> let gs, res = groups r in (ps :: gs, res)
    | t -> ([], t)

  (* Adapt value `e` of MoonBit type `have` to type `want` (both types of the
     same OCaml value). Parameters are matched as OCaml-level units: when the
     counts differ, a tuple parameter on the side with fewer is split into
     its components (a MoonBit `(A, B) -> C` against an OCaml `A * B -> C`).
     Each stage of `e` is applied as soon as the wanted closures have
     received its parameters, so staging is preserved. *)
  and adapt (stmts, e) have want =
    if not (needs_eta have want) then (stmts, e)
    else
    match have, want with
    (* an OCaml int (Int64) through a hand-ported `Int` *)
    | M.Named ("Int", []), M.Named ("Int64", []) -> (stmts, widen e)
    | M.Named ("Int64", []), M.Named ("Int", []) -> (stmts, narrow e)
    | M.Tuple hs, M.Tuple ws ->
        (* rebuild the tuple, adapting its components *)
        let stmts, e = hoist (stmts, e) in
        let comps = List.mapi (fun i (h, w) -> snd (adapt ([], Field (e, i)) h w)) (List.combine hs ws) in
        (stmts, Tuple comps)
    | _ ->
    begin
      let stmts, e = hoist (stmts, e) in
      let wgs, wres = groups want in
      let hgs, hres = groups have in
      (* a parameter is `Plain t` or `Split ts` (one tuple, k units); a
         group without parameters (`() -> T`, an OCaml `unit -> t`) is one
         unit, `Zero: against `(Unit) -> T`, what a generic `(A) -> B` is at
         unit (`(f o top_goal) ()` in Rqe/util.ml) *)
      let plain gs = List.map (fun g -> if g = [] then [ `Zero ] else List.map (fun t -> `Plain t) g) gs in
      let units p = match p with `Plain _ | `Zero -> 1 | `Split ts -> List.length ts in
      let count gs = List.fold_left (fun n g -> List.fold_left (fun n p -> n + units p) n g) 0 gs in
      let split_first gs =
        let found = ref false in
        let gs' =
          List.map
            (List.map (fun p ->
                 match p with
                 | `Plain (M.Tuple ts) when not !found && List.length ts > 1 -> found := true; `Split ts
                 | p -> p))
            gs
        in
        if !found then Some gs' else None
      in
      let rec balance w h =
        let cw = count w and ch = count h in
        if cw = ch then (w, h)
        else if cw < ch then
          (match split_first w with Some w' -> balance w' h | None -> fail_adapt ())
        else (match split_first h with Some h' -> balance w h' | None -> fail_adapt ())
      and fail_adapt () =
        failwith (Printf.sprintf "cannot adapt %s to %s" (M.show have) (M.show want))
      in
      let wps, hps = balance (plain wgs) (plain hgs) in
      (* pending: OCaml-level argument units received but not yet passed *)
      let rec go cur hps pending wps : stmt list * exp =
        match hps with
        | g :: hrest when List.length pending >= count [ g ] ->
            let rec take g pending acc =
              match g with
              | [] -> (List.rev acc, pending)
              | `Zero :: g' ->
                  (* the unit argument is not passed *)
                  (match pending with
                   | _ :: rest -> take g' rest acc
                   | [] -> assert false)
              | `Plain ht :: g' ->
                  (match pending with
                   | (x, wt) :: rest -> take g' rest (snd (adapt ([], x) wt ht) :: acc)
                   | [] -> assert false)
              | `Split ts :: g' ->
                  let k = List.length ts in
                  let now = List.filteri (fun i _ -> i < k) pending in
                  let rest = List.filteri (fun i _ -> i >= k) pending in
                  let comps = List.map2 (fun (x, wt) ht -> snd (adapt ([], x) wt ht)) now ts in
                  take g' rest (Tuple comps :: acc)
            in
            let args, later = take g pending [] in
            let call = Call (cur, args) in
            if wps = [] && later = [] && hrest = [] then adapt ([], call) hres wres
            else
              let t = fresh "s" in
              let ss, r = go (Atom t) hrest later wps in
              (Let (t, call) :: ss, r)
        | _ ->
            (match wps with
             | [] -> ([], cur)
             | g :: wrest ->
                 let params =
                   List.map
                     (fun p ->
                       let x = fresh "x" in
                       match p with
                       | `Zero -> ([], [ (Atom "()", M.Named ("Unit", [])) ])
                       | `Plain t -> ([ param x t ], [ (Atom x, t) ])
                       | `Split ts -> ([ param x (M.Tuple ts) ], List.mapi (fun i t -> (Field (Atom x, i), t)) ts))
                     g
                 in
                 let body = go cur hps (pending @ List.concat_map snd params) wrest in
                 let ptypes = function `Zero -> [] | `Plain t -> [ t ] | `Split ts -> [ M.Tuple ts ] in
                 let ret = List.fold_right (fun g acc -> M.Fun (List.concat_map ptypes g, acc, true)) wrest wres in
                 ([], typed_lam (List.concat_map fst params) ret body))
      in
      let ss, e' = go e hps [] wps in
      (stmts @ ss, e')
    end

  (* Replace the type variables of an expected MoonBit type (from a generic
     signature) by the corresponding parts of the OCaml type at the use. *)
  let is_tyvar v = (String.length v = 1 && v.[0] >= 'A' && v.[0] <= 'Z') || is_our_tyvar v

  let rec refine (want : M.ty) (canon : M.ty) =
    match want, canon with
    | M.Named (v, []), c when is_tyvar v -> c
    | M.Fun (ps, r, raises), _ ->
        (* k curried OCaml parameters first; else one k-tuple parameter *)
        let rec walk ps c acc =
          match ps, c with
          | [], c -> Some (List.rev acc, c)
          | p :: ps', M.Fun ([ cp ], cr, _) -> walk ps' cr (refine p cp :: acc)
          | _ -> None
        in
        (match walk ps canon [], canon with
         | Some (ps', cr), _ -> M.Fun (ps', refine r cr, raises)
         | None, M.Fun ([ M.Tuple cs ], cr, _) when List.length cs = List.length ps ->
             M.Fun (List.map2 refine ps cs, refine r cr, raises)
         | None, _ -> want)
    | M.Tuple ws, M.Tuple cs when List.length ws = List.length cs -> M.Tuple (List.map2 refine ws cs)
    | M.Named (n, ws), M.Named (_, cs) when List.length ws = List.length cs && ws <> [] ->
        M.Named (n, List.map2 refine ws cs)
    | _ -> want

  (* Generated generic functions of this package: MoonBit callee text ->
     (its generics that need Eq/OCompare/OHash, its declared type). A call
     bounds whatever the caller instantiates those generics with. *)
  let fn_bounds : (string, string list * M.ty) Hashtbl.t = Hashtbl.create 64

  (* top-level functions: their bounded set (mutable while their recursive
     group is emitted), generics and declared type *)
  let fn_bound_sets : (string, (string, unit) Hashtbl.t * string list * M.ty) Hashtbl.t = Hashtbl.create 64

  (* the recursive group being emitted, the function being emitted, and
     the calls between the group's functions (caller, callee, instances) *)
  let group_members : string list ref = ref []
  let current_fn = ref ""
  let pending_calls : (string * string * M.ty) list ref = ref []

  (* the instances of a declared type's variables in an instance type *)
  let rec inst_pairs (d : M.ty) (i : M.ty) acc =
    match d, i with
    | M.Named (v, []), _ when is_tyvar v -> (v, i) :: acc
    | M.Named (_, ds), M.Named (_, is) when List.length ds = List.length is -> List.fold_left2 (fun acc d i -> inst_pairs d i acc) acc ds is
    | M.Tuple ds, M.Tuple is when List.length ds = List.length is -> List.fold_left2 (fun acc d i -> inst_pairs d i acc) acc ds is
    | M.Fun (dps, dr, _), M.Fun (ips, ir, _) when List.length dps = List.length ips ->
        inst_pairs dr ir (List.fold_left2 (fun acc d i -> inst_pairs d i acc) acc dps ips)
    | _ -> acc

  let rec mty_tyvars (t : M.ty) acc =
    match t with
    | M.Named (v, []) when is_tyvar v -> if List.mem v acc then acc else v :: acc
    | M.Named (_, ts) | M.Tuple ts -> List.fold_left (fun acc t -> mty_tyvars t acc) acc ts
    | M.Fun (ps, r, _) -> mty_tyvars r (List.fold_left (fun acc t -> mty_tyvars t acc) acc ps)

  let adapt_to ?expect (stmts, e, have) =
    match expect with
    | Some want -> let ss, e = adapt (stmts, e) have want in (ss, e, want)
    | None -> (stmts, e, have)

  (* ---------------------------------------------------------------- *)
  (* Constants and patterns                                             *)
  (* ---------------------------------------------------------------- *)

  let const loc = function
    (* OCaml's 63-bit int is an Int64 (lib/int63.mbt) *)
    | Asttypes.Const_int n -> if n < 0 then "(" ^ string_of_int n ^ "L)" else string_of_int n ^ "L"
    | Asttypes.Const_string (s, _, _) -> string_lit s
    | Asttypes.Const_float f ->
        (* MoonBit wants digits after the point and a point before `e`
           (`1e-12` -> `1.0e-12`, `2.` -> `2.0`, `1.e5` -> `1.0e5`) *)
        let f = String.concat "" (String.split_on_char '_' f) in
        let mant, exp =
          match String.index_opt (String.lowercase_ascii f) 'e' with
          | Some i -> (String.sub f 0 i, String.sub f i (String.length f - i))
          | None -> (f, "")
        in
        let mant = if String.contains mant '.' then mant else mant ^ ".0" in
        let mant = if mant.[String.length mant - 1] = '.' then mant ^ "0" else mant in
        let f = mant ^ exp in
        if f.[0] = '-' then "(" ^ f ^ ")" else f
    | Asttypes.Const_char c ->
        if c = '\'' then "'\\''" else if c = '\\' then "'\\\\'"
        else if Char.code c >= 32 && Char.code c < 127 then Printf.sprintf "'%c'" c
        else Printf.sprintf "'\\u{%x}'" (Char.code c)
    | _ -> unsupported loc "constant"

  (* `'k.` with `fun (type k)`, not `: type k.`: camlp5 8.02.01 rejects the
     latter on OCaml 4.14 (the translator is parsed by camlp5) *)
  let rec irrefutable : 'k. 'k general_pattern -> bool = fun (type k) (p : k general_pattern) ->
    match p.pat_desc with
    | Tpat_any | Tpat_var _ -> true
    | Tpat_alias (q, _, _) -> irrefutable q
    | Tpat_tuple ps -> List.for_all irrefutable ps
    | Tpat_construct (_, cd, [], _) -> cd.Types.cstr_name = "()"
    | Tpat_value v -> irrefutable (v :> value general_pattern)
    | _ -> false

  (* MoonBit text of a pattern, binding its variables; `mty` is the
     MoonBit type of the matched value when known. *)
  let rec pattern : 'k. ?mty:M.ty -> 'k general_pattern -> string =
    fun (type k) ?mty (p : k general_pattern) ->
    let loc = p.pat_loc in
    let sub_mty q = mty_of q.pat_type in
    match p.pat_desc with
    | Tpat_any -> "_"
    | Tpat_var (id, _) ->
        bind_local id (match mty with Some t -> t | None -> mty_of p.pat_type)
    | Tpat_alias (q, id, _) ->
        let s = pattern ?mty q in
        s ^ " as " ^ bind_local id (match mty with Some t -> t | None -> mty_of p.pat_type)
    | Tpat_constant (Asttypes.Const_int n) when mty = Some (M.Named ("Int", [])) ->
        (* a scrutinee of a hand-ported `Int` (e.g. an adapted callback
           parameter) *)
        if n < -2147483648 || n > 2147483647 then unsupported loc "int pattern %d against a 32-bit Int" n
        else if n < 0 then "(" ^ string_of_int n ^ ")" else string_of_int n
    | Tpat_constant c -> const loc c
    | Tpat_tuple ps ->
        let mtys =
          match mty with
          | Some (M.Tuple ts) when List.length ts = List.length ps -> List.map Option.some ts
          | _ -> List.map (fun _ -> None) ps
        in
        "(" ^ String.concat ", " (List.map2 (fun q t -> pattern ?mty:t q) ps mtys) ^ ")"
    | Tpat_construct (_, cd, ps, _) ->
        (match cd.Types.cstr_name, ps with
         | "[]", [] -> "Empty"
         | "::", [ h; t ] ->
             let h = pattern ~mty:(sub_mty h) h in
             "More(" ^ h ^ ", tail=" ^ pattern ?mty t ^ ")"
         | "()", [] -> "_"
         | ("true" | "false" | "None"), [] -> cd.Types.cstr_name
         | name, [] -> ctor_name ~cd name
         | name, ps -> ctor_name ~cd name ^ "(" ^ String.concat ", " (List.map (fun q -> pattern q) ps) ^ ")")
    | Tpat_or (a, b, _) ->
        (* an alternative binding with `as` needs parentheses *)
        let has_as t = let n = String.length t in let rec at i = i + 4 <= n && (String.sub t i 4 = " as " || at (i + 1)) in at 0 in
        let paren t = if has_as t then "(" ^ t ^ ")" else t in
        paren (pattern ?mty a) ^ " | " ^ paren (pattern ?mty b)
    | Tpat_record (fields, _) ->
        "{ "
        ^ String.concat ", "
            (List.map (fun (_, ld, q) -> label_name ld ^ ": " ^ pattern q) fields)
        ^ ", .. }"
    | Tpat_value v -> pattern ?mty (v :> value general_pattern)
    | Tpat_exception q -> pattern q
    | _ -> unsupported loc "pattern"

  let match_failure loc =
    let file, line, _ = Location.get_pos_info loc.Location.loc_start in
    Raise (Call (Atom "@lib.MatchFailure", [ Atom (string_lit (Printf.sprintf "%s:%d" (Filename.basename file) line)) ]))

  (* ---------------------------------------------------------------- *)
  (* Expressions                                                        *)
  (* ---------------------------------------------------------------- *)

  let path_name p = Path.name p

  let stdlib_name p =
    let n = path_name p in
    if String.length n > 7 && String.sub n 0 7 = "Stdlib." then
      Some (String.sub n 7 (String.length n - 7))
    else None

  (* Stdlib (or a module including it) `List.f` with the same meaning as
     lib.ml's function (`List.iter` is `do_list`, ...) *)
  let list_alias p (vd : Types.value_description) =
    let n = path_name p in
    (* the Stdlib function (perhaps included into a module of the source),
       not one the source defines *)
    let from_stdlib =
      (* the Stdlib's own file (no directory), not a source file of that name *)
      match vd.Types.val_loc.Location.loc_start.Lexing.pos_fname with
      | "list.ml" | "list.mli" -> true
      | _ -> false
    in
    let short =
      match String.rindex_opt n '.' with
      | Some i when from_stdlib ->
          Some (String.sub n (i + 1) (String.length n - i - 1))
      | _ -> None
    in
    match short with
    | Some ("map" | "rev" | "length" | "exists" | "mem" | "hd" | "tl"
           | "fold_left" | "fold_left_map" | "rev_append" as f) -> Some f
    | Some "assoc" -> Some "list_assoc"
    | Some ("sort" | "stable_sort") -> Some "list_sort"
    | Some ("rev_map" | "nth" | "iter2" | "mapi" | "iteri" | "find" | "find_opt" | "filter_map"
           | "concat_map" | "mem_assoc" | "remove_assoc" | "split" | "init" | "append"
           | "for_all2" | "exists2" | "filter" | "partition" | "map2" | "combine" | "fold_left2" as f) -> Some ("list_" ^ f)
    | Some "for_all" -> Some "forall"
    | Some "iter" -> Some "do_list"
    | Some ("concat" | "flatten") -> Some "flat"
    | Some "fold_right" -> Some "itlist"
    | _ -> None

  let lib_combinator p =
    match Prov.lookup p with
    | Some ("lib.ml", (("o" | "I" | "K" | "C" | "W" | "f_f_") as n)) -> Some n
    | _ -> None

  let field_name n = sanitize n

  (* the MoonBit name of a record type, for `T::{ ... }` *)
  let record_type_name ty =
    match Types.get_desc (expand ty) with
    | Types.Tconstr (p, _, _) ->
        (match own_type_path p with
         | Some t -> t
         | None -> unsupported Location.none "record type %s" (Path.name p))
    | _ -> unsupported Location.none "record type"

  (* emits type declarations at the top level (set by Emit): module name
     prefix, declarations *)
  let emit_types_hook : (string -> type_declaration list -> unit) ref = ref (fun _ _ -> ())


  let depth = ref 0

  (* An expression of OCaml type int is an Int64 unless an `Int` is
     expected (a hand-ported parameter); scalar Int/Int64 mismatches are
     converted (lib/int63.mbt) *)
  let rec lower ?expect (e : expression) : stmt list * exp * M.ty =
    let ss, x, t = lower0 ?expect e in
    let want =
      match expect with
      | Some w -> Some w
      | None -> if is_int e.exp_type then Some (M.Named ("Int64", [])) else None
    in
    match t, want with
    | M.Named (("Int" | "Int64") as a, []), Some (M.Named (("Int" | "Int64") as b, []) as w) when a <> b ->
        let ss, x = adapt (ss, x) t w in
        (ss, x, w)
    | _ -> (ss, x, t)

  and lower0 ?expect (e : expression) : stmt list * exp * M.ty =
    let loc = e.exp_loc in
    incr depth;
    if !depth > 3000 then unsupported loc "lowering recursion too deep";
    let saved_env = !exp_env in
    exp_env := Some e.exp_env;
    Fun.protect ~finally:(fun () -> decr depth; exp_env := saved_env) @@ fun () ->
    match e.exp_desc with
    | Texp_ident (path, _, vd) ->
        if Hashtbl.length frozen_vars > 0 then note_instance vd.Types.val_type e.exp_type;
        lower_apply ?expect e e [] |> fun r -> ignore path; r
    | Texp_constant c -> ([], Atom (const loc c), mty_of e.exp_type)
    | Texp_apply (f, args) ->
        (match f.exp_desc with
         | Texp_ident (_, _, vd) when Hashtbl.length frozen_vars > 0 -> note_instance vd.Types.val_type f.exp_type
         | _ -> ());
        (* the typed arguments are in the callee's parameter order, so a
           labelled argument is positional (none may be omitted) *)
        (* a Stdlib function's omitted optional arguments (`?random` of
           Hashtbl.create) take their defaults *)
        let omitted = function
          | (Asttypes.Optional _, None) -> true
          | (Asttypes.Optional _, Some { exp_desc = Texp_construct (_, cd, []); _ }) -> cd.Types.cstr_name = "None"
          | _ -> false
        in
        let args =
          match f.exp_desc with
          | Texp_ident (p, _, _) when stdlib_name p <> None -> List.filter (fun a -> not (omitted a)) args
          | _ -> args
        in
        let args =
          List.map (function
              | ((Asttypes.Nolabel | Asttypes.Labelled _ | Asttypes.Optional _), Some a) -> a
              | _ -> unsupported loc "omitted argument") args
        in
        lower_apply ?expect e f args
    | Texp_while (c, body) ->
        let cs, cx, _ = lower c in
        let bs, bx, _ = lower body in
        ([ While ((cs, cx), (bs @ (if ordered bx then [ Do bx ] else []), Atom "()")) ], Atom "()", M.Named ("Unit", []))
    | Texp_for (id, _, lo, hi, dir, body) ->
        (* `for i = lo to hi do body done`: the bounds are evaluated once,
           `lo` first; the counter is a Ref. (At `hi = max_int` OCaml stops
           where this wraps: no upstream loop runs to it.) *)
        let int64 = M.Named ("Int64", []) in
        let ls, lx, _ = lower ~expect:int64 lo in
        let hs, hx, _ = lower ~expect:int64 hi in
        let r = fresh "i" in
        let bound = fresh "n" in
        let name = bind_local id int64 in
        let bs, bx, _ = lower body in
        let cmp, step =
          match dir with Asttypes.Upto -> ("<=", "@lib.add63") | Asttypes.Downto -> (">=", "@lib.sub63")
        in
        ( ls @ [ Let (r, RefNew lx) ] @ hs
          @ [ Let (bound, hx);
              While
                ( ([], Binop (cmp, Deref (Atom r), Atom bound)),
                  ( [ Let (name, Deref (Atom r)) ] @ bs
                    @ (if ordered bx then [ Do bx ] else [])
                    @ [ Assign (Atom r, Call (Atom step, [ Deref (Atom r); Atom "1L" ])) ],
                    Atom "()" ) ) ],
          Atom "()",
          M.Named ("Unit", []) )
    | Texp_lazy body ->
        (* evaluated (once) when forced *)
        let bb = lower_block body in
        ([], Call (Atom "@lib.lazy_new", [ Lam ([], bb) ]), mty_of e.exp_type)
    | Texp_open ({ open_expr = { mod_desc = Tmod_ident _; _ }; _ }, body) -> lower ?expect body
    | Texp_open _ -> unsupported loc "local open of a module expression"
    | Texp_function _ -> lower_function ?expect e
    | Texp_let (Asttypes.Nonrecursive, vbs, body) -> lower_let ?expect vbs body
    | Texp_tuple es ->
        let mtys =
          match expect with
          | Some (M.Tuple ts) when List.length ts = List.length es -> List.map Option.some ts
          | _ -> List.map (fun _ -> None) es
        in
        let lowered = List.map2 (fun e t -> let ss, x, ty = lower ?expect:t e in ((ss, x), ty)) es mtys in
        (* right to left *)
        let stmts, xs = schedule (List.rev_map fst lowered) in
        (* a component that always raises (`(failwith f, Failure m)` in
           Unity/aux_definitions.ml): the tuple is never built, and MoonBit
           takes no `raise` inside one *)
        (match List.find_opt (function Raise _ -> true | _ -> false) xs with
         | Some r -> (stmts, r, M.Tuple (List.map snd lowered))
         | None -> ( stmts, Tuple (List.rev xs), M.Tuple (List.map snd lowered) ))
    | Texp_construct (_, cd, args) -> lower_construct ?expect e cd args
    | Texp_ifthenelse (c, a, b) ->
        let cs, cx, _ = lower c in
        let want = match expect with Some t -> Some t | None -> Some (mty_of e.exp_type) in
        let a' = lower_block ?expect:want a in
        let b' =
          match b with
          | Some b -> lower_block ?expect:want b
          | None -> ([], Atom "()")
        in
        (cs, If (cx, a', b'), Option.get want)
    | Texp_sequence (a, b) ->
        let ss, x, _ = lower a in
        let ss2, y, t = lower ?expect b in
        (* OCaml only warns when a non-unit value is discarded *)
        let discard = if is_unit a.exp_type then x else Call (Atom "ignore", [ x ]) in
        (ss @ (if ordered x then [ Do discard ] else []) @ ss2, y, t)
    | Texp_match (scrut, cases, partial) -> lower_match ?expect e scrut cases partial
    | Texp_try (body, cases) -> lower_try ?expect e body cases
    | Texp_let (Asttypes.Recursive, vbs, body) -> lower_letrec ?expect loc vbs body
    | Texp_record { fields; extended_expression; _ } ->
        (* the base first, then the given fields right to left in
           definition order *)
        let tname = record_type_name e.exp_type in
        let base = Option.map (fun b -> let ss, x, _ = lower b in (ss, x)) extended_expression in
        let given =
          Array.to_list fields
          |> List.filter_map (fun (ld, def) ->
                 match def with
                 | Overridden (_, fe) -> Some (label_name ld, fe)
                 | Kept _ -> None)
        in
        let lowered = List.map (fun (n, fe) -> let ss, x, _ = lower ~expect:(mty_of fe.exp_type) fe in (n, (ss, x))) given in
        let sibs = (match base with Some b -> [ b ] | None -> []) @ List.rev_map snd lowered in
        let stmts, xs = schedule sibs in
        let base_x, xs = match base with Some _ -> (Some (List.hd xs), List.tl xs) | None -> (None, xs) in
        let fields_x = List.combine (List.map fst lowered) (List.rev xs) in
        (stmts, Record (tname, base_x, fields_x), mty_of e.exp_type)
    | Texp_field (r, _, ld) ->
        let ss, x, _ = lower r in
        (ss, Proj (x, label_name ld), mty_of e.exp_type)
    | Texp_setfield (r, _, ld, v) ->
        (* `r.f <- v`: v first *)
        let vl = lower_block ~expect:(mty_of v.exp_type) v in
        let rl = lower_block r in
        let stmts, xs = schedule [ vl; rl ] in
        (stmts, Blk ([ SetField (List.nth xs 1, label_name ld, List.nth xs 0) ], Atom "()"), M.Named ("Unit", []))
    | Texp_letmodule (Some mid, _, _, { mod_desc = (Tmod_structure str | Tmod_constraint ({ mod_desc = Tmod_structure str; _ }, _, _, _)); _ }, body) ->
        (* `let module M = struct ... end in body`: the module's values
           become nested lets around the body; `M.x` refers to them *)
        let items =
          List.filter_map
            (fun it ->
              match it.str_desc with
              | Tstr_value (rf, vbs) ->
                  List.iter
                    (fun vb ->
                      List.iter
                        (fun id ->
                          Hashtbl.replace local_module_members
                            (Ident.unique_name mid ^ "." ^ Ident.name id) (Ident.unique_name id))
                        (pat_bound_idents vb.vb_pat))
                    vbs;
                  Some (rf, vbs)
              | Tstr_type (_, decls) -> !emit_types_hook (Ident.name mid) decls; None
              | Tstr_open _ -> None
              | _ -> unsupported it.str_loc "local module item")
            str.str_items
        in
        let nested =
          List.fold_right (fun (rf, vbs) acc -> { body with exp_desc = Texp_let (rf, vbs, acc) }) items body
        in
        lower ?expect nested
    | Texp_letmodule (Some mid, _, _, { mod_desc = Tmod_ident (Path.Pident src, _); _ }, body) ->
        (* `let module A = B in body`: A's members are B's *)
        let sp = Ident.unique_name src ^ "." and dp = Ident.unique_name mid ^ "." in
        let copies =
          Hashtbl.fold
            (fun k v acc ->
              if String.length k > String.length sp && String.sub k 0 (String.length sp) = sp then
                (dp ^ String.sub k (String.length sp) (String.length k - String.length sp), v) :: acc
              else acc)
            local_module_members []
        in
        List.iter (fun (k, v) -> Hashtbl.replace local_module_members k v) copies;
        let tp = Ident.name src ^ "." and tdp = Ident.name mid ^ "." in
        let tcopies =
          Hashtbl.fold
            (fun k v acc ->
              if String.length k > String.length tp && String.sub k 0 (String.length tp) = tp then
                (tdp ^ String.sub k (String.length tp) (String.length k - String.length tp), v) :: acc
              else acc)
            own_types []
        in
        List.iter (fun (k, v) -> Hashtbl.replace own_types k v) tcopies;
        lower ?expect body
    | Texp_assert c ->
        let file, line, col = Location.get_pos_info loc.Location.loc_start in
        let fail = Raise (Call (Atom "@lib.AssertFailure", [ Atom (string_lit (Printf.sprintf "%s:%d:%d" (Filename.basename file) line col)) ])) in
        (match c.exp_desc with
         | Texp_construct (_, cd, []) when cd.Types.cstr_name = "false" -> ([], fail, mty_of e.exp_type)
         | _ ->
             let ss, x, _ = lower c in
             (ss, If (x, ([], Atom "()"), ([], fail)), M.Named ("Unit", [])))
    | _ -> unsupported loc "expression"

  and lower_block ?expect e : block =
    let ss, x, _ = lower ?expect e in
    (ss, x)

  (* --- Applications --- *)

  and lower_apply ?expect whole f args =
    let loc = whole.exp_loc in
    match f.exp_desc with
    | Texp_ident (p, _, vd) when list_alias p vd <> None ->
        let name = Option.get (list_alias p vd) in
        (match Names.resolve "lib.ml" name with
         | Some (pkg, mname, decl) ->
             let h = { hstmts = []; hexp = Atom ("@" ^ pkg_alias pkg ^ "." ^ mname); hmty = mty_of_decl decl; hoty = Some vd.Types.val_type } in
             apply_head ?expect ~res:whole.exp_type loc h args
         | None -> unsupported loc "List.%s" name)
    | Texp_ident (p, _, _) when (match stdlib_name p with Some ("Format.printf" | "Printf.printf" | "Printf.sprintf" | "Format.sprintf") -> true | _ -> false) ->
        lower_printf ?expect whole (Option.get (stdlib_name p)) args
    | Texp_ident (p, _, _) when (match Prov.lookup p with Some ("printer.ml", ("printf" | "sprintf")) -> true | _ -> false) ->
        (* printer.ml includes Format *)
        lower_printf ?expect whole ("Format." ^ snd (Option.get (Prov.lookup p))) args
    | Texp_ident (p, _, _)
      when (match Prov.lookup p with Some ("printer.ml", ("std_formatter" | "pp_print_string" | "pp_print_char" | "pp_print_int" | "pp_print_newline" | "pp_print_space" | "pp_print_cut" | "pp_print_break" | "pp_open_box" | "pp_close_box" | "pp_open_hvbox" | "pp_open_vbox" | "pp_print_flush"
                                                   | "print_string" | "print_newline" | "print_int" | "print_float" | "print_as" | "print_break" | "print_space" | "print_cut" | "print_flush"
                                                   | "open_box" | "open_hbox" | "open_vbox" | "open_hvbox" | "open_hovbox" | "close_box")) -> true | _ -> false) ->
        (* printer.ml includes Format: an unqualified `print_string` after
           it is Format's (Complex/complex_grobner.ml) *)
        (match Prov.lookup p with
         | Some (_, n) -> lower_prim ?expect whole ("Format." ^ n) f args
         | None -> assert false)
    | Texp_ident (p, _, _) when stdlib_name p <> None ->
        lower_prim ?expect whole (Option.get (stdlib_name p)) f args
    | Texp_ident (p, _, _) when (match path_name p with "float_sqrt" | "float_fabs" -> Prov.lookup p = None | _ -> false) ->
        lower_prim ?expect whole (path_name p) f args
    | Texp_ident (p, _, _) when lib_combinator p <> None ->
        lower_combinator ?expect whole (Option.get (lib_combinator p)) f args
    | Texp_ident (Path.Pdot (Path.Pident mid, name), _, _)
      when Hashtbl.mem local_module_members (Ident.unique_name mid ^ "." ^ name) ->
        let u = Hashtbl.find local_module_members (Ident.unique_name mid ^ "." ^ name) in
        let l = Hashtbl.find locals u in
        apply_head ?expect ~res:whole.exp_type loc { hstmts = []; hexp = Atom l.name; hmty = l.mty; hoty = l.loty } args
    | Texp_ident (Path.Pident id, _, _) when Hashtbl.mem locals (Ident.unique_name id) ->
        let l = Hashtbl.find locals (Ident.unique_name id) in
        (* a polymorphic local is used at an instance of its type *)
        let hmty = refine l.mty (mty_of f.exp_type) in
        apply_head ?expect ~res:whole.exp_type loc { hstmts = []; hexp = Atom l.name; hmty; hoty = l.loty } args
    | Texp_ident (p, _, vd)
      when (match Prov.lookup p with Some ("nets.ml", "lookup") -> true | _ -> false)
           && List.length args = 2
           && (match Types.get_desc (expand whole.exp_type) with
               | Types.Tconstr (_, [ e ], _) -> is_gconv_tuple e
               | _ -> false) ->
        (* a rewrite net holds GconvOf structs: its elements, OCaml's
           `(priority, conv)` pairs, are made pairs where they leave it *)
        let h = global_head loc p vd in
        let ss, x, ty = apply_head ~res:whole.exp_type loc { h with hmty = refine h.hmty (mty_of f.exp_type) } args in
        adapt_to ?expect (ss, Call (Atom "@simp.gconv_pairs", [ x ]), ty)
    | Texp_ident (p, _, vd) ->
        let h = global_head loc p vd in
        let h = closure_net_variant p f.exp_type h in
        apply_head ?expect ~res:whole.exp_type loc { h with hmty = refine h.hmty (mty_of f.exp_type) } args
    | _ ->
        if args = [] then unsupported loc "value";
        let ss, x, ty = lower f in
        apply_head ?expect ~res:whole.exp_type loc { hstmts = ss; hexp = x; hmty = ty; hoty = Some f.exp_type } args

  (* nets.ml's enter/merge_nets on a net of functions: the nets package's
     _fn variants (MoonBit closures cannot implement NetCompare) *)
  and closure_net_variant p fty h =
    match Prov.lookup p, h.hexp with
    | Some ("nets.ml", "enter"), Atom _
      when (let rec result t = match arrow t with Some (_, b) -> result b | None -> t in
            match Types.get_desc (expand (result fty)) with
            | Types.Tconstr (_, [ a ], _) -> is_gconv_tuple a
            | _ -> false) ->
        (* a `(priority, conv)` pair entered into a rewrite net
           (Jordan/tactics_ext2.ml): simp makes the GconvOf *)
        (match M.find ~root:!Names.root "simp" "enter_gconv" with
         | Some decl -> { h with hexp = Atom "@simp.enter_gconv"; hmty = mty_of_decl decl }
         | None -> h)
    | Some ("nets.ml", ("enter" | "merge_nets")), Atom q ->
        let rec result t = match arrow t with Some (_, b) -> result b | None -> t in
        let elem_is_fn =
          match Types.get_desc (expand (result fty)) with
          | Types.Tconstr (_, [ a ], _) ->
              (* through abbreviations too: a `conv net` (Examples/cooper.ml).
                 A tuple holding a function ((term -> bool) * 'a in
                 Examples/holby.ml) cannot implement NetCompare either:
                 such elements are compared by identity as a whole, where
                 OCaml compares the components (it differs only when the
                 same closure is stored with equal other components) *)
              let rec holds_fn t =
                match Types.get_desc (Ctype.expand_head (env ()) t) with
                | Types.Tarrow _ -> true
                | Types.Ttuple ts -> List.exists holds_fn ts
                (* a polymorphic element (`enter [] (tm, x) net` at 'a):
                   nothing says it is comparable *)
                | Types.Tvar _ -> true
                | _ -> false
              in
              not (is_gconv_tuple a) && holds_fn a
          | _ -> false
        in
        if elem_is_fn then { h with hexp = Atom (q ^ "_fn") } else h
    | _ -> h

  (* Apply a head to OCaml arguments (source order). *)
  and note_bounds (args : expression list) =
    List.iter (fun a -> List.iter (fun v -> Hashtbl.replace bound_tyvars v ()) (tyvars_of_text (show_ty a.exp_type))) args

  and apply_head ?expect ?res loc h args =
    (match h.hexp with
     | Atom q when List.mem q !group_members && !current_fn <> "" ->
         (* a call within a recursive group: resolved after the group *)
         pending_calls := (!current_fn, q, h.hmty) :: !pending_calls
     | _ -> ());
    (match h.hexp with
     | Atom q when Hashtbl.mem fn_bounds q ->
         let bs, decl = Hashtbl.find fn_bounds q in
         List.iter
           (fun (v, t) -> if List.mem v bs then List.iter (fun w -> Hashtbl.replace bound_tyvars w ()) (mty_tyvars t []))
           (inst_pairs decl h.hmty [])
     | Atom q when String.length q > 1 && q.[0] = '@' ->
         let q = match String.index_opt q '(' with Some i -> String.sub q 0 i | None -> q in
         let fq = String.sub q 1 (String.length q - 1) in
         if Hashtbl.mem M.bounded_fns fq then begin
           (* key-based functions bound only their key *)
           match fq with
           | "lib.assoc" | "lib.rev_assoc" | "lib.list_assoc" | "lib.list_mem_assoc" | "lib.list_remove_assoc"
           | "lib.apply" | "lib.applyd" | "lib.defined" | "lib.undefine" | "lib.tryapplyd" | "lib.update"
           | "lib.single" ->
               (match args with a :: _ -> note_bounds [ a ] | [] -> ())
           | _ -> note_bounds args
         end
     | _ -> ());
    (* Plan the stages. A MoonBit group of k parameters takes the fewest
       OCaml arguments whose units sum to k: an argument is one unit, or a
       tuple spread into its components (spreading left to right as
       needed). The declared OCaml type gives the argument types. *)
    let rec oparams t n =
      if n = 0 then []
      else match t with
        | Some t -> (match arrow t with Some (a, b) -> Some a :: oparams (Some b) (n - 1) | None -> [])
        | None -> List.init n (fun _ -> None)
    in
    let rec advance n t = if n = 0 then t else match t with Some t -> (match arrow t with Some (_, b) -> advance (n - 1) (Some b) | None -> None) | None -> None in
    (* the unit count of each OCaml argument of a group of MoonBit
       parameters `ps`, decided from the declared argument types: exactly k
       units; a tuple argument is spread unless the MoonBit parameter at its
       position is a tuple of that size *)
    let align ps otys =
      let k = List.length ps in
      let rec go pos otys acc =
        if pos = k then Some (List.rev acc)
        else
          match otys with
          | [] -> None
          | o :: rest ->
              let sz = match o with Some a -> tuple_size a | None -> 0 in
              let tuple_param = match List.nth ps pos with M.Tuple ts -> List.length ts = sz | _ -> false in
              let options = if sz > 1 && not tuple_param then [ sz; 1 ] else if sz > 1 then [ 1; sz ] else [ 1 ] in
              List.fold_left
                (fun found u -> match found with Some _ -> found | None -> if pos + u <= k then go (pos + u) rest (u :: acc) else None)
                None options
      in
      go 0 otys []
    in
    let rec plan mty oty args acc =
      match args with
      | [] -> (List.rev acc, mty)
      | _ ->
          (match mty with
           | M.Fun ([], r, _) -> plan r (advance 1 oty) (List.tl args) (`Unit (List.hd args) :: acc)
           | M.Fun (ps, r, raises) ->
               let k = List.length ps in
               let units =
                 match align ps (oparams oty k) with
                 | Some u -> u
                 | None -> List.init k (fun _ -> 1)
               in
               let n = List.length units in
               let rec take n l = if n = 0 then ([], l) else match l with [] -> ([], []) | x :: xs -> let a, b = take (n - 1) xs in (x :: a, b) in
               let now, rest = take n args in
               let items = List.mapi (fun i a -> (a, List.nth units i)) now in
               if List.length now < n then
                 let used = List.fold_left (fun acc (_, u) -> acc + u) 0 items in
                 (List.rev (`Partial (ps, items) :: acc), M.Fun (List.filteri (fun i _ -> i >= used) ps, r, raises))
               else plan r (advance n oty) rest (`Units (ps, items) :: acc)
           | _ -> unsupported loc "too many arguments for %s" (M.show mty))
    in
    let stages, result_mty = plan h.hmty h.hoty args [] in
    (* every argument (or tuple component) is a slot with an id; slots are
       scheduled in OCaml evaluation order: arguments right to left (tuple
       components right to left), then the head *)
    let next = ref 0 in
    let slots = Hashtbl.create 8 in   (* id -> (stage, (stmts, exp)) *)
    let slot si (ss, x) = let id = !next in incr next; Hashtbl.replace slots id (si, (ss, x)); id in
    let low p a = let ss, x, _ = lower ~expect:(refine p (mty_of a.exp_type)) a in (ss, x) in
    let lower_items si ps items =
      let pos = ref 0 in
      List.map
        (fun (a, u) ->
          let mine = List.filteri (fun i _ -> i >= !pos && i < !pos + u) ps in
          pos := !pos + u;
          if u = 1 then `One (slot si (low (List.hd mine) a))
          else
            match a.exp_desc with
            | Texp_tuple comps when List.length comps = u ->
                `Comps (List.map2 (fun p c -> slot si (low p c)) mine comps)
            | _ -> `Whole (u, slot si (low (M.Tuple mine) a)))
        items
    in
    let stage_args =
      List.mapi
        (fun si st ->
          match st with
          | `Unit a ->
              (* the argument is evaluated for its effects only *)
              let ss, x, _ = lower a in
              `LUnit (slot si (ss @ (if ordered x then [ Do x ] else []), Atom "()"))
          | `Units (ps, items) -> `LUnits (lower_items si ps items)
          | `Partial (ps, items) -> `LPartial (ps, lower_items si ps items))
        stages
    in
    let item_ids = function `One id -> [ id ] | `Comps ids -> List.rev ids | `Whole (_, id) -> [ id ] in
    let per_arg =
      List.concat_map
        (function
          | `LUnit id -> [ [ id ] ]
          | `LUnits items | `LPartial (_, items) -> List.map item_ids items)
        stage_args
    in
    let head_id = slot (-1) (h.hstmts, h.hexp) in
    let order = List.concat (List.rev per_arg) @ [ head_id ] in
    let first_full = match stages with (`Units _ | `Unit _) :: _ -> true | _ -> false in
    (* a whole-tuple argument is projected several times: never inline *)
    let whole_ids =
      List.concat_map
        (function
          | `LUnits items | `LPartial (_, items) -> List.filter_map (function `Whole (_, id) -> Some id | _ -> None) items
          | _ -> [])
        stage_args
    in
    let inline_ok i =
      let id = List.nth order i in
      let si, _ = Hashtbl.find slots id in
      (not (List.mem id whole_ids)) && (si = -1 || (si = 0 && first_full))
    in
    let stmts, exps = schedule ~inline_ok (List.map (fun id -> snd (Hashtbl.find slots id)) order) in
    let value = Hashtbl.create 8 in
    List.iter2 (fun id x -> Hashtbl.replace value id x) order exps;
    let get id = Hashtbl.find value id in
    let item_exps = function
      | `One id -> [ get id ]
      | `Comps ids -> List.map get ids
      | `Whole (k, id) -> let t = get id in List.init k (fun i -> Field (t, i))
    in
    let rec build v = function
      | [] -> ([], v)
      | `LUnit _ :: rest -> build (Call (v, [])) rest
      | `LUnits items :: rest -> build (Call (v, List.concat_map item_exps items)) rest
      | `LPartial (ps, items) :: _ ->
          (* the completed stages run now, not when the closure is called *)
          let ss, v = hoist ([], v) in
          let supplied = List.concat_map item_exps items in
          let missing = List.filteri (fun i _ -> i >= List.length supplied) ps in
          let names = List.map (fun _ -> fresh "x") missing in
          (ss, Lam (List.map2 param names missing, ([], Call (v, supplied @ List.map (fun n -> Atom n) names))))
    in
    let ss, e = build (get head_id) stage_args in
    (* a function result with no expected type takes the canonical
       (curried) type of its OCaml type *)
    let expect =
      match expect, result_mty with
      | Some _, _ -> expect
      | None, M.Fun _ -> Option.map mty_of res
      | None, _ -> None
    in
    adapt_to ?expect (stmts @ ss, e, result_mty)

  (* --- Stdlib primitives --- *)

  (* A function argument of a primitive implemented by a lib function
     taking a k-parameter closure (`Hashtbl.fold f`): its expected type. *)
  and prim_fn_arity name i =
    match name, i with
    | "Hashtbl.fold", 0 -> 3
    | ("Hashtbl.iter" | "Array.fold_left"), 0 -> 2
    | "Array.iteri", 0 -> 2
    | _ -> 0

  and uncurry_mty k t =
    let rec take n t acc =
      if n = 0 then Some (M.Fun (List.rev acc, t, true))
      else match t with M.Fun ([ p ], r, _) -> take (n - 1) r (p :: acc) | _ -> None
    in
    take k t []

  and prim_fn_arg name i (a : expression) =
    let k = prim_fn_arity name i in
    if k = 0 then None else uncurry_mty k (mty_of a.exp_type)

  (* an argument of a primitive, adapted to the closure arity its lib
     function takes (whatever expression produced it) *)
  and prim_arg name i (a : expression) =
    match prim_fn_arg name i a with
    | Some want ->
        let ss, x, t = lower ~expect:want a in
        adapt (ss, x) t want
    | None -> let ss, x, _ = lower a in (ss, x)

  and lower_prim ?expect whole name f args =
    let constant_ctor c e =
      match e.exp_desc with Texp_construct (_, cd, []) -> cd.Types.cstr_name = c | _ -> false
    in
    match name, args with
    | ("=" | "<>"), [ a; b ]
      when List.exists (fun e -> constant_ctor "[]" e || constant_ctor "None" e) [ a; b ] ->
        (* comparing with `[]` or `None` looks at the other side's
           constructor only (OCaml compares no elements: a list of
           functions is fine), so no OCompare bound *)
        let k, other = if constant_ctor "[]" a || constant_ctor "None" a then (a, b) else (b, a) in
        let ss, x, _ = lower other in
        let test =
          if constant_ctor "[]" k then Call (Atom "@list.List::is_empty", [ x ])
          else Atom ("(" ^ string_of_exp x ^ " is None)")
        in
        adapt_to ?expect (ss, (if name = "=" then test else Not test), M.Named ("Bool", []))
    | ("fst" | "snd"), [ a ] ->
        (* the component's own type (an `Int` of a hand-ported tuple is
           widened by `lower`) *)
        let i = if name = "fst" then 0 else 1 in
        let ss, x, t = lower a in
        let comp = match t with M.Tuple ts when List.length ts = 2 -> List.nth ts i | _ -> mty_of whole.exp_type in
        adapt_to ?expect (ss, Field (x, i), comp)
    | _ ->
    let loc = whole.exp_loc in
    let arity, mk =
      match name with
      | "fst" -> (1, fun [ a ] _ -> Field (a, 0))
      | "snd" -> (1, fun [ a ] _ -> Field (a, 1))
      | "=" -> (2, fun [ a; b ] _ -> Binop ("==", a, b))
      | "<>" -> (2, fun [ a; b ] _ -> Binop ("!=", a, b))
      | "==" -> (2, fun [ a; b ] _ -> Call (Atom "physical_equal", [ a; b ]))
      | "!=" -> (2, fun [ a; b ] _ -> Not (Call (Atom "physical_equal", [ a; b ])))
      | ("<" | ">" | "<=" | ">=") as op ->
          (2, fun [ a; b ] tys ->
             if is_int (List.hd tys) then Binop (op, a, b)
             else Binop (op, Call (Atom "@lib.compare", [ a; b ]), Atom "0"))
      (* ints: 63-bit arithmetic on Int64 (lib/int63.mbt) *)
      | "+" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.add63", [ a; b ]))
      | "-" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.sub63", [ a; b ]))
      | "*" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.mul63", [ a; b ]))
      | "/" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.div63", [ a; b ]))
      | "mod" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.mod63", [ a; b ]))
      | "compare" -> (2, fun [ a; b ] _ -> widen (Call (Atom "@lib.compare", [ a; b ])))
      (* lib's reproduction of OCaml's hash (Jordan/tactics_ext2.ml) *)
      | "Hashtbl.hash" -> (1, fun [ a ] _ -> widen (Call (Atom "@lib.hash", [ a ])))
      | ("+." | "-." | "*." | "/.") as op -> (2, fun [ a; b ] _ -> Binop (String.sub op 0 1, a, b))
      | "~-." -> (1, fun [ a ] _ -> Call (Atom "@lib.float_neg", [ a ]))
      | "float_of_int" -> (1, fun [ a ] _ -> Call (Atom "Int64::to_double", [ a ]))
      | "sqrt" | "float_sqrt" -> (1, fun [ a ] _ -> Call (Atom "Double::sqrt", [ a ]))
      | "floor" -> (1, fun [ a ] _ -> Call (Atom "Double::floor", [ a ]))
      | "ceil" -> (1, fun [ a ] _ -> Call (Atom "Double::ceil", [ a ]))
      | "ldexp" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.float_ldexp", [ a; b ]))
      | "abs_float" | "float_fabs" -> (1, fun [ a ] _ -> Call (Atom "Double::abs", [ a ]))
      | "max_int" -> (0, fun [] _ -> Atom "@lib.max_int63")
      | "min_int" -> (0, fun [] _ -> Atom "@lib.min_int63")
      | "int_of_float" | "truncate" -> (1, fun [ a ] _ -> Call (Atom "@lib.norm63", [ Call (Atom "Double::to_int64", [ a ]) ]))
      | ("min" | "max") as op ->
          (* `let min a b = if a <= b then a else b` (polymorphic compare) *)
          (2, fun [ a; b ] tys ->
             let le =
               if is_int (List.hd tys) then Binop ("<=", a, b)
               else Binop ("<=", Call (Atom "@lib.compare", [ a; b ]), Atom "0")
             in
             if op = "min" then If (le, ([], a), ([], b))
             else
               (* `let max a b = if a >= b then a else b` *)
               let ge =
                 if is_int (List.hd tys) then Binop (">=", a, b)
                 else Binop (">=", Call (Atom "@lib.compare", [ a; b ]), Atom "0")
               in
               If (ge, ([], a), ([], b)))
      | "~-" -> (1, fun [ a ] _ -> Call (Atom "@lib.neg63", [ a ]))
      | "abs" -> (1, fun [ a ] _ -> Call (Atom "@lib.abs63", [ a ]))
      | "succ" -> (1, fun [ a ] _ -> Call (Atom "@lib.succ63", [ a ]))
      | "pred" -> (1, fun [ a ] _ -> Call (Atom "@lib.pred63", [ a ]))
      | "^" -> (2, fun [ a; b ] _ -> Binop ("+", a, b))
      | "not" -> (1, fun [ a ] _ -> Not a)
      | "@" -> (2, fun [ a; b ] _ -> Concat (a, b))
      | "failwith" -> (1, fun [ a ] _ -> Raise (Call (Atom "Failure", [ a ])))
      | "raise" ->
          (* `raise (failwith m)`: the argument raises before `raise`
             does (Jordan/num_ext_gcd.ml) *)
          (1, fun [ a ] _ -> match a with Raise _ -> a | _ -> Raise a)
      | "ignore" -> (1, fun [ a ] _ -> Call (Atom "ignore", [ a ]))
      | "string_of_int" -> (1, fun [ a ] _ -> Call (Atom "Int64::to_string", [ a ]))
      | "string_of_float" -> (1, fun [ a ] _ -> Call (Atom "@lib.string_of_float", [ a ]))
      | "!" -> (1, fun [ a ] _ -> Deref a)
      | "ref" -> (1, fun [ a ] _ -> RefNew a)
      | ":=" -> (2, fun [ a; b ] _ -> Blk ([ Assign (a, b) ], Atom "()"))
      | "Format.print_string" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.print_string", [ a ]))
      | "Format.print_as" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.std_formatter.print_as", [ narrow a; b ]))
      | "Format.print_float" ->
          (* Format prints a float as `string_of_float` does *)
          (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.print_string", [ Call (Atom "@lib.string_of_float", [ a ]) ]))
      | "Format.print_newline" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.print_newline", [])))
      | "Format.print_flush" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.print_flush", [])))
      | "Format.print_int" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.print_string", [ Call (Atom "Int64::to_string", [ a ]) ]))
      | "print_string" -> (1, fun [ a ] _ -> Call (Atom "@pp.print_string", [ a ]))
      | "print_endline" -> (1, fun [ a ] _ -> Call (Atom "@pp.print_string", [ Binop ("+", a, Atom "\"\\n\"") ]))
      | "invalid_arg" -> (1, fun [ a ] _ -> Raise (Call (Atom "@num.InvalidArgument", [ a ])))
      | "lsl" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.lsl63", [ a; b ]))
      | "asr" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.asr63", [ a; b ]))
      | "lsr" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.lsr63", [ a; b ]))
      | "land" -> (2, fun [ a; b ] _ -> Binop ("&", a, b))
      | "lor" -> (2, fun [ a; b ] _ -> Binop ("|", a, b))
      | "lxor" -> (2, fun [ a; b ] _ -> Binop ("^", a, b))
      | "lnot" -> (1, fun [ a ] _ -> Call (Atom "@lib.lnot63", [ a ]))
      | "log" -> (1, fun [ a ] _ -> Call (Atom "@lib.float_log", [ a ]))
      | "frexp" -> (1, fun [ a ] _ -> Call (Atom "@lib.float_frexp", [ a ]))
      | "**" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.float_pow", [ a; b ]))
      | "int_of_string" -> (1, fun [ a ] _ -> Call (Atom "@lib.int63_of_string", [ a ]))
      | "String.length" -> (1, fun [ a ] _ -> widen (Call (Atom "@lib.string_length", [ a ])))
      | "String.get" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.ocaml_string_get", [ a; narrow b ]))
      | "String.sub" -> (3, fun [ a; b; c ] _ -> Call (Atom "@lib.string_sub", [ a; narrow b; narrow c ]))
      | "String.make" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.string_make", [ a; b ]))
      | "Sys.time" ->
          (* the clock lib.ml's `time` reads (0 on wasm) *)
          (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "(@lib.cpu_time.val)", [])))
      | "Sys.command" -> (1, fun [ a ] _ -> widen (Call (Atom "@lib.sys_command", [ a ])))
      | "Sys.remove" -> (1, fun [ a ] _ -> Call (Atom "@lib.sys_remove", [ a ]))
      | "Sys.file_exists" -> (1, fun [ a ] _ -> Call (Atom "@lib.sys_file_exists", [ a ]))
      | "Filename.temp_file" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.temp_file", [ a; b ]))
      | "String.escaped" -> (1, fun [ a ] _ -> Call (Atom "@lib.string_escaped", [ a ]))
      | "String.concat" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.string_concat", [ a; b ]))
      | "Array.make" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.array_make", [ a; b ]))
      | "Array.get" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.array_get", [ a; narrow b ]))
      | "Array.set" -> (3, fun [ a; b; c ] _ -> Call (Atom "@lib.array_set", [ a; narrow b; c ]))
      | "Array.length" -> (1, fun [ a ] _ -> widen (Call (Atom "@lib.array_length", [ a ])))
      | "Random.int" -> (1, fun [ a ] _ -> Call (Atom "@lib.random_int", [ a ]))
      | "Random.init" -> (1, fun [ a ] _ -> Call (Atom "@lib.random_init", [ a ]))
      | "Random.bits" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@lib.random_bits", [])))
      | "incr" -> (1, fun [ a ] _ -> Call (Atom "@lib.incr", [ a ]))
      | "decr" -> (1, fun [ a ] _ -> Call (Atom "@lib.decr", [ a ]))
      | "Char.chr" | "char_of_int" -> (1, fun [ a ] _ -> Call (Atom "@lib.char_chr", [ narrow a ]))
      | "Char.code" | "int_of_char" -> (1, fun [ a ] _ -> widen (Call (Atom "Char::to_int", [ a ])))
      | "Format.std_formatter" -> (0, fun [] _ -> Atom "@pp.std_formatter")
      | "Lazy.force" -> (1, fun [ a ] _ -> Call (Atom "@lib.lazy_force", [ a ]))
      | "Hashtbl.create" -> (1, fun [ a ] _ -> Call (Atom "@lib.hashtbl_create", [ narrow a ]))
      | "Hashtbl.clear" -> (1, fun [ a ] _ -> Call (Atom "@lib.hashtbl_clear", [ a ]))
      | "Hashtbl.reset" -> (1, fun [ a ] _ -> Call (Atom "@lib.hashtbl_reset", [ a ]))
      | "Hashtbl.length" -> (1, fun [ a ] _ -> widen (Call (Atom "@lib.hashtbl_length", [ a ])))
      | "Hashtbl.find_all" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.hashtbl_find_all", [ a; b ]))
      | "Hashtbl.fold" -> (3, fun [ a; b; c ] _ -> Call (Atom "@lib.hashtbl_fold", [ a; b; c ]))
      | "Hashtbl.iter" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.hashtbl_iter", [ a; b ]))
      | "Array.fold_left" -> (3, fun [ a; b; c ] _ -> Call (Atom "@lib.array_fold_left", [ a; b; c ]))
      | "Array.init" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.array_init", [ a; b ]))
      | "Array.iteri" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.array_iteri", [ a; b ]))
      | "Array.iter" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.array_iter", [ a; b ]))
      | "Array.fill" -> (4, fun [ a; b; c; d ] _ -> Call (Atom "@lib.array_fill", [ a; narrow b; narrow c; d ]))
      | "Array.map" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.array_map", [ a; b ]))
      | "Array.of_list" -> (1, fun [ a ] _ -> Call (Atom "@lib.array_of_list", [ a ]))
      | "Array.to_list" -> (1, fun [ a ] _ -> Call (Atom "@lib.array_to_list", [ a ]))
      | "Hashtbl.add" -> (3, fun [ a; b; c ] _ -> Call (Atom "@lib.hashtbl_add", [ a; b; c ]))
      | "Hashtbl.replace" -> (3, fun [ a; b; c ] _ -> Call (Atom "@lib.hashtbl_replace", [ a; b; c ]))
      | "Hashtbl.find" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.hashtbl_find", [ a; b ]))
      | "Hashtbl.find_opt" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.hashtbl_find_opt", [ a; b ]))
      | "Hashtbl.mem" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.hashtbl_mem", [ a; b ]))
      | "Hashtbl.remove" -> (2, fun [ a; b ] _ -> Call (Atom "@lib.hashtbl_remove", [ a; b ]))
      | "Format.pp_print_char" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.Formatter::print_string", [ a; Call (Atom "Char::to_string", [ b ]) ]))
      | "Format.pp_print_string" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.Formatter::print_string", [ a; b ]))
      | "Format.pp_print_int" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.Formatter::print_string", [ a; Call (Atom "Int64::to_string", [ b ]) ]))
      | "Format.pp_print_space" -> (2, fun [ a; b ] _ -> Blk ((if ordered b then [ Do b ] else []), Call (Atom "@pp.Formatter::print_space", [ a ])))
      | "Format.pp_print_cut" -> (2, fun [ a; b ] _ -> Blk ((if ordered b then [ Do b ] else []), Call (Atom "@pp.Formatter::print_cut", [ a ])))
      | "Format.pp_print_newline" -> (2, fun [ a; b ] _ -> Blk ((if ordered b then [ Do b ] else []), Call (Atom "@pp.Formatter::print_newline", [ a ])))
      | "Format.pp_print_flush" -> (2, fun [ a; b ] _ -> Blk ((if ordered b then [ Do b ] else []), Call (Atom "@pp.Formatter::print_flush", [ a ])))
      | "Format.pp_print_break" -> (3, fun [ a; b; c ] _ -> Call (Atom "@pp.Formatter::print_break", [ a; narrow b; narrow c ]))
      | "Format.pp_open_box" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.Formatter::open_box", [ a; narrow b ]))
      | "Format.pp_open_hvbox" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.Formatter::open_hvbox", [ a; narrow b ]))
      | "Format.pp_open_vbox" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.Formatter::open_vbox", [ a; narrow b ]))
      | "Format.pp_close_box" -> (2, fun [ a; b ] _ -> Blk ((if ordered b then [ Do b ] else []), Call (Atom "@pp.Formatter::close_box", [ a ])))
      | "Format.print_break" -> (2, fun [ a; b ] _ -> Call (Atom "@pp.std_formatter.print_break", [ narrow a; narrow b ]))
      | "Format.print_space" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.print_space", [])))
      | "Format.print_cut" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.print_cut", [])))
      | "Format.open_box" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.open_box", [ narrow a ]))
      | "Format.open_vbox" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.open_vbox", [ narrow a ]))
      | "Format.open_hvbox" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.open_hvbox", [ narrow a ]))
      | "Format.open_hovbox" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.open_hovbox", [ narrow a ]))
      | "Format.open_hbox" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.open_hbox", [])))
      | "Format.close_box" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.close_box", [])))
      | "&&" | "||" -> (2, fun _ _ -> assert false)
      | _ -> unsupported loc "Stdlib.%s" name
    in
    let arg_tys = List.map (fun a -> a.exp_type) args in
    (match name with
     | "Hashtbl.add" | "Hashtbl.replace" | "Hashtbl.find" | "Hashtbl.find_opt" | "Hashtbl.mem" | "Hashtbl.remove" | "Hashtbl.find_all" ->
         (match args with _ :: k :: _ -> note_bounds [ k ] | _ -> ())
     | "=" | "<>" | "compare" | "<" | ">" | "<=" | ">=" | "min" | "max" | "Hashtbl.hash" ->
         note_bounds args;
         (* a partial application: the parameter types of its instance *)
         if List.length args < arity then
           List.iter (fun v -> Hashtbl.replace bound_tyvars v ()) (tyvars_of_text (show_ty f.exp_type))
     | _ -> ());
    if (name = "&&" || name = "||") && List.length args = 2 then begin
      let a, b = (List.nth args 0, List.nth args 1) in
      let ss, x, _ = lower a in
      let bb = lower_block b in
      match bb with
      | [], y -> (ss, Binop (name, x, y), M.Named ("Bool", []))
      | _ ->
          if name = "&&" then (ss, If (x, bb, ([], Atom "false")), M.Named ("Bool", []))
          else (ss, If (x, ([], Atom "true"), bb), M.Named ("Bool", []))
    end
    else if List.length args >= arity then begin
      let now = List.filteri (fun i _ -> i < arity) args in
      let rest = List.filteri (fun i _ -> i >= arity) args in
      if rest <> [] then begin
        (* the primitive returns a function, applied to the rest
           (`snd (hd l) f x`): as `(snd (hd l)) f x`, a head expression *)
        let rec result t n = if n = 0 then t else match arrow t with Some (_, b) -> result b (n - 1) | None -> unsupported loc "over-applied primitive %s" name in
        let inner_ty = result f.exp_type arity in
        let inner = { whole with exp_desc = Texp_apply (f, List.map (fun a -> (Asttypes.Nolabel, Some a)) now); exp_type = inner_ty } in
        let ss, x, ty = lower inner in
        apply_head ?expect ~res:whole.exp_type loc { hstmts = ss; hexp = x; hmty = ty; hoty = Some inner_ty } rest
      end else
      let lowered = List.mapi (fun i a -> prim_arg name i a) now in
      let stmts, xs =
        if name = "min" || name = "max" then
          (* each argument is used twice: evaluate both first *)
          let hs = List.map hoist (List.rev lowered) in
          (List.concat_map fst hs, List.map snd hs)
        else schedule (List.rev lowered)
      in
      let xs = List.rev xs in
      adapt_to ?expect (stmts, mk xs arg_tys, mty_of whole.exp_type)
    end
    else begin
      (* partial application: evaluate the supplied arguments, then a closure *)
      let rec has_optional t =
        match Types.get_desc (Ctype.expand_head whole.exp_env t) with
        | Types.Tarrow (Asttypes.Optional _, _, _, _) -> true
        | Types.Tarrow (_, _, r, _) -> has_optional r
        | _ -> false
      in
      if has_optional f.exp_type then unsupported loc "partial application of %s (optional arguments)" name;
      let lowered = List.mapi (fun i a -> hoist (prim_arg name i a)) args in
      let stmts = List.concat_map fst (List.rev lowered) in
      let supplied = List.map snd lowered in
      let missing = List.init (arity - List.length args) (fun _ -> fresh "x") in
      let tys = (let rec params t n = if n = 0 then [] else match arrow t with Some (a, b) -> a :: params b (n - 1) | None -> [] in params f.exp_type arity) in
      let missing_args =
        List.mapi
          (fun j n ->
            let i = List.length args + j in
            match List.nth_opt tys i |> Option.map (fun t -> (t, prim_fn_arity name i)) with
            | Some (t, k) when k > 0 ->
                (match uncurry_mty k (mty_of t) with
                 | Some want -> snd (adapt ([], Atom n) (mty_of t) want)
                 | None -> Atom n)
            | _ -> Atom n)
          missing
      in
      let body = mk (supplied @ missing_args) (arg_tys @ List.filteri (fun i _ -> i >= List.length args) tys) in
      let missing_tys = List.filteri (fun i _ -> i >= List.length args) tys in
      (* typed closures (they may not raise): each one's result is the
         rest of the partial application's curried type *)
      let rec curry ns ts cur = match ns, ts with
        | [], _ -> body
        | n :: ns, t :: ts ->
            (match cur with
             | M.Fun ([ _ ], r, _) -> typed_lam [ param n (mty_of t) ] r ([], curry ns ts r)
             | _ -> Lam ([ param n (mty_of t) ], ([], curry ns ts cur)))
        | n :: ns, [] -> Lam ([ n ], ([], curry ns [] cur)) in
      let curry ns = curry ns missing_tys (mty_of whole.exp_type) in
      adapt_to ?expect (stmts, curry missing, mty_of whole.exp_type)
    end

  (* --- printf with a literal format: %s, %d, %i, %!, %% --- *)

  and lower_printf ?expect whole name args =
    let loc = whole.exp_loc in
    match args with
    | fmt :: rest ->
        let text =
          let rec find e =
            match e.exp_desc with
            | Texp_construct (_, cd, [ _; s ]) when cd.Types.cstr_name = "Format" ->
                (match s.exp_desc with Texp_constant (Asttypes.Const_string (t, _, _)) -> t | _ -> find s)
            | _ -> unsupported loc "printf format"
          in
          find fmt
        in
        (* the conversions taking an argument *)
        let convs =
          let acc = ref [] and i = ref 0 in
          while !i < String.length text - 1 do
            if text.[!i] = '%' then begin
              (match text.[!i + 1] with 's' -> acc := "String" :: !acc | 'd' | 'i' -> acc := "Int64" :: !acc | _ -> ());
              i := !i + 2
            end else incr i
          done;
          List.rev !acc
        in
        (* the arguments are evaluated right to left *)
        let lowered = List.map (fun a -> let ss, x, _ = lower a in (ss, x)) rest in
        let partial = List.length rest < List.length convs in
        (* with a flush (`%!`) the output is several calls: every argument
           is evaluated before the first *)
        let flushes =
          let rec go i = i < String.length text - 1 && (if text.[i] = '%' then text.[i + 1] = '!' || go (i + 2) else go (i + 1)) in
          go 0
        in
        let stmts, xs =
          if partial || flushes then
            (* a partial application: the given arguments are evaluated now *)
            let hs = List.map hoist (List.rev lowered) in
            (List.concat_map fst hs, List.map snd hs)
          else schedule (List.rev lowered)
        in
        let missing = List.filteri (fun i _ -> i >= List.length rest) convs |> List.map (fun t -> (fresh "x", t)) in
        let xs = ref (List.rev xs @ List.map (fun (n, _) -> Atom n) missing) in
        let next () = match !xs with x :: r -> xs := r; x | [] -> unsupported loc "printf arguments" in
        (* the output is a sequence of strings and flushes (`%!`) *)
        let pieces = ref [] and buf = Buffer.create 16 and items = ref [] in
        let lit () = if Buffer.length buf > 0 then (pieces := Atom (string_lit (Buffer.contents buf)) :: !pieces; Buffer.clear buf) in
        let concat ps = match List.rev ps with [] -> Atom "\"\"" | p :: ps -> List.fold_left (fun a b -> Binop ("+", a, b)) p ps in
        let close () = lit (); if !pieces <> [] then (items := `Str (concat !pieces) :: !items; pieces := []) in
        let n = String.length text in
        let i = ref 0 in
        while !i < n do
          (if text.[!i] = '%' && !i + 1 < n then begin
             (match text.[!i + 1] with
              | 's' -> lit (); pieces := next () :: !pieces
              | 'd' | 'i' -> lit (); pieces := Call (Atom "Int64::to_string", [ next () ]) :: !pieces
              | '!' -> close (); items := `Flush :: !items
              | '%' -> Buffer.add_char buf '%'
              | c -> unsupported loc "printf conversion %%%c" c);
             i := !i + 2
           end
           else if text.[!i] = '@' && String.sub name 0 7 = "Format." then
             (* pretty-printing directives need a formatter *)
             unsupported loc "Format directive @"
           else (Buffer.add_char buf text.[!i]; incr i))
        done;
        close ();
        let items = List.rev !items in
        let str = concat (List.rev (List.filter_map (function `Str e -> Some e | `Flush -> None) items)) in
        let curry (body, ty) =
          List.fold_right
            (fun (n, t) (b, ty) -> (Lam ([ n ^ " : " ^ t ], ([], b)), M.Fun ([ M.Named (t, []) ], ty, true)))
            missing (body, ty)
        in
        if name = "Printf.sprintf" || name = "Format.sprintf" then
          if missing = [] then adapt_to ?expect (stmts, str, M.Named ("String", []))
          else let e, t = curry (str, M.Named ("String", [])) in adapt_to ?expect (stmts, e, t)
        else
          let out = if name = "Printf.printf" then "@pp.print_string" else "@pp.std_formatter.print_string" in
          let flush = if name = "Printf.printf" then "@pp.flush_stdout_backlog" else "@pp.std_formatter.print_flush" in
          let calls = List.map (function `Str e -> Do (Call (Atom out, [ e ])) | `Flush -> Do (Call (Atom flush, []))) items in
          let calls = if calls = [] then [ Do (Call (Atom out, [ Atom "\"\"" ])) ] else calls in
          if missing = [] then (stmts, Blk (calls, Atom "()"), M.Named ("Unit", []))
          else let e, t = curry (Blk (calls, Atom "()"), M.Named ("Unit", [])) in adapt_to ?expect (stmts, e, t)
    | [] -> unsupported loc "printf"

  (* --- lib.ml combinators: o, I, K, C, W, F_F --- *)

  and lower_combinator ?expect whole name f args =
    let loc = whole.exp_loc in
    let want = match expect with Some t -> t | None -> mty_of whole.exp_type in
    (* evaluate the supplied arguments right to left; none may stay inline
       when the result is a closure *)
    let lowered = List.map (fun a -> let ss, x, t = lower a in ((ss, x), t)) args in
    let evaluated = List.map (fun (sx, t) -> (hoist sx, t)) (List.rev lowered) in
    let stmts = List.concat_map (fun ((ss, _), _) -> ss) evaluated in
    let vals = List.rev_map (fun ((_, x), t) -> (x, t)) evaluated in
    let apply_val (x, t) xs = apply_values loc (x, t) xs in
    match name, vals with
    | "I", [ v ] -> adapt_to ?expect (stmts, fst v, snd v)
    | "K", [ v; _ ] -> adapt_to ?expect (stmts, fst v, snd v)
    | ("o" | "I" | "K" | "C" | "W" | "f_f_"), _ ->
        (* a closure in the wanted shape; the combinator's result is computed
           as soon as its own parameters have arrived, and further
           parameters are passed on to that result *)
        let arity = match name with "o" -> 3 | "I" -> 1 | "K" -> 2 | "C" -> 3 | "W" -> 2 | _ -> 3 in
        let needed = arity - List.length vals in
        let core all : stmt list * exp * M.ty =
          match name, all with
          | "o", [ fv; gv; x ] ->
              let ss1, gx, gt = apply_val gv [ x ] in
              let ss2, r, rt = apply_val fv [ (gx, gt) ] in
              (ss1 @ ss2, r, rt)
          | "I", [ (x, t) ] -> ([], x, t)
          | "K", [ (x, t); _ ] -> ([], x, t)
          | "C", [ fv; x; y ] -> apply_val fv [ y; x ]
          | "W", [ fv; x ] -> apply_val fv [ x; x ]
          | "f_f_", [ fv; gv; (p, _) ] ->
              (* `(f F_F g) (x, y) = f x, g y`: the tuple is evaluated right
                 to left *)
              let ssb, b, bt = apply_val gv [ (Field (p, 1), M.Named ("?", [])) ] in
              let ssb, b = hoist (ssb, b) in
              let ssa, a, at = apply_val fv [ (Field (p, 0), M.Named ("?", [])) ] in
              (ssb @ ssa, Tuple [ a; b ], M.Tuple [ at; bt ])
          | _ -> unsupported loc "combinator %s" name
        in
        let rec go wgs got : block =
          if List.length got >= needed then begin
            let now = List.filteri (fun i _ -> i < needed) got in
            let extra = List.filteri (fun i _ -> i >= needed) got in
            let ss1, v, vt = core (vals @ List.map (fun (x, t) -> (Atom x, t)) now) in
            let ss2, v, vt =
              if extra = [] then ([], v, vt)
              else apply_val (v, vt) (List.map (fun (x, t) -> (Atom x, t)) extra)
            in
            let rest_want = List.fold_right (fun g acc -> M.Fun (g, acc, true)) wgs (snd (groups want)) in
            adapt (ss1 @ ss2, v) vt rest_want
          end else
            match wgs with
            | [] -> unsupported loc "combinator %s needs %d more arguments" name needed
            | g :: gs ->
                let ps = List.map (fun t -> (fresh "x", t)) g in
                let ret = List.fold_right (fun g acc -> M.Fun (g, acc, true)) gs (snd (groups want)) in
                ([], typed_lam (List.map (fun (x, t) -> param x t) ps) ret (go gs (got @ ps)))
        in
        let wgs, _ = groups want in
        let ss, lam = go wgs [] in
        (stmts @ ss, lam, want)

  (* Apply an evaluated value of MoonBit type `t` to evaluated arguments,
     one OCaml argument per unit: a group of k > 1 parameters takes k
     arguments, or one k-tuple argument (spread). Completed stages and the
     arguments are bound before a partial closure is built. *)
  and apply_values loc (v, t) xs : stmt list * exp * M.ty =
    match xs with
    | [] -> ([], v, t)
    | _ ->
        (match t with
         | M.Fun (ps, r, raises) ->
             let k = List.length ps in
             (match xs with
              | (x, M.Tuple ts) :: rest when k > 1 && List.length ts = k ->
                  let ss, x = hoist ([], x) in
                  let args = List.mapi (fun i p -> snd (adapt ([], Field (x, i)) (List.nth ts i) p)) ps in
                  let ss2, e, ty = apply_values loc (Call (v, args), r) rest in
                  (ss @ ss2, e, ty)
              | _ when List.length xs >= k ->
                  let now = List.filteri (fun i _ -> i < k) xs in
                  let rest = List.filteri (fun i _ -> i >= k) xs in
                  let args = List.map2 (fun (x, xt) p -> snd (adapt ([], x) xt p)) now ps in
                  apply_values loc (Call (v, args), r) rest
              | _ ->
                  let ss, v = hoist ([], v) in
                  let hoisted = List.map (fun (x, xt) -> let ss, x = hoist ([], x) in (ss, (x, xt))) xs in
                  let ss = ss @ List.concat_map fst hoisted in
                  let xs = List.map snd hoisted in
                  let missing = List.filteri (fun i _ -> i >= List.length xs) ps in
                  let names = List.map (fun _ -> fresh "x") missing in
                  ( ss,
                    Lam (List.map2 param names missing, ([], Call (v, List.map fst xs @ List.map (fun n -> Atom n) names))),
                    M.Fun (missing, r, raises) ))
         | _ ->
             if Sys.getenv_opt "TRANSLATOR_DEBUG" <> None then
               Printf.eprintf "non-function %s : %s\n%!" (string_of_exp v) (match show_mty t with Some s -> s | None -> "?");
             unsupported loc "applying a non-function value")

  (* --- Constructors --- *)

  and lower_construct ?expect e cd args =
    let loc = e.exp_loc in
    match cd.Types.cstr_name, args with
    | "[]", [] -> ([], ListLit [], mty_of e.exp_type)
    | "::", [ _; _ ] ->
        (* a literal list [a; b; c] evaluates c, b, a *)
        let rec elems e =
          match e.exp_desc with
          | Texp_construct (_, cd, [ h; t ]) when cd.Types.cstr_name = "::" ->
              (match elems t with Some l -> Some (h :: l) | None -> None)
          | Texp_construct (_, cd, []) when cd.Types.cstr_name = "[]" -> Some []
          | _ -> None
        in
        let elt_expect = match expect with Some (M.Named (_, [ t ])) -> Some t | _ -> None in
        (match elems e with
         | Some es ->
             let lowered = List.map (fun x -> let ss, y, _ = lower ?expect:elt_expect x in (ss, y)) es in
             let stmts, xs = schedule (List.rev lowered) in
             (stmts, ListLit (List.rev xs), mty_of e.exp_type)
         | None ->
             let h, t = (List.nth args 0, List.nth args 1) in
             let ht = lower_block ?expect:elt_expect h in
             let tt = lower_block ?expect t in
             let stmts, xs = schedule [ tt; ht ] in
             (stmts, Prepend (List.nth xs 0, List.nth xs 1), mty_of e.exp_type))
    | ("()" | "true" | "false" | "None"), [] -> ([], Atom cd.Types.cstr_name, mty_of e.exp_type)
    | "Some", [ a ] -> let ss, x, _ = lower a in (ss, Call (Atom "Some", [ x ]), mty_of e.exp_type)
    | "Failure", [ a ] when predef_exn cd -> let ss, x, _ = lower a in (ss, Call (Atom "Failure", [ x ]), mty_of e.exp_type)
    | "Invalid_argument", [ a ] when predef_exn cd -> let ss, x, _ = lower a in (ss, Call (Atom "@num.InvalidArgument", [ x ]), mty_of e.exp_type)
    | "Noparse", [] -> ([], Atom "@parser.Noparse", mty_of e.exp_type)
    | "Unchanged", [] -> ([], Atom "@lib.Unchanged", mty_of e.exp_type)
    | "Not_found", [] when predef_exn cd -> ([], Atom "@lib.NotFound", mty_of e.exp_type)
    | name, [] when Hashtbl.mem own_ctors name -> ([], Atom (ctor_name ~cd name), mty_of e.exp_type)
    | name, args when Hashtbl.mem own_ctors name ->
        (* constructor arguments are evaluated right to left *)
        let lowered = List.map (fun a -> let ss, x, _ = lower a in (ss, x)) args in
        let stmts, xs = schedule (List.rev lowered) in
        (stmts, Call (Atom (ctor_name ~cd name), List.rev xs), mty_of e.exp_type)
    | name, _ -> unsupported loc "constructor %s" name

  (* --- Functions --- *)

  and lower_function ?expect e =
    let want = match expect with Some t -> t | None -> mty_of e.exp_type in
    let wgs, res = groups want in
    let loc = e.exp_loc in
    (* consume MoonBit groups against OCaml function nodes *)
    let rec go (fn : expression option) (body_val : (exp * M.ty) option) wgs =
      match wgs with
      | [] ->
          (match fn, body_val with
           | Some ({ exp_desc = Texp_function _; _ } as f), None when (match res with M.Fun _ -> false | _ -> true) ->
               unsupported f.exp_loc "function where a %s is expected" (M.show res)
           | Some f, None -> lower_block ~expect:res f
           | None, Some (v, _) -> ([], v)
           | _ -> assert false)
      | g :: gs ->
          let k = List.length g in
          let names = List.map (fun _ -> fresh "x") g in
          let atoms = List.combine names g in
          (match fn with
           | Some ({ exp_desc = Texp_function { cases; partial; _ }; _ } as f) ->
               let oty_param = match arrow f.exp_type with Some (a, _) -> Some a | None -> None in
               (* one tuple parameter spread over the group only when the
                  OCaml function does not take k curried parameters *)
               let rec arity t n = if n = 0 then 0 else match arrow t with Some (_, b) -> 1 + arity b (n - 1) | None -> 0 in
               (* spread when the OCaml parameter is a k-tuple and the
                  first MoonBit parameter is not itself such a tuple *)
               ignore arity;
               (* one tuple parameter spread over the group: the group is
                  exactly the tuple's components, or (for instances) the
                  first MoonBit parameter is not itself a k-tuple *)
               let tuple_mode =
                 k > 1
                 && (match oty_param with
                     | Some a when tuple_size a = k ->
                         (match mty_of (expand a) with M.Tuple cs when cs = g -> true | _ -> false)
                         || (match List.hd g with M.Tuple ts -> List.length ts <> k | _ -> true)
                     | _ -> false)
               in
               if tuple_mode || k <= 1 then begin
                 (* one OCaml parameter *)
                 let arg, arg_mty =
                   if tuple_mode then (Tuple (List.map (fun n -> Atom n) names), M.Tuple g)
                   else if k = 0 then (Atom "()", M.Named ("Unit", []))
                   else (Atom (List.hd names), List.hd g)
                 in
                 let body = bind_cases loc arg arg_mty cases partial (fun rhs -> go (Some rhs) None gs) in
                 ([], typed_lam (List.map2 param names g) (List.fold_right (fun g acc -> M.Fun (g, acc, true)) gs res) body)
               end else begin
                 (* k curried OCaml parameters in one MoonBit group *)
                 let rec consume f i =
                   if i = k then (fun () -> go (Some f) None gs)
                   else
                     match f.exp_desc with
                     | Texp_function { cases; partial; _ } ->
                         let n, t = List.nth atoms i in
                         (fun () -> bind_cases loc (Atom n) t cases partial (fun rhs -> consume rhs (i + 1) ()))
                     | _ ->
                         (* the body returns a function: apply it to the rest *)
                         (fun () ->
                           let ss, v, vt = lower f in
                           let rest = List.filteri (fun j _ -> j >= i) atoms in
                           let ssa, v2, vt2 = apply_values loc (v, vt) (List.map (fun (n, t) -> (Atom n, t)) rest) in
                           (* a completed application runs now, before the next closure *)
                           let ssa, v2 = if gs = [] then (ssa, v2) else hoist (ssa, v2) in
                           let ss', b = go None (Some (v2, vt2)) gs in
                           (ss @ ssa @ ss', b))
                 in
                 ([], typed_lam (List.map2 param names g) (List.fold_right (fun g acc -> M.Fun (g, acc, true)) gs res) (consume f 0 ()))
               end
           | Some f ->
               (* a function-valued body: its value, at the remaining type *)
               let rest_want = List.fold_right (fun g acc -> M.Fun (g, acc, true)) wgs res in
               let ss, v, _ = lower ~expect:rest_want f in
               (ss, v)
           | None ->
               (match body_val with
                | Some (v, vt) ->
                    let ssa, v2, vt2 = apply_values loc (v, vt) (List.map (fun (n, t) -> (Atom n, t)) atoms) in
                    let ssa, v2 = if gs = [] then (ssa, v2) else hoist (ssa, v2) in
                    let ss', b = go None (Some (v2, vt2)) gs in
                    ([], Lam (List.map2 param names g, (ssa @ ss', b)))
                | None -> assert false))
    in
    let ss, x = go (Some e) None wgs in
    (ss, x, want)

  (* Bind the value `arg` against the cases of an OCaml function node and
     continue with `k rhs`. *)
  and bind_cases loc arg arg_mty cases partial k : block =
    match cases with
    | [ { c_lhs; c_guard = None; c_rhs } ] when irrefutable c_lhs ->
        (match c_lhs.pat_desc with
         | Tpat_var (id, _) ->
             (* bind the parameter name directly *)
             let name = bind_local id arg_mty in
             let ss, x = k c_rhs in
             (match arg with
              | Atom a when a = name -> (ss, x)
              | _ -> (Let (name, arg) :: ss, x))
         | Tpat_any -> k c_rhs
         | _ ->
             let pat = pattern ~mty:arg_mty c_lhs in
             let ss, x = k c_rhs in
             (Let (pat, arg) :: ss, x))
    | _ ->
        let arms =
          List.map
            (fun c ->
              let pat = pattern ~mty:arg_mty c.c_lhs in
              let guard =
                match c.c_guard with
                | None -> ""
                | Some g ->
                    let ss, gx = lower_block g in
                    guard_str (if ss <> [] then Blk (ss, gx) else gx)
              in
              (pat ^ guard, k c.c_rhs))
            cases
        in
        let arms = if partial = Partial then arms @ [ ("_", ([], match_failure loc)) ] else arms in
        ([], Match (arg, arms))

  (* --- let --- *)

  (* `let p1 = e1 and p2 = e2 in body`: each binding is evaluated and its
     pattern checked in turn (locals have distinct MoonBit names, so a later
     right-hand side cannot see an earlier binding). *)
  and lower_let ?expect vbs body =
    match vbs with
    | [] -> lower ?expect body
    | ({ vb_pat = { pat_desc = Tpat_var _; _ }; vb_expr = { exp_desc = Texp_function _; _ }; _ } as vb) :: rest
      when List.exists (fun v -> not (List.mem v !scope_tyvars)) (tyvars_of_text (show_ty vb.vb_expr.exp_type)) ->
        (* a polymorphic local function: MoonBit closures are monomorphic,
           so it is lifted (or monomorphised) like a recursive one; the
           binding is not recursive, but its own name does not occur in
           its body (another binding of that name has another identifier) *)
        lower_letrec ?expect vb.vb_loc [ vb ] { body with exp_desc = Texp_let (Asttypes.Nonrecursive, rest, body) }
    | vb :: rest ->
        let ss, x, t = lower vb.vb_expr in
        (match vb.vb_pat.pat_desc with
         | Tpat_var (id, _) ->
             let name = bind_local ~oty:vb.vb_expr.exp_type id t in
             let ss2, y, ty = lower_let ?expect rest body in
             (* a function-valued local gets its recorded type, so that the
                MoonBit value has exactly that type *)
             let bind =
               match t with
               | M.Fun _ ->
                   partial_types := true;
                   let ts = show_mty t in
                   partial_types := false;
                   (match ts with Some ts -> LetTyped (name, ts, x) | None -> Let (name, x))
               | _ -> Let (name, x)
             in
             (ss @ [ bind ] @ ss2, y, ty)
         | _ when irrefutable vb.vb_pat ->
             let pat = pattern ~mty:t vb.vb_pat in
             let ss2, y, ty = lower_let ?expect rest body in
             (ss @ [ Let (pat, x) ] @ ss2, y, ty)
         | _ ->
             let pat = pattern ~mty:t vb.vb_pat in
             let ss2, y, ty = lower_let ?expect rest body in
             (ss, Match (x, [ (pat, (ss2, y)); ("_", ([], match_failure vb.vb_loc)) ]), ty))

  (* --- let rec: local functions --- *)

  (* The MoonBit parameter types and the result of a syntactic function:
     all syntactic parameters in one group (a single tuple parameter with a
     tuple pattern is spread). *)
  and function_signature (e : expression) =
    (* a refutable parameter (or `function` with several cases) is matched
       when its argument arrives: collect no parameters after it *)
    let rec params e acc =
      match e.exp_desc with
      | Texp_function { cases = [ c ]; _ } when irrefutable c.c_lhs && c.c_guard = None -> params c.c_rhs (e :: acc)
      | Texp_function { cases = _ :: _; _ } when acc = [] -> ([ e ], body_after e)
      | Texp_function _ -> (List.rev (e :: acc), body_after e)
      | _ -> (List.rev acc, e)
    and body_after e =
      match e.exp_desc with
      | Texp_function { cases = c :: _; _ } -> c.c_rhs
      | _ -> e
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
    (param_tys, body)

  and lower_letrec ?expect loc vbs body =
    (* `let rec f = let x = e in fun ... -> ...`: the prefix runs once at
       the definition, so it can be hoisted before the recursive group
       (when it does not mention the group) *)
    let rec peel e acc =
      match e.exp_desc with
      | Texp_let (rf, pvbs, inner) -> peel inner (acc @ [ (rf, pvbs) ])
      | Texp_function _ -> Some (acc, e)
      | _ -> None
    in
    let rec_ids =
      List.concat_map (fun vb -> List.map Ident.unique_name (pat_bound_idents vb.vb_pat)) vbs
    in
    let mentions_group pvbs =
      List.exists
        (fun pvb ->
          let found = ref false in
          let open Tast_iterator in
          let expr sub e =
            (match e.exp_desc with
             | Texp_ident (Path.Pident id, _, _) when List.mem (Ident.unique_name id) rec_ids -> found := true
             | _ -> ());
            default_iterator.expr sub e
          in
          let it = { default_iterator with expr } in
          it.expr it pvb.vb_expr;
          !found)
        pvbs
    in
    (* a non-function binding that does not mention the group
       (`let rec f x = ... and v = e`): evaluated first, as an ordinary
       `let` (making the group's closures has no effects) *)
    let is_fn vb = match vb.vb_expr.exp_desc with Texp_function _ -> true | _ -> false in
    let values, fns = List.partition (fun vb -> not (is_fn vb) && peel vb.vb_expr [] = None && not (mentions_group [ vb ])) vbs in
    (* only when every other binding is a plain closure: OCaml evaluates
       the bindings in order, and a function's setup (`let x = e in fun`)
       would otherwise run after the values *)
    (* OCaml 4.14 (Rec_check) evaluates the dynamic bindings first; the
       static ones (constructions, constants, functions and their set-ups)
       follow in binding order *)
    let rec is_static e =
      match e.exp_desc with
      | Texp_let (_, _, b) -> is_static b
      | Texp_construct (_, { Types.cstr_tag = Types.Cstr_unboxed; _ }, [ a ]) -> is_static a
      | Texp_construct _ | Texp_record _ | Texp_variant _ | Texp_tuple _ | Texp_constant _ | Texp_function _
      | Texp_lazy _ | Texp_array _ | Texp_extension_constructor _ | Texp_unreachable ->
          true
      | Texp_apply ({ exp_desc = Texp_ident (_, _, { Types.val_kind = Types.Val_prim { Primitive.prim_name = "%makemutable"; _ }; _ }); _ }, _) -> true
      | _ -> false
    in
    let dynamic, static_values = List.partition (fun vb -> not (is_static vb.vb_expr)) values in
    (* OCaml's initialization order beyond that depends on how each binding
       is compiled (constants, aliases, unboxed records): effectful values
       are accepted only where the order cannot matter *)
    let rec pure e =
      match e.exp_desc with
      | Texp_ident _ | Texp_constant _ | Texp_function _ | Texp_lazy _ -> true
      | Texp_construct (_, _, args) -> List.for_all pure args
      | Texp_tuple es -> List.for_all pure es
      | Texp_let (_, pvbs, b) -> List.for_all (fun pvb -> pure pvb.vb_expr) pvbs && pure b
      | _ -> false
    in
    let effectful = List.filter (fun vb -> not (pure vb.vb_expr)) values in
    let has_setup = List.exists (fun vb -> match peel vb.vb_expr [] with Some (pre, _) -> pre <> [] | None -> false) fns in
    if List.length effectful > 1 || (effectful <> [] && has_setup) then
      unsupported loc "recursive group mixing effectful values with other effects (OCaml's initialization order)";
    if values <> [] && fns <> [] && List.for_all is_fn fns then
      lower_let ?expect (dynamic @ static_values) { body with exp_desc = Texp_let (Asttypes.Recursive, fns, body) }
    else
    let peeled = List.map (fun vb -> (vb, peel vb.vb_expr [])) vbs in
    if List.exists (fun (_, p) -> match p with Some (pre, _) -> pre <> [] | None -> false) peeled then begin
      let prefixes = List.concat_map (fun (_, p) -> match p with Some (pre, _) -> pre | None -> []) peeled in
      if List.exists (fun (_, pvbs) -> mentions_group pvbs) prefixes then unsupported loc "recursive value whose set-up uses itself";
      let steps =
        List.map (fun vb -> (Asttypes.Nonrecursive, [ vb ])) dynamic
        @ List.concat_map
            (fun (vb, p) ->
              match p with
              | Some (pre, _) -> pre
              | None -> if List.memq vb static_values then [ (Asttypes.Nonrecursive, [ vb ]) ] else [])
            peeled
      in
      let vbs' =
        List.filter_map
          (fun (vb, p) ->
            match p with
            | Some (_, f) -> Some { vb with vb_expr = f }
            | None -> if List.memq vb values then None else Some vb)
          peeled
      in
      let inner = { body with exp_desc = Texp_let (Asttypes.Recursive, vbs', body) } in
      let nested = List.fold_right (fun (rf, pvbs) acc -> { body with exp_desc = Texp_let (rf, pvbs, acc) }) steps inner in
      lower ?expect nested
    end else
    let fns =
      List.map
        (fun vb ->
          match vb.vb_pat.pat_desc, vb.vb_expr.exp_desc with
          | Tpat_var (id, _), Texp_function _ ->
              let param_tys, fbody = function_signature vb.vb_expr in
              let want = M.Fun (List.map mty_of param_tys, mty_of fbody.exp_type, true) in
              (id, vb.vb_expr, param_tys, fbody, want)
          | _ ->
              let _, l, _ = Location.get_pos_info vb.vb_loc.Location.loc_start in
              let kind = match vb.vb_expr.exp_desc with Texp_let _ -> "let" | Texp_apply _ -> "application" | Texp_construct _ -> "constructor" | Texp_ident _ -> "identifier" | _ -> "other" in
              unsupported loc "recursive value (line %d, %s)" l kind)
        vbs
    in
    (* captured outer locals, before binding the functions themselves *)
    (* locals already lifted to the top level are reachable directly *)
    let captured_typed =
      List.filter (fun (u, _) -> not (Hashtbl.mem lifted_ids u))
        (List.concat_map (fun (_, e, _, _, _) -> captures_typed e) fns)
    in
    let captured = List.map fst captured_typed in
    let sig_text (_, _, param_tys, fbody, _) =
      String.concat " " (List.map show_ty (fbody.exp_type :: param_tys))
    in
    let foreign = List.filter (fun v -> not (List.mem v !scope_tyvars)) (tyvars_of_text (String.concat " " (List.map sig_text fns))) in
    let lift = foreign <> [] && captured = [] in
    let saved_subst = Hashtbl.copy tyvar_subst in
    let foreign =
      if lift then foreign
      else List.filter (fun v -> not (List.mem v !scope_tyvars)) (tyvars_of_text (String.concat " " (List.map sig_text fns)))
    in
    let names =
      List.map
        (fun (id, e, _, _, want) ->
          let name = if lift then reserve_top (sanitize (Ident.name id) ^ "_l") else unique_local (sanitize (Ident.name id)) in
          if lift then Hashtbl.replace lifted_ids (Ident.unique_name id) ();
          Hashtbl.replace locals (Ident.unique_name id) { name; mty = want; loty = Some e.exp_type };
          name)
        fns
    in
    let saved_scope = !scope_tyvars in
    (* polymorphic groups end up as generic top-level functions *)
    if foreign <> [] then scope_tyvars := saved_scope @ foreign;
    (* the bounds a lifted function needs come from its own body *)
    let saved_bounds = Hashtbl.copy bound_tyvars in
    Hashtbl.reset bound_tyvars;
    let restore_bounds () = Hashtbl.iter (fun k () -> Hashtbl.replace bound_tyvars k ()) saved_bounds in
    let lowered =
      List.map2
        (fun name (_, e, param_tys, fbody, want) ->
          match lower ~expect:want e with
          | _, Lam (ps, b), _ ->
              let ps = lam_params ps in
              let annot p t =
                if String.contains p ':' then p
                else p ^ " : " ^ show_ty t
              in
              (name, List.map2 annot ps param_tys, show_ty fbody.exp_type, b)
          | _ -> unsupported loc "recursive function")
        names fns
    in
    (* captured outer locals, typed under the group's instantiation *)
    let caps =
      let rec_ids = List.map (fun (id, _, _, _, _) -> Ident.unique_name id) fns in
      let caps =
        List.fold_left
          (fun acc (u, t) -> if List.mem u rec_ids || List.mem_assoc u acc then acc else acc @ [ (u, t) ])
          [] captured_typed
      in
      List.map
        (fun (u, oty) ->
          let l = Hashtbl.find locals u in
          (* a polymorphic local is passed at the instance used here *)
          let ty = match show_mty (refine l.mty (mty_of oty)) with Some t -> t | None -> show_ty oty in
          (l.name, ty))
        caps
    in
    scope_tyvars := saved_scope;
    Hashtbl.reset tyvar_subst;
    Hashtbl.iter (Hashtbl.replace tyvar_subst) saved_subst;
    let paren r = if String.length r > 0 && r.[0] = '(' then "(" ^ r ^ ")" else r in
    if lift then begin
      List.iter2
        (fun (name, ps, ret, b) (_, _, _, _, want) ->
          let body_text = Ir.to_string (fun () -> Ir.pblock b) in
          let tvs = tyvars_of_text (String.concat " " (ret :: ps)) in
          let gens = bounded tvs body_text in
          Hashtbl.replace fn_bounds name (List.filter (Hashtbl.mem bound_tyvars) tvs, want);
          lifted :=
            Printf.sprintf "\n///|\nfn%s %s(%s) -> %s raise %s\n" gens name (String.concat ", " ps) (paren ret) body_text
            :: !lifted)
        lowered fns;
      restore_bounds ();
      lower ?expect body
    end else begin
      let split p = match String.index_opt p ':' with Some i -> (String.trim (String.sub p 0 i), String.trim (String.sub p (i + 1) (String.length p - i - 1))) | None -> (p, "_") in
      match lowered with
      | [ (name, ps, ret, b) ] when foreign = [] && not (List.exists (fun (_, ps, _, _) -> List.exists (fun p -> not (String.contains p ':')) ps) lowered) ->
          restore_bounds ();
          let ss, y, ty = lower ?expect body in
          (LetFn (name, List.map split ps, paren ret, b) :: ss, y, ty)
      | _ ->
          (* Mutually recursive local functions are lifted to the top level
             (MoonBit's `letrec` of large closures miscompiles): captured
             variables become leading parameters, and each body, like the
             definition site, binds closures for the group's functions. *)
          let lifted_names = List.map (fun (name, _, _, _) -> reserve_top (name ^ "_l")) lowered in
          (* closures for the group's functions, annotated where the
             types' variables are in scope *)
          let closures_in scope =
            List.map2
              (fun (name, ps, _, _) lname ->
                let params = List.map split ps in
                let xs = List.map fst params in
                let in_scope t = List.for_all (fun v -> List.mem v scope) (tyvars_of_text t) in
                let lam_params = List.map (fun (x, t) -> if t = "_" || not (in_scope t) then x else x ^ " : " ^ t) params in
                Let (name, Lam (lam_params, ([], Call (Atom lname, List.map (fun (c, _) -> Atom c) caps @ List.map (fun x -> Atom x) xs)))))
              lowered lifted_names
          in
          (* A polymorphic group (MoonBit closures are monomorphic) gets no
             closures here: each use is a fresh lambda calling the generic
             lifted function with the captured variables, and an enclosing
             function that uses it captures those variables instead. *)
          let poly_lambdas = ref [] in
          let closures =
            if foreign = [] then closures_in !scope_tyvars
            else begin
              let cap_ids =
                List.fold_left
                  (fun acc (u, t) -> if List.mem u (List.map (fun (id, _, _, _, _) -> Ident.unique_name id) fns) || List.mem_assoc u acc then acc else acc @ [ (u, t) ])
                  [] captured_typed
              in
              poly_lambdas :=
                List.map2
                  (fun ((id, _, _, _, want), (_, ps, _, _)) lname ->
                    let xs = List.map (fun p -> fst (split p)) ps in
                    let lam =
                      Printf.sprintf "((%s) => %s(%s))" (String.concat ", " xs) lname
                        (String.concat ", " (List.map fst caps @ xs))
                    in
                    (Ident.unique_name id, lam, lname, want))
                  (List.combine fns lowered) lifted_names;
              List.iter (fun (u, _, _, _) -> Hashtbl.replace poly_caps u cap_ids) !poly_lambdas;
              []
            end
          in
          List.iter2
            (fun (_, ps, ret, (bss, bx)) lname ->
              let all_ps = List.map (fun (c, t) -> c ^ " : " ^ t) caps @ ps in
              let own = closures_in (tyvars_of_text (String.concat " " (ret :: all_ps))) in
              (* only the closures the body uses *)
              let used = Ir.to_string (fun () -> Ir.pblock (bss, bx)) in
              let mentions n =
                let ident c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c = '_' in
                let ln = String.length n and lu = String.length used in
                let rec at i =
                  i + ln <= lu
                  && ((String.sub used i ln = n && (i = 0 || not (ident used.[i - 1])) && (i + ln = lu || not (ident used.[i + ln])))
                      || at (i + 1))
                in
                at 0
              in
              let own = List.filter (function Let (n, _) -> mentions n | _ -> true) own in
              let body_text = Ir.to_string (fun () -> Ir.pblock (own @ bss, bx)) in
              let tvs = tyvars_of_text (String.concat " " (ret :: all_ps)) in
              let gens = bounded tvs body_text in
              (match List.find_opt (fun (_, _, l, _) -> l = lname) !poly_lambdas with
               | Some (_, lam, _, want) -> Hashtbl.replace fn_bounds lam (List.filter (Hashtbl.mem bound_tyvars) tvs, want)
               | None -> ());
              lifted :=
                Printf.sprintf "\n///|\nfn%s %s(%s) -> %s raise %s\n" gens lname (String.concat ", " all_ps) (paren ret) body_text
                :: !lifted)
            lowered lifted_names;
          List.iter
            (fun (u, lam, _, _) -> let l = Hashtbl.find locals u in Hashtbl.replace locals u { l with name = lam })
            !poly_lambdas;
          restore_bounds ();
          let ss, y, ty = lower ?expect body in
          (closures @ ss, y, ty)
    end

  (* --- match / try --- *)

  and lower_match ?expect e scrut cases partial =
    let loc = e.exp_loc in
    if List.exists (fun c -> match c.c_lhs.pat_desc with Tpat_exception _ -> true | _ -> false) cases then
      unsupported loc "match with exception cases";
    let ss, x, t =
      match scrut.exp_desc with
      | Texp_tuple comps ->
          (* `match (e1, e2) with` evaluates left to right *)
          let lowered = List.map (fun c -> let ss, y, t = lower c in ((ss, y), t)) comps in
          let stmts, xs = schedule (List.map fst lowered) in
          (stmts, Tuple xs, M.Tuple (List.map snd lowered))
      | _ -> lower scrut
    in
    let want = match expect with Some t -> Some t | None -> Some (mty_of e.exp_type) in
    let arms =
      List.map
        (fun c ->
          let pat = pattern ~mty:t c.c_lhs in
          let guard =
            match c.c_guard with
            | None -> ""
            | Some g -> let gs, gx = lower_block g in guard_str (if gs = [] then gx else Blk (gs, gx))
          in
          (pat ^ guard, lower_block ?expect:want c.c_rhs))
        cases
    in
    let arms = if partial = Partial then arms @ [ ("_", ([], match_failure loc)) ] else arms in
    (ss, Match (x, arms), Option.get want)

  and lower_try ?expect e body cases =
    let want = match expect with Some t -> Some t | None -> Some (mty_of e.exp_type) in
    let b = lower_block ?expect:want body in
    let catch_all = ref false in
    (* exception patterns *)
    let rec exn_pattern : 'k. 'k general_pattern -> string = fun (type k) (p : k general_pattern) ->
      match p.pat_desc with
      | Tpat_any -> catch_all := true; "_"
      | Tpat_var (id, _) -> catch_all := true; bind_local id (M.Named ("Error", []))
      | Tpat_alias (q, id, _) -> exn_pattern q ^ " as " ^ bind_local id (M.Named ("Error", []))
      | Tpat_or (a, b, _) -> exn_pattern a ^ " | " ^ exn_pattern b
      | Tpat_value v -> exn_pattern (v :> value general_pattern)
      | Tpat_construct (_, cd, args, _) ->
          (match cd.Types.cstr_name, args with
           | "Failure", [ a ] when predef_exn cd -> "Failure(" ^ pattern ~mty:(M.Named ("String", [])) a ^ ")"
           | "Invalid_argument", [ a ] when predef_exn cd -> "@num.InvalidArgument(" ^ pattern ~mty:(M.Named ("String", [])) a ^ ")"
           | "Noparse", [] -> "@parser.Noparse"
           | "Unchanged", [] -> "@lib.Unchanged"
           | "Not_found", [] when predef_exn cd -> "@lib.NotFound"
           | "Match_failure", [ { pat_desc = Tpat_any; _ } ] -> "@lib.MatchFailure(_)"
           | name, [] when Hashtbl.mem own_ctors name -> ctor_name ~cd name
           | name, args when Hashtbl.mem own_ctors name ->
               ctor_name ~cd name ^ "(" ^ String.concat ", " (List.map (fun a -> pattern a) args) ^ ")"
           | name, _ -> unsupported p.pat_loc "exception pattern %s" name)
      | _ -> unsupported p.pat_loc "exception pattern"
    in
    let arms =
      List.map
        (fun c ->
          let pat = exn_pattern c.c_lhs in
          let guard =
            match c.c_guard with
            | None -> ""
            | Some g -> let gs, gx = lower_block g in guard_str (if gs = [] then gx else Blk (gs, gx))
          in
          (pat ^ guard, lower_block ?expect:want c.c_rhs))
        cases
    in
    let arms = if !catch_all then arms else arms @ [ ("e", ([], Raise (Atom "e"))) ] in
    ([], Try (b, arms), Option.get want)
end
