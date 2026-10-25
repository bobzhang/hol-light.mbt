// Translated from upstream Unity/mk_leadsto.ml; edit this file directly.

///|
/// LUB
fn step_1() -> Unit raise {
  lub_c.set(@pair.new_definition(@term_syntax.parse_term("(LUB : (((A) -> Bool) -> Bool, A) -> Bool)((P : ((A) -> Bool) -> Bool)) == ((s : A) => ∃ p : (A) -> Bool, P(p) && p(s))")))
}

///|
let lub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LUB")

///|
/// `LUB`
pub fn lub() -> @kernel.Thm {
  lub_c.get()
}

///|
/// IN
fn step_2() -> Unit raise {
  in__c.set(@aux_definitions.new_infix_definition("In", "<=>", @term_syntax.parse_term("(In : ((A) -> Bool, ((A) -> Bool) -> Bool) -> Bool)((p : (A) -> Bool), (P : ((A) -> Bool) -> Bool)) == P(p)"), @mk_unless.tl_fix()))
}

///|
let in__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN")

///|
/// `IN`
pub fn in_() -> @kernel.Thm {
  in__c.get()
}

///|
/// LeadstoRel
fn step_3() -> Unit raise {
  leadstorel_c.set(@pair.new_definition(@term_syntax.parse_term("(LeadstoRel : (((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, List[(A) -> A]) -> Bool)((R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool), (Pr : List[(A) -> A])) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → R(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr)) → R(p, q, Pr)))")))
}

///|
let leadstorel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LeadstoRel")

///|
/// `LeadstoRel`
pub fn leadstorel() -> @kernel.Thm {
  leadstorel_c.get()
}

///|
/// LEADSTO
fn step_4() -> Unit raise {
  leadsto_c.set(@aux_definitions.new_infix_definition("LEADSTO", "<=>", @term_syntax.parse_term("(LEADSTO : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A])) == (∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, LeadstoRel(R, Pr) → R(p, q, Pr))"), @mk_unless.tl_fix()))
}

///|
let leadsto_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO")

///|
/// `LEADSTO`
pub fn leadsto() -> @kernel.Thm {
  leadsto_c.get()
}

///|
/// LEADSTO_thm0
fn step_5() -> Unit raise {
  let t1 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto(), leadstorel()])), t1), @hol88.res_tac)
  leadsto_thm0_c.set(@aux_definitions.prove_thm("LEADSTO_thm0", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → LEADSTO(p, q, Pr)"), t2))
}

///|
let leadsto_thm0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm0")

///|
/// `LEADSTO_thm0`
pub fn leadsto_thm0() -> @kernel.Thm {
  leadsto_thm0_c.get()
}

///|
/// LEADSTO_thm1
fn step_6() -> Unit raise {
  let t3 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto(), leadstorel()])), t3), @hol88.res_tac), @hol88.res_tac)
  leadsto_thm1_c.set(@aux_definitions.prove_thm("LEADSTO_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) → LEADSTO(p, q, Pr)"), t4))
}

///|
let leadsto_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm1")

///|
/// `LEADSTO_thm1`
pub fn leadsto_thm1() -> @kernel.Thm {
  leadsto_thm1_c.get()
}

///|
/// LEADSTO_thm2
fn step_7() -> Unit raise {
  let t5 = @tactics.repeat_tac(@tactics.strip_tac)
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto(), leadstorel()])), t5), @hol88.res_tac), @hol88.res_tac)
  leadsto_thm2_c.set(@aux_definitions.prove_thm("LEADSTO_thm2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) → LEADSTO(p, q, Pr)"), t6))
}

///|
let leadsto_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm2")

///|
/// `LEADSTO_thm2`
pub fn leadsto_thm2() -> @kernel.Thm {
  leadsto_thm2_c.get()
}

///|
/// LEADSTO_thm2a
fn step_8() -> Unit raise {
  let t7 = @tactics.repeat_tac(@tactics.strip_tac)
  let t8 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto(), leadstorel()])), t7), @hol88.res_tac), @hol88.res_tac)
  leadsto_thm2a_c.set(@aux_definitions.prove_thm("LEADSTO_thm2a", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && ENSURES(r, q, Pr) → LEADSTO(p, q, Pr)"), t8))
}

///|
let leadsto_thm2a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm2a")

///|
/// `LEADSTO_thm2a`
pub fn leadsto_thm2a() -> @kernel.Thm {
  leadsto_thm2a_c.get()
}

///|
/// LEADSTO_thm3_lemma01
fn step_9() -> Unit raise {
  let t9 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto_thm3_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → R(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(p, q, Pr))) → R(p, (q : (A) -> Bool), Pr))) → (∀ p : (A) -> Bool, In(p, P) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(p, q, Pr))) → R(p, q, Pr))")), t9))
}

///|
let leadsto_thm3_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3_lemma01")

///|
/// `LEADSTO_thm3_lemma01`
pub fn leadsto_thm3_lemma01() -> @kernel.Thm {
  leadsto_thm3_lemma01_c.get()
}

///|
/// LEADSTO_thm3
fn step_10() -> Unit raise {
  let t12 = @bool.spec_all(@bool.undisch(@bool.spec_all(leadsto_thm3_lemma01())))
  let t13 = @tactics.assume_tac(@bool.gen_all(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(p, q, Pr))"))]))(t12)))
  let t11 = @tactics.repeat_tac(@tactics.strip_tac)
  let t10 = @simp.rewrite_tac(@list.List([leadsto(), leadstorel()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t10), t11), t13), @hol88.res_tac)
  leadsto_thm3_c.set(@aux_definitions.prove_thm("LEADSTO_thm3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) → LEADSTO(p, q, Pr)"), t14))
}

///|
let leadsto_thm3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3")

///|
/// `LEADSTO_thm3`
pub fn leadsto_thm3() -> @kernel.Thm {
  leadsto_thm3_c.get()
}

///|
/// LEADSTO_thm3a
fn step_11() -> Unit raise {
  let t15 = @term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)")
  let t16 = @bool.specl(@list.List([@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t15]), leadsto_thm3())
  let t17 = @tactics.accept_tac(@bool.spec_all(@simp.rewrite_rule(@list.List([]))(t16)))
  let t18 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t17)
  leadsto_thm3a_c.set(@aux_definitions.prove_thm("LEADSTO_thm3a", @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) → LEADSTO(LUB(P), q, Pr)"), t18))
}

///|
let leadsto_thm3a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3a")

///|
/// `LEADSTO_thm3a`
pub fn leadsto_thm3a() -> @kernel.Thm {
  leadsto_thm3a_c.get()
}

///|
/// LEADSTO_thm3c_lemma01
fn step_12() -> Unit raise {
  let t19 = @simp.rewrite_tac(@list.List([]))
  let t20 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([in_()])), @tactics.beta_tac), t19)
  leadsto_thm3c_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (p : (A) -> Bool) => ∃ i : Num, p == (P : (Num, A) -> Bool)(i)) == (∃ i : Num, p == P(i))")), t20))
}

///|
let leadsto_thm3c_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3c_lemma01")

///|
/// `LEADSTO_thm3c_lemma01`
pub fn leadsto_thm3c_lemma01() -> @kernel.Thm {
  leadsto_thm3c_lemma01_c.get()
}

///|
/// LEADSTO_thm3c_lemma02
fn step_13() -> Unit raise {
  let t22 = @bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ i' : Num, (P : (Num, A) -> Bool)((i : Num)) == P(i') → (q : Bool)")))
  let t23 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(P : (Num, A) -> Bool)((i : Num)) == P((i' : Num))")))]))(t22))
  let t24 = @list.List([@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("∃ i' : Num, (P : (Num, A) -> Bool)((i : Num)) == P(i')")), @hol88.res_tac), t23])
  let t21 = @tactics.repeat_tac(@tactics.strip_tac)
  let t25 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t21), t24)
  leadsto_thm3c_lemma02_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : Bool, ∀ i : Num, ((∃ i' : Num, P(i) == P(i')) → q) == (∀ i' : Num, P(i) == P(i') → q)")), t25))
}

///|
let leadsto_thm3c_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3c_lemma02")

///|
/// `LEADSTO_thm3c_lemma02`
pub fn leadsto_thm3c_lemma02() -> @kernel.Thm {
  leadsto_thm3c_lemma02_c.get()
}

///|
/// LEADSTO_thm3c_lemma03
fn step_14() -> Unit raise {
  let t30 = @simp.asm_rewrite_tac(@list.List([]))
  let t26 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, (∃ i : Num, p == (P : (Num, A) -> Bool)(i)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t27 = @bool.spec(@term_syntax.parse_term("(P : (Num, A) -> Bool)((i : Num))"), t26)
  let t28 = @simp.rewrite_rule(@list.List([leadsto_thm3c_lemma02()]))(t27)
  let t29 = @bool.spec(@term_syntax.parse_term("(i : Num)"), t28)
  let t31 = @list.List([@tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t29)), t30])
  let t32 = @tactics.thenl(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), t31)
  leadsto_thm3c_lemma03_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, (∃ i : Num, p == (P : (Num, A) -> Bool)(i)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))) == (∀ i : Num, LEADSTO(P(i), q, Pr))")), t32))
}

///|
let leadsto_thm3c_lemma03_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3c_lemma03")

///|
/// `LEADSTO_thm3c_lemma03`
pub fn leadsto_thm3c_lemma03() -> @kernel.Thm {
  leadsto_thm3c_lemma03_c.get()
}

///|
/// LEADSTO_thm3c_lemma04
fn step_15() -> Unit raise {
  let t37 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t38 = @tactics.accept_tac(@simp.once_rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (P : (Num, A) -> Bool)((i : Num))"))]))(t37))
  let t39 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i : Num)")), t38)
  let t36 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(P : (Num, A) -> Bool)((x : Num))")), t35), t36), @tactics.refl_tac), t39])
  let t34 = @tactics.repeat_tac(@tactics.strip_tac)
  let t33 = @simp.rewrite_tac(@list.List([@mk_state_logic.exists_def(), lub()]))
  let t41 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t33), @tactics.beta_tac), @tactics.eq_tac), t34), t40)
  leadsto_thm3c_lemma04_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ s : A, op_q_star((P : (Num, A) -> Bool), s) == LUB((p : (A) -> Bool) => ∃ i : Num, p == P(i), s)")), t41))
}

///|
let leadsto_thm3c_lemma04_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3c_lemma04")

///|
/// `LEADSTO_thm3c_lemma04`
pub fn leadsto_thm3c_lemma04() -> @kernel.Thm {
  leadsto_thm3c_lemma04_c.get()
}

///|
/// LEADSTO_thm3c
fn step_16() -> Unit raise {
  let t45 = @hol88.mk_abs(leadsto_thm3c_lemma04())
  let t46 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t45)]))
  let t42 = @bool.ispec(@term_syntax.parse_term("(p : (A) -> Bool) => ∃ i : Num, p == (P : (Num, A) -> Bool)(i)"), leadsto_thm3a())
  let t43 = @simp.rewrite_rule(@list.List([leadsto_thm3c_lemma01()]))(t42)
  let t44 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm3c_lemma03()]))(t43))
  let t47 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t44), @hol88.res_tac), t46)
  leadsto_thm3c_c.set(@aux_definitions.prove_thm("LEADSTO_thm3c", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ i : Num, LEADSTO(P(i), q, Pr)) → LEADSTO(op_q_star(P), q, Pr)"), t47))
}

///|
let leadsto_thm3c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm3c")

///|
/// `LEADSTO_thm3c`
pub fn leadsto_thm3c() -> @kernel.Thm {
  leadsto_thm3c_c.get()
}

///|
/// LEADSTO_thm4_lemma1a
fn step_17() -> Unit raise {
  let t53 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t54 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p2 : (A) -> Bool)"))]))(t53)]))
  let t52 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t55 = @tactics.thenl(@tactics.strip_tac, @list.List([@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p1 : (A) -> Bool)"))]))(t52)])), t54]))
  let t50 = @simp.asm_rewrite_tac(@list.List([]))
  let t51 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p2 : (A) -> Bool)")), t50)
  let t49 = @simp.asm_rewrite_tac(@list.List([]))
  let t56 = @list.List([@tactics.thenl(@tactics.strip_tac, @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p1 : (A) -> Bool)")), t49), t51])), t55])
  let t48 = @simp.rewrite_tac(@list.List([lub(), @mk_state_logic.or_def()]))
  let t57 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t48), @tactics.beta_tac), @tactics.eq_tac), t56)
  leadsto_thm4_lemma1a_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ s : A, op_bslash_slash_star(p1, p2, s) == LUB((p : (A) -> Bool) => p == p1 || p == p2, s)")), t57))
}

///|
let leadsto_thm4_lemma1a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm4_lemma1a")

///|
/// `LEADSTO_thm4_lemma1a`
pub fn leadsto_thm4_lemma1a() -> @kernel.Thm {
  leadsto_thm4_lemma1a_c.get()
}

///|
/// LEADSTO_thm4_lemma1
fn step_18() -> Unit raise {
  let t58 = @bool.spec_all(leadsto_thm4_lemma1a())
  let t59 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(s : A)"), t58))
  leadsto_thm4_lemma1_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t59)))
}

///|
let leadsto_thm4_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm4_lemma1")

///|
/// `LEADSTO_thm4_lemma1`
pub fn leadsto_thm4_lemma1() -> @kernel.Thm {
  leadsto_thm4_lemma1_c.get()
}

///|
/// LEADSTO_thm4_lemma2
fn step_19() -> Unit raise {
  let t60 = @simp.asm_rewrite_tac(@list.List([]))
  let t61 = @tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @tactics.repeat_tac(@tactics.strip_tac)), t60)
  leadsto_thm4_lemma2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], R(p1, q, Pr) → R(p2, q, Pr) → (∀ p : (A) -> Bool, ((p : (A) -> Bool) => p == p1 || p == p2)(p) → R(p, q, Pr))")), t61))
}

///|
let leadsto_thm4_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm4_lemma2")

///|
/// `LEADSTO_thm4_lemma2`
pub fn leadsto_thm4_lemma2() -> @kernel.Thm {
  leadsto_thm4_lemma2_c.get()
}

///|
/// LEADSTO_thm4_lemma3
fn step_20() -> Unit raise {
  let t65 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, P(p) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, (Pr : List[(A) -> A]))) → R(p, q, Pr)"))
  let t63 = @term_syntax.parse_term("(p : (A) -> Bool) => p == (p1 : (A) -> Bool) || p == (p2 : (A) -> Bool)")
  let t64 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t66 = @bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p1 : (A) -> Bool), (p2 : (A) -> Bool))"), t64, t63]), t65)
  let t62 = @bool.undisch_all(@bool.spec_all(leadsto_thm4_lemma2()))
  let t67 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm4_lemma1())), t62]))(t66))
  let t68 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t67)
  leadsto_thm4_lemma3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], R(p1, q, Pr) → R(p2, q, Pr) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, P(p) → R(p, q, Pr)) → R(p, q, Pr)) → R(op_bslash_slash_star(p1, p2), q, Pr)")), t68))
}

///|
let leadsto_thm4_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm4_lemma3")

///|
/// `LEADSTO_thm4_lemma3`
pub fn leadsto_thm4_lemma3() -> @kernel.Thm {
  leadsto_thm4_lemma3_c.get()
}

///|
/// LEADSTO_thm4
fn step_21() -> Unit raise {
  let t74 = @tactics.accept_tac(@bool.undisch_all(@bool.spec_all(leadsto_thm4_lemma3())))
  let t70 = @bool.conjunct2(@bool.conjunct2(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(p, q, Pr))")))))
  let t71 = @simp.rewrite_rule(@list.List([in_()]))(t70)
  let t72 = @bool.gen(@term_syntax.parse_term("(q : (A) -> Bool)"), t71)
  let t73 = @tactics.assume_tac(@bool.gen(@term_syntax.parse_term("(p : (A) -> Bool)"), t72))
  let t69 = @tactics.repeat_tac(@tactics.strip_tac)
  let t75 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto(), leadstorel()])), t69), @hol88.res_tac), t73), t74)
  leadsto_thm4_c.set(@aux_definitions.prove_thm("LEADSTO_thm4", @term_syntax.parse_term("∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p1, q, Pr) && LEADSTO(p2, q, Pr) → LEADSTO(op_bslash_slash_star(p1, p2), q, Pr)"), t75))
}

///|
let leadsto_thm4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm4")

///|
/// `LEADSTO_thm4`
pub fn leadsto_thm4() -> @kernel.Thm {
  leadsto_thm4_c.get()
}

///|
/// LEADSTO_thm5_lemma1
fn step_22() -> Unit raise {
  let t79 = @simp.asm_rewrite_tac(@list.List([]))
  let t78 = @tactics.repeat_tac(@hol88.cond_cases_tac)
  let t80 = @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("if (p : (A) -> Bool) == (p' : (A) -> Bool) { true } else { false }")), t78), t79)
  let t77 = @simp.asm_rewrite_tac(@list.List([]))
  let t81 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> Bool)")), t77), t80])
  let t76 = @tactics.repeat_tac(@tactics.strip_tac)
  let t82 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.beta_tac), @tactics.eq_tac), t76), t81)
  leadsto_thm5_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ s : A, p(s) == ((s : A) => ∃ p' : (A) -> Bool, (if p == p' { true } else { false }) && p'(s))(s)")), t82))
}

///|
let leadsto_thm5_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm5_lemma1")

///|
/// `LEADSTO_thm5_lemma1`
pub fn leadsto_thm5_lemma1() -> @kernel.Thm {
  leadsto_thm5_lemma1_c.get()
}

///|
/// LEADSTO_thm5_lemma2
fn step_23() -> Unit raise {
  let t83 = @hol88.mk_abs(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool)"), leadsto_thm5_lemma1()))
  leadsto_thm5_lemma2_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t83)))
}

///|
let leadsto_thm5_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm5_lemma2")

///|
/// `LEADSTO_thm5_lemma2`
pub fn leadsto_thm5_lemma2() -> @kernel.Thm {
  leadsto_thm5_lemma2_c.get()
}

///|
/// LEADSTO_thm5_lemma3
fn step_24() -> Unit raise {
  let t85 = @simp.rewrite_tac(@list.List([]))
  let t84 = @tactics.repeat_tac(@hol88.cond_cases_tac)
  let t86 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t84), t85)
  leadsto_thm5_lemma3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ p' : (A) -> Bool, (if p == p' { true } else { false }) == (p == p')")), t86))
}

///|
let leadsto_thm5_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm5_lemma3")

///|
/// `LEADSTO_thm5_lemma3`
pub fn leadsto_thm5_lemma3() -> @kernel.Thm {
  leadsto_thm5_lemma3_c.get()
}

///|
/// LEADSTO_thm5
fn step_25() -> Unit raise {
  let t92 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t93 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t92))
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t93)
  let t95 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t94])
  let t91 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t90 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t96 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.disj2_tac), @tactics.disj2_tac), t90), t91), @tactics.beta_tac), @tactics.conj_tac), t95)
  let t89 = @list.List([@tactics.accept_tac(@bool.undisch(@bool.spec_all(leadsto_thm0()))), (x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x87), (x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x88)])
  let t97 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t89), t96])
  let t98 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t97)
  leadsto_thm5_c.set(@aux_definitions.prove_thm("LEADSTO_thm5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∃ r : (A) -> Bool, LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)))) == LEADSTO(p, q, Pr)"), t98))
}

///|
let leadsto_thm5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm5")

///|
/// `LEADSTO_thm5`
pub fn leadsto_thm5() -> @kernel.Thm {
  leadsto_thm5_c.get()
}

///|
/// LEADSTO_thm6
fn step_26() -> Unit raise {
  let t104 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t105 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t104))
  let t106 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t105)
  let t107 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t106])
  let t103 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t102 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t108 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.disj2_tac), @tactics.disj2_tac), t102), t103), @tactics.beta_tac), @tactics.conj_tac), t107)
  let t101 = @list.List([@tactics.accept_tac(@bool.undisch(@bool.spec_all(leadsto_thm0()))), (x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2(), x99), (x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x100)])
  let t109 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t101), t108])
  let t110 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t109)
  leadsto_thm6_c.set(@aux_definitions.prove_thm("LEADSTO_thm6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∃ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)))) == LEADSTO(p, q, Pr)"), t110))
}

///|
let leadsto_thm6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm6")

///|
/// `LEADSTO_thm6`
pub fn leadsto_thm6() -> @kernel.Thm {
  leadsto_thm6_c.get()
}

///|
/// LEADSTO_thm7
fn step_27() -> Unit raise {
  let t116 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t117 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t116))
  let t118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t117)
  let t119 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t118])
  let t115 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t114 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t120 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.disj2_tac), @tactics.disj2_tac), t114), t115), @tactics.beta_tac), @tactics.conj_tac), t119)
  let t113 = @list.List([@tactics.accept_tac(@bool.undisch(@bool.spec_all(leadsto_thm0()))), (x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2a(), x111), (x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x112)])
  let t121 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t113), t120])
  let t122 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t121)
  leadsto_thm7_c.set(@aux_definitions.prove_thm("LEADSTO_thm7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∃ r : (A) -> Bool, ENSURES(p, r, Pr) && ENSURES(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)))) == LEADSTO(p, q, Pr)"), t122))
}

///|
let leadsto_thm7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm7")

///|
/// `LEADSTO_thm7`
pub fn leadsto_thm7() -> @kernel.Thm {
  leadsto_thm7_c.get()
}

///|
/// LEADSTO_thm8
fn step_28() -> Unit raise {
  let t128 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t129 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t128))
  let t130 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t129)
  let t131 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t130])
  let t127 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t126 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t132 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.disj2_tac), t126), t127), @tactics.beta_tac), @tactics.conj_tac), t131)
  let t124 = @tactics.then_tac((x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x123), @simp.asm_rewrite_tac(@list.List([])))
  let t125 = @list.List([@tactics.accept_tac(@bool.undisch(@bool.spec_all(leadsto_thm0()))), t124])
  let t133 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t125), t132])
  let t134 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t133)
  leadsto_thm8_c.set(@aux_definitions.prove_thm("LEADSTO_thm8", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)))) == LEADSTO(p, q, Pr)"), t134))
}

///|
let leadsto_thm8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm8")

///|
/// `LEADSTO_thm8`
pub fn leadsto_thm8() -> @kernel.Thm {
  leadsto_thm8_c.get()
}

///|
/// LEADSTO_thm9
fn step_29() -> Unit raise {
  let t139 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t140 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t139))
  let t141 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t140)
  let t142 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t141])
  let t138 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t137 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t143 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t137), t138), @tactics.beta_tac), @tactics.conj_tac), t142)
  let t136 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x135 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x135)), t136), t143])
  let t145 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t144)
  leadsto_thm9_c.set(@aux_definitions.prove_thm("LEADSTO_thm9", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr))) == LEADSTO(p, q, Pr)"), t145))
}

///|
let leadsto_thm9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm9")

///|
/// `LEADSTO_thm9`
pub fn leadsto_thm9() -> @kernel.Thm {
  leadsto_thm9_c.get()
}

///|
/// LEADSTO_thm11
fn step_30() -> Unit raise {
  let t148 = @simp.asm_rewrite_tac(@list.List([@mk_ensures.ensures_thm1()]))
  let t149 = @list.List([(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2(), x147), @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> Bool)")), t148)])
  let t146 = @tactics.repeat_tac(@tactics.strip_tac)
  let t150 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t146), t149)
  leadsto_thm11_c.set(@aux_definitions.prove_thm("LEADSTO_thm11", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∃ r : (A) -> Bool, ENSURES(p, r, CONS(st, Pr)) && LEADSTO(r, q, CONS(st, Pr))) == LEADSTO(p, q, CONS(st, Pr))"), t150))
}

///|
let leadsto_thm11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm11")

///|
/// `LEADSTO_thm11`
pub fn leadsto_thm11() -> @kernel.Thm {
  leadsto_thm11_c.get()
}

///|
/// LEADSTO_thm12
fn step_31() -> Unit raise {
  let t152 = @simp.rewrite_tac(@list.List([@mk_ensures.ensures_thm1()]))
  let t151 = @simp.once_rewrite_tac(@list.List([@equal.sym(@bool.spec_all(leadsto_thm5()))]))
  let t153 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t151), @tactics.disj1_tac), t152)
  leadsto_thm12_c.set(@aux_definitions.prove_thm("LEADSTO_thm12", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, p, CONS(st, Pr))"), t153))
}

///|
let leadsto_thm12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm12")

///|
/// `LEADSTO_thm12`
pub fn leadsto_thm12() -> @kernel.Thm {
  leadsto_thm12_c.get()
}

///|
/// LEADSTO_thm13
fn step_32() -> Unit raise {
  let t156 = @simp.asm_rewrite_tac(@list.List([leadsto_thm12()]))
  let t157 = @list.List([(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x155), @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> Bool)")), t156)])
  let t154 = @tactics.repeat_tac(@tactics.strip_tac)
  let t158 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t154), t157)
  leadsto_thm13_c.set(@aux_definitions.prove_thm("LEADSTO_thm13", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∃ r : (A) -> Bool, LEADSTO(p, r, CONS(st, Pr)) && LEADSTO(r, q, CONS(st, Pr))) == LEADSTO(p, q, CONS(st, Pr))"), t158))
}

///|
let leadsto_thm13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm13")

///|
/// `LEADSTO_thm13`
pub fn leadsto_thm13() -> @kernel.Thm {
  leadsto_thm13_c.get()
}

///|
/// LEADSTO_thm14
fn step_33() -> Unit raise {
  let t159 = @simp.rewrite_tac(@list.List([leadsto_thm11(), leadsto_thm13()]))
  let t160 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t159)
  leadsto_thm14_c.set(@aux_definitions.prove_thm("LEADSTO_thm14", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∃ r : (A) -> Bool, LEADSTO(p, r, CONS(st, Pr)) && LEADSTO(r, q, CONS(st, Pr))) == (∃ r : (A) -> Bool, ENSURES(p, r, CONS(st, Pr)) && LEADSTO(r, q, CONS(st, Pr)))"), t160))
}

///|
let leadsto_thm14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm14")

///|
/// `LEADSTO_thm14`
pub fn leadsto_thm14() -> @kernel.Thm {
  leadsto_thm14_c.get()
}

///|
/// LEADSTO_thm15
fn step_34() -> Unit raise {
  let t167 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t168 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t167))
  let t169 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t168)
  let t170 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t169])
  let t166 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t165 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t171 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.disj2_tac), t165), t166), @tactics.beta_tac), @tactics.conj_tac), t170)
  let t163 = @bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ r : (A) -> Bool, ENSURES((p : (A) -> Bool), r, (Pr : List[(A) -> A])) && LEADSTO(r, (q : (A) -> Bool), Pr)")))
  let t172 = @list.List([(x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x162), @tactics.accept_tac(@bool.mp(@bool.spec_all(leadsto_thm2()), t163)), (x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x164), t171])
  let t161 = @tactics.repeat_tac(@tactics.strip_tac)
  let t173 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t161), t172)
  leadsto_thm15_c.set(@aux_definitions.prove_thm("LEADSTO_thm15", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)))) == LEADSTO(p, q, Pr)"), t173))
}

///|
let leadsto_thm15_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm15")

///|
/// `LEADSTO_thm15`
pub fn leadsto_thm15() -> @kernel.Thm {
  leadsto_thm15_c.get()
}

///|
/// LEADSTO_thm16
fn step_35() -> Unit raise {
  let t178 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t179 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t178))
  let t180 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()]))), @tactics.disch_tac), t179)
  let t181 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t180])
  let t177 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t182 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))), t177), @tactics.beta_tac), @tactics.conj_tac), t181)
  let t175 = @bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ r : (A) -> Bool, ENSURES((p : (A) -> Bool), r, (Pr : List[(A) -> A])) && LEADSTO(r, (q : (A) -> Bool), Pr)")))
  let t183 = @list.List([@tactics.accept_tac(@bool.mp(@bool.spec_all(leadsto_thm2()), t175)), (x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x176), t182])
  let t174 = @tactics.repeat_tac(@tactics.strip_tac)
  let t184 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t174), t183)
  leadsto_thm16_c.set(@aux_definitions.prove_thm("LEADSTO_thm16", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ((∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)))) == LEADSTO(p, q, Pr)"), t184))
}

///|
let leadsto_thm16_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm16")

///|
/// `LEADSTO_thm16`
pub fn leadsto_thm16() -> @kernel.Thm {
  leadsto_thm16_c.get()
}

///|
/// STRUCT_lemma0
fn step_36() -> Unit raise {
  let t185 = @tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), @hol88.res_tac)
  struct_lemma0_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr))) == ((∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)))")), t185))
}

///|
let struct_lemma0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STRUCT_lemma0")

///|
/// `STRUCT_lemma0`
pub fn struct_lemma0() -> @kernel.Thm {
  struct_lemma0_c.get()
}

///|
/// STRUCT_lemma00
fn step_37() -> Unit raise {
  let t197 = @bool.spec_all(@bool.conjunct2(@bool.conjunct2(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr))) && (∀ r : (A) -> Bool, (LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → X(p, r, Pr))) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → X(p, q, Pr))) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) && (LEADSTO(p', q, Pr) → X(p', q, Pr))) → LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → X(p, q, Pr)))"))))))
  let t198 = @bool.gen_all(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr))"))]))(t197))
  let t199 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t198)
  let t200 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(LUB((P : ((A) -> Bool) -> Bool)), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))]))(t199))
  let t195 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"))
  let t196 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t195)
  let t201 = @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(struct_lemma0()))]))(t196)), t200)
  let t194 = @simp.asm_rewrite_tac(@list.List([]))
  let t202 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(struct_lemma0(), x192), (x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x193)), @hol88.res_tac), t194)
  let t191 = @simp.asm_rewrite_tac(@list.List([]))
  let t203 = @list.List([(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x187), @hol88.res_tac, (x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x188), @hol88.res_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(struct_lemma0(), x189), (x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x190)), @hol88.res_tac), t191), t202, @hol88.res_tac, @hol88.res_tac, t201])
  let t186 = @tactics.repeat_tac(@tactics.strip_tac)
  let t204 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t186), t203)
  struct_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → X(p, r, Pr)) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → X(p, q, Pr))) && (∀ r : (A) -> Bool, (LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → X(p, r, Pr))) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → X(p, q, Pr))) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) && (LEADSTO(p', q, Pr) → X(p', q, Pr))) → LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → X(p, q, Pr))))")), t204))
}

///|
let struct_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STRUCT_lemma00")

///|
/// `STRUCT_lemma00`
pub fn struct_lemma00() -> @kernel.Thm {
  struct_lemma00_c.get()
}

///|
/// LEADSTO_thm17
fn step_38() -> Unit raise {
  let t206 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t207 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t206)
  let t208 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr))"), t207))
  let t209 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(struct_lemma00()))]))(t208))
  let t205 = @tactics.repeat_tac(@tactics.disch_tac)
  let t210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t205), t209), @hol88.res_tac)
  leadsto_thm17_c.set(@aux_definitions.prove_thm("LEADSTO_thm17", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → X(p, r, Pr)) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))) → LEADSTO(p, q, Pr) → X(p, q, Pr)"), t210))
}

///|
let leadsto_thm17_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm17")

///|
/// `LEADSTO_thm17`
pub fn leadsto_thm17() -> @kernel.Thm {
  leadsto_thm17_c.get()
}

///|
/// LEADSTO_thm18
fn step_39() -> Unit raise {
  let t218 = @kernel.assume_rule(@term_syntax.parse_term("(∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → X(p, r, Pr)) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr)) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) → X(p', q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))) → LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), Pr) && (LEADSTO(p, q, Pr) → X(p, q, Pr))"))
  let t215 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t216 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)"))
  let t217 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, r, Pr)) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)"))
  let t219 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t217, t216, t215]))(t218))
  let t211 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t212 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t211)
  let t213 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO(p, q, Pr) && (LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr))"), t212))
  let t214 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(struct_lemma00()))]))(t213))
  let t220 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t214), t219)
  leadsto_thm18_c.set(@aux_definitions.prove_thm("LEADSTO_thm18", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && (LEADSTO(p, r, Pr) → X(p, r, Pr)) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t220))
}

///|
let leadsto_thm18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm18")

///|
/// `LEADSTO_thm18`
pub fn leadsto_thm18() -> @kernel.Thm {
  leadsto_thm18_c.get()
}

///|
/// STRUCT_lemma1
fn step_40() -> Unit raise {
  let t221 = @tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), @hol88.res_tac)
  struct_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) == ((∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)))")), t221))
}

///|
let struct_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STRUCT_lemma1")

///|
/// `STRUCT_lemma1`
pub fn struct_lemma1() -> @kernel.Thm {
  struct_lemma1_c.get()
}

///|
/// STRUCT_lemma01
fn step_41() -> Unit raise {
  let t235 = @simp.asm_rewrite_tac(@list.List([]))
  let t236 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(struct_lemma1(), x233), (x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x234)), @hol88.res_tac), t235)
  let t237 = @tactics.then_tac((x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(struct_lemma1(), x231), (x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x232))
  let t238 = @tactics.then_tac((x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x230), @hol88.res_tac)
  let t225 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t226 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t225)
  let t227 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t226))
  let t223 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t224 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t223)
  let t239 = @list.List([@hol88.res_tac, @hol88.res_tac, @tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(struct_lemma1()))]))(t224)), @hol88.res_tac), t227), (x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x228), @hol88.res_tac, (x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x229), t238, t237, t236])
  let t222 = @tactics.repeat_tac(@tactics.strip_tac)
  let t240 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t222), t239)
  struct_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO(p, q, Pr) && X(p, q, Pr)) && (∀ r : (A) -> Bool, (LEADSTO(p, r, Pr) && X(p, r, Pr)) && LEADSTO(r, q, Pr) && X(r, q, Pr) → LEADSTO(p, q, Pr) && X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) && X(p', q, Pr)) → LEADSTO(p, q, Pr) && X(p, q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && X(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)))")), t240))
}

///|
let struct_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STRUCT_lemma01")

///|
/// `STRUCT_lemma01`
pub fn struct_lemma01() -> @kernel.Thm {
  struct_lemma01_c.get()
}

///|
/// LEADSTO_thm19
fn step_42() -> Unit raise {
  let t241 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t242 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t241)
  let t243 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO(p, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t242))
  let t244 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([struct_lemma01()]))(t243))
  let t245 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t244), @hol88.res_tac)
  leadsto_thm19_c.set(@aux_definitions.prove_thm("LEADSTO_thm19", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && X(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))) → LEADSTO(p, q, Pr) → X(p, q, Pr)"), t245))
}

///|
let leadsto_thm19_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm19")

///|
/// `LEADSTO_thm19`
pub fn leadsto_thm19() -> @kernel.Thm {
  leadsto_thm19_c.get()
}

///|
/// LEADSTO_thm20
fn step_43() -> Unit raise {
  let t249 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t250 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t249)
  let t251 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO(p, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t250))
  let t252 = @simp.rewrite_rule(@list.List([struct_lemma01()]))(t251)
  let t246 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t247 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)"))
  let t248 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → LEADSTO(p, q, Pr) → X(p, q, Pr)"))
  let t253 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t248, t247, t246]))(t252))
  let t254 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t253)
  leadsto_thm20_c.set(@aux_definitions.prove_thm("LEADSTO_thm20", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && X(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t254))
}

///|
let leadsto_thm20_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm20")

///|
/// `LEADSTO_thm20`
pub fn leadsto_thm20() -> @kernel.Thm {
  leadsto_thm20_c.get()
}

///|
/// LEADSTO_thm21
fn step_44() -> Unit raise {
  let t255 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t256 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t255)
  let t257 = @tactics.assume_tac(@equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t256)))
  let t258 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t257), @hol88.res_tac)
  leadsto_thm21_c.set(@aux_definitions.prove_thm("LEADSTO_thm21", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))) → LEADSTO(p, q, Pr) → X(p, q, Pr)"), t258))
}

///|
let leadsto_thm21_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm21")

///|
/// `LEADSTO_thm21`
pub fn leadsto_thm21() -> @kernel.Thm {
  leadsto_thm21_c.get()
}

///|
/// LEADSTO_thm22
fn step_45() -> Unit raise {
  let t262 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t263 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t262)
  let t264 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t263))
  let t265 = @simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@theorems.conj_assoc()))]))(t264)
  let t259 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t260 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → X(p, q, Pr)"))
  let t261 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)"))
  let t266 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t261, t260, t259]))(t265))
  let t267 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t266)
  leadsto_thm22_c.set(@aux_definitions.prove_thm("LEADSTO_thm22", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t267))
}

///|
let leadsto_thm22_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm22")

///|
/// `LEADSTO_thm22`
pub fn leadsto_thm22() -> @kernel.Thm {
  leadsto_thm22_c.get()
}

///|
/// LEADSTO_thm23_lemma00
fn step_46() -> Unit raise {
  let t268 = @tactics.repeat_tac(@tactics.strip_tac)
  let t269 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t268), @hol88.res_tac)
  leadsto_thm23_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], ((∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr))) == (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) && X(p, q, Pr))")), t269))
}

///|
let leadsto_thm23_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm23_lemma00")

///|
/// `LEADSTO_thm23_lemma00`
pub fn leadsto_thm23_lemma00() -> @kernel.Thm {
  leadsto_thm23_lemma00_c.get()
}

///|
/// LEADSTO_thm23_lemma01
fn step_47() -> Unit raise {
  let t278 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p', q, Pr)"))
  let t279 = @tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm23_lemma00()))]))(t278)), @hol88.res_tac)
  let t277 = @simp.asm_rewrite_tac(@list.List([]))
  let t275 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p', q, Pr)"))
  let t280 = @tactics.then_tac(@tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm23_lemma00()))]))(t275)), (x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x276)), t277)
  let t271 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t272 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t271)
  let t281 = @list.List([@hol88.res_tac, @hol88.res_tac, @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm23_lemma00()]))(t272)), @hol88.res_tac), (x273 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x273), @hol88.res_tac, (x274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x274), @hol88.res_tac, t280, t279])
  let t270 = @tactics.repeat_tac(@tactics.strip_tac)
  let t282 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t270), t281)
  leadsto_thm23_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO(p, q, Pr) && X(p, q, Pr)) && (∀ r : (A) -> Bool, (LEADSTO(p, r, Pr) && X(p, r, Pr)) && LEADSTO(r, q, Pr) && X(r, q, Pr) → LEADSTO(p, q, Pr) && X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) && X(p', q, Pr)) → LEADSTO(p, q, Pr) && X(p, q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr)))")), t282))
}

///|
let leadsto_thm23_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm23_lemma01")

///|
/// `LEADSTO_thm23_lemma01`
pub fn leadsto_thm23_lemma01() -> @kernel.Thm {
  leadsto_thm23_lemma01_c.get()
}

///|
/// LEADSTO_thm23
fn step_48() -> Unit raise {
  let t283 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t284 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t283)
  let t285 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO(p, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t284))
  let t286 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm23_lemma01()]))(t285))
  let t287 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t286), @hol88.res_tac)
  leadsto_thm23_c.set(@aux_definitions.prove_thm("LEADSTO_thm23", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO(p, q, Pr) → X(p, q, Pr))"), t287))
}

///|
let leadsto_thm23_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm23")

///|
/// `LEADSTO_thm23`
pub fn leadsto_thm23() -> @kernel.Thm {
  leadsto_thm23_c.get()
}

///|
/// LEADSTO_thm24_lemma01
fn step_49() -> Unit raise {
  let t291 = @simp.asm_rewrite_tac(@list.List([]))
  let t289 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t290 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t289)
  let t292 = @list.List([@tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t290)), t291])
  let t288 = @tactics.repeat_tac(@tactics.strip_tac)
  let t293 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t288), @hol88.res_tac), t292)
  leadsto_thm24_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr)))")), t293))
}

///|
let leadsto_thm24_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm24_lemma01")

///|
/// `LEADSTO_thm24_lemma01`
pub fn leadsto_thm24_lemma01() -> @kernel.Thm {
  leadsto_thm24_lemma01_c.get()
}

///|
/// LEADSTO_thm24
fn step_50() -> Unit raise {
  let t294 = @bool.spec_all(leadsto_thm23())
  let t295 = @tactics.accept_tac(@bool.undisch(@bool.spec_all(@bool.undisch(@simp.rewrite_rule(@list.List([leadsto_thm24_lemma01()]))(t294)))))
  let t296 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t295)
  leadsto_thm24_c.set(@aux_definitions.prove_thm("LEADSTO_thm24", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO(p, q, Pr) → X(p, q, Pr))"), t296))
}

///|
let leadsto_thm24_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm24")

///|
/// `LEADSTO_thm24`
pub fn leadsto_thm24() -> @kernel.Thm {
  leadsto_thm24_c.get()
}

///|
/// LEADSTO_thm25
fn step_51() -> Unit raise {
  let t302 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, (p : (A) -> Bool)(s) → (q : (A) -> Bool)(s)"))
  let t299 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t300 = @term_syntax.parse_term("(st : (A) -> A)")
  let t301 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t303 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t301, t300, t299]), @mk_ensures.ensures_cor1()), t302)
  let t297 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t298 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t304 = @tactics.strip_assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t298, t297]), leadsto_thm0()), t303))
  let t305 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t304)
  leadsto_thm25_c.set(@aux_definitions.prove_thm("LEADSTO_thm25", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ s : A, p(s) → q(s)) → LEADSTO(p, q, CONS(st, Pr))"), t305))
}

///|
let leadsto_thm25_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm25")

///|
/// `LEADSTO_thm25`
pub fn leadsto_thm25() -> @kernel.Thm {
  leadsto_thm25_c.get()
}

///|
/// LEADSTO_thm26
fn step_52() -> Unit raise {
  let t312 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t313 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t314 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t315 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t314, t313, t312]), leadsto_thm1())
  let t308 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t309 = @term_syntax.parse_term("(st : (A) -> A)")
  let t310 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t311 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(q : (A) -> Bool)"), t310, t309, t308]), leadsto_thm25())))
  let t306 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t307 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : (A) -> Bool)"), t306]), @mk_state_logic.imply_weak_lemma_b()))
  let t317 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t307), t311), (x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t315, x316))
  leadsto_thm26_c.set(@aux_definitions.prove_thm("LEADSTO_thm26", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) → LEADSTO(p, op_bslash_slash_star(q, q'), CONS(st, Pr))"), t317))
}

///|
let leadsto_thm26_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm26")

///|
/// `LEADSTO_thm26`
pub fn leadsto_thm26() -> @kernel.Thm {
  leadsto_thm26_c.get()
}

///|
/// LEADSTO_thm27
fn step_53() -> Unit raise {
  let t326 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t327 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t328 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t329 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t328, t327, t326]), leadsto_thm4())
  let t324 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), op_bslash_slash_star((q' : (A) -> Bool), (q : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t325 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t324))
  let t319 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t320 = @term_syntax.parse_term("(st : (A) -> A)")
  let t321 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t322 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t323 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p' : (A) -> Bool)"), t322, t321, t320, t319]), leadsto_thm26())))
  let t318 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(leadsto_thm26())))
  let t331 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t318), t323), t325), (x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t329, x330))
  leadsto_thm27_c.set(@aux_definitions.prove_thm("LEADSTO_thm27", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && LEADSTO(p', q', CONS(st, Pr)) → LEADSTO(op_bslash_slash_star(p, p'), op_bslash_slash_star(q, q'), CONS(st, Pr))"), t331))
}

///|
let leadsto_thm27_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm27")

///|
/// `LEADSTO_thm27`
pub fn leadsto_thm27() -> @kernel.Thm {
  leadsto_thm27_c.get()
}

///|
/// LEADSTO_thm28
fn step_54() -> Unit raise {
  let t344 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_bslash_slash_star((b : (A) -> Bool), (q : (A) -> Bool)), op_bslash_slash_star((r : (A) -> Bool), q), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t345 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t344)
  let t346 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), (b : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t345)
  let t341 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t342 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t343 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (b : (A) -> Bool))")
  let t347 = @tactics.accept_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t343, t342, t341]), leadsto_thm1()), t346))
  let t338 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((q : (A) -> Bool), q, CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t339 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO((b : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t338)
  let t333 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t334 = @term_syntax.parse_term("(st : (A) -> A)")
  let t335 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t336 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t337 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t340 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(b : (A) -> Bool)"), t337, t336, t335, t334, t333]), leadsto_thm27()), t339))
  let t332 = @tactics.assume_tac(@bool.spec_all(@bool.spec(@term_syntax.parse_term("(q : (A) -> Bool)"), leadsto_thm12())))
  let t348 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t332), t340), t347)
  leadsto_thm28_c.set(@aux_definitions.prove_thm("LEADSTO_thm28", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ b : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, op_bslash_slash_star(q, b), CONS(st, Pr)) && LEADSTO(b, r, CONS(st, Pr)) → LEADSTO(p, op_bslash_slash_star(q, r), CONS(st, Pr))"), t348))
}

///|
let leadsto_thm28_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm28")

///|
/// `LEADSTO_thm28`
pub fn leadsto_thm28() -> @kernel.Thm {
  leadsto_thm28_c.get()
}

///|
/// LEADSTO_thm29_lemma00
fn step_55() -> Unit raise {
  let t349 = @equal.beta_rule(@bool.spec_all(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => UNLESS((r : (A) -> Bool), (b : (A) -> Bool), Pr) → LEADSTO(op_slash_bslash_star(p, r), op_bslash_slash_star(op_slash_bslash_star(q, r), b), Pr)"), leadsto_thm17())))
  let t350 = @bool.gen(@term_syntax.parse_term("(Pr : List[(A) -> A])"), t349)
  leadsto_thm29_lemma00_c.set(@bool.spec(@term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))"), t350))
}

///|
let leadsto_thm29_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma00")

///|
/// `LEADSTO_thm29_lemma00`
pub fn leadsto_thm29_lemma00() -> @kernel.Thm {
  leadsto_thm29_lemma00_c.get()
}

///|
/// LEADSTO_thm29_lemma05_1
fn step_56() -> Unit raise {
  let t351 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), @hol88.res_tac)
  leadsto_thm29_lemma05_1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p'' : (A) -> Bool, In(p'', (P : ((A) -> Bool) -> Bool)) → LEADSTO(p'', (q' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))) → (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(p'', q', CONS(st, Pr)) → UNLESS((r : (A) -> Bool), (b : (A) -> Bool), CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p'', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) → (∀ p'' : (A) -> Bool, In(p'', P) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p'', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr)))")), t351))
}

///|
let leadsto_thm29_lemma05_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05_1")

///|
/// `LEADSTO_thm29_lemma05_1`
pub fn leadsto_thm29_lemma05_1() -> @kernel.Thm {
  leadsto_thm29_lemma05_1_c.get()
}

///|
/// LEADSTO_thm29_lemma05_2
fn step_57() -> Unit raise {
  let t355 = @term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))")
  let t356 = @tactics.assume_tac(@bool.undisch(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star(LUB((P : ((A) -> Bool) -> Bool)), (r : (A) -> Bool))"), t355]), @mk_ensures.ensures_cor1()))))
  let t353 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t354 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t353]), @mk_state_logic.sym_and_imply_weak_lemma()))
  let t359 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x352)), t354), t356), (x357 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x357)), (x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x358))
  leadsto_thm29_lemma05_2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(op_slash_bslash_star(p, r), q, CONS(st, Pr))) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(LUB(P), r), q, CONS(st, Pr))")), t359))
}

///|
let leadsto_thm29_lemma05_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05_2")

///|
/// `LEADSTO_thm29_lemma05_2`
pub fn leadsto_thm29_lemma05_2() -> @kernel.Thm {
  leadsto_thm29_lemma05_2_c.get()
}

///|
/// LEADSTO_thm29_lemma05_3
fn step_58() -> Unit raise {
  let t360 = @simp.rewrite_tac(@list.List([]))
  let t361 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([in_()])), @tactics.beta_tac), t360)
  leadsto_thm29_lemma05_3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ r : (A) -> Bool, In(p, (p'' : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', P) && p'' == op_slash_bslash_star(p', r)) == (∃ p' : (A) -> Bool, In(p', P) && p == op_slash_bslash_star(p', r))")), t361))
}

///|
let leadsto_thm29_lemma05_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05_3")

///|
/// `LEADSTO_thm29_lemma05_3`
pub fn leadsto_thm29_lemma05_3() -> @kernel.Thm {
  leadsto_thm29_lemma05_3_c.get()
}

///|
/// LEADSTO_thm29_lemma05_4
fn step_59() -> Unit raise {
  let t371 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t372 = @tactics.strip_assume_tac(@equal.beta_rule(@equal.subs(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == ((s : A) => (p' : (A) -> Bool)(s) && (r : (A) -> Bool)(s))"))]), t371)))
  let t369 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t370 = @tactics.strip_assume_tac(@equal.beta_rule(@equal.subs(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == ((s : A) => (p' : (A) -> Bool)(s) && (r : (A) -> Bool)(s))"))]), t369)))
  let t367 = @kernel.assume_rule(@term_syntax.parse_term("In((p' : (A) -> Bool), (P : ((A) -> Bool) -> Bool))"))
  let t368 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([in_()]))(t367)]))
  let t373 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool)")), t368), t370)
  let t366 = @simp.asm_rewrite_tac(@list.List([in_()]))
  let t365 = @tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> Bool)"))
  let t364 = @simp.asm_rewrite_tac(@list.List([]))
  let t374 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(s : A) => (p : (A) -> Bool)(s) && (r : (A) -> Bool)(s)")), @tactics.beta_tac), t364), t365), t366), t373, t372])
  let t363 = @tactics.repeat_tac(@tactics.strip_tac)
  let t362 = @simp.rewrite_tac(@list.List([lub(), @mk_state_logic.and_def()]))
  let t375 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t362), @tactics.beta_tac), @tactics.eq_tac), t363), t374)
  leadsto_thm29_lemma05_4_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ s : A, op_slash_bslash_star(LUB((P : ((A) -> Bool) -> Bool)), (r : (A) -> Bool), s) == LUB((p : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', P) && p == op_slash_bslash_star(p', r), s)")), t375))
}

///|
let leadsto_thm29_lemma05_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05_4")

///|
/// `LEADSTO_thm29_lemma05_4`
pub fn leadsto_thm29_lemma05_4() -> @kernel.Thm {
  leadsto_thm29_lemma05_4_c.get()
}

///|
/// LEADSTO_thm29_lemma05_5
fn step_60() -> Unit raise {
  let t376 = @simp.asm_rewrite_tac(@list.List([]))
  let t377 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t376)
  leadsto_thm29_lemma05_5_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ r : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ b : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(op_slash_bslash_star(p'', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) → (∀ p : (A) -> Bool, (∃ p' : (A) -> Bool, In(p', P) && p == op_slash_bslash_star(p', r)) → LEADSTO(p, op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr)))")), t377))
}

///|
let leadsto_thm29_lemma05_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05_5")

///|
/// `LEADSTO_thm29_lemma05_5`
pub fn leadsto_thm29_lemma05_5() -> @kernel.Thm {
  leadsto_thm29_lemma05_5_c.get()
}

///|
/// LEADSTO_thm29_lemma05_6
fn step_61() -> Unit raise {
  let t384 = @hol88.mk_abs(leadsto_thm29_lemma05_4())
  let t385 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t384)]))
  let t382 = @kernel.assume_rule(@term_syntax.parse_term("(∀ p : (A) -> Bool, (∃ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) && p == op_slash_bslash_star(p', (r : (A) -> Bool))) → LEADSTO(p, op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), r), (b : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))) → LEADSTO(LUB((p : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', P) && p == op_slash_bslash_star(p', r)), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))"))
  let t383 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@bool.undisch(@bool.spec_all(leadsto_thm29_lemma05_5()))]))(t382))
  let t378 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t379 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (r : (A) -> Bool)), (b : (A) -> Bool))")
  let t380 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) && p == op_slash_bslash_star(p', (r : (A) -> Bool))"), t379, t378]), leadsto_thm3a())
  let t381 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm29_lemma05_3()]))(t380))
  let t386 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t381), t383), t385)
  leadsto_thm29_lemma05_6_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ r : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ b : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(op_slash_bslash_star(p'', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(LUB(P), r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))")), t386))
}

///|
let leadsto_thm29_lemma05_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05_6")

///|
/// `LEADSTO_thm29_lemma05_6`
pub fn leadsto_thm29_lemma05_6() -> @kernel.Thm {
  leadsto_thm29_lemma05_6_c.get()
}

///|
/// LEADSTO_thm29_lemma05
fn step_62() -> Unit raise {
  let t423 = @bool.undisch_all(leadsto_thm29_lemma05_1())
  let t424 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("UNLESS((r : (A) -> Bool), (b : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))]))(t423))
  let t426 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t424), (x425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm29_lemma05_6(), x425))
  let t418 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((r' : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), r), (b : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t417 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p' : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((r' : (A) -> Bool), r), (b : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t419 = @bool.conj(@simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t417), t418)
  let t412 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t413 = @term_syntax.parse_term("(st : (A) -> A)")
  let t414 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (r : (A) -> Bool)), (b : (A) -> Bool))")
  let t415 = @term_syntax.parse_term("op_slash_bslash_star((r' : (A) -> Bool), (r : (A) -> Bool))")
  let t416 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t420 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p' : (A) -> Bool), (r : (A) -> Bool))"), t416, t415, t414, t413, t412]), leadsto_thm28()), t419)
  let t421 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t420)
  let t422 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_assoc_lemma(), @mk_state_logic.or_or_lemma()]))(t421))
  let t410 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((r : (A) -> Bool), (b : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t409 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((r' : (A) -> Bool), (q' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t411 = @tactics.assume_tac(@bool.mp(@bool.mp(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO((r' : (A) -> Bool), (q' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → UNLESS((r : (A) -> Bool), (b : (A) -> Bool), CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(r', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))")), t409), t410))
  let t407 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((r : (A) -> Bool), (b : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t406 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), (r' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t408 = @tactics.assume_tac(@bool.mp(@bool.mp(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), (r' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → UNLESS((r : (A) -> Bool), (b : (A) -> Bool), CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p', r), op_bslash_slash_star(op_slash_bslash_star(r', r), b), CONS(st, Pr))")), t406), t407))
  let t427 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t408), t411), t422)
  let t402 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t403 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (r : (A) -> Bool)), (b : (A) -> Bool))")
  let t404 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((r : (A) -> Bool), (p' : (A) -> Bool))"), t403, t402]), leadsto_thm0())
  let t401 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_or_lemma()]))
  let t400 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_lemma()]))
  let t397 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, op_bslash_slash_star(op_slash_bslash_star((r : (A) -> Bool), (q' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((p' : (A) -> Bool), (b : (A) -> Bool)), op_slash_bslash_star(b, q')), s) → op_bslash_slash_star(op_slash_bslash_star(q', r), b, s)"))
  let t396 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES(op_slash_bslash_star((r : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(r, (q' : (A) -> Bool)), op_slash_bslash_star(p', (b : (A) -> Bool))), op_slash_bslash_star(b, q')), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t398 = @bool.conj(@simp.rewrite_rule(@list.List([@mk_state_logic.or_assoc_lemma()]))(t396), t397)
  let t393 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t394 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (r : (A) -> Bool)), (b : (A) -> Bool))")
  let t395 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((r : (A) -> Bool), (q' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((p' : (A) -> Bool), (b : (A) -> Bool)), op_slash_bslash_star(b, q')))")
  let t399 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((r : (A) -> Bool), (p' : (A) -> Bool))"), t395, t394, t393]), @mk_ensures.ensures_thm2()), t398))
  let t389 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t390 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t391 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t392 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p' : (A) -> Bool)"), t391, t390, t389]), @mk_state_logic.imply_weak_lemma6()))
  let t428 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x388 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_ensures.ensures_thm4(), x388)), t392), t399), t400), t401), (x405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t404, x405)), t427, t426])
  let t387 = @tactics.repeat_tac(@tactics.conj_tac)
  let t429 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t387), t428)
  leadsto_thm29_lemma05_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, ∀ b : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (ENSURES(p', q', CONS(st, Pr)) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) && (∀ r' : (A) -> Bool, LEADSTO(p', r', CONS(st, Pr)) && (LEADSTO(p', r', CONS(st, Pr)) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p', r), op_bslash_slash_star(op_slash_bslash_star(r', r), b), CONS(st, Pr))) && LEADSTO(r', q', CONS(st, Pr)) && (LEADSTO(r', q', CONS(st, Pr)) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(r', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) → LEADSTO(p', q', CONS(st, Pr)) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) && (∀ P : ((A) -> Bool) -> Bool, (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(p'', q', CONS(st, Pr))) && (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO(p'', q', CONS(st, Pr)) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p'', r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr))) → LEADSTO(LUB(P), q', CONS(st, Pr)) → UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(LUB(P), r), op_bslash_slash_star(op_slash_bslash_star(q', r), b), CONS(st, Pr)))")), t429))
}

///|
let leadsto_thm29_lemma05_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma05")

///|
/// `LEADSTO_thm29_lemma05`
pub fn leadsto_thm29_lemma05() -> @kernel.Thm {
  leadsto_thm29_lemma05_c.get()
}

///|
/// LEADSTO_thm29_lemma06
fn step_63() -> Unit raise {
  let t430 = @bool.spec_all(leadsto_thm29_lemma05())
  let t431 = @bool.gen(@term_syntax.parse_term("(q' : (A) -> Bool)"), t430)
  let t432 = @bool.gen(@term_syntax.parse_term("(p' : (A) -> Bool)"), t431)
  leadsto_thm29_lemma06_c.set(@bool.gen_all(@bool.mp(@bool.spec_all(leadsto_thm29_lemma00()), t432)))
}

///|
let leadsto_thm29_lemma06_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29_lemma06")

///|
/// `LEADSTO_thm29_lemma06`
pub fn leadsto_thm29_lemma06() -> @kernel.Thm {
  leadsto_thm29_lemma06_c.get()
}

///|
/// LEADSTO_thm29
fn step_64() -> Unit raise {
  let t433 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.spec_all(leadsto_thm29_lemma06()))]))
  let t434 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t433)
  leadsto_thm29_c.set(@aux_definitions.prove_thm("LEADSTO_thm29", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ b : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && UNLESS(r, b, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, r), op_bslash_slash_star(op_slash_bslash_star(q, r), b), CONS(st, Pr))"), t434))
}

///|
let leadsto_thm29_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm29")

///|
/// `LEADSTO_thm29`
pub fn leadsto_thm29() -> @kernel.Thm {
  leadsto_thm29_c.get()
}

///|
/// LEADSTO_thm30_lemma00
fn step_65() -> Unit raise {
  let t435 = @equal.beta_rule(@bool.spec_all(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => q == False → (∀ s : A, Not(p, s))"), leadsto_thm21())))
  let t436 = @bool.gen(@term_syntax.parse_term("(Pr : List[(A) -> A])"), t435)
  leadsto_thm30_lemma00_c.set(@equal.beta_rule(@bool.spec(@term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))"), t436)))
}

///|
let leadsto_thm30_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma00")

///|
/// `LEADSTO_thm30_lemma00`
pub fn leadsto_thm30_lemma00() -> @kernel.Thm {
  leadsto_thm30_lemma00_c.get()
}

///|
/// LEADSTO_thm30_lemma01
fn step_66() -> Unit raise {
  let t437 = @simp.rewrite_tac(@list.List([]))
  let t438 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.not_def1(), @mk_state_logic.false_def()])), @tactics.beta_tac), t437)
  leadsto_thm30_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ r : (A) -> Bool, (∀ s : A, Not(r, s)) → (∀ s : A, r(s) == False(s))")), t438))
}

///|
let leadsto_thm30_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma01")

///|
/// `LEADSTO_thm30_lemma01`
pub fn leadsto_thm30_lemma01() -> @kernel.Thm {
  leadsto_thm30_lemma01_c.get()
}

///|
/// LEADSTO_thm30_lemma02
fn step_67() -> Unit raise {
  let t439 = @hol88.mk_abs(@bool.undisch(@bool.spec_all(leadsto_thm30_lemma01())))
  leadsto_thm30_lemma02_c.set(@bool.disch_all(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t439)))
}

///|
let leadsto_thm30_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma02")

///|
/// `LEADSTO_thm30_lemma02`
pub fn leadsto_thm30_lemma02() -> @kernel.Thm {
  leadsto_thm30_lemma02_c.get()
}

///|
/// LEADSTO_thm30_lemma03
fn step_68() -> Unit raise {
  let t440 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t441 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), @tactics.gen_tac), t440), @tactics.beta_tac), @tactics.refl_tac)
  leadsto_thm30_lemma03_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, (p' : ((A) -> A) -> Bool) == ((s : (A) -> A) => ∃ p : ((A) -> A) -> Bool, (P : (((A) -> A) -> Bool) -> Bool)(p) && p(s)) → (∀ s : (A) -> A, p'(s) == (∃ p : ((A) -> A) -> Bool, P(p) && p(s)))")), t441))
}

///|
let leadsto_thm30_lemma03_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma03")

///|
/// `LEADSTO_thm30_lemma03`
pub fn leadsto_thm30_lemma03() -> @kernel.Thm {
  leadsto_thm30_lemma03_c.get()
}

///|
/// LEADSTO_thm30_lemma04
fn step_69() -> Unit raise {
  let t456 = @tactics.repeat_tac(@tactics.strip_tac)
  let t455 = @simp.asm_rewrite_tac(@list.List([]))
  let t454 = @tactics.undisch_tac(@term_syntax.parse_term("(p' : (A) -> Bool)((s : A))"))
  let t451 = @kernel.assume_rule(@term_syntax.parse_term("∀ p'' : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(p'') → (q' : (A) -> Bool) == ((s : A) => false) → (∀ s : A, !p''(s))"))
  let t452 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(q' : (A) -> Bool) == ((s : A) => false)"))]))(t451))
  let t450 = @tactics.repeat_tac(@tactics.strip_tac)
  let t449 = @simp.rewrite_tac(@list.List([lub(), in_(), @mk_state_logic.not_def1(), @mk_state_logic.false_def()]))
  let t457 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t449), @tactics.beta_tac), t450), t452), (x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm30_lemma03(), x453)), t454), t455), @tactics.beta_tac), t456), @hol88.res_tac)
  let t448 = @simp.asm_rewrite_tac(@list.List([]))
  let t458 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), (x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm30_lemma02(), x447)), @hol88.res_tac), t448)
  let t446 = @simp.asm_rewrite_tac(@list.List([]))
  let t443 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES((p' : (A) -> Bool), (q' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t444 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(q' : (A) -> Bool) == False"))]))(t443))
  let t459 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t444), (x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_ensures.ensures_thm3(), x445)), t446), t458, t457])
  let t442 = @tactics.repeat_tac(@tactics.conj_tac)
  let t460 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t442), t459)
  leadsto_thm30_lemma04_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, (ENSURES(p', q', CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → q' == False → (∀ s : A, Not(p', s))) && (∀ r : (A) -> Bool, (r == False → (∀ s : A, Not(p', s))) && (q' == False → (∀ s : A, Not(r, s))) → q' == False → (∀ s : A, Not(p', s))) && (∀ P : ((A) -> Bool) -> Bool, p' == LUB(P) && (∀ p'' : (A) -> Bool, In(p'', P) → q' == False → (∀ s : A, Not(p'', s))) → q' == False → (∀ s : A, Not(p', s)))")), t460))
}

///|
let leadsto_thm30_lemma04_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma04")

///|
/// `LEADSTO_thm30_lemma04`
pub fn leadsto_thm30_lemma04() -> @kernel.Thm {
  leadsto_thm30_lemma04_c.get()
}

///|
/// LEADSTO_thm30_lemma05
fn step_70() -> Unit raise {
  leadsto_thm30_lemma05_c.set(@bool.gen_all(@bool.mp(@bool.spec_all(leadsto_thm30_lemma00()), leadsto_thm30_lemma04())))
}

///|
let leadsto_thm30_lemma05_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma05")

///|
/// `LEADSTO_thm30_lemma05`
pub fn leadsto_thm30_lemma05() -> @kernel.Thm {
  leadsto_thm30_lemma05_c.get()
}

///|
/// LEADSTO_thm30_lemma06
fn step_71() -> Unit raise {
  let t462 = @simp.asm_rewrite_tac(@list.List([]))
  let t461 = @tactics.exists_tac(@term_syntax.parse_term("(False : (A) -> Bool)"))
  let t463 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t461), t462)
  leadsto_thm30_lemma06_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, False, CONS(st, Pr)) → (∃ q : (A) -> Bool, q == False && LEADSTO(p, q, CONS(st, Pr)))")), t463))
}

///|
let leadsto_thm30_lemma06_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30_lemma06")

///|
/// `LEADSTO_thm30_lemma06`
pub fn leadsto_thm30_lemma06() -> @kernel.Thm {
  leadsto_thm30_lemma06_c.get()
}

///|
/// LEADSTO_thm30
fn step_72() -> Unit raise {
  let t465 = @simp.rewrite_tac(@list.List([@bool.undisch_all(@bool.spec_all(leadsto_thm30_lemma05()))]))
  let t466 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x464 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm30_lemma06(), x464)), t465)
  leadsto_thm30_c.set(@aux_definitions.prove_thm("LEADSTO_thm30", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, False, CONS(st, Pr)) → (∀ s : A, Not(p, s))"), t466))
}

///|
let leadsto_thm30_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm30")

///|
/// `LEADSTO_thm30`
pub fn leadsto_thm30() -> @kernel.Thm {
  leadsto_thm30_c.get()
}

///|
/// LEADSTO_cor1
fn step_73() -> Unit raise {
  let t472 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (b : (A) -> Bool)), op_slash_bslash_star(p, Not(b))), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t473 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@mk_state_logic.and_or_distr_lemma())), @mk_state_logic.p_or_not_p_lemma(), @mk_state_logic.and_true_lemma()]))(t472))
  let t467 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t468 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t469 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), Not((b : (A) -> Bool)))")
  let t470 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (b : (A) -> Bool))"), t469, t468, t467]), leadsto_thm4())
  let t474 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t470, x471)), t473)
  leadsto_cor1_c.set(@aux_definitions.prove_thm("LEADSTO_cor1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ b : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(op_slash_bslash_star(p, b), q, Pr) && LEADSTO(op_slash_bslash_star(p, Not(b)), q, Pr) → LEADSTO(p, q, Pr)"), t474))
}

///|
let leadsto_cor1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor1")

///|
/// `LEADSTO_cor1`
pub fn leadsto_cor1() -> @kernel.Thm {
  leadsto_cor1_c.get()
}

///|
/// LEADSTO_cor2
fn step_74() -> Unit raise {
  let t478 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), r), False), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t479 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_false_lemma()]))(t478))
  let t476 = @tactics.repeat_tac(@tactics.strip_tac)
  let t475 = @simp.rewrite_tac(@list.List([@mk_unless.stable()]))
  let t480 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t475), t476), (x477 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm29(), x477)), t479)
  leadsto_cor2_c.set(@aux_definitions.prove_thm("LEADSTO_cor2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && STABLE(r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, r), op_slash_bslash_star(q, r), CONS(st, Pr))"), t480))
}

///|
let leadsto_cor2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor2")

///|
/// `LEADSTO_cor2`
pub fn leadsto_cor2() -> @kernel.Thm {
  leadsto_cor2_c.get()
}

///|
/// LEADSTO_cor3
fn step_75() -> Unit raise {
  let t493 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t494 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t493]), @mk_state_logic.and_imply_weak_lemma())
  let t490 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t491 = @term_syntax.parse_term("(st : (A) -> A)")
  let t492 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t496 = @tactics.then_tac(@tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t492, t491, t490]), leadsto_thm25()), t494)), (x495 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_cor1(), x495))
  let t487 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_bslash_slash_star(False, q), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t488 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t487)
  let t489 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_false_lemma()]))(t488))
  let t485 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), op_bslash_slash_star(op_slash_bslash_star(q, Not(q)), q), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t486 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.p_and_not_p_lemma()]))(t485))
  let t482 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t483 = @bool.specl(@list.List([@term_syntax.parse_term("Not((q : (A) -> Bool))"), t482]), @mk_unless.unless_thm2())
  let t497 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.not_not_lemma()]))(t483)), (x484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm29(), x484)), t486), t489), t496])
  let t481 = @tactics.repeat_tac(@tactics.strip_tac)
  let t498 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t481), t497)
  leadsto_cor3_c.set(@aux_definitions.prove_thm("LEADSTO_cor3", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) == LEADSTO(op_slash_bslash_star(p, Not(q)), q, CONS(st, Pr))"), t498))
}

///|
let leadsto_cor3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor3")

///|
/// `LEADSTO_cor3`
pub fn leadsto_cor3() -> @kernel.Thm {
  leadsto_cor3_c.get()
}

///|
/// LEADSTO_cor4
fn step_76() -> Unit raise {
  let t501 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), Not((b : (A) -> Bool))), op_bslash_slash_star((q : (A) -> Bool), q), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t502 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t501))
  let t499 = @tactics.repeat_tac(@tactics.strip_tac)
  let t504 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@mk_state_logic.or_comm_lemma()])), t499), (x500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm28(), x500)), t502), (x503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_cor1(), x503))
  leadsto_cor4_c.set(@aux_definitions.prove_thm("LEADSTO_cor4", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ b : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(op_slash_bslash_star(p, b), q, CONS(st, Pr)) && LEADSTO(op_slash_bslash_star(p, Not(b)), op_bslash_slash_star(op_slash_bslash_star(p, b), q), CONS(st, Pr)) → LEADSTO(p, q, CONS(st, Pr))"), t504))
}

///|
let leadsto_cor4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor4")

///|
/// `LEADSTO_cor4`
pub fn leadsto_cor4() -> @kernel.Thm {
  leadsto_cor4_c.get()
}

///|
/// LEADSTO_cor5
fn step_77() -> Unit raise {
  let t517 = @term_syntax.parse_term("Not((q : (A) -> Bool))")
  let t518 = @bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t517]), @mk_state_logic.sym_or_imply_weak_lemma())
  let t516 = @term_syntax.parse_term("op_bslash_slash_star(Not((q : (A) -> Bool)), (r : (A) -> Bool))")
  let t519 = @tactics.assume_tac(@bool.mp(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t516]), leadsto_thm25())), t518))
  let t513 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), op_slash_bslash_star((q : (A) -> Bool), Not((r : (A) -> Bool)))), op_bslash_slash_star(False, r), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t514 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t513)
  let t515 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_false_lemma()]))(t514))
  let t511 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star(op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool)), Not((r : (A) -> Bool))), op_bslash_slash_star(op_slash_bslash_star(r, Not(r)), r), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t512 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.and_assoc_lemma(), @mk_state_logic.p_and_not_p_lemma()]))(t511))
  let t507 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t508 = @bool.specl(@list.List([@term_syntax.parse_term("Not((r : (A) -> Bool))"), t507]), @mk_unless.unless_thm2())
  let t509 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.not_not_lemma()]))(t508))
  let t506 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_or_and_not_lemma(), @mk_state_logic.not_not_lemma()]))
  let t505 = @simp.once_rewrite_tac(@list.List([leadsto_cor3()]))
  let t521 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t505), t506), t509), (x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm29(), x510)), t512), t515), t519), (x520 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x520))
  leadsto_cor5_c.set(@aux_definitions.prove_thm("LEADSTO_cor5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(op_slash_bslash_star(p, q), r, CONS(st, Pr)) → LEADSTO(p, op_bslash_slash_star(Not(q), r), CONS(st, Pr))"), t521))
}

///|
let leadsto_cor5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor5")

///|
/// `LEADSTO_cor5`
pub fn leadsto_cor5() -> @kernel.Thm {
  leadsto_cor5_c.get()
}

///|
/// LEADSTO_cor6
fn step_78() -> Unit raise {
  let t523 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), r), op_slash_bslash_star(q, r)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t524 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t523))
  let t525 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x522 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm29(), x522)), t524)
  leadsto_cor6_c.set(@aux_definitions.prove_thm("LEADSTO_cor6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && UNLESS(r, op_slash_bslash_star(q, r), CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, r), op_slash_bslash_star(q, r), CONS(st, Pr))"), t525))
}

///|
let leadsto_cor6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor6")

///|
/// `LEADSTO_cor6`
pub fn leadsto_cor6() -> @kernel.Thm {
  leadsto_cor6_c.get()
}

///|
/// LEADSTO_cor7
fn step_79() -> Unit raise {
  let t538 = @simp.asm_rewrite_tac(@list.List([]))
  let t537 = @tactics.repeat_tac(@tactics.strip_tac)
  let t536 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t535 = @simp.rewrite_tac(@list.List([@mk_state_logic.not_def1(), @mk_state_logic.and_def()]))
  let t534 = @tactics.mp_tac(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ s : A, Not(op_slash_bslash_star((r : (A) -> Bool), op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool)))), s)"))))
  let t530 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star(op_slash_bslash_star((p : (A) -> Bool), Not((q : (A) -> Bool))), (r : (A) -> Bool)), op_slash_bslash_star(False, r), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t531 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.and_comm_lemma()]))(t530)
  let t532 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.and_false_lemma()]))(t531))
  let t527 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), op_slash_bslash_star((r : (A) -> Bool), Not((q : (A) -> Bool)))), op_slash_bslash_star(q, op_slash_bslash_star(r, Not(q))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t528 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.and_and_comm_lemma()]))(t527)
  let t529 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@mk_state_logic.and_assoc_lemma())), @mk_state_logic.p_and_not_p_lemma()]))(t528))
  let t539 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), (x526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_cor2(), x526)), t529), t532), (x533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm30(), x533)), @tactics.gen_tac), t534), t535), @tactics.beta_tac), t536), t537), @hol88.res_tac), t538)
  leadsto_cor7_c.set(@aux_definitions.prove_thm("LEADSTO_cor7", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && STABLE(op_slash_bslash_star(r, Not(q)), CONS(st, Pr)) → (∀ s : A, op_slash_bslash_star(p, r, s) → q(s))"), t539))
}

///|
let leadsto_cor7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor7")

///|
/// `LEADSTO_cor7`
pub fn leadsto_cor7() -> @kernel.Thm {
  leadsto_cor7_c.get()
}

///|
/// LEADSTO_cor8
fn step_80() -> Unit raise {
  let t542 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t543 = @term_syntax.parse_term("(st : (A) -> A)")
  let t544 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t545 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t544, t543, t542]), leadsto_thm25())))
  let t540 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t541 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t540]), @mk_state_logic.sym_and_imply_weak_lemma()))
  let t547 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t541), t545), (x546 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x546))
  leadsto_cor8_c.set(@aux_definitions.prove_thm("LEADSTO_cor8", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, q), r, CONS(st, Pr))"), t547))
}

///|
let leadsto_cor8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor8")

///|
/// `LEADSTO_cor8`
pub fn leadsto_cor8() -> @kernel.Thm {
  leadsto_cor8_c.get()
}

///|
/// LEADSTO_cor9
fn step_81() -> Unit raise {
  let t549 = @tactics.assume_tac(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO((q : (A) -> Bool), (r : (A) -> Bool), CONS(st, Pr))"))))
  let t551 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm25(), x548)), t549), (x550 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x550))
  leadsto_cor9_c.set(@aux_definitions.prove_thm("LEADSTO_cor9", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && (∀ s : A, q(s) → r(s)) → LEADSTO(p, r, CONS(st, Pr))"), t551))
}

///|
let leadsto_cor9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor9")

///|
/// `LEADSTO_cor9`
pub fn leadsto_cor9() -> @kernel.Thm {
  leadsto_cor9_c.get()
}

///|
/// LEADSTO_cor10
fn step_82() -> Unit raise {
  let t555 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, LEADSTO((P : (Num, A) -> Bool)(i), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t556 = @bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t555)
  let t557 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_bslash_lt_eq_slash_star((P : (Num, A) -> Bool), (i : Num)), (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t556)
  let t552 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t553 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t554 = @term_syntax.parse_term("(P : (Num, A) -> Bool)(SUC((i : Num)))")
  let t558 = @tactics.accept_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_lt_eq_slash_star((P : (Num, A) -> Bool), (i : Num))"), t554, t553, t552]), leadsto_thm4()), t557))
  let t559 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.or_le_n_def()])), t558)
  let t560 = @list.List([@simp.asm_rewrite_tac(@list.List([@mk_state_logic.or_le_n_def()])), t559])
  let t561 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t560)
  leadsto_cor10_c.set(@aux_definitions.prove_thm("LEADSTO_cor10", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ i : Num, LEADSTO(P(i), q, Pr)) → (∀ i : Num, LEADSTO(op_bslash_lt_eq_slash_star(P, i), q, Pr))"), t561))
}

///|
let leadsto_cor10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor10")

///|
/// `LEADSTO_cor10`
pub fn leadsto_cor10() -> @kernel.Thm {
  leadsto_cor10_c.get()
}

///|
/// LEADSTO_cor11
fn step_83() -> Unit raise {
  let t565 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, CONS(st, Pr))) && (∀ r : (A) -> Bool, R(p, r, CONS(st, Pr)) && R(r, q, CONS(st, Pr)) → R(p, q, CONS(st, Pr))) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → R(p', q, CONS(st, Pr))) → R(p, q, CONS(st, Pr)))"))
  let t564 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t566 = @bool.conjunct1(@bool.specl(@list.List([@term_syntax.parse_term("(False : (A) -> Bool)"), t564]), t565))
  let t567 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@mk_ensures.ensures_cor6()]))(t566))
  let t563 = @tactics.repeat_tac(@tactics.strip_tac)
  let t562 = @simp.rewrite_tac(@list.List([leadsto(), leadstorel()]))
  let t568 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t562), t563), t567)
  leadsto_cor11_c.set(@aux_definitions.prove_thm("LEADSTO_cor11", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(False, p, CONS(st, Pr))"), t568))
}

///|
let leadsto_cor11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor11")

///|
/// `LEADSTO_cor11`
pub fn leadsto_cor11() -> @kernel.Thm {
  leadsto_cor11_c.get()
}

///|
/// LEADSTO_cor12
fn step_84() -> Unit raise {
  let t573 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, LEADSTO((P : (Num, A) -> Bool)(i), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t574 = @bool.spec(@term_syntax.parse_term("(i : Num)"), t573)
  let t575 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_bslash_lt_slash_star((P : (Num, A) -> Bool), (i : Num)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t574)
  let t570 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t571 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t572 = @term_syntax.parse_term("(P : (Num, A) -> Bool)((i : Num))")
  let t576 = @tactics.accept_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_lt_slash_star((P : (Num, A) -> Bool), (i : Num))"), t572, t571, t570]), leadsto_thm4()), t575))
  let t569 = @simp.asm_rewrite_tac(@list.List([@mk_state_logic.or_lt_n_def(), leadsto_cor11()]))
  let t577 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t569), t576)
  leadsto_cor12_c.set(@aux_definitions.prove_thm("LEADSTO_cor12", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ i : Num, LEADSTO(P(i), q, CONS(st, Pr))) → (∀ i : Num, LEADSTO(op_bslash_lt_slash_star(P, i), q, CONS(st, Pr)))"), t577))
}

///|
let leadsto_cor12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor12")

///|
/// `LEADSTO_cor12`
pub fn leadsto_cor12() -> @kernel.Thm {
  leadsto_cor12_c.get()
}

///|
/// LEADSTO2Fn
fn step_85() -> Unit raise {
  leadsto2fn_c.set(@pair.new_definition(@term_syntax.parse_term("(LEADSTO2Fn : (((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)((R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)) == ((p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => ENSURES(p, q, Pr) || (∃ r : (A) -> Bool, ENSURES(p, r, Pr) && R(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr))))")))
}

///|
let leadsto2fn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Fn")

///|
/// `LEADSTO2Fn`
pub fn leadsto2fn() -> @kernel.Thm {
  leadsto2fn_c.get()
}

///|
/// LEADSTO2
fn step_86() -> Unit raise {
  leadsto2_c.set(@pair.new_definition(@term_syntax.parse_term("(LEADSTO2 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A])) == (∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO2Fn(R, p, q, Pr) → R(p, q, Pr)) → R(p, q, Pr))")))
}

///|
let leadsto2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2")

///|
/// `LEADSTO2`
pub fn leadsto2() -> @kernel.Thm {
  leadsto2_c.get()
}

///|
/// LEADSTO2Imply_1
fn step_87() -> Unit raise {
  let t578 = @tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @tactics.repeat_tac(@tactics.strip_tac)), @hol88.res_tac)
  leadsto2imply_1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO2Fn(R, p, q, Pr) → R(p, q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ((p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => ∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO2Fn(R, p, q, Pr) → R(p, q, Pr)) → R(p, q, Pr))(p, q, Pr) → R(p, q, Pr))")), t578))
}

///|
let leadsto2imply_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Imply_1")

///|
/// `LEADSTO2Imply_1`
pub fn leadsto2imply_1() -> @kernel.Thm {
  leadsto2imply_1_c.get()
}

///|
/// IsMonoLEADSTO2
fn step_88() -> Unit raise {
  let t584 = @tactics.repeat_tac(@tactics.strip_tac)
  let t583 = @simp.asm_rewrite_tac(@list.List([]))
  let t582 = @tactics.exists_tac(@term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)"))
  let t585 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.disj2_tac), t582), t583), t584), @hol88.res_tac), @hol88.res_tac)
  let t581 = @simp.asm_rewrite_tac(@list.List([]))
  let t580 = @tactics.exists_tac(@term_syntax.parse_term("(r : (A) -> Bool)"))
  let t586 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@hol88.res_tac, @tactics.disj2_tac), @tactics.disj1_tac), t580), t581)
  let t587 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t586, t585])
  let t579 = @tactics.repeat_tac(@tactics.strip_tac)
  let t588 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto2fn()])), @tactics.beta_tac), t579), t587)
  ismonoleadsto2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R1 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ R2 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, R1(p, q, Pr) → R2(p, q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO2Fn(R1, p, q, Pr) → LEADSTO2Fn(R2, p, q, Pr))")), t588))
}

///|
let ismonoleadsto2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IsMonoLEADSTO2")

///|
/// `IsMonoLEADSTO2`
pub fn ismonoleadsto2() -> @kernel.Thm {
  ismonoleadsto2_c.get()
}

///|
/// LEADSTO2th
fn step_89() -> Unit raise {
  let t589 = @bool.spec_all(leadsto2())
  let t590 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(Pr : List[(A) -> A])"), t589))
  let t591 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(q : (A) -> Bool)"), t590))
  let t592 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(p : (A) -> Bool)"), t591))
  leadsto2th_c.set(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t592))
}

///|
let leadsto2th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2th")

///|
/// `LEADSTO2th`
pub fn leadsto2th() -> @kernel.Thm {
  leadsto2th_c.get()
}

///|
/// LEADSTO2Imply1
fn step_90() -> Unit raise {
  let t601 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2Fn((p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => ∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, LEADSTO2Fn(R, p', q', Pr) → R(p', q', Pr)) → R(p, q, Pr), (p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t599 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, LEADSTO2Fn((R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool), p', q', (Pr : List[(A) -> A])) → R(p', q', Pr)"))
  let t600 = @equal.beta_rule(@bool.mp(@bool.spec_all(leadsto2imply_1()), t599))
  let t598 = @term_syntax.parse_term("(R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)")
  let t602 = @tactics.assume_tac(@bool.mp(@bool.spec_all(@bool.mp(@equal.beta_rule(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => ∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, LEADSTO2Fn(R, p', q', Pr) → R(p', q', Pr)) → R(p, q, Pr)"), t598]), ismonoleadsto2()))), t600)), t601))
  let t597 = @tactics.repeat_tac(@tactics.strip_tac)
  let t596 = @simp.rewrite_tac(@list.List([leadsto2th()]))
  let t594 = @bool.spec_all(ismonoleadsto2())
  let t593 = @term_syntax.parse_term("(R2 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)")
  let t595 = @tactics.assume_tac(@bool.genl(@list.List([@term_syntax.parse_term("(R1 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)"), t593]), t594))
  let t603 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t595), t596), @tactics.beta_tac), t597), t602), @hol88.res_tac)
  leadsto2imply1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2Fn(LEADSTO2, p, q, Pr) → LEADSTO2(p, q, Pr)")), t603))
}

///|
let leadsto2imply1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Imply1")

///|
/// `LEADSTO2Imply1`
pub fn leadsto2imply1() -> @kernel.Thm {
  leadsto2imply1_c.get()
}

///|
/// LEADSTO2Imply2
fn step_91() -> Unit raise {
  let t611 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t612 = @equal.beta_rule(@simp.rewrite_rule(@list.List([leadsto2()]))(t611))
  let t613 = @tactics.accept_tac(@bool.undisch(@bool.gen_all(@bool.spec(@term_syntax.parse_term("(LEADSTO2Fn : (((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)((LEADSTO2 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool))"), t612))))
  let t607 = @bool.spec_all(leadsto2imply1())
  let t606 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t608 = @bool.genl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t606]), t607)
  let t604 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t605 = @term_syntax.parse_term("(LEADSTO2 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)")
  let t609 = @bool.mp(@equal.beta_rule(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO2Fn(LEADSTO2, p, q, Pr)"), t605, t604]), ismonoleadsto2())), t608)
  let t610 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t609))
  let t614 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t610), t613)
  leadsto2imply2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p, q, Pr) → LEADSTO2Fn(LEADSTO2, p, q, Pr)")), t614))
}

///|
let leadsto2imply2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Imply2")

///|
/// `LEADSTO2Imply2`
pub fn leadsto2imply2() -> @kernel.Thm {
  leadsto2imply2_c.get()
}

///|
/// LEADSTO2EQs
fn step_92() -> Unit raise {
  let t615 = @tactics.accept_tac(@bool.spec_all(leadsto2imply1()))
  let t616 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto2imply2())), t615])
  let t617 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t616)
  leadsto2eqs_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p, q, Pr) == LEADSTO2Fn(LEADSTO2, p, q, Pr)")), t617))
}

///|
let leadsto2eqs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2EQs")

///|
/// `LEADSTO2EQs`
pub fn leadsto2eqs() -> @kernel.Thm {
  leadsto2eqs_c.get()
}

///|
/// LEADSTO2EQ
fn step_93() -> Unit raise {
  let t618 = @bool.spec_all(leadsto2eqs())
  let t619 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(Pr : List[(A) -> A])"), t618))
  let t620 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(q : (A) -> Bool)"), t619))
  let t621 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(p : (A) -> Bool)"), t620))
  leadsto2eq_c.set(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t621))
}

///|
let leadsto2eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2EQ")

///|
/// `LEADSTO2EQ`
pub fn leadsto2eq() -> @kernel.Thm {
  leadsto2eq_c.get()
}

///|
/// LEADSTO2Thm1_1
fn step_94() -> Unit raise {
  let t623 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO2Fn((R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool), (p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))]))
  let t622 = @simp.once_rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool) == LEADSTO2Fn(R)"))]))
  let t624 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t622), t623)
  leadsto2thm1_1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, R == LEADSTO2Fn(R) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2Fn(R, p, q, Pr) → R(p, q, Pr))")), t624))
}

///|
let leadsto2thm1_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Thm1_1")

///|
/// `LEADSTO2Thm1_1`
pub fn leadsto2thm1_1() -> @kernel.Thm {
  leadsto2thm1_1_c.get()
}

///|
/// LEADSTO2MinFixThm
fn step_95() -> Unit raise {
  let t628 = @bool.spec_all(@bool.undisch(@bool.spec_all(leadsto2thm1_1())))
  let t627 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t629 = @tactics.assume_tac(@bool.genl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t627]), t628))
  let t626 = @tactics.assume_tac(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, LEADSTO2Fn(R, p', q', (Pr : List[(A) -> A])) → R(p', q', Pr)) → R((p : (A) -> Bool), (q : (A) -> Bool), Pr)"))))
  let t625 = @tactics.repeat_tac(@tactics.strip_tac)
  let t630 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto2()])), t625), t626), t629), @hol88.res_tac)
  leadsto2minfixthm_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, R == LEADSTO2Fn(R) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p, q, Pr) → R(p, q, Pr))")), t630))
}

///|
let leadsto2minfixthm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2MinFixThm")

///|
/// `LEADSTO2MinFixThm`
pub fn leadsto2minfixthm() -> @kernel.Thm {
  leadsto2minfixthm_c.get()
}

///|
/// LEADSTO2InductThm
fn step_96() -> Unit raise {
  let t634 = @bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2Fn((R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool), p, q, Pr) → R(p, q, Pr)")))
  let t633 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t635 = @tactics.assume_tac(@bool.genl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t633]), t634))
  let t632 = @tactics.repeat_tac(@tactics.strip_tac)
  let t631 = @simp.rewrite_tac(@list.List([leadsto2()]))
  let t636 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t631), t632), t635), @hol88.res_tac)
  leadsto2inductthm_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2Fn(R, p, q, Pr) → R(p, q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p, q, Pr) → R(p, q, Pr))")), t636))
}

///|
let leadsto2inductthm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2InductThm")

///|
/// `LEADSTO2InductThm`
pub fn leadsto2inductthm() -> @kernel.Thm {
  leadsto2inductthm_c.get()
}

///|
/// LEADSTO2Fam
fn step_97() -> Unit raise {
  leadsto2fam_c.set(@pair.new_definition(@term_syntax.parse_term("(LEADSTO2Fam : (((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, List[(A) -> A]) -> Bool)((R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool), (Pr : List[(A) -> A])) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → R(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr)) → R(LUB(P), q, Pr)))")))
}

///|
let leadsto2fam_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Fam")

///|
/// `LEADSTO2Fam`
pub fn leadsto2fam() -> @kernel.Thm {
  leadsto2fam_c.get()
}

///|
/// LEADSTO2Fn_EQ_LEADSTO2Fam
fn step_98() -> Unit raise {
  let t641 = @simp.asm_rewrite_tac(@list.List([]))
  let t639 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t640 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t639)
  let t642 = @list.List([@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([]))(t640)])), t641])
  let t638 = @tactics.repeat_tac(@tactics.strip_tac)
  let t637 = @tactics.repeat_tac(@tactics.gen_tac)
  let t643 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto2fam(), leadsto2fn()])), @tactics.beta_tac), t637), @tactics.eq_tac), t638), @hol88.res_tac), t642)
  leadsto2fn_eq_leadsto2fam_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO2Fn(R, p, q, Pr) → R(p, q, Pr)) == LEADSTO2Fam(R, Pr)")), t643))
}

///|
let leadsto2fn_eq_leadsto2fam_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2Fn_EQ_LEADSTO2Fam")

///|
/// `LEADSTO2Fn_EQ_LEADSTO2Fam`
pub fn leadsto2fn_eq_leadsto2fam() -> @kernel.Thm {
  leadsto2fn_eq_leadsto2fam_c.get()
}

///|
/// LEADSTO2_thm0
fn step_99() -> Unit raise {
  let t644 = @tactics.repeat_tac(@tactics.strip_tac)
  let t645 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto2(), leadsto2fn()])), @tactics.beta_tac), t644), @hol88.res_tac)
  leadsto2_thm0_c.set(@aux_definitions.prove_thm("LEADSTO2_thm0", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → LEADSTO2(p, q, Pr)"), t645))
}

///|
let leadsto2_thm0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm0")

///|
/// `LEADSTO2_thm0`
pub fn leadsto2_thm0() -> @kernel.Thm {
  leadsto2_thm0_c.get()
}

///|
/// LEADSTO2_thm1
fn step_100() -> Unit raise {
  let t646 = @tactics.repeat_tac(@tactics.strip_tac)
  let t647 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()])), t646), @hol88.res_tac), @hol88.res_tac)
  leadsto2_thm1_c.set(@aux_definitions.prove_thm("LEADSTO2_thm1", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) → LEADSTO2(p, q, Pr)"), t647))
}

///|
let leadsto2_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm1")

///|
/// `LEADSTO2_thm1`
pub fn leadsto2_thm1() -> @kernel.Thm {
  leadsto2_thm1_c.get()
}

///|
/// LEADSTO2_thm3_lemma1
fn step_101() -> Unit raise {
  let t648 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto2_thm3_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → R(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(LUB(P), q, Pr))) → R(p, (q : (A) -> Bool), Pr))) → (∀ p : (A) -> Bool, In(p, P) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(LUB(P), q, Pr))) → R(p, q, Pr))")), t648))
}

///|
let leadsto2_thm3_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm3_lemma1")

///|
/// `LEADSTO2_thm3_lemma1`
pub fn leadsto2_thm3_lemma1() -> @kernel.Thm {
  leadsto2_thm3_lemma1_c.get()
}

///|
/// LEADSTO2_thm3
fn step_102() -> Unit raise {
  let t651 = @bool.spec_all(@bool.undisch(@bool.spec_all(leadsto2_thm3_lemma1())))
  let t652 = @tactics.assume_tac(@bool.gen_all(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(LUB(P), q, Pr))"))]))(t651)))
  let t650 = @tactics.repeat_tac(@tactics.strip_tac)
  let t649 = @simp.rewrite_tac(@list.List([leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()]))
  let t653 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t649), t650), t652), @hol88.res_tac)
  leadsto2_thm3_c.set(@aux_definitions.prove_thm("LEADSTO2_thm3", @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) → LEADSTO2(LUB(P), q, Pr)"), t653))
}

///|
let leadsto2_thm3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm3")

///|
/// `LEADSTO2_thm3`
pub fn leadsto2_thm3() -> @kernel.Thm {
  leadsto2_thm3_c.get()
}

///|
/// LEADSTO2_thm3a
fn step_103() -> Unit raise {
  let t655 = @simp.asm_rewrite_tac(@list.List([]))
  let t656 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3(), x654)), t655)
  leadsto2_thm3a_c.set(@aux_definitions.prove_thm("LEADSTO2_thm3a", @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (p : (A) -> Bool) == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) → LEADSTO2(p, q, Pr)"), t656))
}

///|
let leadsto2_thm3a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm3a")

///|
/// `LEADSTO2_thm3a`
pub fn leadsto2_thm3a() -> @kernel.Thm {
  leadsto2_thm3a_c.get()
}

///|
/// LEADSTO2_thm4_lemma1a
fn step_104() -> Unit raise {
  let t662 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t663 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p2 : (A) -> Bool)"))]))(t662)]))
  let t661 = @kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool)((s : A))"))
  let t664 = @tactics.thenl(@tactics.strip_tac, @list.List([@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p1 : (A) -> Bool)"))]))(t661)])), t663]))
  let t659 = @simp.asm_rewrite_tac(@list.List([]))
  let t660 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p2 : (A) -> Bool)")), t659)
  let t658 = @simp.asm_rewrite_tac(@list.List([]))
  let t665 = @list.List([@tactics.thenl(@tactics.strip_tac, @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p1 : (A) -> Bool)")), t658), t660])), t664])
  let t657 = @simp.rewrite_tac(@list.List([lub(), @mk_state_logic.or_def()]))
  let t666 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t657), @tactics.beta_tac), @tactics.eq_tac), t665)
  leadsto2_thm4_lemma1a_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ s : A, op_bslash_slash_star(p1, p2, s) == LUB((p : (A) -> Bool) => p == p1 || p == p2, s)")), t666))
}

///|
let leadsto2_thm4_lemma1a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm4_lemma1a")

///|
/// `LEADSTO2_thm4_lemma1a`
pub fn leadsto2_thm4_lemma1a() -> @kernel.Thm {
  leadsto2_thm4_lemma1a_c.get()
}

///|
/// LEADSTO2_thm4_lemma1
fn step_105() -> Unit raise {
  let t667 = @bool.spec_all(leadsto2_thm4_lemma1a())
  let t668 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(s : A)"), t667))
  leadsto2_thm4_lemma1_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t668)))
}

///|
let leadsto2_thm4_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm4_lemma1")

///|
/// `LEADSTO2_thm4_lemma1`
pub fn leadsto2_thm4_lemma1() -> @kernel.Thm {
  leadsto2_thm4_lemma1_c.get()
}

///|
/// LEADSTO2_thm4_lemma2
fn step_106() -> Unit raise {
  let t669 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto2_thm4_lemma2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ENSURES(p', q', Pr) || (∃ r : (A) -> Bool, ENSURES(p', r, Pr) && R(r, q', Pr)) || (∃ P : ((A) -> Bool) -> Bool, p' == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → R(p, q', Pr))) → R(p', q', Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr)) → R(p, q, Pr))")), t669))
}

///|
let leadsto2_thm4_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm4_lemma2")

///|
/// `LEADSTO2_thm4_lemma2`
pub fn leadsto2_thm4_lemma2() -> @kernel.Thm {
  leadsto2_thm4_lemma2_c.get()
}

///|
/// LEADSTO2_thm4_lemma3
fn step_107() -> Unit raise {
  let t670 = @simp.asm_rewrite_tac(@list.List([]))
  let t671 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t670])
  let t672 = @tactics.thenl(@tactics.then_tac(@tactics.beta_tac, @tactics.repeat_tac(@tactics.strip_tac)), t671)
  leadsto2_thm4_lemma3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ∀ Pr : List[(A) -> A], R(p1, q, Pr) → R(p2, q, Pr) → (∀ p : (A) -> Bool, ((p : (A) -> Bool) => p == p1 || p == p2)(p) → R(p, q, Pr))")), t672))
}

///|
let leadsto2_thm4_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm4_lemma3")

///|
/// `LEADSTO2_thm4_lemma3`
pub fn leadsto2_thm4_lemma3() -> @kernel.Thm {
  leadsto2_thm4_lemma3_c.get()
}

///|
/// LEADSTO2_thm4_lemma4
fn step_108() -> Unit raise {
  let t677 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, P(p) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, (Pr : List[(A) -> A]))) → R(p, q, Pr)"))
  let t675 = @term_syntax.parse_term("(p : (A) -> Bool) => p == (p1 : (A) -> Bool) || p == (p2 : (A) -> Bool)")
  let t676 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t678 = @bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p1 : (A) -> Bool), (p2 : (A) -> Bool))"), t676, t675]), t677)
  let t674 = @bool.undisch_all(@bool.spec_all(leadsto2_thm4_lemma3()))
  let t679 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto2_thm4_lemma1())), t674]))(t678))
  let t673 = @tactics.repeat_tac(@tactics.strip_tac)
  let t680 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([in_()])), t673), t679)
  leadsto2_thm4_lemma4_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], R(p1, q, Pr) → R(p2, q, Pr) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr)) → R(p, q, Pr)) → R(op_bslash_slash_star(p1, p2), q, Pr)")), t680))
}

///|
let leadsto2_thm4_lemma4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm4_lemma4")

///|
/// `LEADSTO2_thm4_lemma4`
pub fn leadsto2_thm4_lemma4() -> @kernel.Thm {
  leadsto2_thm4_lemma4_c.get()
}

///|
/// LEADSTO2_thm4
fn step_109() -> Unit raise {
  let t683 = @tactics.accept_tac(@bool.undisch_all(@bool.spec_all(leadsto2_thm4_lemma4())))
  let t682 = @tactics.assume_tac(@bool.undisch(@bool.spec_all(leadsto2_thm4_lemma2())))
  let t681 = @tactics.repeat_tac(@tactics.strip_tac)
  let t684 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto2(), leadsto2fn()])), @tactics.beta_tac), t681), @hol88.res_tac), t682), t683)
  leadsto2_thm4_c.set(@aux_definitions.prove_thm("LEADSTO2_thm4", @term_syntax.parse_term("∀ p1 : (A) -> Bool, ∀ p2 : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p1, q, Pr) && LEADSTO2(p2, q, Pr) → LEADSTO2(op_bslash_slash_star(p1, p2), q, Pr)"), t684))
}

///|
let leadsto2_thm4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm4")

///|
/// `LEADSTO2_thm4`
pub fn leadsto2_thm4() -> @kernel.Thm {
  leadsto2_thm4_c.get()
}

///|
/// LEADSTO2_thm8
fn step_110() -> Unit raise {
  let t686 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t687 = @simp.rewrite_rule(@list.List([leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()]))(t686)
  let t688 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t687))
  let t689 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@theorems.conj_assoc()))]))(t688))
  let t685 = @tactics.repeat_tac(@tactics.disch_tac)
  let t690 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t685), t689), @hol88.res_tac)
  leadsto2_thm8_c.set(@aux_definitions.prove_thm("LEADSTO2_thm8", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr))) → LEADSTO2(p, q, Pr) → X(p, q, Pr)"), t690))
}

///|
let leadsto2_thm8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm8")

///|
/// `LEADSTO2_thm8`
pub fn leadsto2_thm8() -> @kernel.Thm {
  leadsto2_thm8_c.get()
}

///|
/// LEADSTO2_thm2a
fn step_111() -> Unit raise {
  let t691 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t692 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t693 = @term_syntax.parse_term("(p : (A) -> Bool)")
  leadsto2_thm2a_c.set(@equal.beta_rule(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => ∀ r : (A) -> Bool, LEADSTO2(q, r, Pr) → LEADSTO2(p, r, Pr)"), t693, t692, t691]), leadsto2_thm8())))
}

///|
let leadsto2_thm2a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2a")

///|
/// `LEADSTO2_thm2a`
pub fn leadsto2_thm2a() -> @kernel.Thm {
  leadsto2_thm2a_c.get()
}

///|
/// LEADSTO2_thm2b
fn step_112() -> Unit raise {
  let t695 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x694))
  leadsto2_thm2b_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ENSURES(p', q', (Pr : List[(A) -> A])) → (∀ r : (A) -> Bool, LEADSTO2(q', r, Pr) → LEADSTO2(p', r, Pr))")), t695))
}

///|
let leadsto2_thm2b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2b")

///|
/// `LEADSTO2_thm2b`
pub fn leadsto2_thm2b() -> @kernel.Thm {
  leadsto2_thm2b_c.get()
}

///|
/// LEADSTO2_thm2c
fn step_113() -> Unit raise {
  let t697 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), (x696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x696))
  leadsto2_thm2c_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, ENSURES(p', r, (Pr : List[(A) -> A])) && (∀ r' : (A) -> Bool, LEADSTO2(q', r', Pr) → LEADSTO2(r, r', Pr)) → (∀ r : (A) -> Bool, LEADSTO2(q', r, Pr) → LEADSTO2(p', r, Pr))")), t697))
}

///|
let leadsto2_thm2c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2c")

///|
/// `LEADSTO2_thm2c`
pub fn leadsto2_thm2c() -> @kernel.Thm {
  leadsto2_thm2c_c.get()
}

///|
/// LEADSTO2_thm2d_lemma1
fn step_114() -> Unit raise {
  let t698 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto2_thm2d_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(q', r, Pr) → (∀ p'' : (A) -> Bool, In(p'', (P : ((A) -> Bool) -> Bool)) → (∀ r : (A) -> Bool, LEADSTO2(q', r, Pr) → LEADSTO2(p'', r, Pr))) → (∀ p'' : (A) -> Bool, In(p'', P) → LEADSTO2(p'', r, Pr))")), t698))
}

///|
let leadsto2_thm2d_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2d_lemma1")

///|
/// `LEADSTO2_thm2d_lemma1`
pub fn leadsto2_thm2d_lemma1() -> @kernel.Thm {
  leadsto2_thm2d_lemma1_c.get()
}

///|
/// LEADSTO2_thm2d
fn step_115() -> Unit raise {
  let t701 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x699 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm2d_lemma1(), x699)), (x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3(), x700))
  leadsto2_thm2d_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, (∀ p'' : (A) -> Bool, In(p'', P) → (∀ r : (A) -> Bool, LEADSTO2(q', r, (Pr : List[(A) -> A])) → LEADSTO2(p'', r, Pr))) → (∀ r : (A) -> Bool, LEADSTO2(q', r, Pr) → LEADSTO2(LUB(P), r, Pr))")), t701))
}

///|
let leadsto2_thm2d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2d")

///|
/// `LEADSTO2_thm2d`
pub fn leadsto2_thm2d() -> @kernel.Thm {
  leadsto2_thm2d_c.get()
}

///|
/// LEADSTO2_thm2e
fn step_116() -> Unit raise {
  leadsto2_thm2e_c.set(@simp.rewrite_rule(@list.List([leadsto2_thm2b(), leadsto2_thm2c(), leadsto2_thm2d()]))(leadsto2_thm2a()))
}

///|
let leadsto2_thm2e_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2e")

///|
/// `LEADSTO2_thm2e`
pub fn leadsto2_thm2e() -> @kernel.Thm {
  leadsto2_thm2e_c.get()
}

///|
/// LEADSTO2_thm2
fn step_117() -> Unit raise {
  let t703 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm2e(), x702))
  leadsto2_thm2_c.set(@aux_definitions.prove_thm("LEADSTO2_thm2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p, r, Pr) && LEADSTO2(r, q, Pr) → LEADSTO2(p, q, Pr)"), t703))
}

///|
let leadsto2_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm2")

///|
/// `LEADSTO2_thm2`
pub fn leadsto2_thm2() -> @kernel.Thm {
  leadsto2_thm2_c.get()
}

///|
/// LEADSTO2_thm5
fn step_118() -> Unit raise {
  let t711 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t712 = @tactics.accept_tac(@simp.once_rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t711))
  let t710 = @tactics.repeat_tac(@tactics.strip_tac)
  let t713 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()])), t710), t712)
  let t714 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t713])
  let t709 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t708 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t715 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.disj2_tac), @tactics.disj2_tac), t708), t709), @tactics.beta_tac), @tactics.conj_tac), t714)
  let t706 = @tactics.then_tac((x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3(), x705), @simp.asm_rewrite_tac(@list.List([])))
  let t707 = @list.List([@tactics.accept_tac(@bool.undisch(@bool.spec_all(leadsto2_thm0()))), (x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm2(), x704), t706])
  let t716 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t707), t715])
  let t717 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t716)
  leadsto2_thm5_c.set(@aux_definitions.prove_thm("LEADSTO2_thm5", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∃ r : (A) -> Bool, LEADSTO2(p, r, Pr) && LEADSTO2(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)))) == LEADSTO2(p, q, Pr)"), t717))
}

///|
let leadsto2_thm5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm5")

///|
/// `LEADSTO2_thm5`
pub fn leadsto2_thm5() -> @kernel.Thm {
  leadsto2_thm5_c.get()
}

///|
/// LEADSTO2_thm6
fn step_119() -> Unit raise {
  let t725 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t726 = @tactics.accept_tac(@simp.once_rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : (A) -> Bool) == (p' : (A) -> Bool)"))]))(t725))
  let t724 = @tactics.repeat_tac(@tactics.strip_tac)
  let t727 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto_thm5_lemma3()])), t724), t726)
  let t728 = @list.List([@tactics.accept_tac(@bool.spec_all(leadsto_thm5_lemma2())), t727])
  let t723 = @simp.rewrite_tac(@list.List([lub(), in_()]))
  let t722 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool) => if (p : (A) -> Bool) == p' { true } else { false }"))
  let t729 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.disj2_tac), @tactics.disj2_tac), t722), t723), @tactics.beta_tac), @tactics.conj_tac), t728)
  let t720 = @tactics.then_tac((x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3(), x719), @simp.asm_rewrite_tac(@list.List([])))
  let t721 = @list.List([@tactics.accept_tac(@bool.undisch(@bool.spec_all(leadsto2_thm0()))), (x718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x718), t720])
  let t730 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t721), t729])
  let t731 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t730)
  leadsto2_thm6_c.set(@aux_definitions.prove_thm("LEADSTO2_thm6", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (ENSURES(p, q, Pr) || (∃ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr)) || (∃ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)))) == LEADSTO2(p, q, Pr)"), t731))
}

///|
let leadsto2_thm6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm6")

///|
/// `LEADSTO2_thm6`
pub fn leadsto2_thm6() -> @kernel.Thm {
  leadsto2_thm6_c.get()
}

///|
/// LEADSTO2_thm7_lemma01
fn step_120() -> Unit raise {
  let t732 = @tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), @hol88.res_tac)
  leadsto2_thm7_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO2(p', q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p', q, Pr))) == ((∀ p' : (A) -> Bool, In(p', P) → LEADSTO2(p', q, Pr)) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO2(p', q, Pr) → X(p', q, Pr)))")), t732))
}

///|
let leadsto2_thm7_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm7_lemma01")

///|
/// `LEADSTO2_thm7_lemma01`
pub fn leadsto2_thm7_lemma01() -> @kernel.Thm {
  leadsto2_thm7_lemma01_c.get()
}

///|
/// LEADSTO2_thm7_lemma
fn step_121() -> Unit raise {
  let t739 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"))
  let t740 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t739)
  let t741 = @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(leadsto2_thm7_lemma01())]))(t740)), @hol88.res_tac)
  let t738 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO2(p', q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p', q, Pr))"))
  let t742 = @tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([leadsto2_thm7_lemma01()]))(t738)), @hol88.res_tac)
  let t736 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO2(p', q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p', q, Pr))"))
  let t743 = @list.List([(x734 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm0(), x734), @hol88.res_tac, (x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x735), @hol88.res_tac, @tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([leadsto2_thm7_lemma01()]))(t736)), (x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3(), x737)), t742, @hol88.res_tac, @hol88.res_tac, t741])
  let t733 = @tactics.repeat_tac(@tactics.strip_tac)
  let t744 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t733), t743)
  leadsto2_thm7_lemma_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && (LEADSTO2(r, q, Pr) → X(r, q, Pr)) → LEADSTO2(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr) → X(p, q, Pr)) → LEADSTO2(LUB(P), q, Pr) → X(LUB(P), q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → X(p, q, Pr))) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && (LEADSTO2(r, q, Pr) → X(r, q, Pr)) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → X(p, q, Pr))) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → LEADSTO2(p', q, Pr) && (LEADSTO2(p', q, Pr) → X(p', q, Pr))) → LEADSTO2(LUB(P), q, Pr) && (LEADSTO2(LUB(P), q, Pr) → X(LUB(P), q, Pr))))")), t744))
}

///|
let leadsto2_thm7_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm7_lemma")

///|
/// `LEADSTO2_thm7_lemma`
pub fn leadsto2_thm7_lemma() -> @kernel.Thm {
  leadsto2_thm7_lemma_c.get()
}

///|
/// LEADSTO2_thm7
fn step_122() -> Unit raise {
  let t746 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t747 = @simp.rewrite_rule(@list.List([leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()]))(t746)
  let t748 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr))"), t747))
  let t749 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto2_thm7_lemma()))]))(t748))
  let t745 = @tactics.repeat_tac(@tactics.disch_tac)
  let t750 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t745), t749), @hol88.res_tac)
  leadsto2_thm7_c.set(@aux_definitions.prove_thm("LEADSTO2_thm7", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && (LEADSTO2(r, q, Pr) → X(r, q, Pr)) → LEADSTO2(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr) → X(p, q, Pr)) → LEADSTO2(LUB(P), q, Pr) → X(LUB(P), q, Pr))) → LEADSTO2(p, q, Pr) → X(p, q, Pr)"), t750))
}

///|
let leadsto2_thm7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO2_thm7")

///|
/// `LEADSTO2_thm7`
pub fn leadsto2_thm7() -> @kernel.Thm {
  leadsto2_thm7_c.get()
}

///|
/// LEADSTO_EQ_LEADSTO2a
fn step_123() -> Unit raise {
  let t751 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto_eq_leadsto2a_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → R(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr)) → R(LUB(P), q, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → R(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → R(p, q, Pr)) → R(LUB(P), q, Pr)))")), t751))
}

///|
let leadsto_eq_leadsto2a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_EQ_LEADSTO2a")

///|
/// `LEADSTO_EQ_LEADSTO2a`
pub fn leadsto_eq_leadsto2a() -> @kernel.Thm {
  leadsto_eq_leadsto2a_c.get()
}

///|
/// LEADSTO_EQ_LEADSTO2b_lemma
fn step_124() -> Unit raise {
  let t752 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t753 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t752)
  let t754 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t753))
  let t755 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t754)
  leadsto_eq_leadsto2b_lemma_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (R : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(p, q, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → R(p, q, Pr)) && (∀ r : (A) -> Bool, R(p, r, Pr) && R(r, q, Pr) → R(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → R(p', q, Pr)) → R(LUB(P), q, Pr)))")), t755))
}

///|
let leadsto_eq_leadsto2b_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_EQ_LEADSTO2b_lemma")

///|
/// `LEADSTO_EQ_LEADSTO2b_lemma`
pub fn leadsto_eq_leadsto2b_lemma() -> @kernel.Thm {
  leadsto_eq_leadsto2b_lemma_c.get()
}

///|
/// LEADSTO_EQ_LEADSTO2b
fn step_125() -> Unit raise {
  let t758 = @tactics.assume_tac(@bool.undisch(@bool.spec_all(leadsto_eq_leadsto2a())))
  let t757 = @tactics.assume_tac(@bool.undisch(@bool.spec_all(leadsto_eq_leadsto2b_lemma())))
  let t756 = @tactics.repeat_tac(@tactics.strip_tac)
  let t759 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto(), leadstorel(), leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()])), t756), t757), t758), @hol88.res_tac)
  leadsto_eq_leadsto2b_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO2(p, q, Pr) → LEADSTO(p, q, Pr)")), t759))
}

///|
let leadsto_eq_leadsto2b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_EQ_LEADSTO2b")

///|
/// `LEADSTO_EQ_LEADSTO2b`
pub fn leadsto_eq_leadsto2b() -> @kernel.Thm {
  leadsto_eq_leadsto2b_c.get()
}

///|
/// LEADSTO_EQ_LEADSTO2c
fn step_126() -> Unit raise {
  let t760 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t761 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t762 = @term_syntax.parse_term("(p : (A) -> Bool)")
  leadsto_eq_leadsto2c_c.set(@bool.specl(@list.List([@term_syntax.parse_term("(LEADSTO2 : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)"), t762, t761, t760]), leadsto_thm21()))
}

///|
let leadsto_eq_leadsto2c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_EQ_LEADSTO2c")

///|
/// `LEADSTO_EQ_LEADSTO2c`
pub fn leadsto_eq_leadsto2c() -> @kernel.Thm {
  leadsto_eq_leadsto2c_c.get()
}

///|
/// LEADSTO_EQ_LEADSTO2d
fn step_127() -> Unit raise {
  leadsto_eq_leadsto2d_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([leadsto2_thm0(), leadsto2_thm2(), leadsto2_thm3a()]))(leadsto_eq_leadsto2c())))
}

///|
let leadsto_eq_leadsto2d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_EQ_LEADSTO2d")

///|
/// `LEADSTO_EQ_LEADSTO2d`
pub fn leadsto_eq_leadsto2d() -> @kernel.Thm {
  leadsto_eq_leadsto2d_c.get()
}

///|
/// LEADSTO_EQ_LEADSTO2
fn step_128() -> Unit raise {
  let t763 = @simp.rewrite_tac(@list.List([leadsto_eq_leadsto2b()]))
  let t764 = @list.List([@simp.rewrite_tac(@list.List([leadsto_eq_leadsto2d()])), t763])
  let t765 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t764)
  leadsto_eq_leadsto2_c.set(@aux_definitions.prove_thm("LEADSTO_EQ_LEADSTO2", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) == LEADSTO2(p, q, Pr)"), t765))
}

///|
let leadsto_eq_leadsto2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_EQ_LEADSTO2")

///|
/// `LEADSTO_EQ_LEADSTO2`
pub fn leadsto_eq_leadsto2() -> @kernel.Thm {
  leadsto_eq_leadsto2_c.get()
}

///|
/// LEADSTO_thm31
fn step_129() -> Unit raise {
  let t766 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_eq_leadsto2()))]))(leadsto2_thm8()))
  leadsto_thm31_c.set(@aux_definitions.prove_thm("LEADSTO_thm31", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr))) → LEADSTO(p, q, Pr) → X(p, q, Pr)"), t766))
}

///|
let leadsto_thm31_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm31")

///|
/// `LEADSTO_thm31`
pub fn leadsto_thm31() -> @kernel.Thm {
  leadsto_thm31_c.get()
}

///|
/// LEADSTO_thm32
fn step_130() -> Unit raise {
  let t769 = @bool.spec_all(leadsto_thm31())
  let t767 = @kernel.assume_rule(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → X(LUB(P), q, Pr)"))
  let t768 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(r, q, Pr) → X(p, q, Pr)"))
  let t770 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t768, t767]))(t769))
  let t771 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t770), @hol88.res_tac)
  leadsto_thm32_c.set(@aux_definitions.prove_thm("LEADSTO_thm32", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t771))
}

///|
let leadsto_thm32_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm32")

///|
/// `LEADSTO_thm32`
pub fn leadsto_thm32() -> @kernel.Thm {
  leadsto_thm32_c.get()
}

///|
/// LEADSTO_thm33
fn step_131() -> Unit raise {
  let t772 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_eq_leadsto2()))]))(leadsto2_thm7()))
  leadsto_thm33_c.set(@aux_definitions.prove_thm("LEADSTO_thm33", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))) → LEADSTO(p, q, Pr) → X(p, q, Pr)"), t772))
}

///|
let leadsto_thm33_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm33")

///|
/// `LEADSTO_thm33`
pub fn leadsto_thm33() -> @kernel.Thm {
  leadsto_thm33_c.get()
}

///|
/// LEADSTO_thm34
fn step_132() -> Unit raise {
  let t775 = @bool.spec_all(leadsto_thm33())
  let t773 = @kernel.assume_rule(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)"))
  let t774 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)"))
  let t776 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t774, t773]))(t775))
  let t777 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t776), @hol88.res_tac)
  leadsto_thm34_c.set(@aux_definitions.prove_thm("LEADSTO_thm34", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t777))
}

///|
let leadsto_thm34_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34")

///|
/// `LEADSTO_thm34`
pub fn leadsto_thm34() -> @kernel.Thm {
  leadsto_thm34_c.get()
}

///|
/// LEADSTO_thm34a_lemma1
fn step_133() -> Unit raise {
  let t778 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), @hol88.res_tac)
  leadsto_thm34a_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr))")), t778))
}

///|
let leadsto_thm34a_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34a_lemma1")

///|
/// `LEADSTO_thm34a_lemma1`
pub fn leadsto_thm34a_lemma1() -> @kernel.Thm {
  leadsto_thm34a_lemma1_c.get()
}

///|
/// LEADSTO_thm34a_lemma2
fn step_134() -> Unit raise {
  let t779 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto_thm34a_lemma2_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) → (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr))")), t779))
}

///|
let leadsto_thm34a_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34a_lemma2")

///|
/// `LEADSTO_thm34a_lemma2`
pub fn leadsto_thm34a_lemma2() -> @kernel.Thm {
  leadsto_thm34a_lemma2_c.get()
}

///|
/// LEADSTO_thm34a_lemma3
fn step_135() -> Unit raise {
  let t788 = @bool.spec_all(@bool.conjunct2(@bool.conjunct2(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))"))))))
  let t786 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(LUB((P : ((A) -> Bool) -> Bool)), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t787 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"))
  let t789 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t787, t786]))(t788))
  let t790 = @tactics.then_tac(@tactics.then_tac((x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x785), @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(leadsto_thm34a_lemma2())))), t789)
  let t784 = @bool.spec_all(@bool.conjunct1(@bool.conjunct2(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr))"))))))
  let t781 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t782 = @kernel.assume_rule(@term_syntax.parse_term("(X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)((r : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t783 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((r : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t791 = @tactics.then_tac((x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2(), x780), @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (r : (A) -> Bool), (Pr : List[(A) -> A]))")), t783, t782, t781]))(t784)))
  let t792 = @list.List([@hol88.res_tac, @hol88.res_tac, @tactics.then_tac(@tactics.assume_tac(@bool.undisch_all(@bool.spec_all(leadsto_thm34a_lemma1()))), @hol88.res_tac), @hol88.res_tac, t791, t790])
  let t793 = @tactics.thenl(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), t792)
  leadsto_thm34a_lemma3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("((∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, q, (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (LEADSTO(r, q, Pr) → X(r, q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr) → X(p, q, Pr)) → LEADSTO(LUB(P), q, Pr) → X(LUB(P), q, Pr)))")), t793))
}

///|
let leadsto_thm34a_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34a_lemma3")

///|
/// `LEADSTO_thm34a_lemma3`
pub fn leadsto_thm34a_lemma3() -> @kernel.Thm {
  leadsto_thm34a_lemma3_c.get()
}

///|
/// LEADSTO_thm34a
fn step_136() -> Unit raise {
  let t797 = @bool.spec_all(leadsto_thm33())
  let t798 = @simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm34a_lemma3()))]))(t797)
  let t795 = @kernel.assume_rule(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, (Pr : List[(A) -> A]))) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → X(LUB(P), q, Pr)"))
  let t796 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, r, (Pr : List[(A) -> A])) && LEADSTO(r, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(r, q, Pr) → X(p, q, Pr)"))
  let t799 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, q, (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t796, t795]))(t798))
  let t794 = @tactics.repeat_tac(@tactics.gen_tac)
  let t800 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t794), t799)
  leadsto_thm34a_c.set(@aux_definitions.prove_thm("LEADSTO_thm34a", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO(p, q, Pr) → X(p, q, Pr))"), t800))
}

///|
let leadsto_thm34a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34a")

///|
/// `LEADSTO_thm34a`
pub fn leadsto_thm34a() -> @kernel.Thm {
  leadsto_thm34a_c.get()
}

///|
/// LEADSTO_thm34b
fn step_137() -> Unit raise {
  let t803 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t804 = @bool.specl(@list.List([@term_syntax.parse_term("(X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)"), t803]), leadsto_thm34a())
  let t801 = @kernel.assume_rule(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, CONS(st, Pr))) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, CONS(st, Pr))) → X(LUB(P), q, CONS(st, Pr))"))
  let t802 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(p, r, CONS(st, Pr)) && LEADSTO(r, q, CONS(st, Pr)) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(r, q, CONS(st, Pr)) → X(p, q, CONS(st, Pr))"))
  let t805 = @bool.spec_all(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(p, q, CONS(st, Pr)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, CONS(st, Pr))")), t802, t801]))(t804))
  let t806 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))]))(t805))
  let t807 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t806)
  leadsto_thm34b_c.set(@aux_definitions.prove_thm("LEADSTO_thm34b", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(p, q, CONS(st, Pr)) → X(p, q, CONS(st, Pr))) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(p, r, CONS(st, Pr)) && LEADSTO(r, q, CONS(st, Pr)) && X(r, q, CONS(st, Pr)) → X(p, q, CONS(st, Pr))) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, CONS(st, Pr))) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, CONS(st, Pr))) → X(LUB(P), q, CONS(st, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) → X(p, q, CONS(st, Pr)))"), t807))
}

///|
let leadsto_thm34b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34b")

///|
/// `LEADSTO_thm34b`
pub fn leadsto_thm34b() -> @kernel.Thm {
  leadsto_thm34b_c.get()
}

///|
/// LEADSTO_thm34a_lemma00
fn step_138() -> Unit raise {
  let t808 = @bool.spec_all(leadsto_thm34a())
  let t810 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t808, x809))
  leadsto_thm34a_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(LUB(P), q, Pr)) → LEADSTO(p, q, Pr) → X(p, q, Pr)")), t810))
}

///|
let leadsto_thm34a_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34a_lemma00")

///|
/// `LEADSTO_thm34a_lemma00`
pub fn leadsto_thm34a_lemma00() -> @kernel.Thm {
  leadsto_thm34a_lemma00_c.get()
}

///|
/// LEADSTO_thm34a_lemma01
fn step_139() -> Unit raise {
  let t815 = @term_syntax.parse_term("(X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)")
  let t816 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t817 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t818 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t817, t816, t815]), leadsto_thm34a_lemma00())
  let t811 = @term_syntax.parse_term("(X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)")
  let t812 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t813 = @term_syntax.parse_term("(st : (A) -> A)")
  let t814 = @term_syntax.parse_term("(q : (A) -> Bool)")
  leadsto_thm34a_lemma01_c.set(@bool.genl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t814, t813, t812, t811]), t818))
}

///|
let leadsto_thm34a_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm34a_lemma01")

///|
/// `LEADSTO_thm34a_lemma01`
pub fn leadsto_thm34a_lemma01() -> @kernel.Thm {
  leadsto_thm34a_lemma01_c.get()
}

///|
/// LEADSTO_thm35_lemma00
fn step_140() -> Unit raise {
  let t882 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (q' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), q'), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t883 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool)), op_slash_bslash_star(p, q')), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t882)
  let t877 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t878 = @term_syntax.parse_term("(st : (A) -> A)")
  let t879 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r : (A) -> Bool))")
  let t880 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (q' : (A) -> Bool))")
  let t881 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool))")
  let t884 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t881, t880, t879, t878, t877]), leadsto_thm28()), t883)
  let t885 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_or_comm_lemma()]))(t884)
  let t886 = @simp.rewrite_rule(@list.List([@mk_state_logic.or_assoc_lemma()]))(t885)
  let t887 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t886)
  let t888 = @simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@mk_state_logic.or_assoc_lemma()))]))(t887)
  let t889 = @simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t888)
  let t890 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_and_comm_lemma()]))(t889)
  let t891 = @simp.rewrite_rule(@list.List([@mk_state_logic.or_assoc_lemma()]))(t890)
  let t892 = @simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t891)
  let t893 = @tactics.accept_tac(@simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t892))
  let t872 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), op_bslash_slash_star(p, (q : (A) -> Bool))), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t873 = @simp.rewrite_rule(@list.List([@mk_state_logic.and_or_distr_lemma()]))(t872)
  let t874 = @simp.rewrite_rule(@list.List([@mk_state_logic.or_assoc_lemma()]))(t873)
  let t871 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool))")
  let t875 = @simp.once_rewrite_rule(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((q' : (A) -> Bool), (p : (A) -> Bool))"), t871]), @mk_state_logic.or_comm_lemma())]))(t874)
  let t869 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t870 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t876 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool))"), t870, t869]), @mk_state_logic.or_and_comm_lemma())]))(t875))
  let t866 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((q' : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t865 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t863 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t864 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t867 = @bool.conj(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t864, t863]), leadsto_thm0()), t865), t866)
  let t858 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t859 = @term_syntax.parse_term("(st : (A) -> A)")
  let t860 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t861 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t862 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t868 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t862, t861, t860, t859, t858]), leadsto_thm29()), t867))
  let t855 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p' : (A) -> Bool), op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))), op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), op_bslash_slash_star(p, q)), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t856 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_slash_bslash_star(p', op_bslash_slash_star(p, (q : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t855)
  let t852 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t853 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))), (r : (A) -> Bool))")
  let t854 = @term_syntax.parse_term("op_slash_bslash_star((p' : (A) -> Bool), op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)))")
  let t857 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t854, t853, t852]), leadsto_thm1()), t856))
  let t849 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool), s) → op_slash_bslash_star(op_bslash_slash_star(p, (q : (A) -> Bool)), p', s)"))
  let t848 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t850 = @simp.once_rewrite_rule(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))"), t848]), @mk_state_logic.and_comm_lemma())]))(t849)
  let t845 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t846 = @term_syntax.parse_term("(st : (A) -> A)")
  let t847 = @term_syntax.parse_term("op_slash_bslash_star((p' : (A) -> Bool), op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)))")
  let t851 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t847, t846, t845]), leadsto_thm25()), t850))
  let t842 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t843 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t842]), @mk_state_logic.or_imply_weak_lemma())
  let t840 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t841 = @term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t844 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t841, t840]), @mk_state_logic.imply_weak_and_lemma()), t843))
  let t837 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS(op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool)), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t838 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), (q' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t837)
  let t832 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t833 = @term_syntax.parse_term("(st : (A) -> A)")
  let t834 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t835 = @term_syntax.parse_term("op_bslash_slash_star((p : (A) -> Bool), (q : (A) -> Bool))")
  let t836 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t839 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p' : (A) -> Bool)"), t836, t835, t834, t833, t832]), leadsto_thm29()), t838))
  let t829 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((q : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t828 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t826 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t827 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t830 = @bool.conj(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t827, t826]), @mk_ensures.ensures_cor2()), t828), t829)
  let t823 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t824 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t825 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t831 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t825, t824, t823]), @mk_unless.unless_thm8()), t830))
  let t821 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t819 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t820 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t822 = @tactics.assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t820, t819]), @mk_ensures.ensures_cor2()), t821))
  let t894 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t822), t831), t839), t844), t851), t857), t868), t876), t893)
  leadsto_thm35_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ENSURES(p, q, CONS(st, Pr)) && LEADSTO((p' : (A) -> Bool), (q' : (A) -> Bool), CONS(st, Pr)) && UNLESS(q, r, CONS(st, Pr)) && UNLESS(q', r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr))")), t894))
}

///|
let leadsto_thm35_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma00")

///|
/// `LEADSTO_thm35_lemma00`
pub fn leadsto_thm35_lemma00() -> @kernel.Thm {
  leadsto_thm35_lemma00_c.get()
}

///|
/// LEADSTO_thm35_lemma01_1
fn step_141() -> Unit raise {
  let t897 = @simp.asm_rewrite_tac(@list.List([]))
  let t896 = @tactics.repeat_tac(@tactics.strip_tac)
  let t895 = @tactics.repeat_tac(@tactics.gen_tac)
  let t898 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.or_def(), @mk_state_logic.and_def()])), @tactics.beta_tac), t895), @tactics.eq_tac), t896), t897)
  leadsto_thm35_lemma01_1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ q : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r'' : (A) -> Bool, ∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ s : A, op_bslash_slash_star(op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(q, q'), r''), op_slash_bslash_star(p, r)), op_bslash_slash_star(op_slash_bslash_star(q', q), r''), s) == op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(q, q'), r''), op_slash_bslash_star(p, r), s)")), t898))
}

///|
let leadsto_thm35_lemma01_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_1")

///|
/// `LEADSTO_thm35_lemma01_1`
pub fn leadsto_thm35_lemma01_1() -> @kernel.Thm {
  leadsto_thm35_lemma01_1_c.get()
}

///|
/// LEADSTO_thm35_lemma01_2
fn step_142() -> Unit raise {
  let t899 = @bool.spec_all(leadsto_thm35_lemma01_1())
  let t900 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(s : A)"), t899))
  leadsto_thm35_lemma01_2_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t900)))
}

///|
let leadsto_thm35_lemma01_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_2")

///|
/// `LEADSTO_thm35_lemma01_2`
pub fn leadsto_thm35_lemma01_2() -> @kernel.Thm {
  leadsto_thm35_lemma01_2_c.get()
}

///|
/// LEADSTO_thm35_lemma01_3
fn step_143() -> Unit raise {
  let t901 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto_thm35_lemma01_3_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (∀ p'' : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ r' : (A) -> Bool, LEADSTO(r, q, CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → ENSURES(p'', r, CONS(st, Pr)) → UNLESS((q' : (A) -> Bool), r', CONS(st, Pr)) → UNLESS(q, r', CONS(st, Pr)) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r'' : (A) -> Bool, LEADSTO(p', q', CONS(st, Pr)) → UNLESS(q, r'', CONS(st, Pr)) → UNLESS(q', r'', CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(r, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r''), CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(p'', p), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr)))) → (∀ p'' : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ r' : (A) -> Bool, LEADSTO(r, q, CONS(st, Pr)) → ENSURES(p'', r, CONS(st, Pr)) → UNLESS(q', r', CONS(st, Pr)) → UNLESS(q, r', CONS(st, Pr)) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r'' : (A) -> Bool, LEADSTO(p', q', CONS(st, Pr)) → UNLESS(q, r'', CONS(st, Pr)) → UNLESS(q', r'', CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(r, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r''), CONS(st, Pr))) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(op_slash_bslash_star(p'', p), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))))")), t901))
}

///|
let leadsto_thm35_lemma01_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_3")

///|
/// `LEADSTO_thm35_lemma01_3`
pub fn leadsto_thm35_lemma01_3() -> @kernel.Thm {
  leadsto_thm35_lemma01_3_c.get()
}

///|
/// LEADSTO_thm35_lemma01_4
fn step_144() -> Unit raise {
  let t905 = @term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))")
  let t906 = @tactics.assume_tac(@bool.undisch(@bool.spec_all(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star(LUB((P : ((A) -> Bool) -> Bool)), (r : (A) -> Bool))"), t905]), @mk_ensures.ensures_cor1()))))
  let t903 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t904 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t903]), @mk_state_logic.sym_and_imply_weak_lemma()))
  let t909 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3a(), x902)), t904), t906), (x907 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x907)), (x908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x908))
  leadsto_thm35_lemma01_4_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(op_slash_bslash_star(p, r), q, CONS(st, Pr))) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(LUB(P), r), q, CONS(st, Pr))")), t909))
}

///|
let leadsto_thm35_lemma01_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_4")

///|
/// `LEADSTO_thm35_lemma01_4`
pub fn leadsto_thm35_lemma01_4() -> @kernel.Thm {
  leadsto_thm35_lemma01_4_c.get()
}

///|
/// LEADSTO_thm35_lemma01_5
fn step_145() -> Unit raise {
  let t910 = @simp.rewrite_tac(@list.List([]))
  let t911 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([in_()])), @tactics.beta_tac), t910)
  leadsto_thm35_lemma01_5_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ p : (A) -> Bool, ∀ p'' : (A) -> Bool, In(p', (p'' : (A) -> Bool) => ∃ p''' : (A) -> Bool, In(p''', P) && p'' == op_slash_bslash_star(p, p''')) == (∃ p''' : (A) -> Bool, In(p''', P) && p' == op_slash_bslash_star(p, p'''))")), t911))
}

///|
let leadsto_thm35_lemma01_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_5")

///|
/// `LEADSTO_thm35_lemma01_5`
pub fn leadsto_thm35_lemma01_5() -> @kernel.Thm {
  leadsto_thm35_lemma01_5_c.get()
}

///|
/// LEADSTO_thm35_lemma01_6
fn step_146() -> Unit raise {
  let t920 = @kernel.assume_rule(@term_syntax.parse_term("(p' : (A) -> Bool)((s : A))"))
  let t921 = @tactics.strip_assume_tac(@equal.beta_rule(@equal.subs(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p' : (A) -> Bool) == ((s : A) => (p : (A) -> Bool)(s) && (p'' : (A) -> Bool)(s))"))]), t920)))
  let t918 = @kernel.assume_rule(@term_syntax.parse_term("In((p'' : (A) -> Bool), (P : ((A) -> Bool) -> Bool))"))
  let t919 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([in_()]))(t918)]))
  let t922 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p'' : (A) -> Bool)")), t919), t921)
  let t917 = @kernel.assume_rule(@term_syntax.parse_term("(p' : (A) -> Bool)((s : A))"))
  let t923 = @tactics.strip_assume_tac(@equal.beta_rule(@equal.subs(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p' : (A) -> Bool) == ((s : A) => (p : (A) -> Bool)(s) && (p'' : (A) -> Bool)(s))"))]), t917)))
  let t916 = @simp.asm_rewrite_tac(@list.List([in_()]))
  let t915 = @tactics.exists_tac(@term_syntax.parse_term("(p' : (A) -> Bool)"))
  let t914 = @simp.asm_rewrite_tac(@list.List([]))
  let t924 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(s : A) => (p : (A) -> Bool)(s) && (p' : (A) -> Bool)(s)")), @tactics.beta_tac), t914), t915), t916), t923, t922])
  let t913 = @tactics.repeat_tac(@tactics.strip_tac)
  let t912 = @simp.rewrite_tac(@list.List([lub(), @mk_state_logic.and_def()]))
  let t925 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t912), @tactics.beta_tac), @tactics.eq_tac), t913), t924)
  leadsto_thm35_lemma01_6_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ s : A, op_slash_bslash_star((p : (A) -> Bool), LUB((P : ((A) -> Bool) -> Bool)), s) == LUB((p'' : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', P) && p'' == op_slash_bslash_star(p, p'), s)")), t925))
}

///|
let leadsto_thm35_lemma01_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_6")

///|
/// `LEADSTO_thm35_lemma01_6`
pub fn leadsto_thm35_lemma01_6() -> @kernel.Thm {
  leadsto_thm35_lemma01_6_c.get()
}

///|
/// LEADSTO_thm35_lemma01_7
fn step_147() -> Unit raise {
  let t926 = @simp.asm_rewrite_tac(@list.List([]))
  let t927 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t926)
  leadsto_thm35_lemma01_7_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ r' : (A) -> Bool, ∀ q : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))) → (∀ p' : (A) -> Bool, (∃ p''' : (A) -> Bool, In(p''', P) && p' == op_slash_bslash_star(p, p''')) → LEADSTO(p', op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr)))")), t927))
}

///|
let leadsto_thm35_lemma01_7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_7")

///|
/// `LEADSTO_thm35_lemma01_7`
pub fn leadsto_thm35_lemma01_7() -> @kernel.Thm {
  leadsto_thm35_lemma01_7_c.get()
}

///|
/// LEADSTO_thm35_lemma01_8
fn step_148() -> Unit raise {
  let t934 = @hol88.mk_abs(leadsto_thm35_lemma01_6())
  let t935 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t934)]))
  let t932 = @kernel.assume_rule(@term_syntax.parse_term("(∀ p' : (A) -> Bool, (∃ p''' : (A) -> Bool, In(p''', (P : ((A) -> Bool) -> Bool)) && p' == op_slash_bslash_star((p : (A) -> Bool), p''')) → LEADSTO(p', op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r' : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))) → LEADSTO(LUB((p'' : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', P) && p'' == op_slash_bslash_star(p, p')), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))"))
  let t933 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@bool.undisch(@bool.spec_all(leadsto_thm35_lemma01_7()))]))(t932))
  let t928 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t929 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r' : (A) -> Bool))")
  let t930 = @bool.specl(@list.List([@term_syntax.parse_term("(p'' : (A) -> Bool) => ∃ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) && p'' == op_slash_bslash_star((p : (A) -> Bool), p')"), t929, t928]), leadsto_thm3a())
  let t931 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm35_lemma01_5()]))(t930))
  let t936 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t931), t933), t935)
  leadsto_thm35_lemma01_8_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ r' : (A) -> Bool, ∀ q : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(p, LUB(P)), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))")), t936))
}

///|
let leadsto_thm35_lemma01_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_8")

///|
/// `LEADSTO_thm35_lemma01_8`
pub fn leadsto_thm35_lemma01_8() -> @kernel.Thm {
  leadsto_thm35_lemma01_8_c.get()
}

///|
/// LEADSTO_thm35_lemma01_9
fn step_149() -> Unit raise {
  let t937 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac)
  leadsto_thm35_lemma01_9_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, LEADSTO(p', q', CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → UNLESS((q : (A) -> Bool), r, CONS(st, Pr)) → UNLESS(q', r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr)))) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, LEADSTO(p', q', CONS(st, Pr)) → UNLESS(q, r, CONS(st, Pr)) → UNLESS(q', r, CONS(st, Pr)) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr))))")), t937))
}

///|
let leadsto_thm35_lemma01_9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_9")

///|
/// `LEADSTO_thm35_lemma01_9`
pub fn leadsto_thm35_lemma01_9() -> @kernel.Thm {
  leadsto_thm35_lemma01_9_c.get()
}

///|
/// LEADSTO_thm35_lemma01_10
fn step_150() -> Unit raise {
  let t941 = @simp.asm_rewrite_tac(@list.List([]))
  let t940 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_or_lemma()]))
  let t938 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t939 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("(p' : (A) -> Bool)"), t938]), @mk_state_logic.and_comm_lemma())]))
  let t942 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t939), t940), t941)
  leadsto_thm35_lemma01_10_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(op_slash_bslash_star(p, (p' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))) → (∀ p : (A) -> Bool, In(p, P) → LEADSTO(op_slash_bslash_star(p', p), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr)))")), t942))
}

///|
let leadsto_thm35_lemma01_10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01_10")

///|
/// `LEADSTO_thm35_lemma01_10`
pub fn leadsto_thm35_lemma01_10() -> @kernel.Thm {
  leadsto_thm35_lemma01_10_c.get()
}

///|
/// LEADSTO_thm35_lemma01a
fn step_151() -> Unit raise {
  let t943 = @simp.asm_rewrite_tac(@list.List([]))
  let t944 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @hol88.res_tac), t943)
  leadsto_thm35_lemma01a_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r'' : (A) -> Bool, ∀ r' : (A) -> Bool, LEADSTO(r'', q, CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → ENSURES(p, r'', CONS(st, Pr)) → UNLESS((q' : (A) -> Bool), r', CONS(st, Pr)) → UNLESS(q, r', CONS(st, Pr)) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r' : (A) -> Bool, LEADSTO(p', q', CONS(st, Pr)) → UNLESS(q, r', CONS(st, Pr)) → UNLESS(q', r', CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(r'', p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(p, (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r' : (A) -> Bool, ∀ r'' : (A) -> Bool, LEADSTO(r', q, CONS(st, Pr)) → ENSURES(p, r', CONS(st, Pr)) → UNLESS(q', r'', CONS(st, Pr)) → UNLESS(q, r'', CONS(st, Pr)) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r'' : (A) -> Bool, LEADSTO(p', q', CONS(st, Pr)) → UNLESS(q, r'', CONS(st, Pr)) → UNLESS(q', r'', CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(r', p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r''), CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(p, r), op_bslash_slash_star(op_slash_bslash_star(q, q'), r''), CONS(st, Pr)))")), t944))
}

///|
let leadsto_thm35_lemma01a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01a")

///|
/// `LEADSTO_thm35_lemma01a`
pub fn leadsto_thm35_lemma01a() -> @kernel.Thm {
  leadsto_thm35_lemma01a_c.get()
}

///|
/// LEADSTO_INDUCT0_TAC
fn step_152() -> Unit raise {
  leadsto_induct0_tac_c.set(try {
    let t945 = @tactics.repeat_tac(@tactics.conj_tac)
    @tactics.then_tac(@hol88.match_mp_tac(leadsto_thm34b()), t945)
  } catch {
    Failure(_) => raise Failure("LEADSTO_INDUCT0_TAC Failed")
    e => raise e
  })
}

///|
let leadsto_induct0_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("LEADSTO_INDUCT0_TAC")

///|
/// `LEADSTO_INDUCT0_TAC`
pub fn leadsto_induct0_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (leadsto_induct0_tac_c.get())(x)
}

///|
/// LEADSTO_thm35_lemma01
fn step_153() -> Unit raise {
  let t1031 = @simp.asm_rewrite_tac(@list.List([]))
  let t1029 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t1030 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t1029]), @mk_state_logic.and_comm_lemma())]))
  let t1032 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x1026 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma01_9(), x1026)), (x1027 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma01_10(), x1027)), (x1028 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma01_8(), x1028)), t1030), t1031)
  let t1023 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x1019 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x1019)), (x1020 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2(), x1020)), (x1021 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma01_3(), x1021)), (x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma01_8(), x1022))
  let t1011 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1012 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1013 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool))")
  let t1014 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool))")
  let t1015 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool))")
  let t1016 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t1015, t1014, t1013, t1012, t1011]), leadsto_thm28())
  let t1010 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool)), op_slash_bslash_star(p, (r : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1017 = @simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t1010]))(t1016)
  let t1018 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t1017)]))
  let t1002 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1003 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1004 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (q : (A) -> Bool)), (r'' : (A) -> Bool))")
  let t1005 = @term_syntax.parse_term("op_slash_bslash_star((p' : (A) -> Bool), (r' : (A) -> Bool))")
  let t1006 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool)), op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)))")
  let t1007 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t1006, t1005, t1004, t1003, t1002]), leadsto_thm28())
  let t1001 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool)), op_slash_bslash_star(p, (r : (A) -> Bool))), op_slash_bslash_star(p', (r' : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1000 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((r' : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t999 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t1008 = @simp.rewrite_rule(@list.List([@simp.once_rewrite_rule(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("(r' : (A) -> Bool)"), t999]), @mk_state_logic.and_comm_lemma())]))(t1000), t1001]))(t1007)
  let t1009 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm35_lemma01_2()]))(t1008))
  let t990 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t991 = @term_syntax.parse_term("(st : (A) -> A)")
  let t992 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool))")
  let t993 = @term_syntax.parse_term("op_slash_bslash_star((r' : (A) -> Bool), (r : (A) -> Bool))")
  let t994 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_bslash_star((p : (A) -> Bool), (r : (A) -> Bool)), op_slash_bslash_star((p' : (A) -> Bool), (r' : (A) -> Bool)))")
  let t995 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool))"), t994, t993, t992, t991, t990]), leadsto_thm28())
  let t989 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, (r : (A) -> Bool)), op_slash_bslash_star(p', (r' : (A) -> Bool))), op_slash_bslash_star(r', r)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t996 = @simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((r' : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool)), (r'' : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t989]))(t995)
  let t997 = @simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t996)
  let t998 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@mk_state_logic.or_assoc_lemma()))]))(t997))
  let t982 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t983 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t984 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t985 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t986 = @bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t985, t984, t983, t982]), @mk_ensures.ensures_thm4())
  let t981 = @kernel.assume_rule(@term_syntax.parse_term("ENSURES((p' : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t987 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("UNLESS((p : (A) -> Bool), (r' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t981]))(t986))
  let t978 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t979 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t980 = @tactics.assume_tac(@bool.undisch(@bool.specl(@list.List([@term_syntax.parse_term("(p' : (A) -> Bool)"), t979, t978]), @mk_ensures.ensures_cor2())))
  let t975 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t976 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t977 = @tactics.assume_tac(@bool.undisch(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t976, t975]), @mk_ensures.ensures_cor2())))
  let t1024 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x973 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2(), x973)), (x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x974)), t977), t980), t987), (x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x988)), @hol88.res_tac), t998), t1009), t1018)
  let t972 = @tactics.accept_tac(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p' : (A) -> Bool), (p : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star((q' : (A) -> Bool), (q : (A) -> Bool)), (r' : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")))
  let t971 = @simp.once_rewrite_tac(@list.List([@mk_state_logic.and_comm_lemma()]))
  let t1025 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x969 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm2(), x969)), (x970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma00(), x970)), t971), t972), t1024, t1023])
  let t967 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t968 = @tactics.spec_tac(@term_syntax.parse_term("(p' : (A) -> Bool)"), t967)
  let t965 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t966 = @tactics.spec_tac(@term_syntax.parse_term("(q' : (A) -> Bool)"), t965)
  let t963 = @term_syntax.parse_term("(st : (A) -> A)")
  let t964 = @tactics.spec_tac(@term_syntax.parse_term("(st : (A) -> A)"), t963)
  let t961 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t962 = @tactics.spec_tac(@term_syntax.parse_term("(Pr : List[(A) -> A])"), t961)
  let t960 = @tactics.undisch_tac(@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), (q' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t958 = @term_syntax.parse_term("(p : (A) -> Bool)")
  let t959 = @tactics.spec_tac(@term_syntax.parse_term("(p : (A) -> Bool)"), t958)
  let t956 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t957 = @tactics.spec_tac(@term_syntax.parse_term("(q : (A) -> Bool)"), t956)
  let t954 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t955 = @tactics.spec_tac(@term_syntax.parse_term("(r : (A) -> Bool)"), t954)
  let t952 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t953 = @tactics.spec_tac(@term_syntax.parse_term("(r' : (A) -> Bool)"), t952)
  let t951 = @tactics.undisch_tac(@term_syntax.parse_term("LEADSTO((r : (A) -> Bool), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t950 = @tactics.undisch_tac(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t949 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS((q' : (A) -> Bool), (r' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t948 = @tactics.undisch_tac(@term_syntax.parse_term("UNLESS((q : (A) -> Bool), (r' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t947 = @tactics.undisch_tac(@term_syntax.parse_term("∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r' : (A) -> Bool, LEADSTO(p', q', CONS((st : (A) -> A), (Pr : List[(A) -> A]))) → UNLESS((q : (A) -> Bool), r', CONS(st, Pr)) → UNLESS(q', r', CONS(st, Pr)) → LEADSTO(op_slash_bslash_star((r : (A) -> Bool), p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r'), CONS(st, Pr))"))
  let t1033 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t947), t948), t949), t950), t951), t953), t955), t957), t959), t960), t962), t964), t966), t968), leadsto_induct0_tac), t1025)
  let t1034 = @tactics.thenl(leadsto_induct0_tac, @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x946 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma00(), x946)), t1033, t1032]))
  leadsto_thm35_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) → (∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, LEADSTO(p', q', CONS(st, Pr)) → UNLESS(q, r, CONS(st, Pr)) → UNLESS(q', r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr)))")), t1034))
}

///|
let leadsto_thm35_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35_lemma01")

///|
/// `LEADSTO_thm35_lemma01`
pub fn leadsto_thm35_lemma01() -> @kernel.Thm {
  leadsto_thm35_lemma01_c.get()
}

///|
/// LEADSTO_thm35
fn step_154() -> Unit raise {
  let t1036 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x1035 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm35_lemma01(), x1035))
  leadsto_thm35_c.set(@aux_definitions.prove_thm("LEADSTO_thm35", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, q, CONS(st, Pr)) && LEADSTO(p', q', CONS(st, Pr)) && UNLESS(q, r, CONS(st, Pr)) && UNLESS(q', r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr))"), t1036))
}

///|
let leadsto_thm35_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm35")

///|
/// `LEADSTO_thm35`
pub fn leadsto_thm35() -> @kernel.Thm {
  leadsto_thm35_c.get()
}

///|
/// EQmetric
fn step_155() -> Unit raise {
  eqmetric_c.set(@aux_definitions.new_infix_definition("EQmetric", "<=>", @term_syntax.parse_term("(EQmetric : ((A) -> Num, Num, A) -> Bool)((M : (A) -> Num), (m : Num)) == ((s : A) => M(s) == m)"), @mk_unless.tl_fix()))
}

///|
let eqmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQmetric")

///|
/// `EQmetric`
pub fn eqmetric() -> @kernel.Thm {
  eqmetric_c.get()
}

///|
/// LESSmetric
fn step_156() -> Unit raise {
  lessmetric_c.set(@aux_definitions.new_infix_definition("LESSmetric", "<=>", @term_syntax.parse_term("(LESSmetric : ((A) -> Num, Num, A) -> Bool)((M : (A) -> Num), (m : Num)) == ((s : A) => M(s) < m)"), @mk_unless.tl_fix()))
}

///|
let lessmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LESSmetric")

///|
/// `LESSmetric`
pub fn lessmetric() -> @kernel.Thm {
  lessmetric_c.get()
}

///|
/// LEADSTO_thm36_lemma00
fn step_157() -> Unit raise {
  leadsto_thm36_lemma00_c.set(@equal.beta_rule(@bool.spec(@term_syntax.parse_term("(n : Num) => LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), n)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), @mk_gen_induct.gen_induct_thm())))
}

///|
let leadsto_thm36_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma00")

///|
/// `LEADSTO_thm36_lemma00`
pub fn leadsto_thm36_lemma00() -> @kernel.Thm {
  leadsto_thm36_lemma00_c.get()
}

///|
/// LEADSTO_thm36_lemma01
fn step_158() -> Unit raise {
  let t1037 = @tactics.then_tac(@tactics.beta_tac, @simp.rewrite_tac(@list.List([])))
  leadsto_thm36_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ M : (A) -> Num, ∀ m : Num, op_slash_bslash_star((p : (A) -> Bool), EQmetric(M, m)) == ((i : Num) => op_slash_bslash_star(p, EQmetric(M, i)))(m)")), t1037))
}

///|
let leadsto_thm36_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma01")

///|
/// `LEADSTO_thm36_lemma01`
pub fn leadsto_thm36_lemma01() -> @kernel.Thm {
  leadsto_thm36_lemma01_c.get()
}

///|
/// LEADSTO_thm36_lemma02
fn step_159() -> Unit raise {
  let t1040 = @kernel.assume_rule(@term_syntax.parse_term("(n : Num) < (m : Num)"))
  let t1039 = @term_syntax.parse_term("(m : Num)")
  let t1041 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1039]), @hol88.less_suc()), t1040)
  let t1038 = @kernel.assume_rule(@term_syntax.parse_term("∀ n : Num, n < SUC((m : Num)) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), n)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1042 = @tactics.strip_assume_tac(@bool.mp(@bool.spec(@term_syntax.parse_term("(n : Num)"), t1038), t1041))
  let t1043 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1042)
  leadsto_thm36_lemma02_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ∀ M : (A) -> Num, ∀ m : Num, (∀ n : Num, n < SUC(m) → LEADSTO(op_slash_bslash_star(p, EQmetric(M, n)), q, CONS(st, Pr))) → (∀ n : Num, n < m → LEADSTO(op_slash_bslash_star(p, EQmetric(M, n)), q, CONS(st, Pr)))")), t1043))
}

///|
let leadsto_thm36_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma02")

///|
/// `LEADSTO_thm36_lemma02`
pub fn leadsto_thm36_lemma02() -> @kernel.Thm {
  leadsto_thm36_lemma02_c.get()
}

///|
/// LEADSTO_thm36_lemma03
fn step_160() -> Unit raise {
  let t1053 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), (m : Num))), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1054 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_bslash_lt_slash_star((i : Num) => op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), i)), (m : Num)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t1053)
  let t1050 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1051 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1052 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), (m : Num)))")
  let t1055 = @tactics.strip_assume_tac(@bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_lt_slash_star((i : Num) => op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), i)), (m : Num))"), t1052, t1051, t1050]), leadsto_thm4()), t1054))
  let t1047 = @kernel.assume_rule(@term_syntax.parse_term("∀ n : Num, n < SUC((m : Num)) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), n)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1048 = @bool.spec(@term_syntax.parse_term("(m : Num)"), t1047)
  let t1049 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@hol88.less_suc_refl()]))(t1048))
  let t1045 = @kernel.assume_rule(@term_syntax.parse_term("∀ n : Num, n < (m : Num) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), n)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1046 = @tactics.assume_tac(@bool.mp(@kernel.assume_rule(@term_syntax.parse_term("(∀ n : Num, n < (m : Num) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), n)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))) → LEADSTO(op_bslash_lt_slash_star((i : Num) => op_slash_bslash_star(p, EQmetric(M, i)), m), q, CONS(st, Pr))")), t1045))
  let t1044 = @tactics.assume_tac(@bool.undisch_all(@bool.spec_all(leadsto_thm36_lemma02())))
  let t1056 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([@mk_state_logic.or_lt_n_def()]))), @tactics.beta_tac), t1044), t1046), t1049), t1055)
  let t1057 = @list.List([@simp.rewrite_tac(@list.List([@mk_state_logic.or_lt_n_def(), leadsto_cor12(), leadsto_cor11(), @hol88.not_less_0()])), t1056])
  let t1058 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t1057)
  leadsto_thm36_lemma03_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ∀ M : (A) -> Num, ∀ m : Num, (∀ n : Num, n < m → LEADSTO(op_slash_bslash_star(p, EQmetric(M, n)), q, CONS(st, Pr))) → LEADSTO(op_bslash_lt_slash_star((i : Num) => op_slash_bslash_star(p, EQmetric(M, i)), m), q, CONS(st, Pr))")), t1058))
}

///|
let leadsto_thm36_lemma03_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma03")

///|
/// `LEADSTO_thm36_lemma03`
pub fn leadsto_thm36_lemma03() -> @kernel.Thm {
  leadsto_thm36_lemma03_c.get()
}

///|
/// LEADSTO_thm36_lemma04
fn step_161() -> Unit raise {
  let t1063 = @kernel.assume_rule(@term_syntax.parse_term("EQmetric((M : (A) -> Num), (m : Num), (s : A))"))
  let t1064 = @tactics.then_tac(@tactics.disj1_tac, @tactics.strip_assume_tac(@equal.beta_rule(@simp.rewrite_rule(@list.List([eqmetric()]))(t1063))))
  let t1062 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, LESSmetric((M : (A) -> Num), (m : Num), s) == op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m, s)"))
  let t1065 = @tactics.thenl(@tactics.strip_tac, @list.List([@tactics.then_tac(@tactics.disj2_tac, @simp.asm_rewrite_tac(@list.List([@bool.spec_all(@equal.beta_rule(@simp.rewrite_rule(@list.List([lessmetric()]))(t1062)))]))), t1064]))
  let t1060 = @kernel.assume_rule(@term_syntax.parse_term("∀ s : A, LESSmetric((M : (A) -> Num), (m : Num), s) == op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m, s)"))
  let t1061 = @tactics.then_tac(@tactics.disj1_tac, @simp.asm_rewrite_tac(@list.List([@equal.sym(@bool.spec_all(@equal.beta_rule(@simp.rewrite_rule(@list.List([lessmetric()]))(t1060))))])))
  let t1059 = @simp.asm_rewrite_tac(@list.List([]))
  let t1066 = @list.List([@tactics.thenl(@tactics.strip_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @simp.rewrite_tac(@list.List([eqmetric()]))), @tactics.beta_tac), t1059), t1061])), t1065])
  let t1067 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@mk_state_logic.or_lt_n_def(), @mk_state_logic.or_def(), lessmetric(), @hol88.less_thm()]))), @tactics.beta_tac), @tactics.eq_tac), t1066)
  let t1068 = @list.List([@simp.rewrite_tac(@list.List([lessmetric(), eqmetric(), @mk_state_logic.or_lt_n_def(), @mk_state_logic.false_def(), @hol88.not_less_0()])), t1067])
  let t1069 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t1068)
  leadsto_thm36_lemma04_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ M : (A) -> Num, ∀ m : Num, ∀ s : A, LESSmetric(M, m, s) == op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m, s)")), t1069))
}

///|
let leadsto_thm36_lemma04_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma04")

///|
/// `LEADSTO_thm36_lemma04`
pub fn leadsto_thm36_lemma04() -> @kernel.Thm {
  leadsto_thm36_lemma04_c.get()
}

///|
/// LEADSTO_thm36_lemma05
fn step_162() -> Unit raise {
  let t1072 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t1070 = @term_syntax.parse_term("(m : Num)")
  let t1071 = @hol88.mk_abs(@bool.specl(@list.List([@term_syntax.parse_term("(M : (A) -> Num)"), t1070]), leadsto_thm36_lemma04()))
  let t1073 = @tactics.then_tac(@simp.rewrite_tac(@list.List([lessmetric(), eqmetric(), @equal.beta_rule(@simp.rewrite_rule(@list.List([lessmetric(), eqmetric()]))(t1071))])), t1072)
  leadsto_thm36_lemma05_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ M : (A) -> Num, ∀ m : Num, LESSmetric(M, m) == op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m)")), t1073))
}

///|
let leadsto_thm36_lemma05_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma05")

///|
/// `LEADSTO_thm36_lemma05`
pub fn leadsto_thm36_lemma05() -> @kernel.Thm {
  leadsto_thm36_lemma05_c.get()
}

///|
/// LEADSTO_thm36_lemma06
fn step_163() -> Unit raise {
  let t1074 = @simp.rewrite_tac(@list.List([leadsto_thm36_lemma05()]))
  leadsto_thm36_lemma06_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ M : (A) -> Num, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), op_bslash_slash_star(op_slash_bslash_star(p, LESSmetric(M, m)), q), Pr)) → (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), op_bslash_slash_star(op_slash_bslash_star(p, op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m)), q), Pr))")), t1074))
}

///|
let leadsto_thm36_lemma06_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma06")

///|
/// `LEADSTO_thm36_lemma06`
pub fn leadsto_thm36_lemma06() -> @kernel.Thm {
  leadsto_thm36_lemma06_c.get()
}

///|
/// LEADSTO_thm36_lemma07
fn step_164() -> Unit raise {
  let t1075 = @simp.asm_rewrite_tac(@list.List([@equal.sym(@bool.spec_all(@mk_state_logic.and_or_distr_lemma()))]))
  let t1076 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.or_lt_n_def()])), @tactics.beta_tac), t1075)
  let t1077 = @list.List([@simp.rewrite_tac(@list.List([@mk_state_logic.or_lt_n_def(), @mk_state_logic.and_false_lemma()])), t1076])
  let t1078 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t1077)
  leadsto_thm36_lemma07_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ M : (A) -> Num, ∀ m : Num, op_bslash_lt_slash_star((i : Num) => op_slash_bslash_star(p, EQmetric(M, i)), m) == op_slash_bslash_star(p, op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m))")), t1078))
}

///|
let leadsto_thm36_lemma07_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma07")

///|
/// `LEADSTO_thm36_lemma07`
pub fn leadsto_thm36_lemma07() -> @kernel.Thm {
  leadsto_thm36_lemma07_c.get()
}

///|
/// LEADSTO_thm36_lemma08
fn step_165() -> Unit raise {
  let t1092 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), op_bslash_lt_slash_star((i : Num) => EQmetric((M : (A) -> Num), i), (m : Num))), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1093 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), (m : Num))), op_bslash_slash_star((q : (A) -> Bool), op_slash_bslash_star(p, op_bslash_lt_slash_star((i : Num) => EQmetric(M, i), m))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t1092)
  let t1087 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1088 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1089 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1090 = @term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), op_bslash_lt_slash_star((i : Num) => EQmetric((M : (A) -> Num), i), (m : Num)))")
  let t1091 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1094 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), (m : Num)))"), t1091, t1090, t1089, t1088, t1087]), leadsto_thm28()), t1093)
  let t1095 = @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t1094))
  let t1082 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1083 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1084 = @term_syntax.parse_term("(M : (A) -> Num)")
  let t1085 = @bool.spec_all(@bool.undisch(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t1084, t1083, t1082]), leadsto_thm36_lemma06())))
  let t1086 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([@mk_state_logic.or_comm_lemma()]))(t1085))
  let t1079 = @kernel.assume_rule(@term_syntax.parse_term("∀ n : Num, n < (m : Num) → LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), n)), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1080 = @bool.mp(@bool.spec_all(leadsto_thm36_lemma03()), t1079)
  let t1081 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm36_lemma07()]))(t1080))
  let t1096 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1081), t1086), t1095)
  leadsto_thm36_lemma08_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ∀ M : (A) -> Num, (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), op_bslash_slash_star(op_slash_bslash_star(p, LESSmetric(M, m)), q), CONS(st, Pr))) → (∀ m : Num, (∀ n : Num, n < m → LEADSTO(op_slash_bslash_star(p, EQmetric(M, n)), q, CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), q, CONS(st, Pr)))")), t1096))
}

///|
let leadsto_thm36_lemma08_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma08")

///|
/// `LEADSTO_thm36_lemma08`
pub fn leadsto_thm36_lemma08() -> @kernel.Thm {
  leadsto_thm36_lemma08_c.get()
}

///|
/// LEADSTO_thm36_lemma09
fn step_166() -> Unit raise {
  let t1098 = @bool.undisch_all(leadsto_thm36_lemma00())
  let t1099 = @tactics.strip_assume_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), t1098))
  let t1097 = @tactics.assume_tac(@bool.undisch(@bool.spec_all(leadsto_thm36_lemma08())))
  let t1100 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1097), t1099)
  leadsto_thm36_lemma09_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ∀ M : (A) -> Num, (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), op_bslash_slash_star(op_slash_bslash_star(p, LESSmetric(M, m)), q), CONS(st, Pr))) → (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), q, CONS(st, Pr)))")), t1100))
}

///|
let leadsto_thm36_lemma09_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma09")

///|
/// `LEADSTO_thm36_lemma09`
pub fn leadsto_thm36_lemma09() -> @kernel.Thm {
  leadsto_thm36_lemma09_c.get()
}

///|
/// LEADSTO_thm36_lemma10s
fn step_167() -> Unit raise {
  let t1104 = @simp.asm_rewrite_tac(@list.List([]))
  let t1103 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t1105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([]))), t1103), t1104)
  let t1102 = @simp.asm_rewrite_tac(@list.List([]))
  let t1106 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))), t1102), t1105])
  let t1101 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_def(), @mk_state_logic.exists_def(), eqmetric()]))
  let t1107 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1101), @tactics.beta_tac), @tactics.eq_tac), t1106)
  leadsto_thm36_lemma10s_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ M : (A) -> Num, ∀ s : A, op_slash_bslash_star(p, op_q_star((n : Num) => EQmetric(M, n)), s) == op_q_star((i : Num) => op_slash_bslash_star(p, EQmetric(M, i)), s)")), t1107))
}

///|
let leadsto_thm36_lemma10s_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma10s")

///|
/// `LEADSTO_thm36_lemma10s`
pub fn leadsto_thm36_lemma10s() -> @kernel.Thm {
  leadsto_thm36_lemma10s_c.get()
}

///|
/// LEADSTO_thm36_lemma10
fn step_168() -> Unit raise {
  let t1109 = @term_syntax.parse_term("(M : (A) -> Num)")
  let t1110 = @hol88.mk_abs(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t1109]), leadsto_thm36_lemma10s()))
  let t1111 = @simp.once_rewrite_rule(@list.List([@class.eta_ax()]))(t1110)
  let t1108 = @term_syntax.parse_term("(M : (A) -> Num)")
  leadsto_thm36_lemma10_c.set(@bool.genl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t1108]), t1111))
}

///|
let leadsto_thm36_lemma10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma10")

///|
/// `LEADSTO_thm36_lemma10`
pub fn leadsto_thm36_lemma10() -> @kernel.Thm {
  leadsto_thm36_lemma10_c.get()
}

///|
/// LEADSTO_thm36_lemma11s
fn step_169() -> Unit raise {
  let t1113 = @tactics.exists_tac(@term_syntax.parse_term("(M : (A) -> Num)((s : A))"))
  let t1112 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1114 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@mk_state_logic.exists_def(), eqmetric(), @mk_state_logic.true_def()])), @tactics.beta_tac), t1112), t1113), @tactics.refl_tac)
  leadsto_thm36_lemma11s_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ M : (A) -> Num, ∀ s : A, op_q_star((n : Num) => EQmetric(M, n), s) == True(s)")), t1114))
}

///|
let leadsto_thm36_lemma11s_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma11s")

///|
/// `LEADSTO_thm36_lemma11s`
pub fn leadsto_thm36_lemma11s() -> @kernel.Thm {
  leadsto_thm36_lemma11s_c.get()
}

///|
/// LEADSTO_thm36_lemma11
fn step_170() -> Unit raise {
  let t1115 = @hol88.mk_abs(@bool.specl(@list.List([@term_syntax.parse_term("(M : (A) -> Num)")]), leadsto_thm36_lemma11s()))
  let t1116 = @simp.once_rewrite_rule(@list.List([@class.eta_ax()]))(t1115)
  leadsto_thm36_lemma11_c.set(@bool.genl(@list.List([@term_syntax.parse_term("(M : (A) -> Num)")]), t1116))
}

///|
let leadsto_thm36_lemma11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma11")

///|
/// `LEADSTO_thm36_lemma11`
pub fn leadsto_thm36_lemma11() -> @kernel.Thm {
  leadsto_thm36_lemma11_c.get()
}

///|
/// LEADSTO_thm36_lemma12
fn step_171() -> Unit raise {
  let t1122 = @simp.asm_rewrite_tac(@list.List([leadsto_thm36_lemma10()]))
  let t1120 = @bool.specl(@list.List([@term_syntax.parse_term("(i : Num) => op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), i))")]), leadsto_thm3c())
  let t1117 = @kernel.assume_rule(@term_syntax.parse_term("∀ m : Num, LEADSTO(op_slash_bslash_star((p : (A) -> Bool), EQmetric((M : (A) -> Num), m)), op_bslash_slash_star(op_slash_bslash_star(p, LESSmetric(M, m)), (q : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1118 = @bool.mp(@bool.spec_all(leadsto_thm36_lemma09()), t1117)
  let t1119 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([leadsto_thm36_lemma01()]))(t1118))
  let t1123 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1119), (x1121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t1120, x1121)), t1122)
  leadsto_thm36_lemma12_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ∀ M : (A) -> Num, (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), op_bslash_slash_star(op_slash_bslash_star(p, LESSmetric(M, m)), q), CONS(st, Pr))) → LEADSTO(op_slash_bslash_star(p, op_q_star((n : Num) => EQmetric(M, n))), q, CONS(st, Pr))")), t1123))
}

///|
let leadsto_thm36_lemma12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36_lemma12")

///|
/// `LEADSTO_thm36_lemma12`
pub fn leadsto_thm36_lemma12() -> @kernel.Thm {
  leadsto_thm36_lemma12_c.get()
}

///|
/// LEADSTO_thm36
fn step_172() -> Unit raise {
  let t1125 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), op_q_star((n : Num) => EQmetric((M : (A) -> Num), n))), (q : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1126 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([leadsto_thm36_lemma11(), @mk_state_logic.and_true_lemma()]))(t1125))
  let t1127 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), (x1124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm36_lemma12(), x1124)), t1126)
  leadsto_thm36_c.set(@aux_definitions.prove_thm("LEADSTO_thm36", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], ∀ M : (A) -> Num, (∀ m : Num, LEADSTO(op_slash_bslash_star(p, EQmetric(M, m)), op_bslash_slash_star(op_slash_bslash_star(p, LESSmetric(M, m)), q), CONS(st, Pr))) → LEADSTO(p, q, CONS(st, Pr))"), t1127))
}

///|
let leadsto_thm36_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm36")

///|
/// `LEADSTO_thm36`
pub fn leadsto_thm36() -> @kernel.Thm {
  leadsto_thm36_c.get()
}

///|
/// LEADSTO_thm37_lemma00
fn step_173() -> Unit raise {
  let t1128 = @tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), @hol88.res_tac)
  leadsto_thm37_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("((∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q))) == (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) && X(p', q))")), t1128))
}

///|
let leadsto_thm37_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm37_lemma00")

///|
/// `LEADSTO_thm37_lemma00`
pub fn leadsto_thm37_lemma00() -> @kernel.Thm {
  leadsto_thm37_lemma00_c.get()
}

///|
/// LEADSTO_thm37_lemma01
fn step_174() -> Unit raise {
  let t1129 = @tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), @hol88.res_tac)
  leadsto_thm37_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("(∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p', q)) == ((∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr)) && (∀ p' : (A) -> Bool, In(p', P) → X(p', q)))")), t1129))
}

///|
let leadsto_thm37_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm37_lemma01")

///|
/// `LEADSTO_thm37_lemma01`
pub fn leadsto_thm37_lemma01() -> @kernel.Thm {
  leadsto_thm37_lemma01_c.get()
}

///|
/// LEADSTO_thm37_lemma02
fn step_175() -> Unit raise {
  let t1142 = @simp.asm_rewrite_tac(@list.List([]))
  let t1143 = @tactics.then_tac(@tactics.then_tac((x1141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm37_lemma01(), x1141), @hol88.res_tac), t1142)
  let t1144 = @tactics.then_tac((x1139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm37_lemma01(), x1139), (x1140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm3(), x1140))
  let t1145 = @tactics.then_tac((x1138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x1138), @hol88.res_tac)
  let t1146 = @tactics.then_tac((x1137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm1(), x1137), @hol88.res_tac)
  let t1133 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, (q : (A) -> Bool))"))
  let t1134 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t1133)
  let t1135 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t1134))
  let t1131 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, (q : (A) -> Bool))"))
  let t1132 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t1131)
  let t1147 = @list.List([@hol88.res_tac, @hol88.res_tac, @tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm37_lemma00()]))(t1132)), @hol88.res_tac), t1135), (x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto_thm0(), x1136), @hol88.res_tac, t1146, t1145, t1144, t1143])
  let t1130 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1148 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1130), t1147)
  leadsto_thm37_lemma02_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO(p, q, Pr) && X(p, q)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && X(p, r) && LEADSTO(r, q, Pr) && X(r, q) → LEADSTO(p, q, Pr) && X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p' : (A) -> Bool, In(p', P) → LEADSTO(p', q, Pr) && X(p', q)) → LEADSTO(p, q, Pr) && X(p, q))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && X(p, r) && LEADSTO(r, q, Pr) && X(r, q) → X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q)) → X(LUB(P), q)))")), t1148))
}

///|
let leadsto_thm37_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm37_lemma02")

///|
/// `LEADSTO_thm37_lemma02`
pub fn leadsto_thm37_lemma02() -> @kernel.Thm {
  leadsto_thm37_lemma02_c.get()
}

///|
/// LEADSTO_thm37
fn step_176() -> Unit raise {
  let t1149 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1150 = @simp.rewrite_rule(@list.List([leadsto(), leadstorel()]))(t1149)
  let t1151 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO(p, q, Pr) && (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q)"), t1150))
  let t1152 = @simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@theorems.conj_assoc()))]))(t1151)
  let t1153 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm37_lemma02()]))(t1152))
  let t1154 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1153), @hol88.res_tac)
  leadsto_thm37_c.set(@aux_definitions.prove_thm("LEADSTO_thm37", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q)) && (∀ r : (A) -> Bool, LEADSTO(p, r, Pr) && X(p, r) && LEADSTO(r, q, Pr) && X(r, q) → X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q)) → X(LUB(P), q))) → LEADSTO(p, q, Pr) → X(p, q)"), t1154))
}

///|
let leadsto_thm37_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm37")

///|
/// `LEADSTO_thm37`
pub fn leadsto_thm37() -> @kernel.Thm {
  leadsto_thm37_c.get()
}

///|
/// LEADSTO_thm38
fn step_177() -> Unit raise {
  let t1158 = @bool.spec_all(leadsto_thm37())
  let t1155 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1156 = @kernel.assume_rule(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q)) → X(LUB(P), q)"))
  let t1157 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, r) && LEADSTO(r, q, Pr) && X(r, q) → X(p, q)"))
  let t1159 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q)")), t1157, t1156, t1155]))(t1158))
  let t1160 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1159)
  leadsto_thm38_c.set(@aux_definitions.prove_thm("LEADSTO_thm38", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && X(p, r) && LEADSTO(r, q, Pr) && X(r, q) → X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q)) → X(LUB(P), q)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q))"), t1160))
}

///|
let leadsto_thm38_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm38")

///|
/// `LEADSTO_thm38`
pub fn leadsto_thm38() -> @kernel.Thm {
  leadsto_thm38_c.get()
}

///|
/// LEADSTO_thm39_lemma00
fn step_178() -> Unit raise {
  let t1161 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1162 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1161), @hol88.res_tac)
  leadsto_thm39_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, ∀ Pr : List[(A) -> A], ((∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q))) == (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → X(p, q)))")), t1162))
}

///|
let leadsto_thm39_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm39_lemma00")

///|
/// `LEADSTO_thm39_lemma00`
pub fn leadsto_thm39_lemma00() -> @kernel.Thm {
  leadsto_thm39_lemma00_c.get()
}

///|
/// LEADSTO_thm39_lemma01
fn step_179() -> Unit raise {
  let t1182 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO2(p', q, Pr) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p', q))"))
  let t1183 = @tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm39_lemma00()))]))(t1182)), @hol88.res_tac)
  let t1179 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1180 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t1179)
  let t1181 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t1180))
  let t1177 = @kernel.assume_rule(@term_syntax.parse_term("∀ p' : (A) -> Bool, In(p', (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p', (q : (A) -> Bool), (Pr : List[(A) -> A])) && (LEADSTO2(p', q, Pr) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p', q))"))
  let t1184 = @tactics.then_tac(@tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm39_lemma00()))]))(t1177)), (x1178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3a(), x1178)), t1181)
  let t1172 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1173 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t1172)
  let t1174 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([]))(t1173))
  let t1169 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, (q : (A) -> Bool))"))
  let t1170 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t1169)
  let t1185 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm39_lemma00()]))(t1170)), (x1171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3a(), x1171)), t1174), @hol88.res_tac)
  let t1168 = @bool.spec_all(@bool.conjunct1(@bool.conjunct2(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q))) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && (LEADSTO2(r, q, Pr) → X(r, q)) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → X(p, q))) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → LEADSTO2(p', q, Pr) && (LEADSTO2(p', q, Pr) → X(p', q))) → LEADSTO2(LUB(P), q, Pr) && (LEADSTO2(LUB(P), q, Pr) → X(LUB(P), q)))"))))))
  let t1165 = @kernel.assume_rule(@term_syntax.parse_term("(X : ((A) -> Bool, (A) -> Bool) -> Bool)((r : (A) -> Bool), (q : (A) -> Bool))"))
  let t1166 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1167 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((r : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1186 = @list.List([@hol88.res_tac, @tactics.then_tac((x1164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x1164), @tactics.accept_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("ENSURES((p : (A) -> Bool), (r : (A) -> Bool), (Pr : List[(A) -> A]))")), t1167, t1166, t1165]))(t1168))), t1185, (x1175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm0(), x1175), @hol88.res_tac, (x1176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x1176), @hol88.res_tac, t1184, t1183])
  let t1163 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1187 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1163), t1186)
  leadsto_thm39_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → X(p, q))) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && (LEADSTO2(r, q, Pr) → X(r, q)) → LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → X(p, q))) && (∀ P : ((A) -> Bool) -> Bool, (∀ p' : (A) -> Bool, In(p', P) → LEADSTO2(p', q, Pr) && (LEADSTO2(p', q, Pr) → X(p', q))) → LEADSTO2(LUB(P), q, Pr) && (LEADSTO2(LUB(P), q, Pr) → X(LUB(P), q)))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && X(r, q) → X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q)) → X(LUB(P), q)))")), t1187))
}

///|
let leadsto_thm39_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm39_lemma01")

///|
/// `LEADSTO_thm39_lemma01`
pub fn leadsto_thm39_lemma01() -> @kernel.Thm {
  leadsto_thm39_lemma01_c.get()
}

///|
/// LEADSTO_thm39
fn step_180() -> Unit raise {
  let t1190 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1191 = @simp.rewrite_rule(@list.List([leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()]))(t1190)
  let t1192 = @equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO2(p, q, Pr) && (LEADSTO2(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q))"), t1191))
  let t1193 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm39_lemma01()]))(t1192))
  let t1189 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1188 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1194 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto_eq_leadsto2()])), t1188), t1189), t1193), @hol88.res_tac)
  leadsto_thm39_c.set(@aux_definitions.prove_thm("LEADSTO_thm39", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, ∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q) → X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q)) → X(LUB(P), q))) → LEADSTO(p, q, Pr) → X(p, q)"), t1194))
}

///|
let leadsto_thm39_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm39")

///|
/// `LEADSTO_thm39`
pub fn leadsto_thm39() -> @kernel.Thm {
  leadsto_thm39_c.get()
}

///|
/// LEADSTO_thm40
fn step_181() -> Unit raise {
  let t1197 = @bool.spec_all(leadsto_thm39())
  let t1195 = @kernel.assume_rule(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q)) → X(LUB(P), q)"))
  let t1196 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (X : ((A) -> Bool, (A) -> Bool) -> Bool)(r, q) → X(p, q)"))
  let t1198 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool) -> Bool)(p, q)")), t1196, t1195]))(t1197))
  let t1199 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1198), @hol88.res_tac)
  leadsto_thm40_c.set(@aux_definitions.prove_thm("LEADSTO_thm40", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q) → X(p, q)) && (∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q)) → X(LUB(P), q)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q))"), t1199))
}

///|
let leadsto_thm40_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm40")

///|
/// `LEADSTO_thm40`
pub fn leadsto_thm40() -> @kernel.Thm {
  leadsto_thm40_c.get()
}

///|
/// LEADSTO_thm41
fn step_182() -> Unit raise {
  let t1203 = @bool.spec_all(leadsto_thm23())
  let t1200 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1201 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → X(p, q, Pr)"))
  let t1202 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)"))
  let t1204 = @tactics.accept_tac(@bool.undisch(@bool.spec_all(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t1202, t1201, t1200]))(t1203))))
  let t1205 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1204)
  leadsto_thm41_c.set(@aux_definitions.prove_thm("LEADSTO_thm41", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t1205))
}

///|
let leadsto_thm41_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm41")

///|
/// `LEADSTO_thm41`
pub fn leadsto_thm41() -> @kernel.Thm {
  leadsto_thm41_c.get()
}

///|
/// LEADSTO_thm42_lemma00
fn step_183() -> Unit raise {
  let t1206 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1207 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1206), @hol88.res_tac)
  leadsto_thm42_lemma00_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), Pr) && X(p, q, Pr)) == ((∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)))")), t1207))
}

///|
let leadsto_thm42_lemma00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm42_lemma00")

///|
/// `LEADSTO_thm42_lemma00`
pub fn leadsto_thm42_lemma00() -> @kernel.Thm {
  leadsto_thm42_lemma00_c.get()
}

///|
/// LEADSTO_thm42_lemma01
fn step_184() -> Unit raise {
  let t1208 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1209 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1208), @hol88.res_tac)
  leadsto_thm42_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr)))")), t1209))
}

///|
let leadsto_thm42_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm42_lemma01")

///|
/// `LEADSTO_thm42_lemma01`
pub fn leadsto_thm42_lemma01() -> @kernel.Thm {
  leadsto_thm42_lemma01_c.get()
}

///|
/// LEADSTO_thm42_lemma02
fn step_185() -> Unit raise {
  let t1221 = @simp.asm_rewrite_tac(@list.List([]))
  let t1219 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1220 = @bool.conj(@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))")), t1219)
  let t1222 = @tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(leadsto_thm42_lemma00()))]))(t1220)), @hol88.res_tac), t1221)
  let t1216 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, p == LUB((P : ((A) -> Bool) -> Bool)) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1217 = @bool.spec(@term_syntax.parse_term("LUB((P : ((A) -> Bool) -> Bool))"), t1216)
  let t1218 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([]))(t1217))
  let t1215 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"))
  let t1223 = @tactics.then_tac(@tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm42_lemma00()]))(t1215)), @hol88.res_tac), t1218)
  let t1213 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, In(p, (P : ((A) -> Bool) -> Bool)) → LEADSTO2(p, (q : (A) -> Bool), (Pr : List[(A) -> A])) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"))
  let t1224 = @list.List([(x1211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm0(), x1211), (x1212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm1(), x1212), @tactics.then_tac(@tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm42_lemma00()]))(t1213)), (x1214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(leadsto2_thm3(), x1214)), t1223, t1222])
  let t1210 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1225 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1210), @hol88.res_tac), t1224)
  leadsto_thm42_lemma02_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))) == (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → LEADSTO2(p, q, Pr) && X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && X(r, q, Pr) → LEADSTO2(p, q, Pr) && X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr) && X(p, q, Pr)) → LEADSTO2(LUB(P), q, Pr) && X(LUB(P), q, Pr)))")), t1225))
}

///|
let leadsto_thm42_lemma02_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm42_lemma02")

///|
/// `LEADSTO_thm42_lemma02`
pub fn leadsto_thm42_lemma02() -> @kernel.Thm {
  leadsto_thm42_lemma02_c.get()
}

///|
/// LEADSTO_thm42
fn step_186() -> Unit raise {
  let t1231 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, (Pr : List[(A) -> A])) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO2(r, q, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO2(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))"))
  let t1232 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([leadsto_thm42_lemma02()]))(t1231))
  let t1228 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO2((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1229 = @simp.rewrite_rule(@list.List([leadsto2(), leadsto2fn_eq_leadsto2fam(), leadsto2fam()]))(t1228)
  let t1230 = @tactics.assume_tac(@equal.beta_rule(@bool.spec(@term_syntax.parse_term("(p : (A) -> Bool) => (q : (A) -> Bool) => (Pr : List[(A) -> A]) => LEADSTO2(p, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)"), t1229)))
  let t1227 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1226 = @simp.rewrite_tac(@list.List([leadsto_eq_leadsto2()]))
  let t1233 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([leadsto_thm42_lemma01()])), t1226), t1227), t1230), t1232), @hol88.res_tac)
  leadsto_thm42_c.set(@aux_definitions.prove_thm("LEADSTO_thm42", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, ∀ Pr : List[(A) -> A], (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, (ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ r : (A) -> Bool, ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ P : ((A) -> Bool) -> Bool, p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr))) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, LEADSTO(p, q, Pr) → X(p, q, Pr))"), t1233))
}

///|
let leadsto_thm42_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm42")

///|
/// `LEADSTO_thm42`
pub fn leadsto_thm42() -> @kernel.Thm {
  leadsto_thm42_c.get()
}

///|
/// LEADSTO_thm43
fn step_187() -> Unit raise {
  let t1237 = @bool.spec_all(leadsto_thm42())
  let t1234 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), (q : (A) -> Bool), (Pr : List[(A) -> A]))"))
  let t1235 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)) → X(p, q, Pr)"))
  let t1236 = @kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)"))
  let t1238 = @tactics.accept_tac(@bool.undisch(@bool.spec_all(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → (X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool)(p, q, Pr)")), t1236, t1235, t1234]))(t1237))))
  let t1239 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1238)
  leadsto_thm43_c.set(@aux_definitions.prove_thm("LEADSTO_thm43", @term_syntax.parse_term("∀ X : ((A) -> Bool, (A) -> Bool, List[(A) -> A]) -> Bool, (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ r : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], ENSURES(p, r, Pr) && LEADSTO(r, q, Pr) && X(p, r, Pr) && X(r, q, Pr) → X(p, q, Pr)) && (∀ p : (A) -> Bool, ∀ P : ((A) -> Bool) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], p == LUB(P) && (∀ p : (A) -> Bool, In(p, P) → LEADSTO(p, q, Pr)) && (∀ p : (A) -> Bool, In(p, P) → X(p, q, Pr)) → X(p, q, Pr)) → (∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ Pr : List[(A) -> A], LEADSTO(p, q, Pr) → X(p, q, Pr))"), t1239))
}

///|
let leadsto_thm43_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_thm43")

///|
/// `LEADSTO_thm43`
pub fn leadsto_thm43() -> @kernel.Thm {
  leadsto_thm43_c.get()
}

///|
/// LEADSTO_cor13_lemma01
fn step_188() -> Unit raise {
  let t1242 = @simp.asm_rewrite_tac(@list.List([]))
  let t1241 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1240 = @simp.rewrite_tac(@list.List([@mk_state_logic.and_le_n_def(), @mk_state_logic.or_def(), @mk_state_logic.and_def()]))
  let t1243 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1240), @tactics.beta_tac), @tactics.eq_tac), t1241), @hol88.res_tac), t1242)
  leadsto_cor13_lemma01_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ Q : (Num, A) -> Bool, ∀ r : (A) -> Bool, ∀ s : A, op_bslash_slash_star(op_slash_bslash_star(op_bslash_slash_star(op_slash_lt_eq_bslash_star(Q, (i : Num)), r), op_bslash_slash_star(Q(SUC(i)), r)), r, s) == op_bslash_slash_star(op_slash_lt_eq_bslash_star(Q, SUC(i)), r, s)")), t1243))
}

///|
let leadsto_cor13_lemma01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor13_lemma01")

///|
/// `LEADSTO_cor13_lemma01`
pub fn leadsto_cor13_lemma01() -> @kernel.Thm {
  leadsto_cor13_lemma01_c.get()
}

///|
/// LEADSTO_cor13
fn step_189() -> Unit raise {
  let t1265 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1266 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1267 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1268 = @term_syntax.parse_term("op_bslash_slash_star((Q : (Num, A) -> Bool)(SUC((i : Num))), (r : (A) -> Bool))")
  let t1269 = @term_syntax.parse_term("(P : (Num, A) -> Bool)(SUC((i : Num)))")
  let t1270 = @term_syntax.parse_term("op_bslash_slash_star(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), (i : Num)), (r : (A) -> Bool))")
  let t1271 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_lt_eq_bslash_star((P : (Num, A) -> Bool), (i : Num))"), t1270, t1269, t1268, t1267, t1266, t1265]), leadsto_thm35())
  let t1262 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS(op_bslash_slash_star((Q : (Num, A) -> Bool)(SUC((i : Num))), (r : (A) -> Bool)), r, CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1263 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS(op_bslash_slash_star(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), (i : Num)), (r : (A) -> Bool)), r, CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1264 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((P : (Num, A) -> Bool)(SUC((i : Num))), op_bslash_slash_star((Q : (Num, A) -> Bool)(SUC(i)), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1272 = @simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_lt_eq_bslash_star((P : (Num, A) -> Bool), (i : Num)), op_bslash_slash_star(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), i), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t1264, t1263, t1262]))(t1271)
  let t1261 = @equal.sym(@bool.spec_all(@bool.conjunct2(@mk_state_logic.and_le_n_def())))
  let t1259 = @bool.spec_all(leadsto_cor13_lemma01())
  let t1260 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(s : A)"), t1259))
  let t1273 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t1260), t1261]))(t1272))
  let t1254 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1255 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1256 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1257 = @bool.specl(@list.List([@term_syntax.parse_term("(Q : (Num, A) -> Bool)(SUC((i : Num)))"), t1256, t1255, t1254]), @mk_unless.unless_thm8())
  let t1258 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("UNLESS((Q : (Num, A) -> Bool)(SUC((i : Num))), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), @mk_unless.unless_thm1()]))(t1257))
  let t1249 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1250 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1251 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1252 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), (i : Num))"), t1251, t1250, t1249]), @mk_unless.unless_thm8())
  let t1253 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("UNLESS(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), (i : Num)), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), @mk_unless.unless_thm1()]))(t1252))
  let t1247 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, UNLESS((Q : (Num, A) -> Bool)(i), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1248 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t1247))
  let t1245 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, LEADSTO((P : (Num, A) -> Bool)(i), op_bslash_slash_star((Q : (Num, A) -> Bool)(i), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1246 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t1245))
  let t1274 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x1244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(@mk_unless.unless_cor17(), x1244), @tactics.assume_tac(@bool.spec_all(@kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, UNLESS(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), i), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))))), t1246), t1248), t1253), t1258), t1273)
  let t1275 = @list.List([@simp.asm_rewrite_tac(@list.List([@mk_state_logic.and_le_n_def()])), t1274])
  let t1276 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t1275)
  leadsto_cor13_c.set(@aux_definitions.prove_thm("LEADSTO_cor13", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ Q : (Num, A) -> Bool, ∀ r : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ i : Num, LEADSTO(P(i), op_bslash_slash_star(Q(i), r), CONS(st, Pr))) && (∀ i : Num, UNLESS(Q(i), r, CONS(st, Pr))) → (∀ i : Num, LEADSTO(op_slash_lt_eq_bslash_star(P, i), op_bslash_slash_star(op_slash_lt_eq_bslash_star(Q, i), r), CONS(st, Pr)))"), t1276))
}

///|
let leadsto_cor13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor13")

///|
/// `LEADSTO_cor13`
pub fn leadsto_cor13() -> @kernel.Thm {
  leadsto_cor13_c.get()
}

///|
/// LEADSTO_cor14
fn step_190() -> Unit raise {
  let t1312 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_assoc_lemma(), @mk_state_logic.or_or_lemma()]))
  let t1310 = @term_syntax.parse_term("op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t1311 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t1310]), @mk_state_logic.or_comm_lemma())]))
  let t1309 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@mk_state_logic.or_and_distr_lemma())))]))
  let t1306 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1307 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1308 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (q' : (A) -> Bool))"), t1307, t1306]), @mk_state_logic.or_comm_and_lemma())]))
  let t1303 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t1304 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1305 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))"), t1304, t1303]), @mk_state_logic.and_or_comm_lemma())]))
  let t1302 = @tactics.undisch_tac(@term_syntax.parse_term("LEADSTO(op_slash_bslash_star((p : (A) -> Bool), (p' : (A) -> Bool)), op_bslash_slash_star(op_slash_bslash_star(op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool)), op_bslash_slash_star((q' : (A) -> Bool), r)), r), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1295 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1296 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1297 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1298 = @term_syntax.parse_term("op_bslash_slash_star((q' : (A) -> Bool), (r : (A) -> Bool))")
  let t1299 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t1300 = @term_syntax.parse_term("op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool))")
  let t1301 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t1300, t1299, t1298, t1297, t1296, t1295]), leadsto_thm35()))
  let t1289 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1290 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1291 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1292 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1293 = @bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(q' : (A) -> Bool)"), t1292, t1291, t1290, t1289]), @mk_unless.unless_thm7()))
  let t1294 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t1293))
  let t1287 = @term_syntax.parse_term("UNLESS((r : (A) -> Bool), r, CONS((st : (A) -> A), (Pr : List[(A) -> A])))")
  let t1288 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((q' : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1287]), @hol88.and_intro_thm())))
  let t1281 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1282 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1283 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1284 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1285 = @bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(q : (A) -> Bool)"), t1284, t1283, t1282, t1281]), @mk_unless.unless_thm7()))
  let t1286 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([@mk_state_logic.or_or_lemma()]))(t1285))
  let t1279 = @term_syntax.parse_term("UNLESS((r : (A) -> Bool), r, CONS((st : (A) -> A), (Pr : List[(A) -> A])))")
  let t1280 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((q : (A) -> Bool), (r : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1279]), @hol88.and_intro_thm())))
  let t1277 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1278 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t1277]), @mk_unless.unless_thm1()))
  let t1313 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1278), t1280), t1286), t1288), t1294), t1301), @hol88.res_tac), t1302), t1305), t1308), t1309), t1311), t1312)
  leadsto_cor14_c.set(@aux_definitions.prove_thm("LEADSTO_cor14", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, op_bslash_slash_star(q, r), CONS(st, Pr)) && UNLESS(q, r, CONS(st, Pr)) && LEADSTO(p', op_bslash_slash_star(q', r), CONS(st, Pr)) && UNLESS(q', r, CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), r), CONS(st, Pr))"), t1313))
}

///|
let leadsto_cor14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor14")

///|
/// `LEADSTO_cor14`
pub fn leadsto_cor14() -> @kernel.Thm {
  leadsto_cor14_c.get()
}

///|
/// LEADSTO_cor15
fn step_191() -> Unit raise {
  let t1393 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1394 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1395 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t1396 = @term_syntax.parse_term("(p' : (A) -> Bool)")
  let t1397 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1398 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1399 = @tactics.strip_assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t1398, t1397, t1396, t1395, t1394, t1393]), leadsto_cor14())))
  let t1392 = @simp.rewrite_tac(@list.List([@bool.gen_all(@equal.sym(@bool.spec_all(@theorems.conj_assoc())))]))
  let t1391 = @tactics.undisch_tac(@term_syntax.parse_term("(LEADSTO((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))), CONS((st : (A) -> A), (Pr : List[(A) -> A]))) && UNLESS(q, op_bslash_slash_star(op_bslash_slash_star(r, b), op_bslash_slash_star(r', b')), CONS(st, Pr))) && LEADSTO((p' : (A) -> Bool), op_bslash_slash_star((q' : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star(r, b), op_bslash_slash_star(r', b'))), CONS(st, Pr)) && UNLESS(q', op_bslash_slash_star(op_bslash_slash_star(r, b), op_bslash_slash_star(r', b')), CONS(st, Pr))"))
  let t1389 = @term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), op_bslash_slash_star((q' : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))), CONS((st : (A) -> A), (Pr : List[(A) -> A]))) && UNLESS(q', op_bslash_slash_star(op_bslash_slash_star(r, b), op_bslash_slash_star(r', b')), CONS(st, Pr))")
  let t1390 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))), CONS((st : (A) -> A), (Pr : List[(A) -> A]))) && UNLESS(q, op_bslash_slash_star(op_bslash_slash_star(r, b), op_bslash_slash_star(r', b')), CONS(st, Pr))"), t1389]), @hol88.and_intro_thm())))
  let t1387 = @term_syntax.parse_term("UNLESS((q' : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")
  let t1388 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), op_bslash_slash_star((q' : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1387]), @hol88.and_intro_thm())))
  let t1385 = @term_syntax.parse_term("UNLESS((q : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")
  let t1386 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1385]), @hol88.and_intro_thm())))
  let t1379 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1380 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1381 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1382 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t1383 = @term_syntax.parse_term("(q' : (A) -> Bool)")
  let t1384 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p' : (A) -> Bool)"), t1383, t1382, t1381, t1380, t1379]), leadsto_thm28())))
  let t1377 = @term_syntax.parse_term("LEADSTO((r' : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star(r', (b' : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")
  let t1378 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("LEADSTO((p' : (A) -> Bool), op_bslash_slash_star((q' : (A) -> Bool), (r' : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1377]), @hol88.and_intro_thm())))
  let t1371 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1372 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1373 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1374 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1375 = @term_syntax.parse_term("(q : (A) -> Bool)")
  let t1376 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(p : (A) -> Bool)"), t1375, t1374, t1373, t1372, t1371]), leadsto_thm28())))
  let t1369 = @term_syntax.parse_term("LEADSTO((r : (A) -> Bool), op_bslash_slash_star(op_bslash_slash_star(r, (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")
  let t1370 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("LEADSTO((p : (A) -> Bool), op_bslash_slash_star((q : (A) -> Bool), (r : (A) -> Bool)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1369]), @hol88.and_intro_thm())))
  let t1365 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1366 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1367 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1368 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(r' : (A) -> Bool)"), t1367, t1366, t1365]), leadsto_thm25())))
  let t1361 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1362 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1363 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1364 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t1363, t1362, t1361]), leadsto_thm25())))
  let t1357 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1358 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1359 = @term_syntax.parse_term("(b' : (A) -> Bool)")
  let t1360 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(q' : (A) -> Bool)"), t1359, t1358, t1357]), @mk_unless.unless_thm3())))
  let t1355 = @term_syntax.parse_term("∀ s : A, (b' : (A) -> Bool)(s) → op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), b'), s)")
  let t1356 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((q' : (A) -> Bool), (b' : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1355]), @hol88.and_intro_thm())))
  let t1351 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1352 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1353 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1354 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(q : (A) -> Bool)"), t1353, t1352, t1351]), @mk_unless.unless_thm3())))
  let t1349 = @term_syntax.parse_term("∀ s : A, (b : (A) -> Bool)(s) → op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), b), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)), s)")
  let t1350 = @tactics.assume_tac(@bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("UNLESS((q : (A) -> Bool), (b : (A) -> Bool), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"), t1349]), @hol88.and_intro_thm())))
  let t1347 = @term_syntax.parse_term("op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t1348 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star(op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))"), t1347]), @mk_state_logic.or_comm_lemma())]))
  let t1344 = @term_syntax.parse_term("op_slash_bslash_star((q : (A) -> Bool), (q' : (A) -> Bool))")
  let t1345 = @term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))")
  let t1346 = @simp.rewrite_tac(@list.List([@equal.sym(@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool))"), t1345, t1344]), @mk_state_logic.or_assoc_lemma()))]))
  let t1342 = @term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool))")
  let t1343 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))"), t1342]), @mk_state_logic.or_comm_lemma())]))
  let t1339 = @term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool))")
  let t1340 = @term_syntax.parse_term("(b' : (A) -> Bool)")
  let t1341 = @simp.rewrite_tac(@list.List([@equal.sym(@bool.specl(@list.List([@term_syntax.parse_term("(r' : (A) -> Bool)"), t1340, t1339]), @mk_state_logic.or_assoc_lemma()))]))
  let t1337 = @term_syntax.parse_term("op_bslash_slash_star((b' : (A) -> Bool), op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)))")
  let t1338 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(r' : (A) -> Bool)"), t1337]), @mk_state_logic.or_imply_weak_lemma()))
  let t1334 = @term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))")
  let t1335 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1336 = @simp.rewrite_tac(@list.List([@equal.sym(@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t1335, t1334]), @mk_state_logic.or_assoc_lemma()))]))
  let t1332 = @term_syntax.parse_term("op_bslash_slash_star((b : (A) -> Bool), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1333 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(r : (A) -> Bool)"), t1332]), @mk_state_logic.or_imply_weak_lemma()))
  let t1330 = @term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool))")
  let t1331 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))"), t1330]), @mk_state_logic.or_comm_lemma())]))
  let t1327 = @term_syntax.parse_term("(b' : (A) -> Bool)")
  let t1328 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t1329 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool))"), t1328, t1327]), @mk_state_logic.or_comm_or_lemma())]))
  let t1324 = @term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool))")
  let t1325 = @term_syntax.parse_term("(r' : (A) -> Bool)")
  let t1326 = @simp.rewrite_tac(@list.List([@equal.sym(@bool.specl(@list.List([@term_syntax.parse_term("(b' : (A) -> Bool)"), t1325, t1324]), @mk_state_logic.or_assoc_lemma()))]))
  let t1322 = @term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), op_bslash_slash_star((r : (A) -> Bool), (b : (A) -> Bool)))")
  let t1323 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b' : (A) -> Bool)"), t1322]), @mk_state_logic.or_imply_weak_lemma()))
  let t1319 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1320 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1321 = @simp.once_rewrite_tac(@list.List([@bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))"), t1320, t1319]), @mk_state_logic.or_comm_or_lemma())]))
  let t1316 = @term_syntax.parse_term("op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool))")
  let t1317 = @term_syntax.parse_term("(r : (A) -> Bool)")
  let t1318 = @simp.rewrite_tac(@list.List([@equal.sym(@bool.specl(@list.List([@term_syntax.parse_term("(b : (A) -> Bool)"), t1317, t1316]), @mk_state_logic.or_assoc_lemma()))]))
  let t1314 = @term_syntax.parse_term("op_bslash_slash_star((r : (A) -> Bool), op_bslash_slash_star((r' : (A) -> Bool), (b' : (A) -> Bool)))")
  let t1315 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b : (A) -> Bool)"), t1314]), @mk_state_logic.or_imply_weak_lemma()))
  let t1400 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1315), t1318), t1321), @tactics.disch_tac), t1323), t1326), t1329), t1331), @tactics.disch_tac), t1333), t1336), @tactics.disch_tac), t1338), t1341), t1343), @tactics.disch_tac), t1346), t1348), t1350), t1354), t1356), t1360), t1364), t1368), t1370), t1376), t1378), t1384), t1386), t1388), t1390), t1391), t1392), @tactics.disch_tac), t1399)
  leadsto_cor15_c.set(@aux_definitions.prove_thm("LEADSTO_cor15", @term_syntax.parse_term("∀ p : (A) -> Bool, ∀ q : (A) -> Bool, ∀ r : (A) -> Bool, ∀ b : (A) -> Bool, ∀ p' : (A) -> Bool, ∀ q' : (A) -> Bool, ∀ r' : (A) -> Bool, ∀ b' : (A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], LEADSTO(p, op_bslash_slash_star(q, r), CONS(st, Pr)) && UNLESS(q, b, CONS(st, Pr)) && LEADSTO(p', op_bslash_slash_star(q', r'), CONS(st, Pr)) && UNLESS(q', b', CONS(st, Pr)) → LEADSTO(op_slash_bslash_star(p, p'), op_bslash_slash_star(op_slash_bslash_star(q, q'), op_bslash_slash_star(op_bslash_slash_star(r, b), op_bslash_slash_star(r', b'))), CONS(st, Pr))"), t1400))
}

///|
let leadsto_cor15_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor15")

///|
/// `LEADSTO_cor15`
pub fn leadsto_cor15() -> @kernel.Thm {
  leadsto_cor15_c.get()
}

///|
/// LEADSTO_cor16_lemma1
fn step_192() -> Unit raise {
  let t1403 = @simp.asm_rewrite_tac(@list.List([]))
  let t1402 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1401 = @simp.rewrite_tac(@list.List([@mk_state_logic.or_def(), @mk_state_logic.and_le_n_def(), @mk_state_logic.or_le_n_def(), @mk_state_logic.and_def()]))
  let t1404 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1401), @tactics.beta_tac), @tactics.eq_tac), t1402), @hol88.res_tac), t1403)
  leadsto_cor16_lemma1_c.set(@tactics.tac_proof((@list.List([]), @term_syntax.parse_term("∀ Q : (Num, A) -> Bool, ∀ R : (Num, A) -> Bool, ∀ B : (Num, A) -> Bool, ∀ i : Num, ∀ s : A, op_bslash_slash_star(op_slash_lt_eq_bslash_star(Q, SUC(i)), op_bslash_slash_star(op_bslash_slash_star(op_bslash_slash_star(op_bslash_lt_eq_slash_star(R, i), op_bslash_lt_eq_slash_star(B, i)), op_bslash_lt_eq_slash_star(B, i)), op_bslash_slash_star(R(SUC(i)), B(SUC(i)))), s) == op_bslash_slash_star(op_slash_lt_eq_bslash_star(Q, SUC(i)), op_bslash_slash_star(op_bslash_lt_eq_slash_star(R, SUC(i)), op_bslash_lt_eq_slash_star(B, SUC(i))), s)")), t1404))
}

///|
let leadsto_cor16_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor16_lemma1")

///|
/// `LEADSTO_cor16_lemma1`
pub fn leadsto_cor16_lemma1() -> @kernel.Thm {
  leadsto_cor16_lemma1_c.get()
}

///|
/// LEADSTO_cor16
fn step_193() -> Unit raise {
  let t1426 = @term_syntax.parse_term("(Pr : List[(A) -> A])")
  let t1427 = @term_syntax.parse_term("(st : (A) -> A)")
  let t1428 = @term_syntax.parse_term("(B : (Num, A) -> Bool)(SUC((i : Num)))")
  let t1429 = @term_syntax.parse_term("(R : (Num, A) -> Bool)(SUC((i : Num)))")
  let t1430 = @term_syntax.parse_term("(Q : (Num, A) -> Bool)(SUC((i : Num)))")
  let t1431 = @term_syntax.parse_term("(P : (Num, A) -> Bool)(SUC((i : Num)))")
  let t1432 = @term_syntax.parse_term("op_bslash_lt_eq_slash_star((B : (Num, A) -> Bool), (i : Num))")
  let t1433 = @term_syntax.parse_term("op_bslash_slash_star(op_bslash_lt_eq_slash_star((R : (Num, A) -> Bool), (i : Num)), op_bslash_lt_eq_slash_star((B : (Num, A) -> Bool), i))")
  let t1434 = @term_syntax.parse_term("op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), (i : Num))")
  let t1435 = @bool.specl(@list.List([@term_syntax.parse_term("op_slash_lt_eq_bslash_star((P : (Num, A) -> Bool), (i : Num))"), t1434, t1433, t1432, t1431, t1430, t1429, t1428, t1427, t1426]), leadsto_cor15())
  let t1423 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), (i : Num)), op_bslash_lt_eq_slash_star((B : (Num, A) -> Bool), i), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1424 = @kernel.assume_rule(@term_syntax.parse_term("UNLESS((Q : (Num, A) -> Bool)(SUC((i : Num))), (B : (Num, A) -> Bool)(SUC(i)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1425 = @kernel.assume_rule(@term_syntax.parse_term("LEADSTO((P : (Num, A) -> Bool)(SUC((i : Num))), op_bslash_slash_star((Q : (Num, A) -> Bool)(SUC(i)), (R : (Num, A) -> Bool)(SUC(i))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1436 = @simp.rewrite_rule(@list.List([@kernel.assume_rule(@term_syntax.parse_term("LEADSTO(op_slash_lt_eq_bslash_star((P : (Num, A) -> Bool), (i : Num)), op_bslash_slash_star(op_slash_lt_eq_bslash_star((Q : (Num, A) -> Bool), i), op_bslash_slash_star(op_bslash_lt_eq_slash_star((R : (Num, A) -> Bool), i), op_bslash_lt_eq_slash_star((B : (Num, A) -> Bool), i))), CONS((st : (A) -> A), (Pr : List[(A) -> A])))")), t1425, t1424, t1423]))(t1435)
  let t1437 = @simp.rewrite_rule(@list.List([@equal.sym(@bool.spec_all(@bool.conjunct2(@mk_state_logic.and_le_n_def())))]))(t1436)
  let t1421 = @bool.spec_all(leadsto_cor16_lemma1())
  let t1422 = @hol88.mk_abs(@bool.gen(@term_syntax.parse_term("(s : A)"), t1421))
  let t1438 = @tactics.accept_tac(@simp.rewrite_rule(@list.List([@simp.once_rewrite_rule(@list.List([@class.eta_ax()]))(t1422)]))(t1437))
  let t1417 = @term_syntax.parse_term("CONS((st : (A) -> A), (Pr : List[(A) -> A]))")
  let t1418 = @term_syntax.parse_term("(B : (Num, A) -> Bool)")
  let t1419 = @bool.undisch_all(@bool.specl(@list.List([@term_syntax.parse_term("(Q : (Num, A) -> Bool)"), t1418, t1417]), @mk_unless.unless_cor16()))
  let t1420 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(i : Num)"), t1419))
  let t1415 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, UNLESS((Q : (Num, A) -> Bool)(i), (B : (Num, A) -> Bool)(i), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1416 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t1415))
  let t1414 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, LEADSTO((P : (Num, A) -> Bool)(i), op_bslash_slash_star((Q : (Num, A) -> Bool)(i), (R : (Num, A) -> Bool)(i)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1439 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.assume_tac(@bool.spec(@term_syntax.parse_term("SUC((i : Num))"), t1414)), t1416), t1420), t1438)
  let t1410 = @term_syntax.parse_term("op_bslash_slash_star((Q : (Num, A) -> Bool)(0), op_bslash_slash_star((R : (Num, A) -> Bool)(0), (B : (Num, A) -> Bool)(0)))")
  let t1411 = @term_syntax.parse_term("op_bslash_slash_star((Q : (Num, A) -> Bool)(0), (R : (Num, A) -> Bool)(0))")
  let t1412 = @bool.specl(@list.List([@term_syntax.parse_term("(P : (Num, A) -> Bool)(0)"), t1411, t1410]), leadsto_cor9())
  let t1408 = @kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, LEADSTO((P : (Num, A) -> Bool)(i), op_bslash_slash_star((Q : (Num, A) -> Bool)(i), (R : (Num, A) -> Bool)(i)), CONS((st : (A) -> A), (Pr : List[(A) -> A])))"))
  let t1409 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("0"), t1408))
  let t1405 = @term_syntax.parse_term("(B : (Num, A) -> Bool)(0)")
  let t1406 = @bool.specl(@list.List([@term_syntax.parse_term("op_bslash_slash_star((Q : (Num, A) -> Bool)(0), (R : (Num, A) -> Bool)(0))"), t1405]), @mk_state_logic.or_imply_weak_lemma())
  let t1407 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([@mk_state_logic.or_assoc_lemma()]))(t1406))
  let t1440 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@mk_state_logic.and_le_n_def(), @mk_state_logic.or_le_n_def()])), t1407), t1409), (x1413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @hol88.imp_res_tac(t1412, x1413)), t1439])
  let t1441 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t1440)
  leadsto_cor16_c.set(@aux_definitions.prove_thm("LEADSTO_cor16", @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ Q : (Num, A) -> Bool, ∀ R : (Num, A) -> Bool, ∀ B : (Num, A) -> Bool, ∀ st : (A) -> A, ∀ Pr : List[(A) -> A], (∀ i : Num, LEADSTO(P(i), op_bslash_slash_star(Q(i), R(i)), CONS(st, Pr))) && (∀ i : Num, UNLESS(Q(i), B(i), CONS(st, Pr))) → (∀ i : Num, LEADSTO(op_slash_lt_eq_bslash_star(P, i), op_bslash_slash_star(op_slash_lt_eq_bslash_star(Q, i), op_bslash_slash_star(op_bslash_lt_eq_slash_star(R, i), op_bslash_lt_eq_slash_star(B, i))), CONS(st, Pr)))"), t1441))
}

///|
let leadsto_cor16_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEADSTO_cor16")

///|
/// `LEADSTO_cor16`
pub fn leadsto_cor16() -> @kernel.Thm {
  leadsto_cor16_c.get()
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
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
}
