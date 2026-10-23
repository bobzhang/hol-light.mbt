// Translated from upstream Unity/mk_unless.ml; edit this file directly.

///|
/// TL_FIX
fn step_1() -> Unit raise {
  tl_fix_c.set(100L)
}

///|
let tl_fix_c : @lib.Cell[Int64] = @lib.Cell::new("TL_FIX")

///|
/// `TL_FIX`
pub fn tl_fix() -> Int64 {
  tl_fix_c.get()
}

///|
/// UNLESS_STMT
fn step_2() -> Unit raise {
  unless_stmt_c.set(@aux_definitions.new_infix_definition("UNLESS_STMT", "<=>", @term_syntax.parse_term("(UNLESS_STMT : ((A) -> Bool, (A) -> Bool, (A) -> A, A) -> Bool)((p : (A) -> Bool), (q : (A) -> Bool), (st : (A) -> A)) == ((s : A) => p(s) && !q(s) → p(st(s)) || q(st(s)))"), tl_fix()))
}

///|
let unless_stmt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT")

///|
/// `UNLESS_STMT`
pub fn unless_stmt() -> @kernel.Thm {
  unless_stmt_c.get()
}

///|
/// UNLESS_term
fn step_3() -> Unit raise {
  unless_term_c.set(@term_syntax.parse_term("(∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (UNLESS : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, NIL) == true) && (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, UNLESS(p, q, CONS((st : (A) -> A), (Pr : List[(A) -> A]))) == ((∀ s : A, UNLESS_STMT(p, q, st, s)) && UNLESS(p, q, Pr)))"))
}

///|
let unless_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("UNLESS_term")

///|
/// `UNLESS_term`
pub fn unless_term() -> @kernel.Term {
  unless_term_c.get()
}

///|
/// UNLESS
fn step_4() -> Unit raise {
  unless_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(unless_term()))
}

///|
let unless_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS")

///|
/// `UNLESS`
pub fn unless() -> @kernel.Thm {
  unless_c.get()
}

///|
/// Unity/mk_unless.ml:54
fn step_5() -> Unit raise {
  @printer.parse_as_infix("UNLESS", (tl_fix(), "right"))
}

///|
/// STABLE_STMT
fn step_6() -> Unit raise {
  stable_stmt_c.set(@aux_definitions.new_infix_definition("STABLE_STMT", "<=>", @term_syntax.parse_term("(STABLE_STMT : ((A) -> Bool, (A) -> A, A) -> Bool)((p : (A) -> Bool), (st : (A) -> A)) == ((s : A) => p(s) → p(st(s)))"), tl_fix()))
}

///|
let stable_stmt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STABLE_STMT")

///|
/// `STABLE_STMT`
pub fn stable_stmt() -> @kernel.Thm {
  stable_stmt_c.get()
}

///|
/// STABLE
fn step_7() -> Unit raise {
  stable_c.set(@aux_definitions.new_infix_definition("STABLE", "<=>", @term_syntax.parse_term("(STABLE : ((A) -> Bool, List[(A) -> A]) -> Bool)((p : (A) -> Bool), (Pr : List[(A) -> A])) == UNLESS(p, False, Pr)"), tl_fix()))
}

///|
let stable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STABLE")

///|
/// `STABLE`
pub fn stable() -> @kernel.Thm {
  stable_c.get()
}

///|
/// INVARIANT
fn step_8() -> Unit raise {
  invariant_c.set(@aux_definitions.new_infix_definition("INVARIANT", "<=>", @term_syntax.parse_term("(INVARIANT : ((A) -> Bool, ((A) -> Bool, List[(A) -> A])) -> Bool)((p : (A) -> Bool), ((p0 : (A) -> Bool), (Pr : List[(A) -> A]))) == ((∀ s : A, p0(s) → p(s)) && STABLE(p, Pr))"), tl_fix()))
}

///|
let invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVARIANT")

///|
/// `INVARIANT`
pub fn invariant() -> @kernel.Thm {
  invariant_c.get()
}

///|
/// s
fn step_9() -> Unit raise {
  s_c.set(@term_syntax.parse_term("(s : A)"))
}

///|
let s_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("s")

///|
/// `s`
pub fn s() -> @kernel.Term {
  s_c.get()
}

///|
/// p
fn step_10() -> Unit raise {
  p_c.set(@term_syntax.parse_term("(p : (A) -> Bool)"))
}

///|
let p_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("p")

///|
/// `p`
pub fn p() -> @kernel.Term {
  p_c.get()
}

///|
/// q
fn step_11() -> Unit raise {
  q_c.set(@term_syntax.parse_term("(q : (A) -> Bool)"))
}

///|
let q_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("q")

///|
/// `q`
pub fn q() -> @kernel.Term {
  q_c.get()
}

///|
/// r
fn step_12() -> Unit raise {
  r_c.set(@term_syntax.parse_term("(r : (A) -> Bool)"))
}

///|
let r_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("r")

///|
/// `r`
pub fn r() -> @kernel.Term {
  r_c.get()
}

///|
/// P
fn step_13() -> Unit raise {
  p_v1_c.set(@term_syntax.parse_term("(P : (Num, A) -> Bool)"))
}

///|
let p_v1_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("P")

///|
/// `P`
pub fn p_v1() -> @kernel.Term {
  p_v1_c.get()
}

///|
/// IMP_IMP_CONJIMP_lemma
fn step_14() -> Unit raise {
  let t1 = @simp.asm_rewrite_tac(@list.List([]))
  let t2 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t1)
  imp_imp_conjimp_lemma_c.set(@tactics.tac_proof((@list.List([]), @parser.parse_term("forall p q ps qs p' q' p's q's.\n        (p /\\ ~q ==> ps \\/ qs) ==> (p' /\\ ~q' ==> p's \\/ q's) ==>\n          (p /\\ p' /\\ (~p \\/ ~q') /\\ (~p' \\/ ~q) /\\ (~q \\/ ~q') ==>\n                ps /\\ p's \\/ ps /\\ q's \\/ p's /\\ qs \\/ qs /\\ q's)")), t2))
}

///|
let imp_imp_conjimp_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_IMP_CONJIMP_lemma")

///|
/// `IMP_IMP_CONJIMP_lemma`
pub fn imp_imp_conjimp_lemma() -> @kernel.Thm {
  imp_imp_conjimp_lemma_c.get()
}

///|
/// NOT_NOT_OR_lemma
fn step_15() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@class.not_clauses(), @class.de_morgan_thm(), @equal.sym(@bool.spec_all(@theorems.disj_assoc()))]))
  not_not_or_lemma_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t1 || t2 || t3) == (!(!t1 && !t2) || t3)")), t3))
}

///|
let not_not_or_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_NOT_OR_lemma")

///|
/// `NOT_NOT_OR_lemma`
pub fn not_not_or_lemma() -> @kernel.Thm {
  not_not_or_lemma_c.get()
}

///|
/// CONJ_IMPLY_THM
fn step_16() -> Unit raise {
  let t5 = @tactics.repeat_tac(@simp.asm_rewrite_tac(@list.List([])))
  let t4 = @tactics.repeat_tac(@tactics.strip_tac)
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t4), t5)
  conj_imply_thm_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : Bool, ∀ p' : Bool, ∀ q : Bool, ∀ q' : Bool, ((p || p') && (p || !q') && (p' || !q) && (!q || !q')) == (p && !q || p' && !q')")), t6))
}

///|
let conj_imply_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_IMPLY_THM")

///|
/// `CONJ_IMPLY_THM`
pub fn conj_imply_thm() -> @kernel.Thm {
  conj_imply_thm_c.get()
}

///|
/// UNLESS_STMT_thm0
fn step_17() -> Unit raise {
  let t9 = @tactics.repeat_tac(@tactics.strip_tac)
  let t8 = @simp.rewrite_tac(@list.List([@equal.beta_conv(@term_syntax.parse_term("((s : A) => (p : (A) -> Bool)(s) && !p(s) → p((st : (A) -> A)(s)))((s : A))"))]))
  let t7 = @simp.rewrite_tac(@list.List([unless_stmt()]))
  let t10 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t7), t8), t9), @hol88.res_tac)
  unless_stmt_thm0_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm0", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ s : A, UNLESS_STMT(p, p, st, s)"), t10))
}

///|
let unless_stmt_thm0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm0")

///|
/// `UNLESS_STMT_thm0`
pub fn unless_stmt_thm0() -> @kernel.Thm {
  unless_stmt_thm0_c.get()
}

///|
/// UNLESS_STMT_thm1
fn step_18() -> Unit raise {
  let t24 = @simp.asm_rewrite_tac(@list.List([]))
  let t21 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)"))
  let t22 = @bool.spec(@term_syntax.parse_term("(st : (A) -> A)((s : A))"), t21)
  let t23 = @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(q : (A) -> Bool)((st : (A) -> A)((s : A)))"))]))(t22))
  let t20 = @simp.asm_rewrite_tac(@list.List([]))
  let t17 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → p((st : (A) -> A)(s)) || q(st(s))"))
  let t18 = @bool.spec(@term_syntax.parse_term("(s : A)"), t17)
  let t16 = @kernel.assume_rule(@term_syntax.parse_term("!(q : (A) -> Bool)((s : A))"))
  let t19 = @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))")), t16]))(t18))
  let t13 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)"))
  let t14 = @aux_definitions.contrapos(@bool.spec(@term_syntax.parse_term("(s : A)"), t13))
  let t15 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("!(r : (A) -> Bool)((s : A))"))]))(t14))
  let t12 = @tactics.repeat_tac(@tactics.strip_tac)
  let t11 = @simp.rewrite_tac(@list.List([unless_stmt()]))
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t11), t12), t15), t19), t20), t23), t24)
  unless_stmt_thm1_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, st, s)) && (∀ s : A, q(s) → r(s)) → (∀ s : A, UNLESS_STMT(p, r, st, s))"), t25))
}

///|
let unless_stmt_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm1")

///|
/// `UNLESS_STMT_thm1`
pub fn unless_stmt_thm1() -> @kernel.Thm {
  unless_stmt_thm1_c.get()
}

///|
/// UNLESS_STMT_thm2
fn step_19() -> Unit raise {
  let t29 = @simp.asm_rewrite_tac(@list.List([]))
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t29)
  let t27 = @equal.sym(@bool.spec_all(@theorems.disj_assoc()))
  let t28 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@theorems.conj_assoc()))), t27, @class.not_clauses(), @class.de_morgan_thm()]))
  let t26 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t31 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([unless_stmt(), @mk_state_logic.or_def()])), t26), t28), t30)
  unless_stmt_thm2_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, st, s)) && (∀ s : A, UNLESS_STMT(p', q', st, s)) → (∀ s : A, UNLESS_STMT(op_bslash_slash_star(p, p'), op_bslash_slash_star(q, q'), st, s))"), t31))
}

///|
let unless_stmt_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm2")

///|
/// `UNLESS_STMT_thm2`
pub fn unless_stmt_thm2() -> @kernel.Thm {
  unless_stmt_thm2_c.get()
}

///|
/// UNLESS_STMT_thm3
fn step_20() -> Unit raise {
  let t47 = @simp.asm_rewrite_tac(@list.List([]))
  let t39 = @bool.spec(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"), imp_imp_conjimp_lemma())
  let t40 = @bool.spec(@term_syntax.parse_term("(q : (A) -> Bool)((s : A))"), t39)
  let t41 = @bool.spec(@term_syntax.parse_term("(p : (A) -> Bool)((st : (A) -> A)((s : A)))"), t40)
  let t42 = @bool.spec(@term_syntax.parse_term("(q : (A) -> Bool)((st : (A) -> A)((s : A)))"), t41)
  let t43 = @bool.spec(@term_syntax.parse_term("(p' : (A) -> Bool)((s : A))"), t42)
  let t44 = @bool.spec(@term_syntax.parse_term("(q' : (A) -> Bool)((s : A))"), t43)
  let t45 = @bool.spec(@term_syntax.parse_term("(p' : (A) -> Bool)((st : (A) -> A)((s : A)))"), t44)
  let t46 = @tactics.assume_tac(@bool.undisch_all(@bool.spec(@term_syntax.parse_term("(q' : (A) -> Bool)((st : (A) -> A)((s : A)))"), t45)))
  let t38 = @tactics.strip_assume_tac(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p' : (A) -> Bool)(s) && !(q' : (A) -> Bool)(s) → p'((st : (A) -> A)(s)) || q'(st(s))"))))
  let t37 = @tactics.strip_assume_tac(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → p((st : (A) -> A)(s)) || q(st(s))"))))
  let t36 = @tactics.assume_tac(@bool.conjunct2(@kernel.assume_rule(@term_syntax.parse_term("(∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → p((st : (A) -> A)(s)) || q(st(s))) && (∀ s : A, (p' : (A) -> Bool)(s) && !(q' : (A) -> Bool)(s) → p'(st(s)) || q'(st(s)))"))))
  let t35 = @tactics.assume_tac(@bool.conjunct1(@kernel.assume_rule(@term_syntax.parse_term("(∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → p((st : (A) -> A)(s)) || q(st(s))) && (∀ s : A, (p' : (A) -> Bool)(s) && !(q' : (A) -> Bool)(s) → p'(st(s)) || q'(st(s)))"))))
  let t33 = @equal.sym(@bool.spec_all(@theorems.disj_assoc()))
  let t34 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@theorems.conj_assoc()))), t33, @class.not_clauses(), @class.de_morgan_thm()]))
  let t32 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.pure_rewrite_tac(@list.List([unless_stmt(), @mk_state_logic.and_def(), @mk_state_logic.or_def()])), t32), t34), @tactics.strip_tac), @tactics.strip_tac), @tactics.strip_tac), @tactics.strip_tac), @tactics.strip_tac), @tactics.disch_tac), @tactics.strip_tac), @tactics.disch_tac), t35), t36), t37), t38), t46), t47)
  unless_stmt_thm3_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, st, s)) && (∀ s : A, UNLESS_STMT(p', q', st, s)) → (∀ s : A, UNLESS_STMT(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q')), st, s))"), t48))
}

///|
let unless_stmt_thm3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm3")

///|
/// `UNLESS_STMT_thm3`
pub fn unless_stmt_thm3() -> @kernel.Thm {
  unless_stmt_thm3_c.get()
}

///|
/// UNLESS_STMT_thm4
fn step_21() -> Unit raise {
  let t50 = @meson.meson_tac(@list.List([]))
  let t49 = @simp.pure_rewrite_tac(@list.List([unless_stmt(), @mk_state_logic.and_def(), @mk_state_logic.or_def(), @mk_state_logic.not_def1()]))
  let t51 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t49), t50)
  unless_stmt_thm4_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, st, s)) && (∀ s : A, UNLESS_STMT(p', q', st, s)) → (∀ s : A, UNLESS_STMT(op_bslash_slash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), q'), op_slash_bslash_star(Not(p'), q)), op_slash_bslash_star(q, q')), st, s))"), t51))
}

///|
let unless_stmt_thm4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm4")

///|
/// `UNLESS_STMT_thm4`
pub fn unless_stmt_thm4() -> @kernel.Thm {
  unless_stmt_thm4_c.get()
}

///|
/// UNLESS_STMT_thm5_lemma1
fn step_22() -> Unit raise {
  let t52 = @simp.asm_rewrite_tac(@list.List([]))
  let t53 = @list.List([@tactics.then_tac(@hol88.res_tac, @simp.asm_rewrite_tac(@list.List([]))), t52])
  let t54 = @tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t53)
  unless_stmt_thm5_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : Bool, ∀ q : Bool, ∀ r : Bool, (p → q) → p || r → q || r")), t54))
}

///|
let unless_stmt_thm5_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm5_lemma1")

///|
/// `UNLESS_STMT_thm5_lemma1`
pub fn unless_stmt_thm5_lemma1() -> @kernel.Thm {
  unless_stmt_thm5_lemma1_c.get()
}

///|
/// UNLESS_STMT_thm5_lemma2
fn step_23() -> Unit raise {
  let t59 = @tactics.then_tac(@tactics.disj2_tac, @simp.asm_rewrite_tac(@list.List([])))
  let t58 = @simp.asm_rewrite_tac(@list.List([]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))), t58)
  let t57 = @simp.asm_rewrite_tac(@list.List([]))
  let t61 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num)")), t57)
  let t56 = @simp.asm_rewrite_tac(@list.List([]))
  let t62 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num)")), t56), t61, t60, t59])
  let t55 = @tactics.repeat_tac(@tactics.strip_tac)
  let t63 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t55), t62)
  unless_stmt_thm5_lemma2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ s : A, ((∃ n : Num, P(n, s)) || q(s)) == (∃ n : Num, P(n, s) || q(s))")), t63))
}

///|
let unless_stmt_thm5_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm5_lemma2")

///|
/// `UNLESS_STMT_thm5_lemma2`
pub fn unless_stmt_thm5_lemma2() -> @kernel.Thm {
  unless_stmt_thm5_lemma2_c.get()
}

///|
/// UNLESS_STMT_thm5
fn step_24() -> Unit raise {
  let t68 = @simp.asm_rewrite_tac(@list.List([]))
  let t67 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t66 = @simp.rewrite_tac(@list.List([unless_stmt_thm5_lemma2()]))
  let t65 = @tactics.repeat_tac(@tactics.strip_tac)
  let t64 = @simp.rewrite_tac(@list.List([unless_stmt()]))
  let t69 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t64), @tactics.beta_tac), t65), t66), t67), @hol88.res_tac), t68)
  unless_stmt_thm5_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm5", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, (∀ m : Num, ∀ s : A, UNLESS_STMT(P(m), q, st, s)) → (∀ s : A, UNLESS_STMT((s : A) => ∃ n : Num, P(n, s), q, st, s))"), t69))
}

///|
let unless_stmt_thm5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm5")

///|
/// `UNLESS_STMT_thm5`
pub fn unless_stmt_thm5() -> @kernel.Thm {
  unless_stmt_thm5_c.get()
}

///|
/// UNLESS_STMT_thm6
fn step_25() -> Unit raise {
  let t71 = @meson.meson_tac(@list.List([]))
  let t70 = @simp.rewrite_tac(@list.List([unless_stmt(), @mk_state_logic.or_def()]))
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t70), t71)
  unless_stmt_thm6_c.set(@aux_definitions.prove_thm("UNLESS_STMT_thm6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, st, s)) → (∀ s : A, UNLESS_STMT(op_bslash_slash_star(p, r), op_bslash_slash_star(q, r), st, s))"), t72))
}

///|
let unless_stmt_thm6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_thm6")

///|
/// `UNLESS_STMT_thm6`
pub fn unless_stmt_thm6() -> @kernel.Thm {
  unless_stmt_thm6_c.get()
}

///|
/// UNLESS_thm1
fn step_26() -> Unit raise {
  let t77 = @tactics.repeat_tac(@tactics.strip_tac)
  let t76 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t75 = @simp.pure_rewrite_tac(@list.List([unless_stmt()]))
  let t74 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @simp.pure_rewrite_tac(@list.List([unless()]))
  let t78 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t73), t74), t75), t76), t77), @hol88.res_tac)
  unless_thm1_c.set(@aux_definitions.prove_thm("UNLESS_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, p, Pr)"), t78))
}

///|
let unless_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm1")

///|
/// `UNLESS_thm1`
pub fn unless_thm1() -> @kernel.Thm {
  unless_thm1_c.get()
}

///|
/// UNLESS_thm2
fn step_27() -> Unit raise {
  let t84 = @simp.rewrite_tac(@list.List([@class.excluded_middle()]))
  let t83 = @tactics.repeat_tac(@tactics.strip_tac)
  let t82 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t81 = @simp.pure_rewrite_tac(@list.List([unless_stmt(), @mk_state_logic.not_def1()]))
  let t80 = @simp.asm_rewrite_tac(@list.List([]))
  let t79 = @simp.pure_rewrite_tac(@list.List([unless()]))
  let t85 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t79), t80), t81), t82), t83), t84)
  unless_thm2_c.set(@aux_definitions.prove_thm("UNLESS_thm2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, Not(p), Pr)"), t85))
}

///|
let unless_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm2")

///|
/// `UNLESS_thm2`
pub fn unless_thm2() -> @kernel.Thm {
  unless_thm2_c.get()
}

///|
/// UNLESS_thm3
fn step_28() -> Unit raise {
  let t88 = @simp.asm_rewrite_tac(@list.List([]))
  let t87 = @simp.asm_rewrite_tac(@list.List([]))
  let t86 = @simp.rewrite_tac(@list.List([unless()]))
  let t90 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t86), @tactics.strip_tac), t87), @hol88.res_tac), t88), (x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(unless_stmt_thm1(), x89))
  unless_thm3_c.set(@aux_definitions.prove_thm("UNLESS_thm3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && (∀ s : A, q(s) → r(s)) → UNLESS(p, r, Pr)"), t90))
}

///|
let unless_thm3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm3")

///|
/// `UNLESS_thm3`
pub fn unless_thm3() -> @kernel.Thm {
  unless_thm3_c.get()
}

///|
/// UNLESS_thm4
fn step_29() -> Unit raise {
  let t93 = @simp.asm_rewrite_tac(@list.List([]))
  let t92 = @simp.asm_rewrite_tac(@list.List([]))
  let t91 = @simp.rewrite_tac(@list.List([unless()]))
  let t95 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t91), @tactics.strip_tac), t92), @hol88.res_tac), t93), (x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(unless_stmt_thm3(), x94))
  unless_thm4_c.set(@aux_definitions.prove_thm("UNLESS_thm4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && UNLESS(p', q', Pr) → UNLESS(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q')), Pr)"), t95))
}

///|
let unless_thm4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm4")

///|
/// `UNLESS_thm4`
pub fn unless_thm4() -> @kernel.Thm {
  unless_thm4_c.get()
}

///|
/// UNLESS_thm5
fn step_30() -> Unit raise {
  let t98 = @simp.asm_rewrite_tac(@list.List([]))
  let t97 = @simp.asm_rewrite_tac(@list.List([]))
  let t96 = @simp.rewrite_tac(@list.List([unless()]))
  let t100 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t96), @tactics.strip_tac), t97), @hol88.res_tac), t98), (x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(unless_stmt_thm4(), x99))
  unless_thm5_c.set(@aux_definitions.prove_thm("UNLESS_thm5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && UNLESS(p', q', Pr) → UNLESS(op_bslash_slash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), q'), op_slash_bslash_star(Not(p'), q)), op_slash_bslash_star(q, q')), Pr)"), t100))
}

///|
let unless_thm5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm5")

///|
/// `UNLESS_thm5`
pub fn unless_thm5() -> @kernel.Thm {
  unless_thm5_c.get()
}

///|
/// UNLESS_thm6
fn step_31() -> Unit raise {
  let t110 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t111 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t112 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (q' : (A) -> Bool)), op_slash_bslash_star((p' : (A) -> Bool), (q : (A) -> Bool))), op_slash_bslash_star(q, q'))")
  let t113 = @simp.asm_rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t112, t111, t110]), unless_thm3()))]))
  let t108 = @term_syntax.parse_term("∀ s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (q' : (A) -> Bool)), op_slash_bslash_star((p' : (A) -> Bool), (q : (A) -> Bool))), op_slash_bslash_star(q, q'), s) → op_bslash_slash_star(q, q', s)")
  let t109 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, (q' : (A) -> Bool)), op_slash_bslash_star(p', (q : (A) -> Bool))), op_slash_bslash_star(q, q')), (Pr : List[(A) -> A]))"), t108]), @hol88.and_intro_thm())))
  let t104 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t105 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t106 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t107 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t106, t105, t104]), @mk_state_logic.imply_weak_lemma1()))
  let t103 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(unless_thm4())))
  let t101 = @term_syntax.parse_term("UNLESS((p' : (A) -> Bool), (q' : (A) -> Bool), (Pr : List[(A) -> A]))")
  let t102 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"), t101]), @hol88.and_intro_thm())))
  let t114 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t102), t103), t107), t109), t113)
  unless_thm6_c.set(@aux_definitions.prove_thm("UNLESS_thm6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && UNLESS(p', q', Pr) → UNLESS(op_slash_bslash_star(p, p'), op_bslash_slash_star(q, q'), Pr)"), t114))
}

///|
let unless_thm6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm6")

///|
/// `UNLESS_thm6`
pub fn unless_thm6() -> @kernel.Thm {
  unless_thm6_c.get()
}

///|
/// UNLESS_thm7
fn step_32() -> Unit raise {
  let t124 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t125 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t126 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not((p : (A) -> Bool)), (q' : (A) -> Bool)), op_slash_bslash_star(Not((p' : (A) -> Bool)), (q : (A) -> Bool))), op_slash_bslash_star(q, q'))")
  let t127 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t126, t125, t124]), unless_thm3())))
  let t122 = @term_syntax.parse_term("∀ s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not((p : (A) -> Bool)), (q' : (A) -> Bool)), op_slash_bslash_star(Not((p' : (A) -> Bool)), (q : (A) -> Bool))), op_slash_bslash_star(q, q'), s) → op_bslash_slash_star(q, q', s)")
  let t123 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), (q' : (A) -> Bool)), op_slash_bslash_star(Not(p'), (q : (A) -> Bool))), op_slash_bslash_star(q, q')), (Pr : List[(A) -> A]))"), t122]), @hol88.and_intro_thm())))
  let t118 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t119 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t120 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t121 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t120, t119, t118]), @mk_state_logic.imply_weak_lemma2()))
  let t117 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(unless_thm5())))
  let t115 = @term_syntax.parse_term("UNLESS((p' : (A) -> Bool), (q' : (A) -> Bool), (Pr : List[(A) -> A]))")
  let t116 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"), t115]), @hol88.and_intro_thm())))
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t116), t117), t121), t123), t127)
  unless_thm7_c.set(@aux_definitions.prove_thm("UNLESS_thm7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && UNLESS(p', q', Pr) → UNLESS(op_bslash_slash_star(p, p'), op_bslash_slash_star(q, q'), Pr)"), t128))
}

///|
let unless_thm7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm7")

///|
/// `UNLESS_thm7`
pub fn unless_thm7() -> @kernel.Thm {
  unless_thm7_c.get()
}

///|
/// UNLESS_thm8
fn step_33() -> Unit raise {
  let t140 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t141 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not((p : (A) -> Bool)), (r : (A) -> Bool)), op_slash_bslash_star(Not((q : (A) -> Bool)), q)), op_slash_bslash_star(q, r))")
  let t142 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t141, t140]), unless_thm3()))))
  let t138 = @term_syntax.parse_term("∀ s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not((p : (A) -> Bool)), (r : (A) -> Bool)), op_slash_bslash_star(Not((q : (A) -> Bool)), q)), op_slash_bslash_star(q, r), s) → r(s)")
  let t139 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), (r : (A) -> Bool)), op_slash_bslash_star(Not(q), q)), op_slash_bslash_star(q, r)), (Pr : List[(A) -> A]))"), t138]), @hol88.and_intro_thm())))
  let t135 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t136 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t137 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t136, t135]), @mk_state_logic.imply_weak_lemma3()))
  let t131 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t132 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t133 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t134 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t133, t132, t131]), unless_thm5()))))
  let t129 = @term_syntax.parse_term("UNLESS((q : (A) -> Bool), (r : (A) -> Bool), (Pr : List[(A) -> A]))")
  let t130 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"), t129]), @hol88.and_intro_thm())))
  let t143 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t130), t134), t137), t139), t142)
  unless_thm8_c.set(@aux_definitions.prove_thm("UNLESS_thm8", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && UNLESS(q, r, Pr) → UNLESS(op_bslash_slash_star(p, q), r, Pr)"), t143))
}

///|
let unless_thm8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_thm8")

///|
/// `UNLESS_thm8`
pub fn unless_thm8() -> @kernel.Thm {
  unless_thm8_c.get()
}

///|
/// UNLESS_cor1
fn step_34() -> Unit raise {
  let t147 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t148 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t149 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t150 = @simp.asm_rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t149, t148, t147]), unless_thm3()))]))
  let t145 = @term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) → (q : (A) -> Bool)(s)")
  let t146 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), p, (Pr : List[(A) -> A]))"), t145]), @hol88.and_intro_thm())))
  let t144 = @tactics.assume_tac(@bool.spec_all(unless_thm1()))
  let t151 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t144), t146), t150)
  unless_cor1_c.set(@aux_definitions.prove_thm("UNLESS_cor1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ s : A, p(s) → q(s)) → UNLESS(p, q, Pr)"), t151))
}

///|
let unless_cor1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor1")

///|
/// `UNLESS_cor1`
pub fn unless_cor1() -> @kernel.Thm {
  unless_cor1_c.get()
}

///|
/// UNLESS_cor2
fn step_35() -> Unit raise {
  let t155 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t156 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t157 = @term_syntax.parse_term("Not((p : (A) -> Bool))")
  let t158 = @simp.asm_rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t157, t156, t155]), unless_thm3()))]))
  let t153 = @term_syntax.parse_term("∀ s : A, Not((p : (A) -> Bool), s) → (q : (A) -> Bool)(s)")
  let t154 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), Not(p), (Pr : List[(A) -> A]))"), t153]), @hol88.and_intro_thm())))
  let t152 = @tactics.assume_tac(@bool.spec_all(unless_thm2()))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t152), t154), t158)
  unless_cor2_c.set(@aux_definitions.prove_thm("UNLESS_cor2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ s : A, Not(p, s) → q(s)) → UNLESS(p, q, Pr)"), t159))
}

///|
let unless_cor2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor2")

///|
/// `UNLESS_cor2`
pub fn unless_cor2() -> @kernel.Thm {
  unless_cor2_c.get()
}

///|
/// UNLESS_cor3a
fn step_36() -> Unit raise {
  let t176 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_or_lemma()]))
  let t175 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@mk_state_logic.or_assoc_lemma())))]))
  let t173 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t174 = @simp.pure_once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))"), t173]), @mk_state_logic.or_comm_lemma())]))
  let t172 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_bslash_slash_star(op_bslash_slash_star(q, (r : (A) -> Bool)), q), (Pr : List[(A) -> A]))"))
  let t167 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t168 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t169 = @term_syntax.parse_term("Not((q : (A) -> Bool))")
  let t170 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t171 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t170, t169, t168, t167]), unless_thm6())))
  let t165 = @term_syntax.parse_term("UNLESS(Not((q : (A) -> Bool)), q, (Pr : List[(A) -> A]))")
  let t166 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool)), (Pr : List[(A) -> A]))"), t165]), @hol88.and_intro_thm())))
  let t164 = @tactics.repeat_tac(@tactics.strip_tac)
  let t163 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_not_lemma()]))
  let t162 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(Not((q : (A) -> Bool)), Not(Not(q)), (Pr : List[(A) -> A]))"))
  let t160 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t161 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("Not((q : (A) -> Bool))"), t160]), unless_thm2()))
  let t177 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t161), t162), t163), t164), t166), t171), t172), t174), t175), t176)
  unless_cor3a_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, op_bslash_slash_star(q, r), Pr) → UNLESS(op_slash_bslash_star(p, Not(q)), op_bslash_slash_star(q, r), Pr)")), t177))
}

///|
let unless_cor3a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor3a")

///|
/// `UNLESS_cor3a`
pub fn unless_cor3a() -> @kernel.Thm {
  unless_cor3a_c.get()
}

///|
/// UNLESS_cor3b
fn step_37() -> Unit raise {
  let t201 = @simp.asm_rewrite_tac(@list.List([]))
  let t200 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t199 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_or_lemma()]))
  let t198 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@mk_state_logic.or_assoc_lemma())))]))
  let t197 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t196 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_compl_or_lemma()]))
  let t195 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_slash_bslash_star(p, q)), op_bslash_slash_star(op_bslash_slash_star(q, (r : (A) -> Bool)), q), (Pr : List[(A) -> A]))"))
  let t190 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t191 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t192 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t193 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t194 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool)))"), t193, t192, t191, t190]), unless_thm7())))
  let t188 = @term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), q, (Pr : List[(A) -> A]))")
  let t189 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_bslash_slash_star(q, (r : (A) -> Bool)), (Pr : List[(A) -> A]))"), t188]), @hol88.and_intro_thm())))
  let t184 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t185 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t186 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t187 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t186, t185, t184]), unless_thm3())))
  let t182 = @term_syntax.parse_term("∀ s : A, op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool), s) → q(s)")
  let t183 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), op_slash_bslash_star(p, q), (Pr : List[(A) -> A]))"), t182]), @hol88.and_intro_thm())))
  let t180 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t181 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t180]), @mk_state_logic.and_imply_weak_lemma()))
  let t178 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t179 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t178]), unless_thm1()))
  let t202 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t179), t181), t183), t187), t189), t194), t195), t196), t197), t198), t199), @tactics.strip_tac), t200), t201)
  unless_cor3b_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(op_slash_bslash_star(p, Not(q)), op_bslash_slash_star(q, r), Pr) → UNLESS(p, op_bslash_slash_star(q, r), Pr)")), t202))
}

///|
let unless_cor3b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor3b")

///|
/// `UNLESS_cor3b`
pub fn unless_cor3b() -> @kernel.Thm {
  unless_cor3b_c.get()
}

///|
/// UNLESS_cor3
fn step_38() -> Unit raise {
  let t203 = @bool.spec_all(unless_cor3a())
  let t204 = @simp.rewrite_tac(@list.List([@bool.imp_antisym_rule(@bool.spec_all(unless_cor3b()), t203)]))
  unless_cor3_c.set(@aux_definitions.prove_thm("UNLESS_cor3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(op_slash_bslash_star(p, Not(q)), op_bslash_slash_star(q, r), Pr) == UNLESS(p, op_bslash_slash_star(q, r), Pr)"), t204))
}

///|
let unless_cor3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor3")

///|
/// `UNLESS_cor3`
pub fn unless_cor3() -> @kernel.Thm {
  unless_cor3_c.get()
}

///|
/// UNLESS_cor4
fn step_39() -> Unit raise {
  let t221 = @simp.asm_rewrite_tac(@list.List([]))
  let t219 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t220 = @simp.pure_once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t219]), @mk_state_logic.or_comm_lemma())]))
  let t218 = @simp.rewrite_tac(@list.List([unless_cor3()]))
  let t216 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t217 = @simp.pure_once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t216]), @mk_state_logic.or_comm_lemma())]))
  let t215 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_not_and_lemma()]))
  let t214 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_slash_bslash_star(op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)), Not(q)), op_bslash_slash_star((r : (A) -> Bool), q), (Pr : List[(A) -> A]))"))
  let t210 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t211 = @term_syntax.parse_term("Not((q : (A) -> Bool))")
  let t212 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t213 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t212, t211, t210]), unless_thm6()))))
  let t208 = @term_syntax.parse_term("UNLESS(Not((q : (A) -> Bool)), q, (Pr : List[(A) -> A]))")
  let t209 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool), (Pr : List[(A) -> A]))"), t208]), @hol88.and_intro_thm()))))
  let t207 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_not_lemma()]))
  let t206 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(Not((q : (A) -> Bool)), Not(Not(q)), (Pr : List[(A) -> A]))"))
  let t205 = @tactics.assume_tac(@bool.spec_all(@bool.spec(@term_syntax.parse_term("Not((q : (A) -> Bool))"), unless_thm2())))
  let t222 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t205), t206), t207), @tactics.strip_tac), t209), t213), t214), t215), t217), t218), @tactics.strip_tac), t220), t221)
  unless_cor4_c.set(@aux_definitions.prove_thm("UNLESS_cor4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(op_bslash_slash_star(p, q), r, Pr) → UNLESS(p, op_bslash_slash_star(q, r), Pr)"), t222))
}

///|
let unless_cor4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor4")

///|
/// `UNLESS_cor4`
pub fn unless_cor4() -> @kernel.Thm {
  unless_cor4_c.get()
}

///|
/// UNLESS_cor5
fn step_40() -> Unit raise {
  let t232 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_and_lemma(), @mk_state_logic.p_or_not_p_lemma()]))
  let t231 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), p), op_bslash_slash_star(p, Not(p)), (Pr : List[(A) -> A]))"))
  let t227 = @term_syntax.parse_term("Not((p : (A) -> Bool))")
  let t228 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t229 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t230 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t229, t228, t227]), unless_thm6()))))
  let t225 = @term_syntax.parse_term("UNLESS((p : (A) -> Bool), Not(p), (Pr : List[(A) -> A]))")
  let t226 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), p, (Pr : List[(A) -> A]))"), t225]), @hol88.and_intro_thm())))
  let t224 = @tactics.assume_tac(@bool.spec_all(unless_thm2()))
  let t223 = @tactics.assume_tac(@bool.spec_all(unless_thm1()))
  let t233 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t223), t224), t226), t230), t231), t232)
  unless_cor5_c.set(@aux_definitions.prove_thm("UNLESS_cor5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, True, Pr)"), t233))
}

///|
let unless_cor5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor5")

///|
/// `UNLESS_cor5`
pub fn unless_cor5() -> @kernel.Thm {
  unless_cor5_c.get()
}

///|
/// UNLESS_cor6
fn step_41() -> Unit raise {
  let t246 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_or_lemma(), @mk_state_logic.p_or_not_p_lemma()]))
  let t245 = @simp.pure_once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t244 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_bslash_slash_star(Not((p : (A) -> Bool)), p), op_bslash_slash_star(p, p), (Pr : List[(A) -> A]))"))
  let t240 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t241 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t242 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t243 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("Not((p : (A) -> Bool))"), t242, t241, t240]), unless_thm7()))))
  let t238 = @term_syntax.parse_term("UNLESS((p : (A) -> Bool), p, (Pr : List[(A) -> A]))")
  let t239 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(Not((p : (A) -> Bool)), p, (Pr : List[(A) -> A]))"), t238]), @hol88.and_intro_thm())))
  let t237 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_not_lemma()]))
  let t236 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(Not((p : (A) -> Bool)), Not(Not(p)), (Pr : List[(A) -> A]))"))
  let t235 = @tactics.assume_tac(@bool.spec_all(@bool.spec(@term_syntax.parse_term("Not((p : (A) -> Bool))"), unless_thm2())))
  let t234 = @tactics.assume_tac(@bool.spec_all(unless_thm1()))
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t234), t235), t236), t237), @tactics.disch_tac), t239), t243), t244), t245), t246)
  unless_cor6_c.set(@aux_definitions.prove_thm("UNLESS_cor6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(True, p, Pr)"), t247))
}

///|
let unless_cor6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor6")

///|
/// `UNLESS_cor6`
pub fn unless_cor6() -> @kernel.Thm {
  unless_cor6_c.get()
}

///|
/// UNLESS_cor7
fn step_42() -> Unit raise {
  let t260 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_or_lemma(), @mk_state_logic.p_and_not_p_lemma()]))
  let t259 = @simp.pure_once_rewrite_tac(@list.List([@mk_state_logic.and_comm_lemma()]))
  let t258 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_slash_bslash_star(Not((p : (A) -> Bool)), p), op_bslash_slash_star(p, p), (Pr : List[(A) -> A]))"))
  let t254 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t255 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t256 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t257 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("Not((p : (A) -> Bool))"), t256, t255, t254]), unless_thm6()))))
  let t252 = @term_syntax.parse_term("UNLESS((p : (A) -> Bool), p, (Pr : List[(A) -> A]))")
  let t253 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(Not((p : (A) -> Bool)), p, (Pr : List[(A) -> A]))"), t252]), @hol88.and_intro_thm())))
  let t251 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_not_lemma()]))
  let t250 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(Not((p : (A) -> Bool)), Not(Not(p)), (Pr : List[(A) -> A]))"))
  let t249 = @tactics.assume_tac(@bool.spec_all(@bool.spec(@term_syntax.parse_term("Not((p : (A) -> Bool))"), unless_thm2())))
  let t248 = @tactics.assume_tac(@bool.spec_all(unless_thm1()))
  let t261 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t248), t249), t250), t251), @tactics.disch_tac), t253), t257), t258), t259), t260)
  unless_cor7_c.set(@aux_definitions.prove_thm("UNLESS_cor7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(False, p, Pr)"), t261))
}

///|
let unless_cor7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor7")

///|
/// `UNLESS_cor7`
pub fn unless_cor7() -> @kernel.Thm {
  unless_cor7_c.get()
}

///|
/// HeJiFeng_lemma1
fn step_43() -> Unit raise {
  let t262 = @simp.asm_rewrite_tac(@list.List([]))
  let t263 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t262)
  hejifeng_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, (∀ s : A, p(s) && !q(s)) → (∀ s : A, p'(s)) → (∀ s : A, p(s) || q(s)) → (∀ s : A, p(s) && !q(s) → p'(s) && !q(s))")), t263))
}

///|
let hejifeng_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HeJiFeng_lemma1")

///|
/// `HeJiFeng_lemma1`
pub fn hejifeng_lemma1() -> @kernel.Thm {
  hejifeng_lemma1_c.get()
}

///|
/// HeJiFeng_lemma2
fn step_44() -> Unit raise {
  let t264 = @simp.asm_rewrite_tac(@list.List([]))
  let t265 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t264)
  hejifeng_lemma2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, (∀ s : A, p(s) && !q(s)) → (∀ s : A, p'(s)) → (∀ s : A, p(s) || q(s)) → (∀ s : A, p'(s) && !q(s) → p(s) && !q(s))")), t265))
}

///|
let hejifeng_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HeJiFeng_lemma2")

///|
/// `HeJiFeng_lemma2`
pub fn hejifeng_lemma2() -> @kernel.Thm {
  hejifeng_lemma2_c.get()
}

///|
/// HeJiFeng_lemma
fn step_45() -> Unit raise {
  let t266 = @bool.spec_all(@bool.undisch(@bool.undisch(@bool.undisch(@bool.spec_all(hejifeng_lemma2())))))
  let t267 = @simp.rewrite_tac(@list.List([@bool.imp_antisym_rule(@bool.spec_all(@bool.undisch(@bool.undisch(@bool.undisch(@bool.spec_all(hejifeng_lemma1()))))), t266)]))
  let t268 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t267)
  hejifeng_lemma_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, (∀ s : A, p(s) && !q(s)) → (∀ s : A, p'(s)) → (∀ s : A, p(s) || q(s)) → (∀ s : A, (p(s) && !q(s)) == (p'(s) && !q(s)))")), t268))
}

///|
let hejifeng_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HeJiFeng_lemma")

///|
/// `HeJiFeng_lemma`
pub fn hejifeng_lemma() -> @kernel.Thm {
  hejifeng_lemma_c.get()
}

///|
/// HeJiFeng_lemma_f
fn step_46() -> Unit raise {
  hejifeng_lemma_f_c.set(@hol88.mk_abs(@bool.undisch_all(@bool.spec_all(hejifeng_lemma()))))
}

///|
let hejifeng_lemma_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HeJiFeng_lemma_f")

///|
/// `HeJiFeng_lemma_f`
pub fn hejifeng_lemma_f() -> @kernel.Thm {
  hejifeng_lemma_f_c.get()
}

///|
/// UNLESS_cor8
fn step_47() -> Unit raise {
  let t271 = @simp.rewrite_tac(@list.List([hejifeng_lemma_f()]))
  let t270 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t269 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_def(), @mk_state_logic.or_def(), @mk_state_logic.not_def1()]))
  let t272 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t269), t270), t271)
  unless_cor8_c.set(@aux_definitions.prove_thm("UNLESS_cor8", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ s : A, p(s) && !q(s)) → (∀ s : A, p'(s)) → (∀ s : A, p(s) || q(s)) → UNLESS(op_slash_bslash_star(p, Not(q)), q, Pr) == UNLESS(op_slash_bslash_star(p', Not(q)), q, Pr)"), t272))
}

///|
let unless_cor8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor8")

///|
/// `UNLESS_cor8`
pub fn unless_cor8() -> @kernel.Thm {
  unless_cor8_c.get()
}

///|
/// UNLESS_cor9
fn step_48() -> Unit raise {
  let t290 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_assoc_lemma()]))
  let t289 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_bslash_slash_star(op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))), op_bslash_slash_star(op_slash_bslash_star(p, q), op_bslash_slash_star((r : (A) -> Bool), (r' : (A) -> Bool))), (Pr : List[(A) -> A]))"))
  let t286 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), op_bslash_slash_star((r : (A) -> Bool), (r' : (A) -> Bool)))")
  let t287 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool))), op_bslash_slash_star(p, (r' : (A) -> Bool))), op_slash_bslash_star(Not(op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))), op_bslash_slash_star(q, (r : (A) -> Bool)))), op_slash_bslash_star(op_bslash_slash_star(q, r), op_bslash_slash_star(p, r')))")
  let t288 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool)))"), t287, t286]), unless_thm3()))))
  let t284 = @term_syntax.parse_term("∀ s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool))), op_bslash_slash_star(p, (r' : (A) -> Bool))), op_slash_bslash_star(Not(op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))), op_bslash_slash_star(q, (r : (A) -> Bool)))), op_slash_bslash_star(op_bslash_slash_star(q, r), op_bslash_slash_star(p, r')), s) → op_bslash_slash_star(op_slash_bslash_star(p, q), op_bslash_slash_star(r, r'), s)")
  let t285 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_bslash_slash_star(op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(op_bslash_slash_star(p, p')), op_bslash_slash_star(p, (r' : (A) -> Bool))), op_slash_bslash_star(Not(op_bslash_slash_star(q, q')), op_bslash_slash_star(q, (r : (A) -> Bool)))), op_slash_bslash_star(op_bslash_slash_star(q, r), op_bslash_slash_star(p, r'))), (Pr : List[(A) -> A]))"), t284]), @hol88.and_intro_thm())))
  let t278 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t279 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t280 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t281 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t282 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t283 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t282, t281, t280, t279, t278]), @mk_state_logic.imply_weak_lemma4()))
  let t273 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t274 = @term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (r' : (A) -> Bool))")
  let t275 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t276 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t277 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t276, t275, t274, t273]), unless_thm5())))
  let t291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t277), t283), t285), t288), t289), t290)
  unless_cor9_c.set(@aux_definitions.prove_thm("UNLESS_cor9", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, ∀ r' : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(op_bslash_slash_star(p, p'), op_bslash_slash_star(q, r), Pr) && UNLESS(op_bslash_slash_star(q, q'), op_bslash_slash_star(p, r'), Pr) → UNLESS(op_bslash_slash_star(p, op_bslash_slash_star(p', op_bslash_slash_star(q, q'))), op_bslash_slash_star(op_slash_bslash_star(p, q), op_bslash_slash_star(r, r')), Pr)"), t291))
}

///|
let unless_cor9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor9")

///|
/// `UNLESS_cor9`
pub fn unless_cor9() -> @kernel.Thm {
  unless_cor9_c.get()
}

///|
/// UNLESS_cor10
fn step_49() -> Unit raise {
  let t298 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_false_lemma()]))
  let t297 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), False), (Pr : List[(A) -> A]))"))
  let t293 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t294 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t295 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t296 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t295, t294, t293]), unless_cor4())))
  let t292 = @simp.rewrite_tac(@list.List([stable()]))
  let t299 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t292), @tactics.disch_tac), t296), t297), t298)
  unless_cor10_c.set(@aux_definitions.prove_thm("UNLESS_cor10", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], STABLE(op_bslash_slash_star(p, q), Pr) → UNLESS(p, q, Pr)"), t299))
}

///|
let unless_cor10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor10")

///|
/// `UNLESS_cor10`
pub fn unless_cor10() -> @kernel.Thm {
  unless_cor10_c.get()
}

///|
/// UNLESS_cor11
fn step_50() -> Unit raise {
  let t303 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, Not((p : (A) -> Bool), s)"))
  let t304 = @bool.spec(@term_syntax.parse_term("(s : A)"), t303)
  let t305 = @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.not_def1()]))(t304))
  let t302 = @simp.rewrite_tac(@list.List([unless_stmt(), @mk_state_logic.false_def()]))
  let t301 = @simp.asm_rewrite_tac(@list.List([]))
  let t300 = @simp.rewrite_tac(@list.List([unless()]))
  let t306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([stable()]))), @lists.list_induct_tac), t300), @tactics.strip_tac), @hol88.res_tac), t301), @tactics.gen_tac), t302), t305), @tactics.strip_tac), @hol88.res_tac)
  unless_cor11_c.set(@aux_definitions.prove_thm("UNLESS_cor11", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ s : A, Not(p, s)) → STABLE(p, Pr)"), t306))
}

///|
let unless_cor11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor11")

///|
/// `UNLESS_cor11`
pub fn unless_cor11() -> @kernel.Thm {
  unless_cor11_c.get()
}

///|
/// UNLESS_cor12
fn step_51() -> Unit raise {
  let t308 = @simp.asm_rewrite_tac(@list.List([unless_stmt()]))
  let t307 = @simp.rewrite_tac(@list.List([unless()]))
  let t309 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([stable()]))), @lists.list_induct_tac), t307), @tactics.strip_tac), @hol88.res_tac), t308)
  unless_cor12_c.set(@aux_definitions.prove_thm("UNLESS_cor12", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ s : A, Not(p, s)) → STABLE(Not(p), Pr)"), t309))
}

///|
let unless_cor12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor12")

///|
/// `UNLESS_cor12`
pub fn unless_cor12() -> @kernel.Thm {
  unless_cor12_c.get()
}

///|
/// UNLESS_cor13
fn step_52() -> Unit raise {
  let t336 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_assoc_lemma(), @mk_state_logic.or_or_lemma(), @mk_state_logic.and_and_lemma()]))
  let t335 = @simp.pure_once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t334 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_assoc_lemma(), @mk_state_logic.or_or_lemma()]))
  let t333 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_and_distr_lemma()]))
  let t332 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_bslash_slash_star(op_bslash_slash_star((q : (A) -> Bool), (p : (A) -> Bool)), op_slash_bslash_star(p, q)), False, (Pr : List[(A) -> A]))"))
  let t328 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t329 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t330 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t331 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (p : (A) -> Bool))"), t330, t329, t328]), unless_thm8())))
  let t326 = @term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), False, (Pr : List[(A) -> A]))")
  let t327 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_bslash_slash_star((q : (A) -> Bool), (p : (A) -> Bool)), op_slash_bslash_star(p, q), (Pr : List[(A) -> A]))"), t326]), @hol88.and_intro_thm())))
  let t325 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_false_lemma()]))
  let t324 = @simp.pure_once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t323 = @simp.rewrite_tac(@list.List([@mk_state_logic.p_and_not_p_lemma(), @mk_state_logic.or_false_lemma()]))
  let t322 = @simp.pure_once_rewrite_tac(@list.List([@mk_state_logic.and_comm_lemma()]))
  let t321 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), p), op_slash_bslash_star(Not(q), q)), op_slash_bslash_star(q, p)), (Pr : List[(A) -> A]))"))
  let t316 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t317 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t318 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t319 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t320 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t319, t318, t317, t316]), unless_thm5())))
  let t314 = @term_syntax.parse_term("UNLESS((q : (A) -> Bool), (p : (A) -> Bool), (Pr : List[(A) -> A]))")
  let t315 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"), t314]), @hol88.and_intro_thm())))
  let t313 = @simp.rewrite_tac(@list.List([stable()]))
  let t312 = @tactics.undisch_tac(@term_syntax.parse_term("STABLE(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), (Pr : List[(A) -> A]))"))
  let t310 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t311 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t310]), unless_cor11())))
  let t337 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t311), t312), t313), @tactics.disch_tac), t315), t320), t321), t322), t323), t324), t325), @tactics.disch_tac), t327), t331), t332), t333), t334), t335), t336)
  unless_cor13_c.set(@aux_definitions.prove_thm("UNLESS_cor13", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && UNLESS(q, p, Pr) && (∀ s : A, Not(op_slash_bslash_star(p, q), s)) → STABLE(op_bslash_slash_star(p, q), Pr)"), t337))
}

///|
let unless_cor13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor13")

///|
/// `UNLESS_cor13`
pub fn unless_cor13() -> @kernel.Thm {
  unless_cor13_c.get()
}

///|
/// UNLESS_cor14
fn step_53() -> Unit raise {
  let t375 = @simp.asm_rewrite_tac(@list.List([]))
  let t374 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_lemma()]))
  let t373 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_false_lemma()]))
  let t372 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t371 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_false_lemma()]))
  let t370 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_or_lemma()]))
  let t369 = @simp.rewrite_tac(@list.List([@mk_state_logic.p_and_not_p_lemma()]))
  let t368 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@mk_state_logic.and_assoc_lemma())))]))
  let t367 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_and_comm_lemma()]))
  let t366 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_and_lemma()]))
  let t365 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_assoc_lemma()]))
  let t364 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_or_distr_lemma()]))
  let t363 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_and_or_not_lemma()]))
  let t362 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_false_lemma()]))
  let t361 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t360 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_false_lemma()]))
  let t359 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_lemma()]))
  let t358 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_compl_or_lemma()]))
  let t357 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()]))
  let t356 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.or_false_lemma()]))
  let t355 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), op_slash_bslash_star(p, Not(q))), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(op_slash_bslash_star(p, q)), op_slash_bslash_star(p, Not(q))), op_slash_bslash_star(Not(op_slash_bslash_star(p, Not(q))), False)), op_slash_bslash_star(False, op_slash_bslash_star(p, Not(q)))), (Pr : List[(A) -> A]))"))
  let t350 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t351 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool)))")
  let t352 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool)))")
  let t353 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t354 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t353, t352, t351, t350]), unless_thm5())))
  let t348 = @term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_slash_bslash_star(p, Not(q)), (Pr : List[(A) -> A]))")
  let t349 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), False, (Pr : List[(A) -> A]))"), t348]), @hol88.and_intro_thm())))
  let t346 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t347 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool)))"), t346]), unless_thm1()))
  let t345 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.p_and_not_p_lemma(), @mk_state_logic.or_false_lemma()]))
  let t344 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, False), op_slash_bslash_star(q, Not(q))), op_slash_bslash_star(Not(q), False)), (Pr : List[(A) -> A]))"))
  let t339 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t340 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t341 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t342 = @term_syntax.parse_term("Not((q : (A) -> Bool))")
  let t343 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t342, t341, t340, t339]), unless_thm4())))
  let t338 = @tactics.repeat_tac(@tactics.gen_tac)
  let t376 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([stable()])), t338), @tactics.disch_tac), t343), t344), t345), @tactics.disch_tac), t347), t349), t354), t355), t356), t357), t358), t359), t360), t361), t362), t363), t364), t365), t366), t367), t368), t369), t370), t371), t372), t373), @tactics.disch_tac), t374), t375)
  unless_cor14_c.set(@aux_definitions.prove_thm("UNLESS_cor14", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, Not(q), Pr) && STABLE(q, Pr) → UNLESS(p, op_slash_bslash_star(p, Not(q)), Pr)"), t376))
}

///|
let unless_cor14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor14")

///|
/// `UNLESS_cor14`
pub fn unless_cor14() -> @kernel.Thm {
  unless_cor14_c.get()
}

///|
/// UNLESS_cor15_lem1
fn step_54() -> Unit raise {
  let t378 = @tactics.then_tac(@hol88.res_tac, @simp.asm_rewrite_tac(@list.List([])))
  let t377 = @tactics.repeat_tac(@tactics.strip_tac)
  let t379 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t377), t378)
  unless_cor15_lem1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : Bool, ∀ q : Bool, (p && (!p || !q)) == (p && !q)")), t379))
}

///|
let unless_cor15_lem1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor15_lem1")

///|
/// `UNLESS_cor15_lem1`
pub fn unless_cor15_lem1() -> @kernel.Thm {
  unless_cor15_lem1_c.get()
}

///|
/// UNLESS_cor15_lem2
fn step_55() -> Unit raise {
  let t381 = @simp.asm_rewrite_tac(@list.List([]))
  let t380 = @tactics.repeat_tac(@tactics.strip_tac)
  let t382 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t380), t381)
  unless_cor15_lem2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : Bool, ∀ q : Bool, (p || p && q) == p")), t382))
}

///|
let unless_cor15_lem2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor15_lem2")

///|
/// `UNLESS_cor15_lem2`
pub fn unless_cor15_lem2() -> @kernel.Thm {
  unless_cor15_lem2_c.get()
}

///|
/// UNLESS_cor15_lem3
fn step_56() -> Unit raise {
  let t384 = @simp.asm_rewrite_tac(@list.List([]))
  let t383 = @tactics.repeat_tac(@tactics.strip_tac)
  let t385 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t383), t384)
  unless_cor15_lem3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, (∀ i : Num, P(i) && Q(i)) == ((∀ i : Num, P(i)) && (∀ i : Num, Q(i)))")), t385))
}

///|
let unless_cor15_lem3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor15_lem3")

///|
/// `UNLESS_cor15_lem3`
pub fn unless_cor15_lem3() -> @kernel.Thm {
  unless_cor15_lem3_c.get()
}

///|
/// UNLESS_STMT_cor15
fn step_57() -> Unit raise {
  let t388 = @meson.meson_tac(@list.List([]))
  let t387 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t386 = @simp.rewrite_tac(@list.List([@mk_state_logic.forall_def(), @mk_state_logic.exists_def(), unless_stmt(), @mk_state_logic.and_def()]))
  let t389 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t386), t387), t388)
  unless_stmt_cor15_c.set(@aux_definitions.prove_thm("UNLESS_STMT_cor15", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ Q : (Num, A) -> Bool, ∀ st : (A) -> A, (∀ i : Num, ∀ s : A, UNLESS_STMT(P(i), op_slash_bslash_star(P(i), Q(i)), st, s)) → (∀ s : A, UNLESS_STMT(op_bang_star(P), op_slash_bslash_star(op_bang_star(P), op_q_star(Q)), st, s))"), t389))
}

///|
let unless_stmt_cor15_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_cor15")

///|
/// `UNLESS_STMT_cor15`
pub fn unless_stmt_cor15() -> @kernel.Thm {
  unless_stmt_cor15_c.get()
}

///|
/// UNLESS_cor15
fn step_58() -> Unit raise {
  let t394 = @simp.asm_rewrite_tac(@list.List([]))
  let t392 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, (∀ s : A, UNLESS_STMT((P : (Num, A) -> Bool)(i), op_slash_bslash_star(P(i), (Q : (Num, A) -> Bool)(i)), (h : (A) -> A), s)) && UNLESS(P(i), op_slash_bslash_star(P(i), Q(i)), (t : List[(A) -> A]))"))
  let t393 = @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([unless_cor15_lem3()]))(t392))
  let t391 = @simp.asm_rewrite_tac(@list.List([]))
  let t390 = @simp.rewrite_tac(@list.List([unless()]))
  let t396 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t390), @tactics.strip_tac), @hol88.res_tac), t391), t393), @hol88.res_tac), t394), (x395 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(unless_stmt_cor15(), x395))
  unless_cor15_c.set(@aux_definitions.prove_thm("UNLESS_cor15", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ Q : (Num, A) -> Bool, ∀ Pr : List[(A) -> A], (∀ i : Num, UNLESS(P(i), op_slash_bslash_star(P(i), Q(i)), Pr)) → UNLESS(op_bang_star(P), op_slash_bslash_star(op_bang_star(P), op_q_star(Q)), Pr)"), t396))
}

///|
let unless_cor15_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor15")

///|
/// `UNLESS_cor15`
pub fn unless_cor15() -> @kernel.Thm {
  unless_cor15_c.get()
}

///|
/// UNLESS_cor16
fn step_59() -> Unit raise {
  let t399 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t400 = @term_syntax.parse_term("(Q : (Num, A) -> Bool)(SUC((i : Num)))")
  let t401 = @term_syntax.parse_term("(P : (Num, A) -> Bool)(SUC((i : Num)))")
  let t402 = @term_syntax.parse_term("op_bslash_lt_eq_slash_star((Q : (Num, A) -> Bool), (i : Num))")
  let t403 = @tactics.strip_assume_tac(@bool.undisch_all(@lib.hd(@hol88.imp_canon(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_lt_eq_bslash_star((P : (Num, A) -> Bool), (i : Num))"), t402, t401, t400, t399]), unless_thm6())))))
  let t397 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, UNLESS((P : (Num, A) -> Bool)(i), (Q : (Num, A) -> Bool)(i), (Pr : List[(A) -> A]))"))
  let t398 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t397))
  let t404 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.and_le_n_def(), @mk_state_logic.or_le_n_def()])), t398), t403)
  let t405 = @list.List([@simp.asm_rewrite_tac(@list.List([@mk_state_logic.and_le_n_def(), @mk_state_logic.or_le_n_def()])), t404])
  let t406 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), @nums.induct_tac), t405)
  unless_cor16_c.set(@aux_definitions.prove_thm("UNLESS_cor16", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ Q : (Num, A) -> Bool, ∀ Pr : List[(A) -> A], (∀ i : Num, UNLESS(P(i), Q(i), Pr)) → (∀ i : Num, UNLESS(op_slash_lt_eq_bslash_star(P, i), op_bslash_lt_eq_slash_star(Q, i), Pr))"), t406))
}

///|
let unless_cor16_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor16")

///|
/// `UNLESS_cor16`
pub fn unless_cor16() -> @kernel.Thm {
  unless_cor16_c.get()
}

///|
/// UNLESS_cor17
fn step_60() -> Unit raise {
  let t414 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_or_lemma()]))
  let t409 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t410 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t411 = @term_syntax.parse_term("(P : (Num, A) -> Bool)(SUC((i : Num)))")
  let t412 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t413 = @tactics.assume_tac(@bool.undisch_all(@lib.hd(@hol88.imp_canon(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_lt_eq_bslash_star((P : (Num, A) -> Bool), (i : Num))"), t412, t411, t410, t409]), unless_thm6())))))
  let t407 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, UNLESS((P : (Num, A) -> Bool)(i), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t408 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t407))
  let t415 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.and_le_n_def(), @mk_state_logic.or_le_n_def()])), t408), t413), @aux_definitions.undisch_one_tac), t414)
  let t416 = @list.List([@simp.asm_rewrite_tac(@list.List([@mk_state_logic.and_le_n_def(), @mk_state_logic.or_le_n_def()])), t415])
  let t417 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), @nums.induct_tac), t416)
  unless_cor17_c.set(@aux_definitions.prove_thm("UNLESS_cor17", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ i : Num, UNLESS(P(i), q, Pr)) → (∀ i : Num, UNLESS(op_slash_lt_eq_bslash_star(P, i), q, Pr))"), t417))
}

///|
let unless_cor17_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor17")

///|
/// `UNLESS_cor17`
pub fn unless_cor17() -> @kernel.Thm {
  unless_cor17_c.get()
}

///|
/// UNLESS_STMT_cor18
fn step_61() -> Unit raise {
  let t420 = @meson.meson_tac(@list.List([]))
  let t419 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t418 = @simp.rewrite_tac(@list.List([@mk_state_logic.forall_def(), @mk_state_logic.exists_def(), unless_stmt(), @mk_state_logic.and_def()]))
  let t421 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t418), t419), t420)
  unless_stmt_cor18_c.set(@aux_definitions.prove_thm("UNLESS_STMT_cor18", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ Q : _, ∀ st : (A) -> A, (∀ i : Num, ∀ s : A, UNLESS_STMT(P(i), (q : (A) -> Bool), st, s)) → (∀ s : A, UNLESS_STMT(op_q_star(P), q, st, s))"), t421))
}

///|
let unless_stmt_cor18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_STMT_cor18")

///|
/// `UNLESS_STMT_cor18`
pub fn unless_stmt_cor18() -> @kernel.Thm {
  unless_stmt_cor18_c.get()
}

///|
/// UNLESS_cor18
fn step_62() -> Unit raise {
  let t426 = @simp.asm_rewrite_tac(@list.List([]))
  let t424 = @kernel.assume_rule(@term_syntax.parse_term("∀ m : Num, (∀ s : A, UNLESS_STMT((P : (Num, A) -> Bool)(m), (q : (A) -> Bool), (h : (A) -> A), s)) && UNLESS(P(m), q, (t : List[(A) -> A]))"))
  let t425 = @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([unless_cor15_lem3()]))(t424))
  let t423 = @simp.asm_rewrite_tac(@list.List([]))
  let t422 = @simp.rewrite_tac(@list.List([unless()]))
  let t428 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t422), @tactics.strip_tac), t423), t425), @hol88.res_tac), t426), (x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(unless_stmt_cor18(), x427))
  unless_cor18_c.set(@aux_definitions.prove_thm("UNLESS_cor18", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ m : Num, UNLESS(P(m), q, Pr)) → UNLESS(op_q_star(P), q, Pr)"), t428))
}

///|
let unless_cor18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor18")

///|
/// `UNLESS_cor18`
pub fn unless_cor18() -> @kernel.Thm {
  unless_cor18_c.get()
}

///|
/// UNLESS_cor19
fn step_63() -> Unit raise {
  let t429 = @simp.rewrite_tac(@list.List([unless_thm1()]))
  let t430 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([stable()]))), t429)
  unless_cor19_c.set(@aux_definitions.prove_thm("UNLESS_cor19", @term_syntax.parse_term("∀ Pr : List[(A) -> A], STABLE(False, Pr)"), t430))
}

///|
let unless_cor19_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor19")

///|
/// `UNLESS_cor19`
pub fn unless_cor19() -> @kernel.Thm {
  unless_cor19_c.get()
}

///|
/// UNLESS_cor20
fn step_64() -> Unit raise {
  let t432 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t433 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t434 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t435 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t436 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t435, t434, t433, t432]), unless_thm4())
  let t437 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.or_false_lemma()]))(t436))
  let t431 = @simp.rewrite_tac(@list.List([stable()]))
  let t438 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t431), t437)
  unless_cor20_c.set(@aux_definitions.prove_thm("UNLESS_cor20", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], STABLE(p, Pr) && STABLE(q, Pr) → STABLE(op_slash_bslash_star(p, q), Pr)"), t438))
}

///|
let unless_cor20_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor20")

///|
/// `UNLESS_cor20`
pub fn unless_cor20() -> @kernel.Thm {
  unless_cor20_c.get()
}

///|
/// UNLESS_cor21
fn step_65() -> Unit raise {
  let t440 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t441 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t442 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t443 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t444 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t443, t442, t441, t440]), unless_thm7())
  let t445 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.or_false_lemma()]))(t444))
  let t439 = @simp.rewrite_tac(@list.List([stable()]))
  let t446 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t439), t445)
  unless_cor21_c.set(@aux_definitions.prove_thm("UNLESS_cor21", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], STABLE(p, Pr) && STABLE(q, Pr) → STABLE(op_bslash_slash_star(p, q), Pr)"), t446))
}

///|
let unless_cor21_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor21")

///|
/// `UNLESS_cor21`
pub fn unless_cor21() -> @kernel.Thm {
  unless_cor21_c.get()
}

///|
/// UNLESS_cor22
fn step_66() -> Unit raise {
  let t448 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t449 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t450 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t451 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t452 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t451, t450, t449, t448]), unless_thm4())
  let t453 = @simp.rewrite_rule(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.or_false_lemma()]))(t452)
  let t454 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_and_comm_lemma()]))(t453)
  let t455 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t454)
  let t456 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_false_lemma()]))(t455))
  let t447 = @simp.rewrite_tac(@list.List([stable()]))
  let t457 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t447), t456)
  unless_cor22_c.set(@aux_definitions.prove_thm("UNLESS_cor22", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && STABLE(r, Pr) → UNLESS(op_slash_bslash_star(p, r), op_slash_bslash_star(q, r), Pr)"), t457))
}

///|
let unless_cor22_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor22")

///|
/// `UNLESS_cor22`
pub fn unless_cor22() -> @kernel.Thm {
  unless_cor22_c.get()
}

///|
/// UNLESS_cor23
fn step_67() -> Unit raise {
  let t461 = @simp.asm_rewrite_tac(@list.List([]))
  let t459 = @simp.asm_rewrite_tac(@list.List([]))
  let t458 = @simp.rewrite_tac(@list.List([unless()]))
  let t462 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t458), @tactics.strip_tac), @hol88.res_tac), t459), (x460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(unless_stmt_thm6(), x460)), t461)
  unless_cor23_c.set(@aux_definitions.prove_thm("UNLESS_cor23", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) → UNLESS(op_bslash_slash_star(p, r), op_bslash_slash_star(q, r), Pr)"), t462))
}

///|
let unless_cor23_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNLESS_cor23")

///|
/// `UNLESS_cor23`
pub fn unless_cor23() -> @kernel.Thm {
  unless_cor23_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
}
