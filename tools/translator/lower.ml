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

  let env () = !Toploop.toplevel_env

  let tyvar_names : (int, string) Hashtbl.t = Hashtbl.create 16

  let tyvar_name ty =
    let id = Types.get_id ty in
    match Hashtbl.find_opt tyvar_names id with
    | Some n -> n
    | None ->
        let n = String.make 1 (Char.chr (Char.code 'A' + Hashtbl.length tyvar_names)) in
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

  let base_type = function
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
    | "Stdlib.ref" -> Some "Ref"
    | _ -> None

  (* The canonical MoonBit type of an OCaml type: curried unary functions
     (a tuple parameter stays one tuple parameter), every function raising. *)
  let rec mty_of ty =
    match Types.get_desc ty with
    | Types.Tvar _ | Types.Tunivar _ -> M.Named (tyvar_name ty, [])
    | Types.Tarrow (_, a, b, _) -> M.Fun ([ mty_of a ], mty_of b, true)
    | Types.Ttuple ts -> M.Tuple (List.map mty_of ts)
    | Types.Tconstr (p, args, _) ->
        (match base_type (Path.name p) with
         | Some n -> M.Named (n, List.map mty_of args)
         | None ->
             let ty' = Ctype.expand_head (env ()) ty in
             if Types.get_id ty' = Types.get_id ty
                || (match Types.get_desc ty' with Types.Tconstr (p', _, _) -> Path.same p p' | _ -> false)
             then M.Named ("?" ^ Path.name p, List.map mty_of args)
             else mty_of ty')
    | Types.Tpoly (t, _) -> mty_of t
    | _ -> M.Named ("?", [])

  (* MoonBit source text of an OCaml type, using aliases where they exist. *)
  let rec show_ty ty =
    match Types.get_desc ty with
    | Types.Tvar _ | Types.Tunivar _ -> tyvar_name ty
    | Types.Tarrow (_, a, b, _) -> "(" ^ show_ty a ^ ") -> " ^ show_ty b ^ " raise"
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

  let sanitize name =
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
  let fresh base = incr counter; Printf.sprintf "%s%d" base !counter

  (* ---------------------------------------------------------------- *)
  (* Environment                                                        *)
  (* ---------------------------------------------------------------- *)

  type local = { name : string; mty : M.ty }

  (* Ident.unique_name -> local *)
  let locals : (string, local) Hashtbl.t = Hashtbl.create 64

  let bind_local id mty =
    let name = sanitize (Ident.name id) in
    Hashtbl.replace locals (Ident.unique_name id) { name; mty };
    name

  (* Values defined earlier in the file being translated:
     Ident.unique_name of the installed binding -> (MoonBit name, kind) *)
  type own = Accessor of M.ty | Function of M.ty
  let own_values : (string, string * own) Hashtbl.t = Hashtbl.create 256
  let own_by_name : (string, string * own) Hashtbl.t = Hashtbl.create 256

  let current_file = ref ""

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
    | M.Value t -> t

  and _unused = ()

  (* A global value: package declaration resolved from provenance. *)
  let global_head loc path (vd : Types.value_description) =
    let oty = vd.Types.val_type in
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
    | _ -> false

  let rec groups = function
    | M.Fun (ps, r, _) -> let gs, res = groups r in (ps :: gs, res)
    | t -> ([], t)

  (* Adapt value `e` of MoonBit type `have` to type `want` (both types of the
     same OCaml value, parameters matched one by one). Each stage of `e` is
     applied as soon as the wanted closures have received its parameters,
     so staging is preserved. *)
  let rec adapt (stmts, e) have want =
    if not (needs_eta have want) then (stmts, e)
    else begin
      let stmts, e = hoist (stmts, e) in
      let wgs, _ = groups want in
      let hgs, _ = groups have in
      let count gs = List.fold_left (fun n g -> n + List.length g) 0 gs in
      if count wgs <> count hgs then
        failwith (Printf.sprintf "cannot adapt %s to %s" (M.show have) (M.show want));
      (* pending: arguments received but not yet passed to `cur` *)
      let rec go cur hgs pending wgs : stmt list * exp =
        (* apply every complete `have` group *)
        match hgs with
        | g :: hrest when List.length pending >= List.length g ->
            let k = List.length g in
            let now = List.filteri (fun i _ -> i < k) pending in
            let later = List.filteri (fun i _ -> i >= k) pending in
            let args = List.map2 (fun (x, wt) ht -> snd (adapt ([], Atom x) wt ht)) now g in
            let call = Call (cur, args) in
            if wgs = [] && later = [] && hrest = [] then ([], call)
            else
              let t = fresh "s" in
              let ss, r = go (Atom t) hrest later wgs in
              (Let (t, call) :: ss, r)
        | _ ->
            (match wgs with
             | [] -> ([], cur)
             | g :: wrest ->
                 let ps = List.map (fun t -> (fresh "x", t)) g in
                 let body = go cur hgs (pending @ ps) wrest in
                 ([], Lam (List.map fst ps, body)))
      in
      let ss, e' = go e hgs [] wgs in
      (stmts @ ss, e')
    end

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
         | ("true" | "false" | "()" | "None"), [] -> cd.Types.cstr_name
         | name, [] -> name
         | name, ps -> name ^ "(" ^ String.concat ", " (List.map (fun q -> pattern q) ps) ^ ")")
    | Tpat_or (a, b, _) -> pattern ?mty a ^ " | " ^ pattern ?mty b
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

  let lib_combinator p =
    match Prov.lookup p with
    | Some ("lib.ml", (("o" | "I" | "K" | "C" | "W" | "f_f_") as n)) -> Some n
    | _ -> None

  let rec lower ?expect (e : expression) : stmt list * exp * M.ty =
    let loc = e.exp_loc in
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
    | Texp_let (Asttypes.Recursive, _, _) -> unsupported loc "local let rec"
    | _ -> unsupported loc "expression"

  and lower_block ?expect e : block =
    let ss, x, _ = lower ?expect e in
    (ss, x)

  (* --- Applications --- *)

  and lower_apply ?expect whole f args =
    let loc = whole.exp_loc in
    match f.exp_desc with
    | Texp_ident (p, _, _) when stdlib_name p <> None ->
        lower_prim ?expect whole (Option.get (stdlib_name p)) f args
    | Texp_ident (p, _, _) when lib_combinator p <> None ->
        lower_combinator ?expect whole (Option.get (lib_combinator p)) f args
    | Texp_ident (Path.Pident id, _, _) when Hashtbl.mem locals (Ident.unique_name id) ->
        let l = Hashtbl.find locals (Ident.unique_name id) in
        apply_head ?expect loc { hstmts = []; hexp = Atom l.name; hmty = l.mty; hoty = None } args
    | Texp_ident (p, _, vd) ->
        apply_head ?expect loc (global_head loc p vd) args
    | _ ->
        if args = [] then unsupported loc "value";
        let ss, x, ty = lower f in
        apply_head ?expect loc { hstmts = ss; hexp = x; hmty = ty; hoty = Some f.exp_type } args

  (* Apply a head to OCaml arguments (source order). *)
  and apply_head ?expect loc h args =
    (* plan the stages *)
    let rec plan mty oty args acc =
      match args with
      | [] -> (List.rev acc, mty)
      | _ ->
          (match mty with
           | M.Fun (ps, r, raises) ->
               let k = List.length ps in
               let tuple_mode =
                 k > 1
                 && (match oty with
                     | Some t -> (match arrow t with Some (a, _) -> tuple_size a = k | None -> false)
                     | None -> false)
               in
               let need = if k = 0 || tuple_mode then 1 else k in
               let rec take n l = if n = 0 then ([], l) else match l with [] -> ([], []) | x :: xs -> let a, b = take (n - 1) xs in (x :: a, b) in
               let now, rest = take need args in
               let rec advance n t = if n = 0 then t else match t with Some t -> (match arrow t with Some (_, b) -> advance (n - 1) (Some b) | None -> None) | None -> None in
               if List.length now < need then
                 (List.rev ((`Partial (ps, r, raises, now)) :: acc), M.Fun (List.filteri (fun i _ -> i >= List.length now) ps, r, raises))
               else
                 plan r (advance need oty) rest
                   ((if k = 0 then `Unit (List.hd now) else if tuple_mode then `Tuple (ps, List.hd now) else `Curried (ps, now)) :: acc)
           | _ -> unsupported loc "too many arguments for %s" (M.show mty))
    in
    let stages, result_mty = plan h.hmty h.hoty args [] in
    (* every argument (or tuple component) is a slot with an id; slots are
       scheduled in OCaml evaluation order: arguments right to left (tuple
       components right to left), then the head *)
    let next = ref 0 in
    let slots = Hashtbl.create 8 in   (* id -> (stage, (stmts, exp)) *)
    let slot si (ss, x) = let id = !next in incr next; Hashtbl.replace slots id (si, (ss, x)); id in
    let low p a = let ss, x, _ = lower ~expect:p a in (ss, x) in
    let stage_args =
      List.mapi
        (fun si st ->
          match st with
          | `Unit a -> let ss, x, _ = lower a in `Unit (slot si (ss, x))
          | `Curried (ps, now) -> `Curried (List.map2 (fun p a -> slot si (low p a)) (List.filteri (fun i _ -> i < List.length now) ps) now)
          | `Partial (ps, _, _, now) ->
              `Partial (ps, List.map2 (fun p a -> slot si (low p a)) (List.filteri (fun i _ -> i < List.length now) ps) now)
          | `Tuple (ps, a) ->
              (match a.exp_desc with
               | Texp_tuple comps when List.length comps = List.length ps ->
                   `Spread (List.map2 (fun p c -> slot si (low p c)) ps comps)
               | _ -> `Whole (List.length ps, slot si (low (M.Tuple ps) a))))
        stages
    in
    let per_arg =
      List.concat_map
        (function
          | `Unit id -> [ [ id ] ]
          | `Curried ids | `Partial (_, ids) -> List.map (fun id -> [ id ]) ids
          | `Spread ids -> [ List.rev ids ]
          | `Whole (_, id) -> [ [ id ] ])
        stage_args
    in
    let head_id = slot (-1) (h.hstmts, h.hexp) in
    let order = List.concat (List.rev per_arg) @ [ head_id ] in
    let first_full = match stages with (`Curried _ | `Tuple _ | `Unit _) :: _ -> true | _ -> false in
    let inline_ok i =
      let si, _ = Hashtbl.find slots (List.nth order i) in
      si = -1 || (si = 0 && first_full)
    in
    let stmts, exps = schedule ~inline_ok (List.map (fun id -> snd (Hashtbl.find slots id)) order) in
    let value = Hashtbl.create 8 in
    List.iter2 (fun id x -> Hashtbl.replace value id x) order exps;
    let get id = Hashtbl.find value id in
    let rec build v = function
      | [] -> v
      | `Unit _ :: rest -> build (Call (v, [])) rest
      | (`Curried ids | `Spread ids) :: rest -> build (Call (v, List.map get ids)) rest
      | `Whole (k, id) :: rest ->
          let t = get id in
          build (Call (v, List.init k (fun i -> Field (t, i)))) rest
      | `Partial (ps, ids) :: _ ->
          let missing = List.filteri (fun i _ -> i >= List.length ids) ps in
          let names = List.map (fun _ -> fresh "x") missing in
          Lam (names, ([], Call (v, List.map get ids @ List.map (fun n -> Atom n) names)))
    in
    let e = build (get head_id) stage_args in
    adapt_to ?expect (stmts, e, result_mty)

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
      | "~-" -> (1, fun [ a ] _ -> Binop ("-", Atom "0", a))
      | "^" -> (2, fun [ a; b ] _ -> Binop ("+", a, b))
      | "not" -> (1, fun [ a ] _ -> Not a)
      | "@" -> (2, fun [ a; b ] _ -> Concat (a, b))
      | "failwith" -> (1, fun [ a ] _ -> Raise (Call (Atom "Failure", [ a ])))
      | "raise" -> (1, fun [ a ] _ -> Raise a)
      | "ignore" -> (1, fun [ a ] _ -> Call (Atom "ignore", [ a ]))
      | "string_of_int" -> (1, fun [ a ] _ -> Call (Atom "@lib.string_of_int", [ a ]))
      | "!" -> (1, fun [ a ] _ -> Atom (string_of_exp a ^ ".val"))
      | "ref" -> (1, fun [ a ] _ -> Atom ("Ref::{ val: " ^ string_of_exp a ^ " }"))
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
      let stmts, xs = schedule (List.rev lowered) in
      let xs = List.rev xs in
      (* `!` and `ref` print their argument textually: keep it simple *)
      let xs =
        if name = "!" || name = "ref" || name = "string_of_int" then
          List.map (fun x -> match x with Atom _ -> x | _ -> x) xs
        else xs
      in
      adapt_to ?expect (stmts, mk xs arg_tys, mty_of whole.exp_type)
    end
    else begin
      (* partial application: evaluate the supplied arguments, then a closure *)
      let lowered = List.map (fun a -> let ss, x, _ = lower a in hoist (ss, x)) args in
      let stmts = List.concat_map fst (List.rev lowered) in
      let supplied = List.map snd lowered in
      let missing = List.init (arity - List.length args) (fun _ -> fresh "x") in
      let tys = arg_tys @ (let rec params t n = if n = 0 then [] else match arrow t with Some (a, b) -> a :: params b (n - 1) | None -> [] in params f.exp_type arity |> List.filteri (fun i _ -> i >= List.length args)) in
      let body = mk (supplied @ List.map (fun n -> Atom n) missing) tys in
      let rec curry = function [] -> body | n :: ns -> Lam ([ n ], ([], curry ns)) in
      adapt_to ?expect (stmts, curry missing, mty_of whole.exp_type)
    end

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
        let core all =
          match name, all with
          | "o", [ fv; gv; x ] -> let gx = apply_val gv [ x ] in apply_val fv [ gx ]
          | "I", [ x ] -> x
          | "K", [ x; _ ] -> x
          | "C", [ fv; x; y ] -> apply_val fv [ y; x ]
          | "W", [ fv; x ] -> apply_val fv [ x; x ]
          | "f_f_", [ fv; gv; p ] ->
              let a = apply_val fv [ (Field (fst p, 0), M.Named ("?", [])) ] in
              let b = apply_val gv [ (Field (fst p, 1), M.Named ("?", [])) ] in
              (Tuple [ fst a; fst b ], M.Tuple [ snd a; snd b ])
          | _ -> unsupported loc "combinator %s" name
        in
        let rec go wgs got : block =
          if List.length got >= needed then begin
            let now = List.filteri (fun i _ -> i < needed) got in
            let extra = List.filteri (fun i _ -> i >= needed) got in
            let v, vt = core (vals @ List.map (fun (x, t) -> (Atom x, t)) now) in
            let v, vt =
              if extra = [] then (v, vt)
              else apply_val (v, vt) (List.map (fun (x, t) -> (Atom x, t)) extra)
            in
            let rest_want = List.fold_right (fun g acc -> M.Fun (g, acc, true)) wgs (snd (groups want)) in
            adapt ([], v) vt rest_want
          end else
            match wgs with
            | [] -> unsupported loc "combinator %s needs %d more arguments" name needed
            | g :: gs ->
                let ps = List.map (fun t -> (fresh "x", t)) g in
                ([], Lam (List.map fst ps, go gs (got @ ps)))
        in
        let wgs, _ = groups want in
        let ss, lam = go wgs [] in
        (stmts @ ss, lam, want)

  (* Apply an evaluated value of MoonBit type `t` to evaluated arguments,
     one OCaml argument per parameter. *)
  and apply_values loc (v, t) xs =
    match xs with
    | [] -> (v, t)
    | _ ->
        (match t with
         | M.Fun (ps, r, _) ->
             let k = List.length ps in
             if List.length xs >= k then
               let now = List.filteri (fun i _ -> i < k) xs in
               let rest = List.filteri (fun i _ -> i >= k) xs in
               let args = List.map2 (fun (x, xt) p -> snd (adapt ([], x) xt p)) now ps in
               apply_values loc (Call (v, args), r) rest
             else
               let missing = List.filteri (fun i _ -> i >= List.length xs) ps in
               let names = List.map (fun _ -> fresh "x") missing in
               ( Lam (names, ([], Call (v, List.map fst xs @ List.map (fun n -> Atom n) names))),
                 M.Fun (missing, r, true) )
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
           | Some f, None -> lower_block f
           | None, Some (v, _) -> ([], v)
           | _ -> assert false)
      | g :: gs ->
          let k = List.length g in
          let names = List.map (fun _ -> fresh "x") g in
          let atoms = List.combine names g in
          (match fn with
           | Some ({ exp_desc = Texp_function { cases; partial; _ }; _ } as f) ->
               let oty_param = match arrow f.exp_type with Some (a, _) -> Some a | None -> None in
               let tuple_mode = k > 1 && (match oty_param with Some a -> tuple_size a = k | None -> false) in
               if tuple_mode || k <= 1 then begin
                 (* one OCaml parameter *)
                 let arg, arg_mty =
                   if tuple_mode then (Tuple (List.map (fun n -> Atom n) names), M.Tuple g)
                   else if k = 0 then (Atom "()", M.Named ("Unit", []))
                   else (Atom (List.hd names), List.hd g)
                 in
                 let body = bind_cases loc arg arg_mty cases partial (fun rhs -> go (Some rhs) None gs) in
                 ([], Lam (names, body))
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
                           let v2, vt2 = apply_values loc (v, vt) (List.map (fun (n, t) -> (Atom n, t)) rest) in
                           let ss', b = go None (Some (v2, vt2)) gs in
                           (ss @ ss', b))
                 in
                 ([], Lam (names, consume f 0 ()))
               end
           | Some f ->
               (* a function-valued body: its value, at the remaining type *)
               let rest_want = List.fold_right (fun g acc -> M.Fun (g, acc, true)) wgs res in
               let ss, v, _ = lower ~expect:rest_want f in
               (ss, v)
           | None ->
               (match body_val with
                | Some (v, vt) ->
                    let v2, vt2 = apply_values loc (v, vt) (List.map (fun (n, t) -> (Atom n, t)) atoms) in
                    let ss', b = go None (Some (v2, vt2)) gs in
                    ([], Lam (names, (ss', b)))
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

  and lower_let ?expect vbs body =
    match vbs with
    | [ vb ] ->
        let ss, x, t = lower vb.vb_expr in
        let rest = fun () -> lower ?expect body in
        (match vb.vb_pat.pat_desc with
         | Tpat_var (id, _) ->
             let name = bind_local id t in
             let ss2, y, ty = rest () in
             (ss @ [ Let (name, x) ] @ ss2, y, ty)
         | _ when irrefutable vb.vb_pat ->
             let pat = pattern ~mty:t vb.vb_pat in
             let ss2, y, ty = rest () in
             (ss @ [ Let (pat, x) ] @ ss2, y, ty)
         | _ ->
             let pat = pattern ~mty:t vb.vb_pat in
             let ss2, y, ty = rest () in
             ( ss, Match (x, [ (pat, (ss2, y)); ("_", ([], match_failure vb.vb_loc)) ]), ty ))
    | _ ->
        (* evaluate every right-hand side (left to right) before binding *)
        let temps =
          List.map
            (fun vb ->
              let ss, x, t = lower vb.vb_expr in
              let tmp = fresh "t" in
              (ss @ [ Let (tmp, x) ], tmp, t, vb))
            vbs
        in
        let binds =
          List.map
            (fun (_, tmp, t, vb) ->
              if not (irrefutable vb.vb_pat) then unsupported vb.vb_loc "refutable let-and";
              Let (pattern ~mty:t vb.vb_pat, Atom tmp))
            temps
        in
        let ss2, y, ty = lower ?expect body in
        (List.concat_map (fun (ss, _, _, _) -> ss) temps @ binds @ ss2, y, ty)

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
    let arms =
      List.map
        (fun c ->
          let pat =
            match c.c_lhs.pat_desc with
            | Tpat_any -> catch_all := true; "_"
            | Tpat_var (id, _) -> catch_all := true; bind_local id (M.Named ("Error", []))
            | Tpat_construct (_, cd, [], _) when cd.Types.cstr_name = "Noparse" -> "@parser.Noparse"
            | Tpat_construct (_, cd, [ { pat_desc = Tpat_any; _ } ], _) when cd.Types.cstr_name = "Failure" -> "Failure(_)"
            | Tpat_construct (_, cd, [ { pat_desc = Tpat_var (id, _); _ } ], _) when cd.Types.cstr_name = "Failure" ->
                "Failure(" ^ bind_local id (M.Named ("String", [])) ^ ")"
            | _ -> unsupported c.c_lhs.pat_loc "exception pattern"
          in
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
