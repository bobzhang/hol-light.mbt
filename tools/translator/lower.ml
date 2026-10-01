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

  exception Unsupported of string * Location.t

  let unsupported loc fmt = Printf.ksprintf (fun s -> raise (Unsupported (s, loc))) fmt

  (* ---------------------------------------------------------------- *)
  (* Types                                                              *)
  (* ---------------------------------------------------------------- *)

  (* the typing environment of the item being translated (inside a module
     it includes the module's earlier items) *)
  let item_env : Env.t option ref = ref None

  let env () = match !item_env with Some e -> e | None -> !Toploop.toplevel_env

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
        let n = "T" ^ String.make 1 (Char.chr (Char.code 'A' + Hashtbl.length tyvar_names)) in
        Hashtbl.add tyvar_names id n;
        n

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
    | _ -> None

  (* Types and constructors defined by translated files: OCaml type name ->
     (package, MoonBit name); constructor name -> package. *)
  let own_types : (string, string * string) Hashtbl.t = Hashtbl.create 32
  let own_ctors : (string, string) Hashtbl.t = Hashtbl.create 64
  let current_pkg = ref ""

  let qualified (pkg, name) = if pkg = !current_pkg then name else "@" ^ pkg ^ "." ^ name

  let own_type name = Option.map qualified (Hashtbl.find_opt own_types name)

  let ctor_name name =
    match Hashtbl.find_opt own_ctors name with
    | Some pkg -> qualified (pkg, name)
    | None -> name

  let base_type0 = function
    | "thm" -> Some "@kernel.Thm"
    | "term" -> Some "@kernel.Term"
    | "hol_type" -> Some "@kernel.HolType"
    | "list" -> Some "@list.List"
    | "string" -> Some "String"
    | "int" -> Some "Int"
    | "bool" -> Some "Bool"
    | "unit" -> Some "Unit"
    | "char" -> Some "Char"
    | "option" -> Some "Option"
    | "ref" -> Some "Ref"
    | "num" | "Num.num" -> Some "@num.Num"
    | "lexcode" -> Some "@parser.Lexcode"
    | "func" -> Some "@lib.Func"
    | "float" -> Some "Double"
    | "Stdlib.ref" -> Some "Ref"
    | _ -> None

  let base_type n = match own_type n with Some t -> Some t | None -> base_type0 n

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

  (* The canonical MoonBit type of an OCaml type: curried unary functions
     (a tuple parameter stays one tuple parameter), every function raising. *)
  let rec mty_of ty =
    match Types.get_desc ty with
    | Types.Tvar _ | Types.Tunivar _ -> M.Named (tyvar_name ty, [])
    | Types.Tarrow (_, a, b, _) -> M.Fun ([ mty_of a ], mty_of b, true)
    | Types.Ttuple ts -> M.Tuple (List.map mty_of ts)
    | Types.Tconstr (p, args, _) ->
        (match alias_mty (Path.name p), base_type (Path.name p) with
         | Some t, _ -> t
         | None, Some n -> M.Named (n, List.map mty_of args)
         | None, None ->
             let ty' = Ctype.expand_head (env ()) ty in
             if Types.get_id ty' = Types.get_id ty
                || (match Types.get_desc ty' with Types.Tconstr (p', _, _) -> Path.same p p' | _ -> false)
             then M.Named ("?" ^ Path.name p, List.map mty_of args)
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
         | None -> tyvar_name ty)
    | Types.Tarrow (_, a, b, _) ->
        let r = show_ty b in
        let r = if String.length r > 0 && r.[0] = '(' && is_arrow b then "(" ^ r ^ ")" else r in
        "(" ^ show_ty a ^ ") -> " ^ r ^ " raise"
    | Types.Ttuple ts -> "(" ^ String.concat ", " (List.map show_ty ts) ^ ")"
    | Types.Tconstr (p, args, _) ->
        let name = Path.name p in
        (match alias name, base_type name with
         | Some a, _ -> a
         | None, Some "Option" -> show_ty (List.hd args) ^ "?"
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

  (* The MoonBit text of a type when it is concrete (no type variables
     except those in scope). *)
  let rec show_mty (t : M.ty) : string option =
    let all l = List.fold_right (fun x acc -> match x, acc with Some a, Some b -> Some (a :: b) | _ -> None) l (Some []) in
    match t with
    | M.Named (v, []) when String.length v = 1 && v.[0] >= 'A' && v.[0] <= 'Z' -> None
    | M.Named (v, []) when String.length v = 2 && v.[0] = 'T' && v.[1] >= 'A' && v.[1] <= 'Z' ->
        if List.mem v !scope_tyvars_fwd then Some v else None
    | M.Named (n, _) when String.length n > 0 && n.[0] = '?' -> None
    | M.Named ("Option", [ a ]) -> Option.map (fun a -> a ^ "?") (show_mty a)
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
    [ "as"; "break"; "catch"; "const"; "continue"; "else"; "enum"; "extern";
      "false"; "fn"; "for"; "guard"; "if"; "impl"; "in"; "is"; "let"; "loop";
      "match"; "mut"; "priv"; "pub"; "raise"; "return"; "self"; "struct";
      "suberror"; "test"; "trait"; "true"; "try"; "type"; "typealias";
      "while"; "with"; "using"; "extend"; "async"; "defer"; "errdefer";
      "noraise"; "orelse"; "asm"; "module"; "move"; "ref"; "static"; "super";
      "unsafe"; "use"; "where"; "await"; "dyn"; "abstract"; "do"; "final";
      "macro"; "override"; "package"; "private"; "protected"; "throw";
      "sizeof"; "virtual"; "yield"; "init"; "main"; "lazy"; "pure"; "drop";
      "readonly"; "enumview"; "Self" ]

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

  (* MoonBit names of the locals of the current item: each binding gets a
     distinct name, since lowering flattens nested scopes. *)
  let local_names = taken_names

  let unique_local base =
    let rec go i =
      let n = if i = 0 then base else Printf.sprintf "%s_%d" base i in
      if Hashtbl.mem local_names n then go (i + 1) else (Hashtbl.add local_names n (); n)
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

  let current_file = ref ""

  (* Type variables bound by the enclosing top-level function's generics. *)
  let scope_tyvars : string list ref = scope_tyvars_fwd

  (* Local recursive functions lifted to the top level (MoonBit has no
     generic local functions): their source text. *)
  let lifted : string list ref = ref []

  (* MoonBit top-level names of the package being generated *)
  let top_names : (string, unit) Hashtbl.t = Hashtbl.create 256

  let reserve_top base =
    let rec go i =
      let n = if i = 0 then base else Printf.sprintf "%s_%d" base i in
      if Hashtbl.mem top_names n then go (i + 1) else (Hashtbl.add top_names n (); n)
    in
    go 0

  let tyvars_of_text s =
    let acc = ref [] in
    let n = String.length s in
    let ident c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c = '_' in
    for i = 0 to n - 2 do
      if s.[i] = 'T' && s.[i + 1] >= 'A' && s.[i + 1] <= 'Z'
         && (i = 0 || not (ident s.[i - 1] || s.[i - 1] = '.' || s.[i - 1] = '@'))
         && (i + 2 >= n || not (ident s.[i + 2]))
      then
        let v = String.sub s i 2 in
        if not (List.mem v !acc) then acc := v :: !acc
    done;
    List.sort compare !acc

  (* The local variables (already bound outside) that an expression uses,
     with their types. *)
  let captures_typed (e : Typedtree.expression) =
    let acc = ref [] in
    let open Tast_iterator in
    let expr sub e =
      (match e.Typedtree.exp_desc with
       | Typedtree.Texp_ident (Path.Pident id, _, _) when Hashtbl.mem locals (Ident.unique_name id) ->
           if not (List.mem_assoc (Ident.unique_name id) !acc) then
             acc := (Ident.unique_name id, e.Typedtree.exp_type) :: !acc
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
    match own_unique with
    | Some (mname, Accessor t) -> { hstmts = []; hexp = Atom (mname ^ "()"); hmty = t; hoty = Some oty }
    | Some (mname, Function t) -> { hstmts = []; hexp = Atom mname; hmty = t; hoty = Some oty }
    | None ->
    match Prov.lookup path with
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
             let q = "@" ^ pkg ^ "." ^ mname in
             (match decl with
              | M.Func (_, [], r, _) when not (match arrow oty with Some (a, _) -> is_unit a | None -> false) ->
                  (* an accessor: `pub fn x() -> T` for an OCaml value *)
                  { hstmts = []; hexp = Atom (q ^ "()"); hmty = r; hoty = Some oty }
              | _ -> { hstmts = []; hexp = Atom q; hmty = mty_of_decl decl; hoty = Some oty }))
    | None -> unsupported loc "no provenance for %s" (Path.name path)

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
      (* a parameter is `Plain t` or `Split ts` (one tuple, k units) *)
      let plain gs = List.map (List.map (fun t -> `Plain t)) gs in
      let units p = match p with `Plain _ -> 1 | `Split ts -> List.length ts in
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
                       | `Plain t -> (param x t, [ (Atom x, t) ])
                       | `Split ts -> (param x (M.Tuple ts), List.mapi (fun i t -> (Field (Atom x, i), t)) ts))
                     g
                 in
                 let body = go cur hps (pending @ List.concat_map snd params) wrest in
                 ([], Lam (List.map fst params, body)))
      in
      let ss, e' = go e hps [] wps in
      (stmts @ ss, e')
    end

  (* Replace the type variables of an expected MoonBit type (from a generic
     signature) by the corresponding parts of the OCaml type at the use. *)
  let is_tyvar v =
    (String.length v = 1 && v.[0] >= 'A' && v.[0] <= 'Z')
    || (String.length v = 2 && v.[0] = 'T' && v.[1] >= 'A' && v.[1] <= 'Z')

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

  let adapt_to ?expect (stmts, e, have) =
    match expect with
    | Some want -> let ss, e = adapt (stmts, e) have want in (ss, e, want)
    | None -> (stmts, e, have)

  (* ---------------------------------------------------------------- *)
  (* Constants and patterns                                             *)
  (* ---------------------------------------------------------------- *)

  let const loc = function
    | Asttypes.Const_int n -> if n < 0 then "(" ^ string_of_int n ^ ")" else string_of_int n
    | Asttypes.Const_string (s, _, _) -> string_lit s
    | Asttypes.Const_float f ->
        let f = if String.contains f '.' || String.contains f 'e' then f else f ^ ".0" in
        let f = if f.[String.length f - 1] = '.' then f ^ "0" else f in
        if f.[0] = '-' then "(" ^ f ^ ")" else f
    | Asttypes.Const_char c ->
        if c = '\'' then "'\\''" else if c = '\\' then "'\\\\'"
        else if Char.code c >= 32 && Char.code c < 127 then Printf.sprintf "'%c'" c
        else Printf.sprintf "'\\u{%x}'" (Char.code c)
    | _ -> unsupported loc "constant"

  let rec irrefutable : type k. k general_pattern -> bool = fun p ->
    match p.pat_desc with
    | Tpat_any | Tpat_var _ -> true
    | Tpat_alias (q, _, _) -> irrefutable q
    | Tpat_tuple ps -> List.for_all irrefutable ps
    | Tpat_construct (_, cd, [], _) -> cd.Types.cstr_name = "()"
    | Tpat_value v -> irrefutable (v :> value general_pattern)
    | _ -> false

  (* MoonBit text of a pattern, binding its variables; `mty` is the
     MoonBit type of the matched value when known. *)
  let rec pattern : type k. ?mty:M.ty -> k general_pattern -> string =
    fun ?mty p ->
    let loc = p.pat_loc in
    let sub_mty q = mty_of q.pat_type in
    match p.pat_desc with
    | Tpat_any -> "_"
    | Tpat_var (id, _) ->
        bind_local id (match mty with Some t -> t | None -> mty_of p.pat_type)
    | Tpat_alias (q, id, _) ->
        let s = pattern ?mty q in
        s ^ " as " ^ bind_local id (match mty with Some t -> t | None -> mty_of p.pat_type)
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
         | name, [] -> ctor_name name
         | name, ps -> ctor_name name ^ "(" ^ String.concat ", " (List.map (fun q -> pattern q) ps) ^ ")")
    | Tpat_or (a, b, _) -> pattern ?mty a ^ " | " ^ pattern ?mty b
    | Tpat_record (fields, _) ->
        "{ "
        ^ String.concat ", "
            (List.map (fun (_, ld, q) -> sanitize ld.Types.lbl_name ^ ": " ^ pattern q) fields)
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
  let list_alias p =
    let n = path_name p in
    let short =
      match String.rindex_opt n '.' with
      | Some i when String.length n > 5 && (String.sub n 0 5 = "List." || (String.length n > 12 && String.sub n 0 12 = "Stdlib.List.")) ->
          Some (String.sub n (i + 1) (String.length n - i - 1))
      | _ -> None
    in
    match short with
    | Some ("map" | "rev" | "length" | "exists" | "filter" | "mem" | "hd" | "tl" | "partition" | "map2"
           | "fold_left" | "fold_left_map" | "rev_append" as f) -> Some f
    | Some "assoc" -> Some "list_assoc"
    | Some "for_all" -> Some "forall"
    | Some "iter" -> Some "do_list"
    | Some ("concat" | "flatten") -> Some "flat"
    | Some "combine" -> Some "zip"
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
        (match own_type (Path.last p) with
         | Some t -> t
         | None -> unsupported Location.none "record type %s" (Path.name p))
    | _ -> unsupported Location.none "record type"

  let depth = ref 0

  let rec lower ?expect (e : expression) : stmt list * exp * M.ty =
    let loc = e.exp_loc in
    incr depth;
    if !depth > 3000 then unsupported loc "lowering recursion too deep";
    Fun.protect ~finally:(fun () -> decr depth) @@ fun () ->
    match e.exp_desc with
    | Texp_ident (path, _, vd) -> lower_apply ?expect e e [] |> fun r -> ignore vd; ignore path; r
    | Texp_constant c -> ([], Atom (const loc c), mty_of e.exp_type)
    | Texp_apply (f, args) ->
        let args =
          List.map (function
              | (Asttypes.Nolabel, Some a) -> a
              | _ -> unsupported loc "labelled or omitted argument") args
        in
        lower_apply ?expect e f args
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
        ( stmts, Tuple (List.rev xs), M.Tuple (List.map snd lowered) )
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
        (ss @ (if ordered x then [ Do x ] else []) @ ss2, y, t)
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
                 | Overridden (_, fe) -> Some (field_name ld.Types.lbl_name, fe)
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
        (ss, Proj (x, field_name ld.Types.lbl_name), mty_of e.exp_type)
    | Texp_setfield (r, _, ld, v) ->
        (* `r.f <- v`: v first *)
        let vl = lower_block ~expect:(mty_of v.exp_type) v in
        let rl = lower_block r in
        let stmts, xs = schedule [ vl; rl ] in
        (stmts, Blk ([ SetField (List.nth xs 1, field_name ld.Types.lbl_name, List.nth xs 0) ], Atom "()"), M.Named ("Unit", []))
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
    | Texp_ident (p, _, vd) when list_alias p <> None ->
        let name = Option.get (list_alias p) in
        (match Names.resolve "lib.ml" name with
         | Some (pkg, mname, decl) ->
             let h = { hstmts = []; hexp = Atom ("@" ^ pkg ^ "." ^ mname); hmty = mty_of_decl decl; hoty = Some vd.Types.val_type } in
             apply_head ?expect loc h args
         | None -> unsupported loc "List.%s" name)
    | Texp_ident (p, _, _) when (match stdlib_name p with Some ("Format.printf" | "Printf.printf" | "Printf.sprintf" | "Format.sprintf") -> true | _ -> false) ->
        lower_printf ?expect whole (Option.get (stdlib_name p)) args
    | Texp_ident (p, _, _) when stdlib_name p <> None ->
        lower_prim ?expect whole (Option.get (stdlib_name p)) f args
    | Texp_ident (p, _, _) when (match path_name p with "float_sqrt" | "float_fabs" -> Prov.lookup p = None | _ -> false) ->
        lower_prim ?expect whole (path_name p) f args
    | Texp_ident (p, _, _) when lib_combinator p <> None ->
        lower_combinator ?expect whole (Option.get (lib_combinator p)) f args
    | Texp_ident (Path.Pident id, _, _) when Hashtbl.mem locals (Ident.unique_name id) ->
        let l = Hashtbl.find locals (Ident.unique_name id) in
        apply_head ?expect loc { hstmts = []; hexp = Atom l.name; hmty = l.mty; hoty = l.loty } args
    | Texp_ident (p, _, vd) ->
        apply_head ?expect loc (global_head loc p vd) args
    | _ ->
        if args = [] then unsupported loc "value";
        let ss, x, ty = lower f in
        apply_head ?expect loc { hstmts = ss; hexp = x; hmty = ty; hoty = Some f.exp_type } args

  (* Apply a head to OCaml arguments (source order). *)
  and apply_head ?expect loc h args =
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
    adapt_to ?expect (stmts @ ss, e, result_mty)

  (* --- Stdlib primitives --- *)

  and lower_prim ?expect whole name f args =
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
      | ("+" | "-" | "*" | "/") as op -> (2, fun [ a; b ] _ -> Binop (op, a, b))
      | "mod" -> (2, fun [ a; b ] _ -> Binop ("%", a, b))
      | ("+." | "-." | "*." | "/.") as op -> (2, fun [ a; b ] _ -> Binop (String.sub op 0 1, a, b))
      | "~-." -> (1, fun [ a ] _ -> Binop ("-", Atom "0.0", a))
      | "float_of_int" -> (1, fun [ a ] _ -> Call (Atom "Int::to_double", [ a ]))
      | "sqrt" | "float_sqrt" -> (1, fun [ a ] _ -> Call (Atom "Double::sqrt", [ a ]))
      | "floor" -> (1, fun [ a ] _ -> Call (Atom "Double::floor", [ a ]))
      | "abs_float" | "float_fabs" -> (1, fun [ a ] _ -> Call (Atom "Double::abs", [ a ]))
      (* MoonBit's Int is 32-bit (OCaml's int is 63-bit) *)
      | "max_int" -> (0, fun [] _ -> Atom "2147483647")
      | "min_int" -> (0, fun [] _ -> Atom "(-2147483648)")
      | "int_of_float" | "truncate" -> (1, fun [ a ] _ -> Call (Atom "Double::to_int", [ a ]))
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
      | "~-" -> (1, fun [ a ] _ -> Binop ("-", Atom "0", a))
      | "abs" -> (1, fun [ a ] _ -> Call (Atom "@lib.abs_int", [ a ]))
      | "succ" -> (1, fun [ a ] _ -> Binop ("+", a, Atom "1"))
      | "pred" -> (1, fun [ a ] _ -> Binop ("-", a, Atom "1"))
      | "^" -> (2, fun [ a; b ] _ -> Binop ("+", a, b))
      | "not" -> (1, fun [ a ] _ -> Not a)
      | "@" -> (2, fun [ a; b ] _ -> Concat (a, b))
      | "failwith" -> (1, fun [ a ] _ -> Raise (Call (Atom "Failure", [ a ])))
      | "raise" -> (1, fun [ a ] _ -> Raise a)
      | "ignore" -> (1, fun [ a ] _ -> Call (Atom "ignore", [ a ]))
      | "string_of_int" -> (1, fun [ a ] _ -> Call (Atom "@lib.string_of_int", [ a ]))
      | "!" -> (1, fun [ a ] _ -> Deref a)
      | "ref" -> (1, fun [ a ] _ -> RefNew a)
      | ":=" -> (2, fun [ a; b ] _ -> Blk ([ Assign (a, b) ], Atom "()"))
      | "Format.print_string" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.print_string", [ a ]))
      | "Format.print_newline" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.print_newline", [])))
      | "Format.print_flush" -> (1, fun [ a ] _ -> Blk ((if ordered a then [ Do a ] else []), Call (Atom "@pp.std_formatter.print_flush", [])))
      | "Format.print_int" -> (1, fun [ a ] _ -> Call (Atom "@pp.std_formatter.print_int", [ a ]))
      | "print_string" -> (1, fun [ a ] _ -> Call (Atom "@pp.print_string", [ a ]))
      | "&&" | "||" -> (2, fun _ _ -> assert false)
      | _ -> unsupported loc "Stdlib.%s" name
    in
    let arg_tys = List.map (fun a -> a.exp_type) args in
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
      if rest <> [] then unsupported loc "over-applied primitive %s" name;
      let lowered = List.map (fun a -> let ss, x, _ = lower a in (ss, x)) now in
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
      let lowered = List.map (fun a -> let ss, x, _ = lower a in hoist (ss, x)) args in
      let stmts = List.concat_map fst (List.rev lowered) in
      let supplied = List.map snd lowered in
      let missing = List.init (arity - List.length args) (fun _ -> fresh "x") in
      let tys = (let rec params t n = if n = 0 then [] else match arrow t with Some (a, b) -> a :: params b (n - 1) | None -> [] in params f.exp_type arity) in
      let body = mk (supplied @ List.map (fun n -> Atom n) missing) (arg_tys @ List.filteri (fun i _ -> i >= List.length args) tys) in
      let missing_tys = List.filteri (fun i _ -> i >= List.length args) tys in
      let rec curry ns ts = match ns, ts with
        | [], _ -> body
        | n :: ns, t :: ts -> Lam ([ param n (mty_of t) ], ([], curry ns ts))
        | n :: ns, [] -> Lam ([ n ], ([], curry ns [])) in
      let curry ns = curry ns missing_tys in
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
        (* the arguments are evaluated right to left *)
        let lowered = List.map (fun a -> let ss, x, _ = lower a in (ss, x)) rest in
        let stmts, xs = schedule (List.rev lowered) in
        let xs = ref (List.rev xs) in
        let next () = match !xs with x :: r -> xs := r; x | [] -> unsupported loc "printf arguments" in
        let pieces = ref [] and buf = Buffer.create 16 and flush = ref false in
        let lit () = if Buffer.length buf > 0 then (pieces := Atom (string_lit (Buffer.contents buf)) :: !pieces; Buffer.clear buf) in
        let n = String.length text in
        let i = ref 0 in
        while !i < n do
          (if text.[!i] = '%' && !i + 1 < n then begin
             (match text.[!i + 1] with
              | 's' -> lit (); pieces := next () :: !pieces
              | 'd' | 'i' -> lit (); pieces := Call (Atom "@lib.string_of_int", [ next () ]) :: !pieces
              | '!' -> flush := true
              | '%' -> Buffer.add_char buf '%'
              | c -> unsupported loc "printf conversion %%%c" c);
             i := !i + 2
           end else (Buffer.add_char buf text.[!i]; incr i))
        done;
        lit ();
        let str = match List.rev !pieces with [] -> Atom "\"\"" | p :: ps -> List.fold_left (fun a b -> Binop ("+", a, b)) p ps in
        if name = "Printf.sprintf" || name = "Format.sprintf" then adapt_to ?expect (stmts, str, M.Named ("String", []))
        else
          let out = if name = "Printf.printf" then "@pp.print_string" else "@pp.std_formatter.print_string" in
          let calls = [ Do (Call (Atom out, [ str ])) ] @ (if !flush then [ Do (Call (Atom (if name = "Printf.printf" then "@pp.flush_stdout_backlog" else "@pp.std_formatter.print_flush"), [])) ] else []) in
          (stmts, Blk (calls, Atom "()"), M.Named ("Unit", []))
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
                ([], Lam (List.map (fun (x, t) -> param x t) ps, go gs (got @ ps)))
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
         | _ -> unsupported loc "applying a non-function value")

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
    | "Failure", [ a ] -> let ss, x, _ = lower a in (ss, Call (Atom "Failure", [ x ]), mty_of e.exp_type)
    | "Noparse", [] -> ([], Atom "@parser.Noparse", mty_of e.exp_type)
    | "Unchanged", [] -> ([], Atom "@lib.Unchanged", mty_of e.exp_type)
    | "Not_found", [] -> ([], Atom "@lib.NotFound", mty_of e.exp_type)
    | name, [] when Hashtbl.mem own_ctors name -> ([], Atom (ctor_name name), mty_of e.exp_type)
    | name, args when Hashtbl.mem own_ctors name ->
        (* constructor arguments are evaluated right to left *)
        let lowered = List.map (fun a -> let ss, x, _ = lower a in (ss, x)) args in
        let stmts, xs = schedule (List.rev lowered) in
        (stmts, Call (Atom (ctor_name name), List.rev xs), mty_of e.exp_type)
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
               let tuple_mode =
                 k > 1
                 && (match oty_param with Some a -> tuple_size a = k | None -> false)
                 && (match List.hd g with M.Tuple ts -> List.length ts <> k | _ -> true)
               in
               if tuple_mode || k <= 1 then begin
                 (* one OCaml parameter *)
                 let arg, arg_mty =
                   if tuple_mode then (Tuple (List.map (fun n -> Atom n) names), M.Tuple g)
                   else if k = 0 then (Atom "()", M.Named ("Unit", []))
                   else (Atom (List.hd names), List.hd g)
                 in
                 let body = bind_cases loc arg arg_mty cases partial (fun rhs -> go (Some rhs) None gs) in
                 ([], Lam (List.map2 param names g, body))
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
                 ([], Lam (List.map2 param names g, consume f 0 ()))
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
                    if ss <> [] then " if " ^ string_of_exp (Blk (ss, gx)) else " if " ^ string_of_exp gx
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
    | vb :: rest ->
        let ss, x, t = lower vb.vb_expr in
        (match vb.vb_pat.pat_desc with
         | Tpat_var (id, _) ->
             let name = bind_local ~oty:vb.vb_expr.exp_type id t in
             let ss2, y, ty = lower_let ?expect rest body in
             (* a function-valued local gets its recorded type, so that the
                MoonBit value has exactly that type *)
             let bind =
               match t, show_mty t with
               | M.Fun _, Some ts -> LetTyped (name, ts, x)
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
    let fns =
      List.map
        (fun vb ->
          match vb.vb_pat.pat_desc, vb.vb_expr.exp_desc with
          | Tpat_var (id, _), Texp_function _ ->
              let param_tys, fbody = function_signature vb.vb_expr in
              let want = M.Fun (List.map mty_of param_tys, mty_of fbody.exp_type, true) in
              (id, vb.vb_expr, param_tys, fbody, want)
          | _ -> unsupported loc "recursive value")
        vbs
    in
    (* captured outer locals, before binding the functions themselves *)
    let captured_typed = List.concat_map (fun (_, e, _, _, _) -> captures_typed e) fns in
    let captured = List.map fst captured_typed in
    let sig_text (_, _, param_tys, fbody, _) =
      String.concat " " (List.map show_ty (fbody.exp_type :: param_tys))
    in
    let foreign = List.filter (fun v -> not (List.mem v !scope_tyvars)) (tyvars_of_text (String.concat " " (List.map sig_text fns))) in
    let lift = foreign <> [] && captured = [] in
    let saved_subst = Hashtbl.copy tyvar_subst in
    (* otherwise, monomorphise at the instance the rest of the code uses *)
    if foreign <> [] && not lift then begin
      let uses = ref [] in
      let open Tast_iterator in
      let ids = List.map (fun (id, _, _, _, _) -> Ident.unique_name id) fns in
      let expr sub e =
        (match e.exp_desc with
         | Texp_ident (Path.Pident id, _, _) when List.mem (Ident.unique_name id) ids ->
             uses := (Ident.unique_name id, e.exp_type) :: !uses
         | _ -> ());
        default_iterator.expr sub e
      in
      let it = { default_iterator with expr } in
      it.expr it body;
      let rec unify g i =
        match Types.get_desc g, Types.get_desc i with
        | (Types.Tvar _ | Types.Tunivar _), _ ->
            if not (Hashtbl.mem tyvar_subst (Types.get_id g)) then Hashtbl.replace tyvar_subst (Types.get_id g) i
        | Types.Tarrow (_, a1, b1, _), Types.Tarrow (_, a2, b2, _) -> unify a1 a2; unify b1 b2
        | Types.Ttuple ts1, Types.Ttuple ts2 when List.length ts1 = List.length ts2 -> List.iter2 unify ts1 ts2
        | Types.Tconstr (_, as1, _), Types.Tconstr (_, as2, _) when List.length as1 = List.length as2 -> List.iter2 unify as1 as2
        | _ -> ()
      in
      List.iter
        (fun (id, e, _, _, _) ->
          match List.assoc_opt (Ident.unique_name id) !uses with
          | Some inst -> unify e.exp_type inst
          | None -> ())
        fns
    end;
    let foreign =
      if lift then foreign
      else List.filter (fun v -> not (List.mem v !scope_tyvars)) (tyvars_of_text (String.concat " " (List.map sig_text fns)))
    in
    let names =
      List.map
        (fun (id, e, _, _, want) ->
          let name = if lift then reserve_top (sanitize (Ident.name id) ^ "_l") else unique_local (sanitize (Ident.name id)) in
          Hashtbl.replace locals (Ident.unique_name id) { name; mty = want; loty = Some e.exp_type };
          name)
        fns
    in
    let saved_scope = !scope_tyvars in
    if lift then scope_tyvars := saved_scope @ foreign;
    let lowered =
      List.map2
        (fun name (_, e, param_tys, fbody, want) ->
          match lower ~expect:want e with
          | _, Lam (ps, b), _ ->
              let annot p t =
                if String.contains p ':' then p
                else if foreign <> [] && not lift then p
                else p ^ " : " ^ show_ty t
              in
              (name, List.map2 annot ps param_tys, show_ty fbody.exp_type, b)
          | _ -> unsupported loc "recursive function")
        names fns
    in
    scope_tyvars := saved_scope;
    Hashtbl.reset tyvar_subst;
    Hashtbl.iter (Hashtbl.replace tyvar_subst) saved_subst;
    let paren r = if String.length r > 0 && r.[0] = '(' then "(" ^ r ^ ")" else r in
    if lift then begin
      List.iter
        (fun (name, ps, ret, b) ->
          let gens = tyvars_of_text (String.concat " " (ret :: ps)) in
          (* OCaml's polymorphic equality and comparison *)
          let gens =
            if gens = [] then ""
            else "[" ^ String.concat ", " (List.map (fun g -> g ^ " : Eq + @lib.OCompare + @lib.OHash") gens) ^ "]"
          in
          lifted :=
            Printf.sprintf "\n///|\nfn%s %s(%s) -> %s raise %s\n" gens name (String.concat ", " ps) (paren ret)
              (Ir.to_string (fun () -> Ir.pblock b))
            :: !lifted)
        lowered;
      lower ?expect body
    end else begin
      let split p = match String.index_opt p ':' with Some i -> (String.trim (String.sub p 0 i), String.trim (String.sub p (i + 1) (String.length p - i - 1))) | None -> (p, "_") in
      match lowered with
      | [ (name, ps, ret, b) ] when foreign = [] ->
          let ss, y, ty = lower ?expect body in
          (LetFn (name, List.map split ps, paren ret, b) :: ss, y, ty)
      | [ _ ] ->
          let def = LetRec (List.map (fun (n, ps, _, b) -> (n, List.map split ps, None, b)) lowered) in
          let ss, y, ty = lower ?expect body in
          (def :: ss, y, ty)
      | _ ->
          (* Mutually recursive local functions are lifted to the top level
             (MoonBit's `letrec` of large closures miscompiles): captured
             variables become leading parameters, and each body, like the
             definition site, binds closures for the group's functions. *)
          let rec_ids = List.map (fun (id, _, _, _, _) -> Ident.unique_name id) fns in
          let caps =
            List.fold_left
              (fun acc (u, t) -> if List.mem u rec_ids || List.mem_assoc u acc then acc else acc @ [ (u, t) ])
              [] captured_typed
          in
          let caps =
            List.map
              (fun (u, oty) ->
                let l = Hashtbl.find locals u in
                let ty = match show_mty l.mty with Some t -> t | None -> show_ty oty in
                (l.name, ty))
              caps
          in
          let lifted_names = List.map (fun (name, _, _, _) -> reserve_top (name ^ "_l")) lowered in
          let closures =
            List.map2
              (fun (name, ps, _, _) lname ->
                let params = List.map split ps in
                let xs = List.map fst params in
                let lam_params = List.map (fun (x, t) -> if t = "_" then x else x ^ " : " ^ t) params in
                Let (name, Lam (lam_params, ([], Call (Atom lname, List.map (fun (c, _) -> Atom c) caps @ List.map (fun x -> Atom x) xs)))))
              lowered lifted_names
          in
          List.iter2
            (fun (_, ps, ret, (bss, bx)) lname ->
              let all_ps = List.map (fun (c, t) -> c ^ " : " ^ t) caps @ ps in
              let gens = tyvars_of_text (String.concat " " (ret :: all_ps)) in
              let gens =
                if gens = [] then ""
                else "[" ^ String.concat ", " (List.map (fun g -> g ^ " : Eq + @lib.OCompare + @lib.OHash") gens) ^ "]"
              in
              lifted :=
                Printf.sprintf "\n///|\nfn%s %s(%s) -> %s raise %s\n" gens lname (String.concat ", " all_ps) (paren ret)
                  (Ir.to_string (fun () -> Ir.pblock (closures @ bss, bx)))
                :: !lifted)
            lowered lifted_names;
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
            | Some g -> let gs, gx = lower_block g in " if " ^ string_of_exp (if gs = [] then gx else Blk (gs, gx))
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
    let rec exn_pattern : type k. k general_pattern -> string = fun p ->
      match p.pat_desc with
      | Tpat_any -> catch_all := true; "_"
      | Tpat_var (id, _) -> catch_all := true; bind_local id (M.Named ("Error", []))
      | Tpat_alias (q, id, _) -> exn_pattern q ^ " as " ^ bind_local id (M.Named ("Error", []))
      | Tpat_or (a, b, _) -> exn_pattern a ^ " | " ^ exn_pattern b
      | Tpat_value v -> exn_pattern (v :> value general_pattern)
      | Tpat_construct (_, cd, args, _) ->
          (match cd.Types.cstr_name, args with
           | "Failure", [ a ] -> "Failure(" ^ pattern ~mty:(M.Named ("String", [])) a ^ ")"
           | "Noparse", [] -> "@parser.Noparse"
           | "Unchanged", [] -> "@lib.Unchanged"
           | "Not_found", [] -> "@lib.NotFound"
           | "Match_failure", [ { pat_desc = Tpat_any; _ } ] -> "@lib.MatchFailure(_)"
           | name, [] when Hashtbl.mem own_ctors name -> ctor_name name
           | name, args when Hashtbl.mem own_ctors name ->
               ctor_name name ^ "(" ^ String.concat ", " (List.map (fun a -> pattern a) args) ^ ")"
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
            | Some g -> let gs, gx = lower_block g in " if " ^ string_of_exp (if gs = [] then gx else Blk (gs, gx))
          in
          (pat ^ guard, lower_block ?expect:want c.c_rhs))
        cases
    in
    let arms = if !catch_all then arms else arms @ [ ("e", ([], Raise (Atom "e"))) ] in
    ([], Try (b, arms), Option.get want)
end
