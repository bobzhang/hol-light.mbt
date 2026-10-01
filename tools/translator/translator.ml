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

module Loader = struct
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
      (phrases (Filename.concat hol file))
end

module Names = struct
  (* Upstream file -> MoonBit package. *)
  let package_of_file = function
    | "lib.ml" -> Some "lib"
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
  let resolve file name =
    let name = match String.rindex_opt name '.' with Some i when i > 0 && i < String.length name - 1 -> String.sub name (i + 1) (String.length name - i - 1) | _ -> name in
    let rec go_pkgs = function
      | [] -> None
      | pkg :: pkgs ->
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
  let prefix = [ "lib.ml"; "fusion.ml"; "basics.ml"; "nets.ml"; "printer.ml";
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

