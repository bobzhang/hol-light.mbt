(* Load-fidelity and behaviour test for impconv.ml (translated by
   tools/translator). Keep in
   sync with impconv/impconv_ref_test.mbt. *)
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
#use "quot.ml";;
start_trace ();;
#use "impconv.ml";;
show_trace "impconv";;
let tm s = parse_term s;;
let sgoal (asl,w) = slist (fun (s,th) -> s ^ ": " ^ sthm th) asl ^ " ?- " ^ stm w;;
let sgls (_,gls,_) = slist sgoal gls;;
let st name w tac = attempt name (fun () -> sgls (tac w));;
let pv name w tac = attempt name (fun () -> sthm (prove(w,tac)));;
let ax = ASSUME (tm "!x:bool. P x ==> (f x <=> g x)");;
let ax2 = ASSUME (tm "!x:bool. Q x ==> (g x <=> h x)");;
let px = ASSUME (tm "P (a:bool):bool");;
st "imp_rewrite" ([], tm "P a ==> g a ==> f (a:bool)") (IMP_REWRITE_TAC [ax]);;
st "imp_rewrite_seq" ([], tm "f (a:bool) /\\ f b") (SEQ_IMP_REWRITE_TAC [ax; ax2]);;
st "imp_rewrite_two" ([], tm "f (a:bool) ==> g a") (IMP_REWRITE_TAC [ax; ax2]);;
st "imp_rewrite_eq" ([], tm "~(p /\\ q) ==> ~p \\/ ~q") (IMP_REWRITE_TAC [DE_MORGAN_THM]);;
st "imp_rewrite_unchanged" ([], tm "p:bool") (IMP_REWRITE_TAC []);;
st "imp_rewrite_hyp" (["h", px], tm "f (a:bool)") (IMP_REWRITE_TAC [ax]);;
st "case_rewrite" ([], tm "f (a:bool)") (CASE_REWRITE_TAC ax);;
st "target_rewrite" ([], tm "f (a:bool)") (TARGET_REWRITE_TAC [ax2] ax);;
st "hint_exists" (["h", px], tm "?x:bool. P x") HINT_EXISTS_TAC;;
st "hint_exists_none" ([], tm "?x:bool. P x") HINT_EXISTS_TAC;;
st "imp_rewrite_forall" ([], tm "!y:bool. P y ==> f y") (IMP_REWRITE_TAC [ax]);;
st "imp_rewrite_exists" ([], tm "?y:bool. f y") (IMP_REWRITE_TAC [ax]);;
pv "prove_imp_rewrite" (tm "(!x:bool. P x ==> (f x <=> g x)) ==> P a ==> g a ==> f a")
  (DISCH_THEN (fun th -> IMP_REWRITE_TAC [th]) THEN ITAUT_TAC);;
st "case_rewrite_conj" ([], tm "q ==> f (a:bool)") (CASE_REWRITE_TAC ax);;
st "target_rewrite_hyp" ([], tm "f (a:bool)") (TARGET_REWRITE_TAC [ax] ax2);;
