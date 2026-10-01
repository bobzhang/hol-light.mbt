(* Load-fidelity and behaviour test for metis.ml (translated by
   tools/translator, functors specialized). Keep in sync with
   metis/metis_ref_test.mbt. *)
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
start_trace ();;
#use "metis.ml";;
show_trace "metis";;
let tm s = parse_term s;;
let pv name s tac = attempt name (fun () -> sthm (prove (tm s, tac)));;
pv "refl" "!x:A. P x ==> P x" (METIS_TAC[]);;
pv "drinker" "?x:A. P x ==> !y. P y" (METIS_TAC[]);;
pv "trans" "(!x y:A. R x y ==> R y x) /\\ (!x y z. R x y /\\ R y z ==> R x z) /\\ (!x. ?y. R x y) ==> !x. R x x" (METIS_TAC[]);;
pv "eq" "(!x:A. f (f x) = x) /\\ (!x. g x = f x) ==> !y. g (g y) = y" (METIS_TAC[]);;
pv "lemma" "!p q. p /\\ q ==> q /\\ p" (METIS_TAC[CONJ_SYM]);;
pv "group" "(!x:A. m e x = x) /\\ (!x. m (i x) x = e) /\\ (!x y z. m (m x y) z = m x (m y z)) ==> !x. m (i x) (m x e) = e" (METIS_TAC[]);;
pv "asm" "(!x:A. P x ==> Q x) ==> P a ==> Q a" (REPEAT STRIP_TAC THEN ASM_METIS_TAC[]);;
