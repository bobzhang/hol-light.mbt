(* Entry points and the per-file manifest of the translator. *)
module Main = struct
  (* upstream file -> (output file, hand-ported phrases) *)
  let manifest = function
    | "theorems.ml" ->
        ( "theorems/theorems.mbt",
          [ { Emit.line = 418; setup = Some "destruct_setup";
              names = [ ("DESTRUCT_TAC", "destruct_tac"); ("FIX_TAC", "fix_tac");
                        ("INTRO_TAC", "intro_tac"); ("HYP_TAC", "hyp_tac") ] } ] )
    | "ind_defs.ml" -> ("ind_defs/ind_defs.mbt", [])
    | "class.ml" -> ("class/class.mbt", [])
    | "trivia.ml" -> ("trivia/trivia.mbt", [])
    | "canon.ml" -> ("canon/canon.mbt", [])
    | f -> failwith ("no manifest entry for " ^ f)

  let translate ~hol ~root target =
    let out, hand = manifest target in
    Names.root := root;
    Lower.current_file := target;
    List.iter (Loader.load_file ~hol) (Translator.upto target Translator.prefix);
    (* count the top-level definitions of each name *)
    List.iter
      (function
        | Parsetree.Ptop_def str ->
            List.iter
              (fun item ->
                match item.Parsetree.pstr_desc with
                | Parsetree.Pstr_value (_, vbs) ->
                    List.iter
                      (fun vb ->
                        let rec names p =
                          match p.Parsetree.ppat_desc with
                          | Parsetree.Ppat_var { txt; _ } -> [ txt ]
                          | Parsetree.Ppat_tuple ps -> List.concat_map names ps
                          | Parsetree.Ppat_constraint (p, _) | Parsetree.Ppat_alias (p, _) -> names p
                          | _ -> []
                        in
                        List.iter
                          (fun n ->
                            Hashtbl.replace Emit.remaining_defs n
                              (1 + try Hashtbl.find Emit.remaining_defs n with Not_found -> 0))
                          (names vb.Parsetree.pvb_pat))
                      vbs
                | _ -> ())
              str
        | _ -> ())
      (Loader.phrases (Filename.concat hol target));
    Loader.load_file ~hol ~on_item:(Emit.item ~hand) target;
    Emit.output ~source:target ~out:(Filename.concat root out);
    Printf.printf "wrote %s; %d unsupported items\n" out !Emit.errors

  let survey = Translator.survey
end
