// Translated from upstream Formal_ineqs/trig/exp_log.hl; edit this file directly.

///|
/// Formal_ineqs/trig/exp_log.hl:19
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// exp_pos_poly_lower_bound
fn step_2() -> Unit raise {
  let t28 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t27 = @tactics.match_mp_tac(@real.real_le_div())
  let t26 = @simp.asm_simp_tac(@list.List([@real.real_pow_le()]))
  let t25 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t24 = @tactics.repeat_tac(@tactics.strip_tac)
  let t22 = @simp.asm_rewrite_tac(@list.List([]))
  let t21 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t23 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_summable_from_elsewhere()), t21), t22), @tactics.all_tac])
  let t20 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_sums_infsum()]))
  let t18 = @term_syntax.parse_term("from((n : Num) + 1)")
  let t19 = @tactics.map_every(fn(x15 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s16 = @tactics.exists_tac(x15)
    fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s16(x17)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow((x : Real), k)"), t18]))
  let t14 = @tactics.match_mp_tac(@realanalysis.real_series_pos())
  let t12 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= a + (b : Real)) == (real_of_num(0) <= b)"))
  let t13 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((a : Real)) == real_of_num(1) / a")), t12]))
  let t11 = @tactics.disch_then(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x9
    @simp.rewrite_tac(@list.List([th]))
  })
  let t8 = @simp.asm_rewrite_tac(@list.List([]))
  let t7 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.from_0()), @arith.le_0()]))
  let t5 = @bool.spec(@term_syntax.parse_term("(x : Real)"), @series.exp_series())
  let t6 = @tactics.mp_tac(@drule.match_mp(@realanalysis.real_sums_summable())(t5))
  let t2 = @term_syntax.parse_term("(k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow((x : Real), k)")
  let t3 = @term_syntax.parse_term("(n : Num)")
  let t4 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("0"), t3, t2]), @series.real_infsum_offset()))
  let t1 = @simp.rewrite_tac(@list.List([@equal.gsym(@series.exp_infsum())]))
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), t4), t6), t7), @tactics.disch_tac), t8), t11), t13), t14), t19), t20), @tactics.conj_tac), t23), t24), t25), t26), t27), t28)
  exp_pos_poly_lower_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x → sum(op_dot_dot(0, n), (k : Num) => inv(real_of_num(FACT(k))) * pow(x, k)) <= exp(x)"), t29))
}

///|
let exp_pos_poly_lower_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_pos_poly_lower_bound")

///|
/// `Exp_log.exp_pos_poly_lower_bound`
pub fn exp_pos_poly_lower_bound() -> @kernel.Thm {
  exp_pos_poly_lower_bound_c.get()
}

///|
/// exp_ge1
fn step_3() -> Unit raise {
  let t32 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @realax.real_pow(), @arith.fact(), @real.real_inv_1(), @realax.real_mul_lid()]))
  let t30 = @term_syntax.parse_term("0")
  let t31 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t30]), exp_pos_poly_lower_bound()))
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t31), t32)
  exp_ge1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → real_of_num(1) <= exp(x)"), t33))
}

///|
let exp_ge1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_ge1")

///|
/// `Exp_log.exp_ge1`
pub fn exp_ge1() -> @kernel.Thm {
  exp_ge1_c.get()
}

///|
/// neg_exp_le1
fn step_4() -> Unit raise {
  let t36 = @simp.asm_simp_tac(@list.List([exp_ge1()]))
  let t35 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t34 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_neg()]))
  let t37 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t34), t35), t36)
  neg_exp_le1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → exp(-x) <= real_of_num(1)"), t37))
}

///|
let neg_exp_le1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("neg_exp_le1")

///|
/// `Exp_log.neg_exp_le1`
pub fn neg_exp_le1() -> @kernel.Thm {
  neg_exp_le1_c.get()
}

///|
/// neg_exp_series
fn step_5() -> Unit raise {
  let t44 = @simp.asm_rewrite_tac(@list.List([@misc.from_0()]))
  let t42 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @real.real_pow_one()]))
  let t43 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) == -real_of_num(1) * x"))]))), t42), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t41 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, real_of_num(1) / real_of_num(FACT(k)) * pow(-(x : Real), k) == pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)"), fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s39 = @tactics.assume_tac(x38)
    fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s39(x40)
    }
  })
  let t45 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("-(x : Real)"), @series.exp_series()))), t41), t43), t44)
  neg_exp_series_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k), exp(-x), from(0))"), t45))
}

///|
let neg_exp_series_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("neg_exp_series")

///|
/// `Exp_log.neg_exp_series`
pub fn neg_exp_series() -> @kernel.Thm {
  neg_exp_series_c.get()
}

///|
/// neg_exp_infsum
fn step_6() -> Unit raise {
  let t47 = @simp.rewrite_tac(@list.List([]))
  let t46 = @bool.spec_all(neg_exp_series())
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@drule.match_mp(@realanalysis.real_infsum_unique())(t46))), t47)
  neg_exp_infsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_infsum(from(0), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) == exp(-x)"), t48))
}

///|
let neg_exp_infsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("neg_exp_infsum")

///|
/// `Exp_log.neg_exp_infsum`
pub fn neg_exp_infsum() -> @kernel.Thm {
  neg_exp_infsum_c.get()
}

///|
/// n_le_fact
fn step_7() -> Unit raise {
  let t51 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @arith.fact_le()]))
  let t50 = @tactics.match_mp_tac(@arith.le_mult2())
  let t49 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) <= (b : Num)) == (a * 1 <= b)"))]))
  let t52 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.fact(), @calc_num.arith_le()]))), t49), t50), t51)
  n_le_fact_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n <= FACT(n)"), t52))
}

///|
let n_le_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("n_le_fact")

///|
/// `Exp_log.n_le_fact`
pub fn n_le_fact() -> @kernel.Thm {
  n_le_fact_c.get()
}

///|
/// exp_alt_sign_lemma
fn step_8() -> Unit raise {
  let t85 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t84 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t82 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le(), n_le_fact()]))
  let t81 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t80 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / (a : Real) == inv(a)")), @calc_int.real_abs_num()]))
  let t83 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_neg()])), t80), t81), t82), @int.asm_arith_tac), @tactics.all_tac])
  let t79 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t78 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t77 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (b : Real)) == (a <= b * real_of_num(1))"))]))
  let t76 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t75 = @tactics.repeat_tac(@tactics.strip_tac)
  let t74 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t73 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n(), @metric.eventually_sequentially()]))
  let t72 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => inv(real_of_num(k))"))
  let t86 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_comparison()), t72), t73), t74), t75), t76), t77), t78), t79), @tactics.conj_tac), t83), t84), t85), @int.asm_arith_tac)
  let t71 = @simp.asm_rewrite_tac(@list.List([]))
  let t70 = @tactics.match_mp_tac(@real.real_pow_le())
  let t69 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even_double(), @real.real_pow_one(), @realax.real_mul_lid()]))
  let t67 = @int.arith_rule(@term_syntax.parse_term("1 + ((k : Num) + 1 + k) == 2 * (k + 1)"))
  let t68 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add()), t67]))
  let t66 = @simp.simp_tac(@list.List([@realax.real_of_num_le(), @arith.fact_lt(), @arith.lt_imp_le()]))
  let t65 = @tactics.match_mp_tac(@real.real_le_div())
  let t64 = @simp.simp_tac(@list.List([@realax.real_of_num_le(), @arith.fact_lt(), @arith.lt_imp_le()]))
  let t63 = @tactics.match_mp_tac(@real.real_le_div())
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) / (b : Real) * (r : Real) * ((c : Real) / (d : Real) * (t : Real)) <= real_of_num(0)) == (real_of_num(0) <= pow(-real_of_num(1), 1) * (a * c) * (r * t) / b / d)"))])), t63), t64), t65), t66), t68), t69), t70), t71)
  let t62 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t61 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t59 = @tactics.match_mp_tac(@arith.fact_mono())
  let t58 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le(), @arith.fact_lt()]))
  let t57 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t56 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / (a : Real) == inv(a)"))]))
  let t55 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @calc_int.real_abs_neg(), @calc_int.real_abs_num(), @real.real_pow_one()]))
  let t60 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_div(), @calc_int.real_abs_num()])), t55), t56), t57), t58), t59), @int.arith_tac), @tactics.all_tac])
  let t54 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t53 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t88 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_mul()])), t53), t54), @tactics.conj_tac), t60), t61), t62), @int.asm_arith_tac), t87, t86])
  let t89 = @tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t88)
  exp_alt_sign_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x && x <= real_of_num(1) → (∀ k : Num, abs(pow(-real_of_num(1), k + 1) / real_of_num(FACT(k + 1)) * pow(x, k + 1)) <= abs(pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) && pow(-real_of_num(1), k + 1) / real_of_num(FACT(k + 1)) * pow(x, k + 1) * (pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) <= real_of_num(0)) && op_minus_minus_minus_gt((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k), real_of_num(0), sequentially)"), t89))
}

///|
let exp_alt_sign_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_alt_sign_lemma")

///|
/// `Exp_log.exp_alt_sign_lemma`
pub fn exp_alt_sign_lemma() -> @kernel.Thm {
  exp_alt_sign_lemma_c.get()
}

///|
/// exp_neg_poly_upper_bound
fn step_9() -> Unit raise {
  let t126 = @simp.asm_rewrite_tac(@list.List([]))
  let t124 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x"))]))
  let t123 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even_double(), @real.real_pow_one()]))
  let t122 = @simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_neg(), @calc_int.real_abs_num()]))
  let t121 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t125 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t121), t122), t123), t124), @tactics.all_tac])
  let t120 = @tactics.subgoal_then(@term_syntax.parse_term("abs(pow(-real_of_num(1), 2 * (m : Num)) / real_of_num(FACT(2 * m)) * pow((x : Real), 2 * m)) == (f : (Num) -> Real)(2 * m)"), fn(x117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s118 = @tactics.assume_tac(x117)
    fn(x119 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s118(x119)
    }
  })
  let t116 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @arith.le_0()]))
  let t115 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t114 = @tactics.subgoal_then(@term_syntax.parse_term("sum(op_dot_dot(0, 2 * (m : Num)), (f : (Num) -> Real)) == sum(op_dot_dot(0, SUC(2 * m - 1)), f)"), fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s112 = @tactics.assume_tac(x111)
    fn(x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s112(x113)
    }
  })
  let t110 = @tactics.subgoal_then(@term_syntax.parse_term("SUC(2 * (m : Num) - 1) == 2 * m"), fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s108 = @tactics.assume_tac(x107)
    fn(x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s108(x109)
    }
  })
  let t106 = @simp.asm_rewrite_tac(@list.List([neg_exp_infsum()]))
  let t105 = @simp.expand_tac("f")
  let t103 = @simp.asm_simp_tac(@list.List([exp_alt_sign_lemma()]))
  let t102 = @simp.expand_tac("f")
  let t104 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → 0 < n"))])), t102), t103), @tactics.all_tac])
  let t99 = @term_syntax.parse_term("(n : Num)")
  let t100 = @term_syntax.parse_term("0")
  let t101 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t100, t99]), @series.alt_sign_upper_bound()))
  let t97 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / real_of_num(1) * real_of_num(1) == real_of_num(1)")), neg_exp_le1()]))
  let t96 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @arith.fact()]))
  let t95 = @simp.expand_tac("f")
  let t98 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x93
    @simp.rewrite_tac(@list.List([th, @iterate.sum_clauses_numseg()]))
  }), t95), t96), t97), @tactics.all_tac])
  let t92 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t91 = @simp.abbrev_tac(@term_syntax.parse_term("(f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow((x : Real), k))"))
  let t90 = @tactics.repeat_tac(@tactics.strip_tac)
  let t127 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_exists()])), t90), t91), t92), t98), t101), @tactics.ants_tac), t104), t105), t106), t110), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t114), t115), t116), t120), t125), t126), @calc_rat.real_arith_tac)
  exp_neg_poly_upper_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x && x <= real_of_num(1) && EVEN(n) → exp(-x) <= sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k))"), t127))
}

///|
let exp_neg_poly_upper_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_neg_poly_upper_bound")

///|
/// `Exp_log.exp_neg_poly_upper_bound`
pub fn exp_neg_poly_upper_bound() -> @kernel.Thm {
  exp_neg_poly_upper_bound_c.get()
}

///|
/// exp_neg_poly_lower_bound
fn step_10() -> Unit raise {
  let t147 = @simp.asm_rewrite_tac(@list.List([]))
  let t145 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x"))]))
  let t144 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even(), @arith.even_double(), @real.real_pow_one()]))
  let t143 = @simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_neg(), @calc_int.real_abs_num()]))
  let t142 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t146 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t142), t143), t144), t145), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t141 = @tactics.subgoal_then(@term_syntax.parse_term("abs(pow(-real_of_num(1), SUC(2 * (m : Num))) / real_of_num(FACT(SUC(2 * m))) * pow((x : Real), SUC(2 * m))) == -(f : (Num) -> Real)(SUC(2 * m))"), fn(x138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s139 = @tactics.assume_tac(x138)
    fn(x140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s139(x140)
    }
  })
  let t137 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((a : Num)) - 1 == a")), @iterate.sum_clauses_numseg(), @arith.le_0()]))
  let t136 = @simp.asm_rewrite_tac(@list.List([neg_exp_infsum()]))
  let t135 = @simp.expand_tac("f")
  let t133 = @simp.asm_simp_tac(@list.List([exp_alt_sign_lemma()]))
  let t134 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t133), @int.arith_tac), @tactics.all_tac])
  let t130 = @term_syntax.parse_term("(n : Num)")
  let t131 = @term_syntax.parse_term("0")
  let t132 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t131, t130]), @series.alt_sign_lower_bound()))
  let t129 = @simp.abbrev_tac(@term_syntax.parse_term("(f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow((x : Real), k))"))
  let t128 = @tactics.repeat_tac(@tactics.strip_tac)
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.odd_exists()])), t128), t129), t132), @tactics.ants_tac), t134), t135), t136), t137), t141), t146), t147), @calc_rat.real_arith_tac)
  exp_neg_poly_lower_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x && x <= real_of_num(1) && ODD(n) → sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) <= exp(-x)"), t148))
}

///|
let exp_neg_poly_lower_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_neg_poly_lower_bound")

///|
/// `Exp_log.exp_neg_poly_lower_bound`
pub fn exp_neg_poly_lower_bound() -> @kernel.Thm {
  exp_neg_poly_lower_bound_c.get()
}

///|
/// exp_reduce
fn step_11() -> Unit raise {
  let t156 = @simp.asm_simp_tac(@list.List([@real.real_div_refl(), @realarith.real_mul_rid()]))
  let t155 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_eq()])), @int.asm_arith_tac), @tactics.all_tac])
  let t154 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((k : Num)) == real_of_num(0))"), fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s152 = @tactics.assume_tac(x151)
    fn(x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s152(x153)
    }
  })
  let t149 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) / a) == b * (a / a)"))
  let t150 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_n()), t149]))
  let t157 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t150), t154), t155), t156)
  exp_reduce_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ k : Num, 0 < k → pow(exp(x / real_of_num(k)), k) == exp(x)"), t157))
}

///|
let exp_reduce_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_reduce")

///|
/// `Exp_log.exp_reduce`
pub fn exp_reduce() -> @kernel.Thm {
  exp_reduce_c.get()
}

///|
/// exp_full_reduce
fn step_12() -> Unit raise {
  let t159 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg()), @calc_int.real_neg_neg()]))
  let t158 = @simp.asm_simp_tac(@list.List([exp_reduce()]))
  let t160 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t158), t159)
  exp_full_reduce_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ k : Num, 0 < k → inv(pow(exp(-x / real_of_num(k)), k)) == exp(x)"), t160))
}

///|
let exp_full_reduce_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_full_reduce")

///|
/// `Exp_log.exp_full_reduce`
pub fn exp_full_reduce() -> @kernel.Thm {
  exp_full_reduce_c.get()
}

///|
/// log_alt_sign_lemma
fn step_13() -> Unit raise {
  let t194 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t193 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t191 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le()]))
  let t190 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t189 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / (a : Real) == inv(a)")), @calc_int.real_abs_num()]))
  let t192 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_neg()])), t189), t190), t191), @int.asm_arith_tac), @tactics.all_tac])
  let t188 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t187 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t186 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (b : Real)) == (a <= b * real_of_num(1))"))]))
  let t185 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t184 = @tactics.repeat_tac(@tactics.strip_tac)
  let t183 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t182 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n(), @metric.eventually_sequentially()]))
  let t181 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => inv(real_of_num(k))"))
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_comparison()), t181), t182), t183), t184), t185), t186), t187), t188), @tactics.conj_tac), t192), t193), t194), @int.asm_arith_tac)
  let t180 = @simp.asm_rewrite_tac(@list.List([]))
  let t179 = @tactics.match_mp_tac(@real.real_pow_le())
  let t178 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even_double(), @real.real_pow_one(), @realax.real_mul_lid()]))
  let t176 = @int.arith_rule(@term_syntax.parse_term("1 + ((k : Num) + 1 + k) == 2 * (k + 1)"))
  let t177 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add()), t176]))
  let t175 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("0 <= (t : Num) + 1"))]))
  let t174 = @tactics.match_mp_tac(@real.real_le_div())
  let t173 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("0 <= (t : Num) + 1"))]))
  let t172 = @tactics.match_mp_tac(@real.real_le_div())
  let t196 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) / (b : Real) * (r : Real) * ((c : Real) / (d : Real) * (t : Real)) <= real_of_num(0)) == (real_of_num(0) <= pow(-real_of_num(1), 1) * (a * c) * (r * t) / b / d)"))])), t172), t173), t174), t175), t177), t178), t179), t180)
  let t171 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t170 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t168 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le()]))
  let t167 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t166 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / (a : Real) == inv(a)"))]))
  let t165 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @calc_int.real_abs_neg(), @calc_int.real_abs_num(), @real.real_pow_one()]))
  let t169 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_div(), @calc_int.real_abs_num()])), t165), t166), t167), t168), @int.arith_tac), @tactics.all_tac])
  let t164 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t163 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t197 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_mul()])), t163), t164), @tactics.conj_tac), t169), t170), t171), @int.asm_arith_tac), t196, t195])
  let t162 = @tactics.repeat_tac(@tactics.strip_tac)
  let t161 = @tactics.conv_tac(@pair.let_conv)
  let t198 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t161), t162), t197)
  log_alt_sign_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x && x <= real_of_num(1) → LET((f : (Num) -> Real) => LET_END((∀ k : Num, abs(f(k + 1)) <= abs(f(k)) && f(k + 1) * f(k) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially)), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k + 1))"), t198))
}

///|
let log_alt_sign_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("log_alt_sign_lemma")

///|
/// `Exp_log.log_alt_sign_lemma`
pub fn log_alt_sign_lemma() -> @kernel.Thm {
  log_alt_sign_lemma_c.get()
}

///|
/// log_poly_upper_bound
fn step_14() -> Unit raise {
  let t242 = @simp.asm_rewrite_tac(@list.List([]))
  let t243 = @tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le()), t242)
  let t241 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t244 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_div()), t241), @int.arith_tac), t243])
  let t240 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t239 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even_double(), @real.real_pow_one()]))
  let t238 = @simp.expand_tac("f")
  let t237 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")))
  let t236 = @tactics.subgoal_then(@term_syntax.parse_term("abs((f : (Num) -> Real)(2 * (m : Num))) == f(2 * m)"), fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x234
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t233 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @arith.le_0()]))
  let t232 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t231 = @tactics.subgoal_then(@term_syntax.parse_term("sum(op_dot_dot(0, 2 * (m : Num)), (f : (Num) -> Real)) == sum(op_dot_dot(0, SUC(2 * m - 1)), f)"), fn(x228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s229 = @tactics.assume_tac(x228)
    fn(x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s229(x230)
    }
  })
  let t227 = @tactics.subgoal_then(@term_syntax.parse_term("SUC(2 * (m : Num) - 1) == 2 * m"), fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s225 = @tactics.assume_tac(x224)
    fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s225(x226)
    }
  })
  let t222 = @equal.gsym(@series.log_infsum())
  let t223 = @list.List([@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x < real_of_num(1) → abs(x) < real_of_num(1)")), t222])), @tactics.all_tac])
  let t221 = @tactics.subgoal_then(@term_syntax.parse_term("real_infsum(from(0), (f : (Num) -> Real)) == log(real_of_num(1) + (x : Real))"), fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x219
    @simp.rewrite_tac(@list.List([th]))
  })
  let t217 = @simp.simp_tac(@list.List([]))
  let t216 = @simp.expand_tac("f")
  let t215 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t214 = @tactics.mp_tac(@bool.spec_all(@equal.conv_rule(@equal.depth_conv(@pair.let_conv), log_alt_sign_lemma())))
  let t218 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t214), t215), t216), t217), @tactics.all_tac])
  let t211 = @term_syntax.parse_term("(n : Num)")
  let t212 = @term_syntax.parse_term("0")
  let t213 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t212, t211]), @series.alt_sign_upper_bound()))
  let t210 = @simp.asm_rewrite_tac(@list.List([]))
  let t208 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow()]))
  let t206 = @int.arith_rule(@term_syntax.parse_term("SUC((k : Num)) == k + 1"))
  let t207 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_pow()), t206]))
  let t205 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) / (c : Real) * (d : Real)) == b / c * (a * d)"))
  let t209 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t205])), t207), t208), @tactics.all_tac])
  let t204 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Real) * sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k)) == sum(op_dot_dot(0, n), (f : (Num) -> Real))"), fn(x201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s202 = @tactics.assume_tac(x201)
    fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s202(x203)
    }
  })
  let t200 = @simp.abbrev_tac(@term_syntax.parse_term("(f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow((x : Real), k + 1))"))
  let t199 = @tactics.repeat_tac(@tactics.strip_tac)
  let t245 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_exists()])), t199), t200), t204), t209), t210), t213), @tactics.ants_tac), t218), t221), t223), t227), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t231), t232), t233), t236), t237), t238), t239), t240), @tactics.conj_tac), t244)
  log_poly_upper_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x && x < real_of_num(1) && EVEN(n) && 0 < n → log(real_of_num(1) + x) <= x * sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k))"), t245))
}

///|
let log_poly_upper_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("log_poly_upper_bound")

///|
/// `Exp_log.log_poly_upper_bound`
pub fn log_poly_upper_bound() -> @kernel.Thm {
  log_poly_upper_bound_c.get()
}

///|
/// log_poly_lower_bound
fn step_15() -> Unit raise {
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t281 = @tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le()), t280)
  let t279 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t282 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv()), t279), @int.arith_tac), t281])
  let t278 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t277 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(-real_of_num(1) / (b : Real) * (c : Real)) == inv(b) * c"))]))
  let t276 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even(), @arith.even_double(), @real.real_pow_one()]))
  let t275 = @simp.expand_tac("f")
  let t283 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= -(x : Real) → abs(x) == -x"))), t275), t276), t277), t278), @tactics.conj_tac), t282), @tactics.all_tac])
  let t274 = @tactics.subgoal_then(@term_syntax.parse_term("abs((f : (Num) -> Real)(SUC(2 * (m : Num)))) == -f(SUC(2 * m))"), fn(x272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x272
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t271 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((a : Num)) - 1 == a")), @iterate.sum_clauses_numseg(), @arith.le_0()]))
  let t269 = @equal.gsym(@series.log_infsum())
  let t270 = @list.List([@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x < real_of_num(1) → abs(x) < real_of_num(1)")), t269])), @tactics.all_tac])
  let t268 = @tactics.subgoal_then(@term_syntax.parse_term("real_infsum(from(0), (f : (Num) -> Real)) == log(real_of_num(1) + (x : Real))"), fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x266
    @simp.rewrite_tac(@list.List([th]))
  })
  let t264 = @simp.simp_tac(@list.List([]))
  let t263 = @simp.expand_tac("f")
  let t262 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t261 = @tactics.mp_tac(@bool.spec_all(@equal.conv_rule(@equal.depth_conv(@pair.let_conv), log_alt_sign_lemma())))
  let t265 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < SUC(2 * (m : Num))"))])), t261), t262), t263), t264), @tactics.all_tac])
  let t258 = @term_syntax.parse_term("(n : Num)")
  let t259 = @term_syntax.parse_term("0")
  let t260 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t259, t258]), @series.alt_sign_lower_bound()))
  let t257 = @simp.asm_rewrite_tac(@list.List([]))
  let t255 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow()]))
  let t253 = @int.arith_rule(@term_syntax.parse_term("SUC((k : Num)) == k + 1"))
  let t254 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_pow()), t253]))
  let t252 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) / (c : Real) * (d : Real)) == b / c * (a * d)"))
  let t256 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t252])), t254), t255), @tactics.all_tac])
  let t251 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Real) * sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k)) == sum(op_dot_dot(0, n), (f : (Num) -> Real))"), fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s249 = @tactics.assume_tac(x248)
    fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s249(x250)
    }
  })
  let t247 = @simp.abbrev_tac(@term_syntax.parse_term("(f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow((x : Real), k + 1))"))
  let t246 = @tactics.repeat_tac(@tactics.strip_tac)
  let t284 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.odd_exists()])), t246), t247), t251), t256), t257), t260), @tactics.ants_tac), t265), t268), t270), t271), t274), t283), @calc_rat.real_arith_tac)
  log_poly_lower_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x && x < real_of_num(1) && ODD(n) → x * sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k)) <= log(real_of_num(1) + x)"), t284))
}

///|
let log_poly_lower_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("log_poly_lower_bound")

///|
/// `Exp_log.log_poly_lower_bound`
pub fn log_poly_lower_bound() -> @kernel.Thm {
  log_poly_lower_bound_c.get()
}

///|
/// log_reduce_pos_pow
fn step_16() -> Unit raise {
  let t286 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pow(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))]))
  let t285 = @simp.asm_simp_tac(@list.List([@transcendentals.log_mul(), @real.real_lt_pow2()]))
  let t287 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t285), t286)
  log_reduce_pos_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∀ y : Real, real_of_num(0) < y → log(pow(real_of_num(2), k) * y) == real_of_num(k) * log(real_of_num(2)) + log(y)"), t287))
}

///|
let log_reduce_pos_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("log_reduce_pos_pow")

///|
/// `Exp_log.log_reduce_pos_pow`
pub fn log_reduce_pos_pow() -> @kernel.Thm {
  log_reduce_pos_pow_c.get()
}

///|
/// log_reduce_neg_pow
fn step_17() -> Unit raise {
  let t289 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pow(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))]))
  let t288 = @simp.asm_simp_tac(@list.List([@transcendentals.log_div(), @real.real_lt_pow2()]))
  let t290 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t288), t289)
  log_reduce_neg_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∀ y : Real, real_of_num(0) < y → log(y / pow(real_of_num(2), k)) == log(y) - real_of_num(k) * log(real_of_num(2))"), t290))
}

///|
let log_reduce_neg_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("log_reduce_neg_pow")

///|
/// `Exp_log.log_reduce_neg_pow`
pub fn log_reduce_neg_pow() -> @kernel.Thm {
  log_reduce_neg_pow_c.get()
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
}
