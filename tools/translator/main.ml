(* Entry points and the per-file manifest of the translator. *)
module Main = struct
  (* upstream file -> (output file, hand-ported phrases) *)
  let manifest = function
    | "theorems.ml" ->
        ( "theorems/theorems.mbt",
          [ { Emit.line = 418; setup = Some "destruct_setup";
              names = [ ("DESTRUCT_TAC", "destruct_tac"); ("FIX_TAC", "fix_tac");
                        ("INTRO_TAC", "intro_tac"); ("HYP_TAC", "hyp_tac") ] } ] )
    | f -> failwith ("no manifest entry for " ^ f)

  let translate ~hol ~root target =
    let out, hand = manifest target in
    Names.root := root;
    Lower.current_file := target;
    List.iter (Loader.load_file ~hol) (Translator.upto target Translator.prefix);
    Loader.load_file ~hol ~on_item:(Emit.item ~hand) target;
    Emit.output ~source:target ~out:(Filename.concat root out);
    Printf.printf "wrote %s; %d unsupported items\n" out !Emit.errors

  let survey = Translator.survey
end
