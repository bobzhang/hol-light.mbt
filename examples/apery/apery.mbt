// Translated from upstream Examples/apery.ml; edit this file directly.

///|
/// LCM_DEF
fn step_1() -> Unit raise {
  lcm_def_c.set(@define.define_(@term_syntax.parse_term("(LCM : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == iterate((m : Num) => (n : Num) => lcm((m, n)), s, I)")))
}

///|
let lcm_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_DEF")

///|
/// `LCM_DEF`
pub fn lcm_def() -> @kernel.Thm {
  lcm_def_c.get()
}

///|
/// LCM_CLAUSES
fn step_2() -> Unit raise {
  let t1 = @simp.asm_simp_tac(@list.List([lcm_def(), @prime.monoidal_lcm(), @iterate.iterate_clauses(), @trivia.i_thm(), @prime.neutral_lcm()]))
  lcm_clauses_c.set(@tactics.prove(@term_syntax.parse_term("LCM({}) == 1 && (∀ x : Num, ∀ s : (Num) -> Bool, FINITE(s) → LCM(INSERT(x, s)) == (if IN(x, s) { LCM(s) } else { lcm((x, LCM(s))) }))"), t1))
}

///|
let lcm_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_CLAUSES")

///|
/// `LCM_CLAUSES`
pub fn lcm_clauses() -> @kernel.Thm {
  lcm_clauses_c.get()
}

///|
/// LCM_CLAUSES_NUMSEG
fn step_3() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([@iterate.numseg_empty()]))
  let t6 = @tactics.match_mp_tac(@meson.meson(@list.List([lcm_clauses()]), @term_syntax.parse_term("(s : (Num) -> Bool) == {} → LCM(s) == 1")))
  let t5 = @simp.rewrite_tac(@list.List([@prime.lcm_sym()]))
  let t4 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")), @prime.lcm_1(), @sets.not_in_empty()]))
  let t3 = @simp.asm_simp_tac(@list.List([lcm_clauses(), @iterate.finite_numseg(), @iterate.in_numseg(), @sets.finite_empty()]))
  let t2 = @tactics.repeat_tac(@tactics.strip_tac)
  let t8 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.numseg_clauses()])), t2), @class.cond_cases_tac), t3), t4), t5), t6), t7), @int.asm_arith_tac)
  lcm_clauses_numseg_c.set(@tactics.prove(@term_syntax.parse_term("(∀ m : Num, LCM(op_dot_dot(m, 0)) == (if m == 0 { 0 } else { 1 })) && (∀ m : Num, ∀ n : Num, LCM(op_dot_dot(m, SUC(n))) == (if m <= SUC(n) { lcm((LCM(op_dot_dot(m, n)), SUC(n))) } else { 1 }))"), t8))
}

///|
let lcm_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_CLAUSES_NUMSEG")

///|
/// `LCM_CLAUSES_NUMSEG`
pub fn lcm_clauses_numseg() -> @kernel.Thm {
  lcm_clauses_numseg_c.get()
}

///|
/// LCM_EQ_0
fn step_4() -> Unit raise {
  let t9 = @sets.set_tac(@list.List([]))
  let t10 = @tactics.then_tac(@simp.simp_tac(@list.List([lcm_def(), @prime.iterate_lcm_eq_0(), @trivia.i_thm()])), t9)
  lcm_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → (LCM(s) == 0) == IN(0, s)"), t10))
}

///|
let lcm_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_EQ_0")

///|
/// `LCM_EQ_0`
pub fn lcm_eq_0() -> @kernel.Thm {
  lcm_eq_0_c.get()
}

///|
/// LCM_NONZERO
fn step_5() -> Unit raise {
  let t11 = @simp.simp_tac(@list.List([lcm_eq_0(), @iterate.finite_numseg(), @iterate.in_numseg(), @calc_num.arith()]))
  lcm_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(LCM(op_dot_dot(1, n)) == 0)"), t11))
}

///|
let lcm_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_NONZERO")

///|
/// `LCM_NONZERO`
pub fn lcm_nonzero() -> @kernel.Thm {
  lcm_nonzero_c.get()
}

///|
/// DIVIDES_LCM_SET
fn step_6() -> Unit raise {
  let t16 = @simp.asm_rewrite_tac(@list.List([@trivia.i_thm()]))
  let t13 = @term_syntax.parse_term("(n : Num)")
  let t14 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t15 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(I : (Num) -> Num)"), t14, t13]), @prime.divides_iterate_lcm()))
  let t12 = @simp.rewrite_tac(@list.List([lcm_def()]))
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t12), t15), t16)
  divides_lcm_set_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ n : Num, FINITE(s) && IN(n, s) → divides(n, LCM(s))"), t17))
}

///|
let divides_lcm_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LCM_SET")

///|
/// `DIVIDES_LCM_SET`
pub fn divides_lcm_set() -> @kernel.Thm {
  divides_lcm_set_c.get()
}

///|
/// DIVIDES_LCM_NUMSEG
fn step_7() -> Unit raise {
  let t19 = @simp.asm_simp_tac(@list.List([@iterate.in_numseg(), @iterate.finite_numseg(), @arith.le_1()]))
  let t18 = @tactics.match_mp_tac(divides_lcm_set())
  let t20 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t18), t19)
  divides_lcm_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, 1 <= m && m <= n → divides(m, LCM(op_dot_dot(1, n)))"), t20))
}

///|
let divides_lcm_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LCM_NUMSEG")

///|
/// `DIVIDES_LCM_NUMSEG`
pub fn divides_lcm_numseg() -> @kernel.Thm {
  divides_lcm_numseg_c.get()
}

///|
/// PRIMEPOW_DIVIDES_SET_LCM
fn step_8() -> Unit raise {
  let t24 = @meson.asm_meson_tac(@list.List([@sets.member_not_empty(), @arith.exp(), @prime.divides_1()]))
  let t23 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t22 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (Num) -> Bool) == {}"))
  let t21 = @simp.asm_simp_tac(@list.List([lcm_def(), @prime.primepow_divides_iterate_lcm(), @trivia.i_thm()]))
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t21), t22), t23), t24)
  primepow_divides_set_lcm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ p : Num, ∀ k : Num, FINITE(s) && prime(p) → divides(EXP(p, k), LCM(s)) == (s == {} && k == 0 || (∃ n : Num, IN(n, s) && divides(EXP(p, k), n)))"), t25))
}

///|
let primepow_divides_set_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIMEPOW_DIVIDES_SET_LCM")

///|
/// `PRIMEPOW_DIVIDES_SET_LCM`
pub fn primepow_divides_set_lcm() -> @kernel.Thm {
  primepow_divides_set_lcm_c.get()
}

///|
/// PRIMEPOW_DIVIDES_NUMSEG_LCM
fn step_9() -> Unit raise {
  let t27 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @equal.gsym(@theorems.conj_assoc())]))
  let t26 = @simp.rewrite_tac(@list.List([@iterate.numseg_empty(), @int.arith_rule(@term_syntax.parse_term("((n : Num) < 1) == (n == 0)"))]))
  let t28 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([primepow_divides_set_lcm(), @iterate.finite_numseg()])), t26), t27)
  primepow_divides_numseg_lcm_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, prime(p) → divides(EXP(p, k), LCM(op_dot_dot(1, n))) == (n == 0 && k == 0 || (∃ m : Num, 1 <= m && m <= n && divides(EXP(p, k), m)))"), t28))
}

///|
let primepow_divides_numseg_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIMEPOW_DIVIDES_NUMSEG_LCM")

///|
/// `PRIMEPOW_DIVIDES_NUMSEG_LCM`
pub fn primepow_divides_numseg_lcm() -> @kernel.Thm {
  primepow_divides_numseg_lcm_c.get()
}

///|
/// PRIMEPOW_DIVIDES_NUMSEG_LCM_SIMPLE
fn step_10() -> Unit raise {
  let t38 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (p : Num)) == !(p == 0)")), @prime.prime_imp_nz(), @arith.exp_eq_0()]))
  let t37 = @simp.asm_rewrite_tac(@list.List([@prime.divides_refl()]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (k : Num))"))), t37), t38)
  let t36 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), @arith.le_1()]))
  let t33 = @drule.match_mp(@int.divides_le())
  let t35 = @tactics.first_assum(fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s31 = @tactics.mp_tac(x30)
      fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s31(x32)
      }
    })(t33(x34))
  })
  let t40 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(@tactics.strip_assume_tac)), t35), t36), t39])
  let t29 = @simp.asm_simp_tac(@list.List([primepow_divides_numseg_lcm()]))
  let t41 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t29), @tactics.ap_term_tac), @tactics.eq_tac), t40)
  primepow_divides_numseg_lcm_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, prime(p) → divides(EXP(p, k), LCM(op_dot_dot(1, n))) == (n == 0 && k == 0 || EXP(p, k) <= n)"), t41))
}

///|
let primepow_divides_numseg_lcm_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIMEPOW_DIVIDES_NUMSEG_LCM_SIMPLE")

///|
/// `PRIMEPOW_DIVIDES_NUMSEG_LCM_SIMPLE`
pub fn primepow_divides_numseg_lcm_simple() -> @kernel.Thm {
  primepow_divides_numseg_lcm_simple_c.get()
}

///|
/// BINOM_MULTIPLE_DIVIDES_LCM
fn step_11() -> Unit raise {
  let t93 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t91 = @term_syntax.parse_term("EXP((p : Num), (j : Num))")
  let t92 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t91]), @arith.division()))
  let t89 = @term_syntax.parse_term("EXP((p : Num), (j : Num))")
  let t90 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) - (m : Num)"), t89]), @arith.division()))
  let t88 = @simp.asm_rewrite_tac(@list.List([]))
  let t87 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t86 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ m : Num, m <= (n : Num) && m + (n - m) < (x : Num) → n < x")))
  let t85 = @simp.asm_simp_tac(@list.List([@arith.le_ldiv_eq(), @arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t84 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.not_le()), @arith.div_lt(), @arith.le_0()]))
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses()])), @class.cond_cases_tac), t84), t85), t86), t87), t88), t90), t92), t93), @int.asm_arith_tac)
  let t83 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t81 = @term_syntax.parse_term("EXP((p : Num), (j : Num))")
  let t82 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) - (m : Num)"), t81]), @arith.division()))
  let t80 = @simp.asm_rewrite_tac(@list.List([]))
  let t79 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) && n - m < (p : Num) → n < m + p")))
  let t78 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) * ((d : Num) + (e : Num) + 1) == d * p + (e * p + p)"))]))
  let t77 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@int.divides_div_mult()])))
  let t76 = @simp.asm_simp_tac(@list.List([@arith.le_ldiv_eq(), @arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t75 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 + (a : Num) <= (b : Num) + ((c : Num) + 1)) == (a <= b + c)"))]))
  let t95 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@int.divides_le(), @arith.le_trans(), @arith.le_1()]))])), t75), t76), t77), t78), t79), t80), t82), t83), @int.asm_arith_tac), t94])
  let t74 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @class.asm_cases_tac(@term_syntax.parse_term("divides(EXP((p : Num), (j : Num)), (m : Num))"))
  let t72 = @simp.asm_simp_tac(@list.List([primepow_divides_numseg_lcm_simple()]))
  let t71 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t69 = @tactics.try_tac(@tactics.match_mp_tac(@iterate.nsum_le_gen()))
  let t67 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && ((Q : (_) -> Bool)(x) || (R : (_) -> Bool)(x))} == UNION({(x : _) | P(x) && Q(x)}, {(x : _) | P(x) && R(x)})"))
  let t68 = @meson.meson(@list.List([@calc_num.arith()]), @term_syntax.parse_term("((if (p : Bool) { 1 } else { 0 }) == 0) == !p"))
  let t66 = @bool.spec_all(@iterate.nsum_add_gen())
  let t70 = @tactics.replicate_tac(2, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.conv_rule(@equal.rand_conv(@equal.sym_conv), t66), @sets.in_elim_thm(), @arith.div_eq_0(), @arith.exp_eq_0(), @arith.not_lt(), @prime.finite_exp_le(), @prime.finite_indices(), lcm_nonzero(), t68, @arith.add_eq_0(), @class.de_morgan_thm(), @sets.finite_union(), @arith.le_1(), t67])), t69))
  let t65 = @simp.rewrite_tac(@list.List([@iterate.nsum_restrict_set()]))
  let t64 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(x : _) | P(x)}) && Q(x)}"))]))
  let t63 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.nsum_const()), @prime.finite_indices(), @arith.le_1(), lcm_nonzero()]))
  let t62 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("CARD((s : (_) -> Bool)) == CARD(s) * 1"))]))
  let t61 = @simp.asm_simp_tac(@list.List([@prime.index_def(), @arith.le_1(), lcm_nonzero()]))
  let t60 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → (∀ k : Num, k <= a → k <= b)")))
  let t59 = @simp.asm_simp_tac(@list.List([@prime.primepow_divides_index(), @arith.mult_eq_0(), @arith.fact_nz(), @prime.index_fact_unbounded(), @arith.le_1(), lcm_nonzero(), @prime.index_mul()]))
  let t56 = @drule.match_mp(@prime.prime_ge_2())
  let t58 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x57 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s54 = @tactics.mp_tac(x53)
      fn(x55 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s54(x55)
      }
    })(t56(x57))
  }), @int.arith_tac), @tactics.all_tac])
  let t52 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) && 2 <= p && !(p <= 1)"), @tactics.strip_assume_tac)
  let t51 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t50 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t49 = @simp.once_rewrite_tac(@list.List([@prime.primepow_divisors_divides()]))
  let t48 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t47 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) * (k : Num) * ((x : Num) * (b : Num)) == x * (k * (m * b))"))]))
  let t46 = @simp.asm_simp_tac(@list.List([@arith.mult_eq_0(), @arith.fact_nz(), @arith.sub_add()]))
  let t44 = @term_syntax.parse_term("(m : Num)")
  let t45 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) - (m : Num)"), t44]), @binomial.binom_fact()))
  let t43 = @tactics.exists_tac(@term_syntax.parse_term("FACT((m : Num)) * FACT((n : Num) - m)"))
  let t42 = @tactics.match_mp_tac(@prime.divides_cmul2())
  let t96 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t42), t43), t45), t46), t47), @tactics.disch_tac), t48), t49), t50), t51), @tactics.disch_tac), t52), t58), t59), t60), t61), t62), t63), t64), t65), t70), t71), @tactics.disch_tac), t72), t73), t74), t95)
  binom_multiple_divides_lcm_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, 1 <= m && m <= (n : Num) → divides(m * binom((n, m)), LCM(op_dot_dot(1, n)))"), t96))
}

///|
let binom_multiple_divides_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_MULTIPLE_DIVIDES_LCM")

///|
/// `BINOM_MULTIPLE_DIVIDES_LCM`
pub fn binom_multiple_divides_lcm() -> @kernel.Thm {
  binom_multiple_divides_lcm_c.get()
}

///|
/// ZETA
fn step_12() -> Unit raise {
  zeta_c.set(@pair.new_definition(@term_syntax.parse_term("(ZETA : (Real) -> Real)((x : Real)) == Re(zeta(Cx(x)))")))
}

///|
let zeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA")

///|
/// `ZETA`
pub fn zeta() -> @kernel.Thm {
  zeta_c.get()
}

///|
/// cc
fn step_13() -> Unit raise {
  cc_c.set(@pair.new_definition(@term_syntax.parse_term("(cc : (Num, Num) -> Real)((n : Num), (k : Num)) == pow(real_of_num(binom((n + k, k))), 2) * pow(real_of_num(binom((n, k))), 2)")))
}

///|
let cc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cc")

///|
/// `cc`
pub fn cc() -> @kernel.Thm {
  cc_c.get()
}

///|
/// zz
fn step_14() -> Unit raise {
  zz_c.set(@pair.new_definition(@term_syntax.parse_term("(zz : (Num) -> Real)((n : Num)) == sum(op_dot_dot(1, n), (k : Num) => real_of_num(1) / pow(real_of_num(k), 3))")))
}

///|
let zz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("zz")

///|
/// `zz`
pub fn zz() -> @kernel.Thm {
  zz_c.get()
}

///|
/// aa
fn step_15() -> Unit raise {
  aa_c.set(@pair.new_definition(@term_syntax.parse_term("(aa : (Num) -> Real)((n : Num)) == sum(op_dot_dot(0, n), (k : Num) => cc(n, k))")))
}

///|
let aa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("aa")

///|
/// `aa`
pub fn aa() -> @kernel.Thm {
  aa_c.get()
}

///|
/// bb
fn step_16() -> Unit raise {
  bb_c.set(@pair.new_definition(@term_syntax.parse_term("(bb : (Num) -> Real)((n : Num)) == aa(n) * zz(n) + sum(op_dot_dot(1, n), (k : Num) => sum(op_dot_dot(1, k), (m : Num) => pow(-real_of_num(1), m + 1) / (real_of_num(2) * (pow(real_of_num(m), 3) * (real_of_num(binom((n, m))) * real_of_num(binom((n + m, m)))))) * cc(n, k)))")))
}

///|
let bb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bb")

///|
/// `bb`
pub fn bb() -> @kernel.Thm {
  bb_c.get()
}

///|
/// BB_ALT
fn step_17() -> Unit raise {
  let t112 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg(), @real.real_mul_ac()]))
  let t111 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @calc_int.real_mul_lneg(), @realax.real_mul_lid(), @calc_int.real_mul_rneg()]))
  let t110 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (m : Num) → m + 1 == SUC(SUC(m - 1))"))]))
  let t109 = @simp.rewrite_tac(@list.List([]))
  let t108 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t107 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t106 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t105 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t104 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t103 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t102 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.arith_eq(), @calc_int.real_mul_rzero(), @realax.real_add_lid()]))
  let t99 = @term_syntax.parse_term("(n : Num)")
  let t100 = @term_syntax.parse_term("0")
  let t101 = @simp.simp_tac(@list.List([@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t100, t99]), @iterate.sum_clauses_left()), @arith.le_0()]))
  let t98 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t97 = @simp.rewrite_tac(@list.List([bb(), aa(), cc(), @equal.gsym(@iterate.sum_rmul()), @real.real_pow_mul()]))
  let t113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib(), @iterate.sum_add_numseg()]))), t97), t98), @tactics.ap_term_tac), t101), t102), t103), t104), t105), @tactics.strip_tac), t106), t107), t108), @tactics.strip_tac), t109), t110), t111), t112)
  bb_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, bb(n) == sum(op_dot_dot(0, n), (k : Num) => pow(real_of_num(binom((n + k, k))), 2) * (pow(real_of_num(binom((n, k))), 2) * (zz(n) + sum(op_dot_dot(1, k), (m : Num) => pow(-real_of_num(1), m - 1) / (real_of_num(2) * (pow(real_of_num(m), 3) * (real_of_num(binom((n + m, m))) * real_of_num(binom((n, m))))))))))"), t113))
}

///|
let bb_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_ALT")

///|
/// `BB_ALT`
pub fn bb_alt() -> @kernel.Thm {
  bb_alt_c.get()
}

///|
/// DIVIDES_NPRODUCT_FROM_MEMBER
fn step_18() -> Unit raise {
  let t117 = @meson.meson_tac(@list.List([@prime.divides_lmul(), @prime.divides_rmul()]))
  let t116 = @simp.simp_tac(@list.List([@sets.in_insert(), @iterate.nproduct_clauses()]))
  let t115 = @simp.rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t114 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t114), t115), t116), t117)
  divides_nproduct_from_member_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ n : Num, ∀ x : A, FINITE(s) && divides(n, (f : (A) -> Num)(x)) && IN(x, s) → divides(n, nproduct(s, f))"), t118))
}

///|
let divides_nproduct_from_member_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_NPRODUCT_FROM_MEMBER")

///|
/// `DIVIDES_NPRODUCT_FROM_MEMBER`
pub fn divides_nproduct_from_member() -> @kernel.Thm {
  divides_nproduct_from_member_c.get()
}

///|
/// LOG_LCM_BOUND
fn step_19() -> Unit raise {
  let t216 = @meson.meson_tac(@list.List([@prime.prime_0()]))
  let t215 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t214 = @simp.rewrite_tac(@list.List([@sets.extension(), @iterate.in_numseg(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t213 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t212 = @simp.simp_tac(@list.List([@iterate.sum_const(), @sets.finite_restrict(), @iterate.finite_numseg()]))
  let t217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])), t212), t213), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t214), t215), t216)
  let t211 = @meson.meson_tac(@list.List([@floor.floor()]))
  let t210 = @simp.asm_rewrite_tac(@list.List([]))
  let t206 = @term_syntax.parse_term("(p : Num)")
  let t209 = @tactics.first_x_assum(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s204 = @tactics.mp_tac(x203)
      fn(x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s204(x205)
      }
    })(((x207 : @kernel.Thm) => @bool.spec(t206, x207))(x208))
  })
  let t201 = @int.arith_rule(@term_syntax.parse_term("(1 < (n : Num)) == (2 <= n)"))
  let t202 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), @transcendentals.log_pos_lt(), @real.real_of_num_lt(), @prime.prime_ge_2(), t201]))
  let t200 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pow(), @real.real_of_num_lt(), @arith.le_1()]))
  let t199 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t198 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t197 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @iterate.finite_numseg(), @sets.forall_in_gspec()]))
  let t218 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le()), t197), t198), t199), @tactics.strip_tac), t200), t202), t209), t210), t211), t217])
  let t195 = @term_syntax.parse_term("sum({(p : Num) | IN(p, op_dot_dot(1, (n : Num))) && prime(p)}, (p : Num) => log(real_of_num(n)))")
  let t196 = @tactics.trans_tac(@realax.real_le_trans())(t195)
  let t194 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_of_num_pow())]))
  let t219 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.log_product(), @arith.le_1(), @arith.exp_eq_0(), @prime.prime_imp_nz(), @sets.finite_restrict(), @products.real_of_num_nproduct(), @iterate.finite_numseg(), @real.real_of_num_lt(), @sets.forall_in_gspec()])), t194), t196), @tactics.conj_tac), t218)
  let t191 = @meson.asm_meson_tac(@list.List([@prime.prime_imp_nz()]))
  let t190 = @simp.rewrite_tac(@list.List([@arith.exp_lt_0()]))
  let t189 = @list.List([@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac])
  let t188 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le(), @realax.real_of_num_le(), @calc_int.real_of_num_pow()]))
  let t187 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t185 = @equal.gsym(@transcendentals.log_pow())
  let t186 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @transcendentals.log_pos_lt(), @real.real_of_num_lt(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("(1 < (p : Num)) == (2 <= p)")), t185, @prime.prime_imp_nz(), @arith.le_1()]))
  let t184 = @simp.rewrite_tac(@list.List([@floor.floor()]))
  let t183 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < floor(x) + real_of_num(1) && (k : Real) <= x → floor(x) == (a : Real) → k < a + real_of_num(1)")))
  let t181 = @equal.gsym(@realax.real_of_num_add())
  let t182 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt()), t181]))
  let t180 = @simp.asm_rewrite_tac(@list.List([]))
  let t176 = @term_syntax.parse_term("(p : Num)")
  let t179 = @tactics.first_x_assum(fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s174 = @tactics.mp_tac(x173)
      fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s174(x175)
      }
    })(((x177 : @kernel.Thm) => @bool.spec(t176, x177))(x178))
  })
  let t172 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t169 = @drule.match_mp(@int.divides_le())
  let t171 = @tactics.first_x_assum(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s167 = @tactics.mp_tac(x166)
      fn(x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s167(x168)
      }
    })(t169(x170))
  })
  let t192 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) <= (n : Num)) == (m < n + 1)"))]))), t171), t172), @tactics.disch_tac), t179), t180), t182), t183), t184), t186), t187), t188), @tactics.conj_tac), t189), t190), t191)
  let t162 = @drule.match_mp(@int.divides_le())
  let t164 = @tactics.then_tac(@tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s160 = @tactics.mp_tac(x159)
      fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s160(x161)
      }
    })(t162(x163))
  }), @int.asm_arith_tac)
  let t158 = @simp.asm_simp_tac(@list.List([@prime.divides_exp_le(), @prime.prime_ge_2(), @arith.le_1()]))
  let t157 = @simp.gen_rewrite_tac(fn(x154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s155 = @equal.land_conv(x154)
    fn(x156 : @kernel.Term) -> @kernel.Thm raise {
      s155(x156)
    }
  }, @list.List([@equal.gsym(@arith.exp_1())]))
  let t153 = @simp.asm_rewrite_tac(@list.List([]))
  let t152 = @term_syntax.parse_term("EXP((p : Num), (k : Num))")
  let t165 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.trans_tac(@prime.divides_trans())(t152), t153), t157), t158), t164])
  let t193 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("divides((p : Num), (m : Num))"), fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.mp_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  }), t165), t192])
  let t148 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (b → (a : Bool)) → a && b")))
  let t147 = @simp.asm_simp_tac(@list.List([@prime.prime_ge_2(), @prime.divides_exp_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p"))]))
  let t146 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @sets.finite_restrict(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t145 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t144 = @tactics.match_mp_tac(divides_nproduct_from_member())
  let t143 = @simp.asm_rewrite_tac(@list.List([@arith.exp(), @prime.divides_1()]))
  let t142 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t141 = @tactics.repeat_tac(@tactics.strip_tac)
  let t140 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t139 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj(), primepow_divides_numseg_lcm()]))
  let t138 = @simp.once_rewrite_tac(@list.List([@prime.primepow_divisors_divides()]))
  let t136 = @meson.meson_tac(@list.List([@prime.prime_imp_nz()]))
  let t135 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @arith.exp_eq_0()]))
  let t137 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@products.nproduct_eq_0(), @iterate.finite_numseg(), @sets.finite_restrict()])), t135), t136), @tactics.all_tac])
  let t134 = @tactics.match_mp_tac(@meson.meson(@list.List([@int.divides_le()]), @term_syntax.parse_term("!((n : Num) == 0) && divides((m : Num), n) → m <= n")))
  let t133 = @simp.asm_simp_tac(@list.List([@real.real_of_num_lt(), lcm_nonzero(), @arith.le_1(), @realax.real_of_num_le()]))
  let t220 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_mono_le_imp()), t133), t134), @tactics.conj_tac), t137), t138), t139), t140), t141), t142), t143), t144), t145), t146), t147), t148), @tactics.conj_tac), t193), t219])
  let t131 = @term_syntax.parse_term("log(real_of_num(nproduct({(p : Num) | IN(p, op_dot_dot(1, (n : Num))) && prime(p)}, (p : Num) => EXP(p, (a : (Num) -> Num)(p)))))")
  let t132 = @tactics.trans_tac(@realax.real_le_trans())(t131)
  let t129 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @arith.le_1(), @prime.prime_imp_nz(), @realax.real_of_num_le()]))
  let t128 = @tactics.match_mp_tac(@real.real_le_div())
  let t127 = @tactics.match_mp_tac(@floor.floor_pos())
  let t126 = @tactics.conv_tac(@class.select_conv)
  let t125 = @simp.expand_tac("a")
  let t130 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t125), t126), t127), t128), t129), @tactics.all_tac])
  let t124 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Num, prime(p) → floor(log(real_of_num((n : Num))) / log(real_of_num(p))) == real_of_num((a : (Num) -> Num)(p))"), fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s122 = @tactics.assume_tac(x121)
    fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s122(x123)
    }
  })
  let t120 = @simp.abbrev_tac(@term_syntax.parse_term("(a : (Num) -> Num) == ((p : Num) => select((k : Num) => floor(log(real_of_num((n : Num))) / log(real_of_num(p))) == real_of_num(k)))"))
  let t119 = @simp.asm_simp_tac(@list.List([lcm_clauses_numseg(), @calc_num.arith(), @transcendentals.log_1(), @realax.real_add_lid(), @realarith.real_pos()]))
  let t221 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t119), t120), t124), t130), t132), @tactics.conj_tac), t220)
  log_lcm_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → log(real_of_num(LCM(op_dot_dot(1, n)))) <= log(real_of_num(n)) * real_of_num(CARD({(p : Num) | prime(p) && p <= n}))"), t221))
}

///|
let log_lcm_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_LCM_BOUND")

///|
/// `LOG_LCM_BOUND`
pub fn log_lcm_bound() -> @kernel.Thm {
  log_lcm_bound_c.get()
}

///|
/// LCM_BOUND
fn step_20() -> Unit raise {
  let t271 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv(), @real.real_mul_ac()]))
  let t268 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - real_of_num(1)) < (e : Real) → (y : Real) == x → y < real_of_num(1) + e")))
  let t270 = @tactics.first_x_assum(fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t268(x269))
  })
  let t267 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq())]))
  let t266 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @tactics.all_tac])
  let t265 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num))"), fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s263 = @tactics.assume_tac(x262)
    fn(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s263(x264)
    }
  })
  let t261 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(log_lcm_bound()), @int.asm_arith_tac), @tactics.all_tac])
  let t259 = @term_syntax.parse_term("log(real_of_num((n : Num))) * real_of_num(CARD({(p : Num) | prime(p) && p <= n}))")
  let t260 = @tactics.trans_tac(@realarith.real_let_trans())(t259)
  let t258 = @tactics.disch_then(fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s255 = @tactics.subst1_tac(x254)
      fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s255(x256)
      }
    })(@equal.sym(x257))
  })
  let t253 = @simp.simp_tac(@list.List([@transcendentals.real_exp_pos_lt(), @real.real_of_num_lt(), lcm_nonzero(), @arith.le_1(), @transcendentals.log_exp()]))
  let t248 = @drule.part_match(fn(x247 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x247))
  }, @transcendentals.log_mono_lt())
  let t240 = @term_syntax.parse_term("(n : Num)")
  let t243 = @tactics.first_x_assum(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s238 = @tactics.mp_tac(x237)
      fn(x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s238(x239)
      }
    })(((x241 : @kernel.Thm) => @bool.spec(t240, x241))(x242))
  })
  let t236 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t235 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t232 = @term_syntax.parse_term("(N : Num)")
  let t234 = @tactics.disch_then((x233 : @kernel.Thm) => @tactics.x_choose_tac(t232, x233))
  let t231 = @simp.asm_rewrite_tac(@list.List([]))
  let t227 = @term_syntax.parse_term("(e : Real)")
  let t230 = @tactics.disch_then(fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s225 = @tactics.mp_tac(x224)
      fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s225(x226)
      }
    })(((x228 : @kernel.Thm) => @bool.spec(t227, x228))(x229))
  })
  let t223 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially(), @metric.eventually_sequentially()]))
  let t222 = @tactics.mp_tac(@pnt.pnt())
  let t272 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t222), t223), t230), t231), t234), t235), t236), @tactics.disch_tac), t243), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), @tactics.disch_tac), fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x251 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x249 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x244 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s245 = @tactics.mp_tac(x244)
          fn(x246 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s245(x246)
          }
        })(t248(x249))
      })((fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x250.1
      })(x251))
    })(x252)(x252)
  }), t253), t258), t260), @tactics.conj_tac), t261), t265), t266), t267), t270), t271)
  lcm_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Real, real_of_num(0) < e → eventually((n : Num) => real_of_num(LCM(op_dot_dot(1, n))) < exp((real_of_num(1) + e) * real_of_num(n)), sequentially)"), t272))
}

///|
let lcm_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_BOUND")

///|
/// `LCM_BOUND`
pub fn lcm_bound() -> @kernel.Thm {
  lcm_bound_c.get()
}

///|
/// LCM_BOUND_SIMPLE
fn step_21() -> Unit raise {
  let t301 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t300 = @simp.simp_tac(@list.List([@transcendentals.exp_log(), @real.real_of_num_lt(), @calc_num.arith(), @equal.gsym(@calc_int.real_of_num_pow())]))
  let t299 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_n()]))
  let t302 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])), t299), t300), t301)
  let t298 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t297 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t296 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t292 = @equal.gsym(@complexes.cx_pow())
  let t293 = @equal.gsym(@complexes.cx_div())
  let t294 = @equal.gsym(@complexes.cx_sub())
  let t295 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t294, t293, t292, @complexes.complex_norm_cx()]))
  let t291 = @tactics.conv_tac(@equal.once_depth_conv(@vectors.expand_vsum_conv))
  let t288 = @equal.gsym(@complexes.cx_sub())
  let t289 = @equal.gsym(@complexes.cx_div())
  let t290 = @simp.simp_tac(@list.List([@complexes.re_cx(), @calc_int.real_abs_num(), @equal.gsym(@transcendentals.cx_exp()), t289, t288, @complexes.complex_pow_one(), @complexes.complex_norm_cx()]))
  let t286 = @term_syntax.parse_term("Cx(real_of_num(17) / real_of_num(16))")
  let t287 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("8"), t286]), @transcendentals.taylor_cexp()))
  let t285 = @simp.simp_tac(@list.List([@transcendentals.exp_log(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t284 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_mono_le())]))
  let t283 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t282 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t303 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()])), t282), t283), t284), t285), t287), t290), t291), t295), t296), t297), t298), @calc_rat.real_arith_tac), t302])
  let t280 = @term_syntax.parse_term("exp(log(real_of_num(3)) * real_of_num((n : Num)))")
  let t281 = @tactics.trans_tac(@realax.real_le_trans())(t280)
  let t279 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realarith.real_lte_trans()))
  let t278 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt())]))
  let t277 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t276 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t275 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t274 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t273 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t304 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) / real_of_num(16)"), lcm_bound())), t273), t274), t275), @tactics.gen_tac), t276), @tactics.gen_tac), t277), t278), t279), t281), @tactics.conj_tac), t303)
  lcm_bound_simple_c.set(@tactics.prove(@term_syntax.parse_term("∃ N : Num, ∀ n : Num, N <= n → LCM(op_dot_dot(1, n)) < EXP(3, n)"), t304))
}

///|
let lcm_bound_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_BOUND_SIMPLE")

///|
/// `LCM_BOUND_SIMPLE`
pub fn lcm_bound_simple() -> @kernel.Thm {
  lcm_bound_simple_c.get()
}

///|
/// CC_EQ_0
fn step_22() -> Unit raise {
  let t305 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cc(), @binomial.binom_eq_0(), @realarith.real_entire(), @real.real_pow_eq_0(), @realax.real_of_num_eq(), @calc_num.arith_eq()])), @int.arith_tac)
  cc_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, (cc(n, k) == real_of_num(0)) == (n + 1 <= k)"), t305))
}

///|
let cc_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CC_EQ_0")

///|
/// `CC_EQ_0`
pub fn cc_eq_0() -> @kernel.Thm {
  cc_eq_0_c.get()
}

///|
/// CC_POS_LT
fn step_23() -> Unit raise {
  let t310 = @simp.simp_tac(@list.List([@realarith.real_pos(), @real.real_pow_le(), @realax.real_le_mul()]))
  let t309 = @list.List([@simp.rewrite_tac(@list.List([cc()])), @int.asm_arith_tac])
  let t308 = @simp.rewrite_tac(@list.List([cc_eq_0()]))
  let t307 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t306 = @simp.rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t311 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t306), t307), t308), @tactics.conj_tac), t309), t310)
  cc_pos_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k <= n → real_of_num(0) < cc(n, k)"), t311))
}

///|
let cc_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CC_POS_LT")

///|
/// `CC_POS_LT`
pub fn cc_pos_lt() -> @kernel.Thm {
  cc_pos_lt_c.get()
}

///|
/// AA_POS_LT
fn step_24() -> Unit raise {
  let t315 = @simp.simp_tac(@list.List([@arith.le_0(), cc_pos_lt()]))
  let t314 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t313 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @realarith.real_lt_imp_le(), cc_pos_lt()]))
  let t312 = @tactics.match_mp_tac(@iterate.sum_pos_lt())
  let t316 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([aa()]))), t312), t313), t314), t315)
  aa_pos_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(0) < aa(n)"), t316))
}

///|
let aa_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_POS_LT")

///|
/// `AA_POS_LT`
pub fn aa_pos_lt() -> @kernel.Thm {
  aa_pos_lt_c.get()
}

///|
/// AA_NONZERO
fn step_25() -> Unit raise {
  let t317 = @simp.simp_tac(@list.List([@real.real_lt_imp_nz(), aa_pos_lt()]))
  aa_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(aa(n) == real_of_num(0))"), t317))
}

///|
let aa_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_NONZERO")

///|
/// `AA_NONZERO`
pub fn aa_nonzero() -> @kernel.Thm {
  aa_nonzero_c.get()
}

///|
/// RE_SUMMAND
fn step_26() -> Unit raise {
  let t324 = @equal.gsym(@complexes.cx_div())
  let t325 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), t324, @complexes.re_cx()]))
  let t322 = @simp.rewrite_rule(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t326 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s320 = @tactics.mp_tac(x319)
      fn(x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s320(x321)
      }
    })(t322(x323))
  }), @int.asm_arith_tac), t325])
  let t318 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_n()]))
  let t327 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t318), @class.cond_cases_tac), t326)
  re_summand_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, 1 <= k → Re(Cx(real_of_num(1)) / cpow(Cx(real_of_num(k)), Cx(real_of_num(3)))) == real_of_num(1) / pow(real_of_num(k), 3)"), t327))
}

///|
let re_summand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_SUMMAND")

///|
/// `RE_SUMMAND`
pub fn re_summand() -> @kernel.Thm {
  re_summand_c.get()
}

///|
/// ZZ_SUMS
fn step_27() -> Unit raise {
  let t336 = @simp.rewrite_tac(@list.List([zeta(), @trivia.o_def()]))
  let t333 = @drule.match_mp(@realanalysis.real_sums_re())
  let t335 = @tactics.disch_then(fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s331 = @tactics.mp_tac(x330)
      fn(x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s331(x332)
      }
    })(t333(x334))
  })
  let t329 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < real_of_num(3)")), @complexes.re_cx()]))
  let t337 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(3))"), @pnt.zeta_converges())), t329), t335), t336)
  let t338 = @list.List([@simp.simp_tac(@list.List([@misc.in_from(), re_summand()])), t337])
  let t328 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => Re(Cx(real_of_num(1)) / cpow(Cx(real_of_num(k)), Cx(real_of_num(3))))"))
  let t339 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_sums_eq()), t328), @tactics.conj_tac), t338)
  zz_sums_c.set(@tactics.prove(@term_syntax.parse_term("real_sums((k : Num) => real_of_num(1) / pow(real_of_num(k), 3), ZETA(real_of_num(3)), from(1))"), t339))
}

///|
let zz_sums_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZZ_SUMS")

///|
/// `ZZ_SUMS`
pub fn zz_sums() -> @kernel.Thm {
  zz_sums_c.get()
}

///|
/// ZZ_LIM
fn step_28() -> Unit raise {
  let t343 = @simp.rewrite_tac(@list.List([@realanalysis.real_sums()]))
  let t344 = @tactics.then_tac(@tactics.mp_tac(zz_sums()), t343)
  let t345 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), zz(), @misc.from_inter_numseg()])), t344])
  let t346 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("zz == ((n : Num) => sum(INTER(from(1), op_dot_dot(0, n)), (k : Num) => real_of_num(1) / pow(real_of_num(k), 3)))"), fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s341 = @tactics.subst1_tac(x340)
    fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s341(x342)
    }
  }), t345)
  zz_lim_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt(zz, ZETA(real_of_num(3)), sequentially)"), t346))
}

///|
let zz_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZZ_LIM")

///|
/// `ZZ_LIM`
pub fn zz_lim() -> @kernel.Thm {
  zz_lim_c.get()
}

///|
/// ZETA3_POS
fn step_29() -> Unit raise {
  let t367 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @realarith.real_pos()]))
  let t364 = @drule.match_mp(@realanalysis.real_infsum_unique())
  let t366 = @tactics.first_assum(fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s362 = @tactics.assume_tac(x361)
      fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s362(x363)
      }
    })(t364(x365))
  })
  let t359 = @drule.match_mp(@realanalysis.real_sums_summable())
  let t368 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s357 = @tactics.assume_tac(x356)
      fn(x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s357(x358)
      }
    })(t359(x360))
  }), t366), t367), @calc_rat.asm_real_arith_tac)
  let t355 = @simp.rewrite_tac(@list.List([@realanalysis.real_sums(), @simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(zz()), @misc.from_inter_numseg(), @realax.real_div(), @realax.real_mul_lid()]))
  let t369 = @list.List([@tactics.then_tac(@tactics.mp_tac(zz_lim()), t355), t368])
  let t354 = @tactics.subgoal_then(@term_syntax.parse_term("real_sums((n : Num) => inv(pow(real_of_num(n), 3)), ZETA(real_of_num(3)), from(1))"), fn(x351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s352 = @tactics.assume_tac(x351)
    fn(x353 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s352(x353)
    }
  })
  let t350 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @real.real_le_inv_eq(), @realarith.real_pos()]))
  let t349 = @simp.rewrite_tac(@list.List([@sets.finite_sing(), @sets.sing_subset(), @iterate.sum_sing(), @misc.in_from()]))
  let t347 = @term_syntax.parse_term("{1}")
  let t348 = @term_syntax.parse_term("from(1)")
  let t370 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => inv(pow(real_of_num(n), 3))"), t348, t347]), @realanalysis.real_partial_sums_le_infsum_gen())), t349), t350), t354), t369)
  zeta3_pos_c.set(@tactics.prove(@term_syntax.parse_term("real_of_num(0) < ZETA(real_of_num(3))"), t370))
}

///|
let zeta3_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA3_POS")

///|
/// `ZETA3_POS`
pub fn zeta3_pos() -> @kernel.Thm {
  zeta3_pos_c.get()
}

///|
/// BB_OVER_AA_LIM
fn step_30() -> Unit raise {
  let t450 = @simp.rewrite_tac(@list.List([@sets.subset(), @iterate.in_numseg()]))
  let t449 = @simp.simp_tac(@list.List([@iterate.in_numseg(), @sets.in_diff(), @iterate.finite_numseg(), @realarith.real_lt_imp_le(), cc_pos_lt()]))
  let t448 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t447 = @simp.rewrite_tac(@list.List([@realarith.real_pos(), aa()]))
  let t446 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t451 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_lmul()])), t446), t447), t448), t449), t450), @int.arith_tac)
  let t445 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @real.real_le_rmul_eq(), cc_pos_lt(), @real.real_abs_mul(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x")), @iterate.in_numseg(), @calc_int.real_abs_num(), @realax.real_of_num_le()]))
  let t452 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_abs_le()), t445), t451])
  let t443 = @term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (k : Num) => real_of_num(n) * cc(n, k))")
  let t444 = @tactics.trans_tac(@realax.real_le_trans())(t443)
  let t442 = @simp.asm_simp_tac(@list.List([@arith.le_1(), @real.real_of_num_lt(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → inv(real_of_num(2)) / x * (a : Real) * (real_of_num(2) * pow(x, 2)) == x * a"))]))
  let t440 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t441 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), @real.real_pow_lt(), t440, @real.real_of_num_lt(), @arith.le_1()]))
  let t439 = @simp.rewrite_tac(@list.List([@real.real_abs_inv(), @real.real_abs_mul(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t438 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc(), @iterate.sum_rmul(), @real.real_abs_mul()]))
  let t437 = @simp.simp_tac(@list.List([aa_pos_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x")), @real.real_le_ldiv_eq()]))
  let t436 = @simp.rewrite_tac(@list.List([@real.real_abs_div()]))
  let t435 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t434 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t433 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t432 = @simp.simp_tac(@list.List([@realanalysis.reallim_1_over_n(), @realanalysis.reallim_null_lmul()]))
  let t431 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => inv(real_of_num(2)) * inv(real_of_num(n))"))
  let t430 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t428 = @simp.asm_simp_tac(@list.List([cc_pos_lt(), @realarith.real_lt_imp_le(), @realarith.real_pos()]))
  let t427 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t426 = @simp.rewrite_tac(@list.List([]))
  let t425 = @tactics.repeat_tac(@tactics.strip_tac)
  let t424 = @tactics.match_mp_tac(@iterate.sum_pos_le_numseg())
  let t423 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) <= x")))
  let t422 = @simp.simp_tac(@list.List([@iterate.sum_const(), @iterate.card_numseg_1(), @iterate.finite_numseg()]))
  let t420 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t421 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_div2_eq(), @real.real_pow_lt(), t420, @real.real_of_num_lt(), aa_pos_lt(), @arith.le_1(), @calc_num.arith()]))
  let t419 = @simp.simp_tac(@list.List([aa_pos_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x"))]))
  let t418 = @simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_rmul(), @real.real_abs_mul(), @real.real_abs_inv(), @real.real_abs_pow(), @calc_int.real_abs_num(), @realax.real_mul_assoc()]))
  let t417 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t416 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t429 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t416), t417), @tactics.disch_tac), t418), t419), t421), t422), t423), t424), t425), t426), t427), t428), @tactics.all_tac])
  let t415 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum(op_dot_dot(1, n), (k : Num) => real_of_num(k) * (cc(n, k) / (real_of_num(2) * pow(real_of_num(n), 2)))) / aa(n)"))
  let t414 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t410 = @tactics.match_mp_tac(@binomial.binom_ge_top())
  let t409 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) <= binom((n, (m : Num))) && n + m <= binom((n + m, m)) → n <= binom((n, m)) && n <= binom((n + m, m))")))
  let t408 = @tactics.match_mp_tac(@arith.le_mult2())
  let t407 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0(), @arith.le_1()]))
  let t406 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t411 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) * n <= (b : Num) * (c : Num) && 1 * (b * c) <= (m : Num) * (b * c) → EXP(n, 2) <= m * (b * c)"))), t406), t407), t408), t409), @tactics.conj_tac), t410), @int.asm_arith_tac)
  let t405 = @simp.rewrite_tac(@list.List([@binomial.binom_eq_0()]))
  let t404 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")), @arith.mult_eq_0()]))
  let t403 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t412 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) <= EXP((m : Num), 3) * (x : Num)) == (n * 1 <= EXP(m, 2) * (m * x))"))])), t403), @tactics.disj2_tac), t404), t405), @int.asm_arith_tac), t411])
  let t402 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == (n : Num)"))
  let t401 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_mul(), @realax.real_of_num_le()]))
  let t400 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t399 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t398 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t397 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_pow_lt(), @real.real_of_num_lt(), @arith.le_1(), @calc_num.arith()]))
  let t396 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t395 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul_eq(), cc_pos_lt(), @real.real_abs_inv()]))
  let t394 = @simp.gen_rewrite_tac(fn(x391 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s392 = @equal.rand_conv(x391)
    fn(x393 : @kernel.Term) -> @kernel.Thm raise {
      s392(x393)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t390 = @simp.asm_simp_tac(@list.List([cc_pos_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x"))]))
  let t389 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_abs_mul(), @real.real_abs_pow(), @calc_int.real_abs_neg(), @calc_int.real_abs_num(), @real.real_pow_one(), @realax.real_mul_lid()]))
  let t388 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t387 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t386 = @tactics.match_mp_tac(@iterate.sum_abs_le())
  let t385 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t384 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t383 = @tactics.match_mp_tac(@iterate.sum_abs_le())
  let t382 = @simp.simp_tac(@list.List([@real.real_abs_div(), aa_pos_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x")), @real.real_le_div2_eq()]))
  let t381 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t380 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t413 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t380), t381), @tactics.disch_tac), t382), t383), t384), t385), @tactics.strip_tac), t386), t387), t388), @tactics.strip_tac), t389), t390), t394), t395), t396), t397), t398), t399), t400), t401), t402), t412), @tactics.all_tac])
  let t379 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum(op_dot_dot(1, n), (k : Num) => sum(op_dot_dot(1, k), (m : Num) => cc(n, k) / (real_of_num(2) * pow(real_of_num(n), 2)))) / aa(n)"))
  let t378 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t377 = @simp.rewrite_tac(@list.List([zz_lim()]))
  let t376 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t375 = @simp.gen_rewrite_tac(fn(x372 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s373 = @equal.land_conv(x372)
    fn(x374 : @kernel.Term) -> @kernel.Thm raise {
      s373(x374)
    }
  }, @list.List([@equal.gsym(@calc_int.real_add_rid())]))
  let t371 = @simp.simp_tac(@list.List([@real.real_div_refl(), aa_nonzero(), @realax.real_mul_lid()]))
  let t453 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([bb(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * (z : Real) + (s : Real)) / a == a / a * z + s / a"))])), t371), t375), t376), t377), t378), t379), @tactics.conj_tac), t413), t414), t415), @tactics.conj_tac), t429), t430), t431), t432), t433), t434), t435), @tactics.disch_tac), t436), t437), t438), t439), t441), t442), t444), @tactics.conj_tac), t452)
  bb_over_aa_lim_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => bb(n) / aa(n), ZETA(real_of_num(3)), sequentially)"), t453))
}

///|
let bb_over_aa_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_OVER_AA_LIM")

///|
/// `BB_OVER_AA_LIM`
pub fn bb_over_aa_lim() -> @kernel.Thm {
  bb_over_aa_lim_c.get()
}

///|
/// AA_INTEGER
fn step_31() -> Unit raise {
  let t455 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t454 = @tactics.match_mp_tac(@floor.integer_sum())
  let t456 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([aa(), cc()]))), t454), t455)
  aa_integer_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, integer(aa(n))"), t456))
}

///|
let aa_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_INTEGER")

///|
/// `AA_INTEGER`
pub fn aa_integer() -> @kernel.Thm {
  aa_integer_c.get()
}

///|
/// BB_INTEGER
fn step_32() -> Unit raise {
  let t535 = @tactics.conv_tac(@calc_rat.real_field)
  let t534 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t526 = @term_syntax.parse_term("(n : Num) - (m : Num)")
  let t527 = @term_syntax.parse_term("(n : Num) - (k : Num)")
  let t528 = @term_syntax.parse_term("(k : Num) - (m : Num)")
  let t529 = @term_syntax.parse_term("(m : Num) + (n : Num)")
  let t530 = @term_syntax.parse_term("(k : Num) + (n : Num)")
  let t531 = @term_syntax.parse_term("(n : Num)")
  let t532 = @term_syntax.parse_term("(m : Num)")
  let t533 = @tactics.map_every(fn(x525 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s520 = @tactics.mp_tac(x519)
      fn(x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s520(x521)
      }
    })((fn(x524 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x522 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x523 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x522, x523)
        }
      })(x524)(@arith.fact_nz())
    })(x525))
  }, @list.List([@term_syntax.parse_term("(k : Num)"), t532, t531, t530, t529, t528, t527, t526]))
  let t518 = @simp.rewrite_tac(@list.List([@arith.add_sym()]))
  let t517 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @realarith.real_pow_2(), @real.real_inv_inv()]))
  let t516 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) - (m : Num) - (n - (k : Num)) == k - m && n + k - (k - m) == n + m"), fn(x514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x514
    @simp.rewrite_tac(@list.List([th]))
  })
  let t513 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t512 = @tactics.repeat_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.all_tac, @int.asm_arith_tac])))
  let t511 = @simp.asm_rewrite_tac(@list.List([@binomial.real_of_num_binom(), @arith.le_add(), @simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add())]))
  let t510 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) <= (n : Num)"), fn(x507 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s508 = @tactics.assume_tac(x507)
    fn(x509 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s508(x509)
    }
  })
  let t506 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t505 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (a * c)"))]))
  let t504 = @simp.once_rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t503 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t502 = @simp.rewrite_tac(@list.List([cc()]))
  let t500 = @meson.asm_meson_tac(@list.List([@arith.le_trans()]))
  let t499 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj(), primepow_divides_numseg_lcm(), @arith.le_1()]))
  let t498 = @simp.once_rewrite_tac(@list.List([@prime.primepow_divisors_divides()]))
  let t497 = @simp.asm_simp_tac(@list.List([binom_multiple_divides_lcm()]))
  let t495 = @term_syntax.parse_term("LCM(op_dot_dot(1, (k : Num)))")
  let t496 = @tactics.trans_tac(@prime.divides_trans())(t495)
  let t492 = @simp.rewrite_tac(@list.List([@floor.integer_div(), @realax.real_of_num_mul()]))
  let t493 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@floor.integer_mul()), t492), @tactics.disj2_tac)
  let t494 = @list.List([@tactics.then_tac(@tactics.disj2_tac, @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("divides((m : Num) * binom(((k : Num), m)), LCM(op_dot_dot(1, (n : Num)))) → divides(m, LCM(op_dot_dot(1, n)))")))), t493])
  let t491 = @simp.rewrite_tac(@list.List([@floor.integer_div()]))
  let t490 = @tactics.match_mp_tac(@floor.integer_mul())
  let t489 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t488 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t487 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((x : Real), 3) * (pow((y : Real), 3) * pow((z : Real), 2)) == x * y * (x * (y * z) * (x * (y * z)))"))]))
  let t486 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_pow()]))
  let t485 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t484 = @tactics.match_mp_tac(@floor.integer_mul())
  let t501 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) / (c : Real)) == b * (a / c)"))])), t484), t485), t486), t487), t488), t489), t490), t491), @tactics.conj_tac), t494), t496), t497), t498), t499), t500), @tactics.all_tac])
  let t483 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(LCM(op_dot_dot(1, (n : Num)))), 3) * (real_of_num(binom((n, (k : Num)))) * (real_of_num(binom((n + k, k))) * (real_of_num(binom((n - (m : Num), n - k))) * real_of_num(binom((n + k, k - m))))) / (pow(real_of_num(m), 3) * pow(real_of_num(binom((k, m))), 2)))"))
  let t482 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("∀ y : Real, integer(y) && (x : Real) == y → integer(x)")))
  let t481 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t480 = @tactics.match_mp_tac(@floor.integer_mul())
  let t479 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * ((l : Real) * ((s : Real) * (inv(real_of_num(2)) * inv((y : Real))) * (c : Real))) == s * (l * (c / y))"))]))
  let t478 = @simp.once_rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t477 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t476 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t475 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t474 = @tactics.match_mp_tac(@floor.integer_sum())
  let t473 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t472 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t471 = @tactics.match_mp_tac(@floor.integer_sum())
  let t469 = @simp.asm_simp_tac(@list.List([divides_lcm_numseg()]))
  let t468 = @tactics.match_mp_tac(@prime.divides_exp())
  let t467 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @floor.integer_div()]))
  let t466 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @calc_int.real_of_num_pow()]))
  let t465 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t464 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t463 = @tactics.match_mp_tac(@floor.integer_sum())
  let t462 = @simp.rewrite_tac(@list.List([zz(), @equal.gsym(@iterate.sum_lmul())]))
  let t461 = @simp.rewrite_tac(@list.List([aa_integer()]))
  let t460 = @tactics.match_mp_tac(@floor.integer_mul())
  let t459 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (a * c)"))]))
  let t458 = @simp.rewrite_tac(@list.List([@floor.integer_closed()]))
  let t470 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@floor.integer_mul()), t458), t459), t460), t461), t462), t463), t464), t465), @tactics.strip_tac), t466), t467), @tactics.disj2_tac), t468), t469), @tactics.all_tac])
  let t457 = @tactics.match_mp_tac(@floor.integer_add())
  let t536 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([bb(), @realax.real_add_ldistrib(), @equal.gsym(@iterate.sum_lmul())]))), t457), @tactics.conj_tac), t470), t471), t472), t473), @tactics.strip_tac), t474), t475), t476), @tactics.strip_tac), t477), t478), t479), t480), t481), t482), t483), @tactics.conj_tac), t501), @tactics.ap_term_tac), t502), t503), t504), t505), @tactics.ap_term_tac), t506), t510), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t511), t512), t513), t516), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t517), t518), t533), t534), t535)
  bb_integer_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, integer(real_of_num(2) * (pow(real_of_num(LCM(op_dot_dot(1, n))), 3) * bb(n)))"), t536))
}

///|
let bb_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_INTEGER")

///|
/// `BB_INTEGER`
pub fn bb_integer() -> @kernel.Thm {
  bb_integer_c.get()
}

///|
/// pp
fn step_33() -> Unit raise {
  pp_c.set(@pair.new_definition(@term_syntax.parse_term("(pp : (Num, Num) -> Real)((n : Num), (k : Num)) == -real_of_num(4) * (pow(real_of_num(k), 4) * ((real_of_num(12) * real_of_num(n) + (real_of_num(4) * pow(real_of_num(n), 2) + (real_of_num(8) + (real_of_num(3) * real_of_num(k) - real_of_num(2) * pow(real_of_num(k), 2))))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * cc(n, k))))")))
}

///|
let pp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pp")

///|
/// `pp`
pub fn pp() -> @kernel.Thm {
  pp_c.get()
}

///|
/// qq
fn step_34() -> Unit raise {
  qq_c.set(@pair.new_definition(@term_syntax.parse_term("(qq : (Num, Num) -> Real)((n : Num), (k : Num)) == pow(real_of_num(n) + (real_of_num(1) - real_of_num(k)), 2) * pow(real_of_num(n) + (real_of_num(2) - real_of_num(k)), 2)")))
}

///|
let qq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qq")

///|
/// `qq`
pub fn qq() -> @kernel.Thm {
  qq_c.get()
}

///|
/// CC_STEP_K
fn step_35() -> Unit raise {
  let t546 = @simp.rewrite_tac(@list.List([@real.real_pow_inv(), @realax.real_mul_assoc(), @realax.real_div()]))
  let t545 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_add_assoc())]))
  let t544 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t543 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @real.real_pow_pow()]))
  let t541 = @equal.gsym(@realarith.real_pow_2())
  let t542 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t541]))
  let t540 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / (c : Real) * ((b : Real) / c) == a * b * (inv(c) * inv(c))"))]))
  let t539 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((a : Real) * (b : Real), 2) * pow((c : Real) * (d : Real), 2) == pow(a * c, 2) * (pow(b, 2) * pow(d, 2))"))]))
  let t538 = @simp.rewrite_tac(@list.List([@binomial.binom_bottom_step_real()]))
  let t537 = @simp.rewrite_tac(@list.List([cc(), @arith.add_assoc(), @binomial.binom_both_step_real()]))
  let t547 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t537), t538), t539), t540), t542), t543), t544), t545), t546), @calc_rat.real_arith_tac)
  cc_step_k_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, cc(n, k + 1) == pow(pow(real_of_num(n), 2) - pow(real_of_num(k), 2) + (real_of_num(n) - real_of_num(k)), 2) / pow(real_of_num(k) + real_of_num(1), 4) * cc(n, k)"), t547))
}

///|
let cc_step_k_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CC_STEP_K")

///|
/// `CC_STEP_K`
pub fn cc_step_k() -> @kernel.Thm {
  cc_step_k_c.get()
}

///|
/// CC_STEP_N
fn step_36() -> Unit raise {
  let t561 = @tactics.conv_tac(@calc_rat.real_field)
  let t559 = @equal.gsym(@realax.real_of_num_add())
  let t560 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t559]))
  let t558 = @tactics.pop_assum(fn(x555 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s556 = @tactics.mp_tac(x555)
    fn(x557 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s556(x557)
    }
  })
  let t554 = @tactics.replicate_tac(2, @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac))
  let t553 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t562 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((x : Real) * (b : Real), 2) * pow((y : Real) * (c : Real), 2) == pow(x * y, 2) * (pow(b, 2) * pow(c, 2))"))])), t553), t554), t558), t560), t561)
  let t552 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + (n + 1) == 1 + 2 * n"))]))
  let t563 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_one(), @realarith.real_mul_rid(), @calc_rat.real_field(@term_syntax.parse_term("(real_of_num((n : Num)) + (real_of_num(n) + real_of_num(1)) + real_of_num(1)) / (real_of_num(n) + (real_of_num(n) + real_of_num(1)) + (real_of_num(1) - (real_of_num(n) + real_of_num(1)))) == real_of_num(2)"))])), t552), @calc_rat.real_arith_tac), t562])
  let t551 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t550 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) == (n : Num) + k + 1)"))]))
  let t549 = @tactics.repeat_tac(@tactics.gen_tac)
  let t548 = @simp.rewrite_tac(@list.List([cc(), @binomial.binom_top_step_real(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + (k : Num) == n + k + 1"))]))
  let t564 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (n : Num) + 1 == 1 + 2 * n"))])), t548), t549), t550), @class.cond_cases_tac), t551), t563)
  cc_step_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, cc(n + 1, k) == (if k == n + 1 { real_of_num(4) * pow(real_of_num(binom((2 * n + 1, n + 1))), 2) } else { pow(real_of_num(n) + (real_of_num(1) + real_of_num(k)), 2) / pow(real_of_num(n) + (real_of_num(1) - real_of_num(k)), 2) * cc(n, k) })"), t564))
}

///|
let cc_step_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CC_STEP_N")

///|
/// `CC_STEP_N`
pub fn cc_step_n() -> @kernel.Thm {
  cc_step_n_c.get()
}

///|
/// AA_LEMMA
fn step_37() -> Unit raise {
  let t578 = @tactics.conv_tac(@calc_rat.real_field)
  let t577 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t574 = @simp.gen_rewrite_rule(fn(x571 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s572 = @equal.rand_conv(x571)
    fn(x573 : @kernel.Term) -> @kernel.Thm raise {
      s572(x573)
    }
  }, @list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t576 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s569 = @tactics.mp_tac(x568)
      fn(x570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s569(x570)
      }
    })(t574(x575))
  }))
  let t567 = @simp.rewrite_tac(@list.List([pp(), qq(), cc_step_k()]))
  let t566 = @tactics.repeat_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@int.asm_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])))
  let t565 = @simp.rewrite_tac(@list.List([cc_step_n(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 == n + 1 + 1"))]))
  let t579 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t565), t566), t567), t576), t577), t578)
  aa_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k <= n → ((-real_of_num(3) * pow(real_of_num(n), 2) - real_of_num(3) * real_of_num(n) - pow(real_of_num(n), 3) - real_of_num(1)) * cc(n, k) + ((real_of_num(34) * pow(real_of_num(n), 3) + (real_of_num(153) * pow(real_of_num(n), 2) + (real_of_num(231) * real_of_num(n) + real_of_num(117)))) * cc(n + 1, k) + (pow(-real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(n), 2) - real_of_num(12) * real_of_num(n) - real_of_num(8)) * cc(n + 2, k))) * (qq(n, k) * qq(n, k + 1)) == pp(n, k) * qq(n, k + 1) - pp(n, k + 1) * qq(n, k)"), t579))
}

///|
let aa_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_LEMMA")

///|
/// `AA_LEMMA`
pub fn aa_lemma() -> @kernel.Thm {
  aa_lemma_c.get()
}

///|
/// TELESCOPING_RATIONAL_SUM
fn step_38() -> Unit raise {
  let t612 = @tactics.conv_tac(@calc_rat.real_ring)
  let t611 = @tactics.repeat_tac(@tactics.pop_assum(fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s609 = @tactics.mp_tac(x608)
    fn(x610 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s609(x610)
    }
  }))
  let t607 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t603 = @term_syntax.parse_term("(n : Num)")
  let t606 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s601 = @tactics.mp_tac(x600)
      fn(x602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s601(x602)
      }
    })(((x604 : @kernel.Thm) => @bool.spec(t603, x604))(x605))
  }))
  let t599 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t598 = @tactics.first_x_assum(fn(x597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s591 = @tactics.mp_tac(x590)
      fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s591(x592)
      }
    })(((x596 : @kernel.Thm) => @lib.check(fn(x595 : @kernel.Thm) -> Bool raise {
      (fn(x593 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x593)
      })((fn(x594 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x594)
      })(x595))
    }, x596))(x597))
  })
  let t589 = @simp.rewrite_tac(@list.List([@arith.add1(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))]))
  let t588 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm(), @theorems.forall_unwind_thm2(), @iterate.sum_clauses_numseg()]))
  let t613 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le(), @class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool) → (r : Bool)) == ((p → r) && (q → r))"))])), t588), t589), @tactics.strip_tac), t598), t599), t606), t607), t611), t612)
  let t587 = @simp.simp_tac(@list.List([@arith.le_refl(), @iterate.sum_clauses_numseg()]))
  let t584 = @term_syntax.parse_term("0")
  let t614 = @list.List([@tactics.then_tac(@tactics.disch_then(fn(x586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s582 = @tactics.mp_tac(x581)
      fn(x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s582(x583)
      }
    })(((x585 : @kernel.Thm) => @bool.spec(t584, x585))(x586))
  }), t587), t613])
  let t580 = @tactics.replicate_tac(3, @tactics.gen_tac)
  let t615 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.and_forall_thm(), @class.taut(@term_syntax.parse_term("(((p : Bool) → (r : Bool)) && ((q : Bool) → r)) == (p || q → r)"))])), t580), @nums.induct_tac), t614)
  telescoping_rational_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ p : (Num) -> Real, ∀ q : (Num) -> Real, ∀ n : Num, (∀ k : Num, k <= n → a(k) * (q(k) * q(k + 1)) == p(k) * q(k + 1) - p(k + 1) * q(k)) && (∀ k : Num, k <= n → !(p(k) == real_of_num(0) && q(k) == real_of_num(0))) → sum(op_dot_dot(0, n), (k : Num) => a(k)) * (q(0) * q(n + 1)) == p(0) * q(n + 1) - p(n + 1) * q(0)"), t615))
}

///|
let telescoping_rational_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TELESCOPING_RATIONAL_SUM")

///|
/// `TELESCOPING_RATIONAL_SUM`
pub fn telescoping_rational_sum() -> @kernel.Thm {
  telescoping_rational_sum_c.get()
}

///|
/// AA_LEMMA'
fn step_39() -> Unit raise {
  let t616 = @meson.meson_tac(@list.List([aa_lemma(), @arith.lt_imp_le()]))
  aa_lemma_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k < n → ((-real_of_num(3) * pow(real_of_num(n), 2) - real_of_num(3) * real_of_num(n) - pow(real_of_num(n), 3) - real_of_num(1)) * cc(n, k) + ((real_of_num(34) * pow(real_of_num(n), 3) + (real_of_num(153) * pow(real_of_num(n), 2) + (real_of_num(231) * real_of_num(n) + real_of_num(117)))) * cc(n + 1, k) + (pow(-real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(n), 2) - real_of_num(12) * real_of_num(n) - real_of_num(8)) * cc(n + 2, k))) * (qq(n, k) * qq(n, k + 1)) == pp(n, k) * qq(n, k + 1) - pp(n, k + 1) * qq(n, k)"), t616))
}

///|
let aa_lemma_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_LEMMA'")

///|
/// `AA_LEMMA'`
pub fn aa_lemma_p() -> @kernel.Thm {
  aa_lemma_p_c.get()
}

///|
/// TELESCOPING_RATIONAL_SUM'
fn step_40() -> Unit raise {
  let t625 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n - 1 + 1 == n"))]))
  let t622 = @drule.match_mp(telescoping_rational_sum())
  let t624 = @tactics.disch_then(fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s620 = @tactics.mp_tac(x619)
      fn(x621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s620(x621)
      }
    })(t622(x623))
  })
  let t618 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_right(), @arith.le_1(), @arith.le_0()]))
  let t626 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → ((k : Num) < n) == (k <= n - 1)"))])), t618), t624), t625), @calc_rat.real_arith_tac)
  let t627 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@iterate.sum_clauses_numseg()])), @calc_rat.real_arith_tac), t626])
  let t617 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t628 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t617), t627)
  telescoping_rational_sum_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ p : (Num) -> Real, ∀ q : (Num) -> Real, ∀ n : Num, (∀ k : Num, k < n → a(k) * (q(k) * q(k + 1)) == p(k) * q(k + 1) - p(k + 1) * q(k)) && (∀ k : Num, k < n → !(p(k) == real_of_num(0) && q(k) == real_of_num(0))) → (sum(op_dot_dot(0, n), (k : Num) => a(k)) - a(n)) * (q(0) * q(n)) == p(0) * q(n) - p(n) * q(0)"), t628))
}

///|
let telescoping_rational_sum_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TELESCOPING_RATIONAL_SUM'")

///|
/// `TELESCOPING_RATIONAL_SUM'`
pub fn telescoping_rational_sum_p() -> @kernel.Thm {
  telescoping_rational_sum_p_c.get()
}

///|
/// AA_RECURRENCE
fn step_41() -> Unit raise {
  let t691 = @tactics.conv_tac(@calc_rat.real_field)
  let t683 = @simp.rewrite_tac(@list.List([@binomial.binom_refl()]))
  let t682 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t681 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 1)"))
  let t680 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t678 = @equal.gsym(@realax.real_of_num_mul())
  let t679 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t678]))
  let t675 = @tactics.pop_assum(fn(x674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t676 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t675)
  let t672 = @drule.match_mp(@class.taut(@term_syntax.parse_term("(p : Bool) → !p → (q : Bool)")))
  let t677 = @tactics.repeat_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.try_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t672(x673))
  }), @int.asm_arith_tac)), t676])))
  let t670 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t669 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t667 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t668 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t667, @binomial.binom_v1()]))
  let t666 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t671 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t666), t668), t669), t670), @tactics.all_tac])
  let t665 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t663 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t662 = @simp.rewrite_tac(@list.List([@binomial.binom_refl()]))
  let t661 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t664 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t661), t662), t663), @tactics.all_tac])
  let t660 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t659 = @simp.rewrite_tac(@list.List([@arith.add1(), @binomial.binom_top_step_real(), @binomial.binom_bottom_step_real()]))
  let t658 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t657 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + n == 2 * n"))]))
  let t655 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t656 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t655, @arith.add_clauses()]))
  let t654 = @simp.rewrite_tac(@list.List([cc(), @binomial.binom_refl()]))
  let t653 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (cn : Real) + ((b : Real) * (cn1 : Real) + (c : Real) * (cn2 : Real)) + (x : Real) * ((y : Real) * ((z : Real) * cn)) == (a + x * (y * z)) * cn + (b * cn1 + c * cn2)"))]))
  let t652 = @tactics.disch_then(fn(x649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s650 = @tactics.subst1_tac(x649)
    fn(x651 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s650(x651)
    }
  })
  let t648 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((s : Real) - (a : Real) + -real_of_num(4) * (x : Real) / real_of_num(4) == real_of_num(0)) == (s == a + x)"))]))
  let t647 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @real.real_pow_eq_0(), @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num(n) + real_of_num(2) == real_of_num(0))"))]))
  let t646 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((x : Real) * (pow(real_of_num((n : Num)) + real_of_num(1), 2) * pow(real_of_num(n) + real_of_num(2), 2) * real_of_num(4)) == real_of_num(0) - (y : Real) * (pow(real_of_num(n) + real_of_num(1), 2) * pow(real_of_num(n) + real_of_num(2), 2))) == ((x + y / real_of_num(4)) * (pow(real_of_num(n) + real_of_num(1), 2) * pow(real_of_num(n) + real_of_num(2), 2)) == real_of_num(0))"))]))
  let t645 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t644 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + ((y : Real) - x) == y"))]))
  let t643 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t642 = @simp.rewrite_tac(@list.List([pp(), qq()]))
  let t639 = @equal.gsym(@real.real_of_num_lt())
  let t640 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t639]))
  let t641 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pp(), qq(), @realarith.real_entire(), @real.real_pow_eq_0(), @calc_num.arith(), @realax.real_of_num_eq()])), t640), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t637 = @bool.spec(@term_syntax.parse_term("(n : Num)"), aa_lemma_p())
  let t638 = @tactics.mp_tac(@drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(telescoping_rational_sum_p()))(t637))
  let t636 = @simp.rewrite_tac(@list.List([@arith.add1(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))]))
  let t634 = @equal.gsym(@iterate.sum_add_numseg())
  let t635 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t634]))
  let t633 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (s1 : Real) + ((b : Real) * ((s2 : Real) + (x : Real)) + (c : Real) * ((s3 : Real) + ((y : Real) + (z : Real)))) == a * s1 + (b * s2 + c * s3) + (b * x + (c * y + c * z))"))]))
  let t632 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @arith.le_0(), @equal.gsym(@realax.real_add_assoc())]))
  let t630 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 == SUC(SUC(n))"))
  let t631 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), t630]))
  let t629 = @simp.rewrite_tac(@list.List([aa()]))
  let t692 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t629), t631), t632), t633), t635), t636), t638), @tactics.ants_tac), t641), t642), t643), t644), t645), t646), t647), t648), t652), t653), t654), t656), t657), t658), t659), t660), t664), t665), t671), t677), t679), t680), t681), t682), t683), fn(x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x684 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x684
      let t687 = @term_syntax.parse_term("real_div")
      @simp.rewrite_tac(@lib.map(fn(x686 : @kernel.Term) -> @kernel.Thm raise {
        @calc_rat.real_poly_conv(@kernel.rand(x686))
      }, @basics.find_terms(fn(x689 : @kernel.Term) -> Bool raise {
        ((x688 : @kernel.Term) => @basics.is_binop(t687, x688))(x689)
      }, w)))
    })(x690)(x690)
  }), t691)
  let raw = @tactics.prove(@term_syntax.parse_term("∀ n : Num, (-real_of_num(3) * pow(real_of_num(n), 2) - real_of_num(3) * real_of_num(n) - pow(real_of_num(n), 3) - real_of_num(1)) * aa(n) + ((real_of_num(34) * pow(real_of_num(n), 3) + (real_of_num(153) * pow(real_of_num(n), 2) + (real_of_num(231) * real_of_num(n) + real_of_num(117)))) * aa(n + 1) + (pow(-real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(n), 2) - real_of_num(12) * real_of_num(n) - real_of_num(8)) * aa(n + 2)) == real_of_num(0)"), t692)
  let t694 = @tactics.conv_tac(@calc_rat.real_ring)
  let t693 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t695 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(raw), t693), t694)
  aa_recurrence_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pow(real_of_num(n) + real_of_num(2), 3) * aa(n + 2) - (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) * aa(n + 1)) + pow(real_of_num(n) + real_of_num(1), 3) * aa(n) == real_of_num(0)"), t695))
}

///|
let aa_recurrence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_RECURRENCE")

///|
/// `AA_RECURRENCE`
pub fn aa_recurrence() -> @kernel.Thm {
  aa_recurrence_c.get()
}

///|
/// ss
fn step_42() -> Unit raise {
  ss_c.set(@pair.new_definition(@term_syntax.parse_term("(ss : (Num, Num) -> Real)((n : Num), (k : Num)) == sum(op_dot_dot(1, k), (m : Num) => pow(-real_of_num(1), m - 1) / (real_of_num(2) * (pow(real_of_num(m), 3) * (real_of_num(binom((n + m, m))) * real_of_num(binom((n, m)))))))")))
}

///|
let ss_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ss")

///|
/// `ss`
pub fn ss() -> @kernel.Thm {
  ss_c.get()
}

///|
/// ww
fn step_43() -> Unit raise {
  ww_c.set(@pair.new_definition(@term_syntax.parse_term("(ww : (Num) -> Real)((n : Num)) == sum(op_dot_dot(0, n), (k : Num) => cc(n, k) * ss(n, k))")))
}

///|
let ww_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ww")

///|
/// `ww`
pub fn ww() -> @kernel.Thm {
  ww_c.get()
}

///|
/// d_term
fn step_44() -> Unit raise {
  d_term_c.set(@pair.new_definition(@term_syntax.parse_term("(d_term : (Num, Num) -> Real)((n : Num), (m : Num)) == pow(-real_of_num(1), m - 1) / (real_of_num(2) * (pow(real_of_num(m), 3) * (real_of_num(binom((n + m, m))) * real_of_num(binom((n, m))))))")))
}

///|
let d_term_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("d_term")

///|
/// `d_term`
pub fn d_term() -> @kernel.Thm {
  d_term_c.get()
}

///|
/// D_STEP_N
fn step_45() -> Unit raise {
  let t716 = @tactics.conv_tac(@calc_rat.real_field)
  let t715 = @tactics.repeat_tac(@tactics.disch_then(fn(x713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x713
    @simp.rewrite_tac(@list.List([th]))
  }))
  let t711 = @tactics.try_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @binomial.binom_eq_0(), @arith.not_lt()])), @int.asm_arith_tac))
  let t712 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t711), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t710 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + (real_of_num(1) - real_of_num((m : Num))) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(1) + real_of_num(m)) == real_of_num(0)) && !(real_of_num(n) + real_of_num(m) + (real_of_num(1) - real_of_num(m)) == real_of_num(0)) && !(real_of_num(binom((n + m, m))) == real_of_num(0)) && !(real_of_num(binom((n, m))) == real_of_num(0)) && !(real_of_num(m) == real_of_num(0))"), @tactics.strip_assume_tac)
  let t709 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t708 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → !(m == n + 1)"))]))
  let t707 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((m : Num) == (n : Num) + m + 1)"))]))
  let t705 = @term_syntax.parse_term("(m : Num)")
  let t706 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num)"), t705]), @binomial.binom_top_step_real()))
  let t703 = @term_syntax.parse_term("(m : Num)")
  let t704 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) + (m : Num)"), t703]), @binomial.binom_top_step_real()))
  let t702 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) + 1 + (m : Num) == n + m + 1"), fn(x699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s700 = @tactics.subst1_tac(x699)
    fn(x701 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s700(x701)
    }
  })
  let t698 = @simp.rewrite_tac(@list.List([d_term()]))
  let t697 = @list.List([@simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()])), @tactics.all_tac])
  let t696 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((m : Num)) <= real_of_num((n : Num)) && real_of_num(1) <= real_of_num(m)"), @tactics.strip_assume_tac)
  let t717 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t696), t697), t698), t702), @list.List([@int.arith_tac, @tactics.all_tac])), t704), t706), t707), t708), t709), t710), t712), t715), t716)
  d_step_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, 1 <= m && m <= n → d_term(n + 1, m) == (real_of_num(n) + (real_of_num(1) - real_of_num(m))) / (real_of_num(n) + (real_of_num(1) + real_of_num(m))) * d_term(n, m)"), t717))
}

///|
let d_step_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("D_STEP_N")

///|
/// `D_STEP_N`
pub fn d_step_n() -> @kernel.Thm {
  d_step_n_c.get()
}

///|
/// SS_AS_DTERM
fn step_46() -> Unit raise {
  let t718 = @simp.rewrite_tac(@list.List([ss(), d_term()]))
  ss_as_dterm_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, ss(n, k) == sum(op_dot_dot(1, k), (m : Num) => d_term(n, m))"), t718))
}

///|
let ss_as_dterm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SS_AS_DTERM")

///|
/// `SS_AS_DTERM`
pub fn ss_as_dterm() -> @kernel.Thm {
  ss_as_dterm_c.get()
}

///|
/// SS_DIFF_K
fn step_47() -> Unit raise {
  let t725 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t724 = @simp.simp_tac(@list.List([@iterate.sum_clauses_numseg(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((k : Num))"))]))
  let t723 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) + 1 == SUC(k)"), fn(x720 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s721 = @tactics.subst1_tac(x720)
    fn(x722 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s721(x722)
    }
  })
  let t719 = @simp.rewrite_tac(@list.List([ss_as_dterm()]))
  let t726 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t719), t723), @list.List([@int.arith_tac, @tactics.all_tac])), t724), t725)
  ss_diff_k_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, ss(n, k + 1) == ss(n, k) + d_term(n, k + 1)"), t726))
}

///|
let ss_diff_k_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SS_DIFF_K")

///|
/// `SS_DIFF_K`
pub fn ss_diff_k() -> @kernel.Thm {
  ss_diff_k_c.get()
}

///|
/// SS_SNSK
fn step_48() -> Unit raise {
  let t739 = @list.List([@calc_rat.real_arith_tac, @tactics.conv_tac(@calc_rat.real_field)])
  let t738 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + (real_of_num(2) + real_of_num((k : Num))) == real_of_num(0))"), fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s736 = @tactics.mp_tac(x735)
    fn(x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s736(x737)
    }
  })
  let t734 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t733 = @list.List([@int.asm_arith_tac, @tactics.disch_then(fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s731 = @tactics.subst1_tac(x730)
    fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s731(x732)
    }
  })])
  let t728 = @term_syntax.parse_term("(k : Num) + 1")
  let t729 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t728]), d_step_n()))
  let t727 = @simp.rewrite_tac(@list.List([ss_diff_k()]))
  let t740 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t727), t729), @tactics.ants_tac), t733), t734), t738), t739)
  ss_snsk_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k < n → ss(n + 1, k + 1) == (-real_of_num(n) + real_of_num(k)) / (real_of_num(n) + (real_of_num(2) + real_of_num(k))) * ss(n, k) + (ss(n + 1, k) + (real_of_num(n) - real_of_num(k)) / (real_of_num(n) + (real_of_num(2) + real_of_num(k))) * ss(n, k + 1))"), t740))
}

///|
let ss_snsk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SS_SNSK")

///|
/// `SS_SNSK`
pub fn ss_snsk() -> @kernel.Thm {
  ss_snsk_c.get()
}

///|
/// BB_AS_AAZZ_WW
fn step_49() -> Unit raise {
  let t749 = @simp.rewrite_tac(@list.List([]))
  let t748 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t747 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t746 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t745 = @simp.rewrite_tac(@list.List([cc(), ss(), @realax.real_add_ldistrib()]))
  let t744 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t743 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t741 = @equal.gsym(@iterate.sum_add_numseg())
  let t742 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_rmul()), t741]))
  let t750 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([bb_alt(), ww(), aa()]))), t742), t743), t744), @tactics.strip_tac), t745), @tactics.binop_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t746), t747), t748), @tactics.strip_tac), t749), @calc_rat.real_arith_tac)
  bb_as_aazz_ww_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, bb(n) == aa(n) * zz(n) + ww(n)"), t750))
}

///|
let bb_as_aazz_ww_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_AS_AAZZ_WW")

///|
/// `BB_AS_AAZZ_WW`
pub fn bb_as_aazz_ww() -> @kernel.Thm {
  bb_as_aazz_ww_c.get()
}

///|
/// ZZ_STEP
fn step_50() -> Unit raise {
  let t756 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t755 = @simp.simp_tac(@list.List([@iterate.sum_clauses_numseg(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t754 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) + 1 == SUC(n)"), fn(x751 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s752 = @tactics.subst1_tac(x751)
    fn(x753 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s752(x753)
    }
  })
  let t757 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([zz()]))), t754), @list.List([@int.arith_tac, @tactics.all_tac])), t755), t756)
  zz_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, zz(n + 1) == zz(n) + real_of_num(1) / pow(real_of_num(n + 1), 3)"), t757))
}

///|
let zz_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZZ_STEP")

///|
/// `ZZ_STEP`
pub fn zz_step() -> @kernel.Thm {
  zz_step_c.get()
}

///|
/// Examples/apery.ml:863
fn step_51() -> Unit raise {
  {
    @preterm.type_invention_error.val = true
    ()
  }
}

///|
/// lop
fn step_52() -> Unit raise {
  lop_c.set(@pair.new_definition(@term_syntax.parse_term("(lop : ((Num) -> Real, Num) -> Real)((f : (Num) -> Real), (n : Num)) == pow(real_of_num(n) + real_of_num(2), 3) * f(n + 2) - (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) * f(n + 1)) + pow(real_of_num(n) + real_of_num(1), 3) * f(n)")))
}

///|
let lop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lop")

///|
/// `lop`
pub fn lop() -> @kernel.Thm {
  lop_c.get()
}

///|
/// pflat
fn step_53() -> Unit raise {
  pflat_c.set(@pair.new_definition(@term_syntax.parse_term("(pflat : ((Num) -> Real, Num) -> Real)((f : (Num) -> Real), (n : Num)) == (real_of_num(2) * real_of_num(n) + real_of_num(7)) * ((real_of_num(928) + (real_of_num(1266) * real_of_num(n) + (real_of_num(643) * pow(real_of_num(n), 2) + (real_of_num(144) * pow(real_of_num(n), 3) + real_of_num(12) * pow(real_of_num(n), 4))))) * (pow(real_of_num(n) + real_of_num(1), 6) * f(n))) + (-real_of_num(1) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(7956) * pow(real_of_num(n), 8) + (real_of_num(68086) * pow(real_of_num(n), 7) + (real_of_num(336284) * pow(real_of_num(n), 6) + (real_of_num(1058890) * pow(real_of_num(n), 5) + (real_of_num(2209767) * pow(real_of_num(n), 4) + (real_of_num(3063206) * pow(real_of_num(n), 3) + (real_of_num(2724789) * pow(real_of_num(n), 2) + (real_of_num(1413006) * real_of_num(n) + real_of_num(325664)))))))))))) * f(n + 1) + ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(13896) * pow(real_of_num(n), 10) + (real_of_num(347400) * pow(real_of_num(n), 9) + (real_of_num(3868998) * pow(real_of_num(n), 8) + (real_of_num(25269960) * pow(real_of_num(n), 7) + (real_of_num(107159724) * pow(real_of_num(n), 6) + (real_of_num(308199360) * pow(real_of_num(n), 5) + (real_of_num(608681313) * pow(real_of_num(n), 4) + (real_of_num(814935630) * pow(real_of_num(n), 3) + (real_of_num(707785777) * pow(real_of_num(n), 2) + (real_of_num(360083510) * real_of_num(n) + real_of_num(81495208))))))))))) * f(n + 2)) + (-real_of_num(1) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016)))))))))))) * f(n + 3) + (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))) * (pow(real_of_num(n) + real_of_num(4), 6) * f(n + 4))))))")))
}

///|
let pflat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pflat")

///|
/// `pflat`
pub fn pflat() -> @kernel.Thm {
  pflat_c.get()
}

///|
/// m0c
fn step_54() -> Unit raise {
  m0c_c.set(@pair.new_definition(@term_syntax.parse_term("(m0c : (Num) -> Real)((n : Num)) == pow(real_of_num(n) + real_of_num(1), 3) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(144) * pow(real_of_num(n), 3) + (real_of_num(643) * pow(real_of_num(n), 2) + (real_of_num(1266) * real_of_num(n) + real_of_num(928))))))")))
}

///|
let m0c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("m0c")

///|
/// `m0c`
pub fn m0c() -> @kernel.Thm {
  m0c_c.get()
}

///|
/// m1c
fn step_55() -> Unit raise {
  m1c_c.set(@pair.new_definition(@term_syntax.parse_term("(m1c : (Num) -> Real)((n : Num)) == -real_of_num(1) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (real_of_num(204) * pow(real_of_num(n), 6) + (real_of_num(3060) * pow(real_of_num(n), 5) + (real_of_num(18743) * pow(real_of_num(n), 4) + (real_of_num(59930) * pow(real_of_num(n), 3) + (real_of_num(105413) * pow(real_of_num(n), 2) + (real_of_num(96690) * real_of_num(n) + real_of_num(36184)))))))))")))
}

///|
let m1c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("m1c")

///|
/// `m1c`
pub fn m1c() -> @kernel.Thm {
  m1c_c.get()
}

///|
/// m2c
fn step_56() -> Unit raise {
  m2c_c.set(@pair.new_definition(@term_syntax.parse_term("(m2c : (Num) -> Real)((n : Num)) == pow(real_of_num(n) + real_of_num(4), 3) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))")))
}

///|
let m2c_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("m2c")

///|
/// `m2c`
pub fn m2c() -> @kernel.Thm {
  m2c_c.get()
}

///|
/// MOL_FACTOR
fn step_57() -> Unit raise {
  let t764 = @tactics.conv_tac(@calc_rat.real_ring)
  let t759 = @equal.gsym(@realax.real_of_num_add())
  let t760 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 1 == n + 3"))
  let t761 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 2 == n + 4"))
  let t762 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))
  let t763 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 2 == n + 3")), t762, t761, t760, t759]))
  let t758 = @simp.rewrite_tac(@list.List([pflat(), lop(), m0c(), m1c(), m2c()]))
  let t765 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t758), t763), t764)
  mol_factor_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ n : Num, pflat(f, n) == m0c(n) * lop(f, n) + (m1c(n) * lop(f, n + 1) + m2c(n) * lop(f, n + 2))"), t765))
}

///|
let mol_factor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOL_FACTOR")

///|
/// `MOL_FACTOR`
pub fn mol_factor() -> @kernel.Thm {
  mol_factor_c.get()
}

///|
/// M2C_NONZERO
fn step_58() -> Unit raise {
  let t771 = @simp.simp_tac(@list.List([@real.real_pow_le(), @realarith.real_pos()]))
  let t770 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t769 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t768 = @tactics.repeat_tac(@tactics.conj_tac)
  let t772 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= real_of_num(12) * pow((x : Real), 4) && real_of_num(0) <= real_of_num(96) * pow(x, 3) && real_of_num(0) <= real_of_num(283) * pow(x, 2) && real_of_num(0) <= real_of_num(364) * x → real_of_num(0) < real_of_num(12) * pow(x, 4) + (real_of_num(96) * pow(x, 3) + (real_of_num(283) * pow(x, 2) + (real_of_num(364) * x + real_of_num(173))))"))), t768), t769), t770), t771)
  let t773 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_lt()), @calc_rat.real_arith_tac), @calc_rat.real_arith_tac, t772])
  let t767 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → !(x == real_of_num(0))")))
  let t766 = @tactics.repeat_tac(@tactics.conj_tac)
  let t774 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([m2c(), @realarith.real_entire(), @class.de_morgan_thm()]))), t766), t767), t773)
  m2c_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(m2c(n) == real_of_num(0))"), t774))
}

///|
let m2c_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M2C_NONZERO")

///|
/// `M2C_NONZERO`
pub fn m2c_nonzero() -> @kernel.Thm {
  m2c_nonzero_c.get()
}

///|
/// M_KERNEL_TRIVIAL
fn step_59() -> Unit raise {
  let t798 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), m2c_nonzero()]))
  let t797 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realax.real_add_lid(), @calc_int.real_add_rid()]))
  let t796 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) - 2 + 1 == n - 1 && n - 2 + 2 == n"), fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x794
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t793 = @tactics.first_x_assum(fn(x786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x786
    if @lib.can(fn(x788 : Unit) -> @kernel.Term raise {
      let _ = x788
      @basics.find_term(fn(x789 : @kernel.Term) -> Bool raise {
        let t = x789
        try {
          (@kernel.dest_const(@basics.strip_comb(t).0).0 == "m0c")
        } catch {
          _ => false
        }
      }, @kernel.concl(th))
    }, ()) {
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) - 2"), th))
    } else {
      let t790 = @lib.failure()
      fn(x791 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let s792 = t790(x791.0)
        s792(x791.1)
      }
    }
  })
  let t785 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.first_x_assum(@tactics.match_mp_tac)), @int.asm_arith_tac), @tactics.all_tac])
  let t784 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (Num) -> Real)((n : Num) - 2) == real_of_num(0) && g(n - 1) == real_of_num(0)"), @tactics.strip_assume_tac)
  let t783 = @simp.asm_rewrite_tac(@list.List([]))
  let t782 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t781 = @simp.asm_rewrite_tac(@list.List([]))
  let t780 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t779 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t778 = @tactics.match_mp_tac(@arith.num_wf())
  let t799 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.conjuncts_then2(fn(x775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s776 = @tactics.assume_tac(x775)
    fn(x777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s776(x777)
    }
  }, @tactics.strip_assume_tac))), t778), t779), @tactics.disch_tac), t780), t781), t782), t783), t784), t785), t793), t796), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t797), t798)
  m_kernel_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Num) -> Real, (∀ n : Num, m0c(n) * g(n) + (m1c(n) * g(n + 1) + m2c(n) * g(n + 2)) == real_of_num(0)) && g(0) == real_of_num(0) && g(1) == real_of_num(0) → (∀ n : Num, g(n) == real_of_num(0))"), t799))
}

///|
let m_kernel_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_KERNEL_TRIVIAL")

///|
/// `M_KERNEL_TRIVIAL`
pub fn m_kernel_trivial() -> @kernel.Thm {
  m_kernel_trivial_c.get()
}

///|
/// LOP_BB_0
fn step_60() -> Unit raise {
  let t808 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t807 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t805 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t806 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t805, @binomial.binom_v1()]))
  let t804 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t802 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t803 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t802, @iterate.sum_clauses_numseg()]))
  let t801 = @simp.rewrite_tac(@list.List([bb(), aa(), cc(), zz(), @equal.gsym(@arith.add1())]))
  let t800 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t809 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lop()])), t800), t801), t803), t804), t806), t807), t808)
  lop_bb_0_c.set(@tactics.prove(@term_syntax.parse_term("lop(bb, 0) == real_of_num(0)"), t809))
}

///|
let lop_bb_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOP_BB_0")

///|
/// `LOP_BB_0`
pub fn lop_bb_0() -> @kernel.Thm {
  lop_bb_0_c.get()
}

///|
/// LOP_BB_1
fn step_61() -> Unit raise {
  let t820 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t819 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t816 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t817 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t818 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("3")), t817, t816, @binomial.binom_v1()]))
  let t815 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t812 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t813 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t814 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("3")), t813, t812, @iterate.sum_clauses_numseg()]))
  let t811 = @simp.rewrite_tac(@list.List([bb(), aa(), cc(), zz(), @equal.gsym(@arith.add1())]))
  let t810 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t821 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lop()])), t810), t811), t814), t815), t818), t819), t820)
  lop_bb_1_c.set(@tactics.prove(@term_syntax.parse_term("lop(bb, 1) == real_of_num(0)"), t821))
}

///|
let lop_bb_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOP_BB_1")

///|
/// `LOP_BB_1`
pub fn lop_bb_1() -> @kernel.Thm {
  lop_bb_1_c.get()
}

///|
/// LOP_AAZZ
fn step_62() -> Unit raise {
  let t830 = @tactics.conv_tac(@calc_rat.real_field)
  let t829 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t828 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num(n) + real_of_num(2) == real_of_num(0))"), fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.mp_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  })
  let t823 = @equal.gsym(@realax.real_of_num_add())
  let t824 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 == n + 1 + 1")), zz_step(), t823]))
  let t822 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), aa_recurrence()))
  let t831 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([lop()]))), @tactics.beta_tac), t822), t824), t828), t829), t830)
  lop_aazz_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, lop((m : Num) => aa(m) * zz(m), n) == pow(real_of_num(n) + real_of_num(2), 3) * (aa(n + 2) / pow(real_of_num(n) + real_of_num(1), 3)) + (aa(n + 2) - (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) * (aa(n + 1) / pow(real_of_num(n) + real_of_num(1), 3))))"), t831))
}

///|
let lop_aazz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOP_AAZZ")

///|
/// `LOP_AAZZ`
pub fn lop_aazz() -> @kernel.Thm {
  lop_aazz_c.get()
}

///|
/// AA_REC_ROW
fn step_63() -> Unit raise {
  let t832 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) + 1 + 1 == m + 2"))]))
  let t833 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), aa_recurrence()))), t832), @calc_rat.real_arith_tac)
  aa_rec_row_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, pow(real_of_num(m) + real_of_num(2), 3) * aa(m + 2) == (real_of_num(2) * real_of_num(m) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(m), 2) + (real_of_num(51) * real_of_num(m) + real_of_num(39))) * aa(m + 1)) - pow(real_of_num(m) + real_of_num(1), 3) * aa(m)"), t833))
}

///|
let aa_rec_row_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_REC_ROW")

///|
/// `AA_REC_ROW`
pub fn aa_rec_row() -> @kernel.Thm {
  aa_rec_row_c.get()
}

///|
/// PFLAT_AAZZ
fn step_64() -> Unit raise {
  let t861 = @tactics.conv_tac(@calc_rat.real_field)
  let t860 = @tactics.pop_assum_list(fn(x859 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s856 = @tactics.mp_tac(x855)
      fn(x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s856(x857)
      }
    })(((x858 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x858))(x859))
  })
  let t854 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.disch_then(fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x852
    if @basics.is_imp(@kernel.concl(th)) {
      @tactics.all_tac
    } else {
      @tactics.assume_tac(th)
    }
  }), @tactics.strip_tac))
  let t851 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t850 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num(n) + real_of_num(2) == real_of_num(0)) && !(real_of_num(n) + real_of_num(3) == real_of_num(0))"), fn(x847 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s848 = @tactics.mp_tac(x847)
    fn(x849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s848(x849)
    }
  })
  let t842 = @equal.gsym(@realax.real_of_num_add())
  let t843 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 2 == n + 4"))
  let t844 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 1 == n + 3"))
  let t845 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 2 == n + 3"))
  let t846 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2")), t845, t844, t843, t842]))
  let t841 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) + 2"), aa_rec_row()))
  let t840 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) + 1"), aa_rec_row()))
  let t839 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), aa_rec_row()))
  let t838 = @simp.rewrite_tac(@list.List([m0c(), m1c(), m2c()]))
  let t834 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 2 == n + 4"))
  let t835 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 2 == n + 3"))
  let t836 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 1 == n + 3"))
  let t837 = @simp.rewrite_tac(@list.List([lop_aazz(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2")), t836, t835, t834]))
  let t862 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([mol_factor()]))), t837), t838), t839), t840), t841), t846), t850), t851), t854), t860), t861)
  pflat_aazz_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pflat((m : Num) => aa(m) * zz(m), n) == real_of_num(0)"), t862))
}

///|
let pflat_aazz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PFLAT_AAZZ")

///|
/// `PFLAT_AAZZ`
pub fn pflat_aazz() -> @kernel.Thm {
  pflat_aazz_c.get()
}

///|
/// Examples/apery.ml:1018
fn step_65() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// D_STEP_K
fn step_66() -> Unit raise {
  let t894 = @tactics.conv_tac(@calc_rat.real_field)
  let t895 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t894)
  let t893 = @tactics.try_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @binomial.binom_eq_0(), @arith.not_lt()])), @int.asm_arith_tac))
  let t896 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t893), @calc_rat.asm_real_arith_tac), t895])
  let t892 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num(binom(((n : Num) + (m : Num), m))) == real_of_num(0)) && !(real_of_num(binom((n, m))) == real_of_num(0)) && !(real_of_num(m) + real_of_num(1) == real_of_num(0)) && !(real_of_num(n) - real_of_num(m) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(m) + real_of_num(1)) == real_of_num(0)) && !(real_of_num(m) == real_of_num(0))"), fn(x889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s890 = @tactics.mp_tac(x889)
    fn(x891 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s890(x891)
    }
  })
  let t888 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num((n : Num)) + real_of_num((m : Num)) + real_of_num(1) == real_of_num(n) + (real_of_num(m) + real_of_num(1))"))]))
  let t887 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t886 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le()])), @int.asm_arith_tac), @tactics.all_tac])
  let t885 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((m : Num)) < real_of_num((n : Num)) && real_of_num(1) <= real_of_num(m)"), @tactics.strip_assume_tac)
  let t884 = @tactics.disch_then(fn(x881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s882 = @tactics.subst1_tac(x881)
    fn(x883 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s882(x883)
    }
  })
  let t880 = @tactics.disch_then(fn(x877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s878 = @tactics.subst1_tac(x877)
    fn(x879 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s878(x879)
    }
  })
  let t875 = @term_syntax.parse_term("(m : Num)")
  let t876 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num)"), t875]), @binomial.binom_bottom_step_real()))
  let t873 = @term_syntax.parse_term("(m : Num)")
  let t874 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) + (m : Num)"), t873]), @binomial.binom_both_step_real()))
  let t872 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) + ((m : Num) + 1) == n + m + 1"), fn(x869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s870 = @tactics.subst1_tac(x869)
    fn(x871 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s870(x871)
    }
  })
  let t868 = @simp.rewrite_tac(@list.List([@realax.real_pow()]))
  let t867 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) + 1 - 1 == SUC(m - 1)"), fn(x864 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s865 = @tactics.subst1_tac(x864)
    fn(x866 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s865(x866)
    }
  })
  let t863 = @simp.rewrite_tac(@list.List([d_term()]))
  let t897 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t863), t867), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t868), t872), @list.List([@int.arith_tac, @tactics.all_tac])), t874), t876), t880), t884), t885), t886), t887), t888), t892), t896)
  d_step_k_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, 1 <= m && m + 1 <= n → d_term(n, m + 1) == -pow(real_of_num(m), 3) / ((real_of_num(m) + real_of_num(1)) * ((real_of_num(n) + (real_of_num(m) + real_of_num(1))) * (real_of_num(n) - real_of_num(m)))) * d_term(n, m)"), t897))
}

///|
let d_step_k_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("D_STEP_K")

///|
/// `D_STEP_K`
pub fn d_step_k() -> @kernel.Thm {
  d_step_k_c.get()
}

///|
/// SS_SK2
fn step_67() -> Unit raise {
  let t921 = @tactics.conv_tac(@calc_rat.real_field)
  let t922 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t921)
  let t920 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @real.real_of_num_lt()])), @int.asm_arith_tac), @calc_rat.real_arith_tac])
  let t919 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num)) + real_of_num(1) < real_of_num((n : Num))"), fn(x916 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s917 = @tactics.mp_tac(x916)
    fn(x918 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s917(x918)
    }
  })
  let t923 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t919), t920), t922])
  let t915 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) + real_of_num(2) == real_of_num(0)) && !(real_of_num((n : Num)) + (real_of_num(2) + real_of_num(k)) == real_of_num(0)) && !(-real_of_num(n) + (real_of_num(k) + real_of_num(1)) == real_of_num(0)) && !(real_of_num(k) + real_of_num(1) + real_of_num(1) == real_of_num(0))"), fn(x912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s913 = @tactics.mp_tac(x912)
    fn(x914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s913(x914)
    }
  })
  let t911 = @tactics.disch_then(fn(x908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s909 = @tactics.subst1_tac(x908)
    fn(x910 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s909(x910)
    }
  })
  let t907 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), @tactics.all_tac])
  let t906 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num) + 1) == real_of_num(k) + real_of_num(1)"), fn(x903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s904 = @tactics.subst1_tac(x903)
    fn(x905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s904(x905)
    }
  })
  let t902 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) + 1 + 1 == k + 2"))]))
  let t900 = @term_syntax.parse_term("(k : Num) + 1")
  let t901 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t900]), d_step_k()))
  let t899 = @simp.rewrite_tac(@list.List([ss_diff_k()]))
  let t898 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(k : Num) + 2 == k + 1 + 1")))
  let t924 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t898), t899), t901), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t902), t906), t907), t911), t915), t923)
  ss_sk2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k + 1 < n → ss(n, k + 2) == -real_of_num(1) * pow(real_of_num(k) + real_of_num(1), 3) / ((real_of_num(k) + real_of_num(2)) * ((real_of_num(n) + (real_of_num(2) + real_of_num(k))) * (-real_of_num(n) + (real_of_num(k) + real_of_num(1))))) * ss(n, k) + (real_of_num(2) * pow(real_of_num(k), 3) + (real_of_num(8) * pow(real_of_num(k), 2) + (real_of_num(11) * real_of_num(k) + (real_of_num(5) - real_of_num(k) * real_of_num(n) - real_of_num(k) * pow(real_of_num(n), 2) - real_of_num(2) * pow(real_of_num(n), 2) - real_of_num(2) * real_of_num(n))))) / ((real_of_num(k) + real_of_num(2)) * ((real_of_num(n) + (real_of_num(2) + real_of_num(k))) * (-real_of_num(n) + (real_of_num(k) + real_of_num(1))))) * ss(n, k + 1)"), t924))
}

///|
let ss_sk2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SS_SK2")

///|
/// `SS_SK2`
pub fn ss_sk2() -> @kernel.Thm {
  ss_sk2_c.get()
}

///|
/// SIGMA_DEF
fn step_68() -> Unit raise {
  sigma_def_c.set(@pair.new_definition(@term_syntax.parse_term("(sigma_s : (Num, Num) -> Real)((n : Num), (m : Num)) == ((real_of_num(4) * real_of_num(n) + real_of_num(6)) / pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(m), 3) - (real_of_num(4) * real_of_num(n) + real_of_num(6)) / pow(real_of_num(n) + real_of_num(2), 2) * pow(real_of_num(m), 2) + (real_of_num(4) * pow(real_of_num(n), 2) + (real_of_num(10) * real_of_num(n) + real_of_num(6))) / pow(real_of_num(n) + real_of_num(2), 3) * real_of_num(m)) / (real_of_num(n) + (real_of_num(m) + real_of_num(1)))")))
}

///|
let sigma_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGMA_DEF")

///|
/// `SIGMA_DEF`
pub fn sigma_def() -> @kernel.Thm {
  sigma_def_c.get()
}

///|
/// SSN2_SUMMAND
fn step_69() -> Unit raise {
  let t964 = @tactics.conv_tac(@calc_rat.real_field)
  let t963 = @tactics.repeat_tac(@tactics.conj_tac)
  let t962 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @tactics.all_tac])
  let t965 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num((m : Num)) < real_of_num((n : Num))"), fn(x959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s960 = @tactics.assume_tac(x959)
    fn(x961 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s960(x961)
    }
  }), t962), t963), @calc_rat.asm_real_arith_tac), t964])
  let t958 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(2) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(2) + real_of_num((k : Num))) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(1) + real_of_num((m : Num))) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(2) + real_of_num(m)) == real_of_num(0)) && !(real_of_num(m) + real_of_num(1) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(m) + real_of_num(1)) == real_of_num(0)) && !(real_of_num(n) - real_of_num(m) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(m) + real_of_num(1) + real_of_num(1)) == real_of_num(0))"), fn(x955 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s956 = @tactics.mp_tac(x955)
    fn(x957 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s956(x957)
    }
  })
  let t954 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t953 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(d_step_k()), @int.asm_arith_tac), @tactics.all_tac])
  let t952 = @tactics.subgoal_then(@term_syntax.parse_term("d_term((n : Num), (m : Num) + 1) == -pow(real_of_num(m), 3) / ((real_of_num(m) + real_of_num(1)) * ((real_of_num(n) + (real_of_num(m) + real_of_num(1))) * (real_of_num(n) - real_of_num(m)))) * d_term(n, m)"), fn(x949 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s950 = @tactics.subst1_tac(x949)
    fn(x951 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s950(x951)
    }
  })
  let t947 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t946 = @tactics.disch_then(fn(x943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s944 = @tactics.subst1_tac(x943)
    fn(x945 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s944(x945)
    }
  })
  let t941 = @term_syntax.parse_term("(m : Num)")
  let t942 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t941]), d_step_n()))
  let t940 = @tactics.disch_then(fn(x937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s938 = @tactics.subst1_tac(x937)
    fn(x939 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s938(x939)
    }
  })
  let t935 = @term_syntax.parse_term("(m : Num)")
  let t936 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t935]), d_step_n()))
  let t948 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 == n + 1 + 1"))), t936), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t940), t942), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t946), t947), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t934 = @tactics.subgoal_then(@term_syntax.parse_term("d_term((n : Num) + 2, (m : Num)) == (real_of_num(n) + (real_of_num(2) - real_of_num(m))) / (real_of_num(n) + (real_of_num(2) + real_of_num(m))) * ((real_of_num(n) + (real_of_num(1) - real_of_num(m))) / (real_of_num(n) + (real_of_num(1) + real_of_num(m))) * d_term(n, m))"), fn(x931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s932 = @tactics.subst1_tac(x931)
    fn(x933 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s932(x933)
    }
  })
  let t930 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(d_step_n()), @int.asm_arith_tac), @tactics.all_tac])
  let t929 = @tactics.subgoal_then(@term_syntax.parse_term("d_term((n : Num) + 1, (m : Num)) == (real_of_num(n) + (real_of_num(1) - real_of_num(m))) / (real_of_num(n) + (real_of_num(1) + real_of_num(m))) * d_term(n, m)"), fn(x926 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s927 = @tactics.subst1_tac(x926)
    fn(x928 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s927(x928)
    }
  })
  let t925 = @simp.rewrite_tac(@list.List([sigma_def()]))
  let t966 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t925), t929), t930), t934), t948), t952), t953), t954), t958), t965)
  ssn2_summand_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, ∀ m : Num, 1 <= m && m <= k && k < n → ((-real_of_num(2) - real_of_num(9) * pow(real_of_num(n), 2) + (real_of_num(3) * (real_of_num(k) * real_of_num(n)) - real_of_num(6) * pow(real_of_num(k), 2) - pow(real_of_num(n), 4) - real_of_num(5) * pow(real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(k), 3) - real_of_num(k) * pow(real_of_num(n), 3) + (real_of_num(k) * pow(real_of_num(n), 2) + (real_of_num(4) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(2) * (pow(real_of_num(k), 2) * real_of_num(n)) - real_of_num(4) * (pow(real_of_num(k), 3) * real_of_num(n)) - real_of_num(k) - real_of_num(7) * real_of_num(n)))))) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k)))) + real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(n) + real_of_num(k)) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k))))))))) * d_term(n, m) + ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) / pow(real_of_num(n) + real_of_num(2), 3)) * d_term(n + 1, m) - d_term(n + 2, m)) == sigma_s(n, m) * d_term(n, m) - sigma_s(n, m + 1) * d_term(n, m + 1)"), t966))
}

///|
let ssn2_summand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SSN2_SUMMAND")

///|
/// `SSN2_SUMMAND`
pub fn ssn2_summand() -> @kernel.Thm {
  ssn2_summand_c.get()
}

///|
/// SIGMA_1
fn step_70() -> Unit raise {
  let t971 = @tactics.conv_tac(@calc_rat.real_field)
  let t972 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_mul_rid(), @real.real_pow_one()])), t971)
  let t973 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), @calc_rat.real_arith_tac), t972])
  let t970 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(2) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(1) + real_of_num(1)) == real_of_num(0))"), fn(x967 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s968 = @tactics.mp_tac(x967)
    fn(x969 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s968(x969)
    }
  })
  let t974 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([sigma_def()]))), t970), t973)
  sigma_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, sigma_s(n, 1) == real_of_num(0)"), t974))
}

///|
let sigma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGMA_1")

///|
/// `SIGMA_1`
pub fn sigma_1() -> @kernel.Thm {
  sigma_1_c.get()
}

///|
/// SIGMA_KP1
fn step_71() -> Unit raise {
  let t985 = @tactics.conv_tac(@calc_rat.real_field)
  let t986 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t985)
  let t984 = @list.List([@simp.rewrite_tac(@list.List([@realarith.real_pos()])), @calc_rat.real_arith_tac])
  let t983 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= real_of_num((n : Num)) && real_of_num(0) <= real_of_num((k : Num))"), fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s981 = @tactics.mp_tac(x980)
    fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s981(x982)
    }
  })
  let t987 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t983), t984), t986])
  let t979 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(2) == real_of_num(0)) && !(real_of_num(n) + (real_of_num((k : Num)) + real_of_num(1) + real_of_num(1)) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(2) + real_of_num(k)) == real_of_num(0))"), fn(x976 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s977 = @tactics.mp_tac(x976)
    fn(x978 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s977(x978)
    }
  })
  let t975 = @simp.rewrite_tac(@list.List([sigma_def()]))
  let t988 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t975), t979), t987)
  sigma_kp1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, sigma_s(n, k + 1) == real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(n) + real_of_num(k)) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k))))))))"), t988))
}

///|
let sigma_kp1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGMA_KP1")

///|
/// `SIGMA_KP1`
pub fn sigma_kp1() -> @kernel.Thm {
  sigma_kp1_c.get()
}

///|
/// SSN2_SUMEQ
fn step_72() -> Unit raise {
  let t991 = @tactics.match_mp_tac(ssn2_summand())
  let t990 = @tactics.repeat_tac(@tactics.strip_tac)
  let t989 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t992 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t989), t990), @tactics.beta_tac), t991), @int.asm_arith_tac)
  ssn2_sumeq_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, 1 <= k && k < n → sum(op_dot_dot(1, k), (m : Num) => ((-real_of_num(2) - real_of_num(9) * pow(real_of_num(n), 2) + (real_of_num(3) * (real_of_num(k) * real_of_num(n)) - real_of_num(6) * pow(real_of_num(k), 2) - pow(real_of_num(n), 4) - real_of_num(5) * pow(real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(k), 3) - real_of_num(k) * pow(real_of_num(n), 3) + (real_of_num(k) * pow(real_of_num(n), 2) + (real_of_num(4) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(2) * (pow(real_of_num(k), 2) * real_of_num(n)) - real_of_num(4) * (pow(real_of_num(k), 3) * real_of_num(n)) - real_of_num(k) - real_of_num(7) * real_of_num(n)))))) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k)))) + real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(n) + real_of_num(k)) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k))))))))) * d_term(n, m) + ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) / pow(real_of_num(n) + real_of_num(2), 3)) * d_term(n + 1, m) - d_term(n + 2, m))) == sum(op_dot_dot(1, k), (m : Num) => sigma_s(n, m) * d_term(n, m) - sigma_s(n, m + 1) * d_term(n, m + 1))"), t992))
}

///|
let ssn2_sumeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SSN2_SUMEQ")

///|
/// `SSN2_SUMEQ`
pub fn ssn2_sumeq() -> @kernel.Thm {
  ssn2_sumeq_c.get()
}

///|
/// SSN2_LHS
fn step_73() -> Unit raise {
  let t994 = @simp.rewrite_tac(@list.List([@equal.gsym(ss_as_dterm())]))
  let t993 = @simp.rewrite_tac(@list.List([@iterate.sum_sub_numseg(), @iterate.sum_add_numseg(), @iterate.sum_lmul()]))
  let t995 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t993), t994)
  ssn2_lhs_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, sum(op_dot_dot(1, k), (m : Num) => ((-real_of_num(2) - real_of_num(9) * pow(real_of_num(n), 2) + (real_of_num(3) * (real_of_num(k) * real_of_num(n)) - real_of_num(6) * pow(real_of_num(k), 2) - pow(real_of_num(n), 4) - real_of_num(5) * pow(real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(k), 3) - real_of_num(k) * pow(real_of_num(n), 3) + (real_of_num(k) * pow(real_of_num(n), 2) + (real_of_num(4) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(2) * (pow(real_of_num(k), 2) * real_of_num(n)) - real_of_num(4) * (pow(real_of_num(k), 3) * real_of_num(n)) - real_of_num(k) - real_of_num(7) * real_of_num(n)))))) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k)))) + real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(n) + real_of_num(k)) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k))))))))) * d_term(n, m) + ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) / pow(real_of_num(n) + real_of_num(2), 3)) * d_term(n + 1, m) - d_term(n + 2, m))) == ((-real_of_num(2) - real_of_num(9) * pow(real_of_num(n), 2) + (real_of_num(3) * (real_of_num(k) * real_of_num(n)) - real_of_num(6) * pow(real_of_num(k), 2) - pow(real_of_num(n), 4) - real_of_num(5) * pow(real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(k), 3) - real_of_num(k) * pow(real_of_num(n), 3) + (real_of_num(k) * pow(real_of_num(n), 2) + (real_of_num(4) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(2) * (pow(real_of_num(k), 2) * real_of_num(n)) - real_of_num(4) * (pow(real_of_num(k), 3) * real_of_num(n)) - real_of_num(k) - real_of_num(7) * real_of_num(n)))))) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k)))) + real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(n) + real_of_num(k)) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k))))))))) * ss(n, k) + ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) / pow(real_of_num(n) + real_of_num(2), 3)) * ss(n + 1, k) - ss(n + 2, k))"), t995))
}

///|
let ssn2_lhs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SSN2_LHS")

///|
/// `SSN2_LHS`
pub fn ssn2_lhs() -> @kernel.Thm {
  ssn2_lhs_c.get()
}

///|
/// SS_SN2
fn step_74() -> Unit raise {
  let t1019 = @tactics.disch_then(fn(x1017 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1017
    @tactics.mp_tac(th_1)
  })
  let t1016 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t1015 = @simp.rewrite_tac(@list.List([ss_diff_k()]))
  let t1014 = @simp.rewrite_tac(@list.List([sigma_1(), sigma_kp1(), @calc_int.real_mul_lzero(), @real.real_sub_lzero()]))
  let t1013 = @tactics.disch_then(fn(x1005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1005
    let t1010 = @equal.rand_conv(@simp.rewrite_conv(@list.List([th])))
    @tactics.disch_then(fn(x1012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1008 = @tactics.mp_tac(x1007)
        fn(x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1008(x1009)
        }
      })(((x1011 : @kernel.Thm) => @equal.conv_rule(t1010, x1011))(x1012))
    })
  })
  let t1004 = @simp.asm_rewrite_tac(@list.List([]))
  let t1001 = @term_syntax.parse_term("(f : (Num) -> Real)")
  let t1002 = @kernel.inst_rule(@list.List([(@term_syntax.parse_term("(m : Num) => sigma_s((n : Num), m) * d_term(n, m)"), t1001)]), @iterate.sum_diffs())
  let t1000 = @term_syntax.parse_term("(k : Num)")
  let t1003 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("1"), t1000]), t1002))
  let t999 = @simp.rewrite_tac(@list.List([ssn2_lhs()]))
  let t998 = @simp.asm_rewrite_tac(@list.List([]))
  let t996 = @term_syntax.parse_term("(k : Num)")
  let t997 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t996]), ssn2_sumeq()))
  let t1020 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t997), t998), t999), t1003), t1004), @tactics.beta_tac), t1013), t1014), t1015), t1016), t1019), @calc_rat.real_arith_tac)
  ss_sn2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, 1 <= k && k < n → ss(n + 2, k) == (-real_of_num(2) - real_of_num(9) * pow(real_of_num(n), 2) + (real_of_num(3) * (real_of_num(k) * real_of_num(n)) - real_of_num(6) * pow(real_of_num(k), 2) - pow(real_of_num(n), 4) - real_of_num(5) * pow(real_of_num(n), 3) - real_of_num(6) * pow(real_of_num(k), 3) - real_of_num(k) * pow(real_of_num(n), 3) + (real_of_num(k) * pow(real_of_num(n), 2) + (real_of_num(4) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(2) * (pow(real_of_num(k), 2) * real_of_num(n)) - real_of_num(4) * (pow(real_of_num(k), 3) * real_of_num(n)) - real_of_num(k) - real_of_num(7) * real_of_num(n)))))) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k)))) * ss(n, k) + ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) / pow(real_of_num(n) + real_of_num(2), 3)) * ss(n + 1, k) + real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(n) + real_of_num(k)) / (pow(real_of_num(n) + real_of_num(2), 3) * (real_of_num(n) + (real_of_num(2) + real_of_num(k)))))))) * ss(n, k + 1))"), t1020))
}

///|
let ss_sn2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SS_SN2")

///|
/// `SS_SN2`
pub fn ss_sn2() -> @kernel.Thm {
  ss_sn2_c.get()
}

///|
/// vv
fn step_75() -> Unit raise {
  vv_c.set(@pair.new_definition(@term_syntax.parse_term("(vv : (Num, Num) -> Real)((n : Num), (k : Num)) == cc(n, k) * ss(n, k)")))
}

///|
let vv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vv")

///|
/// `vv`
pub fn vv() -> @kernel.Thm {
  vv_c.get()
}

///|
/// V_SK2
fn step_76() -> Unit raise {
  let t1055 = @tactics.conv_tac(@calc_rat.real_field)
  let t1054 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num((k : Num)) + real_of_num(1) + real_of_num(1) == real_of_num(k) + real_of_num(2)"))
  let t1056 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1054])), t1055)
  let t1053 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @real.real_of_num_lt()])), @int.asm_arith_tac), @calc_rat.real_arith_tac])
  let t1052 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num)) + real_of_num(1) < real_of_num((n : Num))"), fn(x1049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1050 = @tactics.mp_tac(x1049)
    fn(x1051 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1050(x1051)
    }
  })
  let t1057 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t1052), t1053), t1056])
  let t1048 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num(k) + real_of_num(2) == real_of_num(0)) && !(real_of_num((n : Num)) + (real_of_num(2) + real_of_num(k)) == real_of_num(0)) && !(-real_of_num(n) + (real_of_num(k) + real_of_num(1)) == real_of_num(0))"), fn(x1045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1046 = @tactics.mp_tac(x1045)
    fn(x1047 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1046(x1047)
    }
  })
  let t1044 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t1043 = @tactics.disch_then(fn(x1040 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1041 = @tactics.subst1_tac(x1040)
    fn(x1042 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1041(x1042)
    }
  })
  let t1038 = @term_syntax.parse_term("(k : Num)")
  let t1039 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1038]), cc_step_k()))
  let t1037 = @tactics.disch_then(fn(x1034 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1035 = @tactics.subst1_tac(x1034)
    fn(x1036 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1035(x1036)
    }
  })
  let t1033 = @simp.rewrite_tac(@list.List([]))
  let t1031 = @term_syntax.parse_term("(k : Num) + 1")
  let t1032 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1031]), cc_step_k()))
  let t1030 = @simp.rewrite_tac(@list.List([cc_step_k()]))
  let t1029 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(k : Num) + 2 == k + 1 + 1")))
  let t1028 = @tactics.disch_then(fn(x1025 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1026 = @tactics.subst1_tac(x1025)
    fn(x1027 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1026(x1027)
    }
  })
  let t1024 = @simp.asm_rewrite_tac(@list.List([]))
  let t1022 = @term_syntax.parse_term("(k : Num)")
  let t1023 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1022]), ss_sk2()))
  let t1021 = @simp.rewrite_tac(@list.List([vv()]))
  let t1058 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1021), t1023), t1024), t1028), t1029), t1030), t1032), t1033), t1037), t1039), t1043), t1044), t1048), t1057)
  v_sk2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k + 1 < n → vv(n, k + 2) == -real_of_num(1) * ((real_of_num(n) + (real_of_num(2) + real_of_num(k))) * ((-real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(real_of_num(n) + (real_of_num(1) + real_of_num(k)), 2) * (pow(-real_of_num(n) + real_of_num(k), 2) / ((real_of_num(k) + real_of_num(1)) * pow(real_of_num(k) + real_of_num(2), 5)))))) * vv(n, k) + (real_of_num(n) + (real_of_num(2) + real_of_num(k))) * ((-real_of_num(n) + (real_of_num(k) + real_of_num(1))) * ((real_of_num(2) * pow(real_of_num(k), 3) + (real_of_num(8) * pow(real_of_num(k), 2) + (real_of_num(11) * real_of_num(k) + (real_of_num(5) - real_of_num(k) * real_of_num(n) - real_of_num(k) * pow(real_of_num(n), 2) - real_of_num(2) * pow(real_of_num(n), 2) - real_of_num(2) * real_of_num(n))))) / pow(real_of_num(k) + real_of_num(2), 5))) * vv(n, k + 1)"), t1058))
}

///|
let v_sk2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SK2")

///|
/// `V_SK2`
pub fn v_sk2() -> @kernel.Thm {
  v_sk2_c.get()
}

///|
/// CC_NR
fn step_77() -> Unit raise {
  let t1060 = @list.List([@int.asm_arith_tac, @simp.rewrite_tac(@list.List([]))])
  let t1059 = @simp.rewrite_tac(@list.List([cc_step_n()]))
  let t1061 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1059), @class.cond_cases_tac), t1060)
  cc_nr_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k < n → cc(n + 1, k) == pow(real_of_num(n) + (real_of_num(1) + real_of_num(k)), 2) / pow(real_of_num(n) + (real_of_num(1) - real_of_num(k)), 2) * cc(n, k)"), t1061))
}

///|
let cc_nr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CC_NR")

///|
/// `CC_NR`
pub fn cc_nr() -> @kernel.Thm {
  cc_nr_c.get()
}

///|
/// CC_N2R
fn step_78() -> Unit raise {
  let t1077 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num((n : Num)) + real_of_num(1) + (real_of_num(1) - real_of_num((k : Num))) == real_of_num(n) + (real_of_num(2) - real_of_num(k))"))
  let t1078 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num((n : Num)) + real_of_num(1) + (real_of_num(1) + real_of_num((k : Num))) == real_of_num(n) + (real_of_num(2) + real_of_num(k))"))
  let t1079 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num((n : Num)) + real_of_num(1) + real_of_num(1) == real_of_num(n) + real_of_num(2)")), t1078, t1077]))
  let t1076 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t1075 = @tactics.disch_then(fn(x1072 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1073 = @tactics.subst1_tac(x1072)
    fn(x1074 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1073(x1074)
    }
  })
  let t1071 = @simp.asm_rewrite_tac(@list.List([]))
  let t1069 = @term_syntax.parse_term("(k : Num)")
  let t1070 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1069]), cc_nr()))
  let t1068 = @tactics.disch_then(fn(x1065 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1066 = @tactics.subst1_tac(x1065)
    fn(x1067 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1066(x1067)
    }
  })
  let t1063 = @term_syntax.parse_term("(k : Num)")
  let t1064 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1063]), cc_nr()))
  let t1062 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 == n + 1 + 1")))
  let t1080 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1062), t1064), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1068), t1070), t1071), t1075), t1076), t1079)
  cc_n2r_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k < n → cc(n + 2, k) == pow(real_of_num(n) + (real_of_num(2) + real_of_num(k)), 2) / pow(real_of_num(n) + (real_of_num(2) - real_of_num(k)), 2) * (pow(real_of_num(n) + (real_of_num(1) + real_of_num(k)), 2) / pow(real_of_num(n) + (real_of_num(1) - real_of_num(k)), 2) * cc(n, k))"), t1080))
}

///|
let cc_n2r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CC_N2R")

///|
/// `CC_N2R`
pub fn cc_n2r() -> @kernel.Thm {
  cc_n2r_c.get()
}

///|
/// V_SNSK
fn step_79() -> Unit raise {
  let t1107 = @tactics.conv_tac(@calc_rat.real_field)
  let t1108 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t1107)
  let t1106 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @calc_rat.real_arith_tac])
  let t1105 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num)) < real_of_num((n : Num))"), fn(x1102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1103 = @tactics.mp_tac(x1102)
    fn(x1104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1103(x1104)
    }
  })
  let t1109 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t1105), t1106), t1108])
  let t1101 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num((n : Num)) + (real_of_num(2) + real_of_num(k)) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(1) - real_of_num(k)) == real_of_num(0)) && !(-real_of_num(n) + real_of_num(k) == real_of_num(0))"), fn(x1098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1099 = @tactics.mp_tac(x1098)
    fn(x1100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1099(x1100)
    }
  })
  let t1097 = @simp.rewrite_tac(@list.List([cc_step_k(), @equal.gsym(@realax.real_of_num_add())]))
  let t1096 = @tactics.disch_then(fn(x1093 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1094 = @tactics.subst1_tac(x1093)
    fn(x1095 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1094(x1095)
    }
  })
  let t1092 = @simp.asm_rewrite_tac(@list.List([]))
  let t1090 = @term_syntax.parse_term("(k : Num)")
  let t1091 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1090]), cc_nr()))
  let t1089 = @simp.rewrite_tac(@list.List([cc_step_k()]))
  let t1088 = @tactics.disch_then(fn(x1085 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1086 = @tactics.subst1_tac(x1085)
    fn(x1087 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1086(x1087)
    }
  })
  let t1084 = @simp.asm_rewrite_tac(@list.List([]))
  let t1082 = @term_syntax.parse_term("(k : Num)")
  let t1083 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1082]), ss_snsk()))
  let t1081 = @simp.rewrite_tac(@list.List([vv()]))
  let t1110 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1081), t1083), t1084), t1088), t1089), t1091), t1092), t1096), t1097), t1101), t1109)
  v_snsk_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, k < n → vv(n + 1, k + 1) == (real_of_num(n) + (real_of_num(2) + real_of_num(k))) * ((-real_of_num(n) + real_of_num(k)) * (pow(real_of_num(n) + (real_of_num(1) + real_of_num(k)), 2) / pow(real_of_num(k) + real_of_num(1), 4))) * vv(n, k) + (pow(real_of_num(n) + (real_of_num(2) + real_of_num(k)), 2) * (pow(-real_of_num(n) - real_of_num(1) + real_of_num(k), 2) / pow(real_of_num(k) + real_of_num(1), 4)) * vv(n + 1, k) + (-real_of_num(n) - real_of_num(2) - real_of_num(k)) / (-real_of_num(n) + real_of_num(k)) * vv(n, k + 1))"), t1110))
}

///|
let v_snsk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SNSK")

///|
/// `V_SNSK`
pub fn v_snsk() -> @kernel.Thm {
  v_snsk_c.get()
}

///|
/// V_SN2
fn step_80() -> Unit raise {
  let t1146 = @tactics.conv_tac(@calc_rat.real_field)
  let t1147 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t1146)
  let t1145 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @calc_rat.real_arith_tac])
  let t1144 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num)) < real_of_num((n : Num))"), fn(x1141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1142 = @tactics.mp_tac(x1141)
    fn(x1143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1142(x1143)
    }
  })
  let t1148 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t1144), t1145), t1147])
  let t1140 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num((n : Num)) + real_of_num(2) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(2) - real_of_num(k)) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(1) - real_of_num(k)) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(2) + real_of_num(k)) == real_of_num(0)) && !(-real_of_num(n) + real_of_num(k) == real_of_num(0))"), fn(x1137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1138 = @tactics.mp_tac(x1137)
    fn(x1139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1138(x1139)
    }
  })
  let t1136 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t1134 = @calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num((k : Num)) - real_of_num((n : Num)) - real_of_num(2), 2) == pow(real_of_num(n) + (real_of_num(2) - real_of_num(k)), 2)"))
  let t1135 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num((n : Num)) - real_of_num(1) + real_of_num((k : Num)), 2) == pow(real_of_num(n) + (real_of_num(1) - real_of_num(k)), 2)")), t1134]))
  let t1133 = @simp.rewrite_tac(@list.List([cc_step_k()]))
  let t1132 = @tactics.disch_then(fn(x1129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1130 = @tactics.subst1_tac(x1129)
    fn(x1131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1130(x1131)
    }
  })
  let t1128 = @simp.asm_rewrite_tac(@list.List([]))
  let t1126 = @term_syntax.parse_term("(k : Num)")
  let t1127 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1126]), cc_nr()))
  let t1125 = @tactics.disch_then(fn(x1122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1123 = @tactics.subst1_tac(x1122)
    fn(x1124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1123(x1124)
    }
  })
  let t1121 = @simp.asm_rewrite_tac(@list.List([]))
  let t1119 = @term_syntax.parse_term("(k : Num)")
  let t1120 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1119]), cc_n2r()))
  let t1118 = @tactics.disch_then(fn(x1115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1116 = @tactics.subst1_tac(x1115)
    fn(x1117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1116(x1117)
    }
  })
  let t1114 = @simp.asm_rewrite_tac(@list.List([]))
  let t1112 = @term_syntax.parse_term("(k : Num)")
  let t1113 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1112]), ss_sn2()))
  let t1111 = @simp.rewrite_tac(@list.List([vv()]))
  let t1149 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1111), t1113), t1114), t1118), t1120), t1121), t1125), t1127), t1128), t1132), t1133), t1135), t1136), t1140), t1148)
  v_sn2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ k : Num, 1 <= k && k < n → vv(n + 2, k) == -real_of_num(1) * ((real_of_num(n) + (real_of_num(2) + real_of_num(k))) * ((real_of_num(2) + (real_of_num(9) * pow(real_of_num(n), 2) - real_of_num(3) * (real_of_num(k) * real_of_num(n)) + (real_of_num(6) * pow(real_of_num(k), 2) + (pow(real_of_num(n), 4) + (real_of_num(5) * pow(real_of_num(n), 3) + (real_of_num(6) * pow(real_of_num(k), 3) + (real_of_num(k) * pow(real_of_num(n), 3) - real_of_num(k) * pow(real_of_num(n), 2) - real_of_num(4) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) - real_of_num(2) * (pow(real_of_num(k), 2) * real_of_num(n)) + (real_of_num(4) * (pow(real_of_num(k), 3) * real_of_num(n)) + (real_of_num(k) + real_of_num(7) * real_of_num(n)))))))))) * (pow(real_of_num(n) + (real_of_num(1) + real_of_num(k)), 2) / (pow(real_of_num(n) + real_of_num(2), 3) * (pow(-real_of_num(n) - real_of_num(1) + real_of_num(k), 2) * pow(real_of_num(k) - real_of_num(n) - real_of_num(2), 2)))))) * vv(n, k) + ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) * (pow(real_of_num(n) + (real_of_num(2) + real_of_num(k)), 2) / (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(k) - real_of_num(n) - real_of_num(2), 2)))) * vv(n + 1, k) + real_of_num(2) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * (pow(real_of_num(k) + real_of_num(1), 5) * ((real_of_num(n) + (real_of_num(2) + real_of_num(k))) / (pow(real_of_num(n) + real_of_num(2), 3) * ((-real_of_num(n) + real_of_num(k)) * (pow(-real_of_num(n) - real_of_num(1) + real_of_num(k), 2) * pow(real_of_num(k) - real_of_num(n) - real_of_num(2), 2)))))))) * vv(n, k + 1))"), t1149))
}

///|
let v_sn2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SN2")

///|
/// `V_SN2`
pub fn v_sn2() -> @kernel.Thm {
  v_sn2_c.get()
}

///|
/// qc00
fn step_81() -> Unit raise {
  qc00_c.set(@pair.new_definition(@term_syntax.parse_term("(qc00 : (Num, Num) -> Real)((n : Num), (k : Num)) == real_of_num(4) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (real_of_num(1744402215) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 14)) + (-real_of_num(390926048) * (real_of_num(k) * pow(real_of_num(n), 15)) + (-real_of_num(1797543582) * (real_of_num(k) * pow(real_of_num(n), 14)) + (-real_of_num(27184619520) * pow(real_of_num(n), 2) + (real_of_num(25107052032) * (real_of_num(k) * real_of_num(n)) + (real_of_num(2077567488) * pow(real_of_num(k), 2) + (-real_of_num(332796611328) * pow(real_of_num(n), 4) + (-real_of_num(120646983168) * pow(real_of_num(n), 3) + (-real_of_num(6189000960) * pow(real_of_num(k), 3) + (-real_of_num(3452904576) * pow(real_of_num(k), 4) + (real_of_num(258088741728) * (real_of_num(k) * pow(real_of_num(n), 3)) + (real_of_num(102524693760) * (real_of_num(k) * pow(real_of_num(n), 2)) + (real_of_num(121546930272) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(23906184192) * (pow(real_of_num(k), 2) * real_of_num(n)) + (-real_of_num(47918897056) * (pow(real_of_num(k), 3) * real_of_num(n)) + (-real_of_num(453776761464) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 6)) + (-real_of_num(34208713762) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 4)) + (-real_of_num(29608827881) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 3)) + (real_of_num(5592448786) * (pow(real_of_num(k), 8) * real_of_num(n)) + (real_of_num(14155092397) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 2)) + (-real_of_num(616679187165) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 7)) + (real_of_num(2863226880) * real_of_num(k) + (-real_of_num(2863226880) * real_of_num(n) + (-real_of_num(673265061944) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 4)) + (-real_of_num(30134039386) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 2)) + (-real_of_num(328103820800) * pow(real_of_num(n), 10) + (-real_of_num(859845193968) * pow(real_of_num(n), 8) + (-real_of_num(591626761600) * pow(real_of_num(n), 9) + (-real_of_num(998105211488) * pow(real_of_num(n), 7) + (-real_of_num(10833443724) * (pow(real_of_num(k), 7) * real_of_num(n)) + (-real_of_num(911577929600) * pow(real_of_num(n), 6) + (-real_of_num(639897370880) * pow(real_of_num(n), 5) + (real_of_num(255690672) * pow(real_of_num(k), 9) + (-real_of_num(409497350480) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 3)) + (-real_of_num(176289543184) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 2)) + (real_of_num(445980429568) * (real_of_num(k) * pow(real_of_num(n), 4)) + (real_of_num(779418105800) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 4)) + (real_of_num(372081953600) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 3)) + (-real_of_num(27857118128) * (pow(real_of_num(k), 4) * real_of_num(n)) + (real_of_num(555594416928) * (real_of_num(k) * pow(real_of_num(n), 5)) + (-real_of_num(405743014925) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 4)) + (-real_of_num(247666013854) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 3)) + (real_of_num(182888462394) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 3)) + (real_of_num(81436213660) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 2)) + (-real_of_num(18444006265) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 2)) + (-real_of_num(7247159210) * (pow(real_of_num(k), 6) * real_of_num(n)) + (-real_of_num(105299641272) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 2)) + (real_of_num(22679880432) * (pow(real_of_num(k), 5) * real_of_num(n)) + (-real_of_num(1333959512) * pow(real_of_num(k), 6) + (-real_of_num(1822888416) * pow(real_of_num(k), 7) + (real_of_num(1023021688) * pow(real_of_num(k), 8) + (real_of_num(2997847184) * pow(real_of_num(k), 5) + (real_of_num(63848152) * (pow(real_of_num(k), 11) * real_of_num(n)) + (-real_of_num(1719699936) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 3)) + (real_of_num(139771620) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 3)) + (real_of_num(123447892) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 2)) + (real_of_num(102640379) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 4)) + (real_of_num(17466166) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 6)) + (real_of_num(51093252) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 5)) + (-real_of_num(87428804) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 7)) + (-real_of_num(311211346) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 6)) + (-real_of_num(783589496) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 5)) + (-real_of_num(1394901560) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 4)) + (-real_of_num(674057028) * (pow(real_of_num(k), 10) * real_of_num(n)) + (-real_of_num(1397856374) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 2)) + (real_of_num(2124) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 10)) + (-real_of_num(5808) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 11)) + (-real_of_num(900) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 12)) + (real_of_num(14016) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 13)) + (-real_of_num(9660) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 14)) + (-real_of_num(7440) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 15)) + (real_of_num(13044) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 16)) + (-real_of_num(3456) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 17)) + (-real_of_num(3648) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 18)) + (real_of_num(3072) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 19)) + (real_of_num(53916) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 9)) + (-real_of_num(168060) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 10)) + (-real_of_num(7968) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 11)) + (real_of_num(439032) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 12)) + (-real_of_num(342996) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 13)) + (-real_of_num(234732) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 14)) + (real_of_num(482568) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 15)) + (-real_of_num(147696) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 16)) + (-real_of_num(144048) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 17)) + (real_of_num(128928) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 18)) + (-real_of_num(32256) * (real_of_num(k) * pow(real_of_num(n), 19)) + (real_of_num(610071) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 8)) + (-real_of_num(2193376) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 9)) + (real_of_num(154863) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 10)) + (real_of_num(6305692) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 11)) + (-real_of_num(5568967) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 12)) + (-real_of_num(3398600) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 13)) + (real_of_num(8280997) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 14)) + (-real_of_num(2912340) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 15)) + (-real_of_num(2673124) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 16)) + (real_of_num(2543776) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 17)) + (-real_of_num(631552) * (real_of_num(k) * pow(real_of_num(n), 18)) + (real_of_num(4050412) * (pow(real_of_num(k), 11) * pow(real_of_num(n), 7)) + (-real_of_num(17034532) * (pow(real_of_num(k), 10) * pow(real_of_num(n), 8)) + (real_of_num(3467507) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 9)) + (real_of_num(55016357) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 10)) + (-real_of_num(54855522) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 11)) + (-real_of_num(29964918) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 12)) + (real_of_num(87494875) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 13)) + (-real_of_num(35252851) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 14)) + (-real_of_num(31003896) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 15)) + (real_of_num(31367368) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 16)) + (-real_of_num(7645312) * (real_of_num(k) * pow(real_of_num(n), 17)) + (-real_of_num(252131679) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 14)) + (real_of_num(271060288) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 15)) + (-real_of_num(63952392) * (real_of_num(k) * pow(real_of_num(n), 16)) + (-real_of_num(3685794720) * pow(real_of_num(n), 14) + (-real_of_num(681771968) * pow(real_of_num(n), 15) + (-real_of_num(97183888) * pow(real_of_num(n), 16) + (-real_of_num(10296800) * pow(real_of_num(n), 17) + (-real_of_num(768) * pow(real_of_num(n), 20) + (-real_of_num(35328) * pow(real_of_num(n), 19) + (-real_of_num(763360) * pow(real_of_num(n), 18) + (real_of_num(325582047) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 9)) + (-real_of_num(366581765) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 10)) + (-real_of_num(180195424) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 11)) + (real_of_num(637095193) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 12)) + (-real_of_num(293786083) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 13)) + (real_of_num(1381460896) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 8)) + (-real_of_num(1759973356) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 9)) + (-real_of_num(785707110) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 10)) + (real_of_num(3390299217) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 11)) + (-real_of_num(1790786379) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 12)) + (-real_of_num(1528641105) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 13)) + (real_of_num(4329005311) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 7)) + (-real_of_num(6267925410) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 8)) + (-real_of_num(2584329138) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 9)) + (real_of_num(13641244822) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 10)) + (-real_of_num(8275822234) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 11)) + (-real_of_num(7171164950) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 12)) + (real_of_num(8671244945) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 13)) + (real_of_num(10157899122) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 6)) + (-real_of_num(16846739030) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 7)) + (-real_of_num(6608736882) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 8)) + (real_of_num(42343375448) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 9)) + (-real_of_num(29644875275) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 10)) + (-real_of_num(26657515127) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 11)) + (real_of_num(34074345499) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 12)) + (-real_of_num(6281404994) * (real_of_num(k) * pow(real_of_num(n), 13)) + (real_of_num(17873852947) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 5)) + (-real_of_num(34403563419) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 6)) + (-real_of_num(13486898969) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 7)) + (real_of_num(102510705804) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 8)) + (-real_of_num(83411422057) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 9)) + (-real_of_num(79729894768) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 10)) + (real_of_num(107414839637) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 11)) + (-real_of_num(16511136494) * (real_of_num(k) * pow(real_of_num(n), 12)) + (real_of_num(23326085212) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 4)) + (-real_of_num(53241708152) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 5)) + (-real_of_num(22441935459) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 6)) + (real_of_num(194292424443) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 7)) + (-real_of_num(185590186906) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 8)) + (-real_of_num(193594433821) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 9)) + (real_of_num(273992904577) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 10)) + (-real_of_num(31057152218) * (real_of_num(k) * pow(real_of_num(n), 11)) + (-real_of_num(383034928990) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 8)) + (real_of_num(567647259943) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 9)) + (-real_of_num(34242238930) * (real_of_num(k) * pow(real_of_num(n), 10)) + (-real_of_num(15710071840) * pow(real_of_num(n), 13) + (-real_of_num(147311006048) * pow(real_of_num(n), 11) + (-real_of_num(53560818048) * pow(real_of_num(n), 12) + (-real_of_num(146056688) * pow(real_of_num(k), 10) + (real_of_num(954502237105) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 8)) + (real_of_num(9342208346) * (real_of_num(k) * pow(real_of_num(n), 9)) + (-real_of_num(768) * (real_of_num(k) * pow(real_of_num(n), 20)) + (real_of_num(134837704206) * (real_of_num(k) * pow(real_of_num(n), 8)) + (-real_of_num(490926362370) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 5)) + (real_of_num(286016170951) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 4)) + (real_of_num(506405609304) * (real_of_num(k) * pow(real_of_num(n), 6)) + (real_of_num(1197029877604) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 5)) + (-real_of_num(802371636049) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 6)) + (-real_of_num(832398382758) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 5)) + (real_of_num(329600901794) * (real_of_num(k) * pow(real_of_num(n), 7)) + (real_of_num(1295827185263) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 7)) + (real_of_num(1405464163068) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 6)) + (real_of_num(1211927256) * (pow(real_of_num(k), 9) * real_of_num(n)) + (real_of_num(3251918342) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 3)) + (real_of_num(2579633352) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 2)) + (real_of_num(2693929255) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 4)) + (real_of_num(31316929) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 8)) + (real_of_num(169665992) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 7)) + (real_of_num(612974365) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 6)) + (real_of_num(1536374559) * (pow(real_of_num(k), 9) * pow(real_of_num(n), 5)) + (real_of_num(14685520) * pow(real_of_num(k), 11) + (-real_of_num(61627367257) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 4)) + (-real_of_num(326900137446) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 7)) + (-real_of_num(51889742508) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 3)) + (real_of_num(329102354583) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 5)) + (real_of_num(21970944881) * (pow(real_of_num(k), 8) * pow(real_of_num(n), 3)) + (real_of_num(287538055025) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 6)) + -real_of_num(30741445978) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 5))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) / (pow(-real_of_num(n) + (-real_of_num(1) + real_of_num(k)), 2) * (pow(-real_of_num(n) + (-real_of_num(4) + real_of_num(k)), 2) * (pow(real_of_num(n) + real_of_num(3), 3) * (pow(real_of_num(n) + real_of_num(2), 3) * (pow(real_of_num(k) + (-real_of_num(n) + -real_of_num(3)), 2) * pow(-real_of_num(n) + (-real_of_num(2) + real_of_num(k)), 2))))))")))
}

///|
let qc00_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qc00")

///|
/// `qc00`
pub fn qc00() -> @kernel.Thm {
  qc00_c.get()
}

///|
/// qc10
fn step_82() -> Unit raise {
  qc10_c.set(@pair.new_definition(@term_syntax.parse_term("(qc10 : (Num, Num) -> Real)((n : Num), (k : Num)) == -real_of_num(4) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * ((-real_of_num(768) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 14)) + (real_of_num(3456) * (real_of_num(k) * pow(real_of_num(n), 15)) + (real_of_num(128352) * (real_of_num(k) * pow(real_of_num(n), 14)) + (-real_of_num(67908067008) * pow(real_of_num(n), 2) + (real_of_num(9099997808) * (real_of_num(k) * real_of_num(n)) + (real_of_num(310664672) * pow(real_of_num(k), 2) + (-real_of_num(175893838000) * pow(real_of_num(n), 4) + (-real_of_num(131207942960) * pow(real_of_num(n), 3) + (-real_of_num(169882072) * pow(real_of_num(k), 3) + (real_of_num(16459280) * pow(real_of_num(k), 4) + (real_of_num(52615736598) * (real_of_num(k) * pow(real_of_num(n), 3)) + (real_of_num(27869086208) * (real_of_num(k) * pow(real_of_num(n), 2)) + (real_of_num(4186382212) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(1686931392) * (pow(real_of_num(k), 2) * real_of_num(n)) + (-real_of_num(944024994) * (pow(real_of_num(k), 3) * real_of_num(n)) + (real_of_num(114305270) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 6)) + (-real_of_num(693288259) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 7)) + (real_of_num(1381092384) * real_of_num(k) + (-real_of_num(21794233216) * real_of_num(n) + (-real_of_num(3964985038) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 4)) + (-real_of_num(3448870336) * pow(real_of_num(n), 10) + (-real_of_num(34419976280) * pow(real_of_num(n), 8) + (-real_of_num(12314690524) * pow(real_of_num(n), 9) + (-real_of_num(75583675964) * pow(real_of_num(n), 7) + (-real_of_num(130014624048) * pow(real_of_num(n), 6) + (-real_of_num(173414173068) * pow(real_of_num(n), 5) + (-real_of_num(3754252403) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 3)) + (-real_of_num(2412870465) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 2)) + (real_of_num(68467857071) * (real_of_num(k) * pow(real_of_num(n), 4)) + (real_of_num(6286099260) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 4)) + (real_of_num(6267688586) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 3)) + (real_of_num(88023212) * (pow(real_of_num(k), 4) * real_of_num(n)) + (real_of_num(65027372713) * (real_of_num(k) * pow(real_of_num(n), 5)) + (real_of_num(316850268) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 4)) + (real_of_num(318395514) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 3)) + (real_of_num(215308166) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 2)) + (-real_of_num(1240448) * pow(real_of_num(n), 14) + (-real_of_num(63984) * pow(real_of_num(n), 15) + (-real_of_num(1536) * pow(real_of_num(n), 16) + (real_of_num(768) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 12)) + (-real_of_num(1728) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 13)) + (real_of_num(21912) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 11)) + (-real_of_num(57072) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 12)) + (-real_of_num(20472) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 13)) + (real_of_num(284200) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 10)) + (-real_of_num(861540) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 11)) + (-real_of_num(229168) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 12)) + (real_of_num(2207580) * (real_of_num(k) * pow(real_of_num(n), 13)) + (real_of_num(2216476) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 9)) + (-real_of_num(7872580) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 10)) + (-real_of_num(1284268) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 11)) + (real_of_num(23327476) * (real_of_num(k) * pow(real_of_num(n), 12)) + (real_of_num(11581872) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 8)) + (-real_of_num(48600970) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 9)) + (-real_of_num(2229148) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 10)) + (real_of_num(169390270) * (real_of_num(k) * pow(real_of_num(n), 11)) + (-real_of_num(214150124) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 8)) + (real_of_num(19636326) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 9)) + (real_of_num(895491960) * (real_of_num(k) * pow(real_of_num(n), 10)) + (-real_of_num(14858072) * pow(real_of_num(n), 13) + (-real_of_num(747916132) * pow(real_of_num(n), 11) + (-real_of_num(123087048) * pow(real_of_num(n), 12) + (real_of_num(178983116) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 8)) + (real_of_num(3561379481) * (real_of_num(k) * pow(real_of_num(n), 9)) + (real_of_num(10853226951) * (real_of_num(k) * pow(real_of_num(n), 8)) + (real_of_num(223378412) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 5)) + (real_of_num(46548168958) * (real_of_num(k) * pow(real_of_num(n), 6)) + (real_of_num(4425270962) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 5)) + (-real_of_num(1670758425) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 6)) + (-real_of_num(2999441626) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 5)) + (real_of_num(25562116926) * (real_of_num(k) * pow(real_of_num(n), 7)) + (real_of_num(780005826) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 7)) + (real_of_num(2218767840) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 6)) + (-real_of_num(3268333056) + real_of_num(42741626) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 7)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) * pow(real_of_num(k), 4))))) / (pow(-real_of_num(n) + (-real_of_num(2) + real_of_num(k)), 2) * (pow(-real_of_num(n) + (-real_of_num(4) + real_of_num(k)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * (pow(real_of_num(n) + real_of_num(3), 3) * pow(real_of_num(k) + (-real_of_num(n) + -real_of_num(3)), 2)))))")))
}

///|
let qc10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qc10")

///|
/// `qc10`
pub fn qc10() -> @kernel.Thm {
  qc10_c.get()
}

///|
/// qc01
fn step_83() -> Unit raise {
  qc01_c.set(@pair.new_definition(@term_syntax.parse_term("(qc01 : (Num, Num) -> Real)((n : Num), (k : Num)) == -real_of_num(4) * (real_of_num(k) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(k) + real_of_num(1), 5) * (real_of_num(285984) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 14)) + (-real_of_num(157920) * (real_of_num(k) * pow(real_of_num(n), 15)) + (-real_of_num(3026048) * (real_of_num(k) * pow(real_of_num(n), 14)) + (real_of_num(74867424768) * pow(real_of_num(n), 2) + (-real_of_num(44680889088) * (real_of_num(k) * real_of_num(n)) + (real_of_num(5162764032) * pow(real_of_num(k), 2) + (real_of_num(241822754048) * pow(real_of_num(n), 4) + (real_of_num(161603596032) * pow(real_of_num(n), 3) + (-real_of_num(1744849824) * pow(real_of_num(k), 3) + (-real_of_num(744986544) * pow(real_of_num(k), 4) + (-real_of_num(281708015936) * (real_of_num(k) * pow(real_of_num(n), 3)) + (-real_of_num(142716403296) * (real_of_num(k) * pow(real_of_num(n), 2)) + (real_of_num(96887337056) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 2)) + (real_of_num(32825580096) * (pow(real_of_num(k), 2) * real_of_num(n)) + (-real_of_num(10344114032) * (pow(real_of_num(k), 3) * real_of_num(n)) + (-real_of_num(3469900135) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 6)) + (-real_of_num(1842594317) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 4)) + (-real_of_num(2262462688) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 3)) + (-real_of_num(13217484828) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 7)) + (-real_of_num(6512113152) * real_of_num(k) + (real_of_num(21458165760) * real_of_num(n) + (-real_of_num(54560718080) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 4)) + (real_of_num(123447892) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 2)) + (real_of_num(10042207744) * pow(real_of_num(n), 10) + (real_of_num(75468444096) * pow(real_of_num(n), 8) + (real_of_num(30900177104) * pow(real_of_num(n), 9) + (real_of_num(146266755504) * pow(real_of_num(n), 7) + (real_of_num(63848152) * (pow(real_of_num(k), 7) * real_of_num(n)) + (real_of_num(223624806496) * pow(real_of_num(n), 6) + (real_of_num(266328825472) * pow(real_of_num(n), 5) + (-real_of_num(47534432700) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 3)) + (-real_of_num(28334986440) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 2)) + (-real_of_num(384634123200) * (real_of_num(k) * pow(real_of_num(n), 4)) + (real_of_num(220377639732) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 4)) + (real_of_num(176090065112) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 3)) + (-real_of_num(3766672224) * (pow(real_of_num(k), 4) * real_of_num(n)) + (-real_of_num(385205224120) * (real_of_num(k) * pow(real_of_num(n), 5)) + (-real_of_num(11108830969) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 4)) + (-real_of_num(11977447248) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 3)) + (real_of_num(11326819614) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 3)) + (real_of_num(8499441560) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 2)) + (-real_of_num(1832048202) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 2)) + (-real_of_num(880287004) * (pow(real_of_num(k), 6) * real_of_num(n)) + (-real_of_num(8659675144) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 2)) + (real_of_num(3824239688) * (pow(real_of_num(k), 5) * real_of_num(n)) + (-real_of_num(190113248) * pow(real_of_num(k), 6) + (real_of_num(14685520) * pow(real_of_num(k), 7) + (real_of_num(780109264) * pow(real_of_num(k), 5) + (-real_of_num(6720) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 14)) + (real_of_num(7488) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 15)) + (-real_of_num(3840) * (real_of_num(k) * pow(real_of_num(n), 16)) + (real_of_num(8872992) * pow(real_of_num(n), 14) + (real_of_num(695008) * pow(real_of_num(n), 15) + (real_of_num(33792) * pow(real_of_num(n), 16) + (real_of_num(768) * pow(real_of_num(n), 17) + (real_of_num(2124) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 10)) + (-real_of_num(7932) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 11)) + (real_of_num(8772) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 12)) + (-real_of_num(372) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 13)) + (real_of_num(53916) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 9)) + (-real_of_num(228348) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 10)) + (real_of_num(285576) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 11)) + (-real_of_num(24444) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 12)) + (-real_of_num(236508) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 13)) + (real_of_num(610071) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 8)) + (-real_of_num(2965195) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 9)) + (real_of_num(4228061) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 10)) + (-real_of_num(563929) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 11)) + (-real_of_num(3845816) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 12)) + (real_of_num(5069472) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 13)) + (real_of_num(4050412) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 7)) + (-real_of_num(22915157) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 8)) + (real_of_num(37634766) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 9)) + (-real_of_num(7062201) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 10)) + (-real_of_num(38297128) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 11)) + (real_of_num(55326472) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 12)) + (-real_of_num(35860680) * (real_of_num(k) * pow(real_of_num(n), 13)) + (real_of_num(17466166) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 6)) + (-real_of_num(117046206) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 7)) + (real_of_num(224250307) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 8)) + (-real_of_num(56308591) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 9)) + (-real_of_num(260924075) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 10)) + (real_of_num(415735739) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 11)) + (-real_of_num(294146400) * (real_of_num(k) * pow(real_of_num(n), 12)) + (real_of_num(51093252) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 5)) + (-real_of_num(414703096) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 6)) + (real_of_num(942042570) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 7)) + (-real_of_num(308693091) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 8)) + (-real_of_num(1286667926) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 9)) + (real_of_num(2278300097) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 10)) + (-real_of_num(1770637850) * (real_of_num(k) * pow(real_of_num(n), 11)) + (-real_of_num(4735827930) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 8)) + (real_of_num(9406632852) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 9)) + (-real_of_num(8090727306) * (real_of_num(k) * pow(real_of_num(n), 10)) + (real_of_num(78742896) * pow(real_of_num(n), 13) + (real_of_num(2576225456) * pow(real_of_num(n), 11) + (real_of_num(515413184) * pow(real_of_num(n), 12) + (real_of_num(29795852850) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 8)) + (-real_of_num(28624383652) * (real_of_num(k) * pow(real_of_num(n), 9)) + (-real_of_num(79238310868) * (real_of_num(k) * pow(real_of_num(n), 8)) + (-real_of_num(7286006265) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 5)) + (real_of_num(10083400273) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 4)) + (-real_of_num(292723611810) * (real_of_num(k) * pow(real_of_num(n), 6)) + (real_of_num(201162981114) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 5)) + (-real_of_num(28108959555) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 6)) + (-real_of_num(45328273270) * (pow(real_of_num(k), 3) * pow(real_of_num(n), 5)) + (-real_of_num(172186812834) * (real_of_num(k) * pow(real_of_num(n), 7)) + (real_of_num(73002514895) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 7)) + (real_of_num(138352054849) * (pow(real_of_num(k), 2) * pow(real_of_num(n), 6)) + (real_of_num(102640379) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 4)) + (-real_of_num(1211427691) * (pow(real_of_num(k), 4) * pow(real_of_num(n), 7)) + (real_of_num(139771620) * (pow(real_of_num(k), 7) * pow(real_of_num(n), 3)) + (real_of_num(6319292362) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 5)) + (real_of_num(2859841811) * (pow(real_of_num(k), 5) * pow(real_of_num(n), 6)) + (-real_of_num(1039509631) * (pow(real_of_num(k), 6) * pow(real_of_num(n), 5)) + real_of_num(2863226880))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) / ((-real_of_num(n) + real_of_num(k)) * (pow(real_of_num(k) + (-real_of_num(n) + -real_of_num(3)), 2) * (pow(-real_of_num(n) + (-real_of_num(4) + real_of_num(k)), 2) * (pow(-real_of_num(n) + (-real_of_num(1) + real_of_num(k)), 2) * (pow(real_of_num(n) + real_of_num(3), 3) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(-real_of_num(n) + (-real_of_num(2) + real_of_num(k)), 2)))))))")))
}

///|
let qc01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qc01")

///|
/// `qc01`
pub fn qc01() -> @kernel.Thm {
  qc01_c.get()
}

///|
/// pflat2
fn step_84() -> Unit raise {
  pflat2_c.set(@pair.new_definition(@term_syntax.parse_term("(pflat2 : ((Num, Num) -> Real, Num, Num) -> Real)((f : (Num, Num) -> Real), (n : Num), (k : Num)) == pflat((m : Num) => f(m, k), n)")))
}

///|
let pflat2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pflat2")

///|
/// `pflat2`
pub fn pflat2() -> @kernel.Thm {
  pflat2_c.get()
}

///|
/// qflat
fn step_85() -> Unit raise {
  qflat_c.set(@pair.new_definition(@term_syntax.parse_term("(qflat : ((Num, Num) -> Real, Num, Num) -> Real)((f : (Num, Num) -> Real), (n : Num), (k : Num)) == qc00(n, k) * f(n, k) + (qc10(n, k) * f(n + 1, k) + qc01(n, k) * f(n, k + 1))")))
}

///|
let qflat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qflat")

///|
/// `qflat`
pub fn qflat() -> @kernel.Thm {
  qflat_c.get()
}

///|
/// V_SN2_CL
fn step_86() -> Unit raise {
  let t1165 = @tactics.conv_tac(@calc_rat.real_field)
  let t1166 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow(real_of_num((k : Num)) - real_of_num((n : Num)) - real_of_num(2), 2) == pow(real_of_num(n) + (real_of_num(2) - real_of_num(k)), 2)"))])), t1165)
  let t1164 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1163 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @tactics.all_tac])
  let t1167 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num)) < real_of_num((n : Num))"), fn(x1160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1161 = @tactics.mp_tac(x1160)
    fn(x1162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1161(x1162)
    }
  }), t1163), @tactics.strip_tac), t1164), @calc_rat.asm_real_arith_tac), t1166])
  let t1159 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(2) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(1) - real_of_num((k : Num))) == real_of_num(0)) && !(real_of_num(n) + (real_of_num(2) - real_of_num(k)) == real_of_num(0)) && !(-real_of_num(n) + real_of_num(k) == real_of_num(0))"), fn(x1156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1157 = @tactics.mp_tac(x1156)
    fn(x1158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1157(x1158)
    }
  })
  let t1155 = @tactics.disch_then(fn(x1152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1153 = @tactics.subst1_tac(x1152)
    fn(x1154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1153(x1154)
    }
  })
  let t1151 = @simp.asm_rewrite_tac(@list.List([]))
  let t1150 = @term_syntax.parse_term("(k : Num)")
  let t1168 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1150]), v_sn2()))), t1151), t1155), t1159), t1167)
  v_sn2_cl_c.set(@tactics.prove(@term_syntax.parse_term("1 <= (k : Num) && k < (n : Num) → pow(real_of_num(n) + real_of_num(2), 3) * (pow(real_of_num(n) + (real_of_num(1) - real_of_num(k)), 2) * (pow(real_of_num(n) + (real_of_num(2) - real_of_num(k)), 2) * (-real_of_num(n) + real_of_num(k)))) * vv(n + 2, k) == (pow(real_of_num(n), 8) + (real_of_num(3) * (pow(real_of_num(n), 7) * real_of_num(k)) - real_of_num(2) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) - real_of_num(6) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(5) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(7) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) - real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) - real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 7)) + (real_of_num(9) * pow(real_of_num(n), 7) + (real_of_num(17) * (pow(real_of_num(n), 6) * real_of_num(k)) - real_of_num(20) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) - real_of_num(16) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(37) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(5) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) - real_of_num(26) * (real_of_num(n) * pow(real_of_num(k), 6)) - real_of_num(6) * pow(real_of_num(k), 7) + (real_of_num(34) * pow(real_of_num(n), 6) + (real_of_num(36) * (pow(real_of_num(n), 5) * real_of_num(k)) - real_of_num(57) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (real_of_num(9) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(53) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) - real_of_num(45) * (real_of_num(n) * pow(real_of_num(k), 5)) - real_of_num(30) * pow(real_of_num(k), 6) + (real_of_num(70) * pow(real_of_num(n), 5) + (real_of_num(34) * (pow(real_of_num(n), 4) * real_of_num(k)) - real_of_num(67) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (real_of_num(37) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) - real_of_num(19) * (real_of_num(n) * pow(real_of_num(k), 4)) - real_of_num(55) * pow(real_of_num(k), 5) + (real_of_num(85) * pow(real_of_num(n), 4) + (real_of_num(9) * (pow(real_of_num(n), 3) * real_of_num(k)) - real_of_num(41) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) - real_of_num(5) * (real_of_num(n) * pow(real_of_num(k), 3)) - real_of_num(48) * pow(real_of_num(k), 4) + (real_of_num(61) * pow(real_of_num(n), 3) - real_of_num(11) * (pow(real_of_num(n), 2) * real_of_num(k)) - real_of_num(25) * (real_of_num(n) * pow(real_of_num(k), 2)) - real_of_num(25) * pow(real_of_num(k), 3) + (real_of_num(24) * pow(real_of_num(n), 2) - real_of_num(12) * (real_of_num(n) * real_of_num(k)) - real_of_num(12) * pow(real_of_num(k), 2) + (real_of_num(4) * real_of_num(n) - real_of_num(4) * real_of_num(k))))))))))))))))))))) * vv(n, k) + ((-real_of_num(2) * pow(real_of_num(n), 8) + (real_of_num(2) * (pow(real_of_num(n), 7) * real_of_num(k)) + (real_of_num(4) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) - real_of_num(4) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) - real_of_num(2) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(2) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) - real_of_num(21) * pow(real_of_num(n), 7) + (real_of_num(25) * (pow(real_of_num(n), 6) * real_of_num(k)) + (real_of_num(26) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) - real_of_num(34) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) - real_of_num(5) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(9) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) - real_of_num(95) * pow(real_of_num(n), 6) + (real_of_num(125) * (pow(real_of_num(n), 5) * real_of_num(k)) + (real_of_num(60) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) - real_of_num(108) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(3) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (real_of_num(15) * (real_of_num(n) * pow(real_of_num(k), 5)) - real_of_num(240) * pow(real_of_num(n), 5) + (real_of_num(332) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(43) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) - real_of_num(165) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(21) * (real_of_num(n) * pow(real_of_num(k), 4)) + (real_of_num(9) * pow(real_of_num(k), 5) - real_of_num(365) * pow(real_of_num(n), 4) + (real_of_num(509) * (pow(real_of_num(n), 3) * real_of_num(k)) - real_of_num(45) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) - real_of_num(117) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(18) * pow(real_of_num(k), 4) - real_of_num(333) * pow(real_of_num(n), 3) + (real_of_num(447) * (pow(real_of_num(n), 2) * real_of_num(k)) - real_of_num(87) * (real_of_num(n) * pow(real_of_num(k), 2)) - real_of_num(27) * pow(real_of_num(k), 3) - real_of_num(168) * pow(real_of_num(n), 2) + (real_of_num(204) * (real_of_num(n) * real_of_num(k)) - real_of_num(36) * pow(real_of_num(k), 2) - real_of_num(36) * real_of_num(n) + real_of_num(36) * real_of_num(k)))))))))))))))))))) * vv(n + 1, k) + (real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 7)) + (real_of_num(20) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) + (real_of_num(34) * (real_of_num(n) * pow(real_of_num(k), 6)) + (real_of_num(6) * pow(real_of_num(k), 7) + (real_of_num(40) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (real_of_num(110) * (real_of_num(n) * pow(real_of_num(k), 5)) + (real_of_num(42) * pow(real_of_num(k), 6) + (real_of_num(40) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(180) * (real_of_num(n) * pow(real_of_num(k), 4)) + (real_of_num(120) * pow(real_of_num(k), 5) + (real_of_num(20) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(160) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(180) * pow(real_of_num(k), 4) + (real_of_num(4) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(74) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(150) * pow(real_of_num(k), 3) + (real_of_num(14) * (real_of_num(n) * real_of_num(k)) + (real_of_num(66) * pow(real_of_num(k), 2) + real_of_num(12) * real_of_num(k)))))))))))))))))))) * vv(n, k + 1))"), t1168))
}

///|
let v_sn2_cl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SN2_CL")

///|
/// `V_SN2_CL`
pub fn v_sn2_cl() -> @kernel.Thm {
  v_sn2_cl_c.get()
}

///|
/// V_SNSK_CL
fn step_87() -> Unit raise {
  let t1184 = @tactics.conv_tac(@calc_rat.real_field)
  let t1183 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1182 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @tactics.all_tac])
  let t1185 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num((k : Num)) < real_of_num((n : Num))"), fn(x1179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1180 = @tactics.mp_tac(x1179)
    fn(x1181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1180(x1181)
    }
  }), t1182), @tactics.strip_tac), t1183), @calc_rat.asm_real_arith_tac), t1184])
  let t1178 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) + real_of_num(1) == real_of_num(0)) && !(-real_of_num((n : Num)) + real_of_num(k) == real_of_num(0))"), fn(x1175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1176 = @tactics.mp_tac(x1175)
    fn(x1177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1176(x1177)
    }
  })
  let t1174 = @tactics.disch_then(fn(x1171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1172 = @tactics.subst1_tac(x1171)
    fn(x1173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1172(x1173)
    }
  })
  let t1170 = @simp.asm_rewrite_tac(@list.List([]))
  let t1169 = @term_syntax.parse_term("(k : Num)")
  let t1186 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1169]), v_snsk()))), t1170), t1174), t1178), t1185)
  v_snsk_cl_c.set(@tactics.prove(@term_syntax.parse_term("(k : Num) < (n : Num) → pow(real_of_num(k) + real_of_num(1), 4) * (-real_of_num(n) + real_of_num(k)) * vv(n + 1, k + 1) == (pow(real_of_num(n), 5) + (pow(real_of_num(n), 4) * real_of_num(k) - real_of_num(2) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) - real_of_num(2) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(n) * pow(real_of_num(k), 4) + (pow(real_of_num(k), 5) + (real_of_num(4) * pow(real_of_num(n), 4) - real_of_num(8) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * pow(real_of_num(k), 4) + (real_of_num(5) * pow(real_of_num(n), 3) - real_of_num(5) * (pow(real_of_num(n), 2) * real_of_num(k)) - real_of_num(5) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(5) * pow(real_of_num(k), 3) + (real_of_num(2) * pow(real_of_num(n), 2) - real_of_num(4) * (real_of_num(n) * real_of_num(k)) + real_of_num(2) * pow(real_of_num(k), 2)))))))))) * vv(n, k) + ((pow(-real_of_num(n), 5) + (pow(real_of_num(n), 4) * real_of_num(k) + (real_of_num(2) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) - real_of_num(2) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) - real_of_num(n) * pow(real_of_num(k), 4) + (pow(real_of_num(k), 5) - real_of_num(6) * pow(real_of_num(n), 4) + (real_of_num(8) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) - real_of_num(8) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(2) * pow(real_of_num(k), 4) - real_of_num(13) * pow(real_of_num(n), 3) + (real_of_num(19) * (pow(real_of_num(n), 2) * real_of_num(k)) - real_of_num(3) * (real_of_num(n) * pow(real_of_num(k), 2)) - real_of_num(3) * pow(real_of_num(k), 3) - real_of_num(12) * pow(real_of_num(n), 2) + (real_of_num(16) * (real_of_num(n) * real_of_num(k)) - real_of_num(4) * pow(real_of_num(k), 2) - real_of_num(4) * real_of_num(n) + real_of_num(4) * real_of_num(k)))))))))) * vv(n + 1, k) + (-real_of_num(n) * pow(real_of_num(k), 4) - pow(real_of_num(k), 5) - real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) - real_of_num(6) * pow(real_of_num(k), 4) - real_of_num(6) * (real_of_num(n) * pow(real_of_num(k), 2)) - real_of_num(14) * pow(real_of_num(k), 3) - real_of_num(4) * (real_of_num(n) * real_of_num(k)) - real_of_num(16) * pow(real_of_num(k), 2) - real_of_num(n) - real_of_num(9) * real_of_num(k) - real_of_num(2)) * vv(n, k + 1))"), t1186))
}

///|
let v_snsk_cl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SNSK_CL")

///|
/// `V_SNSK_CL`
pub fn v_snsk_cl() -> @kernel.Thm {
  v_snsk_cl_c.get()
}

///|
/// V_SK2_CL
fn step_88() -> Unit raise {
  let t1198 = @tactics.conv_tac(@calc_rat.real_field)
  let t1197 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1199 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), @tactics.strip_tac), t1197), @calc_rat.real_arith_tac), t1198])
  let t1196 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) + real_of_num(1) == real_of_num(0)) && !(real_of_num(k) + real_of_num(2) == real_of_num(0))"), fn(x1193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1194 = @tactics.mp_tac(x1193)
    fn(x1195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1194(x1195)
    }
  })
  let t1192 = @tactics.disch_then(fn(x1189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1190 = @tactics.subst1_tac(x1189)
    fn(x1191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1190(x1191)
    }
  })
  let t1188 = @simp.asm_rewrite_tac(@list.List([]))
  let t1187 = @term_syntax.parse_term("(k : Num)")
  let t1200 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1187]), v_sk2()))), t1188), t1192), t1196), t1199)
  v_sk2_cl_c.set(@tactics.prove(@term_syntax.parse_term("(k : Num) + 1 < (n : Num) → (real_of_num(k) + real_of_num(1)) * pow(real_of_num(k) + real_of_num(2), 5) * vv(n, k + 2) == (pow(real_of_num(n), 6) - real_of_num(3) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (real_of_num(3) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) - pow(real_of_num(k), 6) + (real_of_num(3) * pow(real_of_num(n), 5) - real_of_num(5) * (pow(real_of_num(n), 4) * real_of_num(k)) - real_of_num(6) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (real_of_num(10) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(3) * (real_of_num(n) * pow(real_of_num(k), 4)) - real_of_num(5) * pow(real_of_num(k), 5) + (pow(real_of_num(n), 4) - real_of_num(10) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(8) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(10) * (real_of_num(n) * pow(real_of_num(k), 3)) - real_of_num(9) * pow(real_of_num(k), 4) - real_of_num(3) * pow(real_of_num(n), 3) - pow(real_of_num(n), 2) * real_of_num(k) + (real_of_num(11) * (real_of_num(n) * pow(real_of_num(k), 2)) - real_of_num(7) * pow(real_of_num(k), 3) - real_of_num(2) * pow(real_of_num(n), 2) + (real_of_num(4) * (real_of_num(n) * real_of_num(k)) - real_of_num(2) * pow(real_of_num(k), 2))))))))))) * vv(n, k) + (pow(real_of_num(n), 4) * pow(real_of_num(k), 2) - real_of_num(3) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (real_of_num(2) * pow(real_of_num(k), 6) + (real_of_num(3) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(2) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) - real_of_num(16) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) - real_of_num(3) * (real_of_num(n) * pow(real_of_num(k), 4)) + (real_of_num(16) * pow(real_of_num(k), 5) + (real_of_num(2) * pow(real_of_num(n), 4) + (real_of_num(6) * (pow(real_of_num(n), 3) * real_of_num(k)) - real_of_num(31) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) - real_of_num(16) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(53) * pow(real_of_num(k), 4) + (real_of_num(4) * pow(real_of_num(n), 3) - real_of_num(25) * (pow(real_of_num(n), 2) * real_of_num(k)) - real_of_num(32) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(93) * pow(real_of_num(k), 3) - real_of_num(7) * pow(real_of_num(n), 2) - real_of_num(28) * (real_of_num(n) * real_of_num(k)) + (real_of_num(91) * pow(real_of_num(k), 2) - real_of_num(9) * real_of_num(n) + (real_of_num(47) * real_of_num(k) + real_of_num(10))))))))))))) * vv(n, k + 1)"), t1200))
}

///|
let v_sk2_cl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SK2_CL")

///|
/// `V_SK2_CL`
pub fn v_sk2_cl() -> @kernel.Thm {
  v_sk2_cl_c.get()
}

///|
/// CANCEL_LEM
fn step_89() -> Unit raise {
  let t1201 = @meson.meson_tac(@list.List([@real.real_eq_mul_lcancel()]))
  cancel_lem_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Real, ∀ a : Real, ∀ b : Real, !(d == real_of_num(0)) && d * a == d * b → a == b"), t1201))
}

///|
let cancel_lem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CANCEL_LEM")

///|
/// `CANCEL_LEM`
pub fn cancel_lem() -> @kernel.Thm {
  cancel_lem_c.get()
}

///|
/// RAT_ADD
fn step_90() -> Unit raise {
  let t1202 = @tactics.conv_tac(@calc_rat.real_field)
  rat_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, !(b == real_of_num(0)) && !(d == real_of_num(0)) → a / b + c / d == (a * d + c * b) / (b * d)"), t1202))
}

///|
let rat_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_ADD")

///|
/// `RAT_ADD`
pub fn rat_add() -> @kernel.Thm {
  rat_add_c.get()
}

///|
/// RAT_SUB
fn step_91() -> Unit raise {
  let t1203 = @tactics.conv_tac(@calc_rat.real_field)
  rat_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, !(b == real_of_num(0)) && !(d == real_of_num(0)) → a / b - c / d == (a * d - c * b) / (b * d)"), t1203))
}

///|
let rat_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_SUB")

///|
/// `RAT_SUB`
pub fn rat_sub() -> @kernel.Thm {
  rat_sub_c.get()
}

///|
/// RAT_MUL
fn step_92() -> Unit raise {
  let t1204 = @tactics.conv_tac(@calc_rat.real_field)
  rat_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, !(b == real_of_num(0)) && !(d == real_of_num(0)) → a / b * (c / d) == a * c / (b * d)"), t1204))
}

///|
let rat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_MUL")

///|
/// `RAT_MUL`
pub fn rat_mul() -> @kernel.Thm {
  rat_mul_c.get()
}

///|
/// RAT_NEG
fn step_93() -> Unit raise {
  let t1205 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lneg()]))
  rat_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, -(a / b) == -a / b"), t1205))
}

///|
let rat_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_NEG")

///|
/// `RAT_NEG`
pub fn rat_neg() -> @kernel.Thm {
  rat_neg_c.get()
}

///|
/// RAT_INV
fn step_94() -> Unit raise {
  let t1206 = @tactics.conv_tac(@calc_rat.real_field)
  rat_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, !(a == real_of_num(0)) && !(b == real_of_num(0)) → inv(a / b) == b / a"), t1206))
}

///|
let rat_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_INV")

///|
/// `RAT_INV`
pub fn rat_inv() -> @kernel.Thm {
  rat_inv_c.get()
}

///|
/// RAT_DIV
fn step_95() -> Unit raise {
  let t1207 = @tactics.conv_tac(@calc_rat.real_field)
  rat_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, !(b == real_of_num(0)) && !(c == real_of_num(0)) && !(d == real_of_num(0)) → a / b / (c / d) == a * d / (b * c)"), t1207))
}

///|
let rat_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_DIV")

///|
/// `RAT_DIV`
pub fn rat_div() -> @kernel.Thm {
  rat_div_c.get()
}

///|
/// RAT_EQ_CROSS
fn step_96() -> Unit raise {
  let t1208 = @tactics.conv_tac(@calc_rat.real_field)
  rat_eq_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, !(b == real_of_num(0)) && !(d == real_of_num(0)) → (a / b == c / d) == (a * d == c * b)"), t1208))
}

///|
let rat_eq_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_EQ_CROSS")

///|
/// `RAT_EQ_CROSS`
pub fn rat_eq_cross() -> @kernel.Thm {
  rat_eq_cross_c.get()
}

///|
/// REAL_POW_NZ
fn step_97() -> Unit raise {
  let t1209 = @simp.simp_tac(@list.List([@real.real_pow_eq_0()]))
  real_pow_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, !(x == real_of_num(0)) → !(pow(x, n) == real_of_num(0))"), t1209))
}

///|
let real_pow_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_NZ")

///|
/// `REAL_POW_NZ`
pub fn real_pow_nz() -> @kernel.Thm {
  real_pow_nz_c.get()
}

///|
/// REAL_MUL_NZ
fn step_98() -> Unit raise {
  let t1210 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm()]))
  real_mul_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x == real_of_num(0)) && !(y == real_of_num(0)) → !(x * y == real_of_num(0))"), t1210))
}

///|
let real_mul_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_NZ")

///|
/// `REAL_MUL_NZ`
pub fn real_mul_nz() -> @kernel.Thm {
  real_mul_nz_c.get()
}

///|
/// div_tm
fn step_99() -> Unit raise {
  div_tm_c.set(@term_syntax.parse_term("op_slash"))
}

///|
let div_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("div_tm")

///|
/// `div_tm`
pub fn div_tm() -> @kernel.Term {
  div_tm_c.get()
}

///|
/// inv_tm
fn step_100() -> Unit raise {
  inv_tm_c.set(@term_syntax.parse_term("inv"))
}

///|
let inv_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("inv_tm")

///|
/// `inv_tm`
pub fn inv_tm() -> @kernel.Term {
  inv_tm_c.get()
}

///|
/// mul_tm
fn step_101() -> Unit raise {
  mul_tm_c.set(@term_syntax.parse_term("op_star"))
}

///|
let mul_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("mul_tm")

///|
/// `mul_tm`
pub fn mul_tm() -> @kernel.Term {
  mul_tm_c.get()
}

///|
/// add_tm
fn step_102() -> Unit raise {
  add_tm_c.set(@term_syntax.parse_term("op_plus"))
}

///|
let add_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("add_tm")

///|
/// `add_tm`
pub fn add_tm() -> @kernel.Term {
  add_tm_c.get()
}

///|
/// sub_tm
fn step_103() -> Unit raise {
  sub_tm_c.set(@term_syntax.parse_term("op_minus"))
}

///|
let sub_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("sub_tm")

///|
/// `sub_tm`
pub fn sub_tm() -> @kernel.Term {
  sub_tm_c.get()
}

///|
/// pow_tm
fn step_104() -> Unit raise {
  pow_tm_c.set(@term_syntax.parse_term("pow"))
}

///|
let pow_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pow_tm")

///|
/// `pow_tm`
pub fn pow_tm() -> @kernel.Term {
  pow_tm_c.get()
}

///|
/// neg_tm
fn step_105() -> Unit raise {
  neg_tm_c.set(@term_syntax.parse_term("op_minus_minus"))
}

///|
let neg_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("neg_tm")

///|
/// `neg_tm`
pub fn neg_tm() -> @kernel.Term {
  neg_tm_c.get()
}

///|
/// DIV1
fn step_106() -> Unit raise {
  div1_c.set(@equal.gsym(@real.real_div_1()))
}

///|
let div1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV1")

///|
/// `DIV1`
pub fn div1() -> @kernel.Thm {
  div1_c.get()
}

///|
/// dest_div
fn step_107() -> Unit raise {
  dest_div_c.set((x1211 : @kernel.Term) => @basics.dest_binop(div_tm(), x1211))
}

///|
let dest_div_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_div")

///|
/// `dest_div`
pub fn dest_div(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_div_c.get())(x)
}

///|
/// `is_binop_op`
pub fn is_binop_op(x1212 : @kernel.Term, x1213 : @kernel.Term) -> Bool raise {
  let op = x1212
  let t = x1213
  (@kernel.is_comb(t) && (@kernel.is_comb(@kernel.rator(t)) && (@kernel.rator(@kernel.rator(t)) == op)))
}

///|
/// `has_div`
pub fn has_div(x1214 : @kernel.Term) -> Bool raise {
  let t = x1214
  @lib.can((x1216 : @kernel.Term) => @basics.find_term(fn(x1215 : @kernel.Term) -> Bool raise {
    let s = x1215
    (is_binop_op(div_tm(), s) || (@kernel.is_comb(s) && (@kernel.rator(s) == inv_tm())))
  }, x1216), t)
}

///|
/// `PROVE_NZ`
pub fn prove_nz(x1217 : @list.List[@kernel.Thm], x1218 : @kernel.Term) -> @kernel.Thm raise {
  let nz_thms = x1217
  let d = x1218
  if is_binop_op(mul_tm(), d) {
    let (a, b) = @basics.dest_binop(mul_tm(), d)
    let t1219 = prove_nz(nz_thms, b)
    let t1220 = @bool.conj(prove_nz(nz_thms, a), t1219)
    @drule.match_mp(real_mul_nz())(t1220)
  } else {
    if is_binop_op(pow_tm(), d) {
      let (a_1, n) = @basics.dest_binop(pow_tm(), d)
      let t1221 = prove_nz(nz_thms, a_1)
      @drule.match_mp(@bool.specl(@list.List([a_1, n]), real_pow_nz()))(t1221)
    } else {
      try {
        @lib.find(fn(x1222 : @kernel.Thm) -> Bool raise {
          let th = x1222
          let t1223 = @bool.mk_neg(@basics.mk_eq(d, @term_syntax.parse_term("real_of_num(0)")))
          (@kernel.concl(th) == t1223)
        }, nz_thms)
      } catch {
        Failure(_) => {
          try {
            @bool.eqt_elim(@calc_rat.real_rat_reduce_conv(@bool.mk_neg(@basics.mk_eq(d, @term_syntax.parse_term("real_of_num(0)")))))
          } catch {
            _ => raise Failure(("PROVE_NZ: " + @printer.string_of_term(d)))
          }
        }
        e => raise e
      }
    }
  }
}

///|
/// `RATIONALIZE_CONV`
pub fn rationalize_conv(x1224 : @list.List[@kernel.Thm], x1225 : @kernel.Term) -> @kernel.Thm raise {
  let nz = x1224
  let t = x1225
  if !has_div(t) {
    @bool.spec(t, div1())
  } else {
    if is_binop_op(add_tm(), t) {
      let (a, b) = @basics.dest_binop(add_tm(), t)
      let tha = rationalize_conv(nz, a)
      let thb = rationalize_conv(nz, b)
      let (na, da) = dest_div(@equal.rhs(@kernel.concl(tha)))
      let (nb, db) = dest_div(@equal.rhs(@kernel.concl(thb)))
      let t1226 = prove_nz(nz, db)
      let t1227 = @bool.conj(prove_nz(nz, da), t1226)
      let t1228 = @bool.mp(@bool.specl(@list.List([na, da, nb, db]), rat_add()), t1227)
      @kernel.trans(@kernel.mk_comb_rule(@equal.ap_term(add_tm(), tha), thb), t1228)
    } else {
      if is_binop_op(sub_tm(), t) {
        let (a_1, b_1) = @basics.dest_binop(sub_tm(), t)
        let tha_1 = rationalize_conv(nz, a_1)
        let thb_1 = rationalize_conv(nz, b_1)
        let (na_1, da_1) = dest_div(@equal.rhs(@kernel.concl(tha_1)))
        let (nb_1, db_1) = dest_div(@equal.rhs(@kernel.concl(thb_1)))
        let t1229 = prove_nz(nz, db_1)
        let t1230 = @bool.conj(prove_nz(nz, da_1), t1229)
        let t1231 = @bool.mp(@bool.specl(@list.List([na_1, da_1, nb_1, db_1]), rat_sub()), t1230)
        @kernel.trans(@kernel.mk_comb_rule(@equal.ap_term(sub_tm(), tha_1), thb_1), t1231)
      } else {
        if is_binop_op(mul_tm(), t) {
          let (a_2, b_2) = @basics.dest_binop(mul_tm(), t)
          let tha_2 = rationalize_conv(nz, a_2)
          let thb_2 = rationalize_conv(nz, b_2)
          let (na_2, da_2) = dest_div(@equal.rhs(@kernel.concl(tha_2)))
          let (nb_2, db_2) = dest_div(@equal.rhs(@kernel.concl(thb_2)))
          let t1232 = prove_nz(nz, db_2)
          let t1233 = @bool.conj(prove_nz(nz, da_2), t1232)
          let t1234 = @bool.mp(@bool.specl(@list.List([na_2, da_2, nb_2, db_2]), rat_mul()), t1233)
          @kernel.trans(@kernel.mk_comb_rule(@equal.ap_term(mul_tm(), tha_2), thb_2), t1234)
        } else {
          if is_binop_op(div_tm(), t) {
            let (a_3, b_3) = dest_div(t)
            let tha_3 = rationalize_conv(nz, a_3)
            let thb_3 = rationalize_conv(nz, b_3)
            let (na_3, da_3) = dest_div(@equal.rhs(@kernel.concl(tha_3)))
            let (nb_3, db_3) = dest_div(@equal.rhs(@kernel.concl(thb_3)))
            let t1235 = prove_nz(nz, db_3)
            let t1236 = @bool.conj(prove_nz(nz, nb_3), t1235)
            let t1237 = @bool.conj(prove_nz(nz, da_3), t1236)
            let t1238 = @bool.mp(@bool.specl(@list.List([na_3, da_3, nb_3, db_3]), rat_div()), t1237)
            @kernel.trans(@kernel.mk_comb_rule(@equal.ap_term(div_tm(), tha_3), thb_3), t1238)
          } else {
            if is_binop_op(pow_tm(), t) {
              let (a_4, nn) = @basics.dest_binop(pow_tm(), t)
              let tha_4 = rationalize_conv(nz, a_4)
              let (na_4, da_4) = dest_div(@equal.rhs(@kernel.concl(tha_4)))
              let t1239 = @bool.specl(@list.List([na_4, da_4, nn]), @real.real_pow_div())
              @kernel.trans(@equal.ap_thm(@equal.ap_term(pow_tm(), tha_4), nn), t1239)
            } else {
              if (@kernel.is_comb(t) && (@kernel.rator(t) == inv_tm())) {
                let a_5 = @kernel.rand(t)
                let tha_5 = rationalize_conv(nz, a_5)
                let (na_5, da_5) = dest_div(@equal.rhs(@kernel.concl(tha_5)))
                let t1240 = prove_nz(nz, da_5)
                let t1241 = @bool.conj(prove_nz(nz, na_5), t1240)
                let t1242 = @bool.mp(@bool.specl(@list.List([na_5, da_5]), rat_inv()), t1241)
                @kernel.trans(@equal.ap_term(inv_tm(), tha_5), t1242)
              } else {
                if (@kernel.is_comb(t) && (@kernel.rator(t) == neg_tm())) {
                  let a_6 = @kernel.rand(t)
                  let tha_6 = rationalize_conv(nz, a_6)
                  let (na_6, da_6) = dest_div(@equal.rhs(@kernel.concl(tha_6)))
                  let t1243 = @bool.specl(@list.List([na_6, da_6]), rat_neg())
                  @kernel.trans(@equal.ap_term(neg_tm(), tha_6), t1243)
                } else {
                  @bool.spec(t, div1())
                }
              }
            }
          }
        }
      }
    }
  }
}

///|
/// `prove_rat_eq`
pub fn prove_rat_eq(x1244 : @list.List[@kernel.Thm], x1245 : @kernel.Term) -> @kernel.Thm raise {
  let nz = x1244
  let tm = x1245
  let (l, r) = @kernel.dest_eq(tm)
  let thl = rationalize_conv(nz, l)
  let thr = rationalize_conv(nz, r)
  let (nl, dl) = dest_div(@equal.rhs(@kernel.concl(thl)))
  let (nr, dr) = dest_div(@equal.rhs(@kernel.concl(thr)))
  let t1246 = prove_nz(nz, dr)
  let t1247 = @bool.conj(prove_nz(nz, dl), t1246)
  let cross = @bool.mp(@bool.specl(@list.List([nl, dl, nr, dr]), rat_eq_cross()), t1247)
  let polygoal = @equal.rhs(@kernel.concl(cross))
  let (pl, pr) = @kernel.dest_eq(polygoal)
  let t1248 = @equal.sym(@calc_rat.real_poly_conv(pr))
  let polyth = @kernel.trans(@calc_rat.real_poly_conv(pl), t1248)
  let step1 = @kernel.mk_comb_rule(@equal.ap_term(@term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)"), thl), thr)
  @kernel.eq_mp(@equal.sym(@kernel.trans(step1, cross)), polyth)
}

///|
/// `prove_factor_nz_imp`
pub fn prove_factor_nz_imp(x1249 : @kernel.Term) -> @kernel.Thm raise {
  let f = x1249
  let t1253 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t1251 = @equal.gsym(@realax.real_of_num_le())
  let t1252 = @equal.gsym(@real.real_of_num_lt())
  let t1254 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1252, t1251])), @tactics.strip_tac), t1253), @calc_rat.asm_real_arith_tac)
  let t1250 = @bool.mk_neg(@basics.mk_eq(f, @term_syntax.parse_term("real_of_num(0)")))
  @tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (k : Num) && k + 1 < (n : Num)"), t1250), t1254)
}

///|
/// `denom_factors`
pub fn denom_factors(x1255 : @kernel.Term, x1256 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let t = x1255
  let acc = x1256
  if is_binop_op(div_tm(), t) {
    let (a, b) = dest_div(t)
    denom_factors(a, factor_collect(b, denom_factors(b, acc)))
  } else {
    match t {
      @kernel.Term::Comb(f, x) => denom_factors(f, denom_factors(x, acc))
      @kernel.Term::Abs(_, b_1) => denom_factors(b_1, acc)
      _ => acc
    }
  }
}

///|
/// `factor_collect`
pub fn factor_collect(x1257 : @kernel.Term, x1258 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let d = x1257
  let acc_1 = x1258
  if is_binop_op(mul_tm(), d) {
    let (a_1, b_2) = @basics.dest_binop(mul_tm(), d)
    factor_collect(a_1, factor_collect(b_2, acc_1))
  } else {
    if is_binop_op(pow_tm(), d) {
      let (a_2, _) = @basics.dest_binop(pow_tm(), d)
      factor_collect(a_2, acc_1)
    } else {
      if @lib.mem(d, acc_1) {
        acc_1
      } else {
        acc_1.prepend(d)
      }
    }
  }
}

///|
/// hyp_thm
fn step_108() -> Unit raise {
  hyp_thm_c.set(@kernel.assume_rule(@term_syntax.parse_term("1 <= (k : Num) && k + 1 < (n : Num)")))
}

///|
let hyp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyp_thm")

///|
/// `hyp_thm`
pub fn hyp_thm() -> @kernel.Thm {
  hyp_thm_c.get()
}

///|
/// `nz_for`
pub fn nz_for(x1259 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
  let t = x1259
  @lib.map(fn(x1260 : @kernel.Term) -> @kernel.Thm raise {
    let f = x1260
    @bool.mp(prove_factor_nz_imp(f), hyp_thm())
  }, denom_factors(t, @list.List([])))
}

///|
/// V_SN2_CL_G
fn step_109() -> Unit raise {
  let t1261 = @bool.gen(@term_syntax.parse_term("(k : Num)"), v_sn2_cl())
  v_sn2_cl_g_c.set(@bool.gen(@term_syntax.parse_term("(n : Num)"), t1261))
}

///|
let v_sn2_cl_g_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SN2_CL_G")

///|
/// `V_SN2_CL_G`
pub fn v_sn2_cl_g() -> @kernel.Thm {
  v_sn2_cl_g_c.get()
}

///|
/// V_SNSK_CL_G
fn step_110() -> Unit raise {
  let t1262 = @bool.gen(@term_syntax.parse_term("(k : Num)"), v_snsk_cl())
  v_snsk_cl_g_c.set(@bool.gen(@term_syntax.parse_term("(n : Num)"), t1262))
}

///|
let v_snsk_cl_g_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SNSK_CL_G")

///|
/// `V_SNSK_CL_G`
pub fn v_snsk_cl_g() -> @kernel.Thm {
  v_snsk_cl_g_c.get()
}

///|
/// V_SK2_CL_G
fn step_111() -> Unit raise {
  let t1263 = @bool.gen(@term_syntax.parse_term("(k : Num)"), v_sk2_cl())
  v_sk2_cl_g_c.set(@bool.gen(@term_syntax.parse_term("(n : Num)"), t1263))
}

///|
let v_sk2_cl_g_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_SK2_CL_G")

///|
/// `V_SK2_CL_G`
pub fn v_sk2_cl_g() -> @kernel.Thm {
  v_sk2_cl_g_c.get()
}

///|
/// idx_norm
fn step_112() -> Unit raise {
  let t1264 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 1 == n + 3"))
  let t1265 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 2 == n + 4"))
  let t1266 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))
  idx_norm_c.set(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 2 == n + 3")), t1266, t1265, t1264]))
}

///|
let idx_norm_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("idx_norm")

///|
/// `idx_norm`
pub fn idx_norm() -> @list.List[@kernel.Thm] {
  idx_norm_c.get()
}

///|
/// apery_hyp
fn step_113() -> Unit raise {
  apery_hyp_c.set(@term_syntax.parse_term("1 <= (k : Num) && k + 1 < (n : Num)"))
}

///|
let apery_hyp_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("apery_hyp")

///|
/// `apery_hyp`
pub fn apery_hyp() -> @kernel.Term {
  apery_hyp_c.get()
}

///|
/// `apery_lift_recurrence`
pub fn apery_lift_recurrence(x1267 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x1267
  let (_, eq) = @basics.dest_imp(@kernel.concl(th))
  let t1268 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(th)), @int.asm_arith_tac)
  @tactics.prove(@bool.mk_imp(apery_hyp(), eq), t1268)
}

///|
/// apery_recurrences
fn step_114() -> Unit raise {
  let t1277 = @term_syntax.parse_term("(k : Num)")
  let t1278 = apery_lift_recurrence(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1277]), v_sk2()))
  let t1276 = @term_syntax.parse_term("(k : Num)")
  let t1279 = apery_lift_recurrence(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1276]), v_snsk()))
  let t1275 = @term_syntax.parse_term("(k : Num)")
  let t1280 = apery_lift_recurrence(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1275]), v_sn2()))
  let t1273 = @term_syntax.parse_term("(k : Num)")
  let t1274 = @bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1273]), v_sn2())
  let t1281 = apery_lift_recurrence(@simp.rewrite_rule(idx_norm())(t1274))
  let t1271 = @term_syntax.parse_term("(k : Num)")
  let t1272 = @bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1271]), v_snsk())
  let t1282 = apery_lift_recurrence(@simp.rewrite_rule(idx_norm())(t1272))
  let t1269 = @term_syntax.parse_term("(k : Num)")
  let t1270 = @bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 2"), t1269]), v_sn2())
  apery_recurrences_c.set(@lib.map(@bool.undisch, @list.List([apery_lift_recurrence(@simp.rewrite_rule(idx_norm())(t1270)), t1282, t1281, t1280, t1279, t1278])))
}

///|
let apery_recurrences_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("apery_recurrences")

///|
/// `apery_recurrences`
pub fn apery_recurrences() -> @list.List[@kernel.Thm] {
  apery_recurrences_c.get()
}

///|
/// apery_target
fn step_115() -> Unit raise {
  apery_target_c.set(@term_syntax.parse_term("pflat2(vv, (n : Num), (k : Num)) - (qflat(vv, n, k + 1) - qflat(vv, n, k))"))
}

///|
let apery_target_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("apery_target")

///|
/// `apery_target`
pub fn apery_target() -> @kernel.Term {
  apery_target_c.get()
}

///|
/// apery_reduced
fn step_116() -> Unit raise {
  let t1283 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 3 + 1 == n + 4"))
  let t1284 = @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 1 == n + 3"))
  let expanded = @simp.rewrite_conv(@list.List([pflat2(), pflat(), qflat(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2")), t1284, t1283]))(apery_target())
  let t1285 = @equal.rhs(@kernel.concl(expanded))
  apery_reduced_c.set(@kernel.trans(expanded, @simp.rewrite_conv(apery_recurrences())(t1285)))
}

///|
let apery_reduced_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_reduced")

///|
/// `apery_reduced`
pub fn apery_reduced() -> @kernel.Thm {
  apery_reduced_c.get()
}

///|
/// apery_atoms
fn step_117() -> Unit raise {
  let t1286 = @term_syntax.parse_term("vv((n : Num), (k : Num) + 1)")
  let t1287 = @term_syntax.parse_term("vv((n : Num) + 1, (k : Num))")
  apery_atoms_c.set(@list.List([@term_syntax.parse_term("vv((n : Num), (k : Num))"), t1287, t1286]))
}

///|
let apery_atoms_c : @lib.Cell[@list.List[@kernel.Term]] = @lib.Cell::new("apery_atoms")

///|
/// `apery_atoms`
pub fn apery_atoms() -> @list.List[@kernel.Term] {
  apery_atoms_c.get()
}

///|
/// apery_zero
fn step_118() -> Unit raise {
  apery_zero_c.set(@term_syntax.parse_term("real_of_num(0)"))
}

///|
let apery_zero_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("apery_zero")

///|
/// `apery_zero`
pub fn apery_zero() -> @kernel.Term {
  apery_zero_c.get()
}

///|
/// apery_one
fn step_119() -> Unit raise {
  apery_one_c.set(@term_syntax.parse_term("real_of_num(1)"))
}

///|
let apery_one_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("apery_one")

///|
/// `apery_one`
pub fn apery_one() -> @kernel.Term {
  apery_one_c.get()
}

///|
/// `apery_has_atom`
pub fn apery_has_atom(x1288 : @kernel.Term) -> Bool raise {
  let tm = x1288
  @lib.can((x1290 : @kernel.Term) => @basics.find_term(fn(x1289 : @kernel.Term) -> Bool raise {
    let t = x1289
    @lib.mem(t, apery_atoms())
  }, x1290), tm)
}

///|
/// `apery_add`
pub fn apery_add(x1291 : @kernel.Term, x1292 : @kernel.Term) -> @kernel.Term raise {
  let x = x1291
  let y = x1292
  if (x == apery_zero()) {
    y
  } else {
    if (y == apery_zero()) {
      x
    } else {
      @basics.mk_binop(add_tm(), x, y)
    }
  }
}

///|
/// `apery_sub`
pub fn apery_sub(x1293 : @kernel.Term, x1294 : @kernel.Term) -> @kernel.Term raise {
  let x_1 = x1293
  let y_1 = x1294
  if (y_1 == apery_zero()) {
    x_1
  } else {
    if (x_1 == apery_zero()) {
      @kernel.mk_comb(neg_tm(), y_1)
    } else {
      @basics.mk_binop(sub_tm(), x_1, y_1)
    }
  }
}

///|
/// `apery_neg`
pub fn apery_neg(x1295 : @kernel.Term) -> @kernel.Term raise {
  let x_2 = x1295
  if (x_2 == apery_zero()) {
    apery_zero()
  } else {
    @kernel.mk_comb(neg_tm(), x_2)
  }
}

///|
/// `apery_mul`
pub fn apery_mul(x1296 : @kernel.Term, x1297 : @kernel.Term) -> @kernel.Term raise {
  let x_3 = x1296
  let y_2 = x1297
  if ((x_3 == apery_zero()) || (y_2 == apery_zero())) {
    apery_zero()
  } else {
    if (x_3 == apery_one()) {
      y_2
    } else {
      if (y_2 == apery_one()) {
        x_3
      } else {
        @basics.mk_binop(mul_tm(), x_3, y_2)
      }
    }
  }
}

///|
/// `apery_vec_add`
pub fn apery_vec_add(x1298 : @list.List[@kernel.Term], x1299 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let xs = x1298
  let ys = x1299
  @lib.map2(apery_add, xs, ys)
}

///|
/// `apery_vec_sub`
pub fn apery_vec_sub(x1300 : @list.List[@kernel.Term], x1301 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let xs_1 = x1300
  let ys_1 = x1301
  @lib.map2(apery_sub, xs_1, ys_1)
}

///|
/// `apery_vec_neg`
pub fn apery_vec_neg(x1302 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let xs_2 = x1302
  @lib.map(apery_neg, xs_2)
}

///|
/// `apery_vec_scale`
pub fn apery_vec_scale(x1303 : @kernel.Term, x1304 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let c = x1303
  let xs_3 = x1304
  @lib.map((x1305 : @kernel.Term) => apery_mul(c, x1305), xs_3)
}

///|
/// `apery_linearize`
pub fn apery_linearize(x1306 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x1306
  if @lib.mem(tm, apery_atoms()) {
    @lib.map(fn(x1307 : @kernel.Term) -> @kernel.Term raise {
      let a = x1307
      if (tm == a) {
        apery_one()
      } else {
        apery_zero()
      }
    }, apery_atoms()).prepend(apery_zero())
  } else {
    if !apery_has_atom(tm) {
      @list.List([tm, apery_zero(), apery_zero(), apery_zero()])
    } else {
      if is_binop_op(add_tm(), tm) {
        let (l, r) = @basics.dest_binop(add_tm(), tm)
        let t1308 = apery_linearize(r)
        apery_vec_add(apery_linearize(l), t1308)
      } else {
        if is_binop_op(sub_tm(), tm) {
          let (l_1, r_1) = @basics.dest_binop(sub_tm(), tm)
          let t1309 = apery_linearize(r_1)
          apery_vec_sub(apery_linearize(l_1), t1309)
        } else {
          if (@kernel.is_comb(tm) && (@kernel.rator(tm) == neg_tm())) {
            apery_vec_neg(apery_linearize(@kernel.rand(tm)))
          } else {
            if is_binop_op(mul_tm(), tm) {
              let (l_2, r_2) = @basics.dest_binop(mul_tm(), tm)
              if !apery_has_atom(l_2) {
                apery_vec_scale(l_2, apery_linearize(r_2))
              } else {
                if !apery_has_atom(r_2) {
                  apery_vec_scale(r_2, apery_linearize(l_2))
                } else {
                  raise Failure("apery_linearize: nonlinear product")
                }
              }
            } else {
              raise Failure("apery_linearize: unsupported term")
            }
          }
        }
      }
    }
  }
}

///|
/// apery_coeffs
fn step_120() -> Unit raise {
  apery_coeffs_c.set(apery_linearize(@equal.rhs(@kernel.concl(apery_reduced()))))
}

///|
let apery_coeffs_c : @lib.Cell[@list.List[@kernel.Term]] = @lib.Cell::new("apery_coeffs")

///|
/// `apery_coeffs`
pub fn apery_coeffs() -> @list.List[@kernel.Term] {
  apery_coeffs_c.get()
}

///|
/// `apery_unfold_coeff`
pub fn apery_unfold_coeff(x1310 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1310
  @simp.rewrite_conv(@list.List([qc00(), qc10(), qc01(), @equal.gsym(@realax.real_of_num_add())]))(tm)
}

///|
/// `apery_normalize_denoms`
pub fn apery_normalize_denoms(x1311 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1311
  @simp.rewrite_conv(@lib.map(@calc_rat.real_poly_conv, denom_factors(tm, @list.List([]))))(tm)
}

///|
/// `apery_normalize_coeff`
pub fn apery_normalize_coeff(x1312 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1312
  let unfolded = apery_unfold_coeff(tm)
  @kernel.trans(unfolded, apery_normalize_denoms(@equal.rhs(@kernel.concl(unfolded))))
}

///|
/// apery_normalized_coeffs
fn step_121() -> Unit raise {
  apery_normalized_coeffs_c.set(@lib.map(fn(x1313 : @kernel.Term) -> @kernel.Term raise {
    let tm = x1313
    @equal.rhs(@kernel.concl(apery_normalize_coeff(tm)))
  }, apery_coeffs()))
}

///|
let apery_normalized_coeffs_c : @lib.Cell[@list.List[@kernel.Term]] = @lib.Cell::new("apery_normalized_coeffs")

///|
/// `apery_normalized_coeffs`
pub fn apery_normalized_coeffs() -> @list.List[@kernel.Term] {
  apery_normalized_coeffs_c.get()
}

///|
/// `apery_rational_summands`
pub fn apery_rational_summands(x1314 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x1314
  if !has_div(tm) {
    @list.List([tm])
  } else {
    if is_binop_op(add_tm(), tm) {
      let (l, r) = @basics.dest_binop(add_tm(), tm)
      let t1315 = apery_rational_summands(r)
      apery_rational_summands(l).concat(t1315)
    } else {
      if is_binop_op(sub_tm(), tm) {
        let (l_1, r_1) = @basics.dest_binop(sub_tm(), tm)
        let t1316 = @lib.map(apery_neg, apery_rational_summands(r_1))
        apery_rational_summands(l_1).concat(t1316)
      } else {
        if (@kernel.is_comb(tm) && (@kernel.rator(tm) == neg_tm())) {
          @lib.map(apery_neg, apery_rational_summands(@kernel.rand(tm)))
        } else {
          if is_binop_op(mul_tm(), tm) {
            let (l_2, r_2) = @basics.dest_binop(mul_tm(), tm)
            @lib.flat(@lib.map(fn(x1317 : @kernel.Term) -> @list.List[@kernel.Term] raise {
              let x = x1317
              @lib.map((x1318 : @kernel.Term) => apery_mul(x, x1318), apery_rational_summands(r_2))
            }, apery_rational_summands(l_2)))
          } else {
            @list.List([tm])
          }
        }
      }
    }
  }
}

///|
/// `apery_sum`
pub fn apery_sum(x1319 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let terms = x1319
  @lib.end_itlist(fn(x1320 : @kernel.Term, x1321 : @kernel.Term) -> @kernel.Term raise {
    let x = x1320
    let y = x1321
    @basics.mk_binop(add_tm(), x, y)
  }, terms)
}

///|
/// `apery_rational_leaves`
pub fn apery_rational_leaves(x1322 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x1322
  if !has_div(tm) {
    @list.List([tm])
  } else {
    if (is_binop_op(add_tm(), tm) || (is_binop_op(sub_tm(), tm) || is_binop_op(mul_tm(), tm))) {
      let op = if is_binop_op(add_tm(), tm) {
        add_tm()
      } else {
        if is_binop_op(sub_tm(), tm) {
          sub_tm()
        } else {
          mul_tm()
        }
      }
      let (l, r) = @basics.dest_binop(op, tm)
      let t1323 = apery_rational_leaves(r)
      apery_rational_leaves(l).concat(t1323)
    } else {
      if (@kernel.is_comb(tm) && (@kernel.rator(tm) == neg_tm())) {
        apery_rational_leaves(@kernel.rand(tm))
      } else {
        @list.List([tm])
      }
    }
  }
}

///|
/// `apery_abstract_identity`
pub fn apery_abstract_identity(x1324 : @list.List[@kernel.Term], x1325 : @kernel.Term) -> @kernel.Thm raise {
  let leaves = x1324
  let eq = x1325
  let leaves_1 = @lib.filter(fn(x1326 : @kernel.Term) -> Bool raise {
    let t = x1326
    ((t != apery_zero()) && (t != apery_one()))
  }, @lib.setify(leaves))
  let vars = @lib.map(fn(x1327 : @kernel.Term) -> @kernel.Term raise {
    let t_1 = x1327
    @basics.genvar(@kernel.type_of(t_1))
  }, leaves_1)
  let abstract_ = @lib.map2(fn(x1328 : @kernel.Term, x1329 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    let t_2 = x1328
    let v = x1329
    (v, t_2)
  }, leaves_1, vars)
  let concrete = @lib.map2(fn(x1330 : @kernel.Term, x1331 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    let t_3 = x1330
    let v_1 = x1331
    (t_3, v_1)
  }, leaves_1, vars)
  let t1332 = @tactics.conv_tac(@calc_rat.real_ring)
  @kernel.inst_rule(concrete, @tactics.prove(@basics.subst(abstract_, eq), t1332))
}

///|
/// `apery_make_raw`
pub fn apery_make_raw(x1333 : @list.List[@kernel.Term]) -> @list.List[(@kernel.Thm, @kernel.Term, @kernel.Term)] raise {
  let terms = x1333
  @lib.map(fn(x1334 : @kernel.Term) -> (@kernel.Thm, @kernel.Term, @kernel.Term) raise {
    let tm = x1334
    let th = rationalize_conv(nz_for(tm), tm)
    let (num, den) = dest_div(@equal.rhs(@kernel.concl(th)))
    (th, num, den)
  }, terms)
}

///|
/// APERY_RAT_CANCEL
fn step_122() -> Unit raise {
  let t1335 = @tactics.conv_tac(@calc_rat.real_field)
  apery_rat_cancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : Real, ∀ n : Real, ∀ d : Real, !(g == real_of_num(0)) → g * n / (g * d) == n / d"), t1335))
}

///|
let apery_rat_cancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APERY_RAT_CANCEL")

///|
/// `APERY_RAT_CANCEL`
pub fn apery_rat_cancel() -> @kernel.Thm {
  apery_rat_cancel_c.get()
}

///|
/// APERY_RAT_SCALE
fn step_123() -> Unit raise {
  let t1336 = @tactics.conv_tac(@calc_rat.real_field)
  apery_rat_scale_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Real, ∀ D : Real, ∀ q : Real, ∀ n : Real, !(d == real_of_num(0)) && D == q * d → D * (n / d) == q * n"), t1336))
}

///|
let apery_rat_scale_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APERY_RAT_SCALE")

///|
/// `APERY_RAT_SCALE`
pub fn apery_rat_scale() -> @kernel.Thm {
  apery_rat_scale_c.get()
}

///|
/// `apery_prove_poly_eq`
pub fn apery_prove_poly_eq(x1337 : @kernel.Term, x1338 : @kernel.Term) -> @kernel.Thm raise {
  let l = x1337
  let r = x1338
  let t1339 = @equal.sym(@calc_rat.real_poly_conv(r))
  @kernel.trans(@calc_rat.real_poly_conv(l), t1339)
}

///|
/// `apery_prove_nz_product`
pub fn apery_prove_nz_product(x1340 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1340
  let nz = @lib.map(fn(x1341 : @kernel.Term) -> @kernel.Thm raise {
    let f = x1341
    @bool.mp(prove_factor_nz_imp(f), hyp_thm())
  }, factor_collect(tm, @list.List([])))
  prove_nz(nz, tm)
}

///|
/// `apery_sum_theorems`
pub fn apery_sum_theorems(x1342 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let thms = x1342
  match thms {
    More(th, tail=Empty) => th
    More(th_1, tail=rest) => {
      let t1343 = apery_sum_theorems(rest)
      @kernel.mk_comb_rule(@equal.ap_term(add_tm(), th_1), t1343)
    }
    Empty => raise Failure("apery_sum_theorems")
  }
}

///|
/// `apery_reduce_fractions`
pub fn[TA] apery_reduce_fractions(x1344 : @list.List[(@kernel.Thm, @kernel.Term, @kernel.Term)], x1345 : @list.List[(@kernel.Term, @kernel.Term, TA, @kernel.Term)]) -> @list.List[@kernel.Thm] raise {
  let raws = x1344
  let reduced = x1345
  @lib.map2(fn(x1346 : (@kernel.Thm, @kernel.Term, @kernel.Term), x1347 : (@kernel.Term, @kernel.Term, TA, @kernel.Term)) -> @kernel.Thm raise {
    let (rawth, raw_num, raw_den) = x1346
    let (num, den, _, common) = x1347
    let num_th = apery_prove_poly_eq(raw_num, @basics.mk_binop(mul_tm(), common, num))
    let den_th = apery_prove_poly_eq(raw_den, @basics.mk_binop(mul_tm(), common, den))
    let fraction_th = @kernel.mk_comb_rule(@equal.ap_term(div_tm(), num_th), den_th)
    let t1348 = apery_prove_nz_product(common)
    let cancel_th = @drule.match_mp(@bool.specl(@list.List([common, num, den]), apery_rat_cancel()))(t1348)
    @kernel.trans(rawth, @kernel.trans(fraction_th, cancel_th))
  }, raws, reduced)
}

///|
/// apery_bigd
fn step_124() -> Unit raise {
  apery_bigd_c.set(@term_syntax.parse_term("pow(real_of_num((k : Num)) - real_of_num((n : Num)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * (pow(real_of_num(n) + real_of_num(3), 3) * (pow(real_of_num(k) - real_of_num(n) - real_of_num(4), 2) * (pow(real_of_num(k) - real_of_num(n) - real_of_num(3), 2) * (pow(real_of_num(k) - real_of_num(n) - real_of_num(2), 2) * (pow(real_of_num(k) - real_of_num(n) - real_of_num(1), 2) * (real_of_num(k) - real_of_num(n) + real_of_num(1))))))))"))
}

///|
let apery_bigd_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("apery_bigd")

///|
/// `apery_bigd`
pub fn apery_bigd() -> @kernel.Term {
  apery_bigd_c.get()
}

///|
/// apery_bigd_poly
fn step_125() -> Unit raise {
  apery_bigd_poly_c.set(@calc_rat.real_poly_conv(apery_bigd()))
}

///|
let apery_bigd_poly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_bigd_poly")

///|
/// `apery_bigd_poly`
pub fn apery_bigd_poly() -> @kernel.Thm {
  apery_bigd_poly_c.get()
}

///|
/// apery_bigd_nz
fn step_126() -> Unit raise {
  apery_bigd_nz_c.set(apery_prove_nz_product(apery_bigd()))
}

///|
let apery_bigd_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_bigd_nz")

///|
/// `apery_bigd_nz`
pub fn apery_bigd_nz() -> @kernel.Thm {
  apery_bigd_nz_c.get()
}

///|
/// `apery_scale_fractions`
pub fn[TA] apery_scale_fractions(x1349 : @list.List[(@kernel.Term, @kernel.Term, @kernel.Term, TA)]) -> @list.List[@kernel.Thm] raise {
  let reduced = x1349
  @lib.map(fn(x1350 : (@kernel.Term, @kernel.Term, @kernel.Term, TA)) -> @kernel.Thm raise {
    let (num, den, cofactor, _) = x1350
    let decomp = @kernel.trans(apery_bigd_poly(), @equal.sym(@calc_rat.real_poly_conv(@basics.mk_binop(mul_tm(), cofactor, den))))
    let t1351 = @bool.conj(apery_prove_nz_product(den), decomp)
    @drule.match_mp(@bool.specl(@list.List([den, apery_bigd(), cofactor, num]), apery_rat_scale()))(t1351)
  }, reduced)
}

///|
/// `apery_scale_sum`
pub fn apery_scale_sum(x1352 : @list.List[@kernel.Term], x1353 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let fractions = x1352
  let scale_thms = x1353
  match (fractions, scale_thms) {
    (More(fraction, tail=Empty), More(scale_th, tail=Empty)) => scale_th
    (More(fraction_1, tail=rest), More(scale_th_1, tail=scale_rest)) => {
      let distribute = @bool.specl(@list.List([apery_bigd(), fraction_1, apery_sum(rest)]), @realax.real_add_ldistrib())
      let t1354 = apery_scale_sum(rest, scale_rest)
      @kernel.trans(distribute, @kernel.mk_comb_rule(@equal.ap_term(add_tm(), scale_th_1), t1354))
    }
    _ => raise Failure("apery_scale_sum")
  }
}

///|
/// `apery_prove_coefficient`
pub fn apery_prove_coefficient(x1355 : @kernel.Term, x1356 : @list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)]) -> @kernel.Thm raise {
  let coeff = x1355
  let reduced = x1356
  let summands = apery_rational_summands(coeff)
  let t1357 = @basics.mk_eq(coeff, apery_sum(summands))
  let collected = apery_abstract_identity(apery_rational_leaves(coeff), t1357)
  let reductions = apery_reduce_fractions(apery_make_raw(summands), reduced)
  let reduced_th = @kernel.trans(collected, apery_sum_theorems(reductions))
  let t1359 = apery_scale_fractions(reduced)
  let scaled = apery_scale_sum(@lib.map(fn(x1358 : (@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    let (num, den, _, _) = x1358
    @basics.mk_binop(div_tm(), num, den)
  }, reduced), t1359)
  let scaled_zero = @kernel.trans(scaled, @calc_rat.real_poly_conv(@equal.rhs(@kernel.concl(scaled))))
  let coeff_scaled = @equal.ap_term(@kernel.mk_comb(mul_tm(), apery_bigd()), reduced_th)
  let t1360 = @equal.sym(@bool.spec(apery_bigd(), @calc_int.real_mul_rzero()))
  let cancel_eq = @kernel.trans(@kernel.trans(coeff_scaled, scaled_zero), t1360)
  let t1361 = @bool.conj(apery_bigd_nz(), cancel_eq)
  @drule.match_mp(@bool.specl(@list.List([apery_bigd(), coeff, apery_zero()]), cancel_lem()))(t1361)
}

///|
/// tri_k0_reduced
fn step_127() -> Unit raise {
  let t1395 = @term_syntax.parse_term("real_of_num(1)")
  let t1396 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2)")
  let t1397 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1398 = (@term_syntax.parse_term("real_of_num(4) * (real_of_num((k : Num)) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (-real_of_num(768) * (pow(real_of_num(n), 20) * real_of_num(k)) + (real_of_num(3072) * (pow(real_of_num(n), 19) * pow(real_of_num(k), 2)) + (-real_of_num(3648) * (pow(real_of_num(n), 18) * pow(real_of_num(k), 3)) + (-real_of_num(3456) * (pow(real_of_num(n), 17) * pow(real_of_num(k), 4)) + (real_of_num(13044) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 5)) + (-real_of_num(7440) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 6)) + (-real_of_num(9660) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 7)) + (real_of_num(14016) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 8)) + (-real_of_num(900) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 9)) + (-real_of_num(5808) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 10)) + (real_of_num(2124) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 11)) + (-real_of_num(768) * pow(real_of_num(n), 20) + (-real_of_num(32256) * (pow(real_of_num(n), 19) * real_of_num(k)) + (real_of_num(128928) * (pow(real_of_num(n), 18) * pow(real_of_num(k), 2)) + (-real_of_num(144048) * (pow(real_of_num(n), 17) * pow(real_of_num(k), 3)) + (-real_of_num(147696) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 4)) + (real_of_num(482568) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 5)) + (-real_of_num(234732) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 6)) + (-real_of_num(342996) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 7)) + (real_of_num(439032) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 8)) + (-real_of_num(7968) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 9)) + (-real_of_num(168060) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 10)) + (real_of_num(53916) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 11)) + (-real_of_num(35328) * pow(real_of_num(n), 19) + (-real_of_num(631552) * (pow(real_of_num(n), 18) * real_of_num(k)) + (real_of_num(2543776) * (pow(real_of_num(n), 17) * pow(real_of_num(k), 2)) + (-real_of_num(2673124) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 3)) + (-real_of_num(2912340) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 4)) + (real_of_num(8280997) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 5)) + (-real_of_num(3398600) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 6)) + (-real_of_num(5568967) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 7)) + (real_of_num(6305692) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 8)) + (real_of_num(154863) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 9)) + (-real_of_num(2193376) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 10)) + (real_of_num(610071) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 11)) + (-real_of_num(763360) * pow(real_of_num(n), 18) + (-real_of_num(7645312) * (pow(real_of_num(n), 17) * real_of_num(k)) + (real_of_num(31367368) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 2)) + (-real_of_num(31003896) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 3)) + (-real_of_num(35252851) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 4)) + (real_of_num(87494875) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 5)) + (-real_of_num(29964918) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 6)) + (-real_of_num(54855522) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 7)) + (real_of_num(55016357) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 8)) + (real_of_num(3467507) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 9)) + (-real_of_num(17034532) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 10)) + (real_of_num(4050412) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 11)) + (-real_of_num(10296800) * pow(real_of_num(n), 17) + (-real_of_num(63952392) * (pow(real_of_num(n), 16) * real_of_num(k)) + (real_of_num(271060288) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 2)) + (-real_of_num(252131679) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 3)) + (-real_of_num(293786083) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 4)) + (real_of_num(637095193) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 5)) + (-real_of_num(180195424) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 6)) + (-real_of_num(366581765) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 7)) + (real_of_num(325582047) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 8)) + (real_of_num(31316929) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 9)) + (-real_of_num(87428804) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 10)) + (real_of_num(17466166) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 11)) + (-real_of_num(97183888) * pow(real_of_num(n), 16) + (-real_of_num(390926048) * (pow(real_of_num(n), 15) * real_of_num(k)) + (real_of_num(1744402215) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(1528641105) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (-real_of_num(1790786379) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (real_of_num(3390299217) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 5)) + (-real_of_num(785707110) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 6)) + (-real_of_num(1759973356) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 7)) + (real_of_num(1381460896) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 8)) + (real_of_num(169665992) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 9)) + (-real_of_num(311211346) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 10)) + (real_of_num(51093252) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 11)) + (-real_of_num(681771968) * pow(real_of_num(n), 15) + (-real_of_num(1797543582) * (pow(real_of_num(n), 14) * real_of_num(k)) + (real_of_num(8671244945) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(7171164950) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (-real_of_num(8275822234) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (real_of_num(13641244822) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 5)) + (-real_of_num(2584329138) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 6)) + (-real_of_num(6267925410) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 7)) + (real_of_num(4329005311) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 8)) + (real_of_num(612974365) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 9)) + (-real_of_num(783589496) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 10)) + (real_of_num(102640379) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 11)) + (-real_of_num(3685794720) * pow(real_of_num(n), 14) + (-real_of_num(6281404994) * (pow(real_of_num(n), 13) * real_of_num(k)) + (real_of_num(34074345499) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(26657515127) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (-real_of_num(29644875275) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (real_of_num(42343375448) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 5)) + (-real_of_num(6608736882) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 6)) + (-real_of_num(16846739030) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 7)) + (real_of_num(10157899122) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 8)) + (real_of_num(1536374559) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 9)) + (-real_of_num(1394901560) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 10)) + (real_of_num(139771620) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 11)) + (-real_of_num(15710071840) * pow(real_of_num(n), 13) + (-real_of_num(16511136494) * (pow(real_of_num(n), 12) * real_of_num(k)) + (real_of_num(107414839637) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(79729894768) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (-real_of_num(83411422057) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (real_of_num(102510705804) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 5)) + (-real_of_num(13486898969) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 6)) + (-real_of_num(34403563419) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 7)) + (real_of_num(17873852947) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 8)) + (real_of_num(2693929255) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 9)) + (-real_of_num(1719699936) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 10)) + (real_of_num(123447892) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 11)) + (-real_of_num(53560818048) * pow(real_of_num(n), 12) + (-real_of_num(31057152218) * (pow(real_of_num(n), 11) * real_of_num(k)) + (real_of_num(273992904577) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(193594433821) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (-real_of_num(185590186906) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (real_of_num(194292424443) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 5)) + (-real_of_num(22441935459) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 6)) + (-real_of_num(53241708152) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 7)) + (real_of_num(23326085212) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 8)) + (real_of_num(3251918342) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 9)) + (-real_of_num(1397856374) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 10)) + (real_of_num(63848152) * (real_of_num(n) * pow(real_of_num(k), 11)) + (-real_of_num(147311006048) * pow(real_of_num(n), 11) + (-real_of_num(34242238930) * (pow(real_of_num(n), 10) * real_of_num(k)) + (real_of_num(567647259943) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(383034928990) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (-real_of_num(326900137446) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (real_of_num(287538055025) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 5)) + (-real_of_num(30741445978) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 6)) + (-real_of_num(61627367257) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 7)) + (real_of_num(21970944881) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 8)) + (real_of_num(2579633352) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 9)) + (-real_of_num(674057028) * (real_of_num(n) * pow(real_of_num(k), 10)) + (real_of_num(14685520) * pow(real_of_num(k), 11) + (-real_of_num(328103820800) * pow(real_of_num(n), 10) + (real_of_num(9342208346) * (pow(real_of_num(n), 9) * real_of_num(k)) + (real_of_num(954502237105) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(616679187165) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (-real_of_num(453776761464) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (real_of_num(329102354583) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 5)) + (-real_of_num(34208713762) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 6)) + (-real_of_num(51889742508) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 7)) + (real_of_num(14155092397) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 8)) + (real_of_num(1211927256) * (real_of_num(n) * pow(real_of_num(k), 9)) + (-real_of_num(146056688) * pow(real_of_num(k), 10) + (-real_of_num(591626761600) * pow(real_of_num(n), 9) + (real_of_num(134837704206) * (pow(real_of_num(n), 8) * real_of_num(k)) + (real_of_num(1295827185263) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(802371636049) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (-real_of_num(490926362370) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (real_of_num(286016170951) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 5)) + (-real_of_num(29608827881) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 6)) + (-real_of_num(30134039386) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 7)) + (real_of_num(5592448786) * (real_of_num(n) * pow(real_of_num(k), 8)) + (real_of_num(255690672) * pow(real_of_num(k), 9) + (-real_of_num(859845193968) * pow(real_of_num(n), 8) + (real_of_num(329600901794) * (pow(real_of_num(n), 7) * real_of_num(k)) + (real_of_num(1405464163068) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(832398382758) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (-real_of_num(405743014925) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(182888462394) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) + (-real_of_num(18444006265) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) + (-real_of_num(10833443724) * (real_of_num(n) * pow(real_of_num(k), 7)) + (real_of_num(1023021688) * pow(real_of_num(k), 8) + (-real_of_num(998105211488) * pow(real_of_num(n), 7) + (real_of_num(506405609304) * (pow(real_of_num(n), 6) * real_of_num(k)) + (real_of_num(1197029877604) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(673265061944) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (-real_of_num(247666013854) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(81436213660) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) + (-real_of_num(7247159210) * (real_of_num(n) * pow(real_of_num(k), 6)) + (-real_of_num(1822888416) * pow(real_of_num(k), 7) + (-real_of_num(911577929600) * pow(real_of_num(n), 6) + (real_of_num(555594416928) * (pow(real_of_num(n), 5) * real_of_num(k)) + (real_of_num(779418105800) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(409497350480) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (-real_of_num(105299641272) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (real_of_num(22679880432) * (real_of_num(n) * pow(real_of_num(k), 5)) + (-real_of_num(1333959512) * pow(real_of_num(k), 6) + (-real_of_num(639897370880) * pow(real_of_num(n), 5) + (real_of_num(445980429568) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(372081953600) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(176289543184) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (-real_of_num(27857118128) * (real_of_num(n) * pow(real_of_num(k), 4)) + (real_of_num(2997847184) * pow(real_of_num(k), 5) + (-real_of_num(332796611328) * pow(real_of_num(n), 4) + (real_of_num(258088741728) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(121546930272) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(47918897056) * (real_of_num(n) * pow(real_of_num(k), 3)) + (-real_of_num(3452904576) * pow(real_of_num(k), 4) + (-real_of_num(120646983168) * pow(real_of_num(n), 3) + (real_of_num(102524693760) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(23906184192) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(6189000960) * pow(real_of_num(k), 3) + (-real_of_num(27184619520) * pow(real_of_num(n), 2) + (real_of_num(25107052032) * (real_of_num(n) * real_of_num(k)) + (real_of_num(2077567488) * pow(real_of_num(k), 2) + (-real_of_num(2863226880) * real_of_num(n) + real_of_num(2863226880) * real_of_num(k))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1397, t1396, t1395)
  let t1392 = @term_syntax.parse_term("-real_of_num(1) * ((real_of_num((k : Num)) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(real_of_num(k) + real_of_num(2), 5))))")
  let t1393 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2)))")
  let t1394 = @term_syntax.parse_term("-real_of_num(1) * (pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1399 = (@term_syntax.parse_term("real_of_num(4) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (real_of_num(768) * pow(real_of_num(n), 17) + (-real_of_num(3840) * (pow(real_of_num(n), 16) * real_of_num(k)) + (real_of_num(7488) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 2)) + (-real_of_num(6720) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 3)) + (-real_of_num(372) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 4)) + (real_of_num(8772) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 5)) + (-real_of_num(7932) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 6)) + (real_of_num(2124) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 7)) + (real_of_num(29952) * pow(real_of_num(n), 16) + (-real_of_num(142944) * (pow(real_of_num(n), 15) * real_of_num(k)) + (real_of_num(265824) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(237996) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(19416) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (real_of_num(237984) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 5)) + (-real_of_num(213480) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 6)) + (real_of_num(53916) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 7)) + (real_of_num(544576) * pow(real_of_num(n), 15) + (-real_of_num(2474240) * (pow(real_of_num(n), 14) * real_of_num(k)) + (real_of_num(4357716) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(3855872) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(744971) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (real_of_num(2902577) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 5)) + (-real_of_num(2587783) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 6)) + (real_of_num(610071) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 7)) + (real_of_num(6126208) * pow(real_of_num(n), 14) + (-real_of_num(26432748) * (pow(real_of_num(n), 13) * real_of_num(k)) + (real_of_num(43730080) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(37855724) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(10727224) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (real_of_num(20975832) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 5)) + (-real_of_num(18644660) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 6)) + (real_of_num(4050412) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 7)) + (real_of_num(47714808) * pow(real_of_num(n), 13) + (-real_of_num(195084820) * (pow(real_of_num(n), 12) * real_of_num(k)) + (real_of_num(300197561) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(251384889) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(89274374) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (real_of_num(99570856) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 5)) + (-real_of_num(88693322) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 6)) + (real_of_num(17466166) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 7)) + (real_of_num(272731768) * pow(real_of_num(n), 12) + (-real_of_num(1054933184) * (pow(real_of_num(n), 11) * real_of_num(k)) + (real_of_num(1492054660) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(1192971470) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(490183574) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (real_of_num(324823986) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 5)) + (-real_of_num(292439934) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 6)) + (real_of_num(51093252) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 7)) + (real_of_num(1182739932) * pow(real_of_num(n), 11) + (-real_of_num(4325363056) * (pow(real_of_num(n), 10) * real_of_num(k)) + (real_of_num(5541779499) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(4165047879) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(1884856489) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (real_of_num(738412721) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 5)) + (-real_of_num(681856867) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 6)) + (real_of_num(102640379) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 7)) + (real_of_num(3965796096) * pow(real_of_num(n), 10) + (-real_of_num(13725596018) * (pow(real_of_num(n), 9) * real_of_num(k)) + (real_of_num(15647797720) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(10841929592) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(5220078290) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (real_of_num(1155192868) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 5)) + (-real_of_num(1124111664) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 6)) + (real_of_num(139771620) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 7)) + (real_of_num(10374173274) * pow(real_of_num(n), 9) + (-real_of_num(34100830232) * (pow(real_of_num(n), 8) * real_of_num(k)) + (real_of_num(33831285527) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(21072888095) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(10506074900) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (real_of_num(1183282330) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 5)) + (-real_of_num(1284061348) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 6)) + (real_of_num(123447892) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 7)) + (real_of_num(21183410278) * pow(real_of_num(n), 8) + (-real_of_num(66643659794) * (pow(real_of_num(n), 7) * real_of_num(k)) + (real_of_num(55950436530) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(30281303510) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(15261668906) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(687247506) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) + (-real_of_num(967912958) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) + (real_of_num(63848152) * (real_of_num(n) * pow(real_of_num(k), 7)) + (real_of_num(33482591822) * pow(real_of_num(n), 7) + (-real_of_num(102292727676) * (pow(real_of_num(n), 6) * real_of_num(k)) + (real_of_num(70135361161) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(31421512301) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(15611717202) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(99558080) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) + (-real_of_num(433349940) * (real_of_num(n) * pow(real_of_num(k), 6)) + (real_of_num(14685520) * pow(real_of_num(k), 7) + (real_of_num(40136994726) * pow(real_of_num(n), 6) + (-real_of_num(122291049974) * (pow(real_of_num(n), 5) * real_of_num(k)) + (real_of_num(65393035612) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(22533272612) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(10677485846) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (-real_of_num(116671144) * (real_of_num(n) * pow(real_of_num(k), 5)) + (-real_of_num(87314608) * pow(real_of_num(k), 6) + (real_of_num(35003178914) * pow(real_of_num(n), 5) + (-real_of_num(111916403736) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(43888543364) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(10299559236) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(4384906476) * (real_of_num(n) * pow(real_of_num(k), 4)) + (-real_of_num(52174304) * pow(real_of_num(k), 5) + (real_of_num(20240167866) * pow(real_of_num(n), 4) + (-real_of_num(76003249522) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(20030425174) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(2539460808) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(817854256) * pow(real_of_num(k), 4) + (real_of_num(5677893806) * pow(real_of_num(n), 3) + (-real_of_num(36216335248) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(5572107668) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(211975120) * pow(real_of_num(k), 3) + (-real_of_num(1165461806) * pow(real_of_num(n), 2) + (-real_of_num(10842346408) * (real_of_num(n) * real_of_num(k)) + (real_of_num(716085136) * pow(real_of_num(k), 2) + (-real_of_num(1500128652) * real_of_num(n) + (-real_of_num(1538415264) * real_of_num(k) + -real_of_num(371277072)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1394, t1393, t1392)
  let t1389 = @term_syntax.parse_term("pow(real_of_num((k : Num)) + real_of_num(1), 4)")
  let t1390 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2))")
  let t1391 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1400 = (@term_syntax.parse_term("real_of_num(4) * ((-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (-real_of_num(1536) * pow(real_of_num(n), 16) + (real_of_num(3456) * (pow(real_of_num(n), 15) * real_of_num(k)) + (-real_of_num(768) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(1728) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(768) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (-real_of_num(60528) * pow(real_of_num(n), 15) + (real_of_num(126816) * (pow(real_of_num(n), 14) * real_of_num(k)) + (-real_of_num(25656) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(54000) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(21912) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (-real_of_num(1112864) * pow(real_of_num(n), 14) + (real_of_num(2161452) * (pow(real_of_num(n), 13) * real_of_num(k)) + (-real_of_num(395776) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(773892) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(284200) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (-real_of_num(12672692) * pow(real_of_num(n), 13) + (real_of_num(22700996) * (pow(real_of_num(n), 12) * real_of_num(k)) + (-real_of_num(3737416) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(6735780) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(2216476) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (-real_of_num(100045044) * pow(real_of_num(n), 12) + (real_of_num(164324762) * (pow(real_of_num(n), 11) * real_of_num(k)) + (-real_of_num(24141688) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(39735066) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(11581872) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (-real_of_num(580649758) * pow(real_of_num(n), 11) + (real_of_num(868552724) * (pow(real_of_num(n), 10) * real_of_num(k)) + (-real_of_num(112867728) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(167822636) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(42741626) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (-real_of_num(2563195904) * pow(real_of_num(n), 10) + (real_of_num(3463715127) * (pow(real_of_num(n), 9) * real_of_num(k)) + (-real_of_num(393976024) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(522321755) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(114305270) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (-real_of_num(8780059211) * pow(real_of_num(n), 9) + (real_of_num(10615070299) * (pow(real_of_num(n), 8) * real_of_num(k)) + (-real_of_num(1043409195) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(1213537345) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(223378412) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (-real_of_num(23590334465) * pow(real_of_num(n), 8) + (real_of_num(25213230305) * (pow(real_of_num(n), 7) * real_of_num(k)) + (-real_of_num(2107675815) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(2105927978) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(316850268) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (-real_of_num(49892099845) * pow(real_of_num(n), 7) + (real_of_num(46430650443) * (pow(real_of_num(n), 6) * real_of_num(k)) + (-real_of_num(3232783444) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(2697583966) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(318395514) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (-real_of_num(82804140405) * pow(real_of_num(n), 6) + (real_of_num(65773103407) * (pow(real_of_num(n), 5) * real_of_num(k)) + (-real_of_num(3707754246) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(2480670347) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(215308166) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (-real_of_num(106737592607) * pow(real_of_num(n), 5) + (real_of_num(70412501549) * (pow(real_of_num(n), 4) * real_of_num(k)) + (-real_of_num(3084695539) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(1551637801) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(88023212) * (real_of_num(n) * pow(real_of_num(k), 4)) + (-real_of_num(104788016439) * pow(real_of_num(n), 4) + (real_of_num(55161938617) * (pow(real_of_num(n), 3) * real_of_num(k)) + (-real_of_num(1760380187) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(591932146) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(16459280) * pow(real_of_num(k), 4) + (-real_of_num(75760374665) * pow(real_of_num(n), 3) + (real_of_num(29864471901) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(617004318) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(104044952) * pow(real_of_num(k), 3) + (-real_of_num(38050160887) * pow(real_of_num(n), 2) + (real_of_num(9993878458) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(100225864) * pow(real_of_num(k), 2) + (-real_of_num(11863305798) * real_of_num(n) + (real_of_num(1558612632) * real_of_num(k) + -real_of_num(1729998792)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1391, t1390, t1389)
  let t1386 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3) * pow(real_of_num((k : Num)) + real_of_num(1), 4)")
  let t1387 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1388 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2)))")
  let t1401 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + real_of_num(k)) * ((real_of_num(n) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))))"), t1388, t1387, t1386)
  let t1383 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * pow(real_of_num(k) + real_of_num(1), 4))")
  let t1384 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1385 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3))))")
  let t1402 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(5) * pow(real_of_num(n), 3) + (-real_of_num(1) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(2) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(6) * pow(real_of_num(k), 3) + (real_of_num(9) * pow(real_of_num(n), 2) + (-real_of_num(3) * (real_of_num(n) * real_of_num(k)) + (real_of_num(6) * pow(real_of_num(k), 2) + (real_of_num(7) * real_of_num(n) + (real_of_num(k) + real_of_num(2)))))))))))))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))))"), t1385, t1384, t1383)
  let t1380 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3) * pow(real_of_num((k : Num)) + real_of_num(1), 4)")
  let t1381 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(real_of_num(n) + real_of_num(2), 3)))")
  let t1382 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1403 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + real_of_num(k)) * ((real_of_num(n) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))))))"), t1382, t1381, t1380)
  let t1377 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1378 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2)")
  let t1379 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1404 = (@term_syntax.parse_term("-real_of_num(1) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(5) * real_of_num(n) + real_of_num(7))) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(5) * pow(real_of_num(n), 3) + (-real_of_num(1) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(2) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(6) * pow(real_of_num(k), 3) + (real_of_num(9) * pow(real_of_num(n), 2) + (-real_of_num(3) * (real_of_num(n) * real_of_num(k)) + (real_of_num(6) * pow(real_of_num(k), 2) + (real_of_num(7) * real_of_num(n) + (real_of_num(k) + real_of_num(2)))))))))))))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))))"), t1379, t1378, t1377)
  let t1374 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1375 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(real_of_num(n) + real_of_num(3), 3))")
  let t1376 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3))))")
  let t1405 = (@term_syntax.parse_term("(real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(5) * pow(real_of_num(n), 3) + (-real_of_num(1) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(2) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(6) * pow(real_of_num(k), 3) + (real_of_num(9) * pow(real_of_num(n), 2) + (-real_of_num(3) * (real_of_num(n) * real_of_num(k)) + (real_of_num(6) * pow(real_of_num(k), 2) + (real_of_num(7) * real_of_num(n) + (real_of_num(k) + real_of_num(2)))))))))))))) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(13) * pow(real_of_num(n), 3) + (real_of_num(5) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(18) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(14) * pow(real_of_num(k), 3) + (real_of_num(63) * pow(real_of_num(n), 2) + (real_of_num(5) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(14) * pow(real_of_num(k), 2) + (real_of_num(135) * real_of_num(n) + (-real_of_num(1) * real_of_num(k) + real_of_num(108)))))))))))))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))"), t1376, t1375, t1374)
  let t1371 = @term_syntax.parse_term("pow(real_of_num((k : Num)) + real_of_num(1), 4)")
  let t1372 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(real_of_num(n) + real_of_num(2), 3))))")
  let t1373 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1406 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + real_of_num(k)) * ((real_of_num(n) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016)))))))))))))))))))"), t1373, t1372, t1371)
  let t1368 = @term_syntax.parse_term("real_of_num(1)")
  let t1369 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2))")
  let t1370 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1407 = (@term_syntax.parse_term("(real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * ((pow(real_of_num(n), 2) + (real_of_num(5) * real_of_num(n) + real_of_num(7))) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(5) * pow(real_of_num(n), 3) + (-real_of_num(1) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(2) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(6) * pow(real_of_num(k), 3) + (real_of_num(9) * pow(real_of_num(n), 2) + (-real_of_num(3) * (real_of_num(n) * real_of_num(k)) + (real_of_num(6) * pow(real_of_num(k), 2) + (real_of_num(7) * real_of_num(n) + (real_of_num(k) + real_of_num(2)))))))))))))) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016)))))))))))))))))"), t1370, t1369, t1368)
  let t1365 = @term_syntax.parse_term("real_of_num(1)")
  let t1366 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1367 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3))")
  let t1408 = (@term_syntax.parse_term("-real_of_num(1) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(1)), 2) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(5) * pow(real_of_num(n), 3) + (-real_of_num(1) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(2) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(6) * pow(real_of_num(k), 3) + (real_of_num(9) * pow(real_of_num(n), 2) + (-real_of_num(3) * (real_of_num(n) * real_of_num(k)) + (real_of_num(6) * pow(real_of_num(k), 2) + (real_of_num(7) * real_of_num(n) + (real_of_num(k) + real_of_num(2)))))))))))))) * (real_of_num(13896) * pow(real_of_num(n), 10) + (real_of_num(347400) * pow(real_of_num(n), 9) + (real_of_num(3868998) * pow(real_of_num(n), 8) + (real_of_num(25269960) * pow(real_of_num(n), 7) + (real_of_num(107159724) * pow(real_of_num(n), 6) + (real_of_num(308199360) * pow(real_of_num(n), 5) + (real_of_num(608681313) * pow(real_of_num(n), 4) + (real_of_num(814935630) * pow(real_of_num(n), 3) + (real_of_num(707785777) * pow(real_of_num(n), 2) + (real_of_num(360083510) * real_of_num(n) + real_of_num(81495208)))))))))))))))"), t1367, t1366, t1365)
  let t1362 = @term_syntax.parse_term("real_of_num(1)")
  let t1363 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))))")
  let t1364 = @term_syntax.parse_term("real_of_num(1)")
  tri_k0_reduced_c.set(@list.List([(@term_syntax.parse_term("(real_of_num(2) * real_of_num((n : Num)) + real_of_num(7)) * (pow(real_of_num(n) + real_of_num(1), 6) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(144) * pow(real_of_num(n), 3) + (real_of_num(643) * pow(real_of_num(n), 2) + (real_of_num(1266) * real_of_num(n) + real_of_num(928))))))"), t1364, t1363, t1362), t1408, t1407, t1406, t1405, t1404, t1403, t1402, t1401, t1400, t1399, t1398]))
}

///|
let tri_k0_reduced_c : @lib.Cell[@list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)]] = @lib.Cell::new("tri_k0_reduced")

///|
/// `tri_k0_reduced`
pub fn tri_k0_reduced() -> @list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)] {
  tri_k0_reduced_c.get()
}

///|
/// tri_k1_reduced
fn step_128() -> Unit raise {
  let t1448 = @term_syntax.parse_term("real_of_num(1)")
  let t1449 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2))")
  let t1450 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1451 = (@term_syntax.parse_term("-real_of_num(4) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num((k : Num)), 4) * (-real_of_num(1536) * pow(real_of_num(n), 16) + (real_of_num(3456) * (pow(real_of_num(n), 15) * real_of_num(k)) + (-real_of_num(768) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(1728) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(768) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (-real_of_num(63984) * pow(real_of_num(n), 15) + (real_of_num(128352) * (pow(real_of_num(n), 14) * real_of_num(k)) + (-real_of_num(20472) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(57072) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(21912) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (-real_of_num(1240448) * pow(real_of_num(n), 14) + (real_of_num(2207580) * (pow(real_of_num(n), 13) * real_of_num(k)) + (-real_of_num(229168) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(861540) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(284200) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (-real_of_num(14858072) * pow(real_of_num(n), 13) + (real_of_num(23327476) * (pow(real_of_num(n), 12) * real_of_num(k)) + (-real_of_num(1284268) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(7872580) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(2216476) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (-real_of_num(123087048) * pow(real_of_num(n), 12) + (real_of_num(169390270) * (pow(real_of_num(n), 11) * real_of_num(k)) + (-real_of_num(2229148) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(48600970) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(11581872) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (-real_of_num(747916132) * pow(real_of_num(n), 11) + (real_of_num(895491960) * (pow(real_of_num(n), 10) * real_of_num(k)) + (real_of_num(19636326) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(214150124) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(42741626) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (-real_of_num(3448870336) * pow(real_of_num(n), 10) + (real_of_num(3561379481) * (pow(real_of_num(n), 9) * real_of_num(k)) + (real_of_num(178983116) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(693288259) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(114305270) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (-real_of_num(12314690524) * pow(real_of_num(n), 9) + (real_of_num(10853226951) * (pow(real_of_num(n), 8) * real_of_num(k)) + (real_of_num(780005826) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(1670758425) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(223378412) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (-real_of_num(34419976280) * pow(real_of_num(n), 8) + (real_of_num(25562116926) * (pow(real_of_num(n), 7) * real_of_num(k)) + (real_of_num(2218767840) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(2999441626) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(316850268) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (-real_of_num(75583675964) * pow(real_of_num(n), 7) + (real_of_num(46548168958) * (pow(real_of_num(n), 6) * real_of_num(k)) + (real_of_num(4425270962) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(3964985038) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(318395514) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (-real_of_num(130014624048) * pow(real_of_num(n), 6) + (real_of_num(65027372713) * (pow(real_of_num(n), 5) * real_of_num(k)) + (real_of_num(6286099260) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(3754252403) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(215308166) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (-real_of_num(173414173068) * pow(real_of_num(n), 5) + (real_of_num(68467857071) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(6267688586) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(2412870465) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(88023212) * (real_of_num(n) * pow(real_of_num(k), 4)) + (-real_of_num(175893838000) * pow(real_of_num(n), 4) + (real_of_num(52615736598) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(4186382212) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(944024994) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(16459280) * pow(real_of_num(k), 4) + (-real_of_num(131207942960) * pow(real_of_num(n), 3) + (real_of_num(27869086208) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(1686931392) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(169882072) * pow(real_of_num(k), 3) + (-real_of_num(67908067008) * pow(real_of_num(n), 2) + (real_of_num(9099997808) * (real_of_num(n) * real_of_num(k)) + (real_of_num(310664672) * pow(real_of_num(k), 2) + (-real_of_num(21794233216) * real_of_num(n) + (real_of_num(1381092384) * real_of_num(k) + -real_of_num(3268333056)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1450, t1449, t1448)
  let t1445 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1)), 2) * pow(real_of_num(k) + real_of_num(1), 4)")
  let t1446 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2)))")
  let t1447 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1452 = (@term_syntax.parse_term("real_of_num(4) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num((k : Num)) + real_of_num(2)), 2) * (-real_of_num(1536) * pow(real_of_num(n), 16) + (real_of_num(3456) * (pow(real_of_num(n), 15) * real_of_num(k)) + (-real_of_num(768) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(1728) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(768) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (-real_of_num(60528) * pow(real_of_num(n), 15) + (real_of_num(126816) * (pow(real_of_num(n), 14) * real_of_num(k)) + (-real_of_num(25656) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(54000) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(21912) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (-real_of_num(1112864) * pow(real_of_num(n), 14) + (real_of_num(2161452) * (pow(real_of_num(n), 13) * real_of_num(k)) + (-real_of_num(395776) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(773892) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(284200) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (-real_of_num(12672692) * pow(real_of_num(n), 13) + (real_of_num(22700996) * (pow(real_of_num(n), 12) * real_of_num(k)) + (-real_of_num(3737416) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(6735780) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(2216476) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (-real_of_num(100045044) * pow(real_of_num(n), 12) + (real_of_num(164324762) * (pow(real_of_num(n), 11) * real_of_num(k)) + (-real_of_num(24141688) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(39735066) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(11581872) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (-real_of_num(580649758) * pow(real_of_num(n), 11) + (real_of_num(868552724) * (pow(real_of_num(n), 10) * real_of_num(k)) + (-real_of_num(112867728) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(167822636) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(42741626) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (-real_of_num(2563195904) * pow(real_of_num(n), 10) + (real_of_num(3463715127) * (pow(real_of_num(n), 9) * real_of_num(k)) + (-real_of_num(393976024) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(522321755) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(114305270) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (-real_of_num(8780059211) * pow(real_of_num(n), 9) + (real_of_num(10615070299) * (pow(real_of_num(n), 8) * real_of_num(k)) + (-real_of_num(1043409195) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(1213537345) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(223378412) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (-real_of_num(23590334465) * pow(real_of_num(n), 8) + (real_of_num(25213230305) * (pow(real_of_num(n), 7) * real_of_num(k)) + (-real_of_num(2107675815) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(2105927978) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(316850268) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (-real_of_num(49892099845) * pow(real_of_num(n), 7) + (real_of_num(46430650443) * (pow(real_of_num(n), 6) * real_of_num(k)) + (-real_of_num(3232783444) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(2697583966) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(318395514) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (-real_of_num(82804140405) * pow(real_of_num(n), 6) + (real_of_num(65773103407) * (pow(real_of_num(n), 5) * real_of_num(k)) + (-real_of_num(3707754246) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(2480670347) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(215308166) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (-real_of_num(106737592607) * pow(real_of_num(n), 5) + (real_of_num(70412501549) * (pow(real_of_num(n), 4) * real_of_num(k)) + (-real_of_num(3084695539) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(1551637801) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(88023212) * (real_of_num(n) * pow(real_of_num(k), 4)) + (-real_of_num(104788016439) * pow(real_of_num(n), 4) + (real_of_num(55161938617) * (pow(real_of_num(n), 3) * real_of_num(k)) + (-real_of_num(1760380187) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(591932146) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(16459280) * pow(real_of_num(k), 4) + (-real_of_num(75760374665) * pow(real_of_num(n), 3) + (real_of_num(29864471901) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(617004318) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(104044952) * pow(real_of_num(k), 3) + (-real_of_num(38050160887) * pow(real_of_num(n), 2) + (real_of_num(9993878458) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(100225864) * pow(real_of_num(k), 2) + (-real_of_num(11863305798) * real_of_num(n) + (real_of_num(1558612632) * real_of_num(k) + -real_of_num(1729998792)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1447, t1446, t1445)
  let t1442 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * (pow(real_of_num(n) + real_of_num(4), 3) * pow(real_of_num(k) + real_of_num(1), 4)))")
  let t1443 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))))")
  let t1444 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2)))")
  let t1453 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num(k) + -real_of_num(1))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))"), t1444, t1443, t1442)
  let t1439 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * pow(real_of_num(k) + real_of_num(1), 4))")
  let t1440 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1441 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))")
  let t1454 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))"), t1441, t1440, t1439)
  let t1436 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3) * pow(real_of_num((k : Num)) + real_of_num(1), 4)")
  let t1437 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1438 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2))")
  let t1455 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num(k) + -real_of_num(1))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))"), t1438, t1437, t1436)
  let t1433 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * (pow(real_of_num(n) + real_of_num(4), 3) * pow(real_of_num(k) + real_of_num(1), 4)))")
  let t1434 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3))))")
  let t1435 = @term_syntax.parse_term("-real_of_num(1) * (pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1456 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num(k) + -real_of_num(1))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))))"), t1435, t1434, t1433)
  let t1430 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1431 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2))")
  let t1432 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1457 = (@term_syntax.parse_term("(real_of_num(2) * real_of_num((n : Num)) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num((k : Num)) + real_of_num(2)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) * ((pow(real_of_num(n), 2) + (real_of_num(5) * real_of_num(n) + real_of_num(7))) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))"), t1432, t1431, t1430)
  let t1427 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1428 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))")
  let t1429 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1458 = (@term_syntax.parse_term("-real_of_num(1) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(9) * pow(real_of_num(n), 3) + (real_of_num(2) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(10) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(10) * pow(real_of_num(k), 3) + (real_of_num(30) * pow(real_of_num(n), 2) + (-real_of_num(2) * (real_of_num(n) * real_of_num(k)) + (real_of_num(44) * real_of_num(n) + (-real_of_num(2) * real_of_num(k) + real_of_num(24))))))))))))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))"), t1429, t1428, t1427)
  let t1424 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1425 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1426 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))")
  let t1459 = (@term_syntax.parse_term("-real_of_num(1) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(4))) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(13) * pow(real_of_num(n), 3) + (real_of_num(5) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(18) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(14) * pow(real_of_num(k), 3) + (real_of_num(63) * pow(real_of_num(n), 2) + (real_of_num(5) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(14) * pow(real_of_num(k), 2) + (real_of_num(135) * real_of_num(n) + (-real_of_num(1) * real_of_num(k) + real_of_num(108)))))))))))))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))"), t1426, t1425, t1424)
  let t1421 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(1))) * pow(real_of_num(k) + real_of_num(1), 4))")
  let t1422 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))))")
  let t1423 = @term_syntax.parse_term("-real_of_num(1) * (pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1460 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num(k) + real_of_num(1)) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num(k) + -real_of_num(1))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016))))))))))))))))))"), t1423, t1422, t1421)
  let t1418 = @term_syntax.parse_term("real_of_num(1)")
  let t1419 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2)))")
  let t1420 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1461 = (@term_syntax.parse_term("-real_of_num(1) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num((k : Num)) + real_of_num(2)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) * ((pow(real_of_num(n), 2) + (real_of_num(5) * real_of_num(n) + real_of_num(7))) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016)))))))))))))))))"), t1420, t1419, t1418)
  let t1415 = @term_syntax.parse_term("real_of_num(1)")
  let t1416 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3))))")
  let t1417 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3))")
  let t1462 = (@term_syntax.parse_term("(real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(2)), 2) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(9) * pow(real_of_num(n), 3) + (real_of_num(2) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(10) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(10) * pow(real_of_num(k), 3) + (real_of_num(30) * pow(real_of_num(n), 2) + (-real_of_num(2) * (real_of_num(n) * real_of_num(k)) + (real_of_num(44) * real_of_num(n) + (-real_of_num(2) * real_of_num(k) + real_of_num(24))))))))))))) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016))))))))))))))"), t1417, t1416, t1415)
  let t1412 = @term_syntax.parse_term("real_of_num(1)")
  let t1413 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1414 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(2), 3)")
  let t1463 = (@term_syntax.parse_term("(real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * (pow(real_of_num(n) + (real_of_num((k : Num)) + real_of_num(2)), 2) * ((pow(real_of_num(n), 2) + (real_of_num(3) * real_of_num(n) + real_of_num(3))) * (real_of_num(13896) * pow(real_of_num(n), 10) + (real_of_num(347400) * pow(real_of_num(n), 9) + (real_of_num(3868998) * pow(real_of_num(n), 8) + (real_of_num(25269960) * pow(real_of_num(n), 7) + (real_of_num(107159724) * pow(real_of_num(n), 6) + (real_of_num(308199360) * pow(real_of_num(n), 5) + (real_of_num(608681313) * pow(real_of_num(n), 4) + (real_of_num(814935630) * pow(real_of_num(n), 3) + (real_of_num(707785777) * pow(real_of_num(n), 2) + (real_of_num(360083510) * real_of_num(n) + real_of_num(81495208))))))))))))))"), t1414, t1413, t1412)
  let t1409 = @term_syntax.parse_term("real_of_num(1)")
  let t1410 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + real_of_num(k), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))))")
  let t1411 = @term_syntax.parse_term("real_of_num(1)")
  tri_k1_reduced_c.set(@list.List([(@term_syntax.parse_term("-real_of_num(1) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(7956) * pow(real_of_num(n), 8) + (real_of_num(68086) * pow(real_of_num(n), 7) + (real_of_num(336284) * pow(real_of_num(n), 6) + (real_of_num(1058890) * pow(real_of_num(n), 5) + (real_of_num(2209767) * pow(real_of_num(n), 4) + (real_of_num(3063206) * pow(real_of_num(n), 3) + (real_of_num(2724789) * pow(real_of_num(n), 2) + (real_of_num(1413006) * real_of_num(n) + real_of_num(325664))))))))))))"), t1411, t1410, t1409), t1463, t1462, t1461, t1460, t1459, t1458, t1457, t1456, t1455, t1454, t1453, t1452, t1451]))
}

///|
let tri_k1_reduced_c : @lib.Cell[@list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)]] = @lib.Cell::new("tri_k1_reduced")

///|
/// `tri_k1_reduced`
pub fn tri_k1_reduced() -> @list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)] {
  tri_k1_reduced_c.get()
}

///|
/// tri_k2_reduced
fn step_129() -> Unit raise {
  let t1497 = @term_syntax.parse_term("real_of_num(1)")
  let t1498 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1)))")
  let t1499 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))))")
  let t1500 = (@term_syntax.parse_term("-real_of_num(4) * (real_of_num((k : Num)) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(k) + real_of_num(1), 5) * (real_of_num(768) * pow(real_of_num(n), 17) + (-real_of_num(3840) * (pow(real_of_num(n), 16) * real_of_num(k)) + (real_of_num(7488) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 2)) + (-real_of_num(6720) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 3)) + (-real_of_num(372) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 4)) + (real_of_num(8772) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 5)) + (-real_of_num(7932) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 6)) + (real_of_num(2124) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 7)) + (real_of_num(33792) * pow(real_of_num(n), 16) + (-real_of_num(157920) * (pow(real_of_num(n), 15) * real_of_num(k)) + (real_of_num(285984) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(236508) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (-real_of_num(24444) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (real_of_num(285576) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 5)) + (-real_of_num(228348) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 6)) + (real_of_num(53916) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 7)) + (real_of_num(695008) * pow(real_of_num(n), 15) + (-real_of_num(3026048) * (pow(real_of_num(n), 14) * real_of_num(k)) + (real_of_num(5069472) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(3845816) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (-real_of_num(563929) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (real_of_num(4228061) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 5)) + (-real_of_num(2965195) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 6)) + (real_of_num(610071) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 7)) + (real_of_num(8872992) * pow(real_of_num(n), 14) + (-real_of_num(35860680) * (pow(real_of_num(n), 13) * real_of_num(k)) + (real_of_num(55326472) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(38297128) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (-real_of_num(7062201) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (real_of_num(37634766) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 5)) + (-real_of_num(22915157) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 6)) + (real_of_num(4050412) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 7)) + (real_of_num(78742896) * pow(real_of_num(n), 13) + (-real_of_num(294146400) * (pow(real_of_num(n), 12) * real_of_num(k)) + (real_of_num(415735739) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(260924075) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (-real_of_num(56308591) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (real_of_num(224250307) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 5)) + (-real_of_num(117046206) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 6)) + (real_of_num(17466166) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 7)) + (real_of_num(515413184) * pow(real_of_num(n), 12) + (-real_of_num(1770637850) * (pow(real_of_num(n), 11) * real_of_num(k)) + (real_of_num(2278300097) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(1286667926) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (-real_of_num(308693091) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (real_of_num(942042570) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 5)) + (-real_of_num(414703096) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 6)) + (real_of_num(51093252) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 7)) + (real_of_num(2576225456) * pow(real_of_num(n), 11) + (-real_of_num(8090727306) * (pow(real_of_num(n), 10) * real_of_num(k)) + (real_of_num(9406632852) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(4735827930) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (-real_of_num(1211427691) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (real_of_num(2859841811) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 5)) + (-real_of_num(1039509631) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 6)) + (real_of_num(102640379) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 7)) + (real_of_num(10042207744) * pow(real_of_num(n), 10) + (-real_of_num(28624383652) * (pow(real_of_num(n), 9) * real_of_num(k)) + (real_of_num(29795852850) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(13217484828) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (-real_of_num(3469900135) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (real_of_num(6319292362) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 5)) + (-real_of_num(1842594317) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 6)) + (real_of_num(139771620) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 7)) + (real_of_num(30900177104) * pow(real_of_num(n), 9) + (-real_of_num(79238310868) * (pow(real_of_num(n), 8) * real_of_num(k)) + (real_of_num(73002514895) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(28108959555) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (-real_of_num(7286006265) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (real_of_num(10083400273) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 5)) + (-real_of_num(2262462688) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 6)) + (real_of_num(123447892) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 7)) + (real_of_num(75468444096) * pow(real_of_num(n), 8) + (-real_of_num(172186812834) * (pow(real_of_num(n), 7) * real_of_num(k)) + (real_of_num(138352054849) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(45328273270) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (-real_of_num(11108830969) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(11326819614) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) + (-real_of_num(1832048202) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) + (real_of_num(63848152) * (real_of_num(n) * pow(real_of_num(k), 7)) + (real_of_num(146266755504) * pow(real_of_num(n), 7) + (-real_of_num(292723611810) * (pow(real_of_num(n), 6) * real_of_num(k)) + (real_of_num(201162981114) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(54560718080) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (-real_of_num(11977447248) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(8499441560) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) + (-real_of_num(880287004) * (real_of_num(n) * pow(real_of_num(k), 6)) + (real_of_num(14685520) * pow(real_of_num(k), 7) + (real_of_num(223624806496) * pow(real_of_num(n), 6) + (-real_of_num(385205224120) * (pow(real_of_num(n), 5) * real_of_num(k)) + (real_of_num(220377639732) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(47534432700) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (-real_of_num(8659675144) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (real_of_num(3824239688) * (real_of_num(n) * pow(real_of_num(k), 5)) + (-real_of_num(190113248) * pow(real_of_num(k), 6) + (real_of_num(266328825472) * pow(real_of_num(n), 5) + (-real_of_num(384634123200) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(176090065112) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(28334986440) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (-real_of_num(3766672224) * (real_of_num(n) * pow(real_of_num(k), 4)) + (real_of_num(780109264) * pow(real_of_num(k), 5) + (real_of_num(241822754048) * pow(real_of_num(n), 4) + (-real_of_num(281708015936) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(96887337056) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(10344114032) * (real_of_num(n) * pow(real_of_num(k), 3)) + (-real_of_num(744986544) * pow(real_of_num(k), 4) + (real_of_num(161603596032) * pow(real_of_num(n), 3) + (-real_of_num(142716403296) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(32825580096) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(1744849824) * pow(real_of_num(k), 3) + (real_of_num(74867424768) * pow(real_of_num(n), 2) + (-real_of_num(44680889088) * (real_of_num(n) * real_of_num(k)) + (real_of_num(5162764032) * pow(real_of_num(k), 2) + (real_of_num(21458165760) * real_of_num(n) + (-real_of_num(6512113152) * real_of_num(k) + real_of_num(2863226880)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1499, t1498, t1497)
  let t1494 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * pow(real_of_num(k) + real_of_num(2), 5))")
  let t1495 = @term_syntax.parse_term("-real_of_num(1) * ((-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2))")
  let t1496 = @term_syntax.parse_term("-real_of_num(1) * (pow(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))))")
  let t1501 = (@term_syntax.parse_term("-real_of_num(4) * ((real_of_num((k : Num)) + real_of_num(1)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * ((-real_of_num(1) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(2) * pow(real_of_num(k), 3) + (-real_of_num(2) * pow(real_of_num(n), 2) + (-real_of_num(1) * (real_of_num(n) * real_of_num(k)) + (real_of_num(8) * pow(real_of_num(k), 2) + (-real_of_num(2) * real_of_num(n) + (real_of_num(11) * real_of_num(k) + real_of_num(5)))))))) * (real_of_num(768) * pow(real_of_num(n), 17) + (-real_of_num(3840) * (pow(real_of_num(n), 16) * real_of_num(k)) + (real_of_num(7488) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 2)) + (-real_of_num(6720) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 3)) + (-real_of_num(372) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 4)) + (real_of_num(8772) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 5)) + (-real_of_num(7932) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 6)) + (real_of_num(2124) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 7)) + (real_of_num(29952) * pow(real_of_num(n), 16) + (-real_of_num(142944) * (pow(real_of_num(n), 15) * real_of_num(k)) + (real_of_num(265824) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(237996) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(19416) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (real_of_num(237984) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 5)) + (-real_of_num(213480) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 6)) + (real_of_num(53916) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 7)) + (real_of_num(544576) * pow(real_of_num(n), 15) + (-real_of_num(2474240) * (pow(real_of_num(n), 14) * real_of_num(k)) + (real_of_num(4357716) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(3855872) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(744971) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (real_of_num(2902577) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 5)) + (-real_of_num(2587783) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 6)) + (real_of_num(610071) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 7)) + (real_of_num(6126208) * pow(real_of_num(n), 14) + (-real_of_num(26432748) * (pow(real_of_num(n), 13) * real_of_num(k)) + (real_of_num(43730080) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(37855724) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(10727224) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (real_of_num(20975832) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 5)) + (-real_of_num(18644660) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 6)) + (real_of_num(4050412) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 7)) + (real_of_num(47714808) * pow(real_of_num(n), 13) + (-real_of_num(195084820) * (pow(real_of_num(n), 12) * real_of_num(k)) + (real_of_num(300197561) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(251384889) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(89274374) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (real_of_num(99570856) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 5)) + (-real_of_num(88693322) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 6)) + (real_of_num(17466166) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 7)) + (real_of_num(272731768) * pow(real_of_num(n), 12) + (-real_of_num(1054933184) * (pow(real_of_num(n), 11) * real_of_num(k)) + (real_of_num(1492054660) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(1192971470) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(490183574) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (real_of_num(324823986) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 5)) + (-real_of_num(292439934) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 6)) + (real_of_num(51093252) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 7)) + (real_of_num(1182739932) * pow(real_of_num(n), 11) + (-real_of_num(4325363056) * (pow(real_of_num(n), 10) * real_of_num(k)) + (real_of_num(5541779499) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(4165047879) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(1884856489) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (real_of_num(738412721) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 5)) + (-real_of_num(681856867) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 6)) + (real_of_num(102640379) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 7)) + (real_of_num(3965796096) * pow(real_of_num(n), 10) + (-real_of_num(13725596018) * (pow(real_of_num(n), 9) * real_of_num(k)) + (real_of_num(15647797720) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(10841929592) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(5220078290) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (real_of_num(1155192868) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 5)) + (-real_of_num(1124111664) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 6)) + (real_of_num(139771620) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 7)) + (real_of_num(10374173274) * pow(real_of_num(n), 9) + (-real_of_num(34100830232) * (pow(real_of_num(n), 8) * real_of_num(k)) + (real_of_num(33831285527) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(21072888095) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(10506074900) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (real_of_num(1183282330) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 5)) + (-real_of_num(1284061348) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 6)) + (real_of_num(123447892) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 7)) + (real_of_num(21183410278) * pow(real_of_num(n), 8) + (-real_of_num(66643659794) * (pow(real_of_num(n), 7) * real_of_num(k)) + (real_of_num(55950436530) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(30281303510) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(15261668906) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(687247506) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) + (-real_of_num(967912958) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) + (real_of_num(63848152) * (real_of_num(n) * pow(real_of_num(k), 7)) + (real_of_num(33482591822) * pow(real_of_num(n), 7) + (-real_of_num(102292727676) * (pow(real_of_num(n), 6) * real_of_num(k)) + (real_of_num(70135361161) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(31421512301) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(15611717202) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(99558080) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) + (-real_of_num(433349940) * (real_of_num(n) * pow(real_of_num(k), 6)) + (real_of_num(14685520) * pow(real_of_num(k), 7) + (real_of_num(40136994726) * pow(real_of_num(n), 6) + (-real_of_num(122291049974) * (pow(real_of_num(n), 5) * real_of_num(k)) + (real_of_num(65393035612) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(22533272612) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(10677485846) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (-real_of_num(116671144) * (real_of_num(n) * pow(real_of_num(k), 5)) + (-real_of_num(87314608) * pow(real_of_num(k), 6) + (real_of_num(35003178914) * pow(real_of_num(n), 5) + (-real_of_num(111916403736) * (pow(real_of_num(n), 4) * real_of_num(k)) + (real_of_num(43888543364) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(10299559236) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(4384906476) * (real_of_num(n) * pow(real_of_num(k), 4)) + (-real_of_num(52174304) * pow(real_of_num(k), 5) + (real_of_num(20240167866) * pow(real_of_num(n), 4) + (-real_of_num(76003249522) * (pow(real_of_num(n), 3) * real_of_num(k)) + (real_of_num(20030425174) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(2539460808) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(817854256) * pow(real_of_num(k), 4) + (real_of_num(5677893806) * pow(real_of_num(n), 3) + (-real_of_num(36216335248) * (pow(real_of_num(n), 2) * real_of_num(k)) + (real_of_num(5572107668) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(211975120) * pow(real_of_num(k), 3) + (-real_of_num(1165461806) * pow(real_of_num(n), 2) + (-real_of_num(10842346408) * (real_of_num(n) * real_of_num(k)) + (real_of_num(716085136) * pow(real_of_num(k), 2) + (-real_of_num(1500128652) * real_of_num(n) + (-real_of_num(1538415264) * real_of_num(k) + -real_of_num(371277072))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1496, t1495, t1494)
  let t1491 = @term_syntax.parse_term("real_of_num(1)")
  let t1492 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2))")
  let t1493 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1502 = (@term_syntax.parse_term("-real_of_num(4) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(k) + real_of_num(1), 4) * (-real_of_num(1536) * pow(real_of_num(n), 16) + (real_of_num(3456) * (pow(real_of_num(n), 15) * real_of_num(k)) + (-real_of_num(768) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(1728) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(768) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (-real_of_num(60528) * pow(real_of_num(n), 15) + (real_of_num(126816) * (pow(real_of_num(n), 14) * real_of_num(k)) + (-real_of_num(25656) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(54000) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(21912) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (-real_of_num(1112864) * pow(real_of_num(n), 14) + (real_of_num(2161452) * (pow(real_of_num(n), 13) * real_of_num(k)) + (-real_of_num(395776) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(773892) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(284200) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (-real_of_num(12672692) * pow(real_of_num(n), 13) + (real_of_num(22700996) * (pow(real_of_num(n), 12) * real_of_num(k)) + (-real_of_num(3737416) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(6735780) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(2216476) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (-real_of_num(100045044) * pow(real_of_num(n), 12) + (real_of_num(164324762) * (pow(real_of_num(n), 11) * real_of_num(k)) + (-real_of_num(24141688) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(39735066) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(11581872) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (-real_of_num(580649758) * pow(real_of_num(n), 11) + (real_of_num(868552724) * (pow(real_of_num(n), 10) * real_of_num(k)) + (-real_of_num(112867728) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(167822636) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(42741626) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (-real_of_num(2563195904) * pow(real_of_num(n), 10) + (real_of_num(3463715127) * (pow(real_of_num(n), 9) * real_of_num(k)) + (-real_of_num(393976024) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(522321755) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(114305270) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (-real_of_num(8780059211) * pow(real_of_num(n), 9) + (real_of_num(10615070299) * (pow(real_of_num(n), 8) * real_of_num(k)) + (-real_of_num(1043409195) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(1213537345) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(223378412) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (-real_of_num(23590334465) * pow(real_of_num(n), 8) + (real_of_num(25213230305) * (pow(real_of_num(n), 7) * real_of_num(k)) + (-real_of_num(2107675815) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(2105927978) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(316850268) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (-real_of_num(49892099845) * pow(real_of_num(n), 7) + (real_of_num(46430650443) * (pow(real_of_num(n), 6) * real_of_num(k)) + (-real_of_num(3232783444) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(2697583966) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(318395514) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (-real_of_num(82804140405) * pow(real_of_num(n), 6) + (real_of_num(65773103407) * (pow(real_of_num(n), 5) * real_of_num(k)) + (-real_of_num(3707754246) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(2480670347) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(215308166) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (-real_of_num(106737592607) * pow(real_of_num(n), 5) + (real_of_num(70412501549) * (pow(real_of_num(n), 4) * real_of_num(k)) + (-real_of_num(3084695539) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(1551637801) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(88023212) * (real_of_num(n) * pow(real_of_num(k), 4)) + (-real_of_num(104788016439) * pow(real_of_num(n), 4) + (real_of_num(55161938617) * (pow(real_of_num(n), 3) * real_of_num(k)) + (-real_of_num(1760380187) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(591932146) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(16459280) * pow(real_of_num(k), 4) + (-real_of_num(75760374665) * pow(real_of_num(n), 3) + (real_of_num(29864471901) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(617004318) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(104044952) * pow(real_of_num(k), 3) + (-real_of_num(38050160887) * pow(real_of_num(n), 2) + (real_of_num(9993878458) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(100225864) * pow(real_of_num(k), 2) + (-real_of_num(11863305798) * real_of_num(n) + (real_of_num(1558612632) * real_of_num(k) + -real_of_num(1729998792))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1493, t1492, t1491)
  let t1488 = @term_syntax.parse_term("real_of_num(1)")
  let t1489 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(1))) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2)")
  let t1490 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1503 = (@term_syntax.parse_term("-real_of_num(4) * ((real_of_num((k : Num)) + real_of_num(1)) * ((real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (-real_of_num(768) * (pow(real_of_num(n), 20) * real_of_num(k)) + (real_of_num(3072) * (pow(real_of_num(n), 19) * pow(real_of_num(k), 2)) + (-real_of_num(3648) * (pow(real_of_num(n), 18) * pow(real_of_num(k), 3)) + (-real_of_num(3456) * (pow(real_of_num(n), 17) * pow(real_of_num(k), 4)) + (real_of_num(13044) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 5)) + (-real_of_num(7440) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 6)) + (-real_of_num(9660) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 7)) + (real_of_num(14016) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 8)) + (-real_of_num(900) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 9)) + (-real_of_num(5808) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 10)) + (real_of_num(2124) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 11)) + (-real_of_num(1536) * pow(real_of_num(n), 20) + (-real_of_num(26112) * (pow(real_of_num(n), 19) * real_of_num(k)) + (real_of_num(117984) * (pow(real_of_num(n), 18) * pow(real_of_num(k), 2)) + (-real_of_num(157872) * (pow(real_of_num(n), 17) * pow(real_of_num(k), 3)) + (-real_of_num(82476) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 4)) + (real_of_num(437928) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 5)) + (-real_of_num(302352) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 6)) + (-real_of_num(230868) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 7)) + (real_of_num(430932) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 8)) + (-real_of_num(66048) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 9)) + (-real_of_num(144696) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 10)) + (real_of_num(53916) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 11)) + (-real_of_num(64512) * pow(real_of_num(n), 19) + (-real_of_num(384640) * (pow(real_of_num(n), 18) * real_of_num(k)) + (real_of_num(2090896) * (pow(real_of_num(n), 17) * pow(real_of_num(k), 2)) + (-real_of_num(3133468) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 3)) + (-real_of_num(611100) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 4)) + (real_of_num(6669745) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 5)) + (-real_of_num(5407124) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 6)) + (-real_of_num(2089111) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 7)) + (real_of_num(5972620) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 8)) + (-real_of_num(1408917) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 9)) + (-real_of_num(1600300) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 10)) + (real_of_num(610071) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 11)) + (-real_of_num(1269632) * pow(real_of_num(n), 18) + (-real_of_num(3003728) * (pow(real_of_num(n), 17) * real_of_num(k)) + (real_of_num(22592260) * (pow(real_of_num(n), 16) * pow(real_of_num(k), 2)) + (-real_of_num(37976376) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 3)) + (real_of_num(2293054) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 4)) + (real_of_num(60685255) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 5)) + (-real_of_num(56730391) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 6)) + (-real_of_num(5393794) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 7)) + (real_of_num(49197884) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 8)) + (-real_of_num(15500873) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 9)) + (-real_of_num(10323751) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 10)) + (real_of_num(4050412) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 11)) + (-real_of_num(15545840) * pow(real_of_num(n), 17) + (-real_of_num(9762592) * (pow(real_of_num(n), 16) * real_of_num(k)) + (real_of_num(165288640) * (pow(real_of_num(n), 15) * pow(real_of_num(k), 2)) + (-real_of_num(315365853) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 3)) + (real_of_num(81685552) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 4)) + (real_of_num(364829770) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 5)) + (-real_of_num(389513694) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 6)) + (real_of_num(59657879) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 7)) + (real_of_num(266983830) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 8)) + (-real_of_num(105474486) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 9)) + (-real_of_num(42874272) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 10)) + (real_of_num(17466166) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 11)) + (-real_of_num(132576688) * pow(real_of_num(n), 16) + (real_of_num(48901680) * (pow(real_of_num(n), 15) * real_of_num(k)) + (real_of_num(855576202) * (pow(real_of_num(n), 14) * pow(real_of_num(k), 2)) + (-real_of_num(1908028651) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 3)) + (real_of_num(780920811) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 4)) + (real_of_num(1507811879) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 5)) + (-real_of_num(1832624289) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 6)) + (real_of_num(724100432) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 7)) + (real_of_num(997421032) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 8)) + (-real_of_num(481849388) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 9)) + (-real_of_num(119083520) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 10)) + (real_of_num(51093252) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 11)) + (-real_of_num(835078836) * pow(real_of_num(n), 15) + (real_of_num(833783380) * (pow(real_of_num(n), 14) * real_of_num(k)) + (real_of_num(3139764414) * (pow(real_of_num(n), 13) * pow(real_of_num(k), 2)) + (-real_of_num(8733060549) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 3)) + (real_of_num(4491974013) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 4)) + (real_of_num(4287843995) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 5)) + (-real_of_num(5932274494) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 6)) + (real_of_num(4068350792) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 7)) + (real_of_num(2590021039) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 8)) + (-real_of_num(1538499965) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 9)) + (-real_of_num(221563724) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 10)) + (real_of_num(102640379) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 11)) + (-real_of_num(4018284012) * pow(real_of_num(n), 14) + (real_of_num(5714811180) * (pow(real_of_num(n), 13) * real_of_num(k)) + (real_of_num(7632922724) * (pow(real_of_num(n), 12) * pow(real_of_num(k), 2)) + (-real_of_num(31029911163) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 3)) + (real_of_num(17781446458) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 4)) + (real_of_num(8019639098) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 5)) + (-real_of_num(12468086546) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 6)) + (real_of_num(14738458650) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 7)) + (real_of_num(4552075227) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 8)) + (-real_of_num(3489391541) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 9)) + (-real_of_num(265857391) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 10)) + (real_of_num(139771620) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 11)) + (-real_of_num(15058891782) * pow(real_of_num(n), 13) + (real_of_num(25931121982) * (pow(real_of_num(n), 12) * real_of_num(k)) + (real_of_num(8011466868) * (pow(real_of_num(n), 11) * pow(real_of_num(k), 2)) + (-real_of_num(87367343879) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 3)) + (real_of_num(50726283145) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 4)) + (real_of_num(8528744870) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 5)) + (-real_of_num(12438738639) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 6)) + (real_of_num(37345179957) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 7)) + (real_of_num(4870083238) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 8)) + (-real_of_num(5609865500) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 9)) + (-real_of_num(182212116) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 10)) + (real_of_num(123447892) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 11)) + (-real_of_num(44357560932) * pow(real_of_num(n), 12) + (real_of_num(86233343370) * (pow(real_of_num(n), 11) * real_of_num(k)) + (-real_of_num(24598819688) * (pow(real_of_num(n), 10) * pow(real_of_num(k), 2)) + (-real_of_num(198822461549) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 3)) + (real_of_num(105727167018) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 4)) + (real_of_num(3230955143) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 5)) + (real_of_num(15359128716) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 6)) + (real_of_num(67888633188) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 7)) + (real_of_num(1736540842) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 8)) + (-real_of_num(6257641918) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 9)) + (-real_of_num(39929562) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 10)) + (real_of_num(63848152) * (real_of_num(n) * pow(real_of_num(k), 11)) + (-real_of_num(102725115803) * pow(real_of_num(n), 11) + (real_of_num(217340161302) * (pow(real_of_num(n), 10) * real_of_num(k)) + (-real_of_num(156749805900) * (pow(real_of_num(n), 9) * pow(real_of_num(k), 2)) + (-real_of_num(373791795477) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 3)) + (real_of_num(160007508066) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 4)) + (real_of_num(6132840794) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 5)) + (real_of_num(85141230694) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 6)) + (real_of_num(88445905489) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 7)) + (-real_of_num(3085969861) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 8)) + (-real_of_num(4609296328) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 9)) + (real_of_num(28272644) * (real_of_num(n) * pow(real_of_num(k), 10)) + (real_of_num(14685520) * pow(real_of_num(k), 11) + (-real_of_num(185183963965) * pow(real_of_num(n), 10) + (real_of_num(416713350716) * (pow(real_of_num(n), 9) * real_of_num(k)) + (-real_of_num(474718785604) * (pow(real_of_num(n), 8) * pow(real_of_num(k), 2)) + (-real_of_num(593876235705) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 3)) + (real_of_num(171856922761) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 4)) + (real_of_num(47237296421) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 5)) + (real_of_num(168310686293) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 6)) + (real_of_num(80707519132) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 7)) + (-real_of_num(5162842085) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 8)) + (-real_of_num(2016994664) * (real_of_num(n) * pow(real_of_num(k), 9)) + (real_of_num(15484032) * pow(real_of_num(k), 10) + (-real_of_num(253317166141) * pow(real_of_num(n), 9) + (real_of_num(592572178670) * (pow(real_of_num(n), 8) * real_of_num(k)) + (-real_of_num(1005163359743) * (pow(real_of_num(n), 7) * pow(real_of_num(k), 2)) + (-real_of_num(809192807138) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 3)) + (real_of_num(127063815279) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 4)) + (real_of_num(128189695962) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 5)) + (real_of_num(198948073839) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 6)) + (real_of_num(48968539942) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 7)) + (-real_of_num(3297827090) * (real_of_num(n) * pow(real_of_num(k), 8)) + (-real_of_num(397172608) * pow(real_of_num(k), 9) + (-real_of_num(248099971677) * pow(real_of_num(n), 8) + (real_of_num(571560019140) * (pow(real_of_num(n), 7) * real_of_num(k)) + (-real_of_num(1614590246181) * (pow(real_of_num(n), 6) * pow(real_of_num(k), 2)) + (-real_of_num(938978116240) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 3)) + (real_of_num(67452327845) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 4)) + (real_of_num(186875631436) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 5)) + (real_of_num(147132594281) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 6)) + (real_of_num(17718574580) * (real_of_num(n) * pow(real_of_num(k), 7)) + (-real_of_num(825202424) * pow(real_of_num(k), 8) + (-real_of_num(147882369687) * pow(real_of_num(n), 7) + (real_of_num(241185676502) * (pow(real_of_num(n), 6) * real_of_num(k)) + (-real_of_num(2010571491742) * (pow(real_of_num(n), 5) * pow(real_of_num(k), 2)) + (-real_of_num(895109236742) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 3)) + (real_of_num(39198392923) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 4)) + (real_of_num(160449445404) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 5)) + (real_of_num(63255060578) * (real_of_num(n) * pow(real_of_num(k), 6)) + (real_of_num(2885568320) * pow(real_of_num(k), 7) + (-real_of_num(14686870287) * pow(real_of_num(n), 6) + (-real_of_num(273330960216) * (pow(real_of_num(n), 5) * real_of_num(k)) + (-real_of_num(1928992389138) * (pow(real_of_num(n), 4) * pow(real_of_num(k), 2)) + (-real_of_num(659361948312) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 3)) + (real_of_num(33608190505) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 4)) + (real_of_num(77210048408) * (real_of_num(n) * pow(real_of_num(k), 5)) + (real_of_num(12141251048) * pow(real_of_num(k), 6) + (real_of_num(53199110239) * pow(real_of_num(n), 5) + (-real_of_num(646479529420) * (pow(real_of_num(n), 4) * real_of_num(k)) + (-real_of_num(1384782108947) * (pow(real_of_num(n), 3) * pow(real_of_num(k), 2)) + (-real_of_num(344696962382) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 3)) + (real_of_num(21356529098) * (real_of_num(n) * pow(real_of_num(k), 4)) + (real_of_num(16198097440) * pow(real_of_num(k), 5) + (real_of_num(28501690389) * pow(real_of_num(n), 4) + (-real_of_num(653966998214) * (pow(real_of_num(n), 3) * real_of_num(k)) + (-real_of_num(701136846375) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (-real_of_num(112035156548) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(5728704056) * pow(real_of_num(k), 4) + (-real_of_num(22606825262) * pow(real_of_num(n), 3) + (-real_of_num(395033082912) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(223007088454) * (real_of_num(n) * pow(real_of_num(k), 2)) + (-real_of_num(16838893008) * pow(real_of_num(k), 3) + (-real_of_num(36383694668) * pow(real_of_num(n), 2) + (-real_of_num(138574707448) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(33433816328) * pow(real_of_num(k), 2) + (-real_of_num(18832561176) * real_of_num(n) + (-real_of_num(21948636000) * real_of_num(k) + -real_of_num(3712770720)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"), t1490, t1489, t1488)
  let t1485 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1486 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1487 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2))))")
  let t1504 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + real_of_num(4), 3) * (pow(real_of_num(k) + real_of_num(1), 5) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))"), t1487, t1486, t1485)
  let t1482 = @term_syntax.parse_term("pow(-real_of_num(1) * real_of_num((n : Num)) + (real_of_num((k : Num)) + -real_of_num(2)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * pow(real_of_num(k) + real_of_num(1), 4))")
  let t1483 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * pow(real_of_num(n) + real_of_num(3), 3)))")
  let t1484 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))))")
  let t1505 = (@term_syntax.parse_term("real_of_num(4) * ((real_of_num((n : Num)) + (real_of_num((k : Num)) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(k), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (pow(real_of_num(k) + real_of_num(1), 6) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))"), t1484, t1483, t1482)
  let t1479 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1480 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * pow(real_of_num(n) + real_of_num(2), 3)))")
  let t1481 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1506 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (pow(real_of_num(k) + real_of_num(1), 5) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))))"), t1481, t1480, t1479)
  let t1476 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1477 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1)))")
  let t1478 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3))))))")
  let t1507 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(4)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (pow(real_of_num(k) + real_of_num(1), 5) * ((pow(real_of_num(n), 2) + (real_of_num(5) * real_of_num(n) + real_of_num(7))) * ((pow(real_of_num(n), 2) + (real_of_num(7) * real_of_num(n) + real_of_num(13))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173))))))))))))))))"), t1478, t1477, t1476)
  let t1473 = @term_syntax.parse_term("pow(real_of_num((n : Num)) + real_of_num(4), 3)")
  let t1474 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * pow(real_of_num(n) + real_of_num(3), 3))")
  let t1475 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))))")
  let t1508 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(4))) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(n) + real_of_num(4), 3) * (pow(real_of_num(k) + real_of_num(1), 5) * ((pow(real_of_num(n), 4) + (pow(real_of_num(n), 3) * real_of_num(k) + (-real_of_num(4) * (pow(real_of_num(n), 2) * pow(real_of_num(k), 2)) + (real_of_num(4) * (real_of_num(n) * pow(real_of_num(k), 3)) + (real_of_num(13) * pow(real_of_num(n), 3) + (real_of_num(5) * (pow(real_of_num(n), 2) * real_of_num(k)) + (-real_of_num(18) * (real_of_num(n) * pow(real_of_num(k), 2)) + (real_of_num(14) * pow(real_of_num(k), 3) + (real_of_num(63) * pow(real_of_num(n), 2) + (real_of_num(5) * (real_of_num(n) * real_of_num(k)) + (-real_of_num(14) * pow(real_of_num(k), 2) + (real_of_num(135) * real_of_num(n) + (-real_of_num(1) * real_of_num(k) + real_of_num(108)))))))))))))) * (real_of_num(12) * pow(real_of_num(n), 4) + (real_of_num(96) * pow(real_of_num(n), 3) + (real_of_num(283) * pow(real_of_num(n), 2) + (real_of_num(364) * real_of_num(n) + real_of_num(173)))))))))))))"), t1475, t1474, t1473)
  let t1470 = @term_syntax.parse_term("real_of_num(1)")
  let t1471 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * pow(real_of_num(n) + real_of_num(2), 3))))")
  let t1472 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1509 = (@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(n) + (real_of_num(k) + real_of_num(3))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(k) + real_of_num(1), 5) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016)))))))))))))))))"), t1472, t1471, t1470)
  let t1467 = @term_syntax.parse_term("real_of_num(1)")
  let t1468 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2))")
  let t1469 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * (pow(real_of_num(n) + real_of_num(2), 3) * pow(real_of_num(n) + real_of_num(3), 3)))))")
  let t1510 = (@term_syntax.parse_term("-real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * ((real_of_num(2) * real_of_num(n) + real_of_num(7)) * (pow(real_of_num(n) + (real_of_num(k) + real_of_num(3)), 2) * (pow(real_of_num(2) * real_of_num(n) + real_of_num(3), 2) * (pow(real_of_num(k) + real_of_num(1), 5) * ((pow(real_of_num(n), 2) + (real_of_num(5) * real_of_num(n) + real_of_num(7))) * (real_of_num(408) * pow(real_of_num(n), 9) + (real_of_num(10404) * pow(real_of_num(n), 8) + (real_of_num(117046) * pow(real_of_num(n), 7) + (real_of_num(761526) * pow(real_of_num(n), 6) + (real_of_num(3153520) * pow(real_of_num(n), 5) + (real_of_num(8607233) * pow(real_of_num(n), 4) + (real_of_num(15461616) * pow(real_of_num(n), 3) + (real_of_num(17602001) * pow(real_of_num(n), 2) + (real_of_num(11509566) * real_of_num(n) + real_of_num(3291016))))))))))))))))))"), t1469, t1468, t1467)
  let t1464 = @term_syntax.parse_term("real_of_num(1)")
  let t1465 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * ((-real_of_num(1) * real_of_num(n) + (real_of_num(k) + real_of_num(1))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(4)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(3)), 2) * pow(real_of_num(n) + real_of_num(3), 3))))")
  let t1466 = @term_syntax.parse_term("(-real_of_num(1) * real_of_num((n : Num)) + real_of_num((k : Num))) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(2)), 2) * (pow(-real_of_num(1) * real_of_num(n) + (real_of_num(k) + -real_of_num(1)), 2) * pow(real_of_num(n) + real_of_num(2), 3)))")
  tri_k2_reduced_c.set(@list.List([(@term_syntax.parse_term("real_of_num(2) * (real_of_num((k : Num)) * ((real_of_num((n : Num)) + (real_of_num(k) + real_of_num(2))) * ((real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(2) * real_of_num(n) + real_of_num(5)) * (pow(real_of_num(k) + real_of_num(1), 5) * (real_of_num(13896) * pow(real_of_num(n), 10) + (real_of_num(347400) * pow(real_of_num(n), 9) + (real_of_num(3868998) * pow(real_of_num(n), 8) + (real_of_num(25269960) * pow(real_of_num(n), 7) + (real_of_num(107159724) * pow(real_of_num(n), 6) + (real_of_num(308199360) * pow(real_of_num(n), 5) + (real_of_num(608681313) * pow(real_of_num(n), 4) + (real_of_num(814935630) * pow(real_of_num(n), 3) + (real_of_num(707785777) * pow(real_of_num(n), 2) + (real_of_num(360083510) * real_of_num(n) + real_of_num(81495208))))))))))))))))"), t1466, t1465, t1464), t1510, t1509, t1508, t1507, t1506, t1505, t1504, t1503, t1502, t1501, t1500]))
}

///|
let tri_k2_reduced_c : @lib.Cell[@list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)]] = @lib.Cell::new("tri_k2_reduced")

///|
/// `tri_k2_reduced`
pub fn tri_k2_reduced() -> @list.List[(@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)] {
  tri_k2_reduced_c.get()
}

///|
/// apery_k0_zero
fn step_130() -> Unit raise {
  apery_k0_zero_c.set(apery_prove_coefficient(@lib.el(1, apery_normalized_coeffs()), tri_k0_reduced()))
}

///|
let apery_k0_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_k0_zero")

///|
/// `apery_k0_zero`
pub fn apery_k0_zero() -> @kernel.Thm {
  apery_k0_zero_c.get()
}

///|
/// apery_k1_zero
fn step_131() -> Unit raise {
  apery_k1_zero_c.set(apery_prove_coefficient(@lib.el(2, apery_normalized_coeffs()), tri_k1_reduced()))
}

///|
let apery_k1_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_k1_zero")

///|
/// `apery_k1_zero`
pub fn apery_k1_zero() -> @kernel.Thm {
  apery_k1_zero_c.get()
}

///|
/// apery_k2_zero
fn step_132() -> Unit raise {
  apery_k2_zero_c.set(apery_prove_coefficient(@lib.el(3, apery_normalized_coeffs()), tri_k2_reduced()))
}

///|
let apery_k2_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_k2_zero")

///|
/// `apery_k2_zero`
pub fn apery_k2_zero() -> @kernel.Thm {
  apery_k2_zero_c.get()
}

///|
/// `apery_scalar_leaves`
pub fn apery_scalar_leaves(x1511 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x1511
  if @lib.mem(tm, apery_atoms()) {
    @list.List([])
  } else {
    if !apery_has_atom(tm) {
      @list.List([tm])
    } else {
      if (is_binop_op(add_tm(), tm) || is_binop_op(sub_tm(), tm)) {
        let op = if is_binop_op(add_tm(), tm) {
          add_tm()
        } else {
          sub_tm()
        }
        let (l, r) = @basics.dest_binop(op, tm)
        let t1512 = apery_scalar_leaves(r)
        apery_scalar_leaves(l).concat(t1512)
      } else {
        if (@kernel.is_comb(tm) && (@kernel.rator(tm) == neg_tm())) {
          apery_scalar_leaves(@kernel.rand(tm))
        } else {
          if is_binop_op(mul_tm(), tm) {
            let (l_1, r_1) = @basics.dest_binop(mul_tm(), tm)
            if !apery_has_atom(l_1) {
              apery_scalar_leaves(r_1).prepend(l_1)
            } else {
              if !apery_has_atom(r_1) {
                apery_scalar_leaves(l_1).prepend(r_1)
              } else {
                raise Failure("apery_scalar_leaves: nonlinear product")
              }
            }
          } else {
            raise Failure("apery_scalar_leaves: unsupported term")
          }
        }
      }
    }
  }
}

///|
/// apery_linear_form
fn step_133() -> Unit raise {
  apery_linear_form_c.set(apery_sum(@lib.map2(fn(x1513 : @kernel.Term, x1514 : @kernel.Term) -> @kernel.Term raise {
    let c = x1513
    let a = x1514
    @basics.mk_binop(mul_tm(), c, a)
  }, @lib.tl(apery_coeffs()), apery_atoms())))
}

///|
let apery_linear_form_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("apery_linear_form")

///|
/// `apery_linear_form`
pub fn apery_linear_form() -> @kernel.Term {
  apery_linear_form_c.get()
}

///|
/// apery_reconstruction
fn step_134() -> Unit raise {
  let t1515 = @basics.mk_eq(@equal.rhs(@kernel.concl(apery_reduced())), apery_linear_form())
  apery_reconstruction_c.set(apery_abstract_identity(apery_atoms().concat(apery_scalar_leaves(@equal.rhs(@kernel.concl(apery_reduced())))), t1515))
}

///|
let apery_reconstruction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_reconstruction")

///|
/// `apery_reconstruction`
pub fn apery_reconstruction() -> @kernel.Thm {
  apery_reconstruction_c.get()
}

///|
/// `apery_original_zero`
pub fn apery_original_zero(x1516 : Int64, x1517 : @kernel.Thm) -> @kernel.Thm raise {
  let i = x1516
  let zero_th = x1517
  @kernel.trans(apery_normalize_coeff(@lib.el(@lib.int63_to_int(i), apery_coeffs())), zero_th)
}

///|
/// apery_linear_form_zero
fn step_135() -> Unit raise {
  let t1518 = apery_original_zero(3L, apery_k2_zero())
  let t1519 = apery_original_zero(2L, apery_k1_zero())
  apery_linear_form_zero_c.set(@simp.rewrite_conv(@list.List([apery_original_zero(1L, apery_k0_zero()), t1519, t1518, @calc_int.real_mul_lzero(), @realax.real_add_lid(), @calc_int.real_add_rid()]))(apery_linear_form()))
}

///|
let apery_linear_form_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_linear_form_zero")

///|
/// `apery_linear_form_zero`
pub fn apery_linear_form_zero() -> @kernel.Thm {
  apery_linear_form_zero_c.get()
}

///|
/// apery_target_zero
fn step_136() -> Unit raise {
  apery_target_zero_c.set(@kernel.trans(apery_reduced(), @kernel.trans(apery_reconstruction(), apery_linear_form_zero())))
}

///|
let apery_target_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apery_target_zero")

///|
/// `apery_target_zero`
pub fn apery_target_zero() -> @kernel.Thm {
  apery_target_zero_c.get()
}

///|
/// APERY_SUB_EQ_ZERO
fn step_137() -> Unit raise {
  apery_sub_eq_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, (a - b == real_of_num(0)) == (a == b)"), @calc_rat.real_arith_tac))
}

///|
let apery_sub_eq_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APERY_SUB_EQ_ZERO")

///|
/// `APERY_SUB_EQ_ZERO`
pub fn apery_sub_eq_zero() -> @kernel.Thm {
  apery_sub_eq_zero_c.get()
}

///|
/// P_EQ_DELTA_Q
fn step_138() -> Unit raise {
  let (l, r) = @basics.dest_binop(sub_tm(), apery_target())
  let eq = @kernel.eq_mp(@bool.specl(@list.List([l, r]), apery_sub_eq_zero()), apery_target_zero())
  let t1520 = @bool.disch(apery_hyp(), eq)
  let t1521 = @bool.gen(@term_syntax.parse_term("(k : Num)"), t1520)
  p_eq_delta_q_c.set(@bool.gen(@term_syntax.parse_term("(n : Num)"), t1521))
}

///|
let p_eq_delta_q_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P_EQ_DELTA_Q")

///|
/// `P_EQ_DELTA_Q`
pub fn p_eq_delta_q() -> @kernel.Thm {
  p_eq_delta_q_c.get()
}

///|
/// VV_SUPPORT
fn step_139() -> Unit raise {
  let t1527 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1528 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.arith()])), t1527)
  let t1529 = @list.List([@simp.asm_rewrite_tac(@list.List([@binomial.binom_eq_0()])), t1528])
  let t1526 = @tactics.subgoal_then(@term_syntax.parse_term("binom(((m : Num), (k : Num))) == 0"), fn(x1523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1524 = @tactics.subst1_tac(x1523)
    fn(x1525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1524(x1525)
    }
  })
  let t1522 = @simp.rewrite_tac(@list.List([vv(), cc()]))
  let t1530 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1522), t1526), t1529)
  vv_support_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ k : Num, m < k → vv(m, k) == real_of_num(0)"), t1530))
}

///|
let vv_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VV_SUPPORT")

///|
/// `VV_SUPPORT`
pub fn vv_support() -> @kernel.Thm {
  vv_support_c.get()
}

///|
/// VV_ZERO_K
fn step_140() -> Unit raise {
  let t1532 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t1531 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.arith()]))
  let t1533 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([vv(), ss()]))), t1531), t1532)
  vv_zero_k_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, vv(m, 0) == real_of_num(0)"), t1533))
}

///|
let vv_zero_k_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VV_ZERO_K")

///|
/// `VV_ZERO_K`
pub fn vv_zero_k() -> @kernel.Thm {
  vv_zero_k_c.get()
}

///|
/// WW_EXT
fn step_141() -> Unit raise {
  let t1539 = @tactics.match_mp_tac(vv_support())
  let t1538 = @simp.rewrite_tac(@list.List([]))
  let t1537 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1540 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)")), t1537), @tactics.strip_tac), t1538), t1539), @int.asm_arith_tac)
  let t1541 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @iterate.in_numseg()])), @int.asm_arith_tac), t1540])
  let t1536 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t1535 = @tactics.conv_tac(@equal.sym_conv)
  let t1534 = @simp.rewrite_tac(@list.List([ww(), @equal.gsym(vv())]))
  let t1542 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1534), t1535), t1536), @tactics.conj_tac), t1541)
  ww_ext_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ i : Num, i <= 4 → ww(n + i) == sum(op_dot_dot(0, n + 4), (j : Num) => vv(n + i, j))"), t1542))
}

///|
let ww_ext_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WW_EXT")

///|
/// `WW_EXT`
pub fn ww_ext() -> @kernel.Thm {
  ww_ext_c.get()
}

///|
/// INTERIOR_TELE
fn step_142() -> Unit raise {
  let t1561 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) - 2 + 1 == n - 1"), fn(x1558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1559 = @tactics.subst1_tac(x1558)
    fn(x1560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1559(x1560)
    }
  })
  let t1557 = @simp.asm_rewrite_tac(@list.List([]))
  let t1556 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (n : Num) - 2"), fn(x1553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1554 = @tactics.assume_tac(x1553)
    fn(x1555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1554(x1555)
    }
  })
  let t1552 = @simp.rewrite_tac(@list.List([@iterate.sum_neg(), @iterate.sum_diffs()]))
  let t1551 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) == -(b - a)"))]))
  let t1549 = @tactics.match_mp_tac(p_eq_delta_q())
  let t1548 = @simp.rewrite_tac(@list.List([]))
  let t1547 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1550 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t1547), t1548), t1549), @int.asm_arith_tac), @tactics.all_tac])
  let t1546 = @tactics.subgoal_then(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num) - 2), (j : Num) => pflat2(vv, n, j)) == sum(op_dot_dot(1, n - 2), (j : Num) => qflat(vv, n, j + 1) - qflat(vv, n, j))"), fn(x1543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1544 = @tactics.subst1_tac(x1543)
    fn(x1545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1544(x1545)
    }
  })
  let t1562 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1546), t1550), t1551), t1552), t1556), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1557), t1561), @list.List([@int.asm_arith_tac, @tactics.all_tac])), @calc_rat.real_arith_tac)
  interior_tele_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → sum(op_dot_dot(1, n - 2), (j : Num) => pflat2(vv, n, j)) == qflat(vv, n, n - 1) - qflat(vv, n, 1)"), t1562))
}

///|
let interior_tele_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_TELE")

///|
/// `INTERIOR_TELE`
pub fn interior_tele() -> @kernel.Thm {
  interior_tele_c.get()
}

///|
/// PFLAT_WW_DECOMP
fn step_143() -> Unit raise {
  let t1582 = @simp.rewrite_tac(@list.List([pflat2(), pflat()]))
  let t1581 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1580 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t1579 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_add_numseg())]))
  let t1578 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t1573 = @int.arith_rule(@term_syntax.parse_term("4 <= 4"))
  let t1572 = @term_syntax.parse_term("4")
  let t1574 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1572]), ww_ext()), t1573)
  let t1571 = @int.arith_rule(@term_syntax.parse_term("3 <= 4"))
  let t1570 = @term_syntax.parse_term("3")
  let t1575 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1570]), ww_ext()), t1571)
  let t1569 = @int.arith_rule(@term_syntax.parse_term("2 <= 4"))
  let t1568 = @term_syntax.parse_term("2")
  let t1576 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1568]), ww_ext()), t1569)
  let t1567 = @int.arith_rule(@term_syntax.parse_term("1 <= 4"))
  let t1566 = @term_syntax.parse_term("1")
  let t1577 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1566]), ww_ext()), t1567)
  let t1564 = @int.arith_rule(@term_syntax.parse_term("0 <= 4"))
  let t1563 = @term_syntax.parse_term("0")
  let t1565 = @bool.mp(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1563]), ww_ext()), t1564)
  let t1583 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([pflat(), @simp.rewrite_rule(@list.List([@arith.add_clauses()]))(t1565), t1577, t1576, t1575, t1574]))), t1578), t1579), t1580), t1581), t1582), @calc_rat.real_arith_tac)
  pflat_ww_decomp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pflat(ww, n) == sum(op_dot_dot(0, n + 4), (j : Num) => pflat2(vv, n, j))"), t1583))
}

///|
let pflat_ww_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PFLAT_WW_DECOMP")

///|
/// `PFLAT_WW_DECOMP`
pub fn pflat_ww_decomp() -> @kernel.Thm {
  pflat_ww_decomp_c.get()
}

///|
/// VSNSK_K0
fn step_144() -> Unit raise {
  let t1589 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realax.real_add_lid()]))
  let t1588 = @simp.rewrite_tac(@list.List([vv_zero_k()]))
  let t1587 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1586 = @simp.asm_rewrite_tac(@list.List([]))
  let t1584 = @term_syntax.parse_term("0")
  let t1585 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1584]), v_snsk()))
  let t1590 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1585), t1586), t1587), t1588), t1589)
  vsnsk_k0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 0 < n → vv(n + 1, 1) == (-real_of_num(n) - real_of_num(2) - real_of_num(0)) / (-real_of_num(n) + real_of_num(0)) * vv(n, 1)"), t1590))
}

///|
let vsnsk_k0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSNSK_K0")

///|
/// `VSNSK_K0`
pub fn vsnsk_k0() -> @kernel.Thm {
  vsnsk_k0_c.get()
}

///|
/// VSK2_K0
fn step_145() -> Unit raise {
  let t1597 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realax.real_add_lid()]))
  let t1596 = @simp.rewrite_tac(@list.List([vv_zero_k()]))
  let t1594 = @int.arith_rule(@term_syntax.parse_term("0 + 1 == 1"))
  let t1595 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 + 2 == 2")), t1594]))
  let t1593 = @simp.asm_rewrite_tac(@list.List([]))
  let t1591 = @term_syntax.parse_term("0")
  let t1592 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1591]), v_sk2()))
  let t1598 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1592), t1593), t1595), t1596), t1597)
  vsk2_k0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 0 + 1 < n → vv(n, 2) == (real_of_num(n) + (real_of_num(2) + real_of_num(0))) * ((-real_of_num(n) + (real_of_num(0) + real_of_num(1))) * ((real_of_num(2) * pow(real_of_num(0), 3) + (real_of_num(8) * pow(real_of_num(0), 2) + (real_of_num(11) * real_of_num(0) + (real_of_num(5) - real_of_num(0) * real_of_num(n) - real_of_num(0) * pow(real_of_num(n), 2) - real_of_num(2) * pow(real_of_num(n), 2) - real_of_num(2) * real_of_num(n))))) / pow(real_of_num(0) + real_of_num(2), 5))) * vv(n, 1)"), t1598))
}

///|
let vsk2_k0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSK2_K0")

///|
/// `VSK2_K0`
pub fn vsk2_k0() -> @kernel.Thm {
  vsk2_k0_c.get()
}

///|
/// QFLAT_N1_BRACKET
fn step_146() -> Unit raise {
  let bracket_tm = @term_syntax.parse_term("qc00((n : Num), 1) + (qc10(n, 1) * ((-real_of_num(n) - real_of_num(2) - real_of_num(0)) / (-real_of_num(n) + real_of_num(0))) + qc01(n, 1) * ((real_of_num(n) + (real_of_num(2) + real_of_num(0))) * ((-real_of_num(n) + (real_of_num(0) + real_of_num(1))) * ((real_of_num(2) * pow(real_of_num(0), 3) + (real_of_num(8) * pow(real_of_num(0), 2) + (real_of_num(11) * real_of_num(0) + (real_of_num(5) - real_of_num(0) * real_of_num(n) - real_of_num(0) * pow(real_of_num(n), 2) - real_of_num(2) * pow(real_of_num(n), 2) - real_of_num(2) * real_of_num(n))))) / pow(real_of_num(0) + real_of_num(2), 5)))))")
  let bracket_unf = @equal.rhs(@kernel.concl(@simp.rewrite_conv(@list.List([qc00(), qc01(), qc10()]))(bracket_tm)))
  let dfs = denom_factors(bracket_unf, @list.List([]))
  let hyp3 = @kernel.assume_rule(@term_syntax.parse_term("3 <= (n : Num)"))
  let prove_nz_3 : (@kernel.Term) -> @kernel.Thm raise = fn(x1599 : @kernel.Term) -> @kernel.Thm raise {
    let f = x1599
    let t1601 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())])), @tactics.strip_tac), @calc_rat.asm_real_arith_tac)
    let t1600 = @bool.mk_neg(@basics.mk_eq(f, @term_syntax.parse_term("real_of_num(0)")))
    @tactics.prove(@bool.mk_imp(@term_syntax.parse_term("3 <= (n : Num)"), t1600), t1601)
  }
  let nz3 = @lib.map(fn(x1602 : @kernel.Term) -> @kernel.Thm raise {
    let f_1 = x1602
    @bool.mp(prove_nz_3(f_1), hyp3)
  }, dfs)
  let t1603 = prove_rat_eq(nz3, @basics.mk_eq(bracket_unf, @term_syntax.parse_term("real_of_num(0)")))
  qflat_n1_bracket_c.set(@bool.disch(@term_syntax.parse_term("3 <= (n : Num)"), t1603))
}

///|
let qflat_n1_bracket_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QFLAT_N1_BRACKET")

///|
/// `QFLAT_N1_BRACKET`
pub fn qflat_n1_bracket() -> @kernel.Thm {
  qflat_n1_bracket_c.get()
}

///|
/// QFLAT_N1_ZERO
fn step_147() -> Unit raise {
  let t1618 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1617 = @simp.rewrite_tac(@list.List([qc00(), qc01(), qc10()]))
  let t1616 = @simp.asm_rewrite_tac(@list.List([]))
  let t1615 = @tactics.mp_tac(qflat_n1_bracket())
  let t1614 = @tactics.disch_then(fn(x1611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1612 = @tactics.subst1_tac(x1611)
    fn(x1613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1612(x1613)
    }
  })
  let t1610 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), vsk2_k0()))
  let t1609 = @tactics.disch_then(fn(x1606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1607 = @tactics.subst1_tac(x1606)
    fn(x1608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1607(x1608)
    }
  })
  let t1605 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), vsnsk_k0()))
  let t1604 = @simp.rewrite_tac(@list.List([qflat(), @int.arith_rule(@term_syntax.parse_term("1 + 1 == 2"))]))
  let t1619 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1604), t1605), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1609), t1610), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1614), t1615), t1616), t1617), t1618)
  qflat_n1_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → qflat(vv, n, 1) == real_of_num(0)"), t1619))
}

///|
let qflat_n1_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QFLAT_N1_ZERO")

///|
/// `QFLAT_N1_ZERO`
pub fn qflat_n1_zero() -> @kernel.Thm {
  qflat_n1_zero_c.get()
}

///|
/// INTERIOR_FULL
fn step_148() -> Unit raise {
  let t1620 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([pflat2(), pflat(), vv_zero_k()]))), @calc_rat.real_arith_tac)
  let col0 = @tactics.prove(@term_syntax.parse_term("∀ n : Num, pflat2(vv, n, 0) == real_of_num(0)"), t1620)
  let t1633 = @simp.asm_simp_tac(@list.List([qflat_n1_zero()]))
  let t1632 = @simp.asm_simp_tac(@list.List([interior_tele()]))
  let t1631 = @simp.rewrite_tac(@list.List([@realax.real_add_lid()]))
  let t1630 = @tactics.subgoal_then(@term_syntax.parse_term("0 + 1 == 1"), fn(x1627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1628 = @tactics.subst1_tac(x1627)
    fn(x1629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1628(x1629)
    }
  })
  let t1626 = @simp.rewrite_tac(@list.List([col0]))
  let t1625 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_left()]))
  let t1624 = @tactics.subgoal_then(@term_syntax.parse_term("0 <= (n : Num) - 2"), fn(x1621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1622 = @tactics.assume_tac(x1621)
    fn(x1623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1622(x1623)
    }
  })
  let t1634 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1624), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1625), t1626), t1630), @list.List([@int.arith_tac, @tactics.all_tac])), t1631), t1632), t1633), @calc_rat.real_arith_tac)
  interior_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → sum(op_dot_dot(0, n - 2), (j : Num) => pflat2(vv, n, j)) == qflat(vv, n, n - 1)"), t1634))
}

///|
let interior_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_FULL")

///|
/// `INTERIOR_FULL`
pub fn interior_full() -> @kernel.Thm {
  interior_full_c.get()
}

///|
/// bdry_target_tm
fn step_149() -> Unit raise {
  bdry_target_tm_c.set(@term_syntax.parse_term("real_of_num(86400) * (pow(real_of_num((p : Num)), 30) * vv(p + 5, p + 5)) + (real_of_num(8078400) * (pow(real_of_num(p), 29) * vv(p + 5, p + 5)) + (real_of_num(362887200) * (pow(real_of_num(p), 28) * vv(p + 5, p + 5)) + (real_of_num(10428570000) * (pow(real_of_num(p), 27) * vv(p + 5, p + 5)) + (real_of_num(215392683600) * (pow(real_of_num(p), 26) * vv(p + 5, p + 5)) + (real_of_num(3405403544400) * (pow(real_of_num(p), 25) * vv(p + 5, p + 5)) + (real_of_num(42861452187600) * (pow(real_of_num(p), 24) * vv(p + 5, p + 5)) + (real_of_num(440966497496400) * (pow(real_of_num(p), 23) * vv(p + 5, p + 5)) + (real_of_num(3778529254779600) * (pow(real_of_num(p), 22) * vv(p + 5, p + 5)) + (real_of_num(27338261118368400) * (pow(real_of_num(p), 21) * vv(p + 5, p + 5)) + (real_of_num(168724467724827600) * (pow(real_of_num(p), 20) * vv(p + 5, p + 5)) + (real_of_num(895057507693364400) * (pow(real_of_num(p), 19) * vv(p + 5, p + 5)) + (real_of_num(4104216831896967600) * (pow(real_of_num(p), 18) * vv(p + 5, p + 5)) + (real_of_num(16332677083169564400) * (pow(real_of_num(p), 17) * vv(p + 5, p + 5)) + (real_of_num(56556428408403519600) * (pow(real_of_num(p), 16) * vv(p + 5, p + 5)) + (real_of_num(170659353088829228400) * (pow(real_of_num(p), 15) * vv(p + 5, p + 5)) + (real_of_num(448891109951332287600) * (pow(real_of_num(p), 14) * vv(p + 5, p + 5)) + (real_of_num(1028439709562976476400) * (pow(real_of_num(p), 13) * vv(p + 5, p + 5)) + (real_of_num(2048425921871487291600) * (pow(real_of_num(p), 12) * vv(p + 5, p + 5)) + (real_of_num(3536036211260748614400) * (pow(real_of_num(p), 11) * vv(p + 5, p + 5)) + (real_of_num(5266547855879921467200) * (pow(real_of_num(p), 10) * vv(p + 5, p + 5)) + (real_of_num(6726728254681418688000) * (pow(real_of_num(p), 9) * vv(p + 5, p + 5)) + (real_of_num(7308645420971257286400) * (pow(real_of_num(p), 8) * vv(p + 5, p + 5)) + (real_of_num(6683234045544602726400) * (pow(real_of_num(p), 7) * vv(p + 5, p + 5)) + (real_of_num(5070923003829241728000) * (pow(real_of_num(p), 6) * vv(p + 5, p + 5)) + (real_of_num(3131718550216865280000) * (pow(real_of_num(p), 5) * vv(p + 5, p + 5)) + (real_of_num(1532406867052032000000) * (pow(real_of_num(p), 4) * vv(p + 5, p + 5)) + (real_of_num(570965862021120000000) * (pow(real_of_num(p), 3) * vv(p + 5, p + 5)) + (real_of_num(152016410603520000000) * (pow(real_of_num(p), 2) * vv(p + 5, p + 5)) + (real_of_num(25730522726400000000) * (real_of_num(p) * vv(p + 5, p + 5)) + (real_of_num(2078244864000000000) * vv(p + 5, p + 5) + (real_of_num(86400) * (pow(real_of_num(p), 30) * vv(p + 5, p + 4)) + (real_of_num(8078400) * (pow(real_of_num(p), 29) * vv(p + 5, p + 4)) + (real_of_num(362887200) * (pow(real_of_num(p), 28) * vv(p + 5, p + 4)) + (real_of_num(10428570000) * (pow(real_of_num(p), 27) * vv(p + 5, p + 4)) + (real_of_num(215392683600) * (pow(real_of_num(p), 26) * vv(p + 5, p + 4)) + (real_of_num(3405403544400) * (pow(real_of_num(p), 25) * vv(p + 5, p + 4)) + (real_of_num(42861452187600) * (pow(real_of_num(p), 24) * vv(p + 5, p + 4)) + (real_of_num(440966497496400) * (pow(real_of_num(p), 23) * vv(p + 5, p + 4)) + (real_of_num(3778529254779600) * (pow(real_of_num(p), 22) * vv(p + 5, p + 4)) + (real_of_num(27338261118368400) * (pow(real_of_num(p), 21) * vv(p + 5, p + 4)) + (real_of_num(168724467724827600) * (pow(real_of_num(p), 20) * vv(p + 5, p + 4)) + (real_of_num(895057507693364400) * (pow(real_of_num(p), 19) * vv(p + 5, p + 4)) + (real_of_num(4104216831896967600) * (pow(real_of_num(p), 18) * vv(p + 5, p + 4)) + (real_of_num(16332677083169564400) * (pow(real_of_num(p), 17) * vv(p + 5, p + 4)) + (real_of_num(56556428408403519600) * (pow(real_of_num(p), 16) * vv(p + 5, p + 4)) + (real_of_num(170659353088829228400) * (pow(real_of_num(p), 15) * vv(p + 5, p + 4)) + (real_of_num(448891109951332287600) * (pow(real_of_num(p), 14) * vv(p + 5, p + 4)) + (real_of_num(1028439709562976476400) * (pow(real_of_num(p), 13) * vv(p + 5, p + 4)) + (real_of_num(2048425921871487291600) * (pow(real_of_num(p), 12) * vv(p + 5, p + 4)) + (real_of_num(3536036211260748614400) * (pow(real_of_num(p), 11) * vv(p + 5, p + 4)) + (real_of_num(5266547855879921467200) * (pow(real_of_num(p), 10) * vv(p + 5, p + 4)) + (real_of_num(6726728254681418688000) * (pow(real_of_num(p), 9) * vv(p + 5, p + 4)) + (real_of_num(7308645420971257286400) * (pow(real_of_num(p), 8) * vv(p + 5, p + 4)) + (real_of_num(6683234045544602726400) * (pow(real_of_num(p), 7) * vv(p + 5, p + 4)) + (real_of_num(5070923003829241728000) * (pow(real_of_num(p), 6) * vv(p + 5, p + 4)) + (real_of_num(3131718550216865280000) * (pow(real_of_num(p), 5) * vv(p + 5, p + 4)) + (real_of_num(1532406867052032000000) * (pow(real_of_num(p), 4) * vv(p + 5, p + 4)) + (real_of_num(570965862021120000000) * (pow(real_of_num(p), 3) * vv(p + 5, p + 4)) + (real_of_num(152016410603520000000) * (pow(real_of_num(p), 2) * vv(p + 5, p + 4)) + (real_of_num(25730522726400000000) * (real_of_num(p) * vv(p + 5, p + 4)) + (real_of_num(2078244864000000000) * vv(p + 5, p + 4) + (real_of_num(86400) * (pow(real_of_num(p), 30) * vv(p + 5, p + 3)) + (real_of_num(8078400) * (pow(real_of_num(p), 29) * vv(p + 5, p + 3)) + (real_of_num(362887200) * (pow(real_of_num(p), 28) * vv(p + 5, p + 3)) + (real_of_num(10428570000) * (pow(real_of_num(p), 27) * vv(p + 5, p + 3)) + (real_of_num(215392683600) * (pow(real_of_num(p), 26) * vv(p + 5, p + 3)) + (real_of_num(3405403544400) * (pow(real_of_num(p), 25) * vv(p + 5, p + 3)) + (real_of_num(42861452187600) * (pow(real_of_num(p), 24) * vv(p + 5, p + 3)) + (real_of_num(440966497496400) * (pow(real_of_num(p), 23) * vv(p + 5, p + 3)) + (real_of_num(3778529254779600) * (pow(real_of_num(p), 22) * vv(p + 5, p + 3)) + (real_of_num(27338261118368400) * (pow(real_of_num(p), 21) * vv(p + 5, p + 3)) + (real_of_num(168724467724827600) * (pow(real_of_num(p), 20) * vv(p + 5, p + 3)) + (real_of_num(895057507693364400) * (pow(real_of_num(p), 19) * vv(p + 5, p + 3)) + (real_of_num(4104216831896967600) * (pow(real_of_num(p), 18) * vv(p + 5, p + 3)) + (real_of_num(16332677083169564400) * (pow(real_of_num(p), 17) * vv(p + 5, p + 3)) + (real_of_num(56556428408403519600) * (pow(real_of_num(p), 16) * vv(p + 5, p + 3)) + (real_of_num(170659353088829228400) * (pow(real_of_num(p), 15) * vv(p + 5, p + 3)) + (real_of_num(448891109951332287600) * (pow(real_of_num(p), 14) * vv(p + 5, p + 3)) + (real_of_num(1028439709562976476400) * (pow(real_of_num(p), 13) * vv(p + 5, p + 3)) + (real_of_num(2048425921871487291600) * (pow(real_of_num(p), 12) * vv(p + 5, p + 3)) + (real_of_num(3536036211260748614400) * (pow(real_of_num(p), 11) * vv(p + 5, p + 3)) + (real_of_num(5266547855879921467200) * (pow(real_of_num(p), 10) * vv(p + 5, p + 3)) + (real_of_num(6726728254681418688000) * (pow(real_of_num(p), 9) * vv(p + 5, p + 3)) + (real_of_num(7308645420971257286400) * (pow(real_of_num(p), 8) * vv(p + 5, p + 3)) + (real_of_num(6683234045544602726400) * (pow(real_of_num(p), 7) * vv(p + 5, p + 3)) + (real_of_num(5070923003829241728000) * (pow(real_of_num(p), 6) * vv(p + 5, p + 3)) + (real_of_num(3131718550216865280000) * (pow(real_of_num(p), 5) * vv(p + 5, p + 3)) + (real_of_num(1532406867052032000000) * (pow(real_of_num(p), 4) * vv(p + 5, p + 3)) + (real_of_num(570965862021120000000) * (pow(real_of_num(p), 3) * vv(p + 5, p + 3)) + (real_of_num(152016410603520000000) * (pow(real_of_num(p), 2) * vv(p + 5, p + 3)) + (real_of_num(25730522726400000000) * (real_of_num(p) * vv(p + 5, p + 3)) + (real_of_num(2078244864000000000) * vv(p + 5, p + 3) + (real_of_num(86400) * (pow(real_of_num(p), 30) * vv(p + 5, p + 2)) + (real_of_num(8078400) * (pow(real_of_num(p), 29) * vv(p + 5, p + 2)) + (real_of_num(362887200) * (pow(real_of_num(p), 28) * vv(p + 5, p + 2)) + (real_of_num(10428570000) * (pow(real_of_num(p), 27) * vv(p + 5, p + 2)) + (real_of_num(215392683600) * (pow(real_of_num(p), 26) * vv(p + 5, p + 2)) + (real_of_num(3405403544400) * (pow(real_of_num(p), 25) * vv(p + 5, p + 2)) + (real_of_num(42861452187600) * (pow(real_of_num(p), 24) * vv(p + 5, p + 2)) + (real_of_num(440966497496400) * (pow(real_of_num(p), 23) * vv(p + 5, p + 2)) + (real_of_num(3778529254779600) * (pow(real_of_num(p), 22) * vv(p + 5, p + 2)) + (real_of_num(27338261118368400) * (pow(real_of_num(p), 21) * vv(p + 5, p + 2)) + (real_of_num(168724467724827600) * (pow(real_of_num(p), 20) * vv(p + 5, p + 2)) + (real_of_num(895057507693364400) * (pow(real_of_num(p), 19) * vv(p + 5, p + 2)) + (real_of_num(4104216831896967600) * (pow(real_of_num(p), 18) * vv(p + 5, p + 2)) + (real_of_num(16332677083169564400) * (pow(real_of_num(p), 17) * vv(p + 5, p + 2)) + (real_of_num(56556428408403519600) * (pow(real_of_num(p), 16) * vv(p + 5, p + 2)) + (real_of_num(170659353088829228400) * (pow(real_of_num(p), 15) * vv(p + 5, p + 2)) + (real_of_num(448891109951332287600) * (pow(real_of_num(p), 14) * vv(p + 5, p + 2)) + (real_of_num(1028439709562976476400) * (pow(real_of_num(p), 13) * vv(p + 5, p + 2)) + (real_of_num(2048425921871487291600) * (pow(real_of_num(p), 12) * vv(p + 5, p + 2)) + (real_of_num(3536036211260748614400) * (pow(real_of_num(p), 11) * vv(p + 5, p + 2)) + (real_of_num(5266547855879921467200) * (pow(real_of_num(p), 10) * vv(p + 5, p + 2)) + (real_of_num(6726728254681418688000) * (pow(real_of_num(p), 9) * vv(p + 5, p + 2)) + (real_of_num(7308645420971257286400) * (pow(real_of_num(p), 8) * vv(p + 5, p + 2)) + (real_of_num(6683234045544602726400) * (pow(real_of_num(p), 7) * vv(p + 5, p + 2)) + (real_of_num(5070923003829241728000) * (pow(real_of_num(p), 6) * vv(p + 5, p + 2)) + (real_of_num(3131718550216865280000) * (pow(real_of_num(p), 5) * vv(p + 5, p + 2)) + (real_of_num(1532406867052032000000) * (pow(real_of_num(p), 4) * vv(p + 5, p + 2)) + (real_of_num(570965862021120000000) * (pow(real_of_num(p), 3) * vv(p + 5, p + 2)) + (real_of_num(152016410603520000000) * (pow(real_of_num(p), 2) * vv(p + 5, p + 2)) + (real_of_num(25730522726400000000) * (real_of_num(p) * vv(p + 5, p + 2)) + (real_of_num(2078244864000000000) * vv(p + 5, p + 2) + (real_of_num(86400) * (pow(real_of_num(p), 30) * vv(p + 5, p + 1)) + (real_of_num(8078400) * (pow(real_of_num(p), 29) * vv(p + 5, p + 1)) + (real_of_num(362887200) * (pow(real_of_num(p), 28) * vv(p + 5, p + 1)) + (real_of_num(10428570000) * (pow(real_of_num(p), 27) * vv(p + 5, p + 1)) + (real_of_num(215392683600) * (pow(real_of_num(p), 26) * vv(p + 5, p + 1)) + (real_of_num(3405403544400) * (pow(real_of_num(p), 25) * vv(p + 5, p + 1)) + (real_of_num(42861452187600) * (pow(real_of_num(p), 24) * vv(p + 5, p + 1)) + (real_of_num(440966497496400) * (pow(real_of_num(p), 23) * vv(p + 5, p + 1)) + (real_of_num(3778529254779600) * (pow(real_of_num(p), 22) * vv(p + 5, p + 1)) + (real_of_num(27338261118368400) * (pow(real_of_num(p), 21) * vv(p + 5, p + 1)) + (real_of_num(168724467724827600) * (pow(real_of_num(p), 20) * vv(p + 5, p + 1)) + (real_of_num(895057507693364400) * (pow(real_of_num(p), 19) * vv(p + 5, p + 1)) + (real_of_num(4104216831896967600) * (pow(real_of_num(p), 18) * vv(p + 5, p + 1)) + (real_of_num(16332677083169564400) * (pow(real_of_num(p), 17) * vv(p + 5, p + 1)) + (real_of_num(56556428408403519600) * (pow(real_of_num(p), 16) * vv(p + 5, p + 1)) + (real_of_num(170659353088829228400) * (pow(real_of_num(p), 15) * vv(p + 5, p + 1)) + (real_of_num(448891109951332287600) * (pow(real_of_num(p), 14) * vv(p + 5, p + 1)) + (real_of_num(1028439709562976476400) * (pow(real_of_num(p), 13) * vv(p + 5, p + 1)) + (real_of_num(2048425921871487291600) * (pow(real_of_num(p), 12) * vv(p + 5, p + 1)) + (real_of_num(3536036211260748614400) * (pow(real_of_num(p), 11) * vv(p + 5, p + 1)) + (real_of_num(5266547855879921467200) * (pow(real_of_num(p), 10) * vv(p + 5, p + 1)) + (real_of_num(6726728254681418688000) * (pow(real_of_num(p), 9) * vv(p + 5, p + 1)) + (real_of_num(7308645420971257286400) * (pow(real_of_num(p), 8) * vv(p + 5, p + 1)) + (real_of_num(6683234045544602726400) * (pow(real_of_num(p), 7) * vv(p + 5, p + 1)) + (real_of_num(5070923003829241728000) * (pow(real_of_num(p), 6) * vv(p + 5, p + 1)) + (real_of_num(3131718550216865280000) * (pow(real_of_num(p), 5) * vv(p + 5, p + 1)) + (real_of_num(1532406867052032000000) * (pow(real_of_num(p), 4) * vv(p + 5, p + 1)) + (real_of_num(570965862021120000000) * (pow(real_of_num(p), 3) * vv(p + 5, p + 1)) + (real_of_num(152016410603520000000) * (pow(real_of_num(p), 2) * vv(p + 5, p + 1)) + (real_of_num(25730522726400000000) * (real_of_num(p) * vv(p + 5, p + 1)) + (real_of_num(2078244864000000000) * vv(p + 5, p + 1) + (real_of_num(86400) * (pow(real_of_num(p), 30) * vv(p + 5, p)) + (real_of_num(8078400) * (pow(real_of_num(p), 29) * vv(p + 5, p)) + (real_of_num(362887200) * (pow(real_of_num(p), 28) * vv(p + 5, p)) + (real_of_num(10428570000) * (pow(real_of_num(p), 27) * vv(p + 5, p)) + (real_of_num(215392683600) * (pow(real_of_num(p), 26) * vv(p + 5, p)) + (real_of_num(3405403544400) * (pow(real_of_num(p), 25) * vv(p + 5, p)) + (real_of_num(42861452187600) * (pow(real_of_num(p), 24) * vv(p + 5, p)) + (real_of_num(440966497496400) * (pow(real_of_num(p), 23) * vv(p + 5, p)) + (real_of_num(3778529254779600) * (pow(real_of_num(p), 22) * vv(p + 5, p)) + (real_of_num(27338261118368400) * (pow(real_of_num(p), 21) * vv(p + 5, p)) + (real_of_num(168724467724827600) * (pow(real_of_num(p), 20) * vv(p + 5, p)) + (real_of_num(895057507693364400) * (pow(real_of_num(p), 19) * vv(p + 5, p)) + (real_of_num(4104216831896967600) * (pow(real_of_num(p), 18) * vv(p + 5, p)) + (real_of_num(16332677083169564400) * (pow(real_of_num(p), 17) * vv(p + 5, p)) + (real_of_num(56556428408403519600) * (pow(real_of_num(p), 16) * vv(p + 5, p)) + (real_of_num(170659353088829228400) * (pow(real_of_num(p), 15) * vv(p + 5, p)) + (real_of_num(448891109951332287600) * (pow(real_of_num(p), 14) * vv(p + 5, p)) + (real_of_num(1028439709562976476400) * (pow(real_of_num(p), 13) * vv(p + 5, p)) + (real_of_num(2048425921871487291600) * (pow(real_of_num(p), 12) * vv(p + 5, p)) + (real_of_num(3536036211260748614400) * (pow(real_of_num(p), 11) * vv(p + 5, p)) + (real_of_num(5266547855879921467200) * (pow(real_of_num(p), 10) * vv(p + 5, p)) + (real_of_num(6726728254681418688000) * (pow(real_of_num(p), 9) * vv(p + 5, p)) + (real_of_num(7308645420971257286400) * (pow(real_of_num(p), 8) * vv(p + 5, p)) + (real_of_num(6683234045544602726400) * (pow(real_of_num(p), 7) * vv(p + 5, p)) + (real_of_num(5070923003829241728000) * (pow(real_of_num(p), 6) * vv(p + 5, p)) + (real_of_num(3131718550216865280000) * (pow(real_of_num(p), 5) * vv(p + 5, p)) + (real_of_num(1532406867052032000000) * (pow(real_of_num(p), 4) * vv(p + 5, p)) + (real_of_num(570965862021120000000) * (pow(real_of_num(p), 3) * vv(p + 5, p)) + (real_of_num(152016410603520000000) * (pow(real_of_num(p), 2) * vv(p + 5, p)) + (real_of_num(25730522726400000000) * (real_of_num(p) * vv(p + 5, p)) + (real_of_num(2078244864000000000) * vv(p + 5, p) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 4, p + 4)) - real_of_num(531705600) * (pow(real_of_num(p), 29) * vv(p + 4, p + 4)) - real_of_num(23143161600) * (pow(real_of_num(p), 28) * vv(p + 4, p + 4)) - real_of_num(645118344000) * (pow(real_of_num(p), 27) * vv(p + 4, p + 4)) - real_of_num(12937723063200) * (pow(real_of_num(p), 26) * vv(p + 4, p + 4)) - real_of_num(198813883658400) * (pow(real_of_num(p), 25) * vv(p + 4, p + 4)) - real_of_num(2434588099596000) * (pow(real_of_num(p), 24) * vv(p + 4, p + 4)) - real_of_num(24392951581460400) * (pow(real_of_num(p), 23) * vv(p + 4, p + 4)) - real_of_num(203747287422438000) * (pow(real_of_num(p), 22) * vv(p + 4, p + 4)) - real_of_num(1438304928191420400) * (pow(real_of_num(p), 21) * vv(p + 4, p + 4)) - real_of_num(8668833730765808400) * (pow(real_of_num(p), 20) * vv(p + 4, p + 4)) - real_of_num(44948837666429517600) * (pow(real_of_num(p), 19) * vv(p + 4, p + 4)) - real_of_num(201630497138837870400) * (pow(real_of_num(p), 18) * vv(p + 4, p + 4)) - real_of_num(785609015217746025600) * (pow(real_of_num(p), 17) * vv(p + 4, p + 4)) - real_of_num(2665695137627519942400) * (pow(real_of_num(p), 16) * vv(p + 4, p + 4)) - real_of_num(7888347224039849295600) * (pow(real_of_num(p), 15) * vv(p + 4, p + 4)) - real_of_num(20364058389551739692400) * (pow(real_of_num(p), 14) * vv(p + 4, p + 4)) - real_of_num(45824930112674566479600) * (pow(real_of_num(p), 13) * vv(p + 4, p + 4)) - real_of_num(89715535994909135120400) * (pow(real_of_num(p), 12) * vv(p + 4, p + 4)) - real_of_num(152337250801809675993600) * (pow(real_of_num(p), 11) * vv(p + 4, p + 4)) - real_of_num(223340858390707585243200) * (pow(real_of_num(p), 10) * vv(p + 4, p + 4)) - real_of_num(280997791316050973760000) * (pow(real_of_num(p), 9) * vv(p + 4, p + 4)) - real_of_num(300947436653714406316800) * (pow(real_of_num(p), 8) * vv(p + 4, p + 4)) - real_of_num(271448229099226849689600) * (pow(real_of_num(p), 7) * vv(p + 4, p + 4)) - real_of_num(203291888645926062259200) * (pow(real_of_num(p), 6) * vv(p + 4, p + 4)) - real_of_num(124002094822877552947200) * (pow(real_of_num(p), 5) * vv(p + 4, p + 4)) - real_of_num(59966518938292688486400) * (pow(real_of_num(p), 4) * vv(p + 4, p + 4)) - real_of_num(22095468783012475699200) * (pow(real_of_num(p), 3) * vv(p + 4, p + 4)) - real_of_num(5821117997491283558400) * (pow(real_of_num(p), 2) * vv(p + 4, p + 4)) - real_of_num(975542934487774003200) * (real_of_num(p) * vv(p + 4, p + 4)) - real_of_num(78060170476781568000) * vv(p + 4, p + 4) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 4, p + 3)) - real_of_num(531705600) * (pow(real_of_num(p), 29) * vv(p + 4, p + 3)) - real_of_num(23143161600) * (pow(real_of_num(p), 28) * vv(p + 4, p + 3)) - real_of_num(645118344000) * (pow(real_of_num(p), 27) * vv(p + 4, p + 3)) - real_of_num(12937723063200) * (pow(real_of_num(p), 26) * vv(p + 4, p + 3)) - real_of_num(198813883658400) * (pow(real_of_num(p), 25) * vv(p + 4, p + 3)) - real_of_num(2434588099596000) * (pow(real_of_num(p), 24) * vv(p + 4, p + 3)) - real_of_num(24392951581460400) * (pow(real_of_num(p), 23) * vv(p + 4, p + 3)) - real_of_num(203747287422438000) * (pow(real_of_num(p), 22) * vv(p + 4, p + 3)) - real_of_num(1438304928191420400) * (pow(real_of_num(p), 21) * vv(p + 4, p + 3)) - real_of_num(8668833730765808400) * (pow(real_of_num(p), 20) * vv(p + 4, p + 3)) - real_of_num(44948837666429517600) * (pow(real_of_num(p), 19) * vv(p + 4, p + 3)) - real_of_num(201630497138837870400) * (pow(real_of_num(p), 18) * vv(p + 4, p + 3)) - real_of_num(785609015217746025600) * (pow(real_of_num(p), 17) * vv(p + 4, p + 3)) - real_of_num(2665695137627519942400) * (pow(real_of_num(p), 16) * vv(p + 4, p + 3)) - real_of_num(7888347224039849295600) * (pow(real_of_num(p), 15) * vv(p + 4, p + 3)) - real_of_num(20364058389551739692400) * (pow(real_of_num(p), 14) * vv(p + 4, p + 3)) - real_of_num(45824930112674566479600) * (pow(real_of_num(p), 13) * vv(p + 4, p + 3)) - real_of_num(89715535994909135120400) * (pow(real_of_num(p), 12) * vv(p + 4, p + 3)) - real_of_num(152337250801809675993600) * (pow(real_of_num(p), 11) * vv(p + 4, p + 3)) - real_of_num(223340858390707585243200) * (pow(real_of_num(p), 10) * vv(p + 4, p + 3)) - real_of_num(280997791316050973760000) * (pow(real_of_num(p), 9) * vv(p + 4, p + 3)) - real_of_num(300947436653714406316800) * (pow(real_of_num(p), 8) * vv(p + 4, p + 3)) - real_of_num(271448229099226849689600) * (pow(real_of_num(p), 7) * vv(p + 4, p + 3)) - real_of_num(203291888645926062259200) * (pow(real_of_num(p), 6) * vv(p + 4, p + 3)) - real_of_num(124002094822877552947200) * (pow(real_of_num(p), 5) * vv(p + 4, p + 3)) - real_of_num(59966518938292688486400) * (pow(real_of_num(p), 4) * vv(p + 4, p + 3)) - real_of_num(22095468783012475699200) * (pow(real_of_num(p), 3) * vv(p + 4, p + 3)) - real_of_num(5821117997491283558400) * (pow(real_of_num(p), 2) * vv(p + 4, p + 3)) - real_of_num(975542934487774003200) * (real_of_num(p) * vv(p + 4, p + 3)) - real_of_num(78060170476781568000) * vv(p + 4, p + 3) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 4, p + 2)) - real_of_num(531705600) * (pow(real_of_num(p), 29) * vv(p + 4, p + 2)) - real_of_num(23143161600) * (pow(real_of_num(p), 28) * vv(p + 4, p + 2)) - real_of_num(645118344000) * (pow(real_of_num(p), 27) * vv(p + 4, p + 2)) - real_of_num(12937723063200) * (pow(real_of_num(p), 26) * vv(p + 4, p + 2)) - real_of_num(198813883658400) * (pow(real_of_num(p), 25) * vv(p + 4, p + 2)) - real_of_num(2434588099596000) * (pow(real_of_num(p), 24) * vv(p + 4, p + 2)) - real_of_num(24392951581460400) * (pow(real_of_num(p), 23) * vv(p + 4, p + 2)) - real_of_num(203747287422438000) * (pow(real_of_num(p), 22) * vv(p + 4, p + 2)) - real_of_num(1438304928191420400) * (pow(real_of_num(p), 21) * vv(p + 4, p + 2)) - real_of_num(8668833730765808400) * (pow(real_of_num(p), 20) * vv(p + 4, p + 2)) - real_of_num(44948837666429517600) * (pow(real_of_num(p), 19) * vv(p + 4, p + 2)) - real_of_num(201630497138837870400) * (pow(real_of_num(p), 18) * vv(p + 4, p + 2)) - real_of_num(785609015217746025600) * (pow(real_of_num(p), 17) * vv(p + 4, p + 2)) - real_of_num(2665695137627519942400) * (pow(real_of_num(p), 16) * vv(p + 4, p + 2)) - real_of_num(7888347224039849295600) * (pow(real_of_num(p), 15) * vv(p + 4, p + 2)) - real_of_num(20364058389551739692400) * (pow(real_of_num(p), 14) * vv(p + 4, p + 2)) - real_of_num(45824930112674566479600) * (pow(real_of_num(p), 13) * vv(p + 4, p + 2)) - real_of_num(89715535994909135120400) * (pow(real_of_num(p), 12) * vv(p + 4, p + 2)) - real_of_num(152337250801809675993600) * (pow(real_of_num(p), 11) * vv(p + 4, p + 2)) - real_of_num(223340858390707585243200) * (pow(real_of_num(p), 10) * vv(p + 4, p + 2)) - real_of_num(280997791316050973760000) * (pow(real_of_num(p), 9) * vv(p + 4, p + 2)) - real_of_num(300947436653714406316800) * (pow(real_of_num(p), 8) * vv(p + 4, p + 2)) - real_of_num(271448229099226849689600) * (pow(real_of_num(p), 7) * vv(p + 4, p + 2)) - real_of_num(203291888645926062259200) * (pow(real_of_num(p), 6) * vv(p + 4, p + 2)) - real_of_num(124002094822877552947200) * (pow(real_of_num(p), 5) * vv(p + 4, p + 2)) - real_of_num(59966518938292688486400) * (pow(real_of_num(p), 4) * vv(p + 4, p + 2)) - real_of_num(22095468783012475699200) * (pow(real_of_num(p), 3) * vv(p + 4, p + 2)) - real_of_num(5821117997491283558400) * (pow(real_of_num(p), 2) * vv(p + 4, p + 2)) - real_of_num(975542934487774003200) * (real_of_num(p) * vv(p + 4, p + 2)) - real_of_num(78060170476781568000) * vv(p + 4, p + 2) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 4, p + 1)) - real_of_num(531705600) * (pow(real_of_num(p), 29) * vv(p + 4, p + 1)) - real_of_num(23143161600) * (pow(real_of_num(p), 28) * vv(p + 4, p + 1)) - real_of_num(645118344000) * (pow(real_of_num(p), 27) * vv(p + 4, p + 1)) - real_of_num(12937723063200) * (pow(real_of_num(p), 26) * vv(p + 4, p + 1)) - real_of_num(198813883658400) * (pow(real_of_num(p), 25) * vv(p + 4, p + 1)) - real_of_num(2434588099596000) * (pow(real_of_num(p), 24) * vv(p + 4, p + 1)) - real_of_num(24392951581460400) * (pow(real_of_num(p), 23) * vv(p + 4, p + 1)) - real_of_num(203747287422438000) * (pow(real_of_num(p), 22) * vv(p + 4, p + 1)) - real_of_num(1438304928191420400) * (pow(real_of_num(p), 21) * vv(p + 4, p + 1)) - real_of_num(8668833730765808400) * (pow(real_of_num(p), 20) * vv(p + 4, p + 1)) - real_of_num(44948837666429517600) * (pow(real_of_num(p), 19) * vv(p + 4, p + 1)) - real_of_num(201630497138837870400) * (pow(real_of_num(p), 18) * vv(p + 4, p + 1)) - real_of_num(785609015217746025600) * (pow(real_of_num(p), 17) * vv(p + 4, p + 1)) - real_of_num(2665695137627519942400) * (pow(real_of_num(p), 16) * vv(p + 4, p + 1)) - real_of_num(7888347224039849295600) * (pow(real_of_num(p), 15) * vv(p + 4, p + 1)) - real_of_num(20364058389551739692400) * (pow(real_of_num(p), 14) * vv(p + 4, p + 1)) - real_of_num(45824930112674566479600) * (pow(real_of_num(p), 13) * vv(p + 4, p + 1)) - real_of_num(89715535994909135120400) * (pow(real_of_num(p), 12) * vv(p + 4, p + 1)) - real_of_num(152337250801809675993600) * (pow(real_of_num(p), 11) * vv(p + 4, p + 1)) - real_of_num(223340858390707585243200) * (pow(real_of_num(p), 10) * vv(p + 4, p + 1)) - real_of_num(280997791316050973760000) * (pow(real_of_num(p), 9) * vv(p + 4, p + 1)) - real_of_num(300947436653714406316800) * (pow(real_of_num(p), 8) * vv(p + 4, p + 1)) - real_of_num(271448229099226849689600) * (pow(real_of_num(p), 7) * vv(p + 4, p + 1)) - real_of_num(203291888645926062259200) * (pow(real_of_num(p), 6) * vv(p + 4, p + 1)) - real_of_num(124002094822877552947200) * (pow(real_of_num(p), 5) * vv(p + 4, p + 1)) - real_of_num(59966518938292688486400) * (pow(real_of_num(p), 4) * vv(p + 4, p + 1)) - real_of_num(22095468783012475699200) * (pow(real_of_num(p), 3) * vv(p + 4, p + 1)) - real_of_num(5821117997491283558400) * (pow(real_of_num(p), 2) * vv(p + 4, p + 1)) - real_of_num(975542934487774003200) * (real_of_num(p) * vv(p + 4, p + 1)) - real_of_num(78060170476781568000) * vv(p + 4, p + 1) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 4, p)) - real_of_num(531705600) * (pow(real_of_num(p), 29) * vv(p + 4, p)) - real_of_num(23143161600) * (pow(real_of_num(p), 28) * vv(p + 4, p)) - real_of_num(645118344000) * (pow(real_of_num(p), 27) * vv(p + 4, p)) - real_of_num(12937723063200) * (pow(real_of_num(p), 26) * vv(p + 4, p)) - real_of_num(198813883658400) * (pow(real_of_num(p), 25) * vv(p + 4, p)) - real_of_num(2434588099596000) * (pow(real_of_num(p), 24) * vv(p + 4, p)) - real_of_num(24392951581460400) * (pow(real_of_num(p), 23) * vv(p + 4, p)) - real_of_num(203747287422438000) * (pow(real_of_num(p), 22) * vv(p + 4, p)) - real_of_num(1438304928191420400) * (pow(real_of_num(p), 21) * vv(p + 4, p)) - real_of_num(8668833730765808400) * (pow(real_of_num(p), 20) * vv(p + 4, p)) - real_of_num(44948837666429517600) * (pow(real_of_num(p), 19) * vv(p + 4, p)) - real_of_num(201630497138837870400) * (pow(real_of_num(p), 18) * vv(p + 4, p)) - real_of_num(785609015217746025600) * (pow(real_of_num(p), 17) * vv(p + 4, p)) - real_of_num(2665695137627519942400) * (pow(real_of_num(p), 16) * vv(p + 4, p)) - real_of_num(7888347224039849295600) * (pow(real_of_num(p), 15) * vv(p + 4, p)) - real_of_num(20364058389551739692400) * (pow(real_of_num(p), 14) * vv(p + 4, p)) - real_of_num(45824930112674566479600) * (pow(real_of_num(p), 13) * vv(p + 4, p)) - real_of_num(89715535994909135120400) * (pow(real_of_num(p), 12) * vv(p + 4, p)) - real_of_num(152337250801809675993600) * (pow(real_of_num(p), 11) * vv(p + 4, p)) - real_of_num(223340858390707585243200) * (pow(real_of_num(p), 10) * vv(p + 4, p)) - real_of_num(280997791316050973760000) * (pow(real_of_num(p), 9) * vv(p + 4, p)) - real_of_num(300947436653714406316800) * (pow(real_of_num(p), 8) * vv(p + 4, p)) - real_of_num(271448229099226849689600) * (pow(real_of_num(p), 7) * vv(p + 4, p)) - real_of_num(203291888645926062259200) * (pow(real_of_num(p), 6) * vv(p + 4, p)) - real_of_num(124002094822877552947200) * (pow(real_of_num(p), 5) * vv(p + 4, p)) - real_of_num(59966518938292688486400) * (pow(real_of_num(p), 4) * vv(p + 4, p)) - real_of_num(22095468783012475699200) * (pow(real_of_num(p), 3) * vv(p + 4, p)) - real_of_num(5821117997491283558400) * (pow(real_of_num(p), 2) * vv(p + 4, p)) - real_of_num(975542934487774003200) * (real_of_num(p) * vv(p + 4, p)) - real_of_num(78060170476781568000) * vv(p + 4, p) + (real_of_num(100051200) * (pow(real_of_num(p), 30) * vv(p + 3, p + 3)) + (real_of_num(8754480000) * (pow(real_of_num(p), 29) * vv(p + 3, p + 3)) + (real_of_num(368531121600) * (pow(real_of_num(p), 28) * vv(p + 3, p + 3)) + (real_of_num(9938659672800) * (pow(real_of_num(p), 27) * vv(p + 3, p + 3)) + (real_of_num(192903118509600) * (pow(real_of_num(p), 26) * vv(p + 3, p + 3)) + (real_of_num(2870042040460800) * (pow(real_of_num(p), 25) * vv(p + 3, p + 3)) + (real_of_num(34041230378229600) * (pow(real_of_num(p), 24) * vv(p + 3, p + 3)) + (real_of_num(330499602498906000) * (pow(real_of_num(p), 23) * vv(p + 3, p + 3)) + (real_of_num(2676234486822346800) * (pow(real_of_num(p), 22) * vv(p + 3, p + 3)) + (real_of_num(18323900138719414800) * (pow(real_of_num(p), 21) * vv(p + 3, p + 3)) + (real_of_num(107171867178462949200) * (pow(real_of_num(p), 20) * vv(p + 3, p + 3)) + (real_of_num(539535096905776272000) * (pow(real_of_num(p), 19) * vv(p + 3, p + 3)) + (real_of_num(2351124315094488696000) * (pow(real_of_num(p), 18) * vv(p + 3, p + 3)) + (real_of_num(8904095421382345428000) * (pow(real_of_num(p), 17) * vv(p + 3, p + 3)) + (real_of_num(29384085997286989920000) * (pow(real_of_num(p), 16) * vv(p + 3, p + 3)) + (real_of_num(84619170854511220746000) * (pow(real_of_num(p), 15) * vv(p + 3, p + 3)) + (real_of_num(212715365862162701214000) * (pow(real_of_num(p), 14) * vv(p + 3, p + 3)) + (real_of_num(466408774454909389074000) * (pow(real_of_num(p), 13) * vv(p + 3, p + 3)) + (real_of_num(890326223697581454330000) * (pow(real_of_num(p), 12) * vv(p + 3, p + 3)) + (real_of_num(1475020089467688277728000) * (pow(real_of_num(p), 11) * vv(p + 3, p + 3)) + (real_of_num(2111403896600435550244800) * (pow(real_of_num(p), 10) * vv(p + 3, p + 3)) + (real_of_num(2595526711983247684320000) * (pow(real_of_num(p), 9) * vv(p + 3, p + 3)) + (real_of_num(2717989800773944583750400) * (pow(real_of_num(p), 8) * vv(p + 3, p + 3)) + (real_of_num(2398836674899685209651200) * (pow(real_of_num(p), 7) * vv(p + 3, p + 3)) + (real_of_num(1759214135097125512934400) * (pow(real_of_num(p), 6) * vv(p + 3, p + 3)) + (real_of_num(1051592446215753746227200) * (pow(real_of_num(p), 5) * vv(p + 3, p + 3)) + (real_of_num(498755575720787082854400) * (pow(real_of_num(p), 4) * vv(p + 3, p + 3)) + (real_of_num(180380146074985857024000) * (pow(real_of_num(p), 3) * vv(p + 3, p + 3)) + (real_of_num(46681981418812126003200) * (pow(real_of_num(p), 2) * vv(p + 3, p + 3)) + (real_of_num(7691324341654860595200) * (real_of_num(p) * vv(p + 3, p + 3)) + (real_of_num(605554271057136844800) * vv(p + 3, p + 3) + (real_of_num(100051200) * (pow(real_of_num(p), 30) * vv(p + 3, p + 2)) + (real_of_num(8754480000) * (pow(real_of_num(p), 29) * vv(p + 3, p + 2)) + (real_of_num(368531121600) * (pow(real_of_num(p), 28) * vv(p + 3, p + 2)) + (real_of_num(9938659672800) * (pow(real_of_num(p), 27) * vv(p + 3, p + 2)) + (real_of_num(192903118509600) * (pow(real_of_num(p), 26) * vv(p + 3, p + 2)) + (real_of_num(2870042040460800) * (pow(real_of_num(p), 25) * vv(p + 3, p + 2)) + (real_of_num(34041230378229600) * (pow(real_of_num(p), 24) * vv(p + 3, p + 2)) + (real_of_num(330499602498906000) * (pow(real_of_num(p), 23) * vv(p + 3, p + 2)) + (real_of_num(2676234486822346800) * (pow(real_of_num(p), 22) * vv(p + 3, p + 2)) + (real_of_num(18323900138719414800) * (pow(real_of_num(p), 21) * vv(p + 3, p + 2)) + (real_of_num(107171867178462949200) * (pow(real_of_num(p), 20) * vv(p + 3, p + 2)) + (real_of_num(539535096905776272000) * (pow(real_of_num(p), 19) * vv(p + 3, p + 2)) + (real_of_num(2351124315094488696000) * (pow(real_of_num(p), 18) * vv(p + 3, p + 2)) + (real_of_num(8904095421382345428000) * (pow(real_of_num(p), 17) * vv(p + 3, p + 2)) + (real_of_num(29384085997286989920000) * (pow(real_of_num(p), 16) * vv(p + 3, p + 2)) + (real_of_num(84619170854511220746000) * (pow(real_of_num(p), 15) * vv(p + 3, p + 2)) + (real_of_num(212715365862162701214000) * (pow(real_of_num(p), 14) * vv(p + 3, p + 2)) + (real_of_num(466408774454909389074000) * (pow(real_of_num(p), 13) * vv(p + 3, p + 2)) + (real_of_num(890326223697581454330000) * (pow(real_of_num(p), 12) * vv(p + 3, p + 2)) + (real_of_num(1475020089467688277728000) * (pow(real_of_num(p), 11) * vv(p + 3, p + 2)) + (real_of_num(2111403896600435550244800) * (pow(real_of_num(p), 10) * vv(p + 3, p + 2)) + (real_of_num(2595526711983247684320000) * (pow(real_of_num(p), 9) * vv(p + 3, p + 2)) + (real_of_num(2717989800773944583750400) * (pow(real_of_num(p), 8) * vv(p + 3, p + 2)) + (real_of_num(2398836674899685209651200) * (pow(real_of_num(p), 7) * vv(p + 3, p + 2)) + (real_of_num(1759214135097125512934400) * (pow(real_of_num(p), 6) * vv(p + 3, p + 2)) + (real_of_num(1051592446215753746227200) * (pow(real_of_num(p), 5) * vv(p + 3, p + 2)) + (real_of_num(498755575720787082854400) * (pow(real_of_num(p), 4) * vv(p + 3, p + 2)) + (real_of_num(180380146074985857024000) * (pow(real_of_num(p), 3) * vv(p + 3, p + 2)) + (real_of_num(46681981418812126003200) * (pow(real_of_num(p), 2) * vv(p + 3, p + 2)) + (real_of_num(7691324341654860595200) * (real_of_num(p) * vv(p + 3, p + 2)) + (real_of_num(605554271057136844800) * vv(p + 3, p + 2) + (real_of_num(100051200) * (pow(real_of_num(p), 30) * vv(p + 3, p + 1)) + (real_of_num(8754480000) * (pow(real_of_num(p), 29) * vv(p + 3, p + 1)) + (real_of_num(368531121600) * (pow(real_of_num(p), 28) * vv(p + 3, p + 1)) + (real_of_num(9938659672800) * (pow(real_of_num(p), 27) * vv(p + 3, p + 1)) + (real_of_num(192903118509600) * (pow(real_of_num(p), 26) * vv(p + 3, p + 1)) + (real_of_num(2870042040460800) * (pow(real_of_num(p), 25) * vv(p + 3, p + 1)) + (real_of_num(34041230378229600) * (pow(real_of_num(p), 24) * vv(p + 3, p + 1)) + (real_of_num(330499602498906000) * (pow(real_of_num(p), 23) * vv(p + 3, p + 1)) + (real_of_num(2676234486822346800) * (pow(real_of_num(p), 22) * vv(p + 3, p + 1)) + (real_of_num(18323900138719414800) * (pow(real_of_num(p), 21) * vv(p + 3, p + 1)) + (real_of_num(107171867178462949200) * (pow(real_of_num(p), 20) * vv(p + 3, p + 1)) + (real_of_num(539535096905776272000) * (pow(real_of_num(p), 19) * vv(p + 3, p + 1)) + (real_of_num(2351124315094488696000) * (pow(real_of_num(p), 18) * vv(p + 3, p + 1)) + (real_of_num(8904095421382345428000) * (pow(real_of_num(p), 17) * vv(p + 3, p + 1)) + (real_of_num(29384085997286989920000) * (pow(real_of_num(p), 16) * vv(p + 3, p + 1)) + (real_of_num(84619170854511220746000) * (pow(real_of_num(p), 15) * vv(p + 3, p + 1)) + (real_of_num(212715365862162701214000) * (pow(real_of_num(p), 14) * vv(p + 3, p + 1)) + (real_of_num(466408774454909389074000) * (pow(real_of_num(p), 13) * vv(p + 3, p + 1)) + (real_of_num(890326223697581454330000) * (pow(real_of_num(p), 12) * vv(p + 3, p + 1)) + (real_of_num(1475020089467688277728000) * (pow(real_of_num(p), 11) * vv(p + 3, p + 1)) + (real_of_num(2111403896600435550244800) * (pow(real_of_num(p), 10) * vv(p + 3, p + 1)) + (real_of_num(2595526711983247684320000) * (pow(real_of_num(p), 9) * vv(p + 3, p + 1)) + (real_of_num(2717989800773944583750400) * (pow(real_of_num(p), 8) * vv(p + 3, p + 1)) + (real_of_num(2398836674899685209651200) * (pow(real_of_num(p), 7) * vv(p + 3, p + 1)) + (real_of_num(1759214135097125512934400) * (pow(real_of_num(p), 6) * vv(p + 3, p + 1)) + (real_of_num(1051592446215753746227200) * (pow(real_of_num(p), 5) * vv(p + 3, p + 1)) + (real_of_num(498755575720787082854400) * (pow(real_of_num(p), 4) * vv(p + 3, p + 1)) + (real_of_num(180380146074985857024000) * (pow(real_of_num(p), 3) * vv(p + 3, p + 1)) + (real_of_num(46681981418812126003200) * (pow(real_of_num(p), 2) * vv(p + 3, p + 1)) + (real_of_num(7691324341654860595200) * (real_of_num(p) * vv(p + 3, p + 1)) + (real_of_num(605554271057136844800) * vv(p + 3, p + 1) + (real_of_num(100051200) * (pow(real_of_num(p), 30) * vv(p + 3, p)) + (real_of_num(8754480000) * (pow(real_of_num(p), 29) * vv(p + 3, p)) + (real_of_num(368531121600) * (pow(real_of_num(p), 28) * vv(p + 3, p)) + (real_of_num(9938659672800) * (pow(real_of_num(p), 27) * vv(p + 3, p)) + (real_of_num(192903118509600) * (pow(real_of_num(p), 26) * vv(p + 3, p)) + (real_of_num(2870042040460800) * (pow(real_of_num(p), 25) * vv(p + 3, p)) + (real_of_num(34041230378229600) * (pow(real_of_num(p), 24) * vv(p + 3, p)) + (real_of_num(330499602498906000) * (pow(real_of_num(p), 23) * vv(p + 3, p)) + (real_of_num(2676234486822346800) * (pow(real_of_num(p), 22) * vv(p + 3, p)) + (real_of_num(18323900138719414800) * (pow(real_of_num(p), 21) * vv(p + 3, p)) + (real_of_num(107171867178462949200) * (pow(real_of_num(p), 20) * vv(p + 3, p)) + (real_of_num(539535096905776272000) * (pow(real_of_num(p), 19) * vv(p + 3, p)) + (real_of_num(2351124315094488696000) * (pow(real_of_num(p), 18) * vv(p + 3, p)) + (real_of_num(8904095421382345428000) * (pow(real_of_num(p), 17) * vv(p + 3, p)) + (real_of_num(29384085997286989920000) * (pow(real_of_num(p), 16) * vv(p + 3, p)) + (real_of_num(84619170854511220746000) * (pow(real_of_num(p), 15) * vv(p + 3, p)) + (real_of_num(212715365862162701214000) * (pow(real_of_num(p), 14) * vv(p + 3, p)) + (real_of_num(466408774454909389074000) * (pow(real_of_num(p), 13) * vv(p + 3, p)) + (real_of_num(890326223697581454330000) * (pow(real_of_num(p), 12) * vv(p + 3, p)) + (real_of_num(1475020089467688277728000) * (pow(real_of_num(p), 11) * vv(p + 3, p)) + (real_of_num(2111403896600435550244800) * (pow(real_of_num(p), 10) * vv(p + 3, p)) + (real_of_num(2595526711983247684320000) * (pow(real_of_num(p), 9) * vv(p + 3, p)) + (real_of_num(2717989800773944583750400) * (pow(real_of_num(p), 8) * vv(p + 3, p)) + (real_of_num(2398836674899685209651200) * (pow(real_of_num(p), 7) * vv(p + 3, p)) + (real_of_num(1759214135097125512934400) * (pow(real_of_num(p), 6) * vv(p + 3, p)) + (real_of_num(1051592446215753746227200) * (pow(real_of_num(p), 5) * vv(p + 3, p)) + (real_of_num(498755575720787082854400) * (pow(real_of_num(p), 4) * vv(p + 3, p)) + (real_of_num(180380146074985857024000) * (pow(real_of_num(p), 3) * vv(p + 3, p)) + (real_of_num(46681981418812126003200) * (pow(real_of_num(p), 2) * vv(p + 3, p)) + (real_of_num(7691324341654860595200) * (real_of_num(p) * vv(p + 3, p)) + (real_of_num(605554271057136844800) * vv(p + 3, p) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 2, p + 2)) - real_of_num(496454400) * (pow(real_of_num(p), 29) * vv(p + 2, p + 2)) - real_of_num(20182060800) * (pow(real_of_num(p), 28) * vv(p + 2, p + 2)) - real_of_num(525618187200) * (pow(real_of_num(p), 27) * vv(p + 2, p + 2)) - real_of_num(9852752455200) * (pow(real_of_num(p), 26) * vv(p + 2, p + 2)) - real_of_num(141586844400000) * (pow(real_of_num(p), 25) * vv(p + 2, p + 2)) - real_of_num(1622232668800800) * (pow(real_of_num(p), 24) * vv(p + 2, p + 2)) - real_of_num(15216881838073200) * (pow(real_of_num(p), 23) * vv(p + 2, p + 2)) - real_of_num(119073794633478000) * (pow(real_of_num(p), 22) * vv(p + 2, p + 2)) - real_of_num(788051854021597200) * (pow(real_of_num(p), 21) * vv(p + 2, p + 2)) - real_of_num(4456431820361307600) * (pow(real_of_num(p), 20) * vv(p + 2, p + 2)) - real_of_num(21698902868784314400) * (pow(real_of_num(p), 19) * vv(p + 2, p + 2)) - real_of_num(91488093769366401600) * (pow(real_of_num(p), 18) * vv(p + 2, p + 2)) - real_of_num(335371585401421898400) * (pow(real_of_num(p), 17) * vv(p + 2, p + 2)) - real_of_num(1071741009953880273600) * (pow(real_of_num(p), 16) * vv(p + 2, p + 2)) - real_of_num(2990187354937999316400) * (pow(real_of_num(p), 15) * vv(p + 2, p + 2)) - real_of_num(7286317532356332927600) * (pow(real_of_num(p), 14) * vv(p + 2, p + 2)) - real_of_num(15495293033114667080400) * (pow(real_of_num(p), 13) * vv(p + 2, p + 2)) - real_of_num(28705606152407588235600) * (pow(real_of_num(p), 12) * vv(p + 2, p + 2)) - real_of_num(46182416910666822374400) * (pow(real_of_num(p), 11) * vv(p + 2, p + 2)) - real_of_num(64239717512203855070400) * (pow(real_of_num(p), 10) * vv(p + 2, p + 2)) - real_of_num(76792560532261627104000) * (pow(real_of_num(p), 9) * vv(p + 2, p + 2)) - real_of_num(78257413215454645036800) * (pow(real_of_num(p), 8) * vv(p + 2, p + 2)) - real_of_num(67266599790575125555200) * (pow(real_of_num(p), 7) * vv(p + 2, p + 2)) - real_of_num(48082785202227797222400) * (pow(real_of_num(p), 6) * vv(p + 2, p + 2)) - real_of_num(28038494276947532390400) * (pow(real_of_num(p), 5) * vv(p + 2, p + 2)) - real_of_num(12983983325854385356800) * (pow(real_of_num(p), 4) * vv(p + 2, p + 2)) - real_of_num(4588914693828752179200) * (pow(real_of_num(p), 3) * vv(p + 2, p + 2)) - real_of_num(1161635825544796569600) * (pow(real_of_num(p), 2) * vv(p + 2, p + 2)) - real_of_num(187382292824929075200) * (real_of_num(p) * vv(p + 2, p + 2)) - real_of_num(14457776783228928000) * vv(p + 2, p + 2) - real_of_num(5875200) * (pow(real_of_num(p), 30) * vv(p + 2, p + 1)) - real_of_num(496454400) * (pow(real_of_num(p), 29) * vv(p + 2, p + 1)) - real_of_num(20182060800) * (pow(real_of_num(p), 28) * vv(p + 2, p + 1)) - real_of_num(525618187200) * (pow(real_of_num(p), 27) * vv(p + 2, p + 1)) - real_of_num(9852752455200) * (pow(real_of_num(p), 26) * vv(p + 2, p + 1)) - real_of_num(141586844400000) * (pow(real_of_num(p), 25) * vv(p + 2, p + 1)) - real_of_num(1622232668800800) * (pow(real_of_num(p), 24) * vv(p + 2, p + 1)) - real_of_num(15216881838073200) * (pow(real_of_num(p), 23) * vv(p + 2, p + 1)) - real_of_num(119073794633478000) * (pow(real_of_num(p), 22) * vv(p + 2, p + 1)) - real_of_num(788051854021597200) * (pow(real_of_num(p), 21) * vv(p + 2, p + 1)) - real_of_num(4456431820361307600) * (pow(real_of_num(p), 20) * vv(p + 2, p + 1)) - real_of_num(21698902868784314400) * (pow(real_of_num(p), 19) * vv(p + 2, p + 1)) - real_of_num(91488093769366401600) * (pow(real_of_num(p), 18) * vv(p + 2, p + 1)) - real_of_num(335371585401421898400) * (pow(real_of_num(p), 17) * vv(p + 2, p + 1)) - real_of_num(1071741009953880273600) * (pow(real_of_num(p), 16) * vv(p + 2, p + 1)) - real_of_num(2990187354937999316400) * (pow(real_of_num(p), 15) * vv(p + 2, p + 1)) - real_of_num(7286317532356332927600) * (pow(real_of_num(p), 14) * vv(p + 2, p + 1)) - real_of_num(15495293033114667080400) * (pow(real_of_num(p), 13) * vv(p + 2, p + 1)) - real_of_num(28705606152407588235600) * (pow(real_of_num(p), 12) * vv(p + 2, p + 1)) - real_of_num(46182416910666822374400) * (pow(real_of_num(p), 11) * vv(p + 2, p + 1)) - real_of_num(64239717512203855070400) * (pow(real_of_num(p), 10) * vv(p + 2, p + 1)) - real_of_num(76792560532261627104000) * (pow(real_of_num(p), 9) * vv(p + 2, p + 1)) - real_of_num(78257413215454645036800) * (pow(real_of_num(p), 8) * vv(p + 2, p + 1)) - real_of_num(67266599790575125555200) * (pow(real_of_num(p), 7) * vv(p + 2, p + 1)) - real_of_num(48082785202227797222400) * (pow(real_of_num(p), 6) * vv(p + 2, p + 1)) - real_of_num(28038494276947532390400) * (pow(real_of_num(p), 5) * vv(p + 2, p + 1)) - real_of_num(12983983325854385356800) * (pow(real_of_num(p), 4) * vv(p + 2, p + 1)) - real_of_num(4588914693828752179200) * (pow(real_of_num(p), 3) * vv(p + 2, p + 1)) - real_of_num(1161635825544796569600) * (pow(real_of_num(p), 2) * vv(p + 2, p + 1)) - real_of_num(187382292824929075200) * (real_of_num(p) * vv(p + 2, p + 1)) - real_of_num(14457776783228928000) * vv(p + 2, p + 1) - real_of_num(6144) * (pow(real_of_num(p), 36) * vv(p + 2, p)) - real_of_num(620544) * (pow(real_of_num(p), 35) * vv(p + 2, p)) - real_of_num(28987904) * (pow(real_of_num(p), 34) * vv(p + 2, p)) - real_of_num(834080512) * (pow(real_of_num(p), 33) * vv(p + 2, p)) - real_of_num(16536232576) * (pow(real_of_num(p), 32) * vv(p + 2, p)) - real_of_num(237992445312) * (pow(real_of_num(p), 31) * vv(p + 2, p)) - real_of_num(2524448111840) * (pow(real_of_num(p), 30) * vv(p + 2, p)) - real_of_num(19094043856880) * (pow(real_of_num(p), 29) * vv(p + 2, p)) - real_of_num(84930052439712) * (pow(real_of_num(p), 28) * vv(p + 2, p)) + (real_of_num(118658072299224) * (pow(real_of_num(p), 27) * vv(p + 2, p)) + (real_of_num(6431501826725016) * (pow(real_of_num(p), 26) * vv(p + 2, p)) + (real_of_num(71678736688287948) * (pow(real_of_num(p), 25) * vv(p + 2, p)) + (real_of_num(540910526248772544) * (pow(real_of_num(p), 24) * vv(p + 2, p)) + (real_of_num(3188730795997568056) * (pow(real_of_num(p), 23) * vv(p + 2, p)) + (real_of_num(15435386921408029448) * (pow(real_of_num(p), 22) * vv(p + 2, p)) + (real_of_num(62797485945725990384) * (pow(real_of_num(p), 21) * vv(p + 2, p)) + (real_of_num(217325630001711612952) * (pow(real_of_num(p), 20) * vv(p + 2, p)) + (real_of_num(643374836522472875904) * (pow(real_of_num(p), 19) * vv(p + 2, p)) + (real_of_num(1630470160060555356048) * (pow(real_of_num(p), 18) * vv(p + 2, p)) + (real_of_num(3521020120832964747652) * (pow(real_of_num(p), 17) * vv(p + 2, p)) + (real_of_num(6398130758709710542648) * (pow(real_of_num(p), 16) * vv(p + 2, p)) + (real_of_num(9502157509633529151984) * (pow(real_of_num(p), 15) * vv(p + 2, p)) + (real_of_num(10688372791664183883728) * (pow(real_of_num(p), 14) * vv(p + 2, p)) + (real_of_num(6638329791127933431984) * (pow(real_of_num(p), 13) * vv(p + 2, p)) - real_of_num(5554811960251988017744) * (pow(real_of_num(p), 12) * vv(p + 2, p)) - real_of_num(25822534213178540481024) * (pow(real_of_num(p), 11) * vv(p + 2, p)) - real_of_num(49390971012287656118464) * (pow(real_of_num(p), 10) * vv(p + 2, p)) - real_of_num(67980001135054126118656) * (pow(real_of_num(p), 9) * vv(p + 2, p)) - real_of_num(74113229191144003251968) * (pow(real_of_num(p), 8) * vv(p + 2, p)) - real_of_num(65782169606130748581888) * (pow(real_of_num(p), 7) * vv(p + 2, p)) - real_of_num(47702630539562001196032) * (pow(real_of_num(p), 6) * vv(p + 2, p)) - real_of_num(27976556011639155793920) * (pow(real_of_num(p), 5) * vv(p + 2, p)) - real_of_num(12979163376076643942400) * (pow(real_of_num(p), 4) * vv(p + 2, p)) - real_of_num(4588914693828752179200) * (pow(real_of_num(p), 3) * vv(p + 2, p)) - real_of_num(1161635825544796569600) * (pow(real_of_num(p), 2) * vv(p + 2, p)) - real_of_num(187382292824929075200) * (real_of_num(p) * vv(p + 2, p)) - real_of_num(14457776783228928000) * vv(p + 2, p) + (real_of_num(2304) * (pow(real_of_num(p), 39) * vv(p + 1, p + 1)) + (real_of_num(230784) * (pow(real_of_num(p), 38) * vv(p + 1, p + 1)) + (real_of_num(10764096) * (pow(real_of_num(p), 37) * vv(p + 1, p + 1)) + (real_of_num(312068384) * (pow(real_of_num(p), 36) * vv(p + 1, p + 1)) + (real_of_num(6317830480) * (pow(real_of_num(p), 35) * vv(p + 1, p + 1)) + (real_of_num(94877232680) * (pow(real_of_num(p), 34) * vv(p + 1, p + 1)) + (real_of_num(1092254723116) * (pow(real_of_num(p), 33) * vv(p + 1, p + 1)) + (real_of_num(9773469084190) * (pow(real_of_num(p), 32) * vv(p + 1, p + 1)) + (real_of_num(67476088586106) * (pow(real_of_num(p), 31) * vv(p + 1, p + 1)) + (real_of_num(342141389214020) * (pow(real_of_num(p), 30) * vv(p + 1, p + 1)) + (real_of_num(1027139502314288) * (pow(real_of_num(p), 29) * vv(p + 1, p + 1)) - real_of_num(1297555270421814) * (pow(real_of_num(p), 28) * vv(p + 1, p + 1)) - real_of_num(41263951052723926) * (pow(real_of_num(p), 27) * vv(p + 1, p + 1)) - real_of_num(318826850532591560) * (pow(real_of_num(p), 26) * vv(p + 1, p + 1)) - real_of_num(1656699426673743740) * (pow(real_of_num(p), 25) * vv(p + 1, p + 1)) - real_of_num(6497196792270769814) * (pow(real_of_num(p), 24) * vv(p + 1, p + 1)) - real_of_num(19307638051713569558) * (pow(real_of_num(p), 23) * vv(p + 1, p + 1)) - real_of_num(39123357908632644740) * (pow(real_of_num(p), 22) * vv(p + 1, p + 1)) - real_of_num(20955766889623745456) * (pow(real_of_num(p), 21) * vv(p + 1, p + 1)) + (real_of_num(241387928982110219350) * (pow(real_of_num(p), 20) * vv(p + 1, p + 1)) + (real_of_num(1363019725448586314998) * (pow(real_of_num(p), 19) * vv(p + 1, p + 1)) + (real_of_num(4717398751624442875400) * (pow(real_of_num(p), 18) * vv(p + 1, p + 1)) + (real_of_num(12638719031598643956984) * (pow(real_of_num(p), 17) * vv(p + 1, p + 1)) + (real_of_num(27968295012528167990264) * (pow(real_of_num(p), 16) * vv(p + 1, p + 1)) + (real_of_num(52494117416637223144140) * (pow(real_of_num(p), 15) * vv(p + 1, p + 1)) + (real_of_num(84600469751306467276824) * (pow(real_of_num(p), 14) * vv(p + 1, p + 1)) + (real_of_num(117698725049716974432472) * (pow(real_of_num(p), 13) * vv(p + 1, p + 1)) + (real_of_num(141520574973996777178880) * (pow(real_of_num(p), 12) * vv(p + 1, p + 1)) + (real_of_num(146800849357163126187680) * (pow(real_of_num(p), 11) * vv(p + 1, p + 1)) + (real_of_num(130798754783636058640000) * (pow(real_of_num(p), 10) * vv(p + 1, p + 1)) + (real_of_num(99414862782326354652800) * (pow(real_of_num(p), 9) * vv(p + 1, p + 1)) + (real_of_num(63832457918049064872960) * (pow(real_of_num(p), 8) * vv(p + 1, p + 1)) + (real_of_num(34166598062862273010176) * (pow(real_of_num(p), 7) * vv(p + 1, p + 1)) + (real_of_num(14971506147769068859392) * (pow(real_of_num(p), 6) * vv(p + 1, p + 1)) + (real_of_num(5237154433747425853440) * (pow(real_of_num(p), 5) * vv(p + 1, p + 1)) + (real_of_num(1410141886982406144000) * (pow(real_of_num(p), 4) * vv(p + 1, p + 1)) + (real_of_num(276260933972430028800) * (pow(real_of_num(p), 3) * vv(p + 1, p + 1)) + (real_of_num(35751560630737305600) * (pow(real_of_num(p), 2) * vv(p + 1, p + 1)) + (real_of_num(2501285852794060800) * (real_of_num(p) * vv(p + 1, p + 1)) + (real_of_num(49418312299315200) * vv(p + 1, p + 1) + (real_of_num(4608) * (pow(real_of_num(p), 38) * vv(p + 1, p)) + (real_of_num(458496) * (pow(real_of_num(p), 37) * vv(p + 1, p)) + (real_of_num(21237888) * (pow(real_of_num(p), 36) * vv(p + 1, p)) + (real_of_num(611281728) * (pow(real_of_num(p), 35) * vv(p + 1, p)) + (real_of_num(12277378592) * (pow(real_of_num(p), 34) * vv(p + 1, p)) + (real_of_num(182627316240) * (pow(real_of_num(p), 33) * vv(p + 1, p)) + (real_of_num(2075431882936) * (pow(real_of_num(p), 32) * vv(p + 1, p)) + (real_of_num(18189450912748) * (pow(real_of_num(p), 31) * vv(p + 1, p)) + (real_of_num(120558124892188) * (pow(real_of_num(p), 30) * vv(p + 1, p)) + (real_of_num(549012426950680) * (pow(real_of_num(p), 29) * vv(p + 1, p)) + (real_of_num(896051073904368) * (pow(real_of_num(p), 28) * vv(p + 1, p)) - real_of_num(11731671400316872) * (pow(real_of_num(p), 27) * vv(p + 1, p)) - real_of_num(148681143742913604) * (pow(real_of_num(p), 26) * vv(p + 1, p)) - real_of_num(1072503852383283124) * (pow(real_of_num(p), 25) * vv(p + 1, p)) - real_of_num(5880307899901461712) * (pow(real_of_num(p), 24) * vv(p + 1, p)) - real_of_num(26499042287527473748) * (pow(real_of_num(p), 23) * vv(p + 1, p)) - real_of_num(101680990614354132460) * (pow(real_of_num(p), 22) * vv(p + 1, p)) - real_of_num(339237467181816330544) * (pow(real_of_num(p), 21) * vv(p + 1, p)) - real_of_num(998716848028472920912) * (pow(real_of_num(p), 20) * vv(p + 1, p)) - real_of_num(2624909353059633378208) * (pow(real_of_num(p), 19) * vv(p + 1, p)) - real_of_num(6217148865380344557868) * (pow(real_of_num(p), 18) * vv(p + 1, p)) - real_of_num(13361464334559953528740) * (pow(real_of_num(p), 17) * vv(p + 1, p)) - real_of_num(26150214104994046450440) * (pow(real_of_num(p), 16) * vv(p + 1, p)) - real_of_num(46596490032954618364336) * (pow(real_of_num(p), 15) * vv(p + 1, p)) - real_of_num(75285000846286601127392) * (pow(real_of_num(p), 14) * vv(p + 1, p)) - real_of_num(109490843962042027787744) * (pow(real_of_num(p), 13) * vv(p + 1, p)) - real_of_num(141989074943144168196608) * (pow(real_of_num(p), 12) * vv(p + 1, p)) - real_of_num(162431161027925879313536) * (pow(real_of_num(p), 11) * vv(p + 1, p)) - real_of_num(162020406972445279257088) * (pow(real_of_num(p), 10) * vv(p + 1, p)) - real_of_num(139148817967626079041024) * (pow(real_of_num(p), 9) * vv(p + 1, p)) - real_of_num(101447522175348867205120) * (pow(real_of_num(p), 8) * vv(p + 1, p)) - real_of_num(61737529205943750936576) * (pow(real_of_num(p), 7) * vv(p + 1, p)) - real_of_num(30703843886562149400576) * (pow(real_of_num(p), 6) * vv(p + 1, p)) - real_of_num(12128037469898724311040) * (pow(real_of_num(p), 5) * vv(p + 1, p)) - real_of_num(3651112853877414297600) * (pow(real_of_num(p), 4) * vv(p + 1, p)) - real_of_num(784342373170426675200) * (pow(real_of_num(p), 3) * vv(p + 1, p)) - real_of_num(106346735428593254400) * (pow(real_of_num(p), 2) * vv(p + 1, p)) - real_of_num(6631869355602739200) * (real_of_num(p) * vv(p + 1, p)) + real_of_num(49418312299315200) * vv(p + 1, p))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"))
}

///|
let bdry_target_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_target_tm")

///|
/// `bdry_target_tm`
pub fn bdry_target_tm() -> @kernel.Term {
  bdry_target_tm_c.get()
}

///|
/// bdry_Dcom_tm
fn step_150() -> Unit raise {
  bdry_dcom_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 13) + (real_of_num(28) * pow(real_of_num(p), 12) + (real_of_num(355) * pow(real_of_num(p), 11) + (real_of_num(2698) * pow(real_of_num(p), 10) + (real_of_num(13711) * pow(real_of_num(p), 9) + (real_of_num(49192) * pow(real_of_num(p), 8) + (real_of_num(128165) * pow(real_of_num(p), 7) + (real_of_num(245474) * pow(real_of_num(p), 6) + (real_of_num(345560) * pow(real_of_num(p), 5) + (real_of_num(353072) * pow(real_of_num(p), 4) + (real_of_num(254480) * pow(real_of_num(p), 3) + (real_of_num(122528) * pow(real_of_num(p), 2) + (real_of_num(35328) * real_of_num(p) + real_of_num(4608)))))))))))))"))
}

///|
let bdry_dcom_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_Dcom_tm")

///|
/// `bdry_Dcom_tm`
pub fn bdry_dcom_tm() -> @kernel.Term {
  bdry_dcom_tm_c.get()
}

///|
/// bdry_BIGD_tm
fn step_151() -> Unit raise {
  bdry_bigd_tm_c.set(@term_syntax.parse_term("real_of_num(3600) * pow(real_of_num((p : Num)), 6) + (real_of_num(75600) * pow(real_of_num(p), 5) + (real_of_num(658800) * pow(real_of_num(p), 4) + (real_of_num(3049200) * pow(real_of_num(p), 3) + (real_of_num(7905600) * pow(real_of_num(p), 2) + (real_of_num(10886400) * real_of_num(p) + real_of_num(6220800))))))"))
}

///|
let bdry_bigd_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_BIGD_tm")

///|
/// `bdry_BIGD_tm`
pub fn bdry_bigd_tm() -> @kernel.Term {
  bdry_bigd_tm_c.get()
}

///|
/// bdry_gen0_tm
fn step_152() -> Unit raise {
  bdry_gen0_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 5, p + 5) + (real_of_num(29) * (pow(real_of_num(p), 5) * vv(p + 5, p + 5)) + (real_of_num(350) * (pow(real_of_num(p), 4) * vv(p + 5, p + 5)) + (real_of_num(2250) * (pow(real_of_num(p), 3) * vv(p + 5, p + 5)) + (real_of_num(8125) * (pow(real_of_num(p), 2) * vv(p + 5, p + 5)) + (real_of_num(15625) * (real_of_num(p) * vv(p + 5, p + 5)) + (real_of_num(12500) * vv(p + 5, p + 5) + (real_of_num(2) * (pow(real_of_num(p), 5) * vv(p + 5, p + 4)) + (real_of_num(38) * (pow(real_of_num(p), 4) * vv(p + 5, p + 4)) + (real_of_num(276) * (pow(real_of_num(p), 3) * vv(p + 5, p + 4)) + (real_of_num(932) * (pow(real_of_num(p), 2) * vv(p + 5, p + 4)) + (real_of_num(1372) * (real_of_num(p) * vv(p + 5, p + 4)) + (real_of_num(560) * vv(p + 5, p + 4) - real_of_num(32) * (pow(real_of_num(p), 3) * vv(p + 5, p + 3)) - real_of_num(448) * (pow(real_of_num(p), 2) * vv(p + 5, p + 3)) - real_of_num(2088) * (real_of_num(p) * vv(p + 5, p + 3)) - real_of_num(3240) * vv(p + 5, p + 3)))))))))))))"))
}

///|
let bdry_gen0_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen0_tm")

///|
/// `bdry_gen0_tm`
pub fn bdry_gen0_tm() -> @kernel.Term {
  bdry_gen0_tm_c.get()
}

///|
/// bdry_cof0_tm
fn step_153() -> Unit raise {
  bdry_cof0_tm_c.set(@term_syntax.parse_term("real_of_num(86400) * pow(real_of_num((p : Num)), 24) + (real_of_num(5572800) * pow(real_of_num(p), 23) + (real_of_num(171036000) * pow(real_of_num(p), 22) + (real_of_num(3323646000) * pow(real_of_num(p), 21) + (real_of_num(45903549600) * pow(real_of_num(p), 20) + (real_of_num(479464506000) * pow(real_of_num(p), 19) + (real_of_num(3934713153600) * pow(real_of_num(p), 18) + (real_of_num(26017531092000) * pow(real_of_num(p), 17) + (real_of_num(141039851601600) * pow(real_of_num(p), 16) + (real_of_num(634427295372000) * pow(real_of_num(p), 15) + (real_of_num(2387711492229600) * pow(real_of_num(p), 14) + (real_of_num(7559015462406000) * pow(real_of_num(p), 13) + (real_of_num(20188314624333600) * pow(real_of_num(p), 12) + (real_of_num(45521094882690000) * pow(real_of_num(p), 11) + (real_of_num(86541238302249600) * pow(real_of_num(p), 10) + (real_of_num(138232174085640000) * pow(real_of_num(p), 9) + (real_of_num(184413435334617600) * pow(real_of_num(p), 8) + (real_of_num(203667621093216000) * pow(real_of_num(p), 7) + (real_of_num(183865247998617600) * pow(real_of_num(p), 6) + (real_of_num(133273231173504000) * pow(real_of_num(p), 5) + (real_of_num(75586956624691200) * pow(real_of_num(p), 4) + (real_of_num(32269475406643200) * pow(real_of_num(p), 3) + (real_of_num(9739972450713600) * pow(real_of_num(p), 2) + (real_of_num(1850617331712000) * real_of_num(p) + real_of_num(166259589120000))))))))))))))))))))))))"))
}

///|
let bdry_cof0_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof0_tm")

///|
/// `bdry_cof0_tm`
pub fn bdry_cof0_tm() -> @kernel.Term {
  bdry_cof0_tm_c.get()
}

///|
/// bdry_gen1_tm
fn step_154() -> Unit raise {
  bdry_gen1_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 5, p + 4) + (real_of_num(23) * (pow(real_of_num(p), 5) * vv(p + 5, p + 4)) + (real_of_num(220) * (pow(real_of_num(p), 4) * vv(p + 5, p + 4)) + (real_of_num(1120) * (pow(real_of_num(p), 3) * vv(p + 5, p + 4)) + (real_of_num(3200) * (pow(real_of_num(p), 2) * vv(p + 5, p + 4)) + (real_of_num(4864) * (real_of_num(p) * vv(p + 5, p + 4)) + (real_of_num(3072) * vv(p + 5, p + 4) + (real_of_num(4) * (pow(real_of_num(p), 5) * vv(p + 5, p + 3)) + (real_of_num(50) * (pow(real_of_num(p), 4) * vv(p + 5, p + 3)) + (real_of_num(176) * (pow(real_of_num(p), 3) * vv(p + 5, p + 3)) - real_of_num(120) * (pow(real_of_num(p), 2) * vv(p + 5, p + 3)) - real_of_num(1728) * (real_of_num(p) * vv(p + 5, p + 3)) - real_of_num(2430) * vv(p + 5, p + 3) - real_of_num(144) * (pow(real_of_num(p), 3) * vv(p + 5, p + 2)) - real_of_num(1800) * (pow(real_of_num(p), 2) * vv(p + 5, p + 2)) - real_of_num(7488) * (real_of_num(p) * vv(p + 5, p + 2)) - real_of_num(10368) * vv(p + 5, p + 2))))))))))"))
}

///|
let bdry_gen1_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen1_tm")

///|
/// `bdry_gen1_tm`
pub fn bdry_gen1_tm() -> @kernel.Term {
  bdry_gen1_tm_c.get()
}

///|
/// bdry_cof1_tm
fn step_155() -> Unit raise {
  bdry_cof1_tm_c.set(@term_syntax.parse_term("real_of_num(86400) * pow(real_of_num((p : Num)), 24) + (real_of_num(5918400) * pow(real_of_num(p), 23) + (real_of_num(193327200) * pow(real_of_num(p), 22) + (real_of_num(4005543600) * pow(real_of_num(p), 21) + (real_of_num(59062831200) * pow(real_of_num(p), 20) + (real_of_num(659229267600) * pow(real_of_num(p), 19) + (real_of_num(5783757768000) * pow(real_of_num(p), 18) + (real_of_num(40889117214000) * pow(real_of_num(p), 17) + (real_of_num(236913848740800) * pow(real_of_num(p), 16) + (real_of_num(1138279266378000) * pow(real_of_num(p), 15) + (real_of_num(4571338080664800) * pow(real_of_num(p), 14) + (real_of_num(15423332668318800) * pow(real_of_num(p), 13) + (real_of_num(43834703604127200) * pow(real_of_num(p), 12) + (real_of_num(105002760362583600) * pow(real_of_num(p), 11) + (real_of_num(211675895497987200) * pow(real_of_num(p), 10) + (real_of_num(357804524525187600) * pow(real_of_num(p), 9) + (real_of_num(504074584662480000) * pow(real_of_num(p), 8) + (real_of_num(586578303090342000) * pow(real_of_num(p), 7) + (real_of_num(556685038496620800) * pow(real_of_num(p), 6) + (real_of_num(423193274103384000) * pow(real_of_num(p), 5) + (real_of_num(251126130195302400) * pow(real_of_num(p), 4) + (real_of_num(111902467801478400) * pow(real_of_num(p), 3) + (real_of_num(35168900889600000) * pow(real_of_num(p), 2) + (real_of_num(6941058376320000) * real_of_num(p) + real_of_num(646204262400000))))))))))))))))))))))))"))
}

///|
let bdry_cof1_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof1_tm")

///|
/// `bdry_cof1_tm`
pub fn bdry_cof1_tm() -> @kernel.Term {
  bdry_cof1_tm_c.get()
}

///|
/// bdry_gen2_tm
fn step_156() -> Unit raise {
  bdry_gen2_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 5, p + 3) + (real_of_num(17) * (pow(real_of_num(p), 5) * vv(p + 5, p + 3)) + (real_of_num(120) * (pow(real_of_num(p), 4) * vv(p + 5, p + 3)) + (real_of_num(450) * (pow(real_of_num(p), 3) * vv(p + 5, p + 3)) + (real_of_num(945) * (pow(real_of_num(p), 2) * vv(p + 5, p + 3)) + (real_of_num(1053) * (real_of_num(p) * vv(p + 5, p + 3)) + (real_of_num(486) * vv(p + 5, p + 3) + (real_of_num(6) * (pow(real_of_num(p), 5) * vv(p + 5, p + 2)) + (real_of_num(36) * (pow(real_of_num(p), 4) * vv(p + 5, p + 2)) - real_of_num(132) * (pow(real_of_num(p), 3) * vv(p + 5, p + 2)) - real_of_num(1464) * (pow(real_of_num(p), 2) * vv(p + 5, p + 2)) - real_of_num(3744) * (real_of_num(p) * vv(p + 5, p + 2)) - real_of_num(3072) * vv(p + 5, p + 2) - real_of_num(384) * (pow(real_of_num(p), 3) * vv(p + 5, p + 1)) - real_of_num(4224) * (pow(real_of_num(p), 2) * vv(p + 5, p + 1)) - real_of_num(15456) * (real_of_num(p) * vv(p + 5, p + 1)) - real_of_num(18816) * vv(p + 5, p + 1)))))))))"))
}

///|
let bdry_gen2_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen2_tm")

///|
/// `bdry_gen2_tm`
pub fn bdry_gen2_tm() -> @kernel.Term {
  bdry_gen2_tm_c.get()
}

///|
/// bdry_cof2_tm
fn step_157() -> Unit raise {
  bdry_cof2_tm_c.set(@term_syntax.parse_term("real_of_num(86400) * pow(real_of_num((p : Num)), 24) + (real_of_num(6264000) * pow(real_of_num(p), 23) + (real_of_num(218037600) * pow(real_of_num(p), 22) + (real_of_num(4849700400) * pow(real_of_num(p), 21) + (real_of_num(77380048800) * pow(real_of_num(p), 20) + (real_of_num(942306872400) * pow(real_of_num(p), 19) + (real_of_num(9095079456000) * pow(real_of_num(p), 18) + (real_of_num(71307344959200) * pow(real_of_num(p), 17) + (real_of_num(461631695990400) * pow(real_of_num(p), 16) + (real_of_num(2494712072779200) * pow(real_of_num(p), 15) + (real_of_num(11332137341980800) * pow(real_of_num(p), 14) + (real_of_num(43436016990644400) * pow(real_of_num(p), 13) + (real_of_num(140682638388160800) * pow(real_of_num(p), 12) + (real_of_num(384730387847989200) * pow(real_of_num(p), 11) + (real_of_num(885924535940812800) * pow(real_of_num(p), 10) + (real_of_num(1709487751124217600) * pow(real_of_num(p), 9) + (real_of_num(2744547052390689600) * pow(real_of_num(p), 8) + (real_of_num(3629995817349160800) * pow(real_of_num(p), 7) + (real_of_num(3901969749583533600) * pow(real_of_num(p), 6) + (real_of_num(3345736959544392000) * pow(real_of_num(p), 5) + (real_of_num(2228711629265107200) * pow(real_of_num(p), 4) + (real_of_num(1109011381600204800) * pow(real_of_num(p), 3) + (real_of_num(387041984377920000) * pow(real_of_num(p), 2) + (real_of_num(84330893197440000) * real_of_num(p) + real_of_num(8615642572800000))))))))))))))))))))))))"))
}

///|
let bdry_cof2_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof2_tm")

///|
/// `bdry_cof2_tm`
pub fn bdry_cof2_tm() -> @kernel.Term {
  bdry_cof2_tm_c.get()
}

///|
/// bdry_gen3_tm
fn step_158() -> Unit raise {
  bdry_gen3_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 5, p + 2) + (real_of_num(11) * (pow(real_of_num(p), 5) * vv(p + 5, p + 2)) + (real_of_num(50) * (pow(real_of_num(p), 4) * vv(p + 5, p + 2)) + (real_of_num(120) * (pow(real_of_num(p), 3) * vv(p + 5, p + 2)) + (real_of_num(160) * (pow(real_of_num(p), 2) * vv(p + 5, p + 2)) + (real_of_num(112) * (real_of_num(p) * vv(p + 5, p + 2)) + (real_of_num(32) * vv(p + 5, p + 2) + (real_of_num(8) * (pow(real_of_num(p), 5) * vv(p + 5, p + 1)) - real_of_num(4) * (pow(real_of_num(p), 4) * vv(p + 5, p + 1)) - real_of_num(480) * (pow(real_of_num(p), 3) * vv(p + 5, p + 1)) - real_of_num(2056) * (pow(real_of_num(p), 2) * vv(p + 5, p + 1)) - real_of_num(3128) * (real_of_num(p) * vv(p + 5, p + 1)) - real_of_num(1540) * vv(p + 5, p + 1) - real_of_num(800) * (pow(real_of_num(p), 3) * vv(p + 5, p)) - real_of_num(7600) * (pow(real_of_num(p), 2) * vv(p + 5, p)) - real_of_num(24000) * (real_of_num(p) * vv(p + 5, p)) - real_of_num(25200) * vv(p + 5, p))))))))"))
}

///|
let bdry_gen3_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen3_tm")

///|
/// `bdry_gen3_tm`
pub fn bdry_gen3_tm() -> @kernel.Term {
  bdry_gen3_tm_c.get()
}

///|
/// bdry_cof3_tm
fn step_159() -> Unit raise {
  bdry_cof3_tm_c.set(@term_syntax.parse_term("real_of_num(86400) * pow(real_of_num((p : Num)), 24) + (real_of_num(6609600) * pow(real_of_num(p), 23) + (real_of_num(245167200) * pow(real_of_num(p), 22) + (real_of_num(5880999600) * pow(real_of_num(p), 21) + (real_of_num(102649903200) * pow(real_of_num(p), 20) + (real_of_num(1390261986000) * pow(real_of_num(p), 19) + (real_of_num(15203947795200) * pow(real_of_num(p), 18) + (real_of_num(137803555580400) * pow(real_of_num(p), 17) + (real_of_num(1053039909312000) * pow(real_of_num(p), 16) + (real_of_num(6857151796177200) * pow(real_of_num(p), 15) + (real_of_num(38269679901998400) * pow(real_of_num(p), 14) + (real_of_num(183406045247082000) * pow(real_of_num(p), 13) + (real_of_num(753974599720140000) * pow(real_of_num(p), 12) + (real_of_num(2649636189587012400) * pow(real_of_num(p), 11) + (real_of_num(7916434797448656000) * pow(real_of_num(p), 10) + (real_of_num(19961137388207221200) * pow(real_of_num(p), 9) + (real_of_num(42077243021888923200) * pow(real_of_num(p), 8) + (real_of_num(73264451084069821200) * pow(real_of_num(p), 7) + (real_of_num(103751526448340920800) * pow(real_of_num(p), 6) + (real_of_num(117071099940357648000) * pow(real_of_num(p), 5) + (real_of_num(102333926203011417600) * pow(real_of_num(p), 4) + (real_of_num(66514117469410022400) * pow(real_of_num(p), 3) + (real_of_num(30130014255788160000) * pow(real_of_num(p), 2) + (real_of_num(8453029904478720000) * real_of_num(p) + real_of_num(1101417020006400000))))))))))))))))))))))))"))
}

///|
let bdry_cof3_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof3_tm")

///|
/// `bdry_cof3_tm`
pub fn bdry_cof3_tm() -> @kernel.Term {
  bdry_cof3_tm_c.get()
}

///|
/// bdry_gen4_tm
fn step_160() -> Unit raise {
  bdry_gen4_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 4, p + 4) + (real_of_num(23) * (pow(real_of_num(p), 5) * vv(p + 4, p + 4)) + (real_of_num(220) * (pow(real_of_num(p), 4) * vv(p + 4, p + 4)) + (real_of_num(1120) * (pow(real_of_num(p), 3) * vv(p + 4, p + 4)) + (real_of_num(3200) * (pow(real_of_num(p), 2) * vv(p + 4, p + 4)) + (real_of_num(4864) * (real_of_num(p) * vv(p + 4, p + 4)) + (real_of_num(3072) * vv(p + 4, p + 4) + (real_of_num(2) * (pow(real_of_num(p), 5) * vv(p + 4, p + 3)) + (real_of_num(28) * (pow(real_of_num(p), 4) * vv(p + 4, p + 3)) + (real_of_num(144) * (pow(real_of_num(p), 3) * vv(p + 4, p + 3)) + (real_of_num(312) * (pow(real_of_num(p), 2) * vv(p + 4, p + 3)) + (real_of_num(194) * (real_of_num(p) * vv(p + 4, p + 3)) - real_of_num(120) * vv(p + 4, p + 3) - real_of_num(32) * (pow(real_of_num(p), 3) * vv(p + 4, p + 2)) - real_of_num(352) * (pow(real_of_num(p), 2) * vv(p + 4, p + 2)) - real_of_num(1288) * (real_of_num(p) * vv(p + 4, p + 2)) - real_of_num(1568) * vv(p + 4, p + 2))))))))))))"))
}

///|
let bdry_gen4_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen4_tm")

///|
/// `bdry_gen4_tm`
pub fn bdry_gen4_tm() -> @kernel.Term {
  bdry_gen4_tm_c.get()
}

///|
/// bdry_cof4_tm
fn step_161() -> Unit raise {
  bdry_cof4_tm_c.set(@term_syntax.parse_term("-(real_of_num(5875200) * pow(real_of_num((p : Num)), 24)) - real_of_num(396576000) * pow(real_of_num(p), 23) - real_of_num(12729369600) * pow(real_of_num(p), 22) - real_of_num(258515899200) * pow(real_of_num(p), 21) - real_of_num(3728430309600) * pow(real_of_num(p), 20) - real_of_num(40631974588800) * pow(real_of_num(p), 19) - real_of_num(347579231839200) * pow(real_of_num(p), 18) - real_of_num(2393368080224400) * pow(real_of_num(p), 17) - real_of_num(13497076085356800) * pow(real_of_num(p), 16) - real_of_num(63090896366545200) * pow(real_of_num(p), 15) - real_of_num(246472921508990400) * pow(real_of_num(p), 14) - real_of_num(809013389162436000) * pow(real_of_num(p), 13) - real_of_num(2237593310030066400) * pow(real_of_num(p), 12) - real_of_num(5218678186679858400) * pow(real_of_num(p), 11) - real_of_num(10249528775479048800) * pow(real_of_num(p), 10) - real_of_num(16891984723036597200) * pow(real_of_num(p), 9) - real_of_num(23222309377146120000) * pow(real_of_num(p), 8) - real_of_num(26394940526826438000) * pow(real_of_num(p), 7) - real_of_num(24491980062840384000) * pow(real_of_num(p), 6) - real_of_num(18223374931146993600) * pow(real_of_num(p), 5) - real_of_num(10595665431478656000) * pow(real_of_num(p), 4) - real_of_num(4631290441640121600) * pow(real_of_num(p), 3) - real_of_num(1429325580842496000) * pow(real_of_num(p), 2) - real_of_num(277326713725977600) * real_of_num(p) - real_of_num(25410211743744000)"))
}

///|
let bdry_cof4_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof4_tm")

///|
/// `bdry_cof4_tm`
pub fn bdry_cof4_tm() -> @kernel.Term {
  bdry_cof4_tm_c.get()
}

///|
/// bdry_gen5_tm
fn step_162() -> Unit raise {
  bdry_gen5_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 4, p + 3) + (real_of_num(17) * (pow(real_of_num(p), 5) * vv(p + 4, p + 3)) + (real_of_num(120) * (pow(real_of_num(p), 4) * vv(p + 4, p + 3)) + (real_of_num(450) * (pow(real_of_num(p), 3) * vv(p + 4, p + 3)) + (real_of_num(945) * (pow(real_of_num(p), 2) * vv(p + 4, p + 3)) + (real_of_num(1053) * (real_of_num(p) * vv(p + 4, p + 3)) + (real_of_num(486) * vv(p + 4, p + 3) + (real_of_num(4) * (pow(real_of_num(p), 5) * vv(p + 4, p + 2)) + (real_of_num(30) * (pow(real_of_num(p), 4) * vv(p + 4, p + 2)) + (real_of_num(16) * (pow(real_of_num(p), 3) * vv(p + 4, p + 2)) - real_of_num(388) * (pow(real_of_num(p), 2) * vv(p + 4, p + 2)) - real_of_num(1140) * (real_of_num(p) * vv(p + 4, p + 2)) - real_of_num(952) * vv(p + 4, p + 2) - real_of_num(144) * (pow(real_of_num(p), 3) * vv(p + 4, p + 1)) - real_of_num(1368) * (pow(real_of_num(p), 2) * vv(p + 4, p + 1)) - real_of_num(4320) * (real_of_num(p) * vv(p + 4, p + 1)) - real_of_num(4536) * vv(p + 4, p + 1))))))))))"))
}

///|
let bdry_gen5_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen5_tm")

///|
/// `bdry_gen5_tm`
pub fn bdry_gen5_tm() -> @kernel.Term {
  bdry_gen5_tm_c.get()
}

///|
/// bdry_cof5_tm
fn step_163() -> Unit raise {
  bdry_cof5_tm_c.set(@term_syntax.parse_term("-(real_of_num(5875200) * pow(real_of_num((p : Num)), 24)) - real_of_num(420076800) * pow(real_of_num(p), 23) - real_of_num(14339174400) * pow(real_of_num(p), 22) - real_of_num(310890427200) * pow(real_of_num(p), 21) - real_of_num(4804904095200) * pow(real_of_num(p), 20) - real_of_num(56314668614400) * pow(real_of_num(p), 19) - real_of_num(519819752095200) * pow(real_of_num(p), 18) - real_of_num(3874127371722000) * pow(real_of_num(p), 17) - real_of_num(23710326337274400) * pow(real_of_num(p), 16) - real_of_num(120557851362097200) * pow(real_of_num(p), 15) - real_of_num(513264746248833600) * pow(real_of_num(p), 14) - real_of_num(1838603198165281200) * pow(real_of_num(p), 13) - real_of_num(5555043900825213600) * pow(real_of_num(p), 12) - real_of_num(14159529767722489200) * pow(real_of_num(p), 11) - real_of_num(30393169644219674400) * pow(real_of_num(p), 10) - real_of_num(54718596712115812800) * pow(real_of_num(p), 9) - real_of_num(82099778352288098400) * pow(real_of_num(p), 8) - real_of_num(101706498599132541600) * pow(real_of_num(p), 7) - real_of_num(102676408304005080000) * pow(real_of_num(p), 6) - real_of_num(82937495975517273600) * pow(real_of_num(p), 5) - real_of_num(52218528806537395200) * pow(real_of_num(p), 4) - real_of_num(24645034491682060800) * pow(real_of_num(p), 3) - real_of_num(8186950602323942400) * pow(real_of_num(p), 2) - real_of_num(1704023733820723200) * real_of_num(p) - real_of_num(166891761082368000)"))
}

///|
let bdry_cof5_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof5_tm")

///|
/// `bdry_cof5_tm`
pub fn bdry_cof5_tm() -> @kernel.Term {
  bdry_cof5_tm_c.get()
}

///|
/// bdry_gen6_tm
fn step_164() -> Unit raise {
  bdry_gen6_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 4, p + 2) + (real_of_num(11) * (pow(real_of_num(p), 5) * vv(p + 4, p + 2)) + (real_of_num(50) * (pow(real_of_num(p), 4) * vv(p + 4, p + 2)) + (real_of_num(120) * (pow(real_of_num(p), 3) * vv(p + 4, p + 2)) + (real_of_num(160) * (pow(real_of_num(p), 2) * vv(p + 4, p + 2)) + (real_of_num(112) * (real_of_num(p) * vv(p + 4, p + 2)) + (real_of_num(32) * vv(p + 4, p + 2) + (real_of_num(6) * (pow(real_of_num(p), 5) * vv(p + 4, p + 1)) + (real_of_num(6) * (pow(real_of_num(p), 4) * vv(p + 4, p + 1)) - real_of_num(216) * (pow(real_of_num(p), 3) * vv(p + 4, p + 1)) - real_of_num(912) * (pow(real_of_num(p), 2) * vv(p + 4, p + 1)) - real_of_num(1326) * (real_of_num(p) * vv(p + 4, p + 1)) - real_of_num(630) * vv(p + 4, p + 1) - real_of_num(384) * (pow(real_of_num(p), 3) * vv(p + 4, p)) - real_of_num(3072) * (pow(real_of_num(p), 2) * vv(p + 4, p)) - real_of_num(8160) * (real_of_num(p) * vv(p + 4, p)) - real_of_num(7200) * vv(p + 4, p)))))))))"))
}

///|
let bdry_gen6_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen6_tm")

///|
/// `bdry_gen6_tm`
pub fn bdry_gen6_tm() -> @kernel.Term {
  bdry_gen6_tm_c.get()
}

///|
/// bdry_cof6_tm
fn step_165() -> Unit raise {
  bdry_cof6_tm_c.set(@term_syntax.parse_term("-(real_of_num(5875200) * pow(real_of_num((p : Num)), 24)) - real_of_num(443577600) * pow(real_of_num(p), 23) - real_of_num(16113484800) * pow(real_of_num(p), 22) - real_of_num(375121108800) * pow(real_of_num(p), 21) - real_of_num(6288127192800) * pow(real_of_num(p), 20) - real_of_num(80831613859200) * pow(real_of_num(p), 19) - real_of_num(828332713519200) * pow(real_of_num(p), 18) - real_of_num(6942396645450000) * pow(real_of_num(p), 17) - real_of_num(48421656244800000) * pow(real_of_num(p), 16) - real_of_num(284371588151420400) * pow(real_of_num(p), 15) - real_of_num(1416839907808929600) * pow(real_of_num(p), 14) - real_of_num(6014249925372093600) * pow(real_of_num(p), 13) - real_of_num(21782883134165320800) * pow(real_of_num(p), 12) - real_of_num(67255223519620267200) * pow(real_of_num(p), 11) - real_of_num(176459237187003172800) * pow(real_of_num(p), 10) - real_of_num(391313513746203253200) * pow(real_of_num(p), 9) - real_of_num(727704985151434723200) * pow(real_of_num(p), 8) - real_of_num(1122679386922915789200) * pow(real_of_num(p), 7) - real_of_num(1416156700293713656800) * pow(real_of_num(p), 6) - real_of_num(1431972812161303747200) * pow(real_of_num(p), 5) - real_of_num(1129083241734007488000) * pow(real_of_num(p), 4) - real_of_num(666618600750094310400) * pow(real_of_num(p), 3) - real_of_num(276306952606179148800) * pow(real_of_num(p), 2) - real_of_num(71464424685075763200) * real_of_num(p) - real_of_num(8649510595043328000)"))
}

///|
let bdry_cof6_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof6_tm")

///|
/// `bdry_cof6_tm`
pub fn bdry_cof6_tm() -> @kernel.Term {
  bdry_cof6_tm_c.get()
}

///|
/// bdry_gen7_tm
fn step_166() -> Unit raise {
  bdry_gen7_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 3, p + 3) + (real_of_num(17) * (pow(real_of_num(p), 5) * vv(p + 3, p + 3)) + (real_of_num(120) * (pow(real_of_num(p), 4) * vv(p + 3, p + 3)) + (real_of_num(450) * (pow(real_of_num(p), 3) * vv(p + 3, p + 3)) + (real_of_num(945) * (pow(real_of_num(p), 2) * vv(p + 3, p + 3)) + (real_of_num(1053) * (real_of_num(p) * vv(p + 3, p + 3)) + (real_of_num(486) * vv(p + 3, p + 3) + (real_of_num(2) * (pow(real_of_num(p), 5) * vv(p + 3, p + 2)) + (real_of_num(18) * (pow(real_of_num(p), 4) * vv(p + 3, p + 2)) + (real_of_num(52) * (pow(real_of_num(p), 3) * vv(p + 3, p + 2)) + (real_of_num(28) * (pow(real_of_num(p), 2) * vv(p + 3, p + 2)) - real_of_num(100) * (real_of_num(p) * vv(p + 3, p + 2)) - real_of_num(120) * vv(p + 3, p + 2) - real_of_num(32) * (pow(real_of_num(p), 3) * vv(p + 3, p + 1)) - real_of_num(256) * (pow(real_of_num(p), 2) * vv(p + 3, p + 1)) - real_of_num(680) * (real_of_num(p) * vv(p + 3, p + 1)) - real_of_num(600) * vv(p + 3, p + 1)))))))))))"))
}

///|
let bdry_gen7_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen7_tm")

///|
/// `bdry_gen7_tm`
pub fn bdry_gen7_tm() -> @kernel.Term {
  bdry_gen7_tm_c.get()
}

///|
/// bdry_cof7_tm
fn step_167() -> Unit raise {
  bdry_cof7_tm_c.set(@term_syntax.parse_term("real_of_num(100051200) * pow(real_of_num((p : Num)), 24) + (real_of_num(7053609600) * pow(real_of_num(p), 23) + (real_of_num(236613614400) * pow(real_of_num(p), 22) + (real_of_num(5024772036000) * pow(real_of_num(p), 21) + (real_of_num(75819687465600) * pow(real_of_num(p), 20) + (real_of_num(864887567760000) * pow(real_of_num(p), 19) + (real_of_num(7747555872837600) * pow(real_of_num(p), 18) + (real_of_num(55884793405698000) * pow(real_of_num(p), 17) + (real_of_num(330231204867470400) * pow(real_of_num(p), 16) + (real_of_num(1617795382867765200) * pow(real_of_num(p), 15) + (real_of_num(6624428776259299200) * pow(real_of_num(p), 14) + (real_of_num(22790678114460718800) * pow(real_of_num(p), 13) + (real_of_num(66062923496887636800) * pow(real_of_num(p), 12) + (real_of_num(161441293752631033200) * pow(real_of_num(p), 11) + (real_of_num(332111935068037365600) * pow(real_of_num(p), 10) + (real_of_num(573034258799269776000) * pow(real_of_num(p), 9) + (real_of_num(824249921378693126400) * pow(real_of_num(p), 8) + (real_of_num(979493352855501024000) * pow(real_of_num(p), 7) + (real_of_num(949387893620182617600) * pow(real_of_num(p), 6) + (real_of_num(737117357341177036800) * pow(real_of_num(p), 5) + (real_of_num(446694844675927449600) * pow(real_of_num(p), 4) + (real_of_num(203229177076054425600) * pow(real_of_num(p), 3) + (real_of_num(65190781050686668800) * pow(real_of_num(p), 2) + (real_of_num(13126111291559116800) * real_of_num(p) + real_of_num(1245996442504396800))))))))))))))))))))))))"))
}

///|
let bdry_cof7_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof7_tm")

///|
/// `bdry_cof7_tm`
pub fn bdry_cof7_tm() -> @kernel.Term {
  bdry_cof7_tm_c.get()
}

///|
/// bdry_gen8_tm
fn step_168() -> Unit raise {
  bdry_gen8_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 3, p + 2) + (real_of_num(11) * (pow(real_of_num(p), 5) * vv(p + 3, p + 2)) + (real_of_num(50) * (pow(real_of_num(p), 4) * vv(p + 3, p + 2)) + (real_of_num(120) * (pow(real_of_num(p), 3) * vv(p + 3, p + 2)) + (real_of_num(160) * (pow(real_of_num(p), 2) * vv(p + 3, p + 2)) + (real_of_num(112) * (real_of_num(p) * vv(p + 3, p + 2)) + (real_of_num(32) * vv(p + 3, p + 2) + (real_of_num(4) * (pow(real_of_num(p), 5) * vv(p + 3, p + 1)) + (real_of_num(10) * (pow(real_of_num(p), 4) * vv(p + 3, p + 1)) - real_of_num(64) * (pow(real_of_num(p), 3) * vv(p + 3, p + 1)) - real_of_num(296) * (pow(real_of_num(p), 2) * vv(p + 3, p + 1)) - real_of_num(416) * (real_of_num(p) * vv(p + 3, p + 1)) - real_of_num(190) * vv(p + 3, p + 1) - real_of_num(144) * (pow(real_of_num(p), 3) * vv(p + 3, p)) - real_of_num(936) * (pow(real_of_num(p), 2) * vv(p + 3, p)) - real_of_num(2016) * (real_of_num(p) * vv(p + 3, p)) - real_of_num(1440) * vv(p + 3, p)))))))))"))
}

///|
let bdry_gen8_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen8_tm")

///|
/// `bdry_gen8_tm`
pub fn bdry_gen8_tm() -> @kernel.Term {
  bdry_gen8_tm_c.get()
}

///|
/// bdry_cof8_tm
fn step_169() -> Unit raise {
  bdry_cof8_tm_c.set(@term_syntax.parse_term("real_of_num(100051200) * pow(real_of_num((p : Num)), 24) + (real_of_num(7453814400) * pow(real_of_num(p), 23) + (real_of_num(265628462400) * pow(real_of_num(p), 22) + (real_of_num(6026654858400) * pow(real_of_num(p), 21) + (real_of_num(97739847763200) * pow(real_of_num(p), 20) + (real_of_num(1205915065142400) * pow(real_of_num(p), 19) + (real_of_num(11760909637788000) * pow(real_of_num(p), 18) + (real_of_num(92988910271358000) * pow(real_of_num(p), 17) + (real_of_num(606487496576169600) * pow(real_of_num(p), 16) + (real_of_num(3302403373019898000) * pow(real_of_num(p), 15) + (real_of_num(15135344153788305600) * pow(real_of_num(p), 14) + (real_of_num(58686176951844148800) * pow(real_of_num(p), 13) + (real_of_num(193016927859720098400) * pow(real_of_num(p), 12) + (real_of_num(538674960005803706400) * pow(real_of_num(p), 11) + (real_of_num(1273334772475467158400) * pow(real_of_num(p), 10) + (real_of_num(2539085405212065279600) * pow(real_of_num(p), 9) + (real_of_num(4243008074001502356000) * pow(real_of_num(p), 8) + (real_of_num(5885275873225479138000) * pow(real_of_num(p), 7) + (real_of_num(6685115223237495674400) * pow(real_of_num(p), 6) + (real_of_num(6102838859661581184000) * pow(real_of_num(p), 5) + (real_of_num(4359222393175599091200) * pow(real_of_num(p), 4) + (real_of_num(2341335639791658700800) * pow(real_of_num(p), 3) + (real_of_num(887130720333750067200) * pow(real_of_num(p), 2) + (real_of_num(210884340198142771200) * real_of_num(p) + real_of_num(23596057629927014400))))))))))))))))))))))))"))
}

///|
let bdry_cof8_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof8_tm")

///|
/// `bdry_cof8_tm`
pub fn bdry_cof8_tm() -> @kernel.Term {
  bdry_cof8_tm_c.get()
}

///|
/// bdry_gen9_tm
fn step_170() -> Unit raise {
  bdry_gen9_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 6) * vv(p + 2, p + 2) + (real_of_num(11) * (pow(real_of_num(p), 5) * vv(p + 2, p + 2)) + (real_of_num(50) * (pow(real_of_num(p), 4) * vv(p + 2, p + 2)) + (real_of_num(120) * (pow(real_of_num(p), 3) * vv(p + 2, p + 2)) + (real_of_num(160) * (pow(real_of_num(p), 2) * vv(p + 2, p + 2)) + (real_of_num(112) * (real_of_num(p) * vv(p + 2, p + 2)) + (real_of_num(32) * vv(p + 2, p + 2) + (real_of_num(2) * (pow(real_of_num(p), 5) * vv(p + 2, p + 1)) + (real_of_num(8) * (pow(real_of_num(p), 4) * vv(p + 2, p + 1)) - real_of_num(40) * (pow(real_of_num(p), 2) * vv(p + 2, p + 1)) - real_of_num(62) * (real_of_num(p) * vv(p + 2, p + 1)) - real_of_num(28) * vv(p + 2, p + 1) - real_of_num(32) * (pow(real_of_num(p), 3) * vv(p + 2, p)) - real_of_num(160) * (pow(real_of_num(p), 2) * vv(p + 2, p)) - real_of_num(264) * (real_of_num(p) * vv(p + 2, p)) - real_of_num(144) * vv(p + 2, p)))))))))"))
}

///|
let bdry_gen9_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen9_tm")

///|
/// `bdry_gen9_tm`
pub fn bdry_gen9_tm() -> @kernel.Term {
  bdry_gen9_tm_c.get()
}

///|
/// bdry_cof9_tm
fn step_171() -> Unit raise {
  bdry_cof9_tm_c.set(@term_syntax.parse_term("-(real_of_num(5875200) * pow(real_of_num((p : Num)), 24)) - real_of_num(431827200) * pow(real_of_num(p), 23) - real_of_num(15138201600) * pow(real_of_num(p), 22) - real_of_num(336801585600) * pow(real_of_num(p), 21) - real_of_num(5338265637600) * pow(real_of_num(p), 20) - real_of_num(64139508540000) * pow(real_of_num(p), 19) - real_of_num(606897937800000) * pow(real_of_num(p), 18) - real_of_num(4637839668015600) * pow(real_of_num(p), 17) - real_of_num(29123591668452000) * pow(real_of_num(p), 16) - real_of_num(152101624963294800) * pow(real_of_num(p), 15) - real_of_num(666135482675709600) * pow(real_of_num(p), 14) - real_of_num(2459420930783152800) * pow(real_of_num(p), 13) - real_of_num(7676860957591197600) * pow(real_of_num(p), 12) - real_of_num(20272297277305641600) * pow(real_of_num(p), 11) - real_of_num(45223166172586982400) * pow(real_of_num(p), 10) - real_of_num(84912573279507361200) * pow(real_of_num(p), 9) - real_of_num(133376011467798405600) * pow(real_of_num(p), 8) - real_of_num(173670840878900994000) * pow(real_of_num(p), 7) - real_of_num(185054102493806311200) * pow(real_of_num(p), 6) - real_of_num(158438514229394227200) * pow(real_of_num(p), 5) - real_of_num(106176465846730944000) * pow(real_of_num(p), 4) - real_of_num(53551227259301990400) * pow(real_of_num(p), 3) - real_of_num(19081771322998579200) * pow(real_of_num(p), 2) - real_of_num(4274377315113369600) * real_of_num(p) - real_of_num(451805524475904000)"))
}

///|
let bdry_cof9_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof9_tm")

///|
/// `bdry_cof9_tm`
pub fn bdry_cof9_tm() -> @kernel.Term {
  bdry_cof9_tm_c.get()
}

///|
/// bdry_gen10_tm
fn step_172() -> Unit raise {
  bdry_gen10_tm_c.set(@term_syntax.parse_term("real_of_num(2) * (pow(real_of_num((p : Num)), 4) * vv(p + 5, p + 1)) + (real_of_num(8) * (pow(real_of_num(p), 3) * vv(p + 5, p + 1)) + (real_of_num(12) * (pow(real_of_num(p), 2) * vv(p + 5, p + 1)) + (real_of_num(8) * (real_of_num(p) * vv(p + 5, p + 1)) + (real_of_num(2) * vv(p + 5, p + 1) - real_of_num(200) * (pow(real_of_num(p), 2) * vv(p + 5, p)) - real_of_num(1200) * (real_of_num(p) * vv(p + 5, p)) - real_of_num(1800) * vv(p + 5, p) - pow(real_of_num(p), 5) * vv(p + 4, p + 1) - real_of_num(7) * (pow(real_of_num(p), 4) * vv(p + 4, p + 1)) - real_of_num(18) * (pow(real_of_num(p), 3) * vv(p + 4, p + 1)) - real_of_num(22) * (pow(real_of_num(p), 2) * vv(p + 4, p + 1)) - real_of_num(13) * (real_of_num(p) * vv(p + 4, p + 1)) - real_of_num(3) * vv(p + 4, p + 1) + (real_of_num(64) * (pow(real_of_num(p), 3) * vv(p + 4, p)) + (real_of_num(512) * (pow(real_of_num(p), 2) * vv(p + 4, p)) + (real_of_num(1360) * (real_of_num(p) * vv(p + 4, p)) + real_of_num(1200) * vv(p + 4, p))))))))"))
}

///|
let bdry_gen10_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen10_tm")

///|
/// `bdry_gen10_tm`
pub fn bdry_gen10_tm() -> @kernel.Term {
  bdry_gen10_tm_c.get()
}

///|
/// bdry_cof10_tm
fn step_173() -> Unit raise {
  bdry_cof10_tm_c.set(@term_syntax.parse_term("real_of_num(43200) * pow(real_of_num((p : Num)), 26) + (real_of_num(3520800) * pow(real_of_num(p), 25) + (real_of_num(140835600) * pow(real_of_num(p), 24) + (real_of_num(3699520200) * pow(real_of_num(p), 23) + (real_of_num(72065745000) * pow(real_of_num(p), 22) + (real_of_num(1114367607000) * pow(real_of_num(p), 21) + (real_of_num(14284908801000) * pow(real_of_num(p), 20) + (real_of_num(156243816342000) * pow(real_of_num(p), 19) + (real_of_num(1485697050558000) * pow(real_of_num(p), 18) + (real_of_num(12417308909305200) * pow(real_of_num(p), 17) + (real_of_num(91682907278176800) * pow(real_of_num(p), 16) + (real_of_num(598457327971869000) * pow(real_of_num(p), 15) + (real_of_num(3445995694377227400) * pow(real_of_num(p), 14) + (real_of_num(17433266444106852600) * pow(real_of_num(p), 13) + (real_of_num(77082529644165493800) * pow(real_of_num(p), 12) + (real_of_num(296073100097928165600) * pow(real_of_num(p), 11) + (real_of_num(981056771754051045600) * pow(real_of_num(p), 10) + (real_of_num(2782102935278761696800) * pow(real_of_num(p), 9) + (real_of_num(6688574695581481396800) * pow(real_of_num(p), 8) + (real_of_num(13475795237472428330400) * pow(real_of_num(p), 7) + (real_of_num(22421284647096937406400) * pow(real_of_num(p), 6) + (real_of_num(30215414570375159942400) * pow(real_of_num(p), 5) + (real_of_num(32107172033099394432000) * pow(real_of_num(p), 4) + (real_of_num(25861795513307727206400) * pow(real_of_num(p), 3) + (real_of_num(14824848005395534080000) * pow(real_of_num(p), 2) + (real_of_num(5383536463458616320000) * real_of_num(p) + real_of_num(930186193161830400000))))))))))))))))))))))))))"))
}

///|
let bdry_cof10_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof10_tm")

///|
/// `bdry_cof10_tm`
pub fn bdry_cof10_tm() -> @kernel.Term {
  bdry_cof10_tm_c.get()
}

///|
/// bdry_gen11_tm
fn step_174() -> Unit raise {
  bdry_gen11_tm_c.set(@term_syntax.parse_term("real_of_num(600) * (pow(real_of_num((p : Num)), 3) * vv(p + 5, p)) + (real_of_num(9000) * (pow(real_of_num(p), 2) * vv(p + 5, p)) + (real_of_num(45000) * (real_of_num(p) * vv(p + 5, p)) + (real_of_num(75000) * vv(p + 5, p) - real_of_num(192) * (pow(real_of_num(p), 5) * vv(p + 4, p)) - real_of_num(3552) * (pow(real_of_num(p), 4) * vv(p + 4, p)) - real_of_num(25968) * (pow(real_of_num(p), 3) * vv(p + 4, p)) - real_of_num(93384) * (pow(real_of_num(p), 2) * vv(p + 4, p)) - real_of_num(164520) * (real_of_num(p) * vv(p + 4, p)) - real_of_num(113400) * vv(p + 4, p) + (real_of_num(4) * (pow(real_of_num(p), 8) * vv(p + 3, p + 1)) + (real_of_num(48) * (pow(real_of_num(p), 7) * vv(p + 3, p + 1)) + (real_of_num(225) * (pow(real_of_num(p), 6) * vv(p + 3, p + 1)) + (real_of_num(545) * (pow(real_of_num(p), 5) * vv(p + 3, p + 1)) + (real_of_num(750) * (pow(real_of_num(p), 4) * vv(p + 3, p + 1)) + (real_of_num(594) * (pow(real_of_num(p), 3) * vv(p + 3, p + 1)) + (real_of_num(253) * (pow(real_of_num(p), 2) * vv(p + 3, p + 1)) + (real_of_num(45) * (real_of_num(p) * vv(p + 3, p + 1)) + (real_of_num(24) * (pow(real_of_num(p), 7) * vv(p + 3, p)) + (real_of_num(360) * (pow(real_of_num(p), 6) * vv(p + 3, p)) + (real_of_num(2742) * (pow(real_of_num(p), 5) * vv(p + 3, p)) + (real_of_num(13884) * (pow(real_of_num(p), 4) * vv(p + 3, p)) + (real_of_num(45492) * (pow(real_of_num(p), 3) * vv(p + 3, p)) + (real_of_num(88512) * (pow(real_of_num(p), 2) * vv(p + 3, p)) + (real_of_num(91440) * (real_of_num(p) * vv(p + 3, p)) + real_of_num(38400) * vv(p + 3, p)))))))))))))))))))"))
}

///|
let bdry_gen11_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen11_tm")

///|
/// `bdry_gen11_tm`
pub fn bdry_gen11_tm() -> @kernel.Term {
  bdry_gen11_tm_c.get()
}

///|
/// bdry_cof11_tm
fn step_175() -> Unit raise {
  bdry_cof11_tm_c.set(@term_syntax.parse_term("real_of_num(144) * pow(real_of_num((p : Num)), 27) + (real_of_num(11304) * pow(real_of_num(p), 26) + (real_of_num(438852) * pow(real_of_num(p), 25) + (real_of_num(11307570) * pow(real_of_num(p), 24) + (real_of_num(219070956) * pow(real_of_num(p), 23) + (real_of_num(3426158184) * pow(real_of_num(p), 22) + (real_of_num(45257871936) * pow(real_of_num(p), 21) + (real_of_num(519859760154) * pow(real_of_num(p), 20) + (real_of_num(5283062665056) * pow(real_of_num(p), 19) + (real_of_num(47900218749024) * pow(real_of_num(p), 18) + (real_of_num(388309892568036) * pow(real_of_num(p), 17) + (real_of_num(2809557236557734) * pow(real_of_num(p), 16) + (real_of_num(18070994225044236) * pow(real_of_num(p), 15) + (real_of_num(102797044719442584) * pow(real_of_num(p), 14) + (real_of_num(514218851471291256) * pow(real_of_num(p), 13) + (real_of_num(2248179315971572974) * pow(real_of_num(p), 12) + (real_of_num(8534875727807013336) * pow(real_of_num(p), 11) + (real_of_num(27935359807564723704) * pow(real_of_num(p), 10) + (real_of_num(78200336444397809376) * pow(real_of_num(p), 9) + (real_of_num(185463560511454442784) * pow(real_of_num(p), 8) + (real_of_num(368380150569879245952) * pow(real_of_num(p), 7) + (real_of_num(603899044300460803200) * pow(real_of_num(p), 6) + (real_of_num(801418217125160722944) * pow(real_of_num(p), 5) + (real_of_num(838192023811692048384) * pow(real_of_num(p), 4) + (real_of_num(664221449269259550720) * pow(real_of_num(p), 3) + (real_of_num(374433899685374361600) * pow(real_of_num(p), 2) + (real_of_num(133664125302816768000) * real_of_num(p) + real_of_num(22694572464537600000)))))))))))))))))))))))))))"))
}

///|
let bdry_cof11_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof11_tm")

///|
/// `bdry_cof11_tm`
pub fn bdry_cof11_tm() -> @kernel.Term {
  bdry_cof11_tm_c.get()
}

///|
/// bdry_gen12_tm
fn step_176() -> Unit raise {
  bdry_gen12_tm_c.set(@term_syntax.parse_term("real_of_num(3) * (pow(real_of_num((p : Num)), 4) * vv(p + 4, p + 1)) + (real_of_num(12) * (pow(real_of_num(p), 3) * vv(p + 4, p + 1)) + (real_of_num(18) * (pow(real_of_num(p), 2) * vv(p + 4, p + 1)) + (real_of_num(12) * (real_of_num(p) * vv(p + 4, p + 1)) + (real_of_num(3) * vv(p + 4, p + 1) - real_of_num(192) * (pow(real_of_num(p), 2) * vv(p + 4, p)) - real_of_num(960) * (real_of_num(p) * vv(p + 4, p)) - real_of_num(1200) * vv(p + 4, p) - real_of_num(2) * (pow(real_of_num(p), 5) * vv(p + 3, p + 1)) - real_of_num(13) * (pow(real_of_num(p), 4) * vv(p + 3, p + 1)) - real_of_num(32) * (pow(real_of_num(p), 3) * vv(p + 3, p + 1)) - real_of_num(38) * (pow(real_of_num(p), 2) * vv(p + 3, p + 1)) - real_of_num(22) * (real_of_num(p) * vv(p + 3, p + 1)) - real_of_num(5) * vv(p + 3, p + 1) + (real_of_num(72) * (pow(real_of_num(p), 3) * vv(p + 3, p)) + (real_of_num(468) * (pow(real_of_num(p), 2) * vv(p + 3, p)) + (real_of_num(1008) * (real_of_num(p) * vv(p + 3, p)) + real_of_num(720) * vv(p + 3, p))))))))"))
}

///|
let bdry_gen12_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen12_tm")

///|
/// `bdry_gen12_tm`
pub fn bdry_gen12_tm() -> @kernel.Term {
  bdry_gen12_tm_c.get()
}

///|
/// bdry_cof12_tm
fn step_177() -> Unit raise {
  bdry_cof12_tm_c.set(@term_syntax.parse_term("real_of_num(14400) * pow(real_of_num((p : Num)), 27) - real_of_num(741600) * pow(real_of_num(p), 26) - real_of_num(107185200) * pow(real_of_num(p), 25) - real_of_num(4799117400) * pow(real_of_num(p), 24) - real_of_num(129262665600) * pow(real_of_num(p), 23) - real_of_num(2477542254000) * pow(real_of_num(p), 22) - real_of_num(36603694856400) * pow(real_of_num(p), 21) - real_of_num(437024128084200) * pow(real_of_num(p), 20) - real_of_num(4348580656414800) * pow(real_of_num(p), 19) - real_of_num(36820252365459600) * pow(real_of_num(p), 18) - real_of_num(268982859716143200) * pow(real_of_num(p), 17) - real_of_num(1709905430752416600) * pow(real_of_num(p), 16) - real_of_num(9500888284482980400) * pow(real_of_num(p), 15) - real_of_num(46202947462537732800) * pow(real_of_num(p), 14) - real_of_num(196436862153056229600) * pow(real_of_num(p), 13) - real_of_num(728065853217695519400) * pow(real_of_num(p), 12) - real_of_num(2342187201934871596800) * pow(real_of_num(p), 11) - real_of_num(6502788653914224578400) * pow(real_of_num(p), 10) - real_of_num(15470391090693618758400) * pow(real_of_num(p), 9) - real_of_num(31257715628755253692800) * pow(real_of_num(p), 8) - real_of_num(53037210946660988812800) * pow(real_of_num(p), 7) - real_of_num(74482819004203540569600) * pow(real_of_num(p), 6) - real_of_num(84910952831473122969600) * pow(real_of_num(p), 5) - real_of_num(76490541737326489190400) * pow(real_of_num(p), 4) - real_of_num(52335183541710672691200) * pow(real_of_num(p), 3) - real_of_num(25527934394691718348800) * pow(real_of_num(p), 2) - real_of_num(7899972840522370252800) * real_of_num(p) - real_of_num(1164571431379402752000)"))
}

///|
let bdry_cof12_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof12_tm")

///|
/// `bdry_cof12_tm`
pub fn bdry_cof12_tm() -> @kernel.Term {
  bdry_cof12_tm_c.get()
}

///|
/// bdry_gen13_tm
fn step_178() -> Unit raise {
  bdry_gen13_tm_c.set(@term_syntax.parse_term("real_of_num(72) * (pow(real_of_num((p : Num)), 3) * vv(p + 4, p)) + (real_of_num(864) * (pow(real_of_num(p), 2) * vv(p + 4, p)) + (real_of_num(3456) * (real_of_num(p) * vv(p + 4, p)) + (real_of_num(4608) * vv(p + 4, p) - real_of_num(36) * (pow(real_of_num(p), 5) * vv(p + 3, p)) - real_of_num(522) * (pow(real_of_num(p), 4) * vv(p + 3, p)) - real_of_num(3006) * (pow(real_of_num(p), 3) * vv(p + 3, p)) - real_of_num(8550) * (pow(real_of_num(p), 2) * vv(p + 3, p)) - real_of_num(11952) * (real_of_num(p) * vv(p + 3, p)) - real_of_num(6552) * vv(p + 3, p) + (real_of_num(2) * (pow(real_of_num(p), 8) * vv(p + 2, p + 1)) + (real_of_num(21) * (pow(real_of_num(p), 7) * vv(p + 2, p + 1)) + (real_of_num(89) * (pow(real_of_num(p), 6) * vv(p + 2, p + 1)) + (real_of_num(200) * (pow(real_of_num(p), 5) * vv(p + 2, p + 1)) + (real_of_num(260) * (pow(real_of_num(p), 4) * vv(p + 2, p + 1)) + (real_of_num(197) * (pow(real_of_num(p), 3) * vv(p + 2, p + 1)) + (real_of_num(81) * (pow(real_of_num(p), 2) * vv(p + 2, p + 1)) + (real_of_num(14) * (real_of_num(p) * vv(p + 2, p + 1)) + (real_of_num(8) * (pow(real_of_num(p), 7) * vv(p + 2, p)) + (real_of_num(96) * (pow(real_of_num(p), 6) * vv(p + 2, p)) + (real_of_num(562) * (pow(real_of_num(p), 5) * vv(p + 2, p)) + (real_of_num(2114) * (pow(real_of_num(p), 4) * vv(p + 2, p)) + (real_of_num(5146) * (pow(real_of_num(p), 3) * vv(p + 2, p)) + (real_of_num(7554) * (pow(real_of_num(p), 2) * vv(p + 2, p)) + (real_of_num(5976) * (real_of_num(p) * vv(p + 2, p)) + real_of_num(1944) * vv(p + 2, p)))))))))))))))))))"))
}

///|
let bdry_gen13_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen13_tm")

///|
/// `bdry_gen13_tm`
pub fn bdry_gen13_tm() -> @kernel.Term {
  bdry_gen13_tm_c.get()
}

///|
/// bdry_cof13_tm
fn step_179() -> Unit raise {
  bdry_cof13_tm_c.set(@term_syntax.parse_term("real_of_num(384) * pow(real_of_num((p : Num)), 29) + (real_of_num(32640) * pow(real_of_num(p), 28) + (real_of_num(1288160) * pow(real_of_num(p), 27) + (real_of_num(31633280) * pow(real_of_num(p), 26) + (real_of_num(545123752) * pow(real_of_num(p), 25) + (real_of_num(7037282080) * pow(real_of_num(p), 24) + (real_of_num(70868350738) * pow(real_of_num(p), 23) + (real_of_num(571887278374) * pow(real_of_num(p), 22) + (real_of_num(3766738961590) * pow(real_of_num(p), 21) + (real_of_num(20500822632154) * pow(real_of_num(p), 20) + (real_of_num(92851107960188) * pow(real_of_num(p), 19) + (real_of_num(350190642252020) * pow(real_of_num(p), 18) + (real_of_num(1087965871592692) * pow(real_of_num(p), 17) + (real_of_num(2672302437619732) * pow(real_of_num(p), 16) + (real_of_num(4402940729565322) * pow(real_of_num(p), 15) - real_of_num(454464899664050) * pow(real_of_num(p), 14) - real_of_num(40882791732340402) * pow(real_of_num(p), 13) - real_of_num(211152342305588686) * pow(real_of_num(p), 12) - real_of_num(760601943650634200) * pow(real_of_num(p), 11) - real_of_num(2220005577555401096) * pow(real_of_num(p), 10) - real_of_num(5441849540424857536) * pow(real_of_num(p), 9) - real_of_num(11266574541545429920) * pow(real_of_num(p), 8) - real_of_num(19581211151940007808) * pow(real_of_num(p), 7) - real_of_num(28207809741669446528) * pow(real_of_num(p), 6) - real_of_num(33056765181570362880) * pow(real_of_num(p), 5) - real_of_num(30687132729881088000) * pow(real_of_num(p), 4) - real_of_num(21694952873089843200) * pow(real_of_num(p), 3) - real_of_num(10966061767569408000) * pow(real_of_num(p), 2) - real_of_num(3527587065898598400) * real_of_num(p) - real_of_num(542354259050496000)))))))))))))))"))
}

///|
let bdry_cof13_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof13_tm")

///|
/// `bdry_cof13_tm`
pub fn bdry_cof13_tm() -> @kernel.Term {
  bdry_cof13_tm_c.get()
}

///|
/// bdry_gen14_tm
fn step_180() -> Unit raise {
  bdry_gen14_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 4) * vv(p + 3, p + 1) + (real_of_num(4) * (pow(real_of_num(p), 3) * vv(p + 3, p + 1)) + (real_of_num(6) * (pow(real_of_num(p), 2) * vv(p + 3, p + 1)) + (real_of_num(4) * (real_of_num(p) * vv(p + 3, p + 1)) + (vv(p + 3, p + 1) - real_of_num(36) * (pow(real_of_num(p), 2) * vv(p + 3, p)) - real_of_num(144) * (real_of_num(p) * vv(p + 3, p)) - real_of_num(144) * vv(p + 3, p) - pow(real_of_num(p), 5) * vv(p + 2, p + 1) - real_of_num(6) * (pow(real_of_num(p), 4) * vv(p + 2, p + 1)) - real_of_num(14) * (pow(real_of_num(p), 3) * vv(p + 2, p + 1)) - real_of_num(16) * (pow(real_of_num(p), 2) * vv(p + 2, p + 1)) - real_of_num(9) * (real_of_num(p) * vv(p + 2, p + 1)) - real_of_num(2) * vv(p + 2, p + 1) + (real_of_num(16) * (pow(real_of_num(p), 3) * vv(p + 2, p)) + (real_of_num(80) * (pow(real_of_num(p), 2) * vv(p + 2, p)) + (real_of_num(132) * (real_of_num(p) * vv(p + 2, p)) + real_of_num(72) * vv(p + 2, p))))))))"))
}

///|
let bdry_gen14_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen14_tm")

///|
/// `bdry_gen14_tm`
pub fn bdry_gen14_tm() -> @kernel.Term {
  bdry_gen14_tm_c.get()
}

///|
/// bdry_cof14_tm
fn step_181() -> Unit raise {
  bdry_cof14_tm_c.set(@term_syntax.parse_term("-(real_of_num(576) * pow(real_of_num((p : Num)), 31)) - real_of_num(49824) * pow(real_of_num(p), 30) - real_of_num(2127648) * pow(real_of_num(p), 29) - real_of_num(60076416) * pow(real_of_num(p), 28) - real_of_num(1272082140) * pow(real_of_num(p), 27) - real_of_num(21678131478) * pow(real_of_num(p), 26) - real_of_num(309349660470) * pow(real_of_num(p), 25) - real_of_num(3764880838020) * pow(real_of_num(p), 24) - real_of_num(39285269676360) * pow(real_of_num(p), 23) - real_of_num(351373426215450) * pow(real_of_num(p), 22) - real_of_num(2690609090837730) * pow(real_of_num(p), 21) - real_of_num(17632955897724960) * pow(real_of_num(p), 20) - real_of_num(98957756195993940) * pow(real_of_num(p), 19) - real_of_num(476055711249644490) * pow(real_of_num(p), 18) - real_of_num(1964628794902862970) * pow(real_of_num(p), 17) - real_of_num(6954705762708068340) * pow(real_of_num(p), 16) - real_of_num(21083596466364268080) * pow(real_of_num(p), 15) - real_of_num(54509672129360654790) * pow(real_of_num(p), 14) - real_of_num(119173969517281494990) * pow(real_of_num(p), 13) - real_of_num(216661556366147109480) * pow(real_of_num(p), 12) - real_of_num(316043122780615600824) * pow(real_of_num(p), 11) - real_of_num(336701223229004214816) * pow(real_of_num(p), 10) - real_of_num(167699044679585986752) * pow(real_of_num(p), 9) + (real_of_num(255669038430056567616) * pow(real_of_num(p), 8) + (real_of_num(854346839627358493920) * pow(real_of_num(p), 7) + (real_of_num(1385958424319160358848) * pow(real_of_num(p), 6) + (real_of_num(1577283348512186818560) * pow(real_of_num(p), 5) + (real_of_num(1335654529501529318400) * pow(real_of_num(p), 4) + (real_of_num(835710291083698790400) * pow(real_of_num(p), 3) + (real_of_num(368146803721159065600) * pow(real_of_num(p), 2) + (real_of_num(102378137931605606400) * real_of_num(p) + real_of_num(13545929348893900800)))))))))"))
}

///|
let bdry_cof14_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof14_tm")

///|
/// `bdry_cof14_tm`
pub fn bdry_cof14_tm() -> @kernel.Term {
  bdry_cof14_tm_c.get()
}

///|
/// bdry_gen15_tm
fn step_182() -> Unit raise {
  bdry_gen15_tm_c.set(@term_syntax.parse_term("real_of_num(18) * (pow(real_of_num((p : Num)), 3) * vv(p + 3, p)) + (real_of_num(162) * (pow(real_of_num(p), 2) * vv(p + 3, p)) + (real_of_num(486) * (real_of_num(p) * vv(p + 3, p)) + (real_of_num(486) * vv(p + 3, p) - real_of_num(16) * (pow(real_of_num(p), 5) * vv(p + 2, p)) - real_of_num(168) * (pow(real_of_num(p), 4) * vv(p + 2, p)) - real_of_num(708) * (pow(real_of_num(p), 3) * vv(p + 2, p)) - real_of_num(1486) * (pow(real_of_num(p), 2) * vv(p + 2, p)) - real_of_num(1542) * (real_of_num(p) * vv(p + 2, p)) - real_of_num(630) * vv(p + 2, p) + (real_of_num(4) * (pow(real_of_num(p), 8) * vv(p + 1, p + 1)) + (real_of_num(36) * (pow(real_of_num(p), 7) * vv(p + 1, p + 1)) + (real_of_num(135) * (pow(real_of_num(p), 6) * vv(p + 1, p + 1)) + (real_of_num(275) * (pow(real_of_num(p), 5) * vv(p + 1, p + 1)) + (real_of_num(330) * (pow(real_of_num(p), 4) * vv(p + 1, p + 1)) + (real_of_num(234) * (pow(real_of_num(p), 3) * vv(p + 1, p + 1)) + (real_of_num(91) * (pow(real_of_num(p), 2) * vv(p + 1, p + 1)) + (real_of_num(15) * (real_of_num(p) * vv(p + 1, p + 1)) + (real_of_num(8) * (pow(real_of_num(p), 7) * vv(p + 1, p)) + (real_of_num(72) * (pow(real_of_num(p), 6) * vv(p + 1, p)) + (real_of_num(298) * (pow(real_of_num(p), 5) * vv(p + 1, p)) + (real_of_num(748) * (pow(real_of_num(p), 4) * vv(p + 1, p)) + (real_of_num(1198) * (pow(real_of_num(p), 3) * vv(p + 1, p)) + (real_of_num(1176) * (pow(real_of_num(p), 2) * vv(p + 1, p)) + (real_of_num(636) * (real_of_num(p) * vv(p + 1, p)) + real_of_num(144) * vv(p + 1, p)))))))))))))))))))"))
}

///|
let bdry_gen15_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen15_tm")

///|
/// `bdry_gen15_tm`
pub fn bdry_gen15_tm() -> @kernel.Term {
  bdry_gen15_tm_c.get()
}

///|
/// bdry_cof15_tm
fn step_183() -> Unit raise {
  bdry_cof15_tm_c.set(@term_syntax.parse_term("real_of_num(576) * pow(real_of_num((p : Num)), 31) + (real_of_num(52128) * pow(real_of_num(p), 30) + (real_of_num(2164896) * pow(real_of_num(p), 29) + (real_of_num(55004064) * pow(real_of_num(p), 28) + (real_of_num(957345404) * pow(real_of_num(p), 27) + (real_of_num(12047156006) * pow(real_of_num(p), 26) + (real_of_num(111770221790) * pow(real_of_num(p), 25) + (real_of_num(750215524722) * pow(real_of_num(p), 24) + (real_of_num(3236155988338) * pow(real_of_num(p), 23) + (real_of_num(2803388952322) * pow(real_of_num(p), 22) - real_of_num(91053628161448) * pow(real_of_num(p), 21) - real_of_num(946551437282136) * pow(real_of_num(p), 20) - real_of_num(5934686877270732) * pow(real_of_num(p), 19) - real_of_num(27875263266799882) * pow(real_of_num(p), 18) - real_of_num(104467845797243726) * pow(real_of_num(p), 17) - real_of_num(320749771148642930) * pow(real_of_num(p), 16) - real_of_num(816774055034567890) * pow(real_of_num(p), 15) - real_of_num(1733586627330459678) * pow(real_of_num(p), 14) - real_of_num(3067409899772814264) * pow(real_of_num(p), 13) - real_of_num(4507647620425796680) * pow(real_of_num(p), 12) - real_of_num(5459083173473240672) * pow(real_of_num(p), 11) - real_of_num(5379766582512786464) * pow(real_of_num(p), 10) - real_of_num(4226679778466588928) * pow(real_of_num(p), 9) - real_of_num(2552732855801555840) * pow(real_of_num(p), 8) - real_of_num(1088673373884929024) * pow(real_of_num(p), 7) - real_of_num(225199038903980032) * pow(real_of_num(p), 6) + (real_of_num(101102108821985280) * pow(real_of_num(p), 5) + (real_of_num(143428587155251200) * pow(real_of_num(p), 4) + (real_of_num(95214356029440000) * pow(real_of_num(p), 3) + (real_of_num(42949024815513600) * pow(real_of_num(p), 2) + (real_of_num(12386469976473600) * real_of_num(p) + real_of_num(1715913621504000)))))))))))))))"))
}

///|
let bdry_cof15_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof15_tm")

///|
/// `bdry_cof15_tm`
pub fn bdry_cof15_tm() -> @kernel.Term {
  bdry_cof15_tm_c.get()
}

///|
/// bdry_gen16_tm
fn step_184() -> Unit raise {
  bdry_gen16_tm_c.set(@term_syntax.parse_term("pow(real_of_num((p : Num)), 4) * vv(p + 2, p + 1) + (real_of_num(4) * (pow(real_of_num(p), 3) * vv(p + 2, p + 1)) + (real_of_num(6) * (pow(real_of_num(p), 2) * vv(p + 2, p + 1)) + (real_of_num(4) * (real_of_num(p) * vv(p + 2, p + 1)) + (vv(p + 2, p + 1) - real_of_num(16) * (pow(real_of_num(p), 2) * vv(p + 2, p)) - real_of_num(48) * (real_of_num(p) * vv(p + 2, p)) - real_of_num(36) * vv(p + 2, p) - real_of_num(2) * (pow(real_of_num(p), 5) * vv(p + 1, p + 1)) - real_of_num(11) * (pow(real_of_num(p), 4) * vv(p + 1, p + 1)) - real_of_num(24) * (pow(real_of_num(p), 3) * vv(p + 1, p + 1)) - real_of_num(26) * (pow(real_of_num(p), 2) * vv(p + 1, p + 1)) - real_of_num(14) * (real_of_num(p) * vv(p + 1, p + 1)) - real_of_num(3) * vv(p + 1, p + 1) + (real_of_num(8) * (pow(real_of_num(p), 3) * vv(p + 1, p)) + (real_of_num(28) * (pow(real_of_num(p), 2) * vv(p + 1, p)) + (real_of_num(32) * (real_of_num(p) * vv(p + 1, p)) + real_of_num(12) * vv(p + 1, p))))))))"))
}

///|
let bdry_gen16_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_gen16_tm")

///|
/// `bdry_gen16_tm`
pub fn bdry_gen16_tm() -> @kernel.Term {
  bdry_gen16_tm_c.get()
}

///|
/// bdry_cof16_tm
fn step_185() -> Unit raise {
  bdry_cof16_tm_c.set(@term_syntax.parse_term("-(real_of_num(768) * pow(real_of_num((p : Num)), 33)) - real_of_num(70848) * pow(real_of_num(p), 32) - real_of_num(3061216) * pow(real_of_num(p), 31) - real_of_num(83061312) * pow(real_of_num(p), 30) - real_of_num(1598472816) * pow(real_of_num(p), 29) - real_of_num(23362274148) * pow(real_of_num(p), 28) - real_of_num(271514623994) * pow(real_of_num(p), 27) - real_of_num(2601338699496) * pow(real_of_num(p), 26) - real_of_num(21222284621772) * pow(real_of_num(p), 25) - real_of_num(152091013327860) * pow(real_of_num(p), 24) - real_of_num(984751302726734) * pow(real_of_num(p), 23) - real_of_num(5873330498134824) * pow(real_of_num(p), 22) - real_of_num(32447423889987320) * pow(real_of_num(p), 21) - real_of_num(164786849499170652) * pow(real_of_num(p), 20) - real_of_num(758433071885086310) * pow(real_of_num(p), 19) - real_of_num(3118513982593851624) * pow(real_of_num(p), 18) - real_of_num(11328698663537881724) * pow(real_of_num(p), 17) - real_of_num(36080746184490134220) * pow(real_of_num(p), 16) - real_of_num(100220071139584247282) * pow(real_of_num(p), 15) - real_of_num(241822133901305637000) * pow(real_of_num(p), 14) - real_of_num(505048510927361785936) * pow(real_of_num(p), 13) - real_of_num(909407834489851454976) * pow(real_of_num(p), 12) - real_of_num(1405069622466917634944) * pow(real_of_num(p), 11) - real_of_num(1851423958449873246720) * pow(real_of_num(p), 10) - real_of_num(2064195223366505750784) * pow(real_of_num(p), 9) - real_of_num(1927236689094077930496) * pow(real_of_num(p), 8) - real_of_num(1486264235226656990720) * pow(real_of_num(p), 7) - real_of_num(929352431423781402624) * pow(real_of_num(p), 6) - real_of_num(459188080190984724480) * pow(real_of_num(p), 5) - real_of_num(172683375746487091200) * pow(real_of_num(p), 4) - real_of_num(46626662935727308800) * pow(real_of_num(p), 3) - real_of_num(8168330355159859200) * pow(real_of_num(p), 2) - real_of_num(748309452580454400) * real_of_num(p) - real_of_num(16472770766438400)"))
}

///|
let bdry_cof16_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bdry_cof16_tm")

///|
/// `bdry_cof16_tm`
pub fn bdry_cof16_tm() -> @kernel.Term {
  bdry_cof16_tm_c.get()
}

///|
/// SUM_6
fn step_186() -> Unit raise {
  let t1642 = @simp.rewrite_tac(@list.List([@iterate.sum_sing_numseg()]))
  let t1639 = @term_syntax.parse_term("(m : Num) + 1 + 1 == m + 2 && m + 2 + 1 == m + 3 && m + 3 + 1 == m + 4 && m + 4 + 1 == m + 5 && m + 1 + 2 == m + 3 && m + 1 + 3 == m + 4 && m + 1 + 4 == m + 5 && m + 2 + 2 == m + 4 && m + 2 + 3 == m + 5 && m + 3 + 2 == m + 5")
  let t1640 = @bool.conjuncts_rule(@int.arith_rule(t1639))
  let t1635 = @int.arith_rule(@term_syntax.parse_term("(m : Num) + 4 <= m + 5"))
  let t1636 = @int.arith_rule(@term_syntax.parse_term("(m : Num) + 3 <= m + 5"))
  let t1637 = @int.arith_rule(@term_syntax.parse_term("(m : Num) + 2 <= m + 5"))
  let t1638 = @int.arith_rule(@term_syntax.parse_term("(m : Num) + 1 <= m + 5"))
  let t1641 = @simp.simp_tac((@list.List([@iterate.sum_clauses_left(), @int.arith_rule(@term_syntax.parse_term("(m : Num) <= m + 5")), t1638, t1637, t1636, t1635])).concat(t1640))
  let t1643 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1641), t1642), @calc_rat.real_arith_tac)
  sum_6_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, sum(op_dot_dot(m, m + 5), f) == f(m) + (f(m + 1) + (f(m + 2) + (f(m + 3) + (f(m + 4) + f(m + 5)))))"), t1643))
}

///|
let sum_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_6")

///|
/// `SUM_6`
pub fn sum_6() -> @kernel.Thm {
  sum_6_c.get()
}

///|
/// hyp1p
fn step_187() -> Unit raise {
  hyp1p_c.set(@kernel.assume_rule(@term_syntax.parse_term("1 <= (p : Num)")))
}

///|
let hyp1p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyp1p")

///|
/// `hyp1p`
pub fn hyp1p() -> @kernel.Thm {
  hyp1p_c.get()
}

///|
/// supp_rules
fn step_188() -> Unit raise {
  let mk_supp : (Int64) -> ((Int64) -> @kernel.Thm raise) raise = fn(x1644 : Int64) -> ((Int64) -> @kernel.Thm raise) raise {
    let i = x1644
    fn(x1645 : Int64) -> @kernel.Thm raise {
      let t = x1645
      let t1649 = @nums.mk_small_numeral(t)
      let t1648 = @term_syntax.parse_term("(p : Num)")
      let t1650 = @kernel.mk_comb(@kernel.mk_comb(@parser.parse_term("(+):num->num->num"), t1648), t1649)
      let t1647 = @nums.mk_small_numeral(i)
      let t1646 = @term_syntax.parse_term("(p : Num)")
      let th = @bool.specl(@list.List([@kernel.mk_comb(@kernel.mk_comb(@parser.parse_term("(+):num->num->num"), t1646), t1647), t1650]), vv_support())
      @bool.mp(th, @tactics.prove(@basics.dest_imp(@kernel.concl(th)).0, @int.arith_tac))
    }
  }
  supp_rules_c.set(@lib.map(fn(x1651 : (Int64, Int64)) -> @kernel.Thm raise {
    let (i_1, t_1) = x1651
    mk_supp(i_1)(t_1)
  }, @list.List([(1L, 2L), (1L, 3L), (1L, 4L), (1L, 5L), (2L, 3L), (2L, 4L), (2L, 5L), (3L, 4L), (3L, 5L), (4L, 5L)])))
}

///|
let supp_rules_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("supp_rules")

///|
/// `supp_rules`
pub fn supp_rules() -> @list.List[@kernel.Thm] {
  supp_rules_c.get()
}

///|
/// GIDX
fn step_189() -> Unit raise {
  let t1652 = @term_syntax.parse_term("(p : Num) + 0 + 0 == p + 0 && p + 0 + 1 == p + 1 && p + 0 + 2 == p + 2 && p + 1 + 0 == p + 1 && p + 1 + 1 == p + 2 && p + 1 + 2 == p + 3 && p + 2 + 0 == p + 2 && p + 2 + 1 == p + 3 && p + 2 + 2 == p + 4 && p + 3 + 0 == p + 3 && p + 3 + 1 == p + 4 && p + 3 + 2 == p + 5 && p + 4 + 1 == p + 5 && p + 0 == p")
  gidx_c.set(@bool.conjuncts_rule(@int.arith_rule(t1652)))
}

///|
let gidx_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("GIDX")

///|
/// `GIDX`
pub fn gidx() -> @list.List[@kernel.Thm] {
  gidx_c.get()
}

///|
/// `bdry_cl_inst`
pub fn bdry_cl_inst(x1653 : @kernel.Thm, x1654 : Int64, x1655 : Int64) -> @kernel.Thm raise {
  let clg = x1653
  let no = x1654
  let ko = x1655
  let t1659 = @nums.mk_small_numeral(ko)
  let t1658 = @term_syntax.parse_term("(p : Num)")
  let t1660 = @kernel.mk_comb(@kernel.mk_comb(@parser.parse_term("(+):num->num->num"), t1658), t1659)
  let t1657 = @nums.mk_small_numeral(no)
  let t1656 = @term_syntax.parse_term("(p : Num)")
  let inst = @bool.specl(@list.List([@kernel.mk_comb(@kernel.mk_comb(@parser.parse_term("(+):num->num->num"), t1656), t1657), t1660]), clg)
  let pre = @basics.dest_imp(@kernel.concl(inst)).0
  let t1661 = @tactics.then_tac(@tactics.disch_tac, @int.asm_arith_tac)
  let preth = @bool.mp(@tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), pre), t1661), hyp1p())
  let t1662 = @bool.mp(inst, preth)
  @simp.rewrite_rule(gidx().concat(@list.List([@equal.gsym(@realax.real_of_num_add())])))(t1662)
}

///|
/// `prove_bdry_gen_zero2`
pub fn prove_bdry_gen_zero2(x1663 : @kernel.Thm, x1664 : Int64, x1665 : Int64, x1666 : @kernel.Term) -> @kernel.Thm raise {
  let clg = x1663
  let no = x1664
  let ko = x1665
  let gen_tm = x1666
  let t1669 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1668 = @simp.asm_rewrite_tac(@list.List([]))
  let t1670 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(bdry_cl_inst(clg, no, ko))), t1668), t1669)
  let t1667 = @basics.mk_eq(gen_tm, @term_syntax.parse_term("real_of_num(0)"))
  @tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), t1667), t1670)
}

///|
/// gen_specs
fn step_190() -> Unit raise {
  gen_specs_c.set(@list.List([(v_sk2_cl_g(), 5L, 3L), (v_sk2_cl_g(), 5L, 2L), (v_sk2_cl_g(), 5L, 1L), (v_sk2_cl_g(), 5L, 0L), (v_sk2_cl_g(), 4L, 2L), (v_sk2_cl_g(), 4L, 1L), (v_sk2_cl_g(), 4L, 0L), (v_sk2_cl_g(), 3L, 1L), (v_sk2_cl_g(), 3L, 0L), (v_sk2_cl_g(), 2L, 0L), (v_snsk_cl_g(), 4L, 0L), (v_sn2_cl_g(), 3L, 0L), (v_snsk_cl_g(), 3L, 0L), (v_sn2_cl_g(), 2L, 0L), (v_snsk_cl_g(), 2L, 0L), (v_sn2_cl_g(), 1L, 0L), (v_snsk_cl_g(), 1L, 0L)]))
}

///|
let gen_specs_c : @lib.Cell[@list.List[(@kernel.Thm, Int64, Int64)]] = @lib.Cell::new("gen_specs")

///|
/// `gen_specs`
pub fn gen_specs() -> @list.List[(@kernel.Thm, Int64, Int64)] {
  gen_specs_c.get()
}

///|
/// gen_tms
fn step_191() -> Unit raise {
  gen_tms_c.set(@list.List([bdry_gen0_tm(), bdry_gen1_tm(), bdry_gen2_tm(), bdry_gen3_tm(), bdry_gen4_tm(), bdry_gen5_tm(), bdry_gen6_tm(), bdry_gen7_tm(), bdry_gen8_tm(), bdry_gen9_tm(), bdry_gen10_tm(), bdry_gen11_tm(), bdry_gen12_tm(), bdry_gen13_tm(), bdry_gen14_tm(), bdry_gen15_tm(), bdry_gen16_tm()]))
}

///|
let gen_tms_c : @lib.Cell[@list.List[@kernel.Term]] = @lib.Cell::new("gen_tms")

///|
/// `gen_tms`
pub fn gen_tms() -> @list.List[@kernel.Term] {
  gen_tms_c.get()
}

///|
/// cof_tms
fn step_192() -> Unit raise {
  cof_tms_c.set(@list.List([bdry_cof0_tm(), bdry_cof1_tm(), bdry_cof2_tm(), bdry_cof3_tm(), bdry_cof4_tm(), bdry_cof5_tm(), bdry_cof6_tm(), bdry_cof7_tm(), bdry_cof8_tm(), bdry_cof9_tm(), bdry_cof10_tm(), bdry_cof11_tm(), bdry_cof12_tm(), bdry_cof13_tm(), bdry_cof14_tm(), bdry_cof15_tm(), bdry_cof16_tm()]))
}

///|
let cof_tms_c : @lib.Cell[@list.List[@kernel.Term]] = @lib.Cell::new("cof_tms")

///|
/// `cof_tms`
pub fn cof_tms() -> @list.List[@kernel.Term] {
  cof_tms_c.get()
}

///|
/// bdry_gz
fn step_193() -> Unit raise {
  bdry_gz_c.set(@lib.map2(fn(x1671 : (@kernel.Thm, Int64, Int64), x1672 : @kernel.Term) -> @kernel.Thm raise {
    let (clg, no, ko) = x1671
    let gt = x1672
    prove_bdry_gen_zero2(clg, no, ko, gt)
  }, gen_specs(), gen_tms()))
}

///|
let bdry_gz_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("bdry_gz")

///|
/// `bdry_gz`
pub fn bdry_gz() -> @list.List[@kernel.Thm] {
  bdry_gz_c.get()
}

///|
/// bdry_cert_eq
fn step_194() -> Unit raise {
  let cert_rhs = @lib.end_itlist(fn(x1673 : @kernel.Term, x1674 : @kernel.Term) -> @kernel.Term raise {
    let a = x1673
    let b = x1674
    @basics.mk_binop(add_tm(), a, b)
  }, @lib.map2(fn(x1675 : @kernel.Term, x1676 : @kernel.Term) -> @kernel.Term raise {
    let c = x1675
    let g = x1676
    @basics.mk_binop(mul_tm(), c, g)
  }, cof_tms(), gen_tms()))
  let t1677 = @equal.rand_conv(@calc_rat.real_poly_conv)
  let t1678 = @tactics.then_tac(@tactics.conv_tac(@equal.thenc(@equal.land_conv(@calc_rat.real_poly_conv), t1677)), @tactics.refl_tac)
  bdry_cert_eq_c.set(@tactics.prove(@basics.mk_eq(bdry_target_tm(), cert_rhs), t1678))
}

///|
let bdry_cert_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bdry_cert_eq")

///|
/// `bdry_cert_eq`
pub fn bdry_cert_eq() -> @kernel.Thm {
  bdry_cert_eq_c.get()
}

///|
/// BDRY_TARGET_ZERO
fn step_195() -> Unit raise {
  let t1684 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @calc_int.real_add_rid(), @realax.real_add_lid()]))
  let t1683 = @simp.asm_simp_tac(bdry_gz())
  let t1685 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.gen_rewrite_tac(fn(x1680 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1681 = @equal.land_conv(x1680)
    fn(x1682 : @kernel.Term) -> @kernel.Thm raise {
      s1681(x1682)
    }
  }, @list.List([bdry_cert_eq()]))), t1683), t1684)
  let t1679 = @basics.mk_eq(bdry_target_tm(), @term_syntax.parse_term("real_of_num(0)"))
  bdry_target_zero_c.set(@tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), t1679), t1685))
}

///|
let bdry_target_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BDRY_TARGET_ZERO")

///|
/// `BDRY_TARGET_ZERO`
pub fn bdry_target_zero() -> @kernel.Thm {
  bdry_target_zero_c.get()
}

///|
/// BSUM_EXPAND
fn step_196() -> Unit raise {
  let t1692 = @tactics.disch_then(fn(x1689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1690 = @tactics.subst1_tac(x1689)
    fn(x1691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1690(x1691)
    }
  })
  let t1688 = @simp.rewrite_tac(@list.List([]))
  let t1686 = @term_syntax.parse_term("(p : Num)")
  let t1687 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(j : Num) => pflat2(vv, (p : Num) + 1, j)"), t1686]), sum_6()))
  let t1693 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1687), t1688), t1692), @tactics.refl_tac)
  bsum_expand_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, 1 <= p → sum(op_dot_dot(p, p + 5), (j : Num) => pflat2(vv, p + 1, j)) == pflat2(vv, p + 1, p) + (pflat2(vv, p + 1, p + 1) + (pflat2(vv, p + 1, p + 2) + (pflat2(vv, p + 1, p + 3) + (pflat2(vv, p + 1, p + 4) + pflat2(vv, p + 1, p + 5)))))"), t1693))
}

///|
let bsum_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BSUM_EXPAND")

///|
/// `BSUM_EXPAND`
pub fn bsum_expand() -> @kernel.Thm {
  bsum_expand_c.get()
}

///|
/// `prove_pnz`
pub fn prove_pnz(x1694 : @kernel.Term) -> @kernel.Thm raise {
  let f = x1694
  let t1699 = @kernel.assume_rule(@term_syntax.parse_term("1 <= (p : Num)"))
  let t1697 = @tactics.conv_tac(@equal.rand_conv(@equal.land_conv(@calc_rat.real_poly_conv)))
  let t1696 = @equal.gsym(@realax.real_of_num_le())
  let t1698 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1696])), @tactics.disch_tac), t1697), @calc_rat.asm_real_arith_tac)
  let t1695 = @bool.mk_neg(@basics.mk_eq(f, @term_syntax.parse_term("real_of_num(0)")))
  @bool.mp(@tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), t1695), t1698), t1699)
}

///|
/// conn_rhs
fn step_197() -> Unit raise {
  let t1700 = @term_syntax.parse_term("qflat(vv, (p : Num) + 1, p)")
  conn_rhs_c.set(@basics.mk_binop(mul_tm(), bdry_dcom_tm(), @basics.mk_binop(mul_tm(), bdry_bigd_tm(), @basics.mk_binop(add_tm(), @term_syntax.parse_term("sum(op_dot_dot((p : Num), p + 5), (j : Num) => pflat2(vv, p + 1, j))"), t1700))))
}

///|
let conn_rhs_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("conn_rhs")

///|
/// `conn_rhs`
pub fn conn_rhs() -> @kernel.Term {
  conn_rhs_c.get()
}

///|
/// BDRY_CONNECT
fn step_198() -> Unit raise {
  let t1709 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t1708 = @simp.rewrite_tac(@list.List([qc00(), qc01(), qc10()]))
  let t1707 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @calc_int.real_add_rid(), @realax.real_add_lid(), @calc_int.real_mul_lzero()]))
  let t1706 = @simp.rewrite_tac(supp_rules())
  let t1702 = @int.arith_rule(@term_syntax.parse_term("(p : Num) + 1 + 4 == p + 5"))
  let t1703 = @int.arith_rule(@term_syntax.parse_term("(p : Num) + 1 + 3 == p + 4"))
  let t1704 = @int.arith_rule(@term_syntax.parse_term("(p : Num) + 1 + 2 == p + 3"))
  let t1705 = @simp.rewrite_tac(@list.List([pflat2(), pflat(), qflat(), @int.arith_rule(@term_syntax.parse_term("(p : Num) + 1 + 1 == p + 2")), t1704, t1703, t1702]))
  let t1715 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_simp_tac(@list.List([bsum_expand()]))), t1705), t1706), t1707), t1708), t1709), fn(x1714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1710 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x1710
      let dfs = denom_factors(w, @list.List([]))
      let nz = @lib.map(prove_pnz, dfs)
      let t1713 = @kernel.assume_rule(@term_syntax.parse_term("1 <= (p : Num)"))
      let t1712 = prove_rat_eq(nz, w)
      @tactics.accept_tac(@bool.mp(@bool.disch(@term_syntax.parse_term("1 <= (p : Num)"), t1712), t1713))
    })(x1714)(x1714)
  })
  let t1701 = @basics.mk_eq(bdry_target_tm(), conn_rhs())
  bdry_connect_c.set(@tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), t1701), t1715))
}

///|
let bdry_connect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BDRY_CONNECT")

///|
/// `BDRY_CONNECT`
pub fn bdry_connect() -> @kernel.Thm {
  bdry_connect_c.get()
}

///|
/// BDRY_DCOM_NZ
fn step_199() -> Unit raise {
  let t1726 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1725 = @tactics.repeat_tac(@tactics.pop_assum(fn(x1722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1723 = @tactics.mp_tac(x1722)
    fn(x1724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1723(x1724)
    }
  }))
  let t1721 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t1727 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_entire(), @real.real_pow_eq_0(), @class.de_morgan_thm()])), t1721), t1725), t1726), @calc_rat.asm_real_arith_tac)
  let t1720 = @equal.rand_conv(@calc_rat.real_poly_conv)
  let t1728 = @list.List([@tactics.then_tac(@tactics.conv_tac(@equal.thenc(@equal.land_conv(@calc_rat.real_poly_conv), t1720)), @tactics.refl_tac), t1727])
  let t1729 = @tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@basics.mk_eq(bdry_dcom_tm(), @term_syntax.parse_term("pow(real_of_num((p : Num)) + real_of_num(1), 4) * (pow(real_of_num(p) + real_of_num(2), 5) * (pow(real_of_num(p) + real_of_num(3), 2) * pow(real_of_num(p) + real_of_num(4), 2)))")), fn(x1717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1718 = @tactics.subst1_tac(x1717)
    fn(x1719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1718(x1719)
    }
  })), t1728)
  let t1716 = @bool.mk_neg(@basics.mk_eq(bdry_dcom_tm(), @term_syntax.parse_term("real_of_num(0)")))
  bdry_dcom_nz_c.set(@tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), t1716), t1729))
}

///|
let bdry_dcom_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BDRY_DCOM_NZ")

///|
/// `BDRY_DCOM_NZ`
pub fn bdry_dcom_nz() -> @kernel.Thm {
  bdry_dcom_nz_c.get()
}

///|
/// BDRY_BIGD_NZ
fn step_200() -> Unit raise {
  let t1741 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1740 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1739 = @tactics.repeat_tac(@tactics.pop_assum(fn(x1736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1737 = @tactics.mp_tac(x1736)
    fn(x1738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1737(x1738)
    }
  }))
  let t1735 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t1742 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_entire(), @real.real_pow_eq_0(), @class.de_morgan_thm()])), t1735), t1739), t1740), t1741), @calc_rat.asm_real_arith_tac)
  let t1734 = @equal.rand_conv(@calc_rat.real_poly_conv)
  let t1743 = @list.List([@tactics.then_tac(@tactics.conv_tac(@equal.thenc(@equal.land_conv(@calc_rat.real_poly_conv), t1734)), @tactics.refl_tac), t1742])
  let t1744 = @tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@basics.mk_eq(bdry_bigd_tm(), @term_syntax.parse_term("real_of_num(3600) * (pow(real_of_num((p : Num)) + real_of_num(3), 3) * pow(real_of_num(p) + real_of_num(4), 3))")), fn(x1731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1732 = @tactics.subst1_tac(x1731)
    fn(x1733 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1732(x1733)
    }
  })), t1743)
  let t1730 = @bool.mk_neg(@basics.mk_eq(bdry_bigd_tm(), @term_syntax.parse_term("real_of_num(0)")))
  bdry_bigd_nz_c.set(@tactics.prove(@bool.mk_imp(@term_syntax.parse_term("1 <= (p : Num)"), t1730), t1744))
}

///|
let bdry_bigd_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BDRY_BIGD_NZ")

///|
/// `BDRY_BIGD_NZ`
pub fn bdry_bigd_nz() -> @kernel.Thm {
  bdry_bigd_nz_c.get()
}

///|
/// BOUNDARY
fn step_201() -> Unit raise {
  let t1759 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1758 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm()]))
  let t1757 = @simp.asm_rewrite_tac(@list.List([]))
  let t1756 = @tactics.mp_tac(@bool.spec_all(bdry_bigd_nz()))
  let t1755 = @simp.asm_rewrite_tac(@list.List([]))
  let t1754 = @tactics.mp_tac(@bool.spec_all(bdry_dcom_nz()))
  let t1753 = @tactics.disch_then(fn(x1749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th1 = x1749
    @tactics.disch_then(fn(x1751 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th2 = x1751
      @tactics.mp_tac(@kernel.trans(@equal.sym(th2), th1))
    })
  })
  let t1748 = @simp.asm_rewrite_tac(@list.List([]))
  let t1747 = @tactics.mp_tac(@bool.spec_all(bdry_target_zero()))
  let t1746 = @simp.asm_rewrite_tac(@list.List([]))
  let t1745 = @tactics.mp_tac(@bool.spec_all(bdry_connect()))
  let t1760 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1745), t1746), t1747), t1748), t1753), t1754), t1755), t1756), t1757), t1758), t1759)
  boundary_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, 1 <= p → sum(op_dot_dot(p, p + 5), (j : Num) => pflat2(vv, p + 1, j)) == -qflat(vv, p + 1, p)"), t1760))
}

///|
let boundary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDARY")

///|
/// `BOUNDARY`
pub fn boundary() -> @kernel.Thm {
  boundary_c.get()
}

///|
/// PFLAT_WW_GE3
fn step_202() -> Unit raise {
  let t1780 = @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → n - 1 + 5 == n + 4"))
  let t1781 = @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → n - 1 + 1 == n"))
  let t1782 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → 1 <= n - 1")), t1781, t1780]))
  let t1783 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) - 1"), boundary())), t1782), @tactics.all_tac])
  let t1779 = @tactics.subgoal_then(@term_syntax.parse_term("sum(op_dot_dot((n : Num) - 1, n + 4), (j : Num) => pflat2(vv, n, j)) == -qflat(vv, n, n - 1)"), fn(x1776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1777 = @tactics.subst1_tac(x1776)
    fn(x1778 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1777(x1778)
    }
  })
  let t1775 = @simp.asm_simp_tac(@list.List([interior_full()]))
  let t1773 = @tactics.disch_then(fn(x1771 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1771
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t1769 = @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → n - 2 <= n + 4"))
  let t1770 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → 0 <= n - 2 + 1 && n - 2 + 1 == n - 1")), @arith.le_0(), t1769]))
  let t1766 = @term_syntax.parse_term("(n : Num) + 4")
  let t1767 = @term_syntax.parse_term("(n : Num) - 2")
  let t1768 = @term_syntax.parse_term("0")
  let t1774 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(j : Num) => pflat2(vv, (n : Num), j)"), t1768, t1767, t1766]), @iterate.sum_combine_r())), t1770), t1773), @tactics.all_tac])
  let t1765 = @tactics.subgoal_then(@term_syntax.parse_term("sum(op_dot_dot(0, (n : Num) + 4), (j : Num) => pflat2(vv, n, j)) == sum(op_dot_dot(0, n - 2), (j : Num) => pflat2(vv, n, j)) + sum(op_dot_dot(n - 1, n + 4), (j : Num) => pflat2(vv, n, j))"), fn(x1762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1763 = @tactics.subst1_tac(x1762)
    fn(x1764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1763(x1764)
    }
  })
  let t1761 = @simp.rewrite_tac(@list.List([pflat_ww_decomp()]))
  let t1784 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1761), t1765), t1774), t1775), t1779), t1783), @calc_rat.real_arith_tac)
  pflat_ww_ge3_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → pflat(ww, n) == real_of_num(0)"), t1784))
}

///|
let pflat_ww_ge3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PFLAT_WW_GE3")

///|
/// `PFLAT_WW_GE3`
pub fn pflat_ww_ge3() -> @kernel.Thm {
  pflat_ww_ge3_c.get()
}

///|
/// PFLAT_WW
fn step_203() -> Unit raise {
  let t1810 = @tactics.then_tac(@tactics.match_mp_tac(pflat_ww_ge3()), @int.asm_arith_tac)
  let t1809 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1808 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1802 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t1803 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t1804 = @calc_num.num_conv(@term_syntax.parse_term("3"))
  let t1805 = @calc_num.num_conv(@term_syntax.parse_term("4"))
  let t1806 = @calc_num.num_conv(@term_syntax.parse_term("5"))
  let t1807 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("6")), t1806, t1805, t1804, t1803, t1802, @binomial.binom_v1()]))
  let t1801 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1795 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t1796 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t1797 = @calc_num.num_conv(@term_syntax.parse_term("3"))
  let t1798 = @calc_num.num_conv(@term_syntax.parse_term("4"))
  let t1799 = @calc_num.num_conv(@term_syntax.parse_term("5"))
  let t1800 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("6")), t1799, t1798, t1797, t1796, t1795, @iterate.sum_clauses_numseg()]))
  let t1794 = @simp.rewrite_tac(@list.List([ww(), vv(), cc(), ss()]))
  let t1793 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1792 = @simp.rewrite_tac(@list.List([pflat()]))
  let t1791 = @list.List([@int.asm_arith_tac, @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1789 = @tactics.subst1_tac(x1788)
    fn(x1790 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1789(x1790)
    }
  }))])
  let t1811 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == 0 || n == 1 || n == 2"), fn(x1785 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1786 = @tactics.mp_tac(x1785)
    fn(x1787 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1786(x1787)
    }
  }), t1791), t1792), t1793), t1794), t1800), t1801), t1807), t1808), t1809), t1810])
  let t1812 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < 3"))), t1811)
  pflat_ww_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pflat(ww, n) == real_of_num(0)"), t1812))
}

///|
let pflat_ww_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PFLAT_WW")

///|
/// `PFLAT_WW`
pub fn pflat_ww() -> @kernel.Thm {
  pflat_ww_c.get()
}

///|
/// PFLAT_BB
fn step_204() -> Unit raise {
  let t1816 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pflat_aazz(), pflat_ww()])), @calc_rat.real_arith_tac)
  let t1817 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pflat(), bb_as_aazz_ww()])), @tactics.beta_tac), @calc_rat.real_arith_tac), t1816])
  let t1818 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("pflat(bb, (n : Num)) == pflat((m : Num) => aa(m) * zz(m), n) + pflat(ww, n)"), fn(x1813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1814 = @tactics.subst1_tac(x1813)
    fn(x1815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1814(x1815)
    }
  })), t1817)
  pflat_bb_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pflat(bb, n) == real_of_num(0)"), t1818))
}

///|
let pflat_bb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PFLAT_BB")

///|
/// `PFLAT_BB`
pub fn pflat_bb() -> @kernel.Thm {
  pflat_bb_c.get()
}

///|
/// BB_RECURRENCE
fn step_205() -> Unit raise {
  let t1823 = @meson.meson_tac(@list.List([]))
  let t1822 = @simp.rewrite_tac(@list.List([mol_factor(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))]))
  let t1821 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), pflat_bb()))
  let t1820 = @simp.rewrite_tac(@list.List([lop_bb_0(), lop_bb_1()]))
  let t1819 = @tactics.match_mp_tac(m_kernel_trivial())
  let t1824 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(lop())])), t1819), t1820), @tactics.gen_tac), t1821), t1822), t1823)
  bb_recurrence_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pow(real_of_num(n) + real_of_num(2), 3) * bb(n + 2) - (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) * bb(n + 1)) + pow(real_of_num(n) + real_of_num(1), 3) * bb(n) == real_of_num(0)"), t1824))
}

///|
let bb_recurrence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_RECURRENCE")

///|
/// `BB_RECURRENCE`
pub fn bb_recurrence() -> @kernel.Thm {
  bb_recurrence_c.get()
}

///|
/// dd
fn step_206() -> Unit raise {
  dd_c.set(@pair.new_definition(@term_syntax.parse_term("(dd : (Num) -> Real)((n : Num)) == aa(n) * bb(n + 1) - aa(n + 1) * bb(n)")))
}

///|
let dd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dd")

///|
/// `dd`
pub fn dd() -> @kernel.Thm {
  dd_c.get()
}

///|
/// DD_RECURRENCE
fn step_207() -> Unit raise {
  let t1828 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1827 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))]))
  let t1826 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), bb_recurrence()))
  let t1825 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), aa_recurrence()))
  let t1829 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([dd()]))), t1825), t1826), t1827), t1828)
  dd_recurrence_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, pow(real_of_num(n) + real_of_num(2), 3) * dd(n + 1) == pow(real_of_num(n) + real_of_num(1), 3) * dd(n)"), t1829))
}

///|
let dd_recurrence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DD_RECURRENCE")

///|
/// `DD_RECURRENCE`
pub fn dd_recurrence() -> @kernel.Thm {
  dd_recurrence_c.get()
}

///|
/// DD_EXPLICIT
fn step_208() -> Unit raise {
  let t1839 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1838 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1837 = @simp.rewrite_tac(@list.List([@binomial.binom_v1()]))
  let t1836 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @iterate.sum_clauses_numseg()]))
  let t1835 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1834 = @simp.rewrite_tac(@list.List([dd(), bb(), aa(), cc(), zz()]))
  let t1832 = @tactics.conv_tac(@calc_rat.real_field)
  let t1831 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]))
  let t1833 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), dd_recurrence())), t1831), t1832)
  let t1830 = @simp.rewrite_tac(@list.List([@real.real_div_1()]))
  let t1840 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@tactics.conv_tac(@calc_rat.real_rat_reduce_conv), t1830), t1833])), t1834), t1835), t1836), t1837), t1838), t1839)
  dd_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, dd(n) == real_of_num(6) / pow(real_of_num(n) + real_of_num(1), 3)"), t1840))
}

///|
let dd_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DD_EXPLICIT")

///|
/// `DD_EXPLICIT`
pub fn dd_explicit() -> @kernel.Thm {
  dd_explicit_c.get()
}

///|
/// AA_INCREASING
fn step_209() -> Unit raise {
  let t1852 = @equal.gsym(@realax.real_of_num_add())
  let t1853 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @binomial.binom(), t1852, @arith.add_clauses()]))
  let t1851 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs()), @calc_int.real_abs_num()]))
  let t1850 = @simp.simp_tac(@list.List([@real.real_pow_le(), @realarith.real_pos()]))
  let t1849 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1848 = @simp.rewrite_tac(@list.List([]))
  let t1847 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1846 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t1845 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → x < real_of_num(1) + y")))
  let t1844 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1843 = @simp.rewrite_tac(@list.List([@binomial.binom()]))
  let t1842 = @simp.rewrite_tac(@list.List([@bool.spec(@term_syntax.parse_term("1"), @iterate.sum_offset())]))
  let t1841 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @int.arith_rule(@term_syntax.parse_term("0 <= (n : Num) + 1"))]))
  let t1854 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([aa(), cc()]))), t1841), t1842), t1843), t1844), t1845), t1846), t1847), @tactics.strip_tac), t1848), t1849), t1850), t1851), t1853), @calc_rat.real_arith_tac)
  aa_increasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, aa(n) < aa(n + 1)"), t1854))
}

///|
let aa_increasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_INCREASING")

///|
/// `AA_INCREASING`
pub fn aa_increasing() -> @kernel.Thm {
  aa_increasing_c.get()
}

///|
/// AA_MONOTONIC
fn step_210() -> Unit raise {
  let t1855 = @simp.simp_tac(@list.List([aa_increasing(), @arith.add1(), @realarith.real_lt_imp_le()]))
  let t1856 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.transitive_stepwise_le()), t1855), @calc_rat.real_arith_tac)
  aa_monotonic_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → aa(m) <= aa(n)"), t1856))
}

///|
let aa_monotonic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_MONOTONIC")

///|
/// `AA_MONOTONIC`
pub fn aa_monotonic() -> @kernel.Thm {
  aa_monotonic_c.get()
}

///|
/// AA_RECURRENCE_SCALED
fn step_211() -> Unit raise {
  let t1858 = @tactics.conv_tac(@calc_rat.real_field)
  let t1857 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1859 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(aa_recurrence()), t1857), t1858)
  aa_recurrence_scaled_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, aa(n + 2) == (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) / pow(real_of_num(n) + real_of_num(2), 3) * aa(n + 1)) - pow(real_of_num(n) + real_of_num(1), 3) / pow(real_of_num(n) + real_of_num(2), 3) * aa(n)"), t1859))
}

///|
let aa_recurrence_scaled_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_RECURRENCE_SCALED")

///|
/// `AA_RECURRENCE_SCALED`
pub fn aa_recurrence_scaled() -> @kernel.Thm {
  aa_recurrence_scaled_c.get()
}

///|
/// APERY_RATIO_COEFF_LIM
fn step_212() -> Unit raise {
  let t1867 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const(), @realanalysis.reallim_1_over_n_offset()]))
  let t1866 = @tactics.match_mp_tac(@realanalysis.reallim_sub())
  let t1865 = @simp.rewrite_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(real_of_num((n : Num)) + real_of_num(1)) / (real_of_num(n) + real_of_num(2)) == real_of_num(1) - inv(real_of_num(n) + real_of_num(2))"))]))
  let t1864 = @tactics.match_mp_tac(@realanalysis.reallim_pow())
  let t1863 = @simp.gen_rewrite_tac(fn(x1860 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1861 = @equal.land_conv(x1860)
    fn(x1862 : @kernel.Term) -> @kernel.Thm raise {
      s1861(x1862)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) == pow(real_of_num(1) - real_of_num(0), 3)"))]))
  let t1868 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_div())])), t1863), t1864), t1865), t1866), t1867)
  apery_ratio_coeff_lim_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => pow(real_of_num(n) + real_of_num(1), 3) / pow(real_of_num(n) + real_of_num(2), 3), real_of_num(1), sequentially)"), t1868))
}

///|
let apery_ratio_coeff_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APERY_RATIO_COEFF_LIM")

///|
/// `APERY_RATIO_COEFF_LIM`
pub fn apery_ratio_coeff_lim() -> @kernel.Thm {
  apery_ratio_coeff_lim_c.get()
}

///|
/// APERY_MAIN_COEFF_LIM
fn step_213() -> Unit raise {
  let t1885 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @real.real_pow_le(), @realarith.real_pos()]))
  let t1884 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), @tactics.conj_tac))
  let t1883 = @tactics.conv_tac(@equal.rand_conv(@calc_rat.real_poly_conv))
  let t1882 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t1881 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_pow_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(2)"))]))
  let t1880 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / (b : Real) * (c : Real) == a * c / b"))]))
  let t1879 = @simp.simp_tac(@list.List([@realax.real_abs(), @realarith.real_le_add(), @realax.real_le_mul(), @real.real_pow_le(), @realarith.real_pos()]))
  let t1878 = @simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_pow(), @calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num((n : Num)) + real_of_num(2)) == real_of_num(n) + real_of_num(2)"))]))
  let t1877 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_rdiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1876 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1875 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1874 = @simp.simp_tac(@list.List([@realanalysis.reallim_null_lmul(), @realanalysis.reallim_1_over_n(), @metric.eventually_sequentially()]))
  let t1873 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(120) * inv(real_of_num(n))"))
  let t1872 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t1871 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t1870 = @tactics.match_mp_tac(@realanalysis.reallim_sub())
  let t1869 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(real_of_num(2) * real_of_num((n : Num)) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) / pow(real_of_num(n) + real_of_num(2), 3)) == real_of_num(34) - (real_of_num(51) * pow(real_of_num(n), 2) + (real_of_num(177) * real_of_num(n) + real_of_num(155))) / pow(real_of_num(n) + real_of_num(2), 3)"))]))
  let t1886 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(34) == real_of_num(34) - real_of_num(0)"))), t1869), t1870), t1871), t1872), t1873), t1874), t1875), t1876), t1877), t1878), t1879), t1880), t1881), t1882), t1883), t1884), t1885)
  apery_main_coeff_lim_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => (real_of_num(2) * real_of_num(n) + real_of_num(3)) * ((real_of_num(17) * pow(real_of_num(n), 2) + (real_of_num(51) * real_of_num(n) + real_of_num(39))) / pow(real_of_num(n) + real_of_num(2), 3)), real_of_num(34), sequentially)"), t1886))
}

///|
let apery_main_coeff_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APERY_MAIN_COEFF_LIM")

///|
/// `APERY_MAIN_COEFF_LIM`
pub fn apery_main_coeff_lim() -> @kernel.Thm {
  apery_main_coeff_lim_c.get()
}

///|
/// AA_LOWERBOUND
fn step_214() -> Unit raise {
  let t1959 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul(), @realarith.real_pos()]))
  let t1958 = @simp.gen_rewrite_tac(fn(x1955 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1956 = @equal.land_conv(x1955)
    fn(x1957 : @kernel.Term) -> @kernel.Thm raise {
      s1956(x1957)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (real_of_num(31) * (b : Real)) == real_of_num(31) * (a * b)"))]))
  let t1954 = @list.List([@int.asm_arith_tac, @tactics.disch_then(fn(x1952 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1952
    @simp.rewrite_tac(@list.List([th_1]))
  })])
  let t1951 = @tactics.subgoal_then(@term_syntax.parse_term("(N : Num) + (d : Num) - 1 + 1 == N + d"), fn(x1948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1949 = @tactics.subst1_tac(x1948)
    fn(x1950 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1949(x1950)
    }
  })
  let t1947 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(N : Num) + (d : Num) - 1"), aa_increasing()))
  let t1946 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= real_of_num(31) * (a : Real) && (b : Real) < a → x <= real_of_num(33) * a - real_of_num(2) * b")))
  let t1944 = @tactics.thenl(@tactics.ants_tac, @list.List([@int.asm_arith_tac, @calc_rat.real_arith_tac]))
  let t1939 = @term_syntax.parse_term("(N : Num) + (d : Num) - 1")
  let t1942 = @tactics.remove_then("1", fn(x1941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1937 = @tactics.mp_tac(x1936)
      fn(x1938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1937(x1938)
      }
    })(((x1940 : @kernel.Thm) => @bool.spec(t1939, x1940))(x1941))
  })
  let t1933 = @term_syntax.parse_term("(N : Num) + (d : Num) - 1")
  let t1943 = @list.List([@tactics.remove_then("2", fn(x1935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1930 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1931 = @tactics.mp_tac(x1930)
      fn(x1932 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1931(x1932)
      }
    })(((x1934 : @kernel.Thm) => @bool.spec(t1933, x1934))(x1935))
  }), t1942])
  let t1929 = @simp.simp_tac(@list.List([@real.real_le_rmul_eq(), aa_pos_lt(), @realax.real_mul_assoc()]))
  let t1945 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) && (z : Real) <= (w : Real) → x - w <= y - z"))), @tactics.conj_tac), t1929), t1943), t1944)])
  let t1927 = @term_syntax.parse_term("real_of_num(33) * aa((N : Num) + (d : Num)) - real_of_num(2) * aa(N + d - 1)")
  let t1928 = @tactics.trans_tac(@realax.real_le_trans())(t1927)
  let t1926 = @list.List([@int.asm_arith_tac, @tactics.disch_then(fn(x1923 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1924 = @tactics.subst1_tac(x1923)
    fn(x1925 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1924(x1925)
    }
  })])
  let t1922 = @tactics.subgoal_then(@term_syntax.parse_term("(N : Num) + (d : Num) - 1 + 2 == SUC(N + d) && N + d - 1 + 1 == N + d"), fn(x1920 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1920
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1919 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(N : Num) + (d : Num) - 1"), aa_recurrence_scaled()))
  let t1918 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @realarith.real_mul_rid(), @arith.add_clauses(), @realax.real_le_refl()]))
  let t1917 = @simp.simp_tac(@list.List([@real.real_pow_add(), @realax.real_mul_assoc(), @real.real_div_rmul(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith(), @real.real_lt_imp_nz()]))
  let t1916 = @simp.abbrev_tac(@term_syntax.parse_term("(N : Num) == MAX((N1 : Num), (N2 : Num)) + 2"))
  let t1915 = @simp.rewrite_tac(@list.List([@theorems.forall_unwind_thm2()]))
  let t1914 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1913 = @simp.rewrite_tac(@list.List([@arith.le_exists(), @theorems.left_imp_exists_thm()]))
  let t1912 = @simp.simp_tac(@list.List([aa_pos_lt(), @real.real_lt_div(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t1910 = @term_syntax.parse_term("MAX((N1 : Num), (N2 : Num)) + 2")
  let t1911 = @tactics.map_every(fn(x1907 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1908 = @tactics.exists_tac(x1907)
    fn(x1909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1908(x1909)
    }
  }, @list.List([@term_syntax.parse_term("aa(MAX((N1 : Num), (N2 : Num)) + 2) / pow(real_of_num(31), MAX(N1, N2) + 2)"), t1910]))
  let t1905 = @tactics.x_choose_then(@term_syntax.parse_term("(N2 : Num)"))(fn(x1902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1903 = ((x1901 : @kernel.Thm) => @tactics.label_tac("2", x1901))(x1902)
    fn(x1904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1903(x1904)
    }
  })
  let t1906 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))(fn(x1898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1899 = ((x1897 : @kernel.Thm) => @tactics.label_tac("1", x1897))(x1898)
    fn(x1900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1899(x1900)
    }
  }), t1905))
  let t1896 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t1892 = @term_syntax.parse_term("real_of_num(1)")
  let t1895 = @tactics.disch_then(fn(x1894 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1890 = @tactics.mp_tac(x1889)
      fn(x1891 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1890(x1891)
      }
    })(((x1893 : @kernel.Thm) => @bool.spec(t1892, x1893))(x1894))
  })
  let t1888 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @realanalysis.reallim_sequentially(), @theorems.and_forall_thm()]))
  let t1887 = @tactics.mp_tac(apery_ratio_coeff_lim())
  let t1960 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(apery_main_coeff_lim()), t1887), t1888), t1895), t1896), t1906), t1911), t1912), t1913), t1914), t1915), t1916), t1917), @nums.induct_tac), t1918), t1919), t1922), t1926), t1928), @tactics.conj_tac), t1945), t1946), t1947), t1951), t1954), t1958), t1959)
  aa_lowerbound_c.set(@tactics.prove(@term_syntax.parse_term("∃ A : Real, ∃ N : Num, real_of_num(0) < A && (∀ n : Num, N <= n → A * pow(real_of_num(31), n) <= aa(n))"), t1960))
}

///|
let aa_lowerbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AA_LOWERBOUND")

///|
/// `AA_LOWERBOUND`
pub fn aa_lowerbound() -> @kernel.Thm {
  aa_lowerbound_c.get()
}

///|
/// APPROXIMATION_BOUND
fn step_215() -> Unit raise {
  let t2007 = @simp.rewrite_tac(@list.List([@realanalysis.real_sums(), @simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(zz()), @misc.from_inter_numseg(), @realax.real_div(), @realax.real_mul_lid()]))
  let t2006 = @tactics.mp_tac(zz_lim())
  let t2003 = @tactics.match_mp_tac(@realanalysis.real_infsum_unique())
  let t2004 = @tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_imp_le()), t2003)
  let t2002 = @tactics.exists_tac(@term_syntax.parse_term("ZETA(real_of_num(3))"))
  let t2001 = @list.List([@int.arith_tac, @tactics.match_mp_tac(@realanalysis.real_sums_summable())])
  let t2000 = @simp.simp_tac(@list.List([@real.real_le_inv_eq(), @real.real_pow_le(), @realarith.real_pos()]))
  let t1999 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.subset(), @iterate.in_numseg(), @misc.in_from()]))
  let t2005 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_partial_sums_le_infsum_gen()), t1999), t2000), @tactics.conj_tac), t2001), t2002), t2004])
  let t1997 = @term_syntax.parse_term("real_infsum(from(1), (n : Num) => inv(pow(real_of_num(n), 3)))")
  let t1998 = @tactics.trans_tac(@realax.real_le_trans())(t1997)
  let t1996 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.spec(@term_syntax.parse_term("1"), @iterate.sum_offset())), @realax.real_of_num_add()]))
  let t1995 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t1994 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1993 = @simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_lmul()]))
  let t2008 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@real.real_le_div2_eq(), aa_pos_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(6) * ((a : Real) / (b : Real)) == real_of_num(6) * a / b"))])), t1993), t1994), t1995), t1996), t1998), @tactics.conj_tac), t2005), t2006), t2007)
  let t1992 = @simp.asm_simp_tac(@list.List([aa_monotonic(), aa_pos_lt(), @arith.le_add_rcancel()]))
  let t1991 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1990 = @simp.asm_simp_tac(@list.List([@realax.real_mul_lid(), aa_monotonic()]))
  let t1989 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), aa_pos_lt()]))
  let t1988 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @real.real_le_inv_eq(), @realarith.real_lt_imp_le(), aa_pos_lt()]))
  let t1987 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1986 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t1985 = @simp.asm_simp_tac(@list.List([@real.real_le_div2_eq(), @real.real_pow_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((k : Num)) + real_of_num(1)"))]))
  let t1983 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * (real_of_num(6) * (inv((k1 : Real)) * (inv((ak : Real)) * inv((ak1 : Real))))) <= real_of_num(6) * (inv(k1) * inv((an1 : Real)))) == (a / ak * inv(ak1) / k1 <= real_of_num(1) / an1 / k1)"))
  let t1984 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), t1983]))
  let t1982 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1981 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t2009 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@iterate.sum_rmul()), @real.real_inv_mul()])), t1981), t1982), @tactics.strip_tac), t1984), t1985), t1986), t1987), t1988), t1989), t1990), t1991), t1992), t2008])
  let t1979 = @term_syntax.parse_term("sum(op_dot_dot((n : Num), (m : Num)), (k : Num) => real_of_num(6) / pow(real_of_num(k) + real_of_num(1), 3)) / aa(n + 1)")
  let t1980 = @tactics.trans_tac(@realax.real_le_trans())(t1979)
  let t1978 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t1977 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1976 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1975 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1974 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) < (a' : Real) → (b' : Real) / a' - (b : Real) / a == (a * b' - a' * b) / (a * a')"))
  let t2010 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([aa_pos_lt(), @equal.gsym(dd()), dd_explicit(), t1974])), t1975), t1976), t1977), @tactics.disch_tac), t1978), t1980), @tactics.conj_tac), t2009)
  let t1971 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) <= (n : Num) → N <= n + 1"))]))
  let t1970 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1969 = @tactics.mp_tac(bb_over_aa_lim())
  let t1968 = @tactics.match_mp_tac(@realanalysis.reallim_rmul())
  let t1967 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t1972 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_sub()), t1967), t1968), t1969), t1970), t1971)
  let t1966 = @simp.simp_tac(@list.List([@real.real_sub_ldistrib(), @real.real_div_lmul(), aa_nonzero()]))
  let t1965 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1973 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t1965), t1966), @calc_rat.real_arith_tac), t1972])
  let t1964 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => bb(m + 1) / aa(m + 1) * aa((n : Num)) - bb(n)"))
  let t1963 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t2011 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_diffs_alt()])), t1963), t1964), @tactics.conj_tac), t1973), t2010])
  let t1962 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t1961 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => aa((n : Num)) * sum(op_dot_dot(n, m), (k : Num) => bb(k + 1) / aa(k + 1) - bb(k) / aa(k))"))
  let t2012 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @realanalysis.reallim_ubound()))), t1961), t1962), @tactics.conj_tac), t2011)
  approximation_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ZETA(real_of_num(3)) * aa(n) - bb(n) <= real_of_num(6) * (ZETA(real_of_num(3)) / aa(n + 1))"), t2012))
}

///|
let approximation_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPROXIMATION_BOUND")

///|
/// `APPROXIMATION_BOUND`
pub fn approximation_bound() -> @kernel.Thm {
  approximation_bound_c.get()
}

///|
/// BB_OVER_AA_INCREASES
fn step_216() -> Unit raise {
  let t2020 = @tactics.match_mp_tac(@real.real_pow_lt())
  let t2019 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2018 = @tactics.match_mp_tac(@real.real_lt_div())
  let t2017 = @simp.rewrite_tac(@list.List([@equal.gsym(dd()), dd_explicit()]))
  let t2016 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_lt())]))
  let t2015 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2014 = @simp.simp_tac(@list.List([aa_pos_lt(), @real.real_lt_ldiv_eq()]))
  let t2013 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) / (a : Real) * (c : Real) == b * c / a"))]))
  let t2021 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([@realarith.real_sub_lt(), aa_pos_lt(), @real.real_lt_rdiv_eq()]))), t2013), t2014), t2015), t2016), t2017), t2018), t2019), t2020), @calc_rat.real_arith_tac)
  bb_over_aa_increases_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, bb(n) / aa(n) < bb(n + 1) / aa(n + 1)"), t2021))
}

///|
let bb_over_aa_increases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_OVER_AA_INCREASES")

///|
/// `BB_OVER_AA_INCREASES`
pub fn bb_over_aa_increases() -> @kernel.Thm {
  bb_over_aa_increases_c.get()
}

///|
/// BB_OVER_AA_LT_ZETA3
fn step_217() -> Unit raise {
  let t2052 = @simp.rewrite_tac(@list.List([@arith.add1(), bb_over_aa_increases()]))
  let t2051 = @simp.rewrite_tac(@list.List([@realarith.real_lt_trans()]))
  let t2050 = @tactics.match_mp_tac(@arith.transitive_stepwise_lt())
  let t2048 = @term_syntax.parse_term("(s : Num)")
  let t2049 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num) + 1"), t2048)
  let t2046 = @term_syntax.parse_term("(r : Num)")
  let t2047 = @tactics.spec_tac(@term_syntax.parse_term("MAX((m : Num), (n : Num) + 2)"), t2046)
  let t2045 = @tactics.mp_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 < MAX((m : Num), n + 2)")))
  let t2044 = @tactics.subgoal_then(@term_syntax.parse_term("bb((n : Num) + 1) / aa(n + 1) < bb(MAX((m : Num), n + 2)) / aa(MAX(m, n + 2))"), fn(x2041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2042 = @tactics.mp_tac(x2041)
    fn(x2043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2042(x2043)
    }
  })
  let t2040 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= MAX(m, (n : Num))"))]))
  let t2036 = @term_syntax.parse_term("MAX((m : Num), (n : Num) + 2)")
  let t2039 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(x2038 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2033 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2034 = @tactics.mp_tac(x2033)
      fn(x2035 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2034(x2035)
      }
    })(((x2037 : @kernel.Thm) => @bool.spec(t2036, x2037))(x2038))
  }))
  let t2032 = @simp.rewrite_tac(@list.List([@realarith.real_sub_lt(), bb_over_aa_increases()]))
  let t2028 = @term_syntax.parse_term("bb((n : Num) + 1) / aa(n + 1) - bb(n) / aa(n)")
  let t2031 = @tactics.disch_then(fn(x2030 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2025 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2026 = @tactics.mp_tac(x2025)
      fn(x2027 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2026(x2027)
      }
    })(((x2029 : @kernel.Thm) => @bool.spec(t2028, x2029))(x2030))
  })
  let t2024 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t2023 = @tactics.mp_tac(bb_over_aa_lim())
  let t2022 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2053 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_not_le())])), t2022), t2023), t2024), t2031), t2032), t2039), t2040), t2044), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t2045), t2047), t2049), t2050), t2051), t2052)
  bb_over_aa_lt_zeta3_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, bb(n) / aa(n) < ZETA(real_of_num(3))"), t2053))
}

///|
let bb_over_aa_lt_zeta3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BB_OVER_AA_LT_ZETA3")

///|
/// `BB_OVER_AA_LT_ZETA3`
pub fn bb_over_aa_lt_zeta3() -> @kernel.Thm {
  bb_over_aa_lt_zeta3_c.get()
}

///|
/// IRRATIONAL_ZETA3
fn step_218() -> Unit raise {
  let t2155 = @simp.rewrite_tac(@list.List([bb_over_aa_increases()]))
  let t2154 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) < (a : Real) → !(a == b)")))
  let t2153 = @tactics.disch_then(fn(x2150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2151 = @tactics.subst1_tac(x2150)
    fn(x2152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2151(x2152)
    }
  })
  let t2149 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @arith.le_add()]))
  let t2148 = @tactics.disch_then(fn(x2145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2145
    let t2147 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("MAX((M : Num), (N : Num)) + 1"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("MAX((M : Num), (N : Num))"), th)), t2147)
  })
  let t2144 = @simp.simp_tac(@list.List([aa_pos_lt(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (a : Real) → ((b : Real) == (z : Real) * a) == (z == b / a)"))]))
  let t2143 = @simp.rewrite_tac(@list.List([@realarith.real_sub_0()]))
  let t2142 = @simp.simp_tac(@list.List([@realarith.real_entire(), @real.real_pow_eq_0(), @realax.real_of_num_eq(), lcm_nonzero(), @calc_num.arith()]))
  let t2140 = @meson.asm_meson_tac(@list.List([@floor.integer_closed(), @floor.real_eq_integers_imp()]))
  let t2141 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(MAX((M : Num), (N : Num)) <= (n : Num)) == (M <= n && N <= n)"))])), t2140), @tactics.all_tac])
  let t2139 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, MAX((M : Num), (N : Num)) <= n → real_of_num(2) * (pow(real_of_num(LCM(op_dot_dot(1, n))), 3) * (bb(n) - ZETA(real_of_num(3)) * aa(n))) == real_of_num(0)"), fn(x2136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2137 = @tactics.mp_tac(x2136)
    fn(x2138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2137(x2138)
    }
  })
  let t2133 = @term_syntax.parse_term("(M : Num)")
  let t2135 = @tactics.disch_then((x2134 : @kernel.Thm) => @tactics.x_choose_tac(t2133, x2134))
  let t2132 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t2128 = @term_syntax.parse_term("real_of_num(1)")
  let t2131 = @tactics.disch_then(fn(x2130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2126 = @tactics.mp_tac(x2125)
      fn(x2127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2126(x2127)
      }
    })(((x2129 : @kernel.Thm) => @bool.spec(t2128, x2129))(x2130))
  })
  let t2124 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t2122 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2121 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_pow_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(31)"))]))
  let t2120 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2119 = @simp.simp_tac(@list.List([@real.real_le_lmul_eq(), zeta3_pos()]))
  let t2118 = @simp.rewrite_tac(@list.List([@realarith.real_pos(), @realax.real_div()]))
  let t2117 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2115 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq()), aa_pos_lt(), bb_over_aa_lt_zeta3()]))
  let t2114 = @simp.rewrite_tac(@list.List([approximation_bound()]))
  let t2116 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) <= (e : Real) && b < a → abs(b - a) <= e"))), t2114), t2115), @tactics.all_tac])
  let t2112 = @term_syntax.parse_term("real_of_num(6) * (ZETA(real_of_num(3)) / aa((n : Num) + 1))")
  let t2113 = @tactics.trans_tac(@realax.real_le_trans())(t2112)
  let t2110 = @simp.asm_simp_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_le(), @arith.le_0(), @arith.lt_imp_le()]))
  let t2109 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t2108 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())]))
  let t2107 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t2111 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(27) == pow(real_of_num(3), 3)")), @real.real_pow_pow()])), t2107), t2108), t2109), t2110), @tactics.all_tac])
  let t2106 = @simp.simp_tac(@list.List([@real.real_pow_le(), @realarith.real_pos(), @real.real_abs_pos()]))
  let t2105 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2104 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t2103 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2102 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(MAX((N1 : Num), (N2 : Num)) <= (n : Num)) == (N1 <= n && N2 <= n)"))]))
  let t2101 = @tactics.exists_tac(@term_syntax.parse_term("MAX((N1 : Num), (N2 : Num))"))
  let t2100 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2098 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2097 = @tactics.match_mp_tac(@realanalysis.reallim_pown())
  let t2095 = @equal.gsym(@realax.real_div())
  let t2096 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_div()), t2095]))
  let t2094 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t2099 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_pow_add(), @calc_rat.real_arith(@term_syntax.parse_term("(tsn : Real) * (real_of_num(6) * ((z : Real) * ((ia : Real) * (inv((t31 : Real)) * inv(pow(real_of_num(31), 1)))))) == real_of_num(6) / real_of_num(31) * (z * ia) * (tsn / t31)"))])), t2094), t2096), t2097), t2098)])
  let t2093 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => pow(real_of_num(27), n) * (real_of_num(6) * (ZETA(real_of_num(3)) / ((A : Real) * pow(real_of_num(31), n + 1))))"))
  let t2092 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t2091 = @tactics.x_choose_tac(@term_syntax.parse_term("(N2 : Num)"), lcm_bound_simple())
  let t2089 = @term_syntax.parse_term("(N1 : Num)")
  let t2090 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(A : Real)"), t2089]))
  let t2088 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2087 = @tactics.mp_tac(aa_lowerbound())
  let t2123 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_lmul()), t2087), t2088), t2090), @tactics.strip_tac), t2091), t2092), t2093), @tactics.conj_tac), t2099), t2100), t2101), t2102), t2103), @tactics.strip_tac), t2104), t2105), t2106), @tactics.conj_tac), t2111), t2113), @tactics.conj_tac), t2116), t2117), t2118), t2119), t2120), t2121), t2122), @int.asm_arith_tac), @tactics.all_tac])
  let t2086 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => real_of_num(2) * (pow(real_of_num(LCM(op_dot_dot(1, n))), 3) * (bb(n) - ZETA(real_of_num(3)) * aa(n))), real_of_num(0), sequentially)"), fn(x2083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2084 = @tactics.mp_tac(x2083)
    fn(x2085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2084(x2085)
    }
  })
  let t2081 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t2080 = @tactics.match_mp_tac(divides_lcm_set())
  let t2079 = @simp.rewrite_tac(@list.List([@floor.integer_div()]))
  let t2078 = @simp.rewrite_tac(@list.List([@floor.integer_closed()]))
  let t2077 = @tactics.match_mp_tac(@floor.integer_mul())
  let t2076 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) / (c : Real)) == b * (a / c)"))]))
  let t2075 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul(), @calc_int.real_abs_num()]))
  let t2074 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@floor.integer_abs())]))
  let t2073 = @simp.simp_tac(@list.List([@floor.integer_closed(), aa_integer()]))
  let t2072 = @tactics.match_mp_tac(@floor.integer_mul())
  let t2071 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((x : Real), 3) * ((y : Real) * (z : Real)) == x * (x * z) * (x * y)"))]))
  let t2070 = @simp.rewrite_tac(@list.List([@floor.integer_closed()]))
  let t2069 = @tactics.match_mp_tac(@floor.integer_mul())
  let t2068 = @simp.rewrite_tac(@list.List([bb_integer()]))
  let t2067 = @tactics.match_mp_tac(@floor.integer_sub())
  let t2066 = @simp.rewrite_tac(@list.List([@real.real_sub_ldistrib()]))
  let t2065 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t2064 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2063 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(x2060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2061 = @tactics.mp_tac(x2060)
    fn(x2062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2061(x2062)
    }
  }))
  let t2058 = @simp.gen_rewrite_rule(fn(x2057 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2057
  }, @list.List([@floor.rational_alt()]))
  let t2082 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2059 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2054 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2055 = @tactics.mp_tac(x2054)
      fn(x2056 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2055(x2056)
      }
    })(t2058(x2059))
  }), t2063), t2064), t2065), @tactics.strip_tac), @tactics.gen_tac), @tactics.disch_tac), t2066), t2067), t2068), t2069), t2070), t2071), t2072), t2073), t2074), t2075), t2076), t2077), t2078), t2079), @tactics.disj2_tac), t2080), t2081), @int.asm_arith_tac), @tactics.all_tac])
  let t2156 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.strip_tac, @tactics.subgoal_then(@term_syntax.parse_term("∃ N : Num, ∀ n : Num, N <= n → integer(real_of_num(2) * (pow(real_of_num(LCM(op_dot_dot(1, n))), 3) * (bb(n) - ZETA(real_of_num(3)) * aa(n))))"), @tactics.strip_assume_tac)), t2082), t2086), t2123), t2124), t2131), t2132), t2135), t2139), t2141), t2142), t2143), t2144), t2148), t2149), t2153), t2154), t2155)
  irrational_zeta3_c.set(@tactics.prove(@term_syntax.parse_term("!rational(ZETA(real_of_num(3)))"), t2156))
}

///|
let irrational_zeta3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IRRATIONAL_ZETA3")

///|
/// `IRRATIONAL_ZETA3`
pub fn irrational_zeta3() -> @kernel.Thm {
  irrational_zeta3_c.get()
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
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
}
