// Translated from upstream Unity/mk_ensures.ml; edit this file directly.

///|
/// EXIST_TRANSITION_term
fn step_1() -> Unit raise {
  exist_transition_term_c.set(@term_syntax.parse_term("(∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (EXIST_TRANSITION : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, NIL) == false) && (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, EXIST_TRANSITION(p, q, CONS((st : (A) -> A), (Pr : List[(A) -> A]))) == ((∀ s : A, p(s) && !q(s) → q(st(s))) || EXIST_TRANSITION(p, q, Pr)))"))
}

///|
let exist_transition_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("EXIST_TRANSITION_term")

///|
/// `EXIST_TRANSITION_term`
pub fn exist_transition_term() -> @kernel.Term {
  exist_transition_term_c.get()
}

///|
/// EXIST_TRANSITION
fn step_2() -> Unit raise {
  exist_transition_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(exist_transition_term()))
}

///|
let exist_transition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION")

///|
/// `EXIST_TRANSITION`
pub fn exist_transition() -> @kernel.Thm {
  exist_transition_c.get()
}

///|
/// Unity/mk_ensures.ml:32
fn step_3() -> Unit raise {
  @printer.parse_as_infix("EXIST_TRANSITION", (@mk_unless.tl_fix(), "right"))
}

///|
/// ENSURES
fn step_4() -> Unit raise {
  ensures_c.set(@aux_definitions.new_infix_definition("ENSURES", "<=>", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr) == (UNLESS(p, q, Pr) && EXIST_TRANSITION(p, q, Pr))"), @mk_unless.tl_fix()))
}

///|
let ensures_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES")

///|
/// `ENSURES`
pub fn ensures() -> @kernel.Thm {
  ensures_c.get()
}

///|
/// ENSURES_STMT
fn step_5() -> Unit raise {
  ensures_stmt_c.set(@aux_definitions.new_infix_definition("ENSURES_STMT", "<=>", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, (ENSURES_STMT : ((A) -> Bool, (A) -> Bool, (A) -> A, A) -> Bool)(p, q, st) == ((s : A) => p(s) && !q(s) → q(st(s)))"), @mk_unless.tl_fix()))
}

///|
let ensures_stmt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_STMT")

///|
/// `ENSURES_STMT`
pub fn ensures_stmt() -> @kernel.Thm {
  ensures_stmt_c.get()
}

///|
/// ENSURES_lemma0
fn step_6() -> Unit raise {
  let t2 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)"))
  let t3 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(st : (A) -> A)((s : A))"), t2))
  let t1 = @tactics.assume_tac(@aux_definitions.contrapos(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)")))))
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), t3), @hol88.res_tac), @hol88.res_tac)
  ensures_lemma0_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, p(s) && !q(s) → q(st(s))) && (∀ s : A, q(s) → r(s)) → (∀ s : A, p(s) && !r(s) → r(st(s)))")), t4))
}

///|
let ensures_lemma0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_lemma0")

///|
/// `ENSURES_lemma0`
pub fn ensures_lemma0() -> @kernel.Thm {
  ensures_lemma0_c.get()
}

///|
/// Unity/mk_ensures.ml:64
fn step_7() -> Unit raise {
  ignore(@tactics.set_goal(@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ h : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, h, s)) → (∀ s : A, UNLESS_STMT(p', q', h, s)) → (∀ s : A, p'(s) && !q'(s) → q'(h(s))) → (∀ s : A, op_slash_bslash_star(p, p', s) && !op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q'), s)) → op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q'), h((s : A)))")))
}

///|
/// ENSURES_lemma1
fn step_8() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([]))
  let t5 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t7 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_unless.unless_stmt(), @mk_state_logic.and_def(), @mk_state_logic.or_def()])), t5), t6)
  ensures_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ h : (A) -> A, (∀ s : A, UNLESS_STMT(p, q, h, s)) → (∀ s : A, UNLESS_STMT(p', q', h, s)) → (∀ s : A, p'(s) && !q'(s) → q'(h(s))) → (∀ s : A, op_slash_bslash_star(p, p', s) && !op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q'), s) → op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q'), h(s)))")), t7))
}

///|
let ensures_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_lemma1")

///|
/// `ENSURES_lemma1`
pub fn ensures_lemma1() -> @kernel.Thm {
  ensures_lemma1_c.get()
}

///|
/// ENSURES_lemma2
fn step_9() -> Unit raise {
  let t10 = @simp.asm_rewrite_tac(@list.List([]))
  let t9 = @tactics.repeat_tac(@tactics.strip_tac)
  let t8 = @equal.sym(@bool.spec_all(@theorems.disj_assoc()))
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@theorems.conj_assoc()))), t8, @class.not_clauses(), @class.de_morgan_thm()])), t9), @hol88.res_tac), t10)
  ensures_lemma2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, p(s) && !q(s) → q(st(s))) → (∀ s : A, (p(s) || r(s)) && !(q(s) || r(s)) → q(st(s)) || r(st(s)))")), t11))
}

///|
let ensures_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_lemma2")

///|
/// `ENSURES_lemma2`
pub fn ensures_lemma2() -> @kernel.Thm {
  ensures_lemma2_c.get()
}

///|
/// ENSURES_lemma3
fn step_10() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_compl_or_lemma()]))
  ensures_lemma3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, op_bslash_slash_star(q, r), Pr) → ENSURES(op_bslash_slash_star(op_slash_bslash_star(p, Not(q)), op_slash_bslash_star(p, q)), op_bslash_slash_star(q, r), Pr)")), t12))
}

///|
let ensures_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_lemma3")

///|
/// `ENSURES_lemma3`
pub fn ensures_lemma3() -> @kernel.Thm {
  ensures_lemma3_c.get()
}

///|
/// ENSURES_lemma4
fn step_11() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([]))
  let t13 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_def()]))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t13), t14)
  ensures_lemma4_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, (∀ s : A, p(s) && !q(s) → q(st(s))) → (∀ s : A, op_bslash_slash_star(p, r, s) && !op_bslash_slash_star(q, r, s) → op_bslash_slash_star(q, r, st(s)))")), t15))
}

///|
let ensures_lemma4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_lemma4")

///|
/// `ENSURES_lemma4`
pub fn ensures_lemma4() -> @kernel.Thm {
  ensures_lemma4_c.get()
}

///|
/// EXIST_TRANSITION_thm1
fn step_12() -> Unit raise {
  let t19 = @term_syntax.parse_term("(h : (A) -> A)")
  let t20 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t21 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t22 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t21, t20, t19]), ensures_lemma0())
  let t18 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)"))
  let t23 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → q((h : (A) -> A)(s))")), t18]))(t22)]))
  let t17 = @simp.asm_rewrite_tac(@list.List([]))
  let t16 = @simp.rewrite_tac(@list.List([exist_transition()]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t16), @tactics.strip_tac), @hol88.res_tac), t17), t23)
  exist_transition_thm1_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], EXIST_TRANSITION(p, q, Pr) && (∀ s : A, q(s) → r(s)) → EXIST_TRANSITION(p, r, Pr)"), t24))
}

///|
let exist_transition_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm1")

///|
/// `EXIST_TRANSITION_thm1`
pub fn exist_transition_thm1() -> @kernel.Thm {
  exist_transition_thm1_c.get()
}

///|
/// EXIST_TRANSITION_thm2
fn step_13() -> Unit raise {
  let t30 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t29 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_def1()]))
  let t31 = @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ s : A, Not((p : (A) -> Bool), s)")), t29), t30)
  let t28 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t27 = @simp.rewrite_tac(@list.List([@mk_state_logic.false_def()]))
  let t32 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !False(s) → False((h : (A) -> A)(s))")), t27), t28), t31])
  let t26 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @simp.rewrite_tac(@list.List([exist_transition(), @mk_state_logic.not_def1()]))
  let t33 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t25), @tactics.strip_tac), @hol88.res_tac), t26), t32)
  exist_transition_thm2_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], EXIST_TRANSITION(p, False, Pr) → (∀ s : A, Not(p, s))"), t33))
}

///|
let exist_transition_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm2")

///|
/// `EXIST_TRANSITION_thm2`
pub fn exist_transition_thm2() -> @kernel.Thm {
  exist_transition_thm2_c.get()
}

///|
/// EXIST_TRANSITION_thm3
fn step_14() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([exist_transition(), @mk_state_logic.false_def()]))
  let t35 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t34)
  exist_transition_thm3_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], EXIST_TRANSITION(False, p, CONS(st, Pr))"), t35))
}

///|
let exist_transition_thm3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm3")

///|
/// `EXIST_TRANSITION_thm3`
pub fn exist_transition_thm3() -> @kernel.Thm {
  exist_transition_thm3_c.get()
}

///|
/// EXIST_TRANSITION_thm4
fn step_15() -> Unit raise {
  let t38 = @term_syntax.parse_term("(h : (A) -> A)")
  let t39 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t40 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t41 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t40, t39, t38]), ensures_lemma4())
  let t42 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → q((h : (A) -> A)(s))"))]))(t41)]))
  let t37 = @simp.asm_rewrite_tac(@list.List([]))
  let t36 = @simp.rewrite_tac(@list.List([exist_transition()]))
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t36), @tactics.strip_tac), @hol88.res_tac), t37), t42)
  exist_transition_thm4_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], EXIST_TRANSITION(p, q, Pr) → EXIST_TRANSITION(op_bslash_slash_star(p, r), op_bslash_slash_star(q, r), Pr)"), t43))
}

///|
let exist_transition_thm4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm4")

///|
/// `EXIST_TRANSITION_thm4`
pub fn exist_transition_thm4() -> @kernel.Thm {
  exist_transition_thm4_c.get()
}

///|
/// APPEND_lemma01
fn step_16() -> Unit raise {
  let t44 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_rewrite_tac(@list.List([@lists.append()])))
  append_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ l : List[A], APPEND(l, NIL) == l")), t44))
}

///|
let append_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_lemma01")

///|
/// `APPEND_lemma01`
pub fn append_lemma01() -> @kernel.Thm {
  append_lemma01_c.get()
}

///|
/// EXIST_TRANSITION_thm5
fn step_17() -> Unit raise {
  let t46 = @simp.asm_rewrite_tac(@list.List([]))
  let t45 = @simp.rewrite_tac(@list.List([exist_transition()]))
  let t47 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t45), @tactics.strip_tac), t46)
  exist_transition_thm5_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ s : A, p(s) && !q(s) → q(st(s))) → EXIST_TRANSITION(p, q, CONS(st, Pr))"), t47))
}

///|
let exist_transition_thm5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm5")

///|
/// `EXIST_TRANSITION_thm5`
pub fn exist_transition_thm5() -> @kernel.Thm {
  exist_transition_thm5_c.get()
}

///|
/// APPEND_lemma02
fn step_18() -> Unit raise {
  let t48 = @simp.rewrite_tac(@list.List([@lists.append()]))
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t48)
  append_lemma02_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ st : A, ∀ l : List[A], APPEND([st], l) == CONS(st, l)")), t49))
}

///|
let append_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_lemma02")

///|
/// `APPEND_lemma02`
pub fn append_lemma02() -> @kernel.Thm {
  append_lemma02_c.get()
}

///|
/// APPEND_lemma03
fn step_19() -> Unit raise {
  let t52 = @simp.asm_rewrite_tac(@list.List([@lists.append()]))
  let t51 = @tactics.repeat_tac(@tactics.strip_tac)
  let t50 = @simp.rewrite_tac(@list.List([@lists.append()]))
  let t53 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), @lists.list_induct_tac), t50), t51), @hol88.res_tac), t52)
  append_lemma03_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ st : A, ∀ l1 : List[A], ∀ l2 : List[A], APPEND(APPEND(l1, [st]), l2) == APPEND(l1, CONS(st, l2))")), t53))
}

///|
let append_lemma03_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_lemma03")

///|
/// `APPEND_lemma03`
pub fn append_lemma03() -> @kernel.Thm {
  append_lemma03_c.get()
}

///|
/// APPEND_lemma04
fn step_20() -> Unit raise {
  let t56 = @simp.asm_rewrite_tac(@list.List([@lists.append()]))
  let t55 = @tactics.repeat_tac(@tactics.strip_tac)
  let t54 = @simp.rewrite_tac(@list.List([@lists.append()]))
  let t57 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), @lists.list_induct_tac), t54), t55), @hol88.res_tac), t56)
  append_lemma04_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ st : A, ∀ l1 : List[A], ∀ l2 : List[A], APPEND(CONS(st, l1), l2) == CONS(st, APPEND(l1, l2))")), t57))
}

///|
let append_lemma04_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_lemma04")

///|
/// `APPEND_lemma04`
pub fn append_lemma04() -> @kernel.Thm {
  append_lemma04_c.get()
}

///|
/// EXIST_TRANSITION_thm6
fn step_21() -> Unit raise {
  let t60 = @simp.asm_rewrite_tac(@list.List([]))
  let t59 = @tactics.repeat_tac(@tactics.strip_tac)
  let t58 = @simp.rewrite_tac(@list.List([exist_transition(), @lists.append()]))
  let t61 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), @lists.list_induct_tac), t58), t59), @hol88.res_tac), t60)
  exist_transition_thm6_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr1 : List[(A) -> A], ∀ Pr2 : List[(A) -> A], (∀ s : A, p(s) && !q(s) → q(st(s))) → EXIST_TRANSITION(p, q, APPEND(Pr1, CONS(st, Pr2)))"), t61))
}

///|
let exist_transition_thm6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm6")

///|
/// `EXIST_TRANSITION_thm6`
pub fn exist_transition_thm6() -> @kernel.Thm {
  exist_transition_thm6_c.get()
}

///|
/// EXIST_TRANSITION_thm7
fn step_22() -> Unit raise {
  let t64 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t63 = @tactics.repeat_tac(@tactics.strip_tac)
  let t62 = @simp.rewrite_tac(@list.List([exist_transition(), @lists.append()]))
  let t65 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), @lists.list_induct_tac), t62), t63), @hol88.res_tac), t64)
  exist_transition_thm7_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], EXIST_TRANSITION(p, q, FPr) → EXIST_TRANSITION(p, q, APPEND(FPr, GPr))"), t65))
}

///|
let exist_transition_thm7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm7")

///|
/// `EXIST_TRANSITION_thm7`
pub fn exist_transition_thm7() -> @kernel.Thm {
  exist_transition_thm7_c.get()
}

///|
/// EXIST_TRANSITION_thm8
fn step_23() -> Unit raise {
  let t73 = @kernel.assume_rule(@term_syntax.parse_term("∀ GPr : List[(A) -> A], EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), APPEND(GPr, (t : List[(A) -> A])))"))
  let t74 = @bool.specl(@list.List([@term_syntax.parse_term("APPEND((t' : List[(A) -> A]), [(h : (A) -> A)])")]), t73)
  let t75 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([append_lemma03()]))(t74)]))
  let t69 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t70 = @term_syntax.parse_term("(t' : List[(A) -> A])")
  let t71 = @term_syntax.parse_term("(h : (A) -> A)")
  let t72 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t76 = @list.List([@simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t72, t71, t70, t69]), exist_transition_thm6()))])), t75])
  let t68 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t67 = @tactics.repeat_tac(@tactics.strip_tac)
  let t66 = @simp.rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t77 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), @lists.list_induct_tac), t66), t67), @hol88.res_tac), t68), t76)
  exist_transition_thm8_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm8", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], EXIST_TRANSITION(p, q, FPr) → EXIST_TRANSITION(p, q, APPEND(GPr, FPr))"), t77))
}

///|
let exist_transition_thm8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm8")

///|
/// `EXIST_TRANSITION_thm8`
pub fn exist_transition_thm8() -> @kernel.Thm {
  exist_transition_thm8_c.get()
}

///|
/// EXIST_TRANSITION_thm9
fn step_24() -> Unit raise {
  let t80 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t79 = @tactics.repeat_tac(@tactics.strip_tac)
  let t78 = @simp.rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t81 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t78), t79), @hol88.res_tac), t80)
  exist_transition_thm9_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm9", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], EXIST_TRANSITION(p, q, APPEND(FPr, GPr)) → EXIST_TRANSITION(p, q, APPEND(FPr, CONS(st, GPr)))"), t81))
}

///|
let exist_transition_thm9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm9")

///|
/// `EXIST_TRANSITION_thm9`
pub fn exist_transition_thm9() -> @kernel.Thm {
  exist_transition_thm9_c.get()
}

///|
/// EXIST_TRANSITION_thm10
fn step_25() -> Unit raise {
  let t83 = @simp.asm_rewrite_tac(@list.List([]))
  let t82 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), @lists.append(), exist_transition()]))
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t82), @tactics.strip_tac), t83)
  exist_transition_thm10_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm10", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], EXIST_TRANSITION(p, q, Pr) → EXIST_TRANSITION(p, q, CONS(st, Pr))"), t84))
}

///|
let exist_transition_thm10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm10")

///|
/// `EXIST_TRANSITION_thm10`
pub fn exist_transition_thm10() -> @kernel.Thm {
  exist_transition_thm10_c.get()
}

///|
/// EXIST_TRANSITION_thm11
fn step_26() -> Unit raise {
  let t95 = @simp.asm_rewrite_tac(@list.List([]))
  let t94 = @kernel.assume_rule(@term_syntax.parse_term("EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), APPEND([(st : (A) -> A)], (t : List[(A) -> A])))"))
  let t96 = @tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([append_lemma02(), exist_transition()]))(t94)), t95)
  let t90 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t91 = @term_syntax.parse_term("(st : (A) -> A)")
  let t92 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t93 = @simp.asm_rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t92, t91, t90]), exist_transition_thm10()))]))
  let t89 = @equal.sym(@kernel.assume_rule(@term_syntax.parse_term("EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), APPEND([(st : (A) -> A)], (t : List[(A) -> A]))) == EXIST_TRANSITION(p, q, APPEND(t, [st]))")))
  let t97 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([append_lemma02()]))(t89)])), t93)
  let t88 = @simp.asm_rewrite_tac(@list.List([exist_transition()]))
  let t87 = @equal.sym(@kernel.assume_rule(@term_syntax.parse_term("EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), APPEND([(st : (A) -> A)], (t : List[(A) -> A]))) == EXIST_TRANSITION(p, q, APPEND(t, [st]))")))
  let t98 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([append_lemma02()]))(t87)])), t88), t97, t96])
  let t86 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), @lists.append(), exist_transition()]))
  let t85 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), @lists.append(), exist_transition()]))
  let t99 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t85), @tactics.eq_tac), @tactics.strip_tac), @hol88.res_tac), t86), t98)
  exist_transition_thm11_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm11", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], EXIST_TRANSITION(p, q, APPEND([st], Pr)) == EXIST_TRANSITION(p, q, APPEND(Pr, [st]))"), t99))
}

///|
let exist_transition_thm11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm11")

///|
/// `EXIST_TRANSITION_thm11`
pub fn exist_transition_thm11() -> @kernel.Thm {
  exist_transition_thm11_c.get()
}

///|
/// EXIST_TRANSITION_thm12a
fn step_27() -> Unit raise {
  let t107 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t108 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t109 = @term_syntax.parse_term("(h : (A) -> A)")
  let t110 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t111 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t110, t109, t108, t107]), exist_transition_thm9()))]))
  let t103 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t104 = @term_syntax.parse_term("(GPr : List[(A) -> A])")
  let t105 = @term_syntax.parse_term("(h : (A) -> A)")
  let t106 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t112 = @list.List([@simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t106, t105, t104, t103]), exist_transition_thm6()))])), t111])
  let t102 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t101 = @tactics.repeat_tac(@tactics.strip_tac)
  let t100 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), @lists.append(), exist_transition()]))
  let t113 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t100), t101), @hol88.res_tac), t102), t112)
  exist_transition_thm12a_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm12a", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], EXIST_TRANSITION(p, q, APPEND(FPr, GPr)) → EXIST_TRANSITION(p, q, APPEND(GPr, FPr))"), t113))
}

///|
let exist_transition_thm12a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm12a")

///|
/// `EXIST_TRANSITION_thm12a`
pub fn exist_transition_thm12a() -> @kernel.Thm {
  exist_transition_thm12a_c.get()
}

///|
/// EXIST_TRANSITION_thm12b
fn step_28() -> Unit raise {
  let t121 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t122 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t123 = @term_syntax.parse_term("(h : (A) -> A)")
  let t124 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t125 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t124, t123, t122, t121]), exist_transition_thm9()))]))
  let t117 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t118 = @term_syntax.parse_term("(FPr : List[(A) -> A])")
  let t119 = @term_syntax.parse_term("(h : (A) -> A)")
  let t120 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t126 = @list.List([@simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t120, t119, t118, t117]), exist_transition_thm6()))])), t125])
  let t116 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), exist_transition(), @lists.append()]))
  let t115 = @tactics.repeat_tac(@tactics.strip_tac)
  let t114 = @simp.asm_rewrite_tac(@list.List([append_lemma01(), @lists.append(), exist_transition()]))
  let t127 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t114), t115), @hol88.res_tac), t116), t126)
  exist_transition_thm12b_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm12b", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], EXIST_TRANSITION(p, q, APPEND(GPr, FPr)) → EXIST_TRANSITION(p, q, APPEND(FPr, GPr))"), t127))
}

///|
let exist_transition_thm12b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm12b")

///|
/// `EXIST_TRANSITION_thm12b`
pub fn exist_transition_thm12b() -> @kernel.Thm {
  exist_transition_thm12b_c.get()
}

///|
/// EXIST_TRANSITION_thm12
fn step_29() -> Unit raise {
  let t129 = @bool.undisch_all(@bool.spec_all(exist_transition_thm12b()))
  let t130 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.spec_all(exist_transition_thm12a())), t129]))
  let t128 = @tactics.repeat_tac(@tactics.strip_tac)
  let t131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t128), @hol88.res_tac), t130)
  exist_transition_thm12_c.set(@aux_definitions.prove_thm("EXIST_TRANSITION_thm12", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ FPr : List[(A) -> A], ∀ GPr : List[(A) -> A], EXIST_TRANSITION(p, q, APPEND(GPr, FPr)) == EXIST_TRANSITION(p, q, APPEND(FPr, GPr))"), t131))
}

///|
let exist_transition_thm12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXIST_TRANSITION_thm12")

///|
/// `EXIST_TRANSITION_thm12`
pub fn exist_transition_thm12() -> @kernel.Thm {
  exist_transition_thm12_c.get()
}

///|
/// ENSURES_thm0
fn step_30() -> Unit raise {
  let t132 = @simp.rewrite_tac(@list.List([@mk_unless.unless(), exist_transition()]))
  let t133 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ensures()])), @tactics.strip_tac), t132)
  ensures_thm0_c.set(@aux_definitions.prove_thm("ENSURES_thm0", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, q, NIL) == false"), t133))
}

///|
let ensures_thm0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_thm0")

///|
/// `ENSURES_thm0`
pub fn ensures_thm0() -> @kernel.Thm {
  ensures_thm0_c.get()
}

///|
/// ENSURES_thm1
fn step_31() -> Unit raise {
  let t137 = @simp.rewrite_tac(@list.List([@hol88.not_and(), @theorems.imp_clauses()]))
  let t136 = @simp.rewrite_tac(@list.List([@equal.beta_conv(@term_syntax.parse_term("((s : A) => (p : (A) -> Bool)(s) && !p(s) → p((st : (A) -> A)(s)))((s : A))"))]))
  let t135 = @simp.rewrite_tac(@list.List([@mk_unless.unless_thm1(), @mk_unless.unless_stmt()]))
  let t134 = @simp.rewrite_tac(@list.List([@mk_unless.unless(), exist_transition()]))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ensures()])), @tactics.strip_tac), t134), t135), t136), t137)
  ensures_thm1_c.set(@aux_definitions.prove_thm("ENSURES_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(p, p, CONS(st, Pr))"), t138))
}

///|
let ensures_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_thm1")

///|
/// `ENSURES_thm1`
pub fn ensures_thm1() -> @kernel.Thm {
  ensures_thm1_c.get()
}

///|
/// ENSURES_thm2
fn step_32() -> Unit raise {
  let t143 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.spec_all(exist_transition_thm1())))
  let t142 = @bool.spec(@term_syntax.parse_term("EXIST_TRANSITION((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"), @hol88.and_intro_thm())
  let t144 = @tactics.then_tac(@tactics.assume_tac(@bool.undisch_all(@bool.spec(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)"), t142))), t143)
  let t141 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.spec_all(@mk_unless.unless_thm3())))
  let t140 = @bool.spec(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"), @hol88.and_intro_thm())
  let t145 = @list.List([@tactics.then_tac(@tactics.assume_tac(@bool.undisch_all(@bool.spec(@term_syntax.parse_term("∀ s : A, (q : (A) -> Bool)(s) → (r : (A) -> Bool)(s)"), t140))), t141), t144])
  let t139 = @tactics.repeat_tac(@tactics.strip_tac)
  let t146 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([ensures()])), t139), t145)
  ensures_thm2_c.set(@aux_definitions.prove_thm("ENSURES_thm2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) && (∀ s : A, q(s) → r(s)) → ENSURES(p, r, Pr)"), t146))
}

///|
let ensures_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_thm2")

///|
/// `ENSURES_thm2`
pub fn ensures_thm2() -> @kernel.Thm {
  ensures_thm2_c.get()
}

///|
/// ENSURES_thm3
fn step_33() -> Unit raise {
  let t150 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t149 = @simp.rewrite_tac(@list.List([@mk_state_logic.false_def(), @mk_state_logic.not_def1()]))
  let t152 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !False(s) → False((h : (A) -> A)(s))")), t149), t150), (x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(exist_transition_thm2(), x151)])
  let t148 = @simp.asm_rewrite_tac(@list.List([]))
  let t147 = @simp.asm_rewrite_tac(@list.List([ensures(), @mk_unless.unless(), exist_transition()]))
  let t153 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t147), @tactics.strip_tac), t148), t152)
  ensures_thm3_c.set(@aux_definitions.prove_thm("ENSURES_thm3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, False, Pr) → (∀ s : A, Not(p, s))"), t153))
}

///|
let ensures_thm3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_thm3")

///|
/// `ENSURES_thm3`
pub fn ensures_thm3() -> @kernel.Thm {
  ensures_thm3_c.get()
}

///|
/// ENSURES_thm4
fn step_34() -> Unit raise {
  let t181 = @simp.asm_rewrite_tac(@list.List([]))
  let t180 = @simp.asm_rewrite_tac(@list.List([ensures()]))
  let t182 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (t : List[(A) -> A])) && ENSURES((p' : (A) -> Bool), (q' : (A) -> Bool), t) → ENSURES(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q')), t)")), t180), @tactics.strip_tac), t181)
  let t179 = @simp.asm_rewrite_tac(@list.List([]))
  let t178 = @simp.asm_rewrite_tac(@list.List([ensures()]))
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (t : List[(A) -> A])) && ENSURES((p' : (A) -> Bool), (q' : (A) -> Bool), t) → ENSURES(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q')), t)")), t178), @tactics.strip_tac), t179)
  let t173 = @term_syntax.parse_term("(h : (A) -> A)")
  let t174 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t175 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t176 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t177 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t176, t175, t174, t173]), @mk_unless.unless_stmt_thm3())
  let t172 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, UNLESS_STMT((p' : (A) -> Bool), (q' : (A) -> Bool), (h : (A) -> A), s)"))
  let t184 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, UNLESS_STMT((p : (A) -> Bool), (q : (A) -> Bool), (h : (A) -> A), s)")), t172]))(t177)]))
  let t171 = @bool.spec_all(ensures_lemma1())
  let t169 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p' : (A) -> Bool)(s) && !(q' : (A) -> Bool)(s) → q'((h : (A) -> A)(s))"))
  let t170 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, UNLESS_STMT((p' : (A) -> Bool), (q' : (A) -> Bool), (h : (A) -> A), s)"))
  let t185 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, UNLESS_STMT((p : (A) -> Bool), (q : (A) -> Bool), (h : (A) -> A), s)")), t170, t169]))(t171)]))
  let t164 = @term_syntax.parse_term("(t : List[(A) -> A])")
  let t165 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t166 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t167 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t168 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t167, t166, t165, t164]), @mk_unless.unless_thm4())
  let t163 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((p' : (A) -> Bool), (q' : (A) -> Bool), (t : List[(A) -> A]))"))
  let t186 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (q : (A) -> Bool), (t : List[(A) -> A]))")), t163]))(t168)]))
  let t158 = @term_syntax.parse_term("(h : (A) -> A)")
  let t159 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t160 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t161 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t162 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t161, t160, t159, t158]), @mk_unless.unless_stmt_thm3())
  let t157 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, UNLESS_STMT((p' : (A) -> Bool), (q' : (A) -> Bool), (h : (A) -> A), s)"))
  let t187 = @list.List([@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, UNLESS_STMT((p : (A) -> Bool), (q : (A) -> Bool), (h : (A) -> A), s)")), t157]))(t162)])), t186, t185, t184, t183, t182])
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t155 = @tactics.repeat_tac(@tactics.strip_tac)
  let t154 = @simp.rewrite_tac(@list.List([ensures(), @mk_unless.unless(), exist_transition()]))
  let t188 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t154), t155), t156), t187)
  ensures_thm4_c.set(@aux_definitions.prove_thm("ENSURES_thm4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ Pr : List[(A) -> A], UNLESS(p, q, Pr) && ENSURES(p', q', Pr) → ENSURES(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q')), Pr)"), t188))
}

///|
let ensures_thm4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_thm4")

///|
/// `ENSURES_thm4`
pub fn ensures_thm4() -> @kernel.Thm {
  ensures_thm4_c.get()
}

///|
/// ENSURES_thm5
fn step_35() -> Unit raise {
  let t201 = @tactics.then_tac((x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(exist_transition_thm4(), x200), @simp.asm_rewrite_tac(@list.List([])))
  let t202 = @tactics.then_tac((x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_unless.unless_cor23(), x199), @simp.asm_rewrite_tac(@list.List([])))
  let t203 = @tactics.then_tac((x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_unless.unless_stmt_thm6(), x198), @simp.asm_rewrite_tac(@list.List([])))
  let t194 = @term_syntax.parse_term("(h : (A) -> A)")
  let t195 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t196 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t197 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t196, t195, t194]), ensures_lemma4())
  let t204 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) && !(q : (A) -> Bool)(s) → q((h : (A) -> A)(s))"))]))(t197)]))
  let t205 = @tactics.then_tac((x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_unless.unless_cor23(), x193), @simp.asm_rewrite_tac(@list.List([])))
  let t206 = @list.List([@tactics.then_tac((x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_unless.unless_stmt_thm6(), x192), @simp.asm_rewrite_tac(@list.List([]))), t205, t204, t203, t202, t201])
  let t191 = @simp.asm_rewrite_tac(@list.List([]))
  let t190 = @tactics.repeat_tac(@tactics.strip_tac)
  let t189 = @simp.rewrite_tac(@list.List([ensures(), @mk_unless.unless(), exist_transition()]))
  let t207 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t189), t190), t191), t206)
  ensures_thm5_c.set(@aux_definitions.prove_thm("ENSURES_thm5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → ENSURES(op_bslash_slash_star(p, r), op_bslash_slash_star(q, r), Pr)"), t207))
}

///|
let ensures_thm5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_thm5")

///|
/// `ENSURES_thm5`
pub fn ensures_thm5() -> @kernel.Thm {
  ensures_thm5_c.get()
}

///|
/// ENSURES_cor1
fn step_36() -> Unit raise {
  let t211 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t212 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t213 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t214 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t213, t212, t211]), ensures_thm2())))
  let t209 = @term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) → (q : (A) -> Bool)(s)")
  let t210 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("ENSURES((p : (A) -> Bool), p, CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t209]), @hol88.and_intro_thm())))
  let t208 = @tactics.assume_tac(@bool.spec_all(ensures_thm1()))
  let t215 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t208), t210), t214)
  ensures_cor1_c.set(@aux_definitions.prove_thm("ENSURES_cor1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ s : A, p(s) → q(s)) → ENSURES(p, q, CONS(st, Pr))"), t215))
}

///|
let ensures_cor1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor1")

///|
/// `ENSURES_cor1`
pub fn ensures_cor1() -> @kernel.Thm {
  ensures_cor1_c.get()
}

///|
/// ENSURES_cor2
fn step_37() -> Unit raise {
  let t216 = @tactics.repeat_tac(@tactics.strip_tac)
  let t217 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ensures()])), t216)
  ensures_cor2_c.set(@aux_definitions.prove_thm("ENSURES_cor2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → UNLESS(p, q, Pr)"), t217))
}

///|
let ensures_cor2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor2")

///|
/// `ENSURES_cor2`
pub fn ensures_cor2() -> @kernel.Thm {
  ensures_cor2_c.get()
}

///|
/// ENSURES_cor3
fn step_38() -> Unit raise {
  let t244 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t245 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t246 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star(op_bslash_slash_star(p, (q : (A) -> Bool)), op_bslash_slash_star(q, r)), r))")
  let t247 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t246, t245, t244]), ensures_thm2())))
  let t242 = @term_syntax.parse_term("∀ s : A, op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star(op_bslash_slash_star(p, (q : (A) -> Bool)), op_bslash_slash_star(q, r)), r), s) → op_bslash_slash_star(q, r, s)")
  let t243 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("ENSURES((p : (A) -> Bool), op_bslash_slash_star(op_slash_bslash_star(p, (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star(op_bslash_slash_star(p, (q : (A) -> Bool)), op_bslash_slash_star(q, r)), r)), (Pr : List[(A) -> A]))"), t242]), @hol88.and_intro_thm())))
  let t239 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t240 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t241 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t240, t239]), @mk_state_logic.imply_weak_lemma5()))
  let t238 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_or_eq_lemma()]))
  let t237 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_or_eq_and_comm_or_lemma()]))
  let t235 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t236 = @simp.pure_once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))"), t235]), @mk_state_logic.and_comm_lemma())]))
  let t234 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_assoc_lemma(), @mk_state_logic.and_assoc_lemma()]))
  let t233 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_or_eq_lemma()]))
  let t232 = @tactics.undisch_tac(@term_syntax.parse_term("ENSURES(op_slash_bslash_star((p : (A) -> Bool), op_bslash_slash_star(p, (q : (A) -> Bool))), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, (r : (A) -> Bool)), op_slash_bslash_star(op_bslash_slash_star(p, q), op_bslash_slash_star(q, r))), op_slash_bslash_star(op_bslash_slash_star(q, r), r)), (Pr : List[(A) -> A]))"))
  let t227 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t228 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t229 = @term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t230 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t231 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t230, t229, t228, t227]), ensures_thm4())))
  let t225 = @term_syntax.parse_term("ENSURES(op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool), (Pr : List[(A) -> A]))")
  let t226 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool)), (Pr : List[(A) -> A]))"), t225]), @hol88.and_intro_thm())))
  let t221 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t222 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t223 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t224 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t223, t222, t221]), @mk_unless.unless_cor4())))
  let t218 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t219 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t220 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t219, t218]), ensures_cor2())))
  let t248 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t220), t224), t226), t231), t232), t233), t234), t236), t237), t238), @tactics.disch_tac), t241), t243), t247)
  ensures_cor3_c.set(@aux_definitions.prove_thm("ENSURES_cor3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(op_bslash_slash_star(p, q), r, Pr) → ENSURES(p, op_bslash_slash_star(q, r), Pr)"), t248))
}

///|
let ensures_cor3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor3")

///|
/// `ENSURES_cor3`
pub fn ensures_cor3() -> @kernel.Thm {
  ensures_cor3_c.get()
}

///|
/// ENSURES_cor4
fn step_39() -> Unit raise {
  let t256 = @simp.rewrite_tac(@list.List([@mk_state_logic.p_and_q_or_q_lemma()]))
  let t255 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@mk_state_logic.or_assoc_lemma())))]))
  let t254 = @tactics.undisch_tac(@term_syntax.parse_term("ENSURES(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_bslash_slash_star(op_slash_bslash_star(p, q), op_bslash_slash_star(q, (r : (A) -> Bool))), (Pr : List[(A) -> A]))"))
  let t250 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t251 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t252 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t253 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool)))"), t252, t251, t250]), ensures_cor3())))
  let t249 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(ensures_lemma3())))
  let t257 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t249), t253), t254), t255), t256)
  ensures_cor4_c.set(@aux_definitions.prove_thm("ENSURES_cor4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, op_bslash_slash_star(q, r), Pr) → ENSURES(op_slash_bslash_star(p, Not(q)), op_bslash_slash_star(q, r), Pr)"), t257))
}

///|
let ensures_cor4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor4")

///|
/// `ENSURES_cor4`
pub fn ensures_cor4() -> @kernel.Thm {
  ensures_cor4_c.get()
}

///|
/// ENSURES_cor5
fn step_40() -> Unit raise {
  let t260 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t261 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t262 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t261, t260]), ensures_thm2()))
  let t258 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t259 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : (A) -> Bool)"), t258]), @mk_state_logic.imply_weak_lemma_b()))
  let t263 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t259), t262), @hol88.res_tac)
  ensures_cor5_c.set(@aux_definitions.prove_thm("ENSURES_cor5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → ENSURES(p, op_bslash_slash_star(q, r), Pr)"), t263))
}

///|
let ensures_cor5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor5")

///|
/// `ENSURES_cor5`
pub fn ensures_cor5() -> @kernel.Thm {
  ensures_cor5_c.get()
}

///|
/// ENSURES_cor6
fn step_41() -> Unit raise {
  let t264 = @simp.rewrite_tac(@list.List([ensures(), @mk_unless.unless_cor7(), exist_transition_thm3()]))
  ensures_cor6_c.set(@aux_definitions.prove_thm("ENSURES_cor6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(False, p, CONS(st, Pr))"), t264))
}

///|
let ensures_cor6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor6")

///|
/// `ENSURES_cor6`
pub fn ensures_cor6() -> @kernel.Thm {
  ensures_cor6_c.get()
}

///|
/// ENSURES_cor7
fn step_42() -> Unit raise {
  let t267 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t268 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t269 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t270 = @term_syntax.parse_term("(False : (A) -> Bool)")
  let t271 = @bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t270, t269, t268, t267]), ensures_thm4())
  let t272 = @simp.rewrite_rule(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.or_false_lemma()]))(t271)
  let t273 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_and_comm_lemma()]))(t272)
  let t274 = @simp.rewrite_rule(@list.List([@mk_state_logic.and_false_lemma(), @mk_state_logic.or_false_lemma()]))(t273)
  let t275 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.and_comm_lemma()]))(t274)
  let t266 = @tactics.repeat_tac(@tactics.strip_tac)
  let t265 = @simp.rewrite_tac(@list.List([@mk_unless.stable()]))
  let t277 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t265), t266), (x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t275, x276))
  ensures_cor7_c.set(@aux_definitions.prove_thm("ENSURES_cor7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) && STABLE(r, Pr) → ENSURES(op_slash_bslash_star(p, r), op_slash_bslash_star(q, r), Pr)"), t277))
}

///|
let ensures_cor7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ENSURES_cor7")

///|
/// `ENSURES_cor7`
pub fn ensures_cor7() -> @kernel.Thm {
  ensures_cor7_c.get()
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
}
