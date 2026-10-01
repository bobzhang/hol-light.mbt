(* OCaml -> MoonBit translator for HOL Light (spike). Plain OCaml: loaded
   before pa_j. See tools/ocaml_ref/translate.sh. *)
module Translator = struct
  let phrases target =
    let ic = open_in target in
    let lb = Lexing.from_channel ic in
    Location.init lb target;
    let ps = !Toploop.parse_use_file lb in
    close_in ic; ps

  let show_item item =
    match item.Typedtree.str_desc with
    | Typedtree.Tstr_value (_, vbs) ->
        List.iter (fun vb ->
          let ids = Typedtree.pat_bound_idents vb.Typedtree.vb_pat in
          List.iter (fun id ->
            Format.printf "val %s : %a@." (Ident.name id)
              Printtyp.type_expr vb.Typedtree.vb_pat.Typedtree.pat_type) ids) vbs
    | Typedtree.Tstr_eval _ -> Format.printf "eval@."
    | _ -> Format.printf "other item@."

  let main target =
    List.iter (fun p ->
      (match p with
       | Parsetree.Ptop_def str ->
           (try
              let (tstr, _, _, _, _) =
                Typemod.type_toplevel_phrase !Toploop.toplevel_env str in
              List.iter show_item tstr.Typedtree.str_items
            with e -> Format.printf "type error: %s@." (Printexc.to_string e))
       | Parsetree.Ptop_dir _ -> ());
      ignore (Toploop.execute_phrase false Format.err_formatter p))
      (phrases target)
end
