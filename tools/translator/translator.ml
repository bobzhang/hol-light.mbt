(* OCaml -> MoonBit translator for HOL Light. Plain OCaml, loaded into a
   custom toplevel (with compiler-libs) before pa_j; see
   tools/ocaml_ref/translate.sh.

   Upstream files are loaded phrase by phrase through `Loader.load_file`,
   which typechecks each phrase in the live toplevel environment, records
   which file defined each toplevel value (provenance), and executes it. *)

module Prov = struct
  (* Ident.unique_name of a toplevel value -> (upstream file, OCaml name) *)
  let table : (string, string * string) Hashtbl.t = Hashtbl.create 4096

  (* called with each name a phrase binds and its installed value *)
  let on_record : (string -> Types.value_description -> unit) ref = ref (fun _ _ -> ())

  let record file name =
    match Env.find_value_by_name (Longident.Lident name) !Toploop.toplevel_env with
    | (Path.Pident id, vd) ->
        Hashtbl.replace table (Ident.unique_name id) (file, name); !on_record name vd
    | (p, vd) -> Hashtbl.replace table (Path.name p) (file, name); !on_record name vd
    | exception Not_found -> ()

  (* a member of a toplevel (possibly nested) module: `Meson.x`,
     `Utils.List.take` *)
  let record_dotted_lid file lid name =
    match Env.find_value_by_name (Longident.Ldot (lid, name)) !Toploop.toplevel_env with
    | (p, vd) ->
        (* the qualified name, e.g. `Utils.List.take` *)
        let qname = String.concat "." (Longident.flatten lid) ^ "." ^ name in
        Hashtbl.replace table (Path.name p) (file, qname); !on_record name vd
    | exception Not_found -> ()

  let rec record_module file lid (sg : Types.signature) =
    List.iter
      (function
        | Types.Sig_value (id, _, _) -> record_dotted_lid file lid (Ident.name id)
        | Types.Sig_module (mid, _, { Types.md_type = Types.Mty_signature sg'; _ }, _, _) ->
            record_module file (Longident.Ldot (lid, Ident.name mid)) sg'
        | _ -> ())
      sg

  let record_dotted file modname name = record_dotted_lid file (Longident.Lident modname) name

  let lookup path =
    match path with
    | Path.Pident id -> Hashtbl.find_opt table (Ident.unique_name id)
    | p -> Hashtbl.find_opt table (Path.name p)
end

(* Functor applications are specialized before a phrase is typechecked:
   `F (A)` becomes `struct module P = A <F's body> end`, so each
   application is translated as an ordinary module (OCaml executes a
   functor's body at each application too). The parameter is a module
   alias of the argument. A free module name of the body must mean what it
   meant where the functor was defined: a library module that is shadowed
   at the application gets an alias to it first; a shadowed user module is
   rejected. `Map.Make` and `Set.Make` of the Stdlib have the bodies in
   tools/translator/stdlib/{map,set}_make.ml (over Ocaml_map/Ocaml_set). *)
module Functors = struct
  open Parsetree

  type mdef = {
    id : int;
    lib : string option;  (* an alias of this library module (`Stdlib.Map`) *)
    members : (string, mdef) Hashtbl.t;
    mutable functor_ : (string * structure * (string * mdef option) list) option;
        (* parameter, body, the visible modules where it was defined *)
  }

  let counter = ref 0

  let rec lookup_fwd frames name =
    match frames with
    | [] -> None
    | f :: rest -> (match Hashtbl.find_opt f name with Some d -> Some d | None -> lookup_fwd rest name)
  let fresh ?lib () = incr counter; { id = !counter; lib; members = Hashtbl.create 8; functor_ = None }

  (* the library module a name denotes, if it is not a user module *)
  let library_of frames name =
    match lookup_fwd frames name with
    | None -> Some name
    | Some { lib = Some l; _ } -> Some l
    | Some _ -> None

  (* innermost frame first; the last frame is the toplevel *)
  let toplevel : (string, mdef) Hashtbl.t = Hashtbl.create 64

  let rec lookup frames name =
    match frames with
    | [] -> None
    | f :: rest -> (match Hashtbl.find_opt f name with Some d -> Some d | None -> lookup rest name)

  let rec resolve frames (lid : Longident.t) =
    match lid with
    | Longident.Lident n -> lookup frames n
    | Longident.Ldot (l, n) -> (match resolve frames l with Some d -> Hashtbl.find_opt d.members n | None -> None)
    | Longident.Lapply _ -> None

  let stdlib_dir = ref ""

  let template name =
    let file = Filename.concat !stdlib_dir name in
    let ic = open_in file in
    let text = really_input_string ic (in_channel_length ic) in
    close_in ic;
    Parse.implementation (Lexing.from_string text)

  let builtin (lid : Longident.t) frames =
    let path = Longident.flatten lid in
    let path, explicit = match path with "Stdlib" :: rest -> (rest, true) | p -> (p, false) in
    match path with
    | [ m; "Make" ] ->
        let lib = if explicit then Some ("Stdlib." ^ m) else library_of frames m in
        (match lib with
         | Some ("Map" | "Stdlib.Map") -> Some "map_make.ml"
         | Some ("Set" | "Stdlib.Set") -> Some "set_make.ml"
         | _ -> None)
    | _ -> None

  (* module names a structure binds anywhere inside it *)
  let bound_modules (str : structure) =
    let acc = ref [] in
    let open Ast_iterator in
    let it =
      { default_iterator with
        structure_item = (fun self si ->
          (match si.pstr_desc with
           | Pstr_module { pmb_name = { txt = Some n; _ }; _ } -> acc := n :: !acc
           | Pstr_recmodule mbs -> List.iter (function { pmb_name = { txt = Some n; _ }; _ } -> acc := n :: !acc | _ -> ()) mbs
           | _ -> ());
          default_iterator.structure_item self si);
        expr = (fun self e ->
          (match e.pexp_desc with Pexp_letmodule ({ txt = Some n; _ }, _, _) -> acc := n :: !acc | _ -> ());
          default_iterator.expr self e) }
    in
    it.structure it str;
    !acc

  (* the head module names of the qualified names a structure uses *)
  let free_heads (str : structure) =
    let acc = ref [] in
    let add (lid : Longident.t) =
      match Longident.flatten lid with
      | h :: _ :: _ -> if not (List.mem h !acc) then acc := h :: !acc
      | _ -> ()
    in
    let add_mod (lid : Longident.t) =
      match Longident.flatten lid with h :: _ -> if not (List.mem h !acc) then acc := h :: !acc | [] -> ()
    in
    let open Ast_iterator in
    let it =
      { default_iterator with
        expr = (fun self e ->
          (match e.pexp_desc with
           | Pexp_ident { txt; _ } | Pexp_construct ({ txt; _ }, _) | Pexp_field (_, { txt; _ })
           | Pexp_setfield (_, { txt; _ }, _) | Pexp_new { txt; _ } -> add txt
           | Pexp_record (fs, _) -> List.iter (fun ({ Location.txt; _ }, _) -> add txt) fs
           | _ -> ());
          default_iterator.expr self e);
        pat = (fun self p ->
          (match p.ppat_desc with
           | Ppat_construct ({ txt; _ }, _) | Ppat_type { txt; _ } -> add txt
           | Ppat_record (fs, _) -> List.iter (fun ({ Location.txt; _ }, _) -> add txt) fs
           | _ -> ());
          default_iterator.pat self p);
        typ = (fun self t ->
          (match t.ptyp_desc with Ptyp_constr ({ txt; _ }, _) | Ptyp_class ({ txt; _ }, _) -> add txt | _ -> ());
          default_iterator.typ self t);
        module_expr = (fun self m ->
          (match m.pmod_desc with Pmod_ident { txt; _ } -> add_mod txt | _ -> ());
          default_iterator.module_expr self m);
        module_type = (fun self m ->
          (match m.pmty_desc with Pmty_ident { txt; _ } | Pmty_alias { txt; _ } -> add txt | _ -> ());
          default_iterator.module_type self m) }
    in
    it.structure it str;
    !acc

  let visible frames =
    let seen = Hashtbl.create 64 in
    List.iter (fun f -> Hashtbl.iter (fun n d -> if not (Hashtbl.mem seen n) then Hashtbl.replace seen n d) f) frames;
    Hashtbl.fold (fun n d acc -> (n, Some d) :: acc) seen []

  let loc = Location.none
  let mk_lid s = { Location.txt = Longident.parse s; loc }

  let module_item name (me : module_expr) =
    { pstr_desc = Pstr_module { pmb_name = { txt = Some name; loc }; pmb_expr = me; pmb_attributes = []; pmb_loc = loc };
      pstr_loc = loc }

  exception Unsupported_functor of string

  (* `F (A)` -> the items of the specialized structure *)
  let specialize frames (f : Longident.t) (arg : module_expr) : structure =
    let param, body, def_scope =
      match builtin f frames with
      | Some file ->
          ("Ord", template file, List.map (fun m -> (m, Hashtbl.find_opt toplevel m)) [ "Ocaml_map"; "Ocaml_set" ])
      | None ->
          (match resolve frames f with
           | Some { functor_ = Some fn; _ } -> fn
           | _ -> raise (Unsupported_functor (String.concat "." (Longident.flatten f))))
    in
    let inner = bound_modules body in
    let hygiene =
      List.filter_map
        (fun h ->
          if h = param || List.mem h inner || h = "Stdlib" then None
          else
            let at_def = match List.assoc_opt h def_scope with Some d -> d | None -> None in
            let at_app = lookup frames h in
            let lib_of = function None -> Some h | Some { lib = Some l; _ } -> Some l | Some _ -> None in
            match at_def, at_app with
            | _ when lib_of at_def <> None && lib_of at_def = lib_of at_app -> None
            | Some d, Some a when d.id = a.id -> None
            | None, Some _ -> Some (module_item h { pmod_desc = Pmod_ident (mk_lid ("Stdlib." ^ h)); pmod_loc = loc; pmod_attributes = [] })
            | _ -> raise (Unsupported_functor ("module " ^ h ^ " is shadowed where the functor is applied")))
        (free_heads body)
    in
    hygiene @ (module_item param arg :: body)

  let rec rewrite_items frames (items : structure) : structure =
    let frame = List.hd frames in
    List.concat_map (fun it -> rewrite_item frames frame it) items

  (* a module expression -> (rewritten, its definition) *)
  and rewrite_mexpr frames (me : module_expr) : module_expr * mdef option =
    match me.pmod_desc with
    | Pmod_structure items ->
        let d = fresh () in
        let items = rewrite_items (d.members :: frames) items in
        ({ me with pmod_desc = Pmod_structure items }, Some d)
    | Pmod_apply ({ pmod_desc = Pmod_ident { txt = f; _ }; _ }, ({ pmod_desc = Pmod_ident _; _ } as arg)) ->
        let items = specialize frames f arg in
        rewrite_mexpr frames { me with pmod_desc = Pmod_structure items }
    | Pmod_ident { txt; _ } ->
        (match resolve frames txt with
         | Some d -> (me, Some d)
         | None ->
             (* an alias of a library module *)
             let path = String.concat "." (Longident.flatten txt) in
             let path = match Longident.flatten txt with h :: rest -> (match library_of frames h with Some l -> String.concat "." (l :: rest) | None -> path) | [] -> path in
             (me, Some (fresh ~lib:path ())))
    | Pmod_constraint (inner, mty) ->
        let inner, d = rewrite_mexpr frames inner in
        ({ me with pmod_desc = Pmod_constraint (inner, mty) }, d)
    | Pmod_functor (Named ({ txt = Some p; _ }, _), body) ->
        let d = fresh () in
        (match body.pmod_desc with
         | Pmod_structure items | Pmod_constraint ({ pmod_desc = Pmod_structure items; _ }, _) ->
             d.functor_ <- Some (p, items, visible frames)
         | _ -> ());
        (me, Some d)
    | _ -> (me, None)

  and rewrite_item frames frame (it : structure_item) : structure =
    match it.pstr_desc with
    | Pstr_module ({ pmb_name = { txt = Some name; _ }; pmb_expr; _ } as mb) ->
        let me, d = rewrite_mexpr frames pmb_expr in
        (match d with Some d -> Hashtbl.replace frame name d | None -> Hashtbl.replace frame name (fresh ()));
        [ { it with pstr_desc = Pstr_module { mb with pmb_expr = me } } ]
    | Pstr_include ({ pincl_mod; _ } as incl) ->
        let me, d = rewrite_mexpr frames pincl_mod in
        (* the included modules become members of this one *)
        (match d with Some d -> Hashtbl.iter (fun n m -> Hashtbl.replace frame n m) d.members | None -> ());
        [ { it with pstr_desc = Pstr_include { incl with pincl_mod = me } } ]
    | Pstr_open ({ popen_expr = { pmod_desc = Pmod_ident { txt; _ }; _ }; _ }) ->
        (match resolve frames txt with
         | Some d -> Hashtbl.iter (fun n m -> Hashtbl.replace frame n m) d.members
         | None -> ());
        [ it ]
    | _ -> [ it ]

  let rewrite (str : structure) : structure = rewrite_items [ toplevel ] str
end

module Loader = struct
  (* OCaml Stdlib replacements (e.g. ocaml_map.ml) live in this directory
     instead of the HOL Light tree *)
  let stdlib_dir = ref ""

  let source ~hol file =
    if String.length file > 6 && String.sub file 0 6 = "ocaml_" then Filename.concat !stdlib_dir file
    else Filename.concat hol file

  let phrases file =
    let ic = open_in file in
    let lb = Lexing.from_channel ic in
    Location.init lb file;
    let ps = !Toploop.parse_use_file lb in
    close_in ic;
    ps

  (* Names bound at toplevel by a typed structure item. *)
  let bound_names item =
    match item.Typedtree.str_desc with
    | Typedtree.Tstr_value (_, vbs) ->
        List.concat_map
          (fun vb -> List.map Ident.name (Typedtree.pat_bound_idents vb.Typedtree.vb_pat))
          vbs
    | Typedtree.Tstr_include incl ->
        List.filter_map
          (function Types.Sig_value (id, _, _) -> Some (Ident.name id) | _ -> None)
          incl.Typedtree.incl_type
    | Typedtree.Tstr_primitive vd -> [Ident.name vd.Typedtree.val_id]
    | _ -> []

  let typecheck str =
    let (tstr, _, _, _, _) =
      Typemod.type_toplevel_phrase !Toploop.toplevel_env str
    in
    tstr

  (* Load `file` (path relative to the HOL Light root), calling `on_item`
     with every typed structure item before it is executed. *)
  let load_file ?(on_item = fun _ -> ()) ~hol file =
    let base = Filename.basename file in
    List.iter
      (fun p ->
        match p with
        | Parsetree.Ptop_def str ->
            let str = Functors.rewrite str in
            let p = Parsetree.Ptop_def str in
            let tstr = typecheck str in
            List.iter on_item tstr.Typedtree.str_items;
            if not (Toploop.execute_phrase false Format.err_formatter p) then
              failwith ("phrase failed in " ^ base);
            List.iter
              (fun item ->
                List.iter (Prov.record base) (bound_names item);
                match item.Typedtree.str_desc with
                | Typedtree.Tstr_module { Typedtree.mb_id = Some mid; mb_expr; _ } ->
                    (match mb_expr.Typedtree.mod_type with
                     | Types.Mty_signature sg -> Prov.record_module base (Longident.Lident (Ident.name mid)) sg
                     | _ -> ())
                | _ -> ())
              tstr.Typedtree.str_items
        | Parsetree.Ptop_dir _ ->
            ignore (Toploop.execute_phrase false Format.err_formatter p))
      (phrases (source ~hol file))
end

module Names = struct
  (* Upstream file -> MoonBit package. *)
  let package_of_file = function
    | "lib.ml" -> Some "lib"
    | "ocaml_map.ml" -> Some "omap"
    | "ocaml_set.ml" -> Some "oset"
    | "fusion.ml" -> Some "kernel"
    | "basics.ml" -> Some "basics"
    | "nets.ml" -> Some "nets"
    | "printer.ml" -> Some "printer"
    | "preterm.ml" -> Some "preterm"
    | "parser.ml" -> Some "parser"
    | "equal.ml" -> Some "equal"
    | "bool.ml" -> Some "bool"
    | "drule.ml" -> Some "drule"
    | "tactics.ml" -> Some "tactics"
    | "itab.ml" -> Some "itab"
    | "simp.ml" -> Some "simp"
    | "theorems.ml" -> Some "theorems"
    | "ind_defs.ml" -> Some "ind_defs"
    | "class.ml" -> Some "class"
    | "trivia.ml" -> Some "trivia"
    | "canon.ml" -> Some "canon"
    | "meson.ml" -> Some "meson"
    | "firstorder.ml" -> Some "firstorder"
    | "quot.ml" -> Some "quot"
    | "impconv.ml" -> Some "impconv"
    | "bignum_num.ml" -> Some "num"
    | _ -> None

  (* Names that do not follow the lowercase(+suffix) rule. *)
  let special = function
    | "I" -> Some "id" | "K" -> Some "konst" | "C" -> Some "flip"
    | "W" -> Some "dup" | "o" -> Some "compose" | "F_F" -> Some "pair_map"
    | "--" -> Some "range" | "|->" -> Some "update" | "|=>" -> Some "single"
    | "fail" -> Some "failure" | "mem'" -> Some "mem_eq"
    | "insert'" -> Some "insert_eq" | "union'" -> Some "union_eq"
    | "subtract'" -> Some "subtract_eq" | "unions'" -> Some "unions_eq"
    | "then_" -> Some "then_tac" | "orelse_" -> Some "orelse_tac"
    | "thenl_" -> Some "thenl" | "then1_" -> Some "then1"
    | "thenc_" -> Some "thenc" | "orelsec_" -> Some "orelsec"
    | "then_tcl_" -> Some "then_tcl" | "orelse_tcl_" -> Some "orelse_tcl"
    | _ -> None

  (* An uppercase name whose lowercase form is itself an OCaml value (e.g.
     MK_COMB and mk_comb, INSTANTIATE and instantiate) cannot use the bare
     lowercase name. *)
  let lowercase_taken name =
    let l = String.lowercase_ascii name in
    l <> name
    && (try ignore (Env.find_value_by_name (Longident.Lident l) !Toploop.toplevel_env); true
        with Not_found -> false)

  (* An operator's MoonBit name: `%>` is `op_percent_gt`. *)
  let op_name name =
    let word = function
      | '%' -> "percent" | '>' -> "gt" | '<' -> "lt" | '=' -> "eq" | '|' -> "bar"
      | '&' -> "amp" | '+' -> "plus" | '-' -> "minus" | '*' -> "star" | '/' -> "slash"
      | '@' -> "at" | '^' -> "caret" | '!' -> "bang" | '?' -> "q" | '~' -> "tilde"
      | '.' -> "dot" | ':' -> "colon" | '$' -> "dollar" | '#' -> "hash" | c -> String.make 1 c
    in
    let is_op = name <> "" && String.for_all (fun c -> not ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c = '_' || c = '\'')) name in
    if is_op then Some ("op_" ^ String.concat "_" (List.map word (List.init (String.length name) (String.get name))))
    else None

  let candidates name =
    let base =
      String.map (fun c -> if c = '\'' then '_' else c) (String.lowercase_ascii name)
    in
    (match special name with Some s -> [s] | None -> [])
    @ (match op_name name with Some s -> [ s ] | None -> [])
    @ (if lowercase_taken name then [] else [ base ])
    @ [ base ^ "_rule"; base ^ "_thm"; base ^ "_conv"; base ^ "_tac";
        base ^ "_tcl"; base ^ "_" ]

  let root = ref "."

  (* Packages holding an upstream file's values: fusion.ml's tail (after
     the kernel module) lives in basics. *)
  let packages_of_file file =
    match package_of_file file with
    | None -> []
    | Some "kernel" -> [ "kernel"; "basics" ]
    | Some p -> [ p ]

  (* The MoonBit package and declaration for an upstream value (a module
     member's qualified name resolves by its last component). *)
  (* a generated package's module members: qualified name -> MoonBit name *)
  let member_tables : (string, (string, string) Hashtbl.t) Hashtbl.t = Hashtbl.create 16

  let members pkg =
    match Hashtbl.find_opt member_tables pkg with
    | Some t -> t
    | None ->
        let t = Hashtbl.create 16 in
        let file = Filename.concat (Filename.concat !root pkg) "translated_names.txt" in
        if Sys.file_exists file then begin
          let ic = open_in file in
          (try
             while true do
               let line = input_line ic in
               if String.length line > 0 && line.[0] <> '#' then
                 match String.split_on_char ' ' line with
                 | [ k; m ] -> Hashtbl.replace t k m
                 | _ -> ()
             done
           with End_of_file -> ());
          close_in ic
        end;
        Hashtbl.replace member_tables pkg t;
        t

  let resolve file name =
    let qualified = name in
    let name = match String.rindex_opt name '.' with Some i when i > 0 && i < String.length name - 1 -> String.sub name (i + 1) (String.length name - i - 1) | _ -> name in
    let rec go_pkgs = function
      | [] -> None
      | pkg :: pkgs ->
          match Hashtbl.find_opt (members pkg) qualified with
          | Some m -> Option.map (fun d -> (pkg, m, d)) (Mbti.find ~root:!root pkg m)
          | None ->
          let rec go = function
            | [] -> go_pkgs pkgs
            | c :: cs ->
                (match Mbti.find ~root:!root pkg c with
                 | Some d -> Some (pkg, c, d)
                 | None -> go cs)
          in
          go (candidates name)
    in
    go_pkgs (packages_of_file file)
end

module Survey = struct
  (* Every external value a typed item refers to. *)
  let refs item =
    let acc = ref [] in
    let open Tast_iterator in
    let expr sub e =
      (match e.Typedtree.exp_desc with
       | Typedtree.Texp_ident (p, _, _) -> acc := p :: !acc
       | _ -> ());
      default_iterator.expr sub e
    in
    let it = { default_iterator with expr } in
    it.structure_item it item;
    !acc

  let missing : (string, unit) Hashtbl.t = Hashtbl.create 64

  let report target item =
    List.iter
      (fun p ->
        match Prov.lookup p with
        | Some (file, _) when file = target -> ()
        | Some (file, name) ->
            (match Names.resolve file name with
             | Some _ -> ()
             | None ->
                 let key = file ^ ":" ^ name in
                 if not (Hashtbl.mem missing key) then begin
                   Hashtbl.add missing key ();
                   Printf.printf "missing %s\n" key
                 end)
        | None -> ())
      (refs item)
end

module Translator = struct
  let prefix = [ "ocaml_map.ml"; "ocaml_set.ml"; "lib.ml"; "fusion.ml"; "basics.ml"; "nets.ml"; "printer.ml";
                 "preterm.ml"; "parser.ml"; "equal.ml"; "bool.ml"; "drule.ml";
                 "tactics.ml"; "itab.ml"; "simp.ml"; "theorems.ml";
                 "ind_defs.ml"; "class.ml"; "trivia.ml"; "canon.ml";
                 "meson.ml"; "firstorder.ml"; "metis.ml"; "thecops.ml";
                 "quot.ml"; "impconv.ml" ]

  let rec upto target = function
    | [] -> []
    | f :: fs -> if f = target then [] else f :: upto target fs

  let survey ~hol ~root target =
    Names.root := root;
    List.iter (Loader.load_file ~hol) (upto target prefix);
    Loader.load_file ~hol ~on_item:(Survey.report target) target
end

