(* Load-fidelity and behaviour test for thecops.ml (translated by
   tools/translator). Keep in sync with thecops/thecops_ref_test.mbt. *)
#use "bool.ml";;
#use "drule.ml";;
#use "tactics.ml";;
#use "itab.ml";;
#use "simp.ml";;
#use "theorems.ml";;
#use "ind_defs.ml";;
#use "class.ml";;
#use "trivia.ml";;
#use "canon.ml";;
#use "meson.ml";;
#use "firstorder.ml";;
#use "metis.ml";;
start_trace ();;
#use "thecops.ml";;
show_trace "thecops";;
let tm s = parse_term s;;
let pv name s tac = attempt name (fun () -> sthm (prove (tm s, tac)));;
pv "lean_refl" "!x:A. P x ==> P x" (LEANCOP_TAC[]);;
pv "lean_drinker" "?x:A. P x ==> !y. P y" (LEANCOP_TAC[]);;
pv "lean_trans" "(!x y:A. R x y ==> R y x) /\\ (!x y z. R x y /\\ R y z ==> R x z) /\\ (!x. ?y. R x y) ==> !x. R x x" (LEANCOP_TAC[]);;
pv "lean_lemma" "!p q. p /\\ q ==> q /\\ p" (LEANCOP_TAC[CONJ_SYM]);;
pv "nano_refl" "!x:A. P x ==> P x" (NANOCOP_TAC[]);;
pv "nano_drinker" "?x:A. P x ==> !y. P y" (NANOCOP_TAC[]);;
pv "nano_trans" "(!x y:A. R x y ==> R y x) /\\ (!x y z. R x y /\\ R y z ==> R x z) /\\ (!x. ?y. R x y) ==> !x. R x x" (NANOCOP_TAC[]);;
pv "nano_lemma" "!p q. p /\\ q ==> q /\\ p" (NANOCOP_TAC[CONJ_SYM]);;
