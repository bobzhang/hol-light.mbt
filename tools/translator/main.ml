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
    | "meson.ml" -> ("meson/meson.mbt", [])
    | "firstorder.ml" -> ("firstorder/firstorder.mbt", [])
    | "quot.ml" -> ("quot/quot.mbt", [])
    | "impconv.ml" -> ("impconv/impconv.mbt", [])
    | "pair.ml" -> ("pair/pair.mbt", [])
    | "metis.ml" -> ("metis/metis.mbt", [])
    | "thecops.ml" -> ("thecops/thecops.mbt", [])
    | "ocaml_map.ml" -> ("omap/omap.mbt", [])
    | "ocaml_set.ml" -> ("oset/oset.mbt", [])
    | "compute.ml" -> ("compute/compute.mbt", [])
    | "nums.ml" -> ("nums/nums.mbt", [])
    | "recursion.ml" -> ("recursion/recursion.mbt", [])
    | "arith.ml" -> ("arith/arith.mbt", [])
    | "wf.ml" -> ("wf/wf.mbt", [])
    | "calc_num.ml" -> ("calc_num/calc_num.mbt", [])
    | "normalizer.ml" -> ("normalizer/normalizer.mbt", [])
    | "grobner.ml" -> ("grobner/grobner.mbt", [])
    | "ind_types.ml" -> ("ind_types/ind_types.mbt", [])
    | "lists.ml" -> ("lists/lists.mbt", [])
    | "realax.ml" -> ("realax/realax.mbt", [])
    | "calc_int.ml" -> ("calc_int/calc_int.mbt", [])
    | "realarith.ml" -> ("realarith/realarith.mbt", [])
    | "real.ml" -> ("real/real.mbt", [])
    | "calc_rat.ml" -> ("calc_rat/calc_rat.mbt", [])
    | "int.ml" -> ("int/int.mbt", [])
    | "sets.ml" -> ("sets/sets.mbt", [])
    | "iterate.ml" -> ("iterate/iterate.mbt", [])
    | "cart.ml" -> ("cart/cart.mbt", [])
    | "define.ml" -> ("define/define.mbt", [])
    | "Jordan/tactics_refine.ml" ->
        (* dump_thm and load_thm marshal theorems to and from a file: by
           hand (jordan/tactics_refine/dump.mbt), and they only fail *)
        ( "jordan/tactics_refine/tactics_refine.mbt",
          [ { Emit.line = 71; setup = None; names = [ ("dump_thm", "dump_thm") ] };
            { Emit.line = 76; setup = None; names = [ ("load_thm", "load_thm") ] } ] )
    | f when (match Names.package_of_file f with Some p -> String.contains p '/' | None -> false) ->
        let p = Option.get (Names.package_of_file f) in
        (* moon takes *_test.mbt (and *_wbtest.mbt) for test files *)
        let b = Filename.basename p in
        let b = if Filename.check_suffix b "test" then b ^ "_ml" else b in
        (p ^ "/" ^ b ^ ".mbt", [])
    | f -> failwith ("no manifest entry for " ^ f)

  let rec translate ~hol ~root target =
    Names.root := root;
    Loader.stdlib_dir := Filename.concat root "tools/translator/stdlib";
    Functors.stdlib_dir := !Loader.stdlib_dir;
    Translator.hol_dir := hol;
    List.iter
      (fun f ->
        (* translated packages: their types are generated with these names *)
        let translated = (try ignore (manifest f); true with Failure _ -> false) in
        let on_item =
          match Names.package_of_file f with
          | Some pkg when translated -> Emit.register pkg
          | _ -> fun _ -> ()
        in
        Loader.load_file ~hol ~on_item f)
      (Translator.upto target Translator.prefix);
    translate_loaded ~hol ~root target

  (* translate `target`, everything before it being loaded *)
  and translate_loaded ~hol ~root target =
    let out, hand = manifest target in
    Lower.current_file := target;
    Lower.current_pkg := Filename.dirname out;
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
                        (* every variable of the pattern (`let [A; B] = ...` too) *)
                        let names p =
                          let acc = ref [] in
                          let open Ast_iterator in
                          let it =
                            { default_iterator with
                              pat = (fun self q ->
                                (match q.Parsetree.ppat_desc with
                                 | Parsetree.Ppat_var { txt; _ } | Parsetree.Ppat_alias (_, { txt; _ }) -> acc := txt :: !acc
                                 | _ -> ());
                                default_iterator.pat self q) }
                          in
                          it.pat it p;
                          (* an or-pattern binds each name once *)
                          List.sort_uniq compare !acc
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
      (Loader.phrases (Loader.source ~hol target));
    Loader.load_file ~hol ~on_item:(Emit.item ~hand) target;
    Emit.output ~source:target ~out:(Filename.concat root out);
    Printf.printf "wrote %s; %d unsupported items\n" out !Emit.errors

  (* Several files in one session (tools/ocaml_ref/batch.py). The plan is a
     tree of steps after hol.ml's files: `Load f` loads a file, `Target f`
     translates it in a forked child (a copy of the session, so no per-file
     translator state carries over), runs `after <f>` (`moon info`: the
     interfaces the next translations read) and then loads it; `Branch
     steps` runs steps in a forked child, so that files loaded there do not
     reach the steps after it. Stops at the first failure (exit status 1). *)
  (* `Mid (f, g, files)`: `f` loads `g` part-way through, which brings in
     `files` there (theory.py's mid_plan) *)
  type step = Load of string | Target of string | Branch of step list | Mid of string * string * string list

  let translate_batch ~hol ~root ~after plan =
    Names.root := root;
    Loader.stdlib_dir := Filename.concat root "tools/translator/stdlib";
    Functors.stdlib_dir := !Loader.stdlib_dir;
    Translator.hol_dir := hol;
    let load f =
      let translated = (try ignore (manifest f); true with Failure _ -> false) in
      let on_item =
        match Names.package_of_file f with
        | Some pkg when translated -> Emit.register pkg
        | _ -> fun _ -> ()
      in
      Loader.load_file ~hol ~on_item f
    in
    let fail msg = Printf.printf "BATCH FAILED: %s\n%!" msg; exit 1 in
    let loaded = Hashtbl.create 64 in
    let load_new f = if not (Hashtbl.mem loaded f) then (Hashtbl.add loaded f (); load f) in
    let flush () = flush_all (); Format.pp_print_flush Format.std_formatter () in
    let mids : (string * string, string list) Hashtbl.t = Hashtbl.create 4 in
    let mid_files target = Hashtbl.fold (fun (t, _) fs acc -> if t = target then fs @ acc else acc) mids [] in
    (* the session's `needs` (translate.sh): a file loaded part-way through
       the file being loaded is loaded now *)
    Loader.needs_hook :=
      (fun g -> match Hashtbl.find_opt mids (!Loader.current, g) with
         | Some fs -> List.iter load_new fs
         | None -> ());
    let rec run = function
      | [] -> ()
      | Mid (f, g, fs) :: rest -> Hashtbl.replace mids (f, g) fs; run rest
      | Load f :: rest -> load_new f; run rest
      | Target target :: rest ->
          (* the translator's own dependency order must agree with the plan *)
          List.iter
            (fun f ->
              if not (Hashtbl.mem loaded f || List.mem f (mid_files target)) then
                fail ("unplanned dependency " ^ f ^ " of " ^ target))
            (Translator.upto target Translator.prefix);
          flush ();
          (match Unix.fork () with
           | 0 ->
               (try
                  Hashtbl.iter (fun (t, g) _ -> if t = target then Hashtbl.replace Lower.mid_needs g ()) mids;
                  translate_loaded ~hol ~root target;
                  flush ();
                  Unix._exit (if !Emit.errors = 0 then 0 else 3)
                with e ->
                  (* a typing error with its location and message *)
                  (try Location.report_exception Format.std_formatter e; Format.pp_print_flush Format.std_formatter ()
                   with _ -> ());
                  Printf.printf "Exception: %s\n%!" (Printexc.to_string e);
                  Unix._exit 2)
           | pid ->
               (match Unix.waitpid [] pid with
                | _, Unix.WEXITED 0 -> ()
                | _, Unix.WEXITED 3 -> fail ("unsupported items in " ^ target)
                | _ -> fail ("translation of " ^ target)));
          if Sys.command (after ^ " " ^ Filename.quote target) <> 0 then fail ("after " ^ target);
          load_new target;
          run rest
      | Branch steps :: rest ->
          flush ();
          (match Unix.fork () with
           | 0 -> run steps; flush (); Unix._exit 0
           | pid ->
               (match Unix.waitpid [] pid with
                | _, Unix.WEXITED 0 -> ()
                | _ -> fail "a branch failed"));
          run rest
    in
    List.iter load_new Translator.prefix;
    run plan;
    print_endline "BATCH DONE"

  let survey = Translator.survey
end
