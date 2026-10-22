// Translated from upstream Tutorial/Number_theory.ml; edit this file directly.

///|
/// Tutorial/Number_theory.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// `FERMAT_PRIME_CONV`
pub fn fermat_prime_conv(x1 : Int64) -> @kernel.Thm raise {
  let n = x1
  let t3 = @term_syntax.parse_term("prime(EXP(2, EXP(2, (x : Num))) + 1)")
  let t2 = @term_syntax.parse_term("(x : Num)")
  let tm = @basics.subst(@list.List([(@nums.mk_small_numeral(n), t2)]), t3)
  @equal.thenc(@equal.rand_conv(@calc_num.num_reduce_conv), @pocklington.prime_conv)(tm)
}

///|
/// Tutorial/Number_theory.ml:11
fn step_2() -> Unit raise {
  ignore(fermat_prime_conv(0L))
}

///|
/// Tutorial/Number_theory.ml:12
fn step_3() -> Unit raise {
  ignore(fermat_prime_conv(1L))
}

///|
/// Tutorial/Number_theory.ml:13
fn step_4() -> Unit raise {
  ignore(fermat_prime_conv(2L))
}

///|
/// Tutorial/Number_theory.ml:14
fn step_5() -> Unit raise {
  ignore(fermat_prime_conv(3L))
}

///|
/// Tutorial/Number_theory.ml:15
fn step_6() -> Unit raise {
  ignore(fermat_prime_conv(4L))
}

///|
/// Tutorial/Number_theory.ml:16
fn step_7() -> Unit raise {
  ignore(fermat_prime_conv(5L))
}

///|
/// Tutorial/Number_theory.ml:17
fn step_8() -> Unit raise {
  ignore(fermat_prime_conv(6L))
}

///|
/// Tutorial/Number_theory.ml:18
fn step_9() -> Unit raise {
  ignore(fermat_prime_conv(7L))
}

///|
/// Tutorial/Number_theory.ml:19
fn step_10() -> Unit raise {
  ignore(fermat_prime_conv(8L))
}

///|
/// CONG_TRIVIAL
fn step_11() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([@pocklington.cong_0(), @pocklington.cong_sym(), @pocklington.cong_trans()]))
  cong_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, divides((n : Num), x) && divides(n, y) → op_eq_eq(x, y, mod(n))"), t4))
}

///|
let cong_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_TRIVIAL")

///|
/// `CONG_TRIVIAL`
pub fn cong_trivial() -> @kernel.Thm {
  cong_trivial_c.get()
}

///|
/// `LITTLE_CHECK_CONV`
pub fn little_check_conv(x5 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x5
  @bool.eqt_elim(@equal.thenc(@equal.rator_conv(@equal.land_conv(@calc_num.num_exp_conv)), @pocklington.cong_conv)(tm))
}

///|
/// Tutorial/Number_theory.ml:28
fn step_12() -> Unit raise {
  ignore(little_check_conv(@term_syntax.parse_term("op_eq_eq(EXP(9, 8), 9, mod(3))")))
}

///|
/// Tutorial/Number_theory.ml:29
fn step_13() -> Unit raise {
  ignore(little_check_conv(@term_syntax.parse_term("op_eq_eq(EXP(9, 3), 9, mod(3))")))
}

///|
/// Tutorial/Number_theory.ml:30
fn step_14() -> Unit raise {
  ignore(little_check_conv(@term_syntax.parse_term("op_eq_eq(EXP(10, 7), 10, mod(7))")))
}

///|
/// Tutorial/Number_theory.ml:31
fn step_15() -> Unit raise {
  ignore(little_check_conv(@term_syntax.parse_term("op_eq_eq(EXP(2, 7), 2, mod(7))")))
}

///|
/// Tutorial/Number_theory.ml:32
fn step_16() -> Unit raise {
  ignore(little_check_conv(@term_syntax.parse_term("op_eq_eq(EXP(777, 13), 777, mod(13))")))
}

///|
/// DIVIDES_FACT_PRIME
fn step_17() -> Unit raise {
  let t7 = @meson.asm_meson_tac(@list.List([@prime.prime_divprod_eq(), @int.divides_le(), @nums.not_suc(), @prime.divides_refl(), @int.arith_rule(@term_syntax.parse_term("!((p : Num) <= (n : Num)) && p <= SUC(n) → p == SUC(n)"))]))
  let t8 = @list.List([@meson.asm_meson_tac(@list.List([@int.divides_one(), @prime.prime_0(), @prime.prime_1()])), t7])
  let t6 = @simp.rewrite_tac(@list.List([@arith.fact(), @arith.le()]))
  let t9 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), @nums.induct_tac), t6), t8)
  divides_fact_prime_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → (∀ n : Num, divides(p, FACT(n)) == (p <= n))"), t9))
}

///|
let divides_fact_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_FACT_PRIME")

///|
/// `DIVIDES_FACT_PRIME`
pub fn divides_fact_prime() -> @kernel.Thm {
  divides_fact_prime_c.get()
}

///|
/// DIVIDES_BINOM_PRIME
fn step_18() -> Unit raise {
  let t15 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (n : Num) && n < (p : Num) → p - n < p"))]))
  let t14 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_lt()), @arith.lt_refl()]))
  let t13 = @simp.asm_simp_tac(@list.List([divides_fact_prime(), @prime.prime_divprod_eq(), @arith.sub_add(), @arith.lt_imp_le()]))
  let t10 = @term_syntax.parse_term("(n : Num)")
  let t11 = @bool.specl(@list.List([@term_syntax.parse_term("(p : Num) - (n : Num)"), t10]), @binomial.binom_fact())
  let t12 = @tactics.mp_tac(@equal.ap_term(@term_syntax.parse_term("divides((p : Num))"), t11))
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t12), t13), t14), t15)
  divides_binom_prime_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : Num, prime(p) && 0 < n && n < p → divides(p, binom((p, n)))"), t16))
}

///|
let divides_binom_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_BINOM_PRIME")

///|
/// `DIVIDES_BINOM_PRIME`
pub fn divides_binom_prime() -> @kernel.Thm {
  divides_binom_prime_c.get()
}

///|
/// DIVIDES_NSUM
fn step_19() -> Unit raise {
  let t18 = @meson.asm_meson_tac(@list.List([@arith.le(), @arith.le_trans(), @prime.divides_0(), @prime.divides_add(), @arith.le_refl()]))
  let t17 = @simp.asm_rewrite_tac(@list.List([@iterate.nsum_clauses_numseg()]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t17), t18)
  divides_nsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → divides((p : Num), (f : (Num) -> Num)(i))) → divides(p, nsum(op_dot_dot(m, n), f))"), t19))
}

///|
let divides_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_NSUM")

///|
/// `DIVIDES_NSUM`
pub fn divides_nsum() -> @kernel.Thm {
  divides_nsum_c.get()
}

///|
/// FLT_LEMMA
fn step_20() -> Unit raise {
  let t38 = @meson.asm_meson_tac(@list.List([@prime.divides_rmul(), divides_binom_prime(), @int.arith_rule(@term_syntax.parse_term("0 < (p : Num) && 1 <= (i : Num) && i <= p - 1 → 0 < i && i < p"))]))
  let t37 = @tactics.match_mp_tac(divides_nsum())
  let t36 = @simp.rewrite_tac(@list.List([@pocklington.cong_0()]))
  let t34 = @simp.rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t35 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_add()), t34))
  let t33 = @simp.gen_rewrite_tac(fn(x30 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s31 = @equal.land_conv(x30)
    fn(x32 : @kernel.Term) -> @kernel.Thm raise {
      s31(x32)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) == b + 0 + a"))]))
  let t29 = @simp.rewrite_tac(@list.List([@arith.sub_0(), @arith.sub_refl(), @arith.exp(), @binomial.binom(), @binomial.binom_refl(), @arith.mult_clauses()]))
  let t28 = @simp.asm_simp_tac(@list.List([@iterate.nsum_clauses_left(), @arith.le_0(), @calc_num.arith(), @iterate.nsum_clauses_right()]))
  let t25 = @drule.match_mp(@prime.prime_imp_nz())
  let t27 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s23 = @tactics.mp_tac(x22)
      fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s23(x24)
      }
    })(t25(x26))
  }), @int.arith_tac), @tactics.all_tac])
  let t21 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (p : Num) && 0 < p"), @tactics.strip_assume_tac)
  let t20 = @simp.rewrite_tac(@list.List([@binomial.binomial_theorem()]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t20), t21), t27), t28), t29), t33), t35), t36), t37), t38)
  flt_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) → op_eq_eq(EXP(a + b, p), EXP(a, p) + EXP(b, p), mod(p))"), t39))
}

///|
let flt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLT_LEMMA")

///|
/// `FLT_LEMMA`
pub fn flt_lemma() -> @kernel.Thm {
  flt_lemma_c.get()
}

///|
/// FERMAT_LITTLE
fn step_21() -> Unit raise {
  let t40 = @meson.asm_meson_tac(@list.List([@arith.add1(), flt_lemma(), @arith.exp_one(), @pocklington.cong_add(), @pocklington.cong_trans(), @pocklington.cong_refl()]))
  let t41 = @list.List([@meson.asm_meson_tac(@list.List([@arith.exp_eq_0(), @pocklington.cong_refl(), @prime.prime_0()])), t40])
  let t42 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), @nums.induct_tac), t41)
  fermat_little_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ a : Num, prime(p) → op_eq_eq(EXP(a, p), a, mod(p))"), t42))
}

///|
let fermat_little_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FERMAT_LITTLE")

///|
/// `FERMAT_LITTLE`
pub fn fermat_little() -> @kernel.Thm {
  fermat_little_c.get()
}

///|
/// FERMAT_LITTLE_COPRIME
fn step_22() -> Unit raise {
  let t47 = @simp.asm_simp_tac(@list.List([fermat_little(), @arith.mult_clauses()]))
  let t46 = @simp.asm_simp_tac(@list.List([@prime.prime_imp_nz(), @int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → SUC(p - 1) == p"))]))
  let t45 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]))
  let t44 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t43 = @tactics.match_mp_tac(@pocklington.cong_mult_lcancel())
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t43), t44), t45), t46), t47)
  fermat_little_coprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ a : Num, prime(p) && coprime((a, p)) → op_eq_eq(EXP(a, p - 1), 1, mod(p))"), t48))
}

///|
let fermat_little_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FERMAT_LITTLE_COPRIME")

///|
/// `FERMAT_LITTLE_COPRIME`
pub fn fermat_little_coprime() -> @kernel.Thm {
  fermat_little_coprime_c.get()
}

///|
/// FERMAT_LITTLE_VARIANT
fn step_23() -> Unit raise {
  let t63 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym(), @prime.coprime_exp(), @pocklington.phi_prime(), fermat_little_coprime()]))
  let t62 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp()), @pocklington.cong_refl()]))
  let t61 = @tactics.match_mp_tac(@pocklington.cong_mult())
  let t60 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.exp_1()]))
  let t59 = @simp.gen_rewrite_tac(fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s57 = @equal.land_conv(x56)
    fn(x58 : @kernel.Term) -> @kernel.Thm raise {
      s57(x58)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == a * 1"))]))
  let t55 = @list.List([@meson.asm_meson_tac(@list.List([cong_trivial(), @arith.add_ac(), @arith.add1(), @prime.divides_rexp_suc()])), @tactics.all_tac])
  let t52 = @drule.match_mp(@prime.prime_coprime_strong())
  let t49 = @term_syntax.parse_term("(a : Num)")
  let t54 = @tactics.first_assum(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.disj_cases_tac(((x50 : @kernel.Thm) => @bool.spec(t49, x50))(x51))
    })(t52(x53))
  })
  let t64 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t54), t55), t59), t60), t61), t62), t63)
  fermat_little_variant_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ a : Num, prime(p) → op_eq_eq(EXP(a, 1 + (m : Num) * (p - 1)), a, mod(p))"), t64))
}

///|
let fermat_little_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FERMAT_LITTLE_VARIANT")

///|
/// `FERMAT_LITTLE_VARIANT`
pub fn fermat_little_variant() -> @kernel.Thm {
  fermat_little_variant_c.get()
}

///|
/// RSA
fn step_24() -> Unit raise {
  let t87 = @meson.asm_meson_tac(@list.List([fermat_little_variant(), @arith.mult_ac(), @pocklington.cong_sym()]))
  let t86 = @simp.asm_simp_tac(@list.List([@prime.distinct_prime_coprime()]))
  let t85 = @tactics.match_mp_tac(@pocklington.cong_chinese())
  let t84 = @list.List([@meson.asm_meson_tac(@list.List([@arith.mult_eq_1(), @int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 1) == (p == 2)"))])), @tactics.all_tac])
  let t81 = @simp.gen_rewrite_rule(fn(x80 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x80
  }, @list.List([@pocklington.cong_to_1()]))
  let t83 = @tactics.first_x_assum(fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t81(x82))
  })
  let t79 = @simp.gen_rewrite_tac(fn(x78 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x72 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s73 = @equal.land_conv(x72)
      fn(x74 : @kernel.Term) -> @kernel.Thm raise {
        s73(x74)
      }
    })((fn(x75 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s76 = @equal.once_depth_conv(x75)
      fn(x77 : @kernel.Term) -> @kernel.Thm raise {
        s76(x77)
      }
    })(x78))
  }, @list.List([@arith.mult_sym()]))
  let t71 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@int.cong_v1(), @arith.mult_eq_0(), @prime.prime_imp_nz(), @arith.mod_lt()]))])
  let t70 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((plaintext : Num), EXP(plaintext, (e : Num) * (d : Num)), mod((p : Num) * (q : Num)))"), fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s68 = @tactics.mp_tac(x67)
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s68(x69)
    }
  })
  let t66 = @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod(), @arith.mult_eq_0(), @prime.prime_imp_nz(), @arith.exp_exp()]))
  let t65 = @simp.asm_rewrite_tac(@list.List([]))
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t65), t66), t70), t71), t79), t83), t84), t85), t86), t87)
  rsa_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) && prime((q : Num)) && !(p == q) && op_eq_eq((d : Num) * (e : Num), 1, mod((p - 1) * (q - 1))) && (plaintext : Num) < p * q && (ciphertext : Num) == MOD(EXP(plaintext, e), p * q) → plaintext == MOD(EXP(ciphertext, d), p * q)"), t88))
}

///|
let rsa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSA")

///|
/// `RSA`
pub fn rsa() -> @kernel.Thm {
  rsa_c.get()
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
}
