(* Load-fidelity and behaviour test for meson.ml (translated by
   tools/translator). Keep in sync with meson/meson_ref_test.mbt. *)
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
start_trace ();;
#use "meson.ml";;
show_trace "meson";;
let tm s = parse_term s;;
let ms name s = attempt name (fun () -> let t = tm s in sthm (prove(t, MESON_TAC[])));;
ms "mp" "(!x:A. P x ==> Q x) /\\ P a ==> Q a";;
ms "swap" "(?x:A. !y:B. P x y) ==> (!y. ?x. P x y)";;
ms "drinker" "?x:A. P x ==> !y. P y";;
ms "trans" "(!x y z:A. R x y /\\ R y z ==> R x z) /\\ R a b /\\ R b c /\\ R c d ==> R a d";;
ms "equality" "(!x:A. f(f x) = x) ==> !y. ?x. f x = y";;
ms "p18" "?y:A. !x. F y ==> F x";;
attempt "meson_thms" (fun () -> let a = ASSUME (tm "!x:A. P x ==> Q x") in let b = ASSUME (tm "(P:A->bool) c") in
  let t = tm "(Q:A->bool) c" in sthm (prove(t, MESON_TAC[a; b])));;
attempt "asm_meson" (fun () -> let t = tm "(!x:A. P x ==> Q x) ==> P a ==> Q a" in
  sthm (prove(t, REPEAT DISCH_TAC THEN ASM_MESON_TAC[])));;
attempt "depth_limit" (fun () -> let t = tm "(p:bool) ==> q" in sthm (prove(t, GEN_MESON_TAC 0 2 1 [])));;
attempt "inferences" (fun () -> string_of_int (!(Meson.inferences)));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
