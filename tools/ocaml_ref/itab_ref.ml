(* Behaviour test for itab.ml. Keep in sync with itab/itab_ref_test.mbt. *)
#use "bool.ml";;
#use "drule.ml";;
#use "tactics.ml";;
#use "itab.ml";;
let tm s = parse_term s;;
let sgs gs =
  let b = Buffer.create 80 in
  let f = Format.formatter_of_buffer b in
  pp_print_goalstack f gs; Format.pp_print_flush f (); String.escaped (Buffer.contents b);;
let it name s = attempt name (fun () -> let t = tm s in sthm (ITAUT t));;
it "imp_refl" "p ==> p";;
it "conj_comm" "p /\\ q ==> q /\\ p";;
it "imp_trans" "(p ==> q) ==> (q ==> r) ==> p ==> r";;
it "triple_neg" "~ ~ ~p ==> ~p";;
it "disj_elim" "(p \\/ q) /\\ (p ==> r) /\\ (q ==> r) ==> r";;
it "forall_inst" "(!x:A. P x) ==> P a";;
it "exists_weaken" "(?x:A. P x /\\ Q x) ==> ?x. P x";;
it "iff" "(p <=> q) ==> q ==> p";;
it "contrapos" "(p ==> q) ==> ~q ==> ~p";;
it "dist" "p /\\ (q \\/ r) ==> (p /\\ q) \\/ (p /\\ r)";;
attempt "g1" (fun () -> let t = tm "?x:bool. (a /\\ b) = x" in sgs (g t));;
attempt "meta1" (fun () -> sgs (e META_EXISTS_TAC));;
attempt "refl1" (fun () -> sgs (e UNIFY_REFL_TAC));;
attempt "thm1" (fun () -> sthm (top_thm()));;
attempt "g2" (fun () -> let t = tm "?f:bool->bool. (a /\\ b) = f a" in sgs (g t));;
attempt "meta2" (fun () -> sgs (e META_EXISTS_TAC));;
attempt "refl2" (fun () -> sgs (e UNIFY_REFL_TAC));;
attempt "thm2" (fun () -> sthm (top_thm()));;
attempt "g3" (fun () -> let t = tm "?f:bool->bool. (a /\\ b) = f T" in sgs (g t));;
attempt "meta3" (fun () -> sgs (e META_EXISTS_TAC));;
attempt "refl3" (fun () -> sgs (e UNIFY_REFL_TAC));;
attempt "thm3" (fun () -> sthm (top_thm()));;
attempt "g4" (fun () -> let t = tm "?x:bool. (x /\\ b) = x" in sgs (g t));;
attempt "meta4" (fun () -> sgs (e META_EXISTS_TAC));;
attempt "refl4_occurs" (fun () -> sgs (e UNIFY_REFL_TAC));;
attempt "g5" (fun () -> let t = tm "(a /\\ b) = (b /\\ a)" in sgs (g t));;
attempt "refl5_notvar" (fun () -> sgs (e UNIFY_REFL_TAC));;
attempt "g6" (fun () -> let t = tm "a /\\ b" in sgs (g t));;
attempt "refl6_noteq" (fun () -> sgs (e UNIFY_REFL_TAC));;
attempt "accept_bad" (fun () -> let x = tm "x:bool" in let th = ASSUME (tm "c:bool") in sgs (e (UNIFY_ACCEPT_TAC [x] th)));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
