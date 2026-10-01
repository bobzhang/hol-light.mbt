(* Load-fidelity and behaviour test for simp.ml. Keep in sync with
   simp/simp_ref_test.mbt. *)
#use "bool.ml";;
#use "drule.ml";;
#use "tactics.ml";;
#use "itab.ml";;
start_trace ();;
#use "simp.ml";;
show_trace "simp";;
let tm s = parse_term s;;
let cv name f = attempt name (fun () -> sthm (f ()));;
let sb b = if b then "true" else "false";;
attempt "term_order" (fun () ->
  let a = tm "a:bool" in let b = tm "b:bool" in let t = tm "T" in let fab = tm "(f:bool->bool->bool) a b" in
  let fba = tm "(f:bool->bool->bool) b a" in
  String.concat " " (map sb [term_order a b; term_order b a; term_order t a; term_order a t; term_order fab fba; term_order fba fab]));;
attempt "mk_rewrites_false" (fun () -> let th = ASSUME (tm "!x:A. (P x /\\ (Q x = R x)) /\\ ~(a = b) /\\ ~c /\\ (p ==> (u:A) = v)") in
  slist sthm (mk_rewrites false th []));;
attempt "mk_rewrites_true" (fun () -> let th = ASSUME (tm "!x:A. (P x /\\ (Q x = R x)) /\\ ~(a = b) /\\ ~c /\\ (p ==> (u:A) = v)") in
  slist sthm (mk_rewrites true th []));;
attempt "mk_rewrites_exists" (fun () -> let th = ASSUME (tm "!x y:A. P x y ==> Q x y ==> (f:A->A) x = g x") in
  slist sthm (mk_rewrites true th []));;
cv "REWRITE_CONV" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = g x") in let t = tm "(h:A->A) (f a) = f (f b)" in REWRITE_CONV [th] t);;
cv "REWRITE_CONV_fail" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = g x") in let t = tm "(h:A->A) a" in REWRITE_CONV [th] t);;
cv "REWRITE_CONV_loop" (fun () -> let th = ASSUME (tm "(a:bool) = (a /\\ b)") in let t = tm "a \\/ a" in REWRITE_CONV [th] t);;
cv "REWRITE_CONV_perm" (fun () -> let th = ASSUME (tm "!x y. (f:A->A->A) x y = f y x") in let t = tm "(f:A->A->A) b a = f a b" in REWRITE_CONV [th] t);;
cv "REWRITE_CONV_eta" (fun () -> let th = ASSUME (tm "(\\x:A. (f:A->B) x) = f") in let t = tm "\\y:A. (g:A->B) y" in REWRITE_CONV [th] t);;
cv "REWRITE_CONV_lconst" (fun () -> let th = ASSUME (tm "(x:bool) = T") in let t = tm "x /\\ y /\\ (\\x. x) z" in REWRITE_CONV [th] t);;
cv "PURE_REWRITE_CONV" (fun () -> let th = ASSUME (tm "(a:bool) = b") in let t = tm "a /\\ a" in PURE_REWRITE_CONV [th] t);;
cv "ONCE_REWRITE_CONV" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = f (f x)") in let t = tm "(f:A->A) a" in ONCE_REWRITE_CONV [th] t);;
cv "PURE_ONCE_REWRITE_CONV" (fun () -> let th = ASSUME (tm "(a:bool) = (a /\\ a)") in let t = tm "a \\/ a" in PURE_ONCE_REWRITE_CONV [th] t);;
cv "GEN_REWRITE_CONV" (fun () -> let th = ASSUME (tm "(a:bool) = b") in let t = tm "a /\\ a" in GEN_REWRITE_CONV RAND_CONV [th] t);;
cv "REWRITE_RULE" (fun () -> let th = ASSUME (tm "(a:bool) = b") in let th2 = ASSUME (tm "a /\\ c") in REWRITE_RULE [th] th2);;
cv "ASM_REWRITE_RULE" (fun () -> let th = ASSUME (tm "(a:bool) = b") in let th2 = DISCH (tm "c:bool") (ASSUME (tm "(a:bool) = b")) in ASM_REWRITE_RULE [] (UNDISCH th2));;
cv "ONCE_ASM_REWRITE_RULE" (fun () -> let th = ASSUME (tm "(a:bool) = b") in ONCE_ASM_REWRITE_RULE [] (CONJ th th));;
cv "REWRITE_TAC" (fun () -> let w = tm "(a:bool) = b ==> a ==> b" in
  prove(w, DISCH_THEN(fun th -> REWRITE_TAC[th] THEN DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC)));;
cv "ASM_REWRITE_TAC" (fun () -> let w = tm "(a:bool) = b ==> b ==> a" in
  prove(w, DISCH_TAC THEN ASM_REWRITE_TAC[] THEN DISCH_TAC THEN FIRST_ASSUM ACCEPT_TAC));;
cv "REWRITES_CONV_fail" (fun () -> let t = tm "a:bool" in REWRITES_CONV empty_net t);;
cv "SIMP_CONV_cond" (fun () -> let th1 = ASSUME (tm "!x:A. P x ==> (f:A->A) x = g x") in let th2 = ASSUME (tm "(P:A->bool) a") in
  let t = tm "(h:A->A) ((f:A->A) a) = f b" in SIMP_CONV [th1; th2] t);;
cv "SIMP_CONV_ctx_abs" (fun () -> let th = ASSUME (tm "(x:bool) = T") in let t = tm "\\x. x /\\ y" in SIMP_CONV [th] t);;
cv "PURE_SIMP_CONV" (fun () -> let th = ASSUME (tm "(a:bool) = b") in let t = tm "a /\\ c" in PURE_SIMP_CONV [th] t);;
cv "ONCE_SIMP_CONV" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = f (f x)") in let t = tm "(f:A->A) a" in ONCE_SIMP_CONV [th] t);;
cv "SIMP_RULE" (fun () -> let th = ASSUME (tm "(a:bool) = b") in let th2 = ASSUME (tm "a /\\ c") in SIMP_RULE [th] th2);;
let imp_cong = ITAUT (tm "(p <=> p') ==> (p' ==> (q <=> q')) ==> (p ==> q <=> p' ==> q')");;
cv "net_of_cong_bad" (fun () -> let th = ASSUME (tm "a:bool") in let n = net_of_cong th empty_net in REWRITES_CONV n (tm "a:bool"));;
cv "SIMP_cong" (fun () -> let ss = ss_of_congs [imp_cong] empty_ss in let t = tm "(x:A) = a ==> (f:A->A) x = f a" in SIMPLIFY_CONV ss [] t);;
cv "SIMP_cong_deep" (fun () -> let ss = ss_of_congs [imp_cong] empty_ss in let th = ASSUME (tm "!x:A. P x ==> (f:A->A) x = g x") in
  let t = tm "(P:A->bool) a ==> (f:A->A) a = b" in SIMPLIFY_CONV ss [th] t);;
let pr = mk_prover (fun ths tm -> tryfind (fun th -> if aconv (concl th) tm then th else fail()) ths) (fun ths new_ths -> new_ths @ ths) [];;
cv "prover" (fun () -> let qa = ASSUME (tm "(Q:A->bool) a") in let ss = ss_of_provers [augment pr [qa]] empty_ss in
  let th = ASSUME (tm "!x:A. Q x ==> (f:A->A) x = g x") in let t = tm "(f:A->A) a" in SIMPLIFY_CONV ss [th] t);;
cv "prover_none" (fun () -> let th = ASSUME (tm "!x:A. Q x ==> (f:A->A) x = g x") in let t = tm "(f:A->A) a" in SIMPLIFY_CONV empty_ss [th] t);;
cv "too_deep" (fun () -> let th1 = ASSUME (tm "!x:A. Q x ==> (f:A->A) x = g x") in let th2 = ASSUME (tm "!x:A. R x ==> Q x") in
  let th3 = ASSUME (tm "(R:A->bool) a") in let t = tm "(f:A->A) a" in ONCE_SIMPLIFY_CONV empty_ss [th1; th2; th3] t);;
cv "deep_ok" (fun () -> let th1 = ASSUME (tm "!x:A. Q x ==> (f:A->A) x = g x") in let th2 = ASSUME (tm "!x:A. R x ==> Q x") in
  let th3 = ASSUME (tm "(R:A->bool) a") in let t = tm "(f:A->A) a" in SIMPLIFY_CONV empty_ss [th1; th2; th3] t);;
cv "DEPTH_SQCONV" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = g x") in let ss = ss_of_thms [th] empty_ss in let t = tm "(f:A->A) (f a)" in DEPTH_SQCONV ss 3 t);;
cv "REDEPTH_SQCONV" (fun () -> let th1 = ASSUME (tm "!x:A. (f:A->A) x = g x") in let th2 = ASSUME (tm "!x:A. (h:A->A) (g x) = f x") in
  let ss = ss_of_thms [th1; th2] empty_ss in let t = tm "(h:A->A) (f a)" in REDEPTH_SQCONV ss 3 t);;
cv "TOP_SWEEP_SQCONV" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = g (f x)") in let ss = ss_of_thms [th] empty_ss in let t = tm "(f:A->A) a" in
  TOP_SWEEP_SQCONV ss 3 t);;
cv "ss_of_conv" (fun () -> let ss = ss_of_conv (tm "(\\x:A. (b:B)) y") BETA_CONV empty_ss in let t = tm "(\\x:A. (f:A->B) x) c = (\\y. f y) d" in SIMPLIFY_CONV ss [] t);;
attempt "basic_rewrites" (fun () -> let th = ASSUME (tm "!x:A. (f:A->A) x = g x") in set_basic_rewrites [th];
  let th2 = ASSUME (tm "(a:bool) = b") in extend_basic_rewrites [th2]; slist sthm (basic_rewrites()));;
cv "REWRITE_CONV_basic" (fun () -> let t = tm "(f:A->A) c = c /\\ a" in REWRITE_CONV [] t);;
cv "PURE_REWRITE_CONV_basic" (fun () -> let t = tm "(f:A->A) c = c /\\ a" in PURE_REWRITE_CONV [] t);;
attempt "basic_convs" (fun () -> let p = tm "(\\x:A. (b:B)) y" in extend_basic_convs("BETA", (p, BETA_CONV));
  let p2 = tm "(\\x:A. (b:B)) y" in extend_basic_convs("BETA", (p2, BETA_CONV)); String.concat " " (map fst (basic_convs())));;
cv "REWRITE_CONV_conv" (fun () -> let t = tm "(\\x:A. (f:A->A) x) c" in REWRITE_CONV [] t);;
cv "SIMP_CONV_basic" (fun () -> let t = tm "(\\x:A. (f:A->A) x) c" in SIMP_CONV [] t);;
attempt "basic_congs" (fun () -> extend_basic_congs [imp_cong]; extend_basic_congs [imp_cong]; string_of_int (length (basic_congs())));;
cv "SIMP_CONV_congs" (fun () -> let t = tm "(x:A) = c ==> (h:A->A) x = h c" in SIMP_CONV [] t);;
attempt "reset" (fun () -> set_basic_rewrites []; set_basic_convs []; set_basic_congs []; string_of_int (length (basic_rewrites())));;
cv "ABBREV_TAC" (fun () -> let w = tm "(a /\\ b) \\/ ~(a /\\ b)" in let ab = tm "c = (a /\\ b)" in let c = tm "c:bool" in
  let gs = ABBREV_TAC ab ([], w) in let (_,[gl],_) = gs in mk_thm([], snd gl));;
cv "ABBREV_TAC_fun" (fun () -> let w = tm "(f:A->A) a = f b" in let ab = tm "(g:A->A) x = (f:A->A) x" in
  let gs = ABBREV_TAC ab ([], w) in let (_,[asl,gw],_) = gs in mk_thm(map (concl o snd) asl, gw));;
cv "ABBREV_TAC_used" (fun () -> let w = tm "(c:bool) /\\ a" in let ab = tm "c = (a:bool)" in
  let gs = ABBREV_TAC ab ([], w) in let (_,[gl],_) = gs in mk_thm([], snd gl));;
cv "ABBREV_EXPAND" (fun () -> let w = tm "(a /\\ b) \\/ ~(a /\\ b)" in let ab = tm "c = (a /\\ b)" in
  let gs = (ABBREV_TAC ab THEN EXPAND_TAC "c") ([], w) in let (_,[asl,gw],_) = gs in mk_thm(map (concl o snd) asl, gw));;
cv "EXPAND_TAC_none" (fun () -> let w = tm "(a:bool)" in
  let gs = EXPAND_TAC "c" ([], w) in let (_,[asl,gw],_) = gs in mk_thm(map (concl o snd) asl, gw));;
attempt "axioms" (fun () -> string_of_int (length (axioms())));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
