// Translated from upstream Unity/mk_comp_unity.ml; edit this file directly.

///|
/// COMP_UNLESS_thm1_lemma_1
fn step_1() -> Unit raise {
  let t7 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @hol88.res_tac, @hol88.res_tac])
  let t6 = @tactics.repeat_tac(@tactics.strip_tac)
  let t5 = @simp.rewrite_tac(@list.List([@mk_unless.unless()]))
  let t8 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.append()])), t5), t6), t7)
  let t9 = @list.List([@simp.rewrite_tac(@list.List([@mk_unless.unless(), @lists.append()])), t8])
  let t3 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t4 = @tactics.spec_tac(@term_syntax.parse_term("(FPr : List[(A) -> A])"), t3)
  let t1 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t2 = @tactics.spec_tac(@term_syntax.parse_term("(GPr : List[(A) -> A])"), t1)
  let t10 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2), t4), @lists.list_induct_tac), t9)
  comp_unless_thm1_lemma_1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, APPEND(FPr, GPr)) → UNLESS(p, q, FPr) && UNLESS(p, q, GPr)")), t10))
}

///|
let comp_unless_thm1_lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNLESS_thm1_lemma_1")

///|
/// `COMP_UNLESS_thm1_lemma_1`
pub fn comp_unless_thm1_lemma_1() -> @kernel.Thm {
  comp_unless_thm1_lemma_1_c.get()
}

///|
/// COMP_UNLESS_thm1_lemma_2
fn step_2() -> Unit raise {
  let t17 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @hol88.res_tac])
  let t16 = @tactics.repeat_tac(@tactics.strip_tac)
  let t15 = @simp.rewrite_tac(@list.List([@mk_unless.unless()]))
  let t18 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.append()])), t15), t16), t17)
  let t19 = @list.List([@simp.rewrite_tac(@list.List([@mk_unless.unless(), @lists.append()])), t18])
  let t13 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t14 = @tactics.spec_tac(@term_syntax.parse_term("(FPr : List[(A) -> A])"), t13)
  let t11 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t12 = @tactics.spec_tac(@term_syntax.parse_term("(GPr : List[(A) -> A])"), t11)
  let t20 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t12), t14), @lists.list_induct_tac), t19)
  comp_unless_thm1_lemma_2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, FPr) && UNLESS(p, q, GPr) → UNLESS(p, q, APPEND(FPr, GPr))")), t20))
}

///|
let comp_unless_thm1_lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNLESS_thm1_lemma_2")

///|
/// `COMP_UNLESS_thm1_lemma_2`
pub fn comp_unless_thm1_lemma_2() -> @kernel.Thm {
  comp_unless_thm1_lemma_2_c.get()
}

///|
/// COMP_UNLESS_thm1
fn step_3() -> Unit raise {
  let t21 = @bool.spec_all(comp_unless_thm1_lemma_2())
  let t22 = @tactics.strip_assume_tac(@bool.imp_antisym_rule(@bool.spec_all(comp_unless_thm1_lemma_1()), t21))
  let t23 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t22)
  comp_unless_thm1_c.set(@aux_definitions.prove_thm("COMP_UNLESS_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, APPEND(FPr, GPr)) == (UNLESS(p, q, FPr) && UNLESS(p, q, GPr))"), t23))
}

///|
let comp_unless_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNLESS_thm1")

///|
/// `COMP_UNLESS_thm1`
pub fn comp_unless_thm1() -> @kernel.Thm {
  comp_unless_thm1_c.get()
}

///|
/// COMP_ENSURES_thm1_lemma_1
fn step_4() -> Unit raise {
  let t40 = @simp.asm_rewrite_tac(@list.List([]))
  let t39 = @simp.rewrite_tac(@list.List([@mk_ensures.ensures()]))
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), (GPr : List[(A) -> A]))")), t39), @tactics.strip_tac), t40)
  let t38 = @simp.asm_rewrite_tac(@list.List([]))
  let t37 = @simp.rewrite_tac(@list.List([@mk_ensures.ensures()]))
  let t42 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), (t : List[(A) -> A]))")), t37), @tactics.strip_tac), t38), t41])
  let t35 = @bool.gen_all(@equal.sym(@bool.spec_all(@mk_ensures.ensures())))
  let t33 = @term_syntax.parse_term("APPEND((t : List[(A) -> A]), (GPr : List[(A) -> A]))")
  let t34 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t36 = @simp.rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("(q : (A) -> Bool)"), t34, t33]), t35)]))
  let t32 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), APPEND((t : List[(A) -> A]), (GPr : List[(A) -> A]))) && EXIST_TRANSITION(p, q, APPEND(t, GPr))"))
  let t31 = @term_syntax.parse_term("EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), APPEND((t : List[(A) -> A]), (GPr : List[(A) -> A])))")
  let t43 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), APPEND((t : List[(A) -> A]), (GPr : List[(A) -> A])))"), t31]), @hol88.and_intro_thm()))), t32), t36), @tactics.disch_tac), @hol88.res_tac), t42)
  let t30 = @simp.asm_rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(comp_unless_thm1())))]))
  let t44 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @simp.asm_rewrite_tac(@list.List([]))), t30), t43])
  let t29 = @simp.asm_rewrite_tac(@list.List([]))
  let t28 = @tactics.repeat_tac(@tactics.strip_tac)
  let t45 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@mk_ensures.ensures(), @mk_ensures.exist_transition(), @mk_unless.unless(), @lists.append()]))), t28), t29), t44)
  let t46 = @list.List([@simp.rewrite_tac(@list.List([@mk_ensures.ensures(), @mk_ensures.exist_transition(), @mk_unless.unless(), @lists.append()])), t45])
  let t26 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t27 = @tactics.spec_tac(@term_syntax.parse_term("(FPr : List[(A) -> A])"), t26)
  let t24 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t25 = @tactics.spec_tac(@term_syntax.parse_term("(GPr : List[(A) -> A])"), t24)
  let t47 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t25), t27), @lists.list_induct_tac), t46)
  comp_ensures_thm1_lemma_1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, APPEND(FPr, GPr)) → ENSURES(p, q, FPr) && UNLESS(p, q, GPr) || ENSURES(p, q, GPr) && UNLESS(p, q, FPr)")), t47))
}

///|
let comp_ensures_thm1_lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_ENSURES_thm1_lemma_1")

///|
/// `COMP_ENSURES_thm1_lemma_1`
pub fn comp_ensures_thm1_lemma_1() -> @kernel.Thm {
  comp_ensures_thm1_lemma_1_c.get()
}

///|
/// COMP_ENSURES_thm1_lemma_2
fn step_5() -> Unit raise {
  let t57 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t58 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t59 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t60 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t59, t58, t57]), @mk_ensures.exist_transition_thm8()))]))
  let t53 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t54 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t55 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t56 = @bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t55, t54, t53]), @mk_ensures.exist_transition_thm8()))
  let t61 = @list.List([@simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@mk_ensures.exist_transition_thm12()]))(t56)])), t60])
  let t51 = @bool.spec_all(@mk_ensures.exist_transition_thm8())
  let t52 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@simp.once_rewrite_rule(@list.List([@mk_ensures.exist_transition_thm12()]))(t51))]))
  let t50 = @simp.asm_rewrite_tac(@list.List([comp_unless_thm1(), @mk_ensures.ensures(), @mk_ensures.exist_transition(), @mk_unless.unless(), @lists.append()]))
  let t49 = @tactics.repeat_tac(@tactics.strip_tac)
  let t48 = @simp.rewrite_tac(@list.List([@mk_ensures.ensures(), @mk_ensures.exist_transition(), @mk_unless.unless(), @lists.append()]))
  let t62 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t48), t49), @hol88.res_tac), t50), t52), t61)
  comp_ensures_thm1_lemma_2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, FPr) && UNLESS(p, q, GPr) || ENSURES(p, q, GPr) && UNLESS(p, q, FPr) → ENSURES(p, q, APPEND(FPr, GPr))")), t62))
}

///|
let comp_ensures_thm1_lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_ENSURES_thm1_lemma_2")

///|
/// `COMP_ENSURES_thm1_lemma_2`
pub fn comp_ensures_thm1_lemma_2() -> @kernel.Thm {
  comp_ensures_thm1_lemma_2_c.get()
}

///|
/// COMP_ENSURES_thm1
fn step_6() -> Unit raise {
  let t63 = @bool.spec_all(comp_ensures_thm1_lemma_2())
  let t64 = @tactics.strip_assume_tac(@bool.imp_antisym_rule(@bool.spec_all(comp_ensures_thm1_lemma_1()), t63))
  let t65 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t64)
  comp_ensures_thm1_c.set(@aux_definitions.prove_thm("COMP_ENSURES_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, APPEND(FPr, GPr)) == (ENSURES(p, q, FPr) && UNLESS(p, q, GPr) || ENSURES(p, q, GPr) && UNLESS(p, q, FPr))"), t65))
}

///|
let comp_ensures_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_ENSURES_thm1")

///|
/// `COMP_ENSURES_thm1`
pub fn comp_ensures_thm1() -> @kernel.Thm {
  comp_ensures_thm1_c.get()
}

///|
/// COMP_ENSURES_cor0
fn step_7() -> Unit raise {
  let t67 = @bool.spec_all(comp_ensures_thm1())
  let t66 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (GPr : List[(A) -> A]))"))
  let t68 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), (FPr : List[(A) -> A]))")), t66]))(t67))
  let t69 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t68)
  comp_ensures_cor0_c.set(@aux_definitions.prove_thm("COMP_ENSURES_cor0", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, FPr) && UNLESS(p, q, GPr) → ENSURES(p, q, APPEND(FPr, GPr))"), t69))
}

///|
let comp_ensures_cor0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_ENSURES_cor0")

///|
/// `COMP_ENSURES_cor0`
pub fn comp_ensures_cor0() -> @kernel.Thm {
  comp_ensures_cor0_c.get()
}

///|
/// COMP_ENSURES_cor1
fn step_8() -> Unit raise {
  let t71 = @bool.spec_all(comp_ensures_thm1())
  let t70 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (FPr : List[(A) -> A]))"))
  let t72 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), (GPr : List[(A) -> A]))")), t70]))(t71))
  let t73 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t72)
  comp_ensures_cor1_c.set(@aux_definitions.prove_thm("COMP_ENSURES_cor1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, GPr) && UNLESS(p, q, FPr) → ENSURES(p, q, APPEND(FPr, GPr))"), t73))
}

///|
let comp_ensures_cor1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_ENSURES_cor1")

///|
/// `COMP_ENSURES_cor1`
pub fn comp_ensures_cor1() -> @kernel.Thm {
  comp_ensures_cor1_c.get()
}

///|
/// COMP_UNITY_cor0
fn step_9() -> Unit raise {
  let t76 = @simp.asm_rewrite_tac(@list.List([]))
  let t75 = @tactics.repeat_tac(@tactics.strip_tac)
  let t74 = @tactics.repeat_tac(@tactics.gen_tac)
  let t77 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.invariant(), @mk_unless.stable(), comp_unless_thm1()])), t74), @tactics.eq_tac), t75), @hol88.res_tac), t76)
  comp_unity_cor0_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor0", @term_syntax.parse_term("∀ p0 : (A) -> Bool, ∀ p : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], INVARIANT(p, (p0, APPEND(FPr, GPr))) == (INVARIANT(p, (p0, FPr)) && INVARIANT(p, (p0, GPr)))"), t77))
}

///|
let comp_unity_cor0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor0")

///|
/// `COMP_UNITY_cor0`
pub fn comp_unity_cor0() -> @kernel.Thm {
  comp_unity_cor0_c.get()
}

///|
/// COMP_UNITY_cor1
fn step_10() -> Unit raise {
  let t78 = @simp.rewrite_tac(@list.List([@mk_unless.stable(), comp_unless_thm1()]))
  comp_unity_cor1_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], STABLE(p, APPEND(FPr, GPr)) == (STABLE(p, FPr) && STABLE(p, GPr))"), t78))
}

///|
let comp_unity_cor1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor1")

///|
/// `COMP_UNITY_cor1`
pub fn comp_unity_cor1() -> @kernel.Thm {
  comp_unity_cor1_c.get()
}

///|
/// COMP_UNITY_cor2
fn step_11() -> Unit raise {
  let t84 = @simp.rewrite_tac(@list.List([@mk_state_logic.false_def(), @class.not_clauses(), @hol88.or_intro_thm1()]))
  let t85 = @list.List([@tactics.then_tac(@tactics.then_tac(@hol88.res_tac, @tactics.undisch_tac(@term_syntax.parse_term("!False((s : A)) → (p : (A) -> Bool)((h : (A) -> A)(s)) || False(h(s))"))), t84), @hol88.res_tac])
  let t83 = @tactics.repeat_tac(@tactics.strip_tac)
  let t82 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t86 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.unless(), @mk_unless.unless_stmt()])), t82), t83), t85)
  let t87 = @list.List([@simp.rewrite_tac(@list.List([@mk_unless.unless()])), t86])
  let t80 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t81 = @tactics.spec_tac(@term_syntax.parse_term("(GPr : List[(A) -> A])"), t80)
  let t88 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), False, (GPr : List[(A) -> A]))")), t81), @lists.list_induct_tac), t87)
  let t89 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t88])
  let t79 = @tactics.repeat_tac(@tactics.strip_tac)
  let t90 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.stable(), comp_unless_thm1()])), t79), t89)
  comp_unity_cor2_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, FPr) && STABLE(p, GPr) → UNLESS(p, q, APPEND(FPr, GPr))"), t90))
}

///|
let comp_unity_cor2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor2")

///|
/// `COMP_UNITY_cor2`
pub fn comp_unity_cor2() -> @kernel.Thm {
  comp_unity_cor2_c.get()
}

///|
/// COMP_UNITY_cor3
fn step_12() -> Unit raise {
  let t92 = @simp.asm_rewrite_tac(@list.List([]))
  let t93 = @list.List([@hol88.res_tac, @simp.asm_rewrite_tac(@list.List([])), t92])
  let t91 = @tactics.repeat_tac(@tactics.strip_tac)
  let t94 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.invariant(), @mk_unless.stable(), comp_unless_thm1()])), t91), t93)
  comp_unity_cor3_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor3", @term_syntax.parse_term("∀ p0 : (A) -> Bool, ∀ p : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], INVARIANT(p, (p0, FPr)) && STABLE(p, GPr) → INVARIANT(p, (p0, APPEND(FPr, GPr)))"), t94))
}

///|
let comp_unity_cor3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor3")

///|
/// `COMP_UNITY_cor3`
pub fn comp_unity_cor3() -> @kernel.Thm {
  comp_unity_cor3_c.get()
}

///|
/// COMP_UNITY_cor4
fn step_13() -> Unit raise {
  let t112 = @tactics.then_tac(@hol88.res_tac, @simp.asm_rewrite_tac(@list.List([])))
  let t113 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t112])
  let t111 = @tactics.repeat_tac(@tactics.strip_tac)
  let t114 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.append(), @mk_ensures.exist_transition()])), t111), t113)
  let t115 = @list.List([@simp.rewrite_tac(@list.List([@mk_ensures.exist_transition()])), t114])
  let t109 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t110 = @tactics.spec_tac(@term_syntax.parse_term("(FPr : List[(A) -> A])"), t109)
  let t108 = @tactics.undisch_tac(@term_syntax.parse_term("EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), (FPr : List[(A) -> A]))"))
  let t107 = @simp.rewrite_tac(@list.List([@mk_ensures.ensures()]))
  let t106 = @tactics.undisch_tac(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), (FPr : List[(A) -> A]))"))
  let t105 = @simp.asm_rewrite_tac(@list.List([]))
  let t104 = @simp.rewrite_tac(@list.List([@mk_ensures.ensures()]))
  let t100 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t101 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t102 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t103 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t102, t101, t100]), comp_unity_cor2())))
  let t98 = @term_syntax.parse_term("STABLE((p : (A) -> Bool), (GPr : List[(A) -> A]))")
  let t99 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (FPr : List[(A) -> A]))"), t98]), @hol88.and_intro_thm())))
  let t95 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t96 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t97 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t96, t95]), @mk_ensures.ensures_cor2())))
  let t116 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t97), t99), t103), t104), t105), t106), t107), @tactics.strip_tac), t108), t110), @lists.list_induct_tac), t115)
  comp_unity_cor4_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, FPr) && STABLE(p, GPr) → ENSURES(p, q, APPEND(FPr, GPr))"), t116))
}

///|
let comp_unity_cor4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor4")

///|
/// `COMP_UNITY_cor4`
pub fn comp_unity_cor4() -> @kernel.Thm {
  comp_unity_cor4_c.get()
}

///|
/// COMP_UNITY_cor5
fn step_14() -> Unit raise {
  let t117 = @tactics.repeat_tac(@tactics.strip_tac)
  let t118 = @tactics.then_tac(@simp.rewrite_tac(@list.List([comp_unless_thm1()])), t117)
  comp_unity_cor5_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, APPEND(FPr, GPr)) → UNLESS(p, q, GPr)"), t118))
}

///|
let comp_unity_cor5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor5")

///|
/// `COMP_UNITY_cor5`
pub fn comp_unity_cor5() -> @kernel.Thm {
  comp_unity_cor5_c.get()
}

///|
/// COMP_UNITY_cor6
fn step_15() -> Unit raise {
  let t119 = @tactics.repeat_tac(@tactics.strip_tac)
  let t120 = @tactics.then_tac(@simp.rewrite_tac(@list.List([comp_unless_thm1()])), t119)
  comp_unity_cor6_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, APPEND(FPr, GPr)) → UNLESS(p, q, FPr)"), t120))
}

///|
let comp_unity_cor6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor6")

///|
/// `COMP_UNITY_cor6`
pub fn comp_unity_cor6() -> @kernel.Thm {
  comp_unity_cor6_c.get()
}

///|
/// COMP_UNITY_cor7
fn step_16() -> Unit raise {
  let t121 = @tactics.repeat_tac(@tactics.strip_tac)
  let t122 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.unless()])), t121)
  comp_unity_cor7_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ FPr : List[(A) -> A], UNLESS(p, q, CONS(st, FPr)) → UNLESS(p, q, FPr)"), t122))
}

///|
let comp_unity_cor7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor7")

///|
/// `COMP_UNITY_cor7`
pub fn comp_unity_cor7() -> @kernel.Thm {
  comp_unity_cor7_c.get()
}

///|
/// COMP_UNITY_cor8
fn step_17() -> Unit raise {
  let t126 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t127 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t128 = @term_syntax.parse_term("Not((p : (A) -> Bool))")
  let t129 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t128, t127, t126]), @mk_ensures.exist_transition_thm8())
  let t130 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@simp.once_rewrite_rule(@list.List([@mk_ensures.exist_transition_thm12()]))(t129))]))
  let t125 = @simp.asm_rewrite_tac(@list.List([@mk_unless.unless_thm2()]))
  let t124 = @tactics.repeat_tac(@tactics.strip_tac)
  let t123 = @simp.rewrite_tac(@list.List([@lists.append(), @mk_ensures.ensures(), @mk_unless.unless(), @mk_ensures.exist_transition()]))
  let t131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t123), t124), @hol88.res_tac), t125), t130)
  comp_unity_cor8_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor8", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, Not(p), FPr) → ENSURES(p, Not(p), APPEND(FPr, GPr))"), t131))
}

///|
let comp_unity_cor8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor8")

///|
/// `COMP_UNITY_cor8`
pub fn comp_unity_cor8() -> @kernel.Thm {
  comp_unity_cor8_c.get()
}

///|
/// COMP_UNITY_cor9
fn step_18() -> Unit raise {
  let t140 = @simp.asm_rewrite_tac(@list.List([]))
  let t136 = @simp.rewrite_tac(@list.List([@mk_state_logic.false_def(), @class.not_clauses(), @hol88.or_intro_thm1()]))
  let t137 = @list.List([@tactics.then_tac(@tactics.then_tac(@hol88.res_tac, @tactics.undisch_tac(@term_syntax.parse_term("!False((s : A)) → (p : (A) -> Bool)((h : (A) -> A)(s)) || False(h(s))"))), t136), @hol88.res_tac])
  let t135 = @tactics.repeat_tac(@tactics.strip_tac)
  let t138 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.unless(), @mk_unless.unless_stmt()])), @tactics.beta_tac), t135), t137)
  let t139 = @list.List([@simp.rewrite_tac(@list.List([@mk_unless.unless()])), t138])
  let t133 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t134 = @tactics.spec_tac(@term_syntax.parse_term("(FPr : List[(A) -> A])"), t133)
  let t141 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), False, (FPr : List[(A) -> A]))")), t134), @lists.list_induct_tac), t139), t140])
  let t132 = @tactics.repeat_tac(@tactics.strip_tac)
  let t142 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.stable(), comp_unless_thm1()])), t132), t141)
  comp_unity_cor9_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor9", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], STABLE(p, FPr) && UNLESS(p, q, GPr) → UNLESS(p, q, APPEND(FPr, GPr))"), t142))
}

///|
let comp_unity_cor9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor9")

///|
/// `COMP_UNITY_cor9`
pub fn comp_unity_cor9() -> @kernel.Thm {
  comp_unity_cor9_c.get()
}

///|
/// COMP_UNITY_cor10
fn step_19() -> Unit raise {
  let t145 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @tactics.repeat_tac(@tactics.strip_tac)
  let t143 = @simp.rewrite_tac(@list.List([comp_unless_thm1()]))
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t143), @tactics.eq_tac), t144), t145)
  comp_unity_cor10_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor10", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], UNLESS(p, q, APPEND(FPr, GPr)) == UNLESS(p, q, APPEND(GPr, FPr))"), t146))
}

///|
let comp_unity_cor10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor10")

///|
/// `COMP_UNITY_cor10`
pub fn comp_unity_cor10() -> @kernel.Thm {
  comp_unity_cor10_c.get()
}

///|
/// COMP_UNITY_cor11
fn step_20() -> Unit raise {
  let t149 = @simp.asm_rewrite_tac(@list.List([]))
  let t148 = @tactics.repeat_tac(@tactics.strip_tac)
  let t147 = @simp.rewrite_tac(@list.List([comp_ensures_thm1()]))
  let t150 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t147), @tactics.eq_tac), t148), t149)
  comp_unity_cor11_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor11", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], ENSURES(p, q, APPEND(FPr, GPr)) == ENSURES(p, q, APPEND(GPr, FPr))"), t150))
}

///|
let comp_unity_cor11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor11")

///|
/// `COMP_UNITY_cor11`
pub fn comp_unity_cor11() -> @kernel.Thm {
  comp_unity_cor11_c.get()
}

///|
/// COMP_UNITY_cor12_lemma00
fn step_21() -> Unit raise {
  let t151 = @term_syntax.parse_term("APPEND((Pr1 : List[(A) -> A]), (Pr2 : List[(A) -> A]))")
  let t152 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t153 = @term_syntax.parse_term("(p : (A) -> Bool)")
  comp_unity_cor12_lemma00_c.set(@equal.beta_rule(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => LEADSTO(p, q, APPEND((Pr2 : List[(A) -> A]), (Pr1 : List[(A) -> A])))"), t153, t152, t151]), @mk_leadsto.leadsto_thm37())))
}

///|
let comp_unity_cor12_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor12_lemma00")

///|
/// `COMP_UNITY_cor12_lemma00`
pub fn comp_unity_cor12_lemma00() -> @kernel.Thm {
  comp_unity_cor12_lemma00_c.get()
}

///|
/// COMP_UNITY_cor12_lemma01
fn step_22() -> Unit raise {
  let t154 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES((p' : (A) -> Bool), (q' : (A) -> Bool), APPEND((Pr1 : List[(A) -> A]), (Pr2 : List[(A) -> A])))"))
  let t155 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([comp_unity_cor11()]))(t154))
  let t157 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t155), (x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_leadsto.leadsto_thm0(), x156))
  comp_unity_cor12_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr1 : List[(A) -> A], ∀ Pr2 : List[(A) -> A], ENSURES(p', q', APPEND(Pr1, Pr2)) → LEADSTO(p', q', APPEND(Pr2, Pr1))")), t157))
}

///|
let comp_unity_cor12_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor12_lemma01")

///|
/// `COMP_UNITY_cor12_lemma01`
pub fn comp_unity_cor12_lemma01() -> @kernel.Thm {
  comp_unity_cor12_lemma01_c.get()
}

///|
/// COMP_UNITY_cor12_lemma02
fn step_23() -> Unit raise {
  let t159 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_leadsto.leadsto_thm1(), x158))
  comp_unity_cor12_lemma02_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr1 : List[(A) -> A], ∀ Pr2 : List[(A) -> A], ∀ r : (A) -> Bool, LEADSTO(p', r, APPEND(Pr1, Pr2)) && LEADSTO(p', r, APPEND(Pr2, Pr1)) && LEADSTO(r, q', APPEND(Pr1, Pr2)) && LEADSTO(r, q', APPEND(Pr2, Pr1)) → LEADSTO(p', q', APPEND(Pr2, Pr1))")), t159))
}

///|
let comp_unity_cor12_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor12_lemma02")

///|
/// `COMP_UNITY_cor12_lemma02`
pub fn comp_unity_cor12_lemma02() -> @kernel.Thm {
  comp_unity_cor12_lemma02_c.get()
}

///|
/// COMP_UNITY_cor12_lemma03
fn step_24() -> Unit raise {
  let t161 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_leadsto.leadsto_thm3a(), x160))
  comp_unity_cor12_lemma03_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr1 : List[(A) -> A], ∀ Pr2 : List[(A) -> A], ∀ P : ((A) -> Bool) -> Bool, (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(p'', q', APPEND(Pr1, Pr2))) && (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(p'', q', APPEND(Pr2, Pr1))) → LEADSTO(LUB(P), q', APPEND(Pr2, Pr1))")), t161))
}

///|
let comp_unity_cor12_lemma03_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor12_lemma03")

///|
/// `COMP_UNITY_cor12_lemma03`
pub fn comp_unity_cor12_lemma03() -> @kernel.Thm {
  comp_unity_cor12_lemma03_c.get()
}

///|
/// COMP_UNITY_cor12_lemma04
fn step_25() -> Unit raise {
  let t162 = @bool.spec_all(comp_unity_cor12_lemma00())
  comp_unity_cor12_lemma04_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([comp_unity_cor12_lemma01(), comp_unity_cor12_lemma02(), comp_unity_cor12_lemma03()]))(t162)))
}

///|
let comp_unity_cor12_lemma04_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor12_lemma04")

///|
/// `COMP_UNITY_cor12_lemma04`
pub fn comp_unity_cor12_lemma04() -> @kernel.Thm {
  comp_unity_cor12_lemma04_c.get()
}

///|
/// COMP_UNITY_cor12
fn step_26() -> Unit raise {
  let t163 = @simp.rewrite_tac(@list.List([comp_unity_cor12_lemma04()]))
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t163)
  comp_unity_cor12_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor12", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr1 : List[(A) -> A], ∀ Pr2 : List[(A) -> A], LEADSTO(p, q, APPEND(Pr1, Pr2)) == LEADSTO(p, q, APPEND(Pr2, Pr1))"), t164))
}

///|
let comp_unity_cor12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor12")

///|
/// `COMP_UNITY_cor12`
pub fn comp_unity_cor12() -> @kernel.Thm {
  comp_unity_cor12_c.get()
}

///|
/// COMP_UNITY_cor13
fn step_27() -> Unit raise {
  let t167 = @simp.asm_rewrite_tac(@list.List([]))
  let t166 = @simp.once_rewrite_tac(@list.List([comp_unity_cor10()]))
  let t165 = @simp.rewrite_tac(@list.List([@mk_unless.stable()]))
  let t168 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t165), @tactics.eq_tac), @tactics.strip_tac), t166), t167)
  comp_unity_cor13_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor13", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], STABLE(p, APPEND(FPr, GPr)) == STABLE(p, APPEND(GPr, FPr))"), t168))
}

///|
let comp_unity_cor13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor13")

///|
/// `COMP_UNITY_cor13`
pub fn comp_unity_cor13() -> @kernel.Thm {
  comp_unity_cor13_c.get()
}

///|
/// COMP_UNITY_cor14
fn step_28() -> Unit raise {
  let t171 = @simp.asm_rewrite_tac(@list.List([]))
  let t170 = @simp.once_rewrite_tac(@list.List([comp_unity_cor13()]))
  let t169 = @simp.rewrite_tac(@list.List([@mk_unless.invariant()]))
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t169), @tactics.eq_tac), @tactics.strip_tac), t170), t171)
  comp_unity_cor14_c.set(@aux_definitions.prove_thm("COMP_UNITY_cor14", @term_syntax.parse_term("∀ p0 : (A) -> Bool, ∀ p : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], INVARIANT(p, (p0, APPEND(FPr, GPr))) == INVARIANT(p, (p0, APPEND(GPr, FPr)))"), t172))
}

///|
let comp_unity_cor14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_UNITY_cor14")

///|
/// `COMP_UNITY_cor14`
pub fn comp_unity_cor14() -> @kernel.Thm {
  comp_unity_cor14_c.get()
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
}
