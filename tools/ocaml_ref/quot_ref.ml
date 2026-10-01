(* Load-fidelity and behaviour test for quot.ml (translated by
   tools/translator). Keep in
   sync with quot/quot_ref_test.mbt. *)
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
#use "thecops.ml";;
start_trace ();;
#use "quot.ml";;
show_trace "quot";;
let tm s = parse_term s;;
let beq = new_definition (tm "BEQ x y <=> (x:bool <=> y)");;
let refl_th = prove(tm "!x. BEQ x x", REWRITE_TAC[beq]);;
let sym_th = prove(tm "!x y. BEQ x y <=> BEQ y x", REWRITE_TAC[beq] THEN MESON_TAC[]);;
let trans_th = prove(tm "!x y z. BEQ x y /\\ BEQ y z ==> BEQ x z", REWRITE_TAC[beq] THEN MESON_TAC[]);;
let q = define_quotient_type "qbool" ("mk_qbool","dest_qbool") (tm "BEQ");;
attempt "define" (fun () -> sthm (fst q) ^ " ;; " ^ sthm (snd q));;
let wth = prove(tm "!x y. BEQ x y ==> BEQ (~x) (~y)", REWRITE_TAC[beq] THEN MESON_TAC[]);;
let lf = lift_function (snd q) (refl_th, trans_th) "qnot" wth;;
attempt "lift_function" (fun () -> sthm (fst lf) ^ " ;; " ^ sthm (snd lf));;
let th = prove(tm "!x. BEQ (~ ~x) x", REWRITE_TAC[beq]);;
attempt "lift_theorem" (fun () -> sthm (lift_theorem q (refl_th, sym_th, trans_th) [snd lf] th));;
attempt "define_again" (fun () -> let q2 = define_quotient_type "qbool" ("mk_qbool","dest_qbool") (tm "BEQ") in sthm (fst q2));;
attempt "types" (fun () -> String.concat " " (map fst (types())));;
attempt "constants" (fun () -> String.concat " " (map fst (constants())));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
