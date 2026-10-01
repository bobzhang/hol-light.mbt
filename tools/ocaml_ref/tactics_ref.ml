(* Load-fidelity and behaviour test for tactics.ml. Keep in sync with
   tactics/tactics_ref_test.mbt. Terms are parsed with explicit lets, in
   order, before the tactic expressions that use them. *)
#use "bool.ml";;
#use "drule.ml";;
start_trace ();;
#use "tactics.ml";;
show_trace "tactics";;
let tm s = parse_term s;;
let buf_of pr x =
  let b = Buffer.create 80 in
  let f = Format.formatter_of_buffer b in
  pr f x; Format.pp_print_flush f (); String.escaped (Buffer.contents b);;
let sgoal gl = buf_of pp_print_goal gl;;
let sgs gs = buf_of pp_print_goalstack gs;;
let sgls (_,gls,_) = slist sgoal gls;;
let pv name f = attempt name (fun () -> let w,tac = f () in sthm (prove(w,tac)));;
let st name f = attempt name (fun () -> let w,tac = f () in sgls (tac ([],w)));;
let truth = TRUTH;;
pv "CONJ_TAC" (fun () -> let w = tm "T /\\ T" in w, CONJ_TAC THEN ACCEPT_TAC truth);;
pv "DISJ1_TAC" (fun () -> let w = tm "T \\/ F" in w, DISJ1_TAC THEN ACCEPT_TAC truth);;
pv "DISJ2_TAC" (fun () -> let w = tm "F \\/ T" in w, DISJ2_TAC THEN ACCEPT_TAC truth);;
pv "GEN_DISCH" (fun () -> let w = tm "!p:bool. p ==> p" in w, GEN_TAC THEN DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "STRIP_TAC" (fun () -> let w = tm "!p q. p /\\ q ==> q /\\ p" in
  w, REPEAT STRIP_TAC THEN CONJ_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "EXISTS_TAC" (fun () -> let w = tm "?x:bool. x" in let t = tm "T" in w, EXISTS_TAC t THEN ACCEPT_TAC truth);;
pv "X_CHOOSE_TAC" (fun () -> let w = tm "(?x:bool. (P:bool->bool) x) ==> (?y. P y)" in let z = tm "z:bool" in
  w, DISCH_THEN(X_CHOOSE_TAC z) THEN EXISTS_TAC z THEN FIRST_ASSUM ACCEPT_TAC);;
pv "STRIP_EXISTS" (fun () -> let w = tm "(?x:A. (P:A->bool) x) ==> ?y. P y" in let x = tm "x:A" in
  w, STRIP_TAC THEN EXISTS_TAC x THEN FIRST_ASSUM ACCEPT_TAC);;
pv "DISJ_CASES_THEN" (fun () -> let w = tm "p \\/ q ==> q \\/ p" in
  w, DISCH_THEN(DISJ_CASES_THEN ASSUME_TAC) THENL [DISJ2_TAC; DISJ1_TAC] THEN FIRST_ASSUM ACCEPT_TAC);;
pv "CONTR_TAC" (fun () -> let w = tm "F ==> p" in w, DISCH_THEN CONTR_TAC);;
pv "MATCH_ACCEPT_TAC" (fun () -> let w = tm "!b:bool. b = b" in let x = tm "x:A" in
  w, MATCH_ACCEPT_TAC (GEN x (REFL x)));;
pv "MATCH_MP_TAC" (fun () -> let w = tm "(!x:A. P x ==> Q x) ==> P c ==> Q c" in
  w, DISCH_TAC THEN DISCH_TAC THEN FIRST_X_ASSUM MATCH_MP_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "ANTS_TAC" (fun () -> let w = tm "(T ==> q) ==> q" in
  w, ANTS_TAC THENL [ACCEPT_TAC truth; DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC]);;
pv "EQ_TAC" (fun () -> let w = tm "p <=> p" in w, EQ_TAC THEN DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "MK_COMB_TAC" (fun () -> let w = tm "(f:A->B) x = f x" in w, MK_COMB_TAC THEN REFL_TAC);;
pv "AP_TERM_TAC" (fun () -> let w = tm "~(a /\\ b) <=> ~(a /\\ b)" in w, AP_TERM_TAC THEN REFL_TAC);;
pv "AP_THM_TAC" (fun () -> let w = tm "(f:A->B) x = f x" in w, AP_THM_TAC THEN REFL_TAC);;
pv "BINOP_TAC" (fun () -> let w = tm "(a /\\ b) <=> (a /\\ b)" in w, BINOP_TAC THEN REFL_TAC);;
pv "ABS_TAC" (fun () -> let w = tm "(\\x:A. (f:A->B) x) = (\\y. f y)" in w, ABS_TAC THEN REFL_TAC);;
pv "BETA_TAC" (fun () -> let w = tm "(\\x:bool. x) T" in w, BETA_TAC THEN ACCEPT_TAC truth);;
pv "CONV_TAC_eq" (fun () -> let w = tm "(\\x:bool. x) T = T" in w, CONV_TAC(DEPTH_CONV BETA_CONV) THEN REFL_TAC);;
pv "CONV_TAC_T" (fun () -> let w = tm "T" in w, CONV_TAC(fun t -> EQT_INTRO truth));;
pv "CONV_TAC_bad" (fun () -> let w = tm "T" in let r = tm "F" in w, CONV_TAC(fun t -> REFL r));;
pv "SUBST1_TAC" (fun () -> let w = tm "!a b:bool. (a = b) ==> b ==> a" in
  w, REPEAT GEN_TAC THEN DISCH_THEN SUBST1_TAC THEN DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "SUBST_ALL_TAC" (fun () -> let w = tm "(a:bool) = b ==> a ==> b" in
  w, DISCH_TAC THEN DISCH_TAC THEN FIRST_ASSUM SUBST_ALL_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "SUBST_VAR_TAC" (fun () -> let w = tm "(x:A) = y ==> (P:A->bool) x ==> P y" in
  w, REPEAT DISCH_TAC THEN FIRST_X_ASSUM SUBST_VAR_TAC THEN FIRST_ASSUM ACCEPT_TAC);;
pv "UNDISCH_TAC" (fun () -> let w = tm "p ==> p" in let p = tm "p:bool" in
  w, DISCH_TAC THEN UNDISCH_TAC p THEN DISCH_THEN ACCEPT_TAC);;
pv "SPEC_TAC" (fun () -> let w = tm "(f:A->A) a = f a" in let a = tm "a:A" in let z = tm "z:A" in
  w, SPEC_TAC(a,z) THEN GEN_TAC THEN REFL_TAC);;
pv "X_GEN_TAC_type" (fun () -> let w = tm "!x:bool. x = x" in let y = tm "y:A" in w, X_GEN_TAC y);;
pv "X_GEN_TAC_notvar" (fun () -> let w = tm "!x:bool. x = x" in let t = tm "T" in w, X_GEN_TAC t);;
pv "X_GEN_TAC_invalid" (fun () -> let w = tm "!x:bool. x = y" in let y = tm "y:bool" in w, X_GEN_TAC y);;
pv "X_GEN_TAC_notforall" (fun () -> let w = tm "p:bool" in let y = tm "y:bool" in w, X_GEN_TAC y);;
st "GEN_TAC_primed" (fun () -> let w = tm "!x:bool. x = x \\/ x'" in w, GEN_TAC);;
pv "SUBGOAL_THEN" (fun () -> let w = tm "p ==> p /\\ p" in let p = tm "p:bool" in
  w, DISCH_TAC THEN SUBGOAL_THEN p ASSUME_TAC THENL
     [FIRST_ASSUM ACCEPT_TAC; CONJ_TAC THEN FIRST_ASSUM ACCEPT_TAC]);;
st "SUBGOAL_TAC" (fun () -> let w = tm "p:bool" in let q = tm "q:bool" in w, SUBGOAL_TAC "lab" q [ALL_TAC; ALL_TAC]);;
st "SUBGOAL_TAC_none" (fun () -> let w = tm "p:bool" in let q = tm "q:bool" in w, SUBGOAL_TAC "lab" q []);;
pv "FREEZE_THEN" (fun () -> let w = tm "p ==> p" in w, DISCH_THEN(FREEZE_THEN ACCEPT_TAC));;
pv "IMP_RES_THEN" (fun () -> let w = tm "(p ==> q) ==> p ==> q" in
  w, REPEAT DISCH_TAC THEN FIRST_ASSUM(IMP_RES_THEN ACCEPT_TAC));;
pv "ANTE_RES_THEN" (fun () -> let w = tm "(p ==> q) ==> p ==> q" in
  w, REPEAT DISCH_TAC THEN FIRST_ASSUM(ANTE_RES_THEN ACCEPT_TAC));;
st "IMP_RES_THEN_none" (fun () -> let w = tm "p ==> q" in w, DISCH_TAC THEN FIRST_ASSUM(IMP_RES_THEN ACCEPT_TAC));;
pv "LABEL_USE_THEN" (fun () -> let w = tm "p ==> q ==> p" in
  w, DISCH_THEN(LABEL_TAC "hp") THEN DISCH_THEN(LABEL_TAC "hq") THEN USE_THEN "hp" ACCEPT_TAC);;
pv "USE_THEN_missing" (fun () -> let w = tm "p ==> p" in w, DISCH_TAC THEN USE_THEN "nope" ACCEPT_TAC);;
st "REMOVE_THEN" (fun () -> let w = tm "p ==> q ==> r" in
  w, DISCH_THEN(LABEL_TAC "hp") THEN DISCH_THEN(LABEL_TAC "hq") THEN REMOVE_THEN "hp" MP_TAC);;
pv "HYP" (fun () -> let w = tm "p ==> p" in
  w, DISCH_THEN(LABEL_TAC "h1") THEN HYP (fun ths -> ACCEPT_TAC (hd ths)) "h1" []);;
pv "HYP_bad" (fun () -> let w = tm "p ==> p" in
  w, DISCH_THEN(LABEL_TAC "h1") THEN HYP (fun ths -> ACCEPT_TAC (hd ths)) "h1 +" []);;
st "NAME_ASSUMS_TAC" (fun () -> let w = tm "a ==> b ==> c ==> d" in
  w, DISCH_TAC THEN DISCH_THEN(LABEL_TAC "H0") THEN DISCH_TAC THEN NAME_ASSUMS_TAC);;
st "RULE_ASSUM_TAC" (fun () -> let w = tm "(\\x:bool. x) a ==> (\\x:bool. x) b ==> c" in
  w, REPEAT DISCH_TAC THEN RULE_ASSUM_TAC (CONV_RULE BETA_CONV));;
st "STRIP_ASSUME_TAC" (fun () -> let w = tm "c:bool" in let a = tm "(a /\\ b) \\/ (?x:A. (P:A->bool) x)" in
  w, STRIP_ASSUME_TAC (ASSUME a));;
st "STRIP_ASSUME_TAC_dup" (fun () -> let w = tm "a ==> c" in let a = tm "a /\\ a" in
  w, DISCH_TAC THEN STRIP_ASSUME_TAC (ASSUME a));;
st "STRUCT_CASES_TAC" (fun () -> let w = tm "(P:bool->bool) x" in let a = tm "(x:bool) = T \\/ x = F" in
  w, STRUCT_CASES_TAC (ASSUME a));;
st "CONJUNCTS_THEN2" (fun () -> let w = tm "a /\\ b ==> c" in w, DISCH_THEN(CONJUNCTS_THEN2 ASSUME_TAC MP_TAC));;
st "CHANGED_TAC_all" (fun () -> let w = tm "p:bool" in w, CHANGED_TAC ALL_TAC);;
st "CHANGED_TAC_gen" (fun () -> let w = tm "!x:bool. x" in w, CHANGED_TAC GEN_TAC);;
st "REPLICATE_TAC" (fun () -> let w = tm "!x y z:bool. x" in w, REPLICATE_TAC 2 GEN_TAC);;
st "FAIL_TAC" (fun () -> let w = tm "p:bool" in w, FAIL_TAC "boom");;
st "NO_TAC" (fun () -> let w = tm "p:bool" in w, NO_TAC);;
st "FIRST_empty" (fun () -> let w = tm "p:bool" in w, FIRST []);;
st "EVERY_empty" (fun () -> let w = tm "p:bool" in w, EVERY []);;
st "FIRST" (fun () -> let w = tm "p /\\ q" in w, FIRST [DISJ1_TAC; CONJ_TAC]);;
st "MAP_EVERY" (fun () -> let w = tm "!x y:bool. x" in let a = tm "a:bool" in let b = tm "b:bool" in
  w, MAP_EVERY X_GEN_TAC [a; b]);;
st "MAP_FIRST" (fun () -> let w = tm "p ==> q" in w, MAP_FIRST (fun t -> t) [CONJ_TAC; DISCH_TAC]);;
st "TRY" (fun () -> let w = tm "p:bool" in w, TRY CONJ_TAC);;
st "ORELSE" (fun () -> let w = tm "p /\\ q" in w, DISJ1_TAC ORELSE CONJ_TAC);;
st "THEN1" (fun () -> let w = tm "(p /\\ q) /\\ r" in w, then1_ CONJ_TAC CONJ_TAC);;
st "THENL_mismatch" (fun () -> let w = tm "p /\\ q" in w, CONJ_TAC THENL [ALL_TAC]);;
st "THENL_empty" (fun () -> let w = tm "T" in w, ACCEPT_TAC truth THENL [ALL_TAC; ALL_TAC]);;
st "POP_ASSUM_empty" (fun () -> let w = tm "p:bool" in w, POP_ASSUM ACCEPT_TAC);;
st "POP_ASSUM_LIST" (fun () -> let w = tm "a ==> b ==> c" in
  w, REPEAT DISCH_TAC THEN POP_ASSUM_LIST(fun ths -> MAP_EVERY ASSUME_TAC ths));;
st "EVERY_ASSUM" (fun () -> let w = tm "a ==> b ==> c" in w, REPEAT DISCH_TAC THEN EVERY_ASSUM MP_TAC);;
st "ASSUM_LIST" (fun () -> let w = tm "a ==> b ==> c" in
  w, REPEAT DISCH_TAC THEN ASSUM_LIST(fun ths -> MP_TAC (end_itlist CONJ ths)));;
st "FIND_ASSUM" (fun () -> let w = tm "a ==> b ==> c" in let a = tm "a:bool" in
  w, REPEAT DISCH_TAC THEN FIND_ASSUM MP_TAC a);;
st "ASM" (fun () -> let w = tm "a ==> b" in w, DISCH_TAC THEN ASM (MAP_EVERY MP_TAC) []);;
st "ORELSE_TCL" (fun () -> let w = tm "a /\\ b ==> c" in
  w, DISCH_THEN((CONJUNCTS_THEN ORELSE_TCL I) ASSUME_TAC));;
st "NO_THEN" (fun () -> let w = tm "a ==> c" in w, DISCH_THEN(NO_THEN ASSUME_TAC));;
st "EVERY_TCL" (fun () -> let w = tm "(a /\\ b) /\\ c ==> d" in
  w, DISCH_THEN(EVERY_TCL [CONJUNCTS_THEN; CONJUNCTS_THEN] ASSUME_TAC));;
st "REPEAT_GTCL" (fun () -> let w = tm "(a /\\ b) /\\ c ==> d" in
  w, DISCH_THEN(REPEAT_GTCL CONJUNCTS_THEN ASSUME_TAC));;
st "FIRST_TCL_empty" (fun () -> let w = tm "a ==> c" in w, DISCH_THEN(FIRST_TCL [] ASSUME_TAC));;
st "TRANS_TAC" (fun () ->
  let tw = tm "!x y z:A. x = y /\\ y = z ==> x = z" in
  let th = prove(tw, REPEAT GEN_TAC THEN DISCH_THEN(CONJUNCTS_THEN2 SUBST1_TAC SUBST1_TAC) THEN REFL_TAC) in
  let w = tm "(a:bool) = c" in let b = tm "b:bool" in
  w, TRANS_TAC th b);;
st "X_META_EXISTS_TAC" (fun () -> let w = tm "?x:bool. x /\\ y" in let v = tm "v:bool" in w, X_META_EXISTS_TAC v);;
st "X_META_EXISTS_TAC_bad" (fun () -> let w = tm "?x:bool. x /\\ y" in let v = tm "T" in w, X_META_EXISTS_TAC v);;
st "META_EXISTS_TAC" (fun () -> let w = tm "?x:bool. x /\\ x'" in w, META_EXISTS_TAC);;
st "META_SPEC_TAC" (fun () -> let w = tm "q:bool" in let t = tm "t:bool" in let a = tm "!x:bool. P x" in
  w, META_SPEC_TAC t (ASSUME a));;
pv "CHEAT_TAC" (fun () -> let w = tm "F" in w, CHEAT_TAC);;
report_timing := false;;
pv "RECALL_ACCEPT_TAC" (fun () -> let w = tm "T" in w, RECALL_ACCEPT_TAC (fun t -> t) truth);;
report_timing := true;;
pv "prove_hyps" (fun () -> let w = tm "p:bool" in let p = tm "p:bool" in w, ACCEPT_TAC (ASSUME p));;
pv "prove_unsolved" (fun () -> let w = tm "p:bool" in w, ALL_TAC);;
pv "prove_nonbool" (fun () -> let w = tm "x:A" in w, ALL_TAC);;
pv "prove_alpha" (fun () -> let w = tm "!x:bool. x ==> x" in let w2 = tm "!y:bool. y ==> y" in
  w, MATCH_ACCEPT_TAC (prove(w2, GEN_TAC THEN DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC)));;
attempt "mk_fthm" (fun () -> let a = tm "a:bool" in let b = tm "b:bool" in sthm (mk_fthm([a], b)));;
attempt "equals_goal" (fun () -> let a = tm "a:bool" in
  string_of_bool (equals_goal (["x", ASSUME a], a) (["x", ASSUME a], a)) ^ " " ^
  string_of_bool (equals_goal (["x", ASSUME a], a) (["y", ASSUME a], a)));;
attempt "compose_insts" (fun () -> let a = tm "a:A" in let x = tm "x:A" in let b = tm "b:A" in let y = tm "y:A" in
  let (p,tmin,tyin) = compose_insts ([], [a, x], []) ([], [b, y; a, x], [bool_ty, aty]) in
  slist stm (map fst tmin) ^ " " ^ slist stm (map snd tmin) ^ " " ^ slist sty (map fst tyin));;
attempt "inst_goal" (fun () -> let a = tm "a:bool" in let p = tm "p:bool" in
  sgoal (inst_goal ([], [a, p], []) (["h", ASSUME p], p)));;
(* The goalstack. *)
attempt "g_free" (fun () -> let t = tm "x /\\ y ==> y" in sgs (g t));;
attempt "g" (fun () -> let t = tm "!p q:bool. p /\\ q ==> q /\\ p" in sgs (g t));;
attempt "e1" (fun () -> sgs (e (REPEAT GEN_TAC)));;
attempt "e2" (fun () -> sgs (e STRIP_TAC));;
attempt "top_goal" (fun () -> let asl,w = top_goal() in slist stm asl ^ " ?- " ^ stm w);;
attempt "e3" (fun () -> sgs (e CONJ_TAC));;
attempt "r1" (fun () -> sgs (r 1));;
attempt "r_neg" (fun () -> sgs (r (-1)));;
attempt "b1" (fun () -> sgs (b()));;
attempt "e_valid" (fun () -> sgs (e (fun g -> null_meta, [], fun _ _ -> truth)));;
attempt "e4" (fun () -> sgs (e (FIRST_ASSUM ACCEPT_TAC)));;
attempt "e_bad" (fun () -> sgs (e (FIRST_ASSUM ACCEPT_TAC)));;
attempt "e5" (fun () -> sgs (e (FIRST_ASSUM ACCEPT_TAC)));;
attempt "top_thm" (fun () -> sthm (top_thm()));;
attempt "p" (fun () -> sgs (p()));;
attempt "flush" (fun () -> flush_goalstack(); sgs (p()));;
attempt "b_too_far" (fun () -> sgs (b()));;
attempt "g2" (fun () -> let t = tm "(a /\\ b) /\\ (c /\\ d)" in sgs (g t));;
verbose := false;;
attempt "er1" (fun () -> sgs (er CONJ_TAC));;
attempt "er2" (fun () -> sgs (er CONJ_TAC));;
verbose := true;;
attempt "length" (fun () -> string_of_int (length (p())));;
attempt "set_goal" (fun () -> let a = tm "a:bool" in let w = tm "a /\\ (b ==> c)" in sgs (set_goal([a], w)));;
attempt "e_lab" (fun () -> sgs (e (CONJ_TAC THENL [ALL_TAC; DISCH_THEN(LABEL_TAC "hb")])));;
attempt "top_realgoal" (fun () -> sgoal (top_realgoal()));;
print_goal_hyp_max_boxes := Some 3;;
attempt "max_boxes" (fun () -> let a = tm "((a /\\ b) /\\ (c /\\ d)) /\\ ((e /\\ f) /\\ (g /\\ h))" in
  let w = tm "p:bool" in sgoal (["", ASSUME a], w));;
print_goal_hyp_max_boxes := None;;
attempt "empty_goalstack" (fun () -> sgs []);;
attempt "top_thm_open" (fun () -> sthm (top_thm()));;
current_goalstack := [];;
attempt "e_nogoal" (fun () -> sgs (e ALL_TAC));;
attempt "by_nogoal" (fun () -> let w = tm "T" in sgls (by ALL_TAC (by (ACCEPT_TAC truth) (mk_goalstate([], w)))));;
attempt "axioms" (fun () -> String.concat " ;; " (map sthm (axioms())));;
attempt "constants" (fun () -> String.concat " " (map fst (constants())));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
