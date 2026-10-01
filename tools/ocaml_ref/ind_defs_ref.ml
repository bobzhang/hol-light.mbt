(* Load-fidelity and behaviour test for ind_defs.ml (translated by
   tools/translator). Keep in sync with ind_defs/ind_defs_ref_test.mbt. *)
#use "bool.ml";;
#use "drule.ml";;
#use "tactics.ml";;
#use "itab.ml";;
#use "simp.ml";;
#use "theorems.ml";;
start_trace ();;
#use "ind_defs.ml";;
show_trace "ind_defs";;
let tm s = parse_term s;;
let s3 (a,b,c) = sthm a ^ " ;; " ^ sthm b ^ " ;; " ^ sthm c;;
attempt "strip_ncomb" (fun () -> let t = tm "(f:A->A->A->A) a b c" in
  let h, args = strip_ncomb 2 t in stm h ^ " " ^ slist stm args);;
attempt "strip_ncomb_bad" (fun () -> let t = tm "(f:A->A) a" in
  let h, args = strip_ncomb 2 t in stm h ^ " " ^ slist stm args);;
attempt "RIGHT_BETAS" (fun () -> let x = tm "x:A" in let y = tm "y:A" in let f = tm "(\\a b. (P:A->A->bool) b a) = Q" in
  sthm (RIGHT_BETAS [x; y] (ASSUME f)));;
attempt "EXISTS_EQUATION" (fun () -> let e = tm "(x:A) = a" in let th = ASSUME (tm "(P:A->bool) a") in
  sthm (EXISTS_EQUATION e th));;
attempt "RTC" (fun () -> let t = tm "(!x:A. RTC R x x) /\\ (!x y z. R x y /\\ RTC R y z ==> RTC R x z)" in
  s3 (new_inductive_definition t));;
attempt "EVOD" (fun () -> let t = tm "EV (a:A) /\\ (!x. OD x ==> EV ((f:A->A) x)) /\\ (!x. EV x ==> OD (f x))" in
  s3 (new_inductive_definition t));;
attempt "EVB" (fun () -> let t = tm "EVB T /\\ (!x. ODB x ==> EVB (~x)) /\\ (!x. EVB x ==> ODB (~x))" in
  s3 (new_inductive_definition t));;
attempt "strong_ok" (fun () -> let t = tm "NB F /\\ (!x. NB x ==> NB (~x))" in
  let rules, ind, cases = new_inductive_definition t in sthm (derive_strong_induction (rules, ind)));;
attempt "ACC" (fun () -> let t = tm "!x:A. (!y. R y x ==> ACC R y) ==> ACC R x" in
  s3 (new_inductive_definition t));;
attempt "RTC_again" (fun () -> let t = tm "(!x:A. RTC R x x) /\\ (!x y z. R x y /\\ RTC R y z ==> RTC R x z)" in
  s3 (new_inductive_definition t));;
attempt "exist" (fun () -> let t = tm "(!x:A. TC R x x ==> TC R x x) /\\ (!x y. R x y ==> TC R x y)" in
  sthm (prove_inductive_relations_exist t));;
attempt "derive_nonschematic" (fun () -> let t = tm "(!x:A. Q x) /\\ (!x. Q x ==> Q ((g:A->A) x))" in
  sthm (derive_nonschematic_inductive_relations t));;
attempt "bad_clause" (fun () -> let t = tm "!x:A. ~(BAD x) ==> BAD x" in s3 (new_inductive_definition t));;
attempt "strong" (fun () -> let t = tm "EV2 (a:A) /\\ (!x. EV2 x ==> EV2 ((f:A->A) x))" in
  let rules, ind, cases = new_inductive_definition t in sthm (derive_strong_induction (rules, ind)));;
attempt "prove_monotonicity_hyps" (fun () -> let th = ASSUME (tm "(!x:A. P x ==> Q x) ==> R") in
  sthm (prove_monotonicity_hyps th));;
attempt "MONO_TAC" (fun () -> let w = tm "(!x:A. P x ==> Q x) ==> (!x. P x /\\ c) ==> (!x. Q x /\\ c)" in
  let (_,gls,_) = (DISCH_TAC THEN MONO_TAC) ([],w) in string_of_int (length gls));;
attempt "the_inductive_definitions" (fun () -> String.concat " | " (map s3 (!the_inductive_definitions)));;
attempt "monotonicity_theorems" (fun () -> string_of_int (length (!monotonicity_theorems)));;
attempt "constants" (fun () -> String.concat " " (map fst (constants())));;
attempt "definitions" (fun () -> String.concat " ;; " (map sthm (definitions())));;
attempt "axioms" (fun () -> string_of_int (length (axioms())));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
