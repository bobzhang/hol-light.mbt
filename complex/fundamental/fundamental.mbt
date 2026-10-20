// Translated from upstream Complex/fundamental.ml; edit this file directly.

///|
/// Complex/fundamental.ml:8
fn step_1() -> Unit raise {
  @complexnumbers.prioritize_complex(())
}

///|
/// SQRT_SOS_LT_1
fn step_2() -> Unit raise {
  let t10 = @simp.simp_tac(@list.List([@real.sqrt_mono_lt_eq(), @analysis.real_pos(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t9 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t8 = @simp.gen_rewrite_tac(fn(x7 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2 = @equal.land_conv(x1)
      fn(x3 : @kernel.Term) -> @kernel.Thm raise {
        s2(x3)
      }
    })((fn(x4 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s5 = @equal.rand_conv(x4)
      fn(x6 : @kernel.Term) -> @kernel.Thm raise {
        s5(x6)
      }
    })(x7))
  }, @list.List([@equal.gsym(@real.sqrt_1())]))
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t8), t9), t10)
  sqrt_sos_lt_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (sqrt(pow(x, 2) + pow(y, 2)) < real_of_num(1)) == (pow(x, 2) + pow(y, 2) < real_of_num(1))"), t11))
}

///|
let sqrt_sos_lt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_SOS_LT_1")

///|
/// `SQRT_SOS_LT_1`
pub fn sqrt_sos_lt_1() -> @kernel.Thm {
  sqrt_sos_lt_1_c.get()
}

///|
/// SQRT_SOS_EQ_1
fn step_3() -> Unit raise {
  let t21 = @simp.simp_tac(@list.List([@real.sqrt_inj(), @analysis.real_pos(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t20 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t19 = @simp.gen_rewrite_tac(fn(x18 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x12 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s13 = @equal.land_conv(x12)
      fn(x14 : @kernel.Term) -> @kernel.Thm raise {
        s13(x14)
      }
    })((fn(x15 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s16 = @equal.rand_conv(x15)
      fn(x17 : @kernel.Term) -> @kernel.Thm raise {
        s16(x17)
      }
    })(x18))
  }, @list.List([@equal.gsym(@real.sqrt_1())]))
  let t22 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t19), t20), t21)
  sqrt_sos_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (sqrt(pow(x, 2) + pow(y, 2)) == real_of_num(1)) == (pow(x, 2) + pow(y, 2) == real_of_num(1))"), t22))
}

///|
let sqrt_sos_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_SOS_EQ_1")

///|
/// `SQRT_SOS_EQ_1`
pub fn sqrt_sos_eq_1() -> @kernel.Thm {
  sqrt_sos_eq_1_c.get()
}

///|
/// UNIMODULAR_REDUCE_NORM
fn step_4() -> Unit raise {
  let t34 = @simp.asm_simp_tac(@list.List([@real.real_pow_1_le(), @real.real_abs_pos()]))
  let t33 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow2_abs())]))
  let t32 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t31 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (r : Real) * (real_of_num(2) * r) <= real_of_num(1) && real_of_num(2) * (i : Real) * (real_of_num(2) * i) <= real_of_num(1) → !(r * r + i * i == real_of_num(1))")))
  let t30 = @simp.rewrite_tac(@list.List([]))
  let t29 = @tactics.undisch_tac(@term_syntax.parse_term("Re((z : Complex)) * Re(z) + Im(z) * Im(z) == real_of_num(1)"))
  let t28 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!(abs((a : Real)) <= real_of_num(1) && abs((b : Real)) <= real_of_num(1)) → real_of_num(0) < -a + -real_of_num(1) || real_of_num(0) < a + -real_of_num(1) || real_of_num(0) < -b + -real_of_num(1) || real_of_num(0) < b + -real_of_num(1)")))
  let t27 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t26 = @simp.rewrite_tac(@list.List([@analysis.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @analysis.real_neg_neg()]))
  let t25 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) + (x : Real) < real_of_num(1)) == (real_of_num(0) < -x)"))]))
  let t23 = @calc_rat.real_arith(@term_syntax.parse_term("((b : Real) + (c : Real)) * (b + c) + (a : Real) * a == b * b + a * a + (real_of_num(2) * (b * c) + c * c)"))
  let t24 = @simp.simp_tac(@list.List([@realarith.real_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * a + ((b : Real) + (c : Real)) * (b + c) == a * a + b * b + (real_of_num(2) * (b * c) + c * c)")), t23]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@complexnumbers.ii(), @complexnumbers.cx_def(), @complexnumbers.complex_add(), @complexnumbers.complex_sub(), @complexnumbers.complex_neg(), @complexnumbers.complex_norm(), @complexnumbers.re(), @complexnumbers.im(), @calc_int.real_add_rid(), @analysis.real_neg_0(), sqrt_sos_lt_1(), sqrt_sos_eq_1()]))), t24), @tactics.disch_tac), t25), t26), t27), t28), @tactics.strip_tac), t29), t30), t31), t32), t33), t34)
  unimodular_reduce_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, norm(z) == real_of_num(1) → norm(z + Cx(real_of_num(1))) < real_of_num(1) || norm(z - Cx(real_of_num(1))) < real_of_num(1) || norm(z + ii) < real_of_num(1) || norm(z - ii) < real_of_num(1)"), t35))
}

///|
let unimodular_reduce_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIMODULAR_REDUCE_NORM")

///|
/// `UNIMODULAR_REDUCE_NORM`
pub fn unimodular_reduce_norm() -> @kernel.Thm {
  unimodular_reduce_norm_c.get()
}

///|
/// REDUCE_POLY_SIMPLE
fn step_5() -> Unit raise {
  let t118 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_div())]))
  let t117 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_mul_rinv(), @complexnumbers.complex_mul_lid(), @complexnumbers.cx_inj(), @complexnumbers.complex_norm_zero()]))
  let t115 = @term_syntax.parse_term("(m : Complex) * (b' : Complex) * ((b : Complex) * ((p : Complex) * (m' : Complex))) == m * m' * (b * b' * p)")
  let t116 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@complexnumbers.complex_mul_ac())(t115)]))
  let t114 = @simp.rewrite_tac(@list.List([@analysis.real_lt_01(), @complexnumbers.complex_div()]))
  let t112 = @simp.asm_simp_tac(@list.List([@real.real_div_refl(), @complexnumbers.complex_norm_zero()]))
  let t113 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_div(), @complexnumbers.complex_norm_cx(), @complexnumbers.complex_abs_norm()])), t112), @tactics.all_tac])
  let t111 = @tactics.subgoal_then(@term_syntax.parse_term("norm(Cx(norm((b : Complex))) / b) == real_of_num(1)"), fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s109 = @tactics.subst1_tac(x108)
    fn(x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s109(x110)
    }
  })
  let t107 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_rid(), @analysis.real_mul_rid()]))
  let t106 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_norm_mul()), @complexnumbers.complex_add_ldistrib()]))
  let t105 = @tactics.exists_tac(@term_syntax.parse_term("norm(Cx(norm((b : Complex))) / b)"))
  let t104 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t102 = @simp.simp_tac(@list.List([@arith.even(), @transc.root_pow_pos(), @complexnumbers.complex_norm_pos()]))
  let t100 = @term_syntax.parse_term("(n : Num)")
  let t101 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t100)
  let t103 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!EVEN((n : Num))")), t101), @nums.induct_tac), t102), @tactics.all_tac])
  let t99 = @tactics.subgoal_then(@term_syntax.parse_term("pow(root((n : Num), norm((b : Complex))), n) == norm(b)"), fn(x96 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s97 = @tactics.subst1_tac(x96)
    fn(x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s97(x98)
    }
  })
  let t95 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_pow_div(), @equal.gsym(@complexnumbers.cx_pow())]))
  let t94 = @tactics.exists_tac(@term_syntax.parse_term("(v : Complex) / Cx(root((n : Num), norm((b : Complex))))"))
  let t93 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v : Complex)"))(fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s91 = @tactics.assume_tac(x90)
    fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s91(x92)
    }
  }))
  let t88 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_rid(), @complexnumbers.complex_mul_rneg(), @complexnumbers.complex_neg_neg()]))
  let t87 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_pow_one(), @complexnumbers.complex_pow_ii_2(), @complexnumbers.complex_mul_lid(), @complexnumbers.complex_pow_neg()]))
  let t86 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_pow_pow())]))
  let t85 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_pow(), @complexnumbers.complex_pow_neg(), @arith.even(), @arith.even_mult(), @calc_num.arith_even()]))
  let t84 = @tactics.disch_then(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t82 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t81 = @simp.simp_tac(@list.List([@arith.odd_exists(), @theorems.left_imp_exists_thm()]))
  let t78 = @simp.gen_rewrite_rule(fn(x77 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x77
  }, @list.List([@arith.not_even()]))
  let t80 = @tactics.first_x_assum(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s75 = @tactics.mp_tac(x74)
      fn(x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s75(x76)
      }
    })(t78(x79))
  })
  let t72 = @meson.asm_meson_tac(@list.List([]))
  let t73 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexnumbers.complex_sub()]))), t72)])
  let t89 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("pow(Cx(real_of_num(1)), (n : Num)) == Cx(real_of_num(1)) && pow(-Cx(real_of_num(1)), n) == -Cx(real_of_num(1)) && (pow(ii, n) == ii && pow(-ii, n) == -ii || pow(ii, n) == -ii && pow(-ii, n) == ii)"), fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s70 = @tactics.mp_tac(x69)
    fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s70(x71)
    }
  }), t73), t80), t81), t82), t84), t85), t86), t87), @class.cond_cases_tac), t88), @tactics.all_tac])
  let t68 = @tactics.subgoal_then(@term_syntax.parse_term("∃ v : Complex, norm(Cx(norm((b : Complex))) / b + pow(v, (n : Num))) < real_of_num(1)"), fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.mp_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  })
  let t63 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_abs_norm(), @real.real_div_refl(), @complexnumbers.complex_norm_zero()]))
  let t64 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_div(), @complexnumbers.complex_norm_cx()])), t63), @tactics.all_tac])
  let t62 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(norm((b : Complex))) / b"), unimodular_reduce_norm()))
  let t60 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_pow_pow()), @complex_transc.csqrt_v1()]))
  let t59 = @tactics.exists_tac(@term_syntax.parse_term("csqrt((w : Complex))"))
  let t56 = @term_syntax.parse_term("(w : Complex)")
  let t58 = @tactics.disch_then((x57 : @kernel.Thm) => @tactics.x_choose_tac(t56, x57))
  let t55 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(2 * (m : Num) == 0) → m < 2 * m && !(m == 0)"))]))
  let t51 = @term_syntax.parse_term("(m : Num)")
  let t54 = @tactics.first_x_assum(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s49 = @tactics.mp_tac(x48)
      fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s49(x50)
      }
    })(((x52 : @kernel.Thm) => @bool.spec(t51, x52))(x53))
  })
  let t47 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @tactics.subst_all_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  }))
  let t42 = @simp.gen_rewrite_rule(fn(x41 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x41
  }, @list.List([@arith.even_exists()]))
  let t61 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s39 = @tactics.mp_tac(x38)
      fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s39(x40)
      }
    })(t42(x43))
  }), t47), t54), t55), t58), t59), t60), @tactics.all_tac])
  let t37 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t36 = @tactics.repeat_tac(@tactics.strip_tac)
  let t119 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@arith.num_wf())), t36), t37), t61), t62), @tactics.ants_tac), t64), @tactics.disch_tac), t68), t89), t93), t94), t95), t99), t103), t104), t105), t106), t107), t111), t113), t114), t116), t117), t118)
  reduce_poly_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Complex, ∀ n : Num, !(b == Cx(real_of_num(0))) && !(n == 0) → (∃ z : Complex, norm(Cx(real_of_num(1)) + b * pow(z, n)) < real_of_num(1))"), t119))
}

///|
let reduce_poly_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REDUCE_POLY_SIMPLE")

///|
/// `REDUCE_POLY_SIMPLE`
pub fn reduce_poly_simple() -> @kernel.Thm {
  reduce_poly_simple_c.get()
}

///|
/// POLY_CMUL_MAP
fn step_6() -> Unit raise {
  let t121 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_ac()]))
  let t120 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_add_ldistrib()]))
  let t122 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.map(), @cpoly.poly(), @complexnumbers.complex_mul_rzero()]))), t120), t121)
  poly_cmul_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ c : Complex, ∀ x : Complex, poly(MAP(op_star(c), p), x) == c * poly(p, x)"), t122))
}

///|
let poly_cmul_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CMUL_MAP")

///|
/// `POLY_CMUL_MAP`
pub fn poly_cmul_map() -> @kernel.Thm {
  poly_cmul_map_c.get()
}

///|
/// POLY_0
fn step_7() -> Unit raise {
  let t123 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_simp_tac(@list.List([@lists.all(), @cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()])))
  poly_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ x : Complex, ALL((b : Complex) => b == Cx(real_of_num(0)), p) → poly(p, x) == Cx(real_of_num(0))"), t123))
}

///|
let poly_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_0")

///|
/// `POLY_0`
pub fn poly_0() -> @kernel.Thm {
  poly_0_c.get()
}

///|
/// POLY_BOUND_EXISTS
fn step_8() -> Unit raise {
  let t138 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_norm_pos()]))
  let t137 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t136 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_mul()]))
  let t135 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) <= (z : Real) → (x : Real) + y <= real_of_num(1) + (x + abs(z))")))
  let t134 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_triangle()]))
  let t133 = @tactics.exists_tac(@term_syntax.parse_term("norm((h : Complex)) + norm((z : Complex) * poly((t : List[Complex]), z))"))
  let t132 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t131 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let t130 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t129 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → real_of_num(0) < real_of_num(1) + (x + y)")), @real.real_abs_pos(), @complexnumbers.complex_norm_pos()]))
  let t128 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) + (norm((h : Complex)) + abs((r : Real) * (m : Real)))"))
  let t127 = @tactics.pop_assum(@tactics.x_choose_then(@term_syntax.parse_term("(m : Real)"))(@tactics.strip_assume_tac))
  let t125 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num(), @analysis.real_lt_01(), @analysis.real_pos()]))
  let t124 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_norm_cx()]))
  let t126 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t124), t125), @tactics.all_tac])
  let t139 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac), @lists.list_induct_tac), t126), t127), t128), t129), t130), @tactics.disch_tac), t131), t132), t133), t134), t135), t136), t137), t138)
  poly_bound_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ r : Real, ∃ m : Real, real_of_num(0) < m && (∀ z : Complex, norm(z) <= r → norm(poly(p, z)) <= m)"), t139))
}

///|
let poly_bound_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_BOUND_EXISTS")

///|
/// `POLY_BOUND_EXISTS`
pub fn poly_bound_exists() -> @kernel.Thm {
  poly_bound_exists_c.get()
}

///|
/// POLY_OFFSET_LEMMA
fn step_9() -> Unit raise {
  let t159 = @term_syntax.parse_term("op_star((x : Complex))")
  let t162 = @tactics.disch_then(fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s157 = @tactics.mp_tac(x156)
      fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s157(x158)
      }
    })(((x160 : @kernel.Thm) => @equal.ap_term(t159, x160))(x161))
  })
  let t155 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let t151 = @term_syntax.parse_term("(x : Complex)")
  let t154 = @tactics.first_assum(fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s149 = @tactics.mp_tac(x148)
      fn(x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s149(x150)
      }
    })(((x152 : @kernel.Thm) => @bool.spec(t151, x152))(x153))
  })
  let t147 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Complex)"))
  let t146 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @cpoly.poly()]))
  let t145 = @tactics.exists_tac(@term_syntax.parse_term("CONS((b : Complex) + (h : Complex), (q : List[Complex]))"))
  let t144 = @tactics.exists_tac(@term_syntax.parse_term("(a : Complex) * (h : Complex)"))
  let t143 = @tactics.pop_assum(@tactics.strip_assume_tac)
  let t141 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @lists.length(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t140 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Complex])"))
  let t142 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))")), t140), t141), @tactics.all_tac])
  let t163 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t142), t143), t144), t145), t146), t147), t154), t155), t162), @complexnumbers.simple_complex_arith_tac)
  poly_offset_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Complex, ∀ p : List[Complex], ∃ b : Complex, ∃ q : List[Complex], LENGTH(q) == LENGTH(p) && (∀ x : Complex, poly(CONS(b, q), x) == (a + x) * poly(p, x))"), t163))
}

///|
let poly_offset_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_OFFSET_LEMMA")

///|
/// `POLY_OFFSET_LEMMA`
pub fn poly_offset_lemma() -> @kernel.Thm {
  poly_offset_lemma_c.get()
}

///|
/// POLY_OFFSET
fn step_10() -> Unit raise {
  let t177 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let t176 = @simp.asm_rewrite_tac(@list.List([@lists.length()]))
  let t175 = @tactics.exists_tac(@term_syntax.parse_term("CONS((h : Complex) + (b : Complex), (r : List[Complex]))"))
  let t173 = @tactics.x_choose_then(@term_syntax.parse_term("(r : List[Complex])"))(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x172))
  })
  let t174 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Complex)"))(t173))
  let t170 = @term_syntax.parse_term("(p : List[Complex])")
  let t171 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Complex)"), t170]), poly_offset_lemma()))
  let t169 = @simp.asm_rewrite_tac(@list.List([]))
  let t168 = @tactics.pop_assum(@tactics.x_choose_then(@term_syntax.parse_term("(p : List[Complex])"))(fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x167))
  }))
  let t165 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @lists.length()]))
  let t166 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Complex])")), t165), @tactics.all_tac])
  let t164 = @simp.rewrite_tac(@list.List([@lists.length(), @cpoly.poly()]))
  let t178 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t164), t166), t168), t169), t171), t174), t175), t176), t177), @complexnumbers.simple_complex_arith_tac)
  poly_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Complex, ∀ p : List[Complex], ∃ q : List[Complex], LENGTH(q) == LENGTH(p) && (∀ x : Complex, poly(q, x) == poly(p, a + x))"), t178))
}

///|
let poly_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_OFFSET")

///|
/// `POLY_OFFSET`
pub fn poly_offset() -> @kernel.Thm {
  poly_offset_c.get()
}

///|
/// METRIC_BOUND_LEMMA
fn step_11() -> Unit raise {
  let t191 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) <= abs(a) + (abs(b) + real_of_num(2) * abs((c : Real)))"))]))
  let t190 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul())]))
  let t189 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real)) * (a + b) == a * a + (b * b + real_of_num(2) * (a * b))"))]))
  let t188 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_sub())]))
  let t187 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_add(), @complexnumbers.complex_sub(), @complexnumbers.complex_neg(), @complexnumbers.re(), @complexnumbers.im()]))
  let t186 = @simp.simp_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_add(), @analysis.real_le_square()]))
  let t185 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t184 = @simp.gen_rewrite_tac(fn(x181 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s182 = @equal.rand_conv(x181)
    fn(x183 : @kernel.Term) -> @kernel.Thm raise {
      s182(x183)
    }
  }, @list.List([@equal.gsym(@real.pow_2_sqrt_abs())]))
  let t180 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= abs(abs((x : Real)) + abs((y : Real))) → a <= abs(x) + abs(y)")))
  let t179 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm()]))
  let t192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t179), t180), t184), t185), t186), t187), t188), t189), t190), t191)
  metric_bound_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, norm(x - y) <= abs(Re(x) - Re(y)) + abs(Im(x) - Im(y))"), t192))
}

///|
let metric_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("METRIC_BOUND_LEMMA")

///|
/// `METRIC_BOUND_LEMMA`
pub fn metric_bound_lemma() -> @kernel.Thm {
  metric_bound_lemma_c.get()
}

///|
/// BOLZANO_WEIERSTRASS_COMPLEX_DISC
fn step_12() -> Unit raise {
  let t291 = @meson.asm_meson_tac(@list.List([@arith.le_add(), @analysis.seq_suble(), @arith.le_trans(), @arith.add_sym()]))
  let t290 = @tactics.first_assum(@tactics.match_mp_tac)
  let t289 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @complexnumbers.re(), @complexnumbers.im()]))
  let t288 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (c : Real) && (b : Real) < c → (x : Real) <= a + b → x < real_of_num(2) * c")))
  let t282 = @drule.part_match(@equal.lhand, metric_bound_lemma())
  let t278 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq(), @calc_num.arith(), @analysis.real_le_refl()]))])
  let t277 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * ((e : Real) / real_of_num(2))"))
  let t276 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t275 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t274 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t271 = @term_syntax.parse_term("(N1 : Num)")
  let t273 = @tactics.disch_then((x272 : @kernel.Thm) => @tactics.x_choose_tac(t271, x272))
  let t268 = @term_syntax.parse_term("(N2 : Num)")
  let t270 = @tactics.disch_then((x269 : @kernel.Thm) => @tactics.x_choose_tac(t268, x269))
  let t267 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t263 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t266 = @tactics.first_x_assum(fn(x265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s261 = @tactics.mp_tac(x260)
      fn(x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s261(x262)
      }
    })(((x264 : @kernel.Thm) => @bool.spec(t263, x264))(x265))
  })
  let t256 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t259 = @tactics.disch_then(fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s254 = @tactics.mp_tac(x253)
      fn(x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s254(x255)
      }
    })(((x257 : @kernel.Thm) => @bool.spec(t256, x257))(x258))
  })
  let t252 = @tactics.undisch_tac(@term_syntax.parse_term("∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → abs(Re((s : (Num) -> Complex)((f : (Num) -> Num)(n))) - (x : Real)) < e)"))
  let t251 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t249 = @meson.meson_tac(@list.List([]))
  let t248 = @simp.rewrite_tac(@list.List([@analysis.subseq(), @trivia.o_thm()]))
  let t247 = @term_syntax.parse_term("subseq((g : (Num) -> Num))")
  let t250 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x244 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s245 = @tactics.undisch_tac(x244)
    fn(x246 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s245(x246)
    }
  }, @list.List([@term_syntax.parse_term("subseq((f : (Num) -> Num))"), t247])), t248), t249), @tactics.all_tac])
  let t243 = @tactics.exists_tac(@term_syntax.parse_term("complex(((x : Real), (y : Real)))"))
  let t240 = @term_syntax.parse_term("(y : Real)")
  let t238 = @term_syntax.parse_term("(x : Real)")
  let t242 = @tactics.disch_then(@tactics.conjuncts_then2((x239 : @kernel.Thm) => @tactics.x_choose_tac(t238, x239), (x241 : @kernel.Thm) => @tactics.x_choose_tac(t240, x241)))
  let t237 = @simp.rewrite_tac(@list.List([@analysis.convergent(), @analysis.seq(), @arith.ge()]))
  let t235 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @analysis.real_le_square(), @real.real_le_addr(), @real.real_le_addl()]))
  let t234 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t233 = @simp.gen_rewrite_tac(fn(x230 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s231 = @equal.land_conv(x230)
    fn(x232 : @kernel.Term) -> @kernel.Thm raise {
      s231(x232)
    }
  }, @list.List([@equal.gsym(@real.pow_2_sqrt_abs())]))
  let t229 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → b <= (r : Real) → a < r + real_of_num(1)")))
  let t228 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm()]))
  let t218 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t217 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @analysis.mr1_def(), @analysis.real_sub_lzero(), @calc_int.real_abs_neg()]))
  let t214 = @term_syntax.parse_term("0")
  let t215 = @term_syntax.parse_term("real_of_num(0)")
  let t216 = @tactics.map_every(fn(x211 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s212 = @tactics.exists_tac(x211)
    fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s212(x213)
    }
  }, @list.List([@term_syntax.parse_term("(r : Real) + real_of_num(1)"), t215, t214]))
  let t210 = @simp.asm_rewrite_tac(@list.List([@analysis.bounded()]))
  let t236 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@analysis.seq_bconv())), t210), t216), t217), t218), fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x219 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (_, w) = x219
      let t224 = @lib.funpow(3, @kernel.rand, @equal.lhand(w))
      @tactics.first_assum(fn(x226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s222 = @tactics.mp_tac(x221)
          fn(x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s222(x223)
          }
        })(((x225 : @kernel.Thm) => @bool.spec(t224, x225))(x226))
      })
    })(x227)(x227)
  }), t228), t229), t233), t234), t235), @tactics.all_tac])
  let t209 = @tactics.subgoal_then(@term_syntax.parse_term("convergent((n : Num) => Re((s : (Num) -> Complex)((f : (Num) -> Num)(n)))) && convergent((n : Num) => Im(s(f((g : (Num) -> Num)(n)))))"), fn(x206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s207 = @tactics.mp_tac(x206)
    fn(x208 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s207(x208)
    }
  })
  let t205 = @tactics.exists_tac(@term_syntax.parse_term("o((f : (Num) -> Num), (g : (Num) -> Num))"))
  let t204 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t203 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Num) -> Num)"))(fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s201 = @tactics.mp_tac(x200)
    fn(x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s201(x202)
    }
  }))
  let t199 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("o(Im, o((s : (Num) -> Complex), (f : (Num) -> Num)))"), @analysis.seq_monosub()))
  let t198 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t197 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Num) -> Num)"))(fn(x194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s195 = @tactics.mp_tac(x194)
    fn(x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s195(x196)
    }
  }))
  let t193 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("o(Re, (s : (Num) -> Complex))"), @analysis.seq_monosub()))
  let t292 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t193), t197), t198), @tactics.strip_tac), t199), t203), t204), @tactics.strip_tac), t205), t209), t236), t237), t242), t243), @tactics.conj_tac), t250), t251), @tactics.disch_tac), t252), t259), t266), t267), t270), t273), t274), t275), @tactics.disch_tac), t276), t277), @tactics.conj_tac), t278), fn(x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x284 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x283 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s280 = @tactics.mp_tac(x279)
            fn(x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s280(x281)
            }
          })(t282(x283))
        })(@equal.lhand(x284))
      })((fn(x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x285.1
      })(x286))
    })(x287)(x287)
  }), t288), t289), @tactics.conj_tac), t290), t291)
  bolzano_weierstrass_complex_disc_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Complex, ∀ r : Real, (∀ n : Num, norm(s(n)) <= r) → (∃ f : (Num) -> Num, ∃ z : Complex, subseq(f) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, n >= N → norm(s(f(n)) - z) < e)))"), t292))
}

///|
let bolzano_weierstrass_complex_disc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOLZANO_WEIERSTRASS_COMPLEX_DISC")

///|
/// `BOLZANO_WEIERSTRASS_COMPLEX_DISC`
pub fn bolzano_weierstrass_complex_disc() -> @kernel.Thm {
  bolzano_weierstrass_complex_disc_c.get()
}

///|
/// POLY_CONT
fn step_13() -> Unit raise {
  let t337 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_trans(), @analysis.real_lt_imp_le(), @complexnumbers.complex_norm_pos()]))
  let t336 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t335 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_rdiv_eq())]))
  let t334 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) * (m : Real)"))
  let t333 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t332 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_mul()]))
  let t331 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Complex)"))
  let t330 = @simp.asm_rewrite_tac(@list.List([]))
  let t329 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t328 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t327 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @analysis.real_lt_01()]))
  let t325 = @term_syntax.parse_term("(e : Real) / (m : Real)")
  let t326 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(1)"), t325]), @real.real_down2()))
  let t324 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Real)"))(@tactics.strip_assume_tac))
  let t322 = @term_syntax.parse_term("real_of_num(1)")
  let t323 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : List[Complex])"), t322]), poly_bound_exists()))
  let t321 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_lzero(), @complexnumbers.complex_add_rid(), @complexnumbers.complex_add_sub()]))
  let t319 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_sub_refl(), @complexnumbers.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t320 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(e : Real)")), t319), @tactics.all_tac])
  let t318 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly()]))
  let t316 = @term_syntax.parse_term("(p : List[Complex])")
  let t317 = @tactics.spec_tac(@term_syntax.parse_term("(q : List[Complex])"), t316)
  let t315 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_sub_refl()]))
  let t314 = @tactics.disch_then(fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x312
    @simp.once_rewrite_tac(@list.List([th]))
  })
  let t311 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_sub_add2()]))
  let t307 = @term_syntax.parse_term("(w : Complex) - (z : Complex)")
  let t303 = @term_syntax.parse_term("(w : Complex)")
  let t310 = @tactics.disch_then(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s301 = @tactics.mp_tac(x300)
          fn(x302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s301(x302)
          }
        })(((x304 : @kernel.Thm) => @bool.gen(t303, x304))(x305))
      })(@equal.sym(x306))
    })(((x308 : @kernel.Thm) => @bool.spec(t307, x308))(x309))
  })
  let t299 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : List[Complex])"))(fn(x298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s296 = @tactics.mp_tac(x295)
      fn(x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s296(x297)
      }
    })(@bool.conjunct2(x298))
  }))
  let t293 = @term_syntax.parse_term("(p : List[Complex])")
  let t294 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Complex)"), t293]), poly_offset()))
  let t338 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t294), t299), t310), t311), t314), t315), t317), @lists.list_induct_tac), t318), t320), t321), t323), t324), t326), t327), t328), t329), @tactics.strip_tac), t330), t331), @tactics.strip_tac), t332), t333), t334), t335), t336), t337)
  poly_cont_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ z : Complex, ∀ e : Real, real_of_num(0) < e → (∃ d : Real, real_of_num(0) < d && (∀ w : Complex, real_of_num(0) < norm(w - z) && norm(w - z) < d → norm(poly(p, w) - poly(p, z)) < e))"), t338))
}

///|
let poly_cont_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CONT")

///|
/// `POLY_CONT`
pub fn poly_cont() -> @kernel.Thm {
  poly_cont_c.get()
}

///|
/// POLY_MINIMUM_MODULUS_DISC
fn step_14() -> Unit raise {
  let t339 = @meson.meson_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("((P : Bool) && (m : Real) == -(x : Real) && -x < (y : Real)) == (-x == m && P && m < y)"), t339)
  let t480 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_abs_norm()]))
  let t479 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs(norm((psfn : Complex)) - norm((pz : Complex))) <= norm(psfn - pz) → abs(norm(pz) - (m : Real)) <= abs(norm(psfn) - m) + norm(psfn - pz)")))
  let t478 = @analysis.expand_tac("e")
  let t477 = @simp.simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq(), @calc_num.arith()]))
  let t473 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t472 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((N2 : Num))"))
  let t471 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t470 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t469 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t474 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x466 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s467 = @equal.rand_conv(x466)
    fn(x468 : @kernel.Term) -> @kernel.Thm raise {
      s467(x468)
    }
  }, @list.List([@equal.gsym(@real.real_inv_div())])), t469), t470), t471), t472), t473), @int.arith_tac)
  let t465 = @simp.asm_simp_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le(), @arith.lt_0(), @arith.le_suc(), @analysis.seq_suble()]))
  let t464 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t463 = @simp.asm_rewrite_tac(@list.List([@analysis.real_le_ladd()]))
  let t462 = @tactics.exists_tac(@term_syntax.parse_term("(m : Real) + inv(real_of_num(SUC((f : (Num) -> Num)((N1 : Num) + (N2 : Num)))))"))
  let t461 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t460 = @simp.asm_simp_tac(@list.List([]))
  let t475 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(m : Real) <= (x : Real) && x < m + (e : Real) → abs(x - m) < e"))), t460), t461), t462), t463), t464), t465), t474])
  let t459 = @tactics.exists_tac(@term_syntax.parse_term("inv(real_of_num(SUC((N1 : Num) + (N2 : Num))))"))
  let t476 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.real_lte_trans()), t459), @tactics.conj_tac), t475), @tactics.all_tac])
  let t458 = @tactics.exists_tac(@term_syntax.parse_term("(m : Real)"))
  let t457 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ m : Real, abs(norm((psfn : Complex)) - m) < (e2 : Real) && real_of_num(2) * e2 <= abs(norm(psfn) - m) + norm(psfn - (pz : Complex)) → norm(psfn - pz) < e2 → false")))
  let t455 = @simp.asm_simp_tac(@list.List([@arith.le_add()]))
  let t456 = @list.List([@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t455), @tactics.all_tac])
  let t454 = @tactics.subgoal_then(@term_syntax.parse_term("norm(poly((p : List[Complex]), (s : (Num) -> Complex)((f : (Num) -> Num)((N1 : Num) + (N2 : Num)))) - poly(p, (z : Complex))) < (e : Real) / real_of_num(2)"), fn(x451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s452 = @tactics.mp_tac(x451)
    fn(x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s452(x453)
    }
  })
  let t450 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N2 : Num)"))(fn(x447 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s448 = @tactics.assume_tac(x447)
    fn(x449 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s448(x449)
    }
  }))
  let t446 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(2) / (e : Real)"), @analysis.real_arch_simple()))
  let t445 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s443 = @tactics.assume_tac(x442)
    fn(x444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s443(x444)
    }
  }))
  let t441 = @simp.asm_rewrite_tac(@list.List([@arith.ge()]))
  let t437 = @term_syntax.parse_term("(d : Real)")
  let t440 = @tactics.first_x_assum(fn(x439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s435 = @tactics.mp_tac(x434)
      fn(x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s435(x436)
      }
    })(((x438 : @kernel.Thm) => @bool.spec(t437, x438))(x439))
  })
  let t433 = @tactics.first_assum(fn(x432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x431 : @kernel.Thm) => @lib.check(fn(x430 : @kernel.Thm) -> Bool raise {
      (fn(x428 : @kernel.Term) -> Bool raise {
        (fn(x427 : (@kernel.Term, @kernel.Term)) -> Bool raise {
          (fn(x425 : @kernel.Term) -> Bool raise {
            (fn(x424 : @kernel.Term) -> Bool raise {
              @basics.is_conj(x424)
            })(@equal.lhand(x425))
          })((fn(x426 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x426.1
          })(x427))
        })(@basics.dest_forall(x428))
      })((fn(x429 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x429)
      })(x430))
    }, x431))(x432))
  })
  let t421 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_norm_nz(), @complexnumbers.complex_sub_0()]))
  let t420 = @simp.asm_rewrite_tac(@list.List([]))
  let t419 = @tactics.first_assum(@tactics.match_mp_tac)
  let t418 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_sub_refl(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith(), @complexnumbers.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t417 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Complex) == (z : Complex)"))
  let t422 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Complex)")), t417), t418), @tactics.disch_tac), t419), t420), t421), @tactics.all_tac])
  let t416 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Complex, norm(w - (z : Complex)) < (d : Real) → norm(poly((p : List[Complex]), w) - poly(p, z)) < (e : Real) / real_of_num(2)"), fn(x413 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s414 = @tactics.mp_tac(x413)
    fn(x415 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s414(x415)
    }
  })
  let t412 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t411 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t408 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t409 = @term_syntax.parse_term("(z : Complex)")
  let t410 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : List[Complex])"), t409, t408]), poly_cont()))
  let t407 = @simp.abbrev_tac(@term_syntax.parse_term("(e : Real) == abs(norm(poly((p : List[Complex]), (z : Complex))) - (m : Real))"))
  let t406 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) < abs((a : Real) - (b : Real))) → a == b")))
  let t405 = @tactics.subgoal_then(@term_syntax.parse_term("norm(poly((p : List[Complex]), (z : Complex))) == (m : Real)"), fn(x403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x403
    @simp.asm_simp_tac(@list.List([th_1]))
  })
  let t402 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Complex)"))
  let t401 = @tactics.exists_tac(@term_syntax.parse_term("(z : Complex)"))
  let t399 = @tactics.x_choose_then(@term_syntax.parse_term("(z : Complex)"))(@tactics.strip_assume_tac)
  let t400 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Num) -> Num)"))(t399))
  let t398 = @simp.asm_rewrite_tac(@list.List([]))
  let t396 = @term_syntax.parse_term("(r : Real)")
  let t397 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(s : (Num) -> Complex)"), t396]), bolzano_weierstrass_complex_disc()))
  let t395 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : (Num) -> Complex)"))(@tactics.strip_assume_tac))
  let t394 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.forall_and_thm()]))
  let t393 = @simp.rewrite_tac(@list.List([@real.real_lt_addr(), @real.real_lt_inv_eq(), @real.real_of_num_lt(), @arith.lt_0()]))
  let t389 = @term_syntax.parse_term("(m : Real) + inv(real_of_num(SUC((n : Num))))")
  let t386 = @term_syntax.parse_term("(n : Num)")
  let t392 = @tactics.disch_then(fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s384 = @tactics.mp_tac(x383)
        fn(x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s384(x385)
        }
      })(((x387 : @kernel.Thm) => @bool.gen(t386, x387))(x388))
    })(((x390 : @kernel.Thm) => @bool.spec(t389, x390))(x391))
  })
  let t382 = @simp.rewrite_tac(@list.List([@analysis.real_not_lt()]))
  let t381 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (a → !b)"))]))
  let t380 = @simp.rewrite_tac(@list.List([@realarith.real_lt_refl(), @class.not_exists_thm()]))
  let t379 = @tactics.disch_then(fn(x376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x376
    let t378 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Real)"), th))
    @tactics.then_tac(@tactics.mp_tac(th), t378)
  })
  let t375 = @simp.rewrite_tac(@list.List([@theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t374 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-(a : Real) == (b : Real)) == (a == -b)"))]))
  let t373 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t372 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @equal.gsym(@theorems.conj_assoc()), lemma]))
  let t371 = @simp.rewrite_tac(@list.List([@analysis.real_neg_neg()]))
  let t367 = @term_syntax.parse_term("-(y : Real)")
  let t364 = @term_syntax.parse_term("(y : Real)")
  let t370 = @tactics.disch_then(fn(x369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s362 = @tactics.mp_tac(x361)
        fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s362(x363)
        }
      })(((x365 : @kernel.Thm) => @bool.gen(t364, x365))(x366))
    })(((x368 : @kernel.Thm) => @bool.spec(t367, x368))(x369))
  })
  let t360 = @simp.abbrev_tac(@term_syntax.parse_term("(m : Real) == -(s : Real)"))
  let t359 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) < (b : Real)) == (-b < -a)"))]))
  let t358 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Real)"))(fn(x355 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s356 = @tactics.mp_tac(x355)
    fn(x357 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s356(x357)
    }
  }))
  let t352 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → -real_of_num(1) < x")), @complexnumbers.complex_norm_pos()]))
  let t351 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t350 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < real_of_num(1)) == (-real_of_num(1) < -x)"))]))
  let t349 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) == -(b : Real)) == (-b == a)"))]))
  let t353 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t349), t350), t351), t352)
  let t348 = @simp.asm_rewrite_tac(@list.List([@analysis.real_neg_neg(), @complexnumbers.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t347 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t354 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.map_every(fn(x344 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s345 = @tactics.exists_tac(x344)
    fn(x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s345(x346)
    }
  }, @list.List([@term_syntax.parse_term("-norm(poly((p : List[Complex]), Cx(real_of_num(0))))"), t347])), t348), t353])), @tactics.all_tac])
  let t343 = @simp.rewrite_tac(@list.List([]))
  let t342 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real) => ∃ z : Complex, norm(z) <= (r : Real) && norm(poly((p : List[Complex]), z)) == -x"), @analysis.real_sup_exists()))
  let t341 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@complexnumbers.complex_norm_pos(), @analysis.real_le_trans()]))])
  let t340 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (r : Real)"))
  let t481 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t340), t341), t342), t343), @tactics.ants_tac), t354), t358), t359), t360), t370), t371), t372), t373), t374), t375), t379), t380), t381), t382), @tactics.disch_tac), t392), t393), t394), t395), t397), t398), t400), t401), t402), @tactics.disch_tac), t405), t406), @tactics.disch_tac), t407), t410), t411), t412), t416), t422), t433), @tactics.disch_tac), t440), t441), t445), t446), t450), t454), t456), t457), t458), @tactics.conj_tac), t476), t477), t478), t479), t480)
  poly_minimum_modulus_disc_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ r : Real, ∃ z : Complex, ∀ w : Complex, norm(w) <= r → norm(poly(p, z)) <= norm(poly(p, w))"), t481))
}

///|
let poly_minimum_modulus_disc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MINIMUM_MODULUS_DISC")

///|
/// `POLY_MINIMUM_MODULUS_DISC`
pub fn poly_minimum_modulus_disc() -> @kernel.Thm {
  poly_minimum_modulus_disc_c.get()
}

///|
/// POLY_INFINITY
fn step_15() -> Unit raise {
  let t523 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_triangle_sub()]))
  let t522 = @simp.once_rewrite_tac(@list.List([@complexnumbers.complex_add_sym()]))
  let t521 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(mzh : Real) <= (mazh : Real) + (ma : Real) → abs((d : Real)) + ma <= mzh → d <= mazh")))
  let t520 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @complexnumbers.complex_norm_nz(), @equal.gsym(@complexnumbers.complex_norm_mul())]))
  let t519 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t518 = @tactics.exists_tac(@term_syntax.parse_term("(abs((d : Real)) + norm((a : Complex))) / norm((h : Complex))"))
  let t517 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t516 = @simp.asm_simp_tac(@list.List([@cpoly.poly(), poly_0(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t524 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@lists.not_ex()]))), t516), @tactics.disch_tac), t517), t518), t519), t520), t521), t522), t523)
  let t513 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + abs((r : Real)) <= (x : Real) → real_of_num(1) <= x"))]))
  let t512 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_pos()]))
  let t511 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t514 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_mul()])), t511), t512), t513)
  let t510 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + abs((r : Real)) <= (x : Real) → r <= x"))]))
  let t509 = @tactics.first_assum(@tactics.match_mp_tac)
  let t515 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_mul_lid()])), t509), t510), t514])
  let t508 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) * norm(poly(CONS((h : Complex), (t : List[Complex])), (z : Complex)))"))
  let t507 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t506 = @simp.rewrite_tac(@list.List([@analysis.real_le_sub_ladd()]))
  let t504 = @simp.rewrite_tac(@list.List([@analysis.real_le_sub_radd(), @complexnumbers.complex_norm_triangle_sub()]))
  let t505 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexnumbers.complex_add_sym()])), t504)])
  let t503 = @tactics.exists_tac(@term_syntax.parse_term("norm((z : Complex) * poly(CONS((h : Complex), (t : List[Complex])), z)) - norm((a : Complex))"))
  let t502 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t501 = @simp.once_rewrite_tac(@list.List([@cpoly.poly()]))
  let t500 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t499 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) + abs((r : Real))"))
  let t495 = @term_syntax.parse_term("(d : Real) + norm((a : Complex))")
  let t493 = @term_syntax.parse_term("(r : Real)")
  let t498 = @tactics.disch_then(fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x494 : @kernel.Thm) => @tactics.x_choose_tac(t493, x494))(((x496 : @kernel.Thm) => @bool.spec(t495, x496))(x497))
  })
  let t492 = @simp.asm_rewrite_tac(@list.List([]))
  let t488 = @term_syntax.parse_term("(h : Complex)")
  let t491 = @tactics.first_x_assum(fn(x490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s486 = @tactics.mp_tac(x485)
      fn(x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s486(x487)
      }
    })(((x489 : @kernel.Thm) => @bool.spec(t488, x489))(x490))
  })
  let t525 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)")), t491), t492), t498), t499), t500), @tactics.disch_tac), t501), t502), t503), @tactics.conj_tac), t505), t506), t507), t508), @tactics.conj_tac), t515), t524])
  let t484 = @simp.asm_rewrite_tac(@list.List([]))
  let t483 = @class.asm_cases_tac(@term_syntax.parse_term("EX((b : Complex) => !(b == Cx(real_of_num(0))), (t : List[Complex]))"))
  let t482 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Complex)"))
  let t526 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.ex()]))), t482), t483), t484), t525)
  poly_infinity_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ a : Complex, EX((b : Complex) => !(b == Cx(real_of_num(0))), p) → (∀ d : Real, ∃ r : Real, ∀ z : Complex, r <= norm(z) → d <= norm(poly(CONS(a, p), z)))"), t526))
}

///|
let poly_infinity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_INFINITY")

///|
/// `POLY_INFINITY`
pub fn poly_infinity() -> @kernel.Thm {
  poly_infinity_c.get()
}

///|
/// POLY_MINIMUM_MODULUS
fn step_16() -> Unit raise {
  let t564 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_mul_rzero(), @analysis.real_le_refl()]))
  let t561 = @drule.match_mp(poly_0())
  let t563 = @tactics.disch_then(fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s559 = @tactics.assume_tac(x558)
      fn(x560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s559(x560)
      }
    })(t561(x562))
  })
  let t557 = @simp.rewrite_tac(@list.List([]))
  let t555 = @simp.gen_rewrite_rule(fn(x554 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x554
  }, @list.List([@lists.not_ex()]))
  let t565 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s552 = @tactics.mp_tac(x551)
      fn(x553 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s552(x553)
      }
    })(t555(x556))
  }), t557), t563), t564)
  let t550 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(r : Real) <= (z : Real) || z <= abs(r)")), @analysis.real_le_trans(), @complexnumbers.complex_norm_cx(), @calc_int.real_abs_num(), @real.real_abs_pos()]))
  let t549 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@cpoly.poly()))]))
  let t547 = @term_syntax.parse_term("abs((r : Real))")
  let t548 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("CONS((h : Complex), (t : List[Complex]))"), t547]), poly_minimum_modulus_disc()))
  let t546 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Real)"))(fn(x543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s544 = @tactics.assume_tac(x543)
    fn(x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s544(x545)
    }
  }))
  let t539 = @term_syntax.parse_term("norm(poly(CONS((h : Complex), (t : List[Complex])), Cx(real_of_num(0))))")
  let t542 = @tactics.disch_then(fn(x541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s537 = @tactics.mp_tac(x536)
      fn(x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s537(x538)
      }
    })(((x540 : @kernel.Thm) => @bool.spec(t539, x540))(x541))
  })
  let t534 = @drule.match_mp(poly_infinity())
  let t531 = @term_syntax.parse_term("(h : Complex)")
  let t566 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x535 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s529 = @tactics.mp_tac(x528)
        fn(x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s529(x530)
        }
      })(((x532 : @kernel.Thm) => @bool.spec(t531, x532))(x533))
    })(t534(x535))
  }), t542), t546), t548), t549), t550), t565])
  let t527 = @class.asm_cases_tac(@term_syntax.parse_term("EX((b : Complex) => !(b == Cx(real_of_num(0))), (t : List[Complex]))"))
  let t567 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@cpoly.poly(), @analysis.real_le_refl()]))), t527), t566)
  poly_minimum_modulus_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∃ z : Complex, ∀ w : Complex, norm(poly(p, z)) <= norm(poly(p, w))"), t567))
}

///|
let poly_minimum_modulus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MINIMUM_MODULUS")

///|
/// `POLY_MINIMUM_MODULUS`
pub fn poly_minimum_modulus() -> @kernel.Thm {
  poly_minimum_modulus_c.get()
}

///|
/// constant
fn step_17() -> Unit raise {
  constant_c.set(@pair.new_definition(@term_syntax.parse_term("(constant : ((_) -> _) -> Bool)((f : (_) -> _)) == (∀ w : _, ∀ z : _, f(w) == f(z))")))
}

///|
let constant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("constant")

///|
/// `constant`
pub fn constant() -> @kernel.Thm {
  constant_c.get()
}

///|
/// NONCONSTANT_LENGTH
fn step_18() -> Unit raise {
  let t571 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_rzero()]))
  let t570 = @simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)")), @lists.length_eq_nil(), @cpoly.poly()]))
  let t569 = @simp.rewrite_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("(2 <= SUC((n : Num))) == !(n == 0)"))]))
  let t568 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let t572 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([constant()])), @lists.list_induct_tac), t568), t569), t570), t571)
  nonconstant_length_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], !constant(poly(p)) → 2 <= LENGTH(p)"), t572))
}

///|
let nonconstant_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONCONSTANT_LENGTH")

///|
/// `NONCONSTANT_LENGTH`
pub fn nonconstant_length() -> @kernel.Thm {
  nonconstant_length_c.get()
}

///|
/// POLY_DECOMPOSE_LEMMA
fn step_19() -> Unit raise {
  let t604 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_pow(), @complexnumbers.complex_mul_lid(), @arith.add_clauses(), @lists.length()]))
  let t601 = @term_syntax.parse_term("(t : List[Complex])")
  let t602 = @term_syntax.parse_term("(h : Complex)")
  let t603 = @tactics.map_every(fn(x598 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s599 = @tactics.exists_tac(x598)
    fn(x600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s599(x600)
    }
  }, @list.List([@term_syntax.parse_term("0"), t602, t601]))
  let t605 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t603), t604)
  let t596 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_add_lid(), @complexnumbers.complex_pow(), @equal.gsym(@complexnumbers.complex_mul_assoc())]))
  let t595 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly(), @lists.length(), @equal.gsym(@arith.add1()), @arith.add_clauses()]))
  let t592 = @term_syntax.parse_term("(q : List[Complex])")
  let t593 = @term_syntax.parse_term("(a : Complex)")
  let t594 = @tactics.map_every(fn(x589 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s590 = @tactics.exists_tac(x589)
    fn(x591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s590(x591)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) + 1"), t593, t592]))
  let t586 = @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Complex])"))(@tactics.strip_assume_tac)
  let t587 = @tactics.x_choose_then(@term_syntax.parse_term("(a : Complex)"))(t586)
  let t588 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(t587))
  let t585 = @tactics.disch_then(@tactics.ante_res_then(fn(x582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s583 = @tactics.mp_tac(x582)
    fn(x584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s583(x584)
    }
  }))
  let t581 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_add_lid(), @complexnumbers.complex_entire()]))
  let t606 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x580 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x574 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s575 = @equal.land_conv(x574)
      fn(x576 : @kernel.Term) -> @kernel.Thm raise {
        s575(x576)
      }
    })((fn(x577 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s578 = @equal.once_depth_conv(x577)
      fn(x579 : @kernel.Term) -> @kernel.Thm raise {
        s578(x579)
      }
    })(x580))
  }, @list.List([@cpoly.poly()])), t581), t585), t588), t594), t595), t596), t605])
  let t573 = @class.asm_cases_tac(@term_syntax.parse_term("(h : Complex) == Cx(real_of_num(0))"))
  let t607 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@lists.list_induct_tac, @list.List([@simp.rewrite_tac(@list.List([@cpoly.poly()])), @tactics.all_tac])), t573), t606)
  poly_decompose_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], !(∀ z : Complex, !(z == Cx(real_of_num(0))) → poly(p, z) == Cx(real_of_num(0))) → (∃ k : Num, ∃ a : Complex, ∃ q : List[Complex], !(a == Cx(real_of_num(0))) && SUC(LENGTH(q) + k) == LENGTH(p) && (∀ z : Complex, poly(p, z) == pow(z, k) * poly(CONS(a, q), z)))"), t607))
}

///|
let poly_decompose_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DECOMPOSE_LEMMA")

///|
/// `POLY_DECOMPOSE_LEMMA`
pub fn poly_decompose_lemma() -> @kernel.Thm {
  poly_decompose_lemma_c.get()
}

///|
/// POLY_DECOMPOSE
fn step_20() -> Unit raise {
  let t630 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_mul_assoc())]))
  let t629 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_lzero(), @complexnumbers.complex_add_rid(), @complexnumbers.complex_pow()]))
  let t628 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @equal.gsym(@arith.add1()), @lists.length(), @nums.not_suc()]))
  let t625 = @term_syntax.parse_term("(q : List[Complex])")
  let t626 = @term_syntax.parse_term("(a : Complex)")
  let t627 = @tactics.map_every(fn(x622 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s623 = @tactics.exists_tac(x622)
    fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s623(x624)
    }
  }, @list.List([@term_syntax.parse_term("SUC((k : Num))"), t626, t625]))
  let t619 = @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Complex])"))(@tactics.strip_assume_tac)
  let t620 = @tactics.x_choose_then(@term_syntax.parse_term("(a : Complex)"))(t619)
  let t621 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(t620))
  let t616 = @equal.gsym(@complexnumbers.complex_entire())
  let t617 = @simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → (b : Bool)) == (a || b)")), t616]))
  let t615 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(b : Bool) → !(a : Bool)) == (a → b)")), @complexnumbers.complex_eq_add_lcancel()]))
  let t614 = @simp.rewrite_tac(@list.List([constant(), @cpoly.poly()]))
  let t618 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s612 = @tactics.mp_tac(x611)
    fn(x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s612(x613)
    }
  }), t614), t615), t617), @tactics.all_tac])
  let t610 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : List[Complex])"), poly_decompose_lemma()))
  let t609 = @tactics.pop_assum(fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t631 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@lists.list_induct_tac, @list.List([@simp.rewrite_tac(@list.List([constant(), @cpoly.poly()])), @tactics.all_tac])), t609), @tactics.disch_tac), t610), @tactics.ants_tac), t618), t621), t627), t628), t629), t630)
  poly_decompose_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], !constant(poly(p)) → (∃ k : Num, ∃ a : Complex, ∃ q : List[Complex], !(a == Cx(real_of_num(0))) && !(k == 0) && LENGTH(q) + (k + 1) == LENGTH(p) && (∀ z : Complex, poly(p, z) == poly(p, Cx(real_of_num(0))) + pow(z, k) * poly(CONS(a, q), z)))"), t631))
}

///|
let poly_decompose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DECOMPOSE")

///|
/// `POLY_DECOMPOSE`
pub fn poly_decompose() -> @kernel.Thm {
  poly_decompose_c.get()
}

///|
/// POLY_REPLICATE_APPEND
fn step_21() -> Unit raise {
  let t633 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_assoc()]))
  let t632 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_add_lid()]))
  let t634 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@lists.replicate(), @lists.append(), @complexnumbers.complex_pow(), @complexnumbers.complex_mul_lid()]))), t632), t633)
  poly_replicate_append_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : List[Complex], ∀ x : Complex, poly(APPEND(REPLICATE(n, Cx(real_of_num(0))), p), x) == pow(x, n) * poly(p, x)"), t634))
}

///|
let poly_replicate_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_REPLICATE_APPEND")

///|
/// `POLY_REPLICATE_APPEND`
pub fn poly_replicate_append() -> @kernel.Thm {
  poly_replicate_append_c.get()
}

///|
/// FUNDAMENTAL_THEOREM_OF_ALGEBRA
fn step_22() -> Unit raise {
  let t908 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (t : Real) && t < (x : Real) → abs(t) < x"))]))
  let t907 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_rdiv_eq()), @real.real_lt_mul(), @complexnumbers.complex_norm_pow(), @real.real_pow_lt(), @complexnumbers.complex_norm_nz()]))
  let t905 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_norm_cx(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (t : Real) && t < real_of_num(1) → abs(t) <= real_of_num(1)"))]))
  let t904 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_pos()]))
  let t903 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t902 = @simp.gen_rewrite_tac(fn(x899 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s900 = @equal.rand_conv(x899)
    fn(x901 : @kernel.Term) -> @kernel.Thm raise {
      s900(x901)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t898 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_mul()]))
  let t897 = @tactics.first_assum(@tactics.match_mp_tac)
  let t896 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_pos()]))
  let t895 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t894 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t906 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t894), t895), t896), t897), t898), t902), t903), t904), t905), @tactics.all_tac])
  let t893 = @tactics.exists_tac(@term_syntax.parse_term("abs((t : Real)) * (norm(pow((w : Complex), (k : Num) + 1)) * (m : Real))"))
  let t892 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t891 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_mul(), @arith.add1(), @complexnumbers.complex_norm_cx()]))
  let t890 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@complexnumbers.complex_pow()))]))
  let t888 = @term_syntax.parse_term("(a : Complex) * ((b : Complex) * ((c : Complex) * (d : Complex))) == b * (c * a * d)")
  let t889 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@complexnumbers.complex_mul_ac())(t888)]))
  let t887 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt()]))
  let t886 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t885 = @simp.gen_rewrite_tac(fn(x882 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s883 = @equal.rand_conv(x882)
    fn(x884 : @kernel.Term) -> @kernel.Thm raise {
      s883(x884)
    }
  }, @list.List([@equal.gsym(@analysis.real_mul_rid())]))
  let t881 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @analysis.real_lt_imp_le(), @real.real_pow_le()]))
  let t880 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_cx()]))
  let t879 = @simp.once_rewrite_tac(@list.List([@complexnumbers.complex_norm_mul()]))
  let t878 = @simp.asm_simp_tac(@list.List([@real.real_pow_1_le(), @analysis.real_lt_imp_le()]))
  let t877 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_pos()]))
  let t876 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x < (t : Real) && t <= real_of_num(1) → abs(real_of_num(1) + t * -real_of_num(1)) + x < real_of_num(1)")))
  let t875 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_cx()]))
  let t874 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_triangle()]))
  let t873 = @tactics.exists_tac(@term_syntax.parse_term("norm(Cx(real_of_num(1) + pow((t : Real), (k : Num)) * -real_of_num(1))) + norm(Cx(pow(t, k)) * (pow((w : Complex), k) * (Cx(t) * (w * poly((s : List[Complex]), Cx(t) * w)))))"))
  let t872 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t871 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_add_assoc(), @equal.gsym(@complexnumbers.cx_add())]))
  let t868 = @equal.gsym(@complexnumbers.cx_mul())
  let t869 = @equal.gsym(@complexnumbers.cx_pow())
  let t870 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexnumbers.cx_neg()), t869, t868]))
  let t865 = @drule.match_mp(@cpoly.simple_complex_arith(@term_syntax.parse_term("(a : Complex) + (w : Complex) == Cx(real_of_num(0)) → w == -a")))
  let t867 = @tactics.first_assum(fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s863 = @tactics.subst1_tac(x862)
      fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s863(x864)
      }
    })(t865(x866))
  })
  let t861 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_add_ldistrib(), @equal.gsym(@complexnumbers.complex_mul_assoc())]))
  let t860 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_pow_mul()]))
  let t859 = @tactics.exists_tac(@term_syntax.parse_term("Cx((t : Real)) * (w : Complex)"))
  let t858 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(@tactics.strip_assume_tac))
  let t857 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_01(), @real.real_lt_inv_eq(), @real.real_lt_mul(), @real.real_pow_lt(), @complexnumbers.complex_norm_nz()]))
  let t855 = @term_syntax.parse_term("inv(pow(norm((w : Complex)), (k : Num) + 1) * (m : Real))")
  let t856 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(1)"), t855]), @real.real_down2()))
  let t853 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_add_rid(), @complexnumbers.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t852 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_pow(), @complexnumbers.complex_mul_lzero()]))
  let t850 = @term_syntax.parse_term("(k : Num)")
  let t851 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t850)
  let t849 = @tactics.undisch_tac(@term_syntax.parse_term("!((k : Num) == 0)"))
  let t848 = @tactics.disch_then(fn(x845 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s846 = @tactics.subst1_tac(x845)
    fn(x847 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s846(x847)
    }
  })
  let t844 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) == (b → !a)"))]))
  let t854 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("Cx(real_of_num(1)) + pow((w : Complex), (k : Num)) * (a : Complex) == Cx(real_of_num(0))")), t844), t848), t849), t851), @nums.induct_tac), t852), t853), @tactics.all_tac])
  let t843 = @tactics.subgoal_then(@term_syntax.parse_term("!((w : Complex) == Cx(real_of_num(0)))"), fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s841 = @tactics.assume_tac(x840)
    fn(x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s841(x842)
    }
  })
  let t839 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Real)"))(@tactics.strip_assume_tac))
  let t837 = @term_syntax.parse_term("norm((w : Complex))")
  let t838 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(s : List[Complex])"), t837]), poly_bound_exists()))
  let t834 = @term_syntax.parse_term("(w : Complex)")
  let t836 = @tactics.disch_then((x835 : @kernel.Thm) => @tactics.x_choose_tac(t834, x835))
  let t833 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) → SUC(k - 1) == k"))]))
  let t832 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@complexnumbers.complex_pow()))]))
  let t830 = @term_syntax.parse_term("(a : Complex) * ((b : Complex) * (c : Complex)) == a * b * c")
  let t831 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@complexnumbers.complex_mul_ac())(t830)]))
  let t829 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t828 = @simp.rewrite_tac(@list.List([constant(), poly_replicate_append(), @cpoly.poly()]))
  let t826 = @simp.rewrite_tac(@list.List([@complexnumbers.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t825 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_entire(), @complexnumbers.complex_pow_one(), @cpoly.simple_complex_arith(@term_syntax.parse_term("((a : Complex) == a + (b : Complex)) == (b == Cx(real_of_num(0)))"))]))
  let t824 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_lid(), @complexnumbers.complex_mul_lzero(), @complexnumbers.complex_add_rid()]))
  let t819 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t820 = @list.List([@term_syntax.parse_term("Cx(real_of_num(0))"), t819])
  let t823 = @tactics.disch_then(fn(x822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s817 = @tactics.mp_tac(x816)
      fn(x818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s817(x818)
      }
    })(((x821 : @kernel.Thm) => @bool.specl(t820, x821))(x822))
  })
  let t815 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t814 = @simp.rewrite_tac(@list.List([constant(), poly_replicate_append(), @cpoly.poly()]))
  let t813 = @tactics.undisch_tac(@term_syntax.parse_term("!((k : Num) == 0)"))
  let t827 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.length(), @lists.length_append(), @lists.length_replicate()])), t813), @int.arith_tac), @tactics.all_tac])), t814), t815), t823), t824), t825), t826), @tactics.all_tac])
  let t809 = @term_syntax.parse_term("CONS(Cx(real_of_num(1)), APPEND(REPLICATE((k : Num) - 1, Cx(real_of_num(0))), [(a : Complex)]))")
  let t812 = @tactics.disch_then(fn(x811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s807 = @tactics.mp_tac(x806)
      fn(x808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s807(x808)
      }
    })(((x810 : @kernel.Thm) => @bool.spec(t809, x810))(x811))
  })
  let t804 = @tactics.undisch_tac(@term_syntax.parse_term("LENGTH((s : List[Complex])) + ((k : Num) + 1) == (n : Num)"))
  let t805 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((k : Num) + 1 == (n : Num))")), t804), @int.arith_tac), @tactics.all_tac])
  let t800 = @term_syntax.parse_term("(k : Num) + 1")
  let t803 = @tactics.first_x_assum(fn(x802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s798 = @tactics.mp_tac(x797)
      fn(x799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s798(x799)
      }
    })(((x801 : @kernel.Thm) => @bool.spec(t800, x801))(x802))
  })
  let t794 = @term_syntax.parse_term("2 <= (n : Num)")
  let t795 = @tactics.map_every(fn(x791 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s792 = @tactics.undisch_tac(x791)
    fn(x793 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s792(x793)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) + 1 == (n : Num)"), t794]))
  let t790 = @simp.asm_rewrite_tac(@list.List([]))
  let t789 = @tactics.match_mp_tac(reduce_poly_simple())
  let t788 = @simp.once_rewrite_tac(@list.List([@complexnumbers.complex_mul_sym()]))
  let t787 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t786 = @tactics.disch_then(fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s784 = @tactics.subst1_tac(x783)
    fn(x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s784(x785)
    }
  })
  let t782 = @simp.rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t781 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((s : Num) + (m : Num) == m) == (s == 0)")), @lists.length_eq_nil()]))
  let t796 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("LENGTH((s : List[Complex])) + ((k : Num) + 1) == (n : Num)")), t781), t782), t786), t787), t788), t789), t790), t795), @int.arith_tac), @tactics.all_tac])
  let t780 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) + 1 == (n : Num)"))
  let t779 = @simp.asm_rewrite_tac(@list.List([]))
  let t778 = @tactics.disch_then(fn(x776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x776
    @simp.once_rewrite_tac(@list.List([th_4]))
  })
  let t775 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x771 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s769 = @tactics.subst_all_tac(x768)
      fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s769(x770)
      }
    })(@equal.sym(x771))
  }, fn(x772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s773 = @tactics.mp_tac(x772)
    fn(x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s773(x774)
    }
  }))
  let t767 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x761 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s762 = @tactics.assume_tac(x761)
    fn(x763 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s762(x763)
    }
  }, fn(x764 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s765 = @tactics.mp_tac(x764)
    fn(x766 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s765(x766)
    }
  }))
  let t760 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x754 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s755 = @tactics.assume_tac(x754)
    fn(x756 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s755(x756)
    }
  }, fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s758 = @tactics.mp_tac(x757)
    fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s758(x759)
    }
  }))
  let t751 = @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Complex])"))(fn(x748 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s749 = @tactics.mp_tac(x748)
    fn(x750 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s749(x750)
    }
  })
  let t752 = @tactics.x_choose_then(@term_syntax.parse_term("(a : Complex)"))(t751)
  let t753 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(t752))
  let t745 = @drule.match_mp(poly_decompose())
  let t747 = @tactics.first_assum(fn(x746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s743 = @tactics.mp_tac(x742)
      fn(x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s743(x744)
      }
    })(t745(x746))
  })
  let t741 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_rdiv_eq()), @complexnumbers.complex_norm_nz(), @complexnumbers.complex_norm_mul(), @real.real_div_refl(), @complexnumbers.complex_norm_zero()]))
  let t740 = @tactics.pop_assum_list((x739 : @list.List[@kernel.Thm]) => @tactics.map_every(fn(x736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x736
    let t738 = @kernel.concl(th_3)
    if @basics.free_in(@term_syntax.parse_term("(q : List[Complex])"), t738) {
      @tactics.all_tac
    } else {
      @tactics.assume_tac(th_3)
    }
  }, x739))
  let t735 = @simp.asm_rewrite_tac(@list.List([]))
  let t733 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_eq_mul_rcancel()]))
  let t732 = @simp.gen_rewrite_tac(fn(x731 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x725 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s726 = @equal.land_conv(x725)
      fn(x727 : @kernel.Term) -> @kernel.Thm raise {
        s726(x727)
      }
    })((fn(x728 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s729 = @equal.land_conv(x728)
      fn(x730 : @kernel.Term) -> @kernel.Thm raise {
        s729(x730)
      }
    })(x731))
  }, @list.List([@equal.gsym(@complexnumbers.complex_mul_lid())]))
  let t724 = @simp.asm_rewrite_tac(@list.List([]))
  let t721 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t734 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x723 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s719 = @tactics.mp_tac(x718)
      fn(x720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s719(x720)
      }
    })(((x722 : @kernel.Thm) => @bool.spec(t721, x722))(x723))
  }), t724), t732), t733), @tactics.all_tac])
  let t717 = @tactics.subgoal_then(@term_syntax.parse_term("poly((r : List[Complex]), Cx(real_of_num(0))) == Cx(real_of_num(1))"), fn(x714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s715 = @tactics.assume_tac(x714)
    fn(x716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s715(x716)
    }
  })
  let t712 = @meson.meson_tac(@list.List([]))
  let t711 = @simp.asm_rewrite_tac(@list.List([constant(), @complexnumbers.complex_eq_mul_rcancel()]))
  let t713 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!constant(poly((q : List[Complex])))")), t711), t712), @tactics.all_tac])
  let t710 = @tactics.subgoal_then(@term_syntax.parse_term("!constant(poly((r : List[Complex])))"), fn(x707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s708 = @tactics.assume_tac(x707)
    fn(x709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s708(x709)
    }
  })
  let t705 = @simp.rewrite_tac(@list.List([@lists.length_map()]))
  let t706 = @list.List([@tactics.then_tac(@analysis.expand_tac("r"), t705), @tactics.all_tac])
  let t704 = @tactics.subgoal_then(@term_syntax.parse_term("LENGTH((q : List[Complex])) == LENGTH((r : List[Complex]))"), fn(x701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s702 = @tactics.subst_all_tac(x701)
    fn(x703 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s702(x703)
    }
  })
  let t700 = @simp.abbrev_tac(@term_syntax.parse_term("(r : List[Complex]) == MAP(op_star(inv((a0 : Complex))), (q : List[Complex]))"))
  let t698 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_mul_rinv(), @complexnumbers.complex_mul_rid()]))
  let t696 = @term_syntax.parse_term("(a : Complex) * (b : Complex) * (c : Complex) == b * (c * a)")
  let t697 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@complexnumbers.complex_mul_ac())(t696)]))
  let t699 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([poly_cmul_map()])), t697), t698), @tactics.all_tac])
  let t695 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Complex, poly((q : List[Complex]), z) == poly(MAP(op_star(inv((a0 : Complex))), q), z) * a0"), fn(x692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s693 = @tactics.assume_tac(x692)
    fn(x694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s693(x694)
    }
  })
  let t691 = @simp.abbrev_tac(@term_syntax.parse_term("(a0 : Complex) == poly((q : List[Complex]), Cx(real_of_num(0)))"))
  let t690 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @analysis.real_not_le()]))
  let t689 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t688 = @tactics.pop_assum_list((x687 : @list.List[@kernel.Thm]) => @tactics.map_every(fn(x684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x684
    let t686 = @kernel.concl(th_2)
    if @basics.free_in(@term_syntax.parse_term("(p : List[Complex])"), t686) {
      @tactics.all_tac
    } else {
      @tactics.assume_tac(th_2)
    }
  }, x687))
  let t683 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t682 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Complex, norm(poly((q : List[Complex]), Cx(real_of_num(0)))) <= norm(poly(q, w))"), fn(x679 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s680 = @tactics.mp_tac(x679)
    fn(x681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s680(x681)
    }
  })
  let t678 = @list.List([@meson.asm_meson_tac(@list.List([@complexnumbers.complex_add_rid()])), @tactics.all_tac])
  let t677 = @tactics.subgoal_then(@term_syntax.parse_term("poly((p : List[Complex]), (c : Complex)) == poly((q : List[Complex]), Cx(real_of_num(0)))"), fn(x674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s675 = @tactics.subst_all_tac(x674)
    fn(x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s675(x676)
    }
  })
  let t672 = @meson.asm_meson_tac(@list.List([@cpoly.simple_complex_arith(@term_syntax.parse_term("(a : Complex) + ((x : Complex) - a) == x"))]))
  let t671 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Complex, poly((q : List[Complex]), z - (c : Complex)) == poly((p : List[Complex]), z)"), fn(x669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x669
    @meson.meson_tac(@list.List([th_1, constant()]))
  })
  let t673 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!constant(poly((p : List[Complex])))")), t671), t672), @tactics.all_tac])
  let t668 = @tactics.subgoal_then(@term_syntax.parse_term("!constant(poly((q : List[Complex])))"), fn(x665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s666 = @tactics.assume_tac(x665)
    fn(x667 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s666(x667)
    }
  })
  let t664 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s658 = @tactics.subst_all_tac(x657)
      fn(x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s658(x659)
      }
    })(@equal.sym(x660))
  }, fn(x661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s662 = @tactics.assume_tac(x661)
    fn(x663 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s662(x663)
    }
  }))
  let t656 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : List[Complex])"))(fn(x653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s654 = @tactics.mp_tac(x653)
    fn(x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s654(x655)
    }
  }))
  let t651 = @term_syntax.parse_term("(p : List[Complex])")
  let t652 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c : Complex)"), t651]), poly_offset()))
  let t650 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t649 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Complex]), (c : Complex)) == Cx(real_of_num(0))"))
  let t647 = @bool.spec(@term_syntax.parse_term("(p : List[Complex])"), poly_minimum_modulus())
  let t648 = @tactics.x_choose_tac(@term_syntax.parse_term("(c : Complex)"), t647)
  let t646 = @simp.asm_rewrite_tac(@list.List([]))
  let t643 = @drule.match_mp(nonconstant_length())
  let t645 = @tactics.first_assum(fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s641 = @tactics.mp_tac(x640)
      fn(x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s641(x642)
      }
    })(t643(x644))
  })
  let t639 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : List[Complex])"))
  let t638 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t637 = @tactics.match_mp_tac(@arith.num_wf())
  let t909 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ p : List[Complex], LENGTH(p) == n && !constant(poly(p)) → (∃ z : Complex, poly(p, z) == Cx(real_of_num(0)))"), fn(x635 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x635
    @meson.meson_tac(@list.List([th]))
  }), t637), t638), @tactics.strip_tac), t639), @tactics.strip_tac), t645), t646), @tactics.disch_tac), t648), t649), t650), t652), t656), t664), t668), t673), t677), t678), t682), t683), t688), t689), t690), t691), t695), t699), t700), t704), t706), t710), t713), t717), t734), t735), t740), t741), t747), t753), t760), t767), t775), t778), t779), t780), t796), t803), @tactics.ants_tac), t805), t812), @tactics.ants_tac), t827), t828), t829), t831), t832), t833), t836), t838), t839), t843), t854), t856), t857), t858), t859), t860), t861), t867), t870), t871), t872), t873), t874), t875), t876), t877), t878), t879), t880), t881), t885), t886), t887), t889), t890), t891), t892), t893), @tactics.conj_tac), t906), t907), t908)
  fundamental_theorem_of_algebra_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], !constant(poly(p)) → (∃ z : Complex, poly(p, z) == Cx(real_of_num(0)))"), t909))
}

///|
let fundamental_theorem_of_algebra_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNDAMENTAL_THEOREM_OF_ALGEBRA")

///|
/// `FUNDAMENTAL_THEOREM_OF_ALGEBRA`
pub fn fundamental_theorem_of_algebra() -> @kernel.Thm {
  fundamental_theorem_of_algebra_c.get()
}

///|
/// FUNDAMENTAL_THEOREM_OF_ALGEBRA_ALT
fn step_23() -> Unit raise {
  let t975 = @meson.asm_meson_tac(@list.List([@real.real_le_lmul(), @real.real_abs_pos(), @complexnumbers.complex_norm_cx(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && x < real_of_num(1) → abs(x) <= real_of_num(1)"))]))
  let t974 = @simp.asm_simp_tac(@list.List([@real.real_lt_rmul(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && x < (a : Real) → abs(x) < a"))]))
  let t973 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real)) * (m : Real)"))
  let t972 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t971 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@analysis.real_le_refl(), @real.real_div_rmul(), @analysis.real_lt_imp_nz()]))])
  let t970 = @tactics.exists_tac(@term_syntax.parse_term("norm((h : Complex)) / (m : Real) * m"))
  let t969 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t968 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_mul(), @complexnumbers.complex_norm_cx()]))
  let t967 = @simp.rewrite_tac(@list.List([@realax.real_abs(), @complexnumbers.complex_norm_pos()]))
  let t966 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((a : Real)) < abs((b : Real)) → !(a == b)")))
  let t965 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_norm_neg()]))
  let t961 = @term_syntax.parse_term("norm")
  let t964 = @tactics.disch_then(fn(x963 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x958 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s959 = @tactics.mp_tac(x958)
      fn(x960 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s959(x960)
      }
    })(((x962 : @kernel.Thm) => @equal.ap_term(t961, x962))(x963))
  })
  let t957 = @simp.rewrite_tac(@list.List([@cpoly.simple_complex_arith(@term_syntax.parse_term("((x : Complex) + (y : Complex) == Cx(real_of_num(0))) == (y == -x)"))]))
  let t956 = @simp.asm_simp_tac(@list.List([@complexnumbers.cx_inj(), @analysis.real_lt_imp_nz()]))
  let t952 = @term_syntax.parse_term("Cx((x : Real))")
  let t955 = @tactics.disch_then(fn(x954 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x949 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s950 = @tactics.mp_tac(x949)
      fn(x951 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s950(x951)
      }
    })(((x953 : @kernel.Thm) => @bool.spec(t952, x953))(x954))
  })
  let t948 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Real)"))(@tactics.strip_assume_tac))
  let t947 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_01(), @real.real_lt_div(), @complexnumbers.complex_norm_nz()]))
  let t945 = @term_syntax.parse_term("real_of_num(1)")
  let t946 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("norm((h : Complex)) / (m : Real)"), t945]), @real.real_down2()))
  let t944 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Real)"))(@tactics.strip_assume_tac))
  let t942 = @term_syntax.parse_term("real_of_num(1)")
  let t943 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : List[Complex])"), t942]), poly_bound_exists()))
  let t941 = @simp.asm_simp_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_add_lid(), @complexnumbers.complex_entire()]))
  let t940 = @class.asm_cases_tac(@term_syntax.parse_term("(h : Complex) == Cx(real_of_num(0))"))
  let t939 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t937 = @term_syntax.parse_term("(p : List[Complex])")
  let t938 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Complex])"), t937)
  let t936 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_entire(), @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!a → b)"))]))
  let t935 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_lzero(), @complexnumbers.complex_eq_add_lcancel()]))
  let t932 = @simp.once_rewrite_rule(@list.List([@theorems.swap_forall_thm()]))
  let t929 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t934 = @tactics.disch_then(fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x926 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s927 = @tactics.mp_tac(x926)
        fn(x928 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s927(x928)
        }
      })(((x930 : @kernel.Thm) => @bool.spec(t929, x930))(x931))
    })(t932(x933))
  })
  let t925 = @simp.rewrite_tac(@list.List([constant(), @cpoly.poly(), @analysis.real_eq_ladd()]))
  let t924 = @tactics.pop_assum(fn(x923 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t922 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(b : Bool) → !(a : Bool)) == (a → b)"))]))
  let t921 = @tactics.undisch_tac(@term_syntax.parse_term("!ALL((b : Complex) => b == Cx(real_of_num(0)), (t : List[Complex]))"))
  let t920 = @tactics.match_mp_tac(fundamental_theorem_of_algebra())
  let t919 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@cpoly.poly()))]))
  let t917 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_mul_lzero()]))
  let t918 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))")), t917), @tactics.all_tac])
  let t916 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_add_lid()]))
  let t915 = @class.asm_cases_tac(@term_syntax.parse_term("(h : Complex) == Cx(real_of_num(0))"))
  let t914 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm1()]))
  let t912 = @term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == (c && d && a && b)")
  let t913 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@theorems.conj_aci())(t912)]))
  let t911 = @tactics.pop_assum_list(fn(x910 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t976 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@cpoly.poly(), @lists.cons_11()]))), t911), t913), t914), t915), t916), t918), @tactics.disch_tac), t919), t920), t921), t922), t924), t925), t934), t935), t936), t938), @lists.list_induct_tac), t939), t940), t941), t943), t944), t946), t947), t948), t955), t956), t957), t964), t965), t966), t967), t968), t969), t970), @tactics.conj_tac), t971), t972), t973), t974), t975)
  fundamental_theorem_of_algebra_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], !(∃ a : Complex, ∃ l : List[Complex], !(a == Cx(real_of_num(0))) && ALL((b : Complex) => b == Cx(real_of_num(0)), l) && p == CONS(a, l)) → (∃ z : Complex, poly(p, z) == Cx(real_of_num(0)))"), t976))
}

///|
let fundamental_theorem_of_algebra_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNDAMENTAL_THEOREM_OF_ALGEBRA_ALT")

///|
/// `FUNDAMENTAL_THEOREM_OF_ALGEBRA_ALT`
pub fn fundamental_theorem_of_algebra_alt() -> @kernel.Thm {
  fundamental_theorem_of_algebra_alt_c.get()
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
}
