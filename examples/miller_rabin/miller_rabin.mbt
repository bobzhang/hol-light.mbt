// Translated from upstream Examples/miller_rabin.ml; edit this file directly.

///|
/// Examples/miller_rabin.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// miller_rabin_composite
fn step_2() -> Unit raise {
  miller_rabin_composite_c.set(@pair.new_definition(@term_syntax.parse_term("(miller_rabin_composite : (Num, Num) -> Bool)((a : Num), (n : Num)) == (if EVEN(n) { !(n == 2) } else { LET((e : Num) => LET_END(LET((k : Num) => LET_END(!op_eq_eq(EXP(a, k), 1, mod(n)) && (∀ i : Num, i < e → !op_eq_eq(EXP(a, EXP(2, i) * k), n - 1, mod(n)))), DIV(n - 1, EXP(2, e)))), index(2, n - 1)) })")))
}

///|
let miller_rabin_composite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("miller_rabin_composite")

///|
/// `miller_rabin_composite`
pub fn miller_rabin_composite() -> @kernel.Thm {
  miller_rabin_composite_c.get()
}

///|
/// miller_rabin_pseudoprime
fn step_3() -> Unit raise {
  miller_rabin_pseudoprime_c.set(@pair.new_definition(@term_syntax.parse_term("(miller_rabin_pseudoprime : (Num, Num) -> Bool)((a : Num), (n : Num)) == (n == 2 || ODD(n) && LET((e : Num) => LET_END(LET((k : Num) => LET_END(op_eq_eq(EXP(a, k), 1, mod(n)) || (∃ i : Num, i < e && op_eq_eq(EXP(a, EXP(2, i) * k), n - 1, mod(n)))), DIV(n - 1, EXP(2, e)))), index(2, n - 1)))")))
}

///|
let miller_rabin_pseudoprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("miller_rabin_pseudoprime")

///|
/// `miller_rabin_pseudoprime`
pub fn miller_rabin_pseudoprime() -> @kernel.Thm {
  miller_rabin_pseudoprime_c.get()
}

///|
/// NOT_MILLER_RABIN_COMPOSITE
fn step_4() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t6 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t5 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_odd())]))
  let t4 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((n : Num))"))
  let t3 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t2 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t1 = @tactics.repeat_tac(@tactics.gen_tac)
  let t8 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([miller_rabin_composite(), miller_rabin_pseudoprime()])), t1), t2), t3), t4), t5), t6), t7)
  not_miller_rabin_composite_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !miller_rabin_composite(a, n) == miller_rabin_pseudoprime(a, n)"), t8))
}

///|
let not_miller_rabin_composite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_MILLER_RABIN_COMPOSITE")

///|
/// `NOT_MILLER_RABIN_COMPOSITE`
pub fn not_miller_rabin_composite() -> @kernel.Thm {
  not_miller_rabin_composite_c.get()
}

///|
/// NOT_MILLER_RABIN_PSEUDOPRIME
fn step_5() -> Unit raise {
  let t9 = @simp.rewrite_tac(@list.List([@equal.gsym(not_miller_rabin_composite())]))
  not_miller_rabin_pseudoprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !miller_rabin_pseudoprime(a, n) == miller_rabin_composite(a, n)"), t9))
}

///|
let not_miller_rabin_pseudoprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_MILLER_RABIN_PSEUDOPRIME")

///|
/// `NOT_MILLER_RABIN_PSEUDOPRIME`
pub fn not_miller_rabin_pseudoprime() -> @kernel.Thm {
  not_miller_rabin_pseudoprime_c.get()
}

///|
/// MILLER_RABIN_IMP_FERMAT_PSEUDOPRIME_EXPLICIT
fn step_6() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides_div_mult()), @prime.exp_index_divides()]))
  let t65 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t64 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (j : Num) → SUC(i) + (j - (i + 1)) == j"))]))
  let t62 = @equal.gsym(@arith.exp_add())
  let t63 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@arith.exp())), t62]))
  let t61 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(e : Num) * (d : Num) * 2 * (f : Num) == 2 * e * f * d"))]))
  let t60 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t59 = @tactics.conv_tac(@equal.sym_conv)
  let t58 = @tactics.match_mp_tac(@pocklington.eq_imp_cong())
  let t57 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@pocklington.cong_trans()))
  let t54 = @drule.match_mp(@pocklington.cong_exp_1())
  let t51 = @term_syntax.parse_term("EXP(2, index(2, (q : Num) - 1) - ((i : Num) + 1))")
  let t56 = @tactics.disch_then(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s49 = @tactics.mp_tac(x48)
        fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s49(x50)
        }
      })(((x52 : @kernel.Thm) => @bool.spec(t51, x52))(x53))
    })(t54(x55))
  })
  let t47 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t44 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("divides((q : Num), (a : Num) + 1) → op_eq_eq(EXP(a, 2), 1, mod(q))")))
  let t46 = @tactics.disch_then(fn(x45 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s42 = @tactics.mp_tac(x41)
      fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s42(x43)
      }
    })(t44(x45))
  })
  let t40 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @simp.gen_rewrite_rule(fn(x37 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x37
  }, @list.List([@pocklington.cong_minus1()]))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s35 = @tactics.mp_tac(x34)
      fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s35(x36)
      }
    })(t38(x39))
  }), t40), t46), t47), t56), t57), t58), t59), t60), @tactics.ap_term_tac), t61), t63), t64), t65), t66)
  let t33 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides_div_mult()), @prime.exp_index_divides()]))
  let t32 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t31 = @tactics.conv_tac(@equal.sym_conv)
  let t30 = @tactics.match_mp_tac(@pocklington.eq_imp_cong())
  let t29 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@pocklington.cong_trans()))
  let t27 = @drule.match_mp(@pocklington.cong_exp_1())
  let t24 = @term_syntax.parse_term("EXP(2, index(2, (q : Num) - 1))")
  let t68 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s22 = @tactics.mp_tac(x21)
        fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s22(x23)
        }
      })(((x25 : @kernel.Thm) => @bool.spec(t24, x25))(x26))
    })(t27(x28))
  }), t29), t30), t31), t32), @tactics.ap_term_tac), t33), t67])
  let t20 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t19 = @simp.asm_rewrite_tac(@list.List([miller_rabin_pseudoprime()]))
  let t18 = @simp.asm_rewrite_tac(@list.List([@arith.sub_0(), @arith.exp(), @pocklington.cong_refl()]))
  let t17 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 0"))
  let t16 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s11 = @tactics.mp_tac(x10)
    fn(x12 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s11(x12)
    }
  }, fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s14 = @tactics.assume_tac(x13)
    fn(x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s14(x15)
    }
  }))
  let t69 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t16), t17), t18), t19), t20), @tactics.strip_tac), t68)
  miller_rabin_imp_fermat_pseudoprime_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ q : Num, miller_rabin_pseudoprime(a, q) && !(q == 2) → op_eq_eq(EXP(a, q - 1), 1, mod(q))"), t69))
}

///|
let miller_rabin_imp_fermat_pseudoprime_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_IMP_FERMAT_PSEUDOPRIME_EXPLICIT")

///|
/// `MILLER_RABIN_IMP_FERMAT_PSEUDOPRIME_EXPLICIT`
pub fn miller_rabin_imp_fermat_pseudoprime_explicit() -> @kernel.Thm {
  miller_rabin_imp_fermat_pseudoprime_explicit_c.get()
}

///|
/// MILLER_RABIN_EQ_FERMAT_PSEUDOPRIME_EXPLICIT
fn step_7() -> Unit raise {
  let t127 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n - 1) == n"))]))
  let t126 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]))
  let t125 = @simp.rewrite_tac(@list.List([@arith.exp_exp(), @int.arith_rule(@term_syntax.parse_term("(e : Num) * (k : Num) * 2 == 2 * e * k"))]))
  let t124 = @simp.asm_simp_tac(@list.List([@equal.gsym(@pocklington.cong_square_1_prime_power())]))
  let t123 = @tactics.disch_then(fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s120 = @tactics.subst_all_tac(x119)
      fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s120(x121)
      }
    })(@equal.sym(x122))
  })
  let t118 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s113 = @tactics.assume_tac(x112)
    fn(x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s113(x114)
    }
  }, fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s116 = @tactics.mp_tac(x115)
    fn(x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s116(x117)
    }
  })))
  let t111 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t110 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t108 = @tactics.x_choose_then(@term_syntax.parse_term("(j : Num)"))(fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s106 = @tactics.mp_tac(x105)
    fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s106(x107)
    }
  })
  let t109 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(t108))
  let t104 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && ((q : Bool) || (r : Bool)) → !(p && q) → r")))
  let t100 = @term_syntax.parse_term("(n : Num) - 1")
  let t103 = @tactics.first_x_assum(fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s98 = @tactics.mp_tac(x97)
      fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s98(x99)
      }
    })(((x101 : @kernel.Thm) => @bool.spec(t100, x101))(x102))
  })
  let t96 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - 1"))
  let t95 = @simp.asm_simp_tac(@list.List([@arith.exp(), @arith.mult_clauses()]))
  let t94 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t93 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t91 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t90 = @meson.asm_meson_tac(@list.List([]))
  let t89 = @simp.asm_simp_tac(@list.List([@arith.div_mult(), @arith.exp_eq_0(), @calc_num.arith_eq()]))
  let t88 = @tactics.undisch_tac(@term_syntax.parse_term("DIV((q : Num) - 1, EXP(2, (e : Num))) == (k : Num)"))
  let t87 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s83 = @tactics.assume_tac(x82)
        fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s83(x84)
        }
      })(@equal.sym(x85))
    })(@bool.conjunct1(x86))
  }))
  let t81 = @simp.asm_rewrite_tac(@list.List([]))
  let t79 = @term_syntax.parse_term("2")
  let t80 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(q : Num) - 1"), t79]), @prime.index_decomposition()))
  let t78 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t92 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(e : Num)")), t78), t80), t81), t87), t88), t89), t90), t91])
  let t77 = @simp.rewrite_tac(@list.List([]))
  let t76 = @tactics.mp_tac(@bool.eq_imp_rule(@bool.spec(@term_syntax.parse_term("(i : Num) => i <= (e : Num) && op_eq_eq(EXP((a : Num), EXP(2, i) * (k : Num)), 1, mod((q : Num)))"), @arith.num_wop())).0)
  let t75 = @list.List([@meson.asm_meson_tac(@list.List([@arith.odd_exp()])), @tactics.all_tac])
  let t72 = @tactics.repeat_tac(@pair.let_tac)
  let t73 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([miller_rabin_pseudoprime()])), t72), @tactics.disch_tac)
  let t70 = @term_syntax.parse_term("ODD(2)")
  let t71 = @meson.asm_meson_tac(@list.List([@arith.odd_exp(), @simp.rewrite_conv(@list.List([@calc_num.arith()]))(t70)]))
  let t74 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(miller_rabin_imp_fermat_pseudoprime_explicit())), t71), t73])
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), @tactics.eq_tac), t74), @tactics.disj2_tac), @tactics.conj_tac), t75), t76), t77), @tactics.ants_tac), t92), t93), t94), t95), @tactics.strip_tac), @tactics.disj2_tac), t96), @tactics.conj_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t103), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t104), @tactics.conj_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t109), t110), t111), t118), t123), t124), t125), t126), t127)
  miller_rabin_eq_fermat_pseudoprime_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ q : Num, (∃ p : Num, ∃ k : Num, prime(p) && ODD(p) && EXP(p, k) == q) → miller_rabin_pseudoprime(a, q) == op_eq_eq(EXP(a, q - 1), 1, mod(q))"), t128))
}

///|
let miller_rabin_eq_fermat_pseudoprime_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_EQ_FERMAT_PSEUDOPRIME_EXPLICIT")

///|
/// `MILLER_RABIN_EQ_FERMAT_PSEUDOPRIME_EXPLICIT`
pub fn miller_rabin_eq_fermat_pseudoprime_explicit() -> @kernel.Thm {
  miller_rabin_eq_fermat_pseudoprime_explicit_c.get()
}

///|
/// PRIME_IMP_MILLER_RABIN_PSEUDOPRIME
fn step_8() -> Unit raise {
  let t147 = @meson.asm_meson_tac(@list.List([@prime.prime_odd(), @arith.exp_1()]))
  let t145 = @term_syntax.parse_term("1")
  let t146 = @tactics.map_every(fn(x142 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s143 = @tactics.exists_tac(x142)
    fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s143(x144)
    }
  }, @list.List([@term_syntax.parse_term("(p : Num)"), t145]))
  let t141 = @tactics.disch_then(@tactics.match_mp_tac)
  let t140 = @simp.asm_simp_tac(@list.List([@pocklington.fermat_little_prime()]))
  let t135 = @drule.part_match(fn(x134 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x134))
  }, miller_rabin_eq_fermat_pseudoprime_explicit())
  let t130 = @list.List([@simp.asm_rewrite_tac(@list.List([miller_rabin_pseudoprime()])), @tactics.strip_tac])
  let t129 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t129), t130), fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x136 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s132 = @tactics.mp_tac(x131)
          fn(x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s132(x133)
          }
        })(t135(x136))
      })((fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x137.1
      })(x138))
    })(x139)(x139)
  }), t140), t141), t146), t147)
  prime_imp_miller_rabin_pseudoprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && coprime((a, p)) → miller_rabin_pseudoprime(a, p)"), t148))
}

///|
let prime_imp_miller_rabin_pseudoprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_IMP_MILLER_RABIN_PSEUDOPRIME")

///|
/// `PRIME_IMP_MILLER_RABIN_PSEUDOPRIME`
pub fn prime_imp_miller_rabin_pseudoprime() -> @kernel.Thm {
  prime_imp_miller_rabin_pseudoprime_c.get()
}

///|
/// PRIME_IMP_MILLER_RABIN_PSEUDOPRIME_ALT
fn step_9() -> Unit raise {
  let t149 = @meson.asm_meson_tac(@list.List([@prime.prime_coprime_eq(), @prime.coprime_sym(), prime_imp_miller_rabin_pseudoprime()]))
  prime_imp_miller_rabin_pseudoprime_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && !divides(p, a) → miller_rabin_pseudoprime(a, p)"), t149))
}

///|
let prime_imp_miller_rabin_pseudoprime_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_IMP_MILLER_RABIN_PSEUDOPRIME_ALT")

///|
/// `PRIME_IMP_MILLER_RABIN_PSEUDOPRIME_ALT`
pub fn prime_imp_miller_rabin_pseudoprime_alt() -> @kernel.Thm {
  prime_imp_miller_rabin_pseudoprime_alt_c.get()
}

///|
/// MILLER_RABIN_COMPOSITE_IMP_COMPOSITE
fn step_10() -> Unit raise {
  let t150 = @meson.meson_tac(@list.List([prime_imp_miller_rabin_pseudoprime()]))
  let t151 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(not_miller_rabin_pseudoprime())])), t150)
  miller_rabin_composite_imp_composite_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, coprime((a, p)) && miller_rabin_composite(a, p) → !prime(p)"), t151))
}

///|
let miller_rabin_composite_imp_composite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_COMPOSITE_IMP_COMPOSITE")

///|
/// `MILLER_RABIN_COMPOSITE_IMP_COMPOSITE`
pub fn miller_rabin_composite_imp_composite() -> @kernel.Thm {
  miller_rabin_composite_imp_composite_c.get()
}

///|
/// MILLER_RABIN_COMPOSITE_IMP_COMPOSITE_ALT
fn step_11() -> Unit raise {
  let t152 = @meson.asm_meson_tac(@list.List([@prime.prime_coprime_eq(), @prime.coprime_sym(), miller_rabin_composite_imp_composite()]))
  miller_rabin_composite_imp_composite_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, !divides(p, a) && miller_rabin_composite(a, p) → !prime(p)"), t152))
}

///|
let miller_rabin_composite_imp_composite_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_COMPOSITE_IMP_COMPOSITE_ALT")

///|
/// `MILLER_RABIN_COMPOSITE_IMP_COMPOSITE_ALT`
pub fn miller_rabin_composite_imp_composite_alt() -> @kernel.Thm {
  miller_rabin_composite_imp_composite_alt_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_IMP_COPRIME
fn step_12() -> Unit raise {
  let t175 = @simp.asm_rewrite_tac(@list.List([]))
  let t174 = @simp.asm_rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("coprime(((a : Num), 1))"))]))
  let t173 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t172 = @simp.rewrite_tac(@list.List([@prime.coprime_lexp()]))
  let t169 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("op_eq_eq((a : Num), 1, mod((n : Num))) → coprime((a, n))")))
  let t171 = @tactics.disch_then(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s167 = @tactics.mp_tac(x166)
      fn(x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s167(x168)
      }
    })(t169(x170))
  })
  let t165 = @simp.asm_rewrite_tac(@list.List([]))
  let t162 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(miller_rabin_imp_fermat_pseudoprime_explicit()))
  let t164 = @tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s160 = @tactics.mp_tac(x159)
      fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s160(x161)
      }
    })(t162(x163))
  })
  let t158 = @list.List([@simp.asm_rewrite_tac(@list.List([miller_rabin_pseudoprime(), @calc_num.arith()])), @tactics.all_tac])
  let t157 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t156 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t155 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t154 = @simp.asm_rewrite_tac(@list.List([]))
  let t153 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t176 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t153), t154), t155), t156), t157), t158), t164), t165), t171), t172), t173), t174), @tactics.strip_tac), t175), @int.asm_arith_tac)
  miller_rabin_pseudoprime_imp_coprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, miller_rabin_pseudoprime(a, p) → p == 2 || coprime((a, p))"), t176))
}

///|
let miller_rabin_pseudoprime_imp_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_IMP_COPRIME")

///|
/// `MILLER_RABIN_PSEUDOPRIME_IMP_COPRIME`
pub fn miller_rabin_pseudoprime_imp_coprime() -> @kernel.Thm {
  miller_rabin_pseudoprime_imp_coprime_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_CONG
fn step_13() -> Unit raise {
  let t205 = @simp.asm_simp_tac(@list.List([@pocklington.cong_exp()]))
  let t204 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@pocklington.cong_trans()))
  let t202 = @simp.rewrite_tac(@list.List([]))
  let t201 = @tactics.match_mp_tac(@theorems.mono_and())
  let t200 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t203 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t200), t201), t202)])
  let t199 = @tactics.match_mp_tac(@theorems.mono_or())
  let t198 = @simp.asm_rewrite_tac(@list.List([]))
  let t197 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((p : Num))"))
  let t196 = @simp.rewrite_tac(@list.List([]))
  let t195 = @tactics.match_mp_tac(@theorems.mono_or())
  let t194 = @tactics.repeat_tac(@pair.let_tac)
  let t193 = @simp.rewrite_tac(@list.List([miller_rabin_pseudoprime()]))
  let t190 = @term_syntax.parse_term("(p : Num)")
  let t191 = @term_syntax.parse_term("(b : Num)")
  let t192 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Num)"), t191, t190]))
  let t189 = @simp.rewrite_tac(@list.List([]))
  let t188 = @simp.gen_rewrite_tac(fn(x185 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s186 = @equal.rand_conv(x185)
    fn(x187 : @kernel.Term) -> @kernel.Thm raise {
      s186(x187)
    }
  }, @list.List([@theorems.swap_forall_thm()]))
  let t184 = @simp.gen_rewrite_tac(fn(x183 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x177 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s178 = @equal.land_conv(x177)
      fn(x179 : @kernel.Term) -> @kernel.Thm raise {
        s178(x179)
      }
    })((fn(x180 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s181 = @equal.once_depth_conv(x180)
      fn(x182 : @kernel.Term) -> @kernel.Thm raise {
        s181(x182)
      }
    })(x183))
  }, @list.List([@pocklington.cong_sym()]))
  let t206 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.forall_and_thm(), @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) == (r : Bool)) == ((p → q → r) && (p → r → q))"))])), t184), t188), t189), t192), @tactics.disch_tac), t193), t194), t195), @tactics.conj_tac), t196), t197), t198), t199), @tactics.conj_tac), t203), t204), t205)
  miller_rabin_pseudoprime_cong_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ p : Num, op_eq_eq(a, b, mod(p)) → miller_rabin_pseudoprime(a, p) == miller_rabin_pseudoprime(b, p)"), t206))
}

///|
let miller_rabin_pseudoprime_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_CONG")

///|
/// `MILLER_RABIN_PSEUDOPRIME_CONG`
pub fn miller_rabin_pseudoprime_cong() -> @kernel.Thm {
  miller_rabin_pseudoprime_cong_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_1
fn step_14() -> Unit raise {
  let t208 = @simp.simp_tac(@list.List([]))
  let t207 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t209 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([miller_rabin_pseudoprime(), @arith.exp_one(), @pocklington.cong_refl()])), t207), t208)
  miller_rabin_pseudoprime_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ODD(p) → miller_rabin_pseudoprime(1, p)"), t209))
}

///|
let miller_rabin_pseudoprime_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_1")

///|
/// `MILLER_RABIN_PSEUDOPRIME_1`
pub fn miller_rabin_pseudoprime_1() -> @kernel.Thm {
  miller_rabin_pseudoprime_1_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_MOD_1
fn step_15() -> Unit raise {
  let t211 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t210 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t212 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([miller_rabin_pseudoprime(), @pocklington.cong_mod_1()])), t210), t211)
  miller_rabin_pseudoprime_mod_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, miller_rabin_pseudoprime(a, 1)"), t212))
}

///|
let miller_rabin_pseudoprime_mod_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_MOD_1")

///|
/// `MILLER_RABIN_PSEUDOPRIME_MOD_1`
pub fn miller_rabin_pseudoprime_mod_1() -> @kernel.Thm {
  miller_rabin_pseudoprime_mod_1_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_INVERSE_MOD
fn step_16() -> Unit raise {
  let t237 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym()]))
  let t236 = @simp.rewrite_tac(@list.List([@pocklington.inverse_mod_rmul_eq()]))
  let t235 = @tactics.match_mp_tac(@pocklington.cong_exp())
  let t234 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("EXP(2, (i : Num)) * (k : Num)"), @arith.exp_one())))
  let t233 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp())]))
  let t232 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_minus1_squared()]))
  let t231 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), 2), 1, mod((p : Num))) && op_eq_eq((x : Num) * (y : Num), 1, mod(p)) → op_eq_eq(x, a, mod(p)) → op_eq_eq(y, a, mod(p))")))
  let t230 = @simp.rewrite_tac(@list.List([]))
  let t229 = @tactics.match_mp_tac(@theorems.mono_and())
  let t228 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t238 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t228), t229), t230), t231), t232), t233), t234), t235), t236), t237)
  let t227 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym()]))
  let t226 = @simp.rewrite_tac(@list.List([@pocklington.inverse_mod_rmul_eq()]))
  let t225 = @tactics.match_mp_tac(@pocklington.cong_exp_1())
  let t224 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp())]))
  let t239 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("op_eq_eq((x : Num) * (y : Num), 1, mod((p : Num))) → op_eq_eq(x, 1, mod(p)) → op_eq_eq(y, 1, mod(p))"))), t224), t225), t226), t227), t238])
  let t223 = @tactics.match_mp_tac(@theorems.mono_or())
  let t222 = @simp.asm_rewrite_tac(@list.List([]))
  let t221 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((p : Num))"))
  let t220 = @tactics.repeat_tac(@pair.let_tac)
  let t219 = @simp.asm_rewrite_tac(@list.List([miller_rabin_pseudoprime()]))
  let t218 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([miller_rabin_pseudoprime_imp_coprime()]))])
  let t217 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((a : Num), (p : Num)))"))
  let t216 = @list.List([@simp.asm_rewrite_tac(@list.List([@pocklington.inverse_mod(), miller_rabin_pseudoprime(), @calc_num.arith()])), @tactics.all_tac])
  let t215 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t214 = @list.List([@simp.asm_rewrite_tac(@list.List([@pocklington.inverse_mod(), miller_rabin_pseudoprime(), @calc_num.arith()])), @tactics.all_tac])
  let t213 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t240 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t213), t214), t215), t216), t217), t218), t219), t220), t221), t222), t223), @tactics.conj_tac), t239)
  miller_rabin_pseudoprime_inverse_mod_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, miller_rabin_pseudoprime(a, p) → miller_rabin_pseudoprime(inverse_mod(p, a), p)"), t240))
}

///|
let miller_rabin_pseudoprime_inverse_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_INVERSE_MOD")

///|
/// `MILLER_RABIN_PSEUDOPRIME_INVERSE_MOD`
pub fn miller_rabin_pseudoprime_inverse_mod() -> @kernel.Thm {
  miller_rabin_pseudoprime_inverse_mod_c.get()
}

///|
/// BOUND_POWER_RESIDUES_MODULO_ODD_COPRIME
fn step_17() -> Unit raise {
  let t266 = @tactics.conv_tac(@int.number_rule)
  let t264 = @term_syntax.parse_term("coprime(((k : Num), (n : Num)))")
  let t265 = @tactics.map_every(fn(x261 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s262 = @tactics.undisch_tac(x261)
    fn(x263 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s262(x263)
    }
  }, @list.List([@term_syntax.parse_term("divides((p : Num), (n : Num))"), t264]))
  let t260 = @simp.rewrite_tac(@list.List([@prime.coprime_rexp()]))
  let t259 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("coprime(((k : Num), (a : Num))) → gcd((k, a * (b : Num))) == gcd((k, b))")))
  let t258 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t257 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t256 = @tactics.match_mp_tac(@products.nproduct_eq())
  let t255 = @tactics.match_mp_tac(@arith.eq_imp_le())
  let t254 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t253 = @tactics.disch_then(fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x251
    @simp.rewrite_tac(@list.List([th]))
  })
  let t250 = @simp.asm_simp_tac(@list.List([@sets.has_size()]))
  let t249 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.nproduct())]))
  let t246 = @term_syntax.parse_term("(k : Num)")
  let t247 = @term_syntax.parse_term("(a : Num)")
  let t248 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num)"), t247, t246]), @primitive.count_roots_modulo_odd_gen()))
  let t244 = @simp.rewrite_tac(@list.List([@pocklington.cong_mod_1(), @sets.card_numseg_lt(), @arith.le_refl()]))
  let t243 = @simp.asm_rewrite_tac(@list.List([@sets.empty_gspec(), @iterate.nproduct_clauses()]))
  let t242 = @simp.asm_rewrite_tac(@list.List([@meson.meson(@list.List([@prime.prime_1(), @int.divides_one()]), @term_syntax.parse_term("!(prime((p : Num)) && divides(p, 1))"))]))
  let t245 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@prime.coprime_0()])), @tactics.strip_tac), t242), t243), t244), @tactics.strip_tac])
  let t241 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t267 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t241), t245), t248), t249), t250), t253), @class.cond_cases_tac), t254), t255), t256), t257), t258), @tactics.strip_tac), t259), t260), @tactics.disj1_tac), t265), t266)
  bound_power_residues_modulo_odd_coprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, ODD(n) && coprime((k, n)) && coprime((n, a)) → CARD({(x : Num) | x < n && op_eq_eq(EXP(x, k), a, mod(n))}) <= nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => gcd((k, p - 1)))"), t267))
}

///|
let bound_power_residues_modulo_odd_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_POWER_RESIDUES_MODULO_ODD_COPRIME")

///|
/// `BOUND_POWER_RESIDUES_MODULO_ODD_COPRIME`
pub fn bound_power_residues_modulo_odd_coprime() -> @kernel.Thm {
  bound_power_residues_modulo_odd_coprime_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_BOUND_GEN
fn step_18() -> Unit raise {
  let t506 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0(), @prime.gcd_zero(), @arith.exp_eq_0(), @calc_num.arith_eq()]))
  let t505 = @simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("divides(gcd(((a : Num) * (b : Num), (c : Num))), a * gcd((b, c)))"))]))
  let t504 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t503 = @simp.asm_rewrite_tac(@list.List([]))
  let t502 = @tactics.match_mp_tac(@arith.le_mult2())
  let t500 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t501 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t500]))
  let t499 = @simp.simp_tac(@list.List([@iterate.nproduct_clauses(), @arith.le_refl()]))
  let t498 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t495 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t496 = @tactics.spec_tac(@term_syntax.parse_term("{(p : Num) | prime(p) && divides(p, (n : Num))}"), t495)
  let t497 = @list.List([@simp.asm_simp_tac(@list.List([@prime.finite_special_divisors()])), t496])
  let t494 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(p : Num) | prime(p) && divides(p, (n : Num))})"), fn(x491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s492 = @tactics.mp_tac(x491)
    fn(x493 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s492(x493)
    }
  })
  let t490 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@arith.le_trans()))
  let t487 = @tactics.conv_tac(@int.number_rule)
  let t488 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t487])
  let t484 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(st : Num) == (n : Num) - 1 → !(n == 0) → n == st + 1")))
  let t486 = @tactics.first_assum(fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s482 = @tactics.mp_tac(x481)
      fn(x483 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s482(x483)
      }
    })(t484(x485))
  })
  let t489 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@prime.coprime_lmul(), @prime.coprime_lexp(), @prime.coprime_2()])), t486), @tactics.ants_tac), t488), @tactics.all_tac])
  let t480 = @simp.asm_rewrite_tac(@list.List([]))
  let t474 = @drule.part_match(fn(x473 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x473))
  }, bound_power_residues_modulo_odd_coprime())
  let t469 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t467 = @meson.asm_meson_tac(@list.List([@prime.coprime_minus1(), @prime.coprime_1(), @prime.coprime_sym()]))
  let t468 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.disch_then(fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x465
    @tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(th))
  }), t467)])
  let t464 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Num, coprime(((n : Num), z)) → CARD({(a : Num) | a < n && op_eq_eq(EXP(a, EXP(2, (v : Num)) * (t : Num)), z, mod(n))}) <= nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => EXP(2, v) * gcd((t, p - 1)))"), fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s462 = @tactics.mp_tac(x461)
    fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s462(x463)
    }
  })
  let t507 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (b : Num) && (y : Num) <= b → x + y <= 2 * b"))), t464), t468), t469), @tactics.disch_tac), fn(x479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x478 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x476 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x475 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s471 = @tactics.mp_tac(x470)
            fn(x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s471(x472)
            }
          })(t474(x475))
        })(@equal.lhand(x476))
      })((fn(x477 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x477.1
      })(x478))
    })(x479)(x479)
  }), t480), @tactics.ants_tac), t489), t490), t494), t497), t498), t499), t501), @tactics.strip_tac), t502), t503), t504), t505), t506)
  let t458 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_minus1_squared()]))
  let t455 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("op_eq_eq((x : Num), (a : Num), mod((n : Num))) → op_eq_eq(EXP(a, 2), 1, mod(n)) → op_eq_eq(EXP(x, 2), 1, mod(n))")))
  let t457 = @tactics.first_x_assum(fn(x456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t455(x456))
  })
  let t454 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t453 = @tactics.match_mp_tac(@pocklington.cong_exp_1())
  let t452 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t451 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.exp(), @int.arith_rule(@term_syntax.parse_term("2 * (i : Num) * (d : Num) * (t : Num) == i * t * 2 * d"))]))
  let t450 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) + SUC((n : Num)) == SUC(i) + n"))]))
  let t449 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s447 = @tactics.subst1_tac(x446)
    fn(x448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s447(x448)
    }
  }))
  let t445 = @simp.rewrite_tac(@list.List([@arith.lt_exists()]))
  let t444 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t443 = @tactics.match_mp_tac(@theorems.mono_or())
  let t459 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x440 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s441 = @equal.land_conv(x440)
    fn(x442 : @kernel.Term) -> @kernel.Thm raise {
      s441(x442)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) <= (v : Num)) == (i < v || i == v)"))])), t443), @tactics.conj_tac), t444), t445), t449), t450), t451), t452), t453), t454), t457), t458)
  let t439 = @simp.asm_simp_tac(@list.List([@prime.index_zero(), @prime.divides_2(), @equal.gsym(@arith.not_odd()), @arith.add_clauses(), @prime.index_exp(), @prime.index_refl(), @prime.prime_2(), @calc_num.arith_le()]))
  let t436 = @simp.gen_rewrite_rule(fn(x433 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s434 = @equal.rand_conv(x433)
    fn(x435 : @kernel.Term) -> @kernel.Thm raise {
      s434(x435)
    }
  }, @list.List([@prime.primepow_divides_index()]))
  let t438 = @tactics.first_x_assum(fn(x437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s431 = @tactics.mp_tac(x430)
      fn(x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s431(x432)
      }
    })(t436(x437))
  })
  let t429 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(!((i : Num) <= (n : Num)) && i <= n + 1) == (i == n + 1)"))]))
  let t428 = @list.List([@simp.simp_tac(@list.List([@arith.add_clauses()])), @tactics.all_tac])
  let t425 = @drule.match_mp(@meson.meson(@list.List([@prime.prime_2()]), @term_syntax.parse_term("(∀ p : Num, prime(p) → (P : (Num) -> Bool)(p)) && !(∀ p : Num, prime(p) → (Q : (Num) -> Bool)(p)) && (∀ p : Num, prime(p) → (R : (Num) -> Bool)(p)) → (∀ p : Num, !(p == 2) → Q(p) == R(p)) → P(2) && !Q(2) && R(2)")))
  let t427 = @tactics.disch_then(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x422 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s423 = @tactics.mp_tac(x422)
      fn(x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s423(x424)
      }
    })(t425(x426))
  })
  let t421 = @simp.simp_tac(@list.List([@prime.index_prime(), @prime.prime_2()]))
  let t420 = @simp.asm_simp_tac(@list.List([@prime.divides_index(), @arith.mult_eq_0(), @arith.exp_eq_0(), @calc_num.arith_eq(), @pocklington.order_eq_0(), @prime.index_mul(), @int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 0) == (p == 0 || p == 1)"))]))
  let t419 = @simp.gen_rewrite_tac(fn(x418 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x412 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s413 = @equal.land_conv(x412)
      fn(x414 : @kernel.Term) -> @kernel.Thm raise {
        s413(x414)
      }
    })((fn(x415 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s416 = @equal.once_depth_conv(x415)
      fn(x417 : @kernel.Term) -> @kernel.Thm raise {
        s416(x417)
      }
    })(x418))
  }, @list.List([@pocklington.order_divides()]))
  let t411 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp(), @arith.exp_exp(), @equal.gsym(@theorems.conj_assoc())]))
  let t409 = @term_syntax.parse_term("(p : Num)")
  let t410 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t409]), @pocklington.fermat_little_prime()))
  let t408 = @simp.asm_rewrite_tac(@list.List([]))
  let t407 = @tactics.mp_tac(@int.number_rule(@term_syntax.parse_term("divides((p : Num), (n : Num)) && coprime(((a : Num), n)) → coprime((a, p)) && coprime((p, a))")))
  let t405 = @meson.asm_meson_tac(@list.List([@prime.divides_2(), @arith.not_even()]))
  let t404 = @simp.asm_simp_tac(@list.List([@prime.divides_prime_prime(), @prime.prime_2()]))
  let t403 = @simp.asm_simp_tac(@list.List([@int.number_rule(@term_syntax.parse_term("divides((p : Num), (n : Num)) → op_eq_eq(n, (m : Num), mod(p)) == divides(p, m)"))]))
  let t402 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.le_1()]))
  let t406 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("op_eq_eq((a : Num), 1, mod((p : Num))) == op_eq_eq(a + 1, 2, mod(p))"))])), t402), t403), t404), t405), @tactics.all_tac])
  let t401 = @simp.gen_rewrite_tac(fn(x398 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s399 = @equal.land_conv(x398)
    fn(x400 : @kernel.Term) -> @kernel.Thm raise {
      s399(x400)
    }
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))
  let t397 = @simp.asm_rewrite_tac(@list.List([]))
  let t394 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("∀ p : Num, op_eq_eq((a : Num), (b : Num), mod((n : Num))) → divides(p, n) && op_eq_eq(a, 1, mod(p)) → op_eq_eq(b, 1, mod(p))")))
  let t391 = @term_syntax.parse_term("(p : Num)")
  let t396 = @tactics.first_assum(fn(x395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s389 = @tactics.mp_tac(x388)
        fn(x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s389(x390)
        }
      })(((x392 : @kernel.Thm) => @bool.spec(t391, x392))(x393))
    })(t394(x395))
  })
  let t387 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_minus1_squared()]))
  let t384 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("∀ p : Num, op_eq_eq((a : Num), (b : Num), mod((n : Num))) → divides(p, n) && op_eq_eq(EXP(b, 2), 1, mod(n)) → op_eq_eq(EXP(a, 2), 1, mod(p))")))
  let t381 = @term_syntax.parse_term("(p : Num)")
  let t386 = @tactics.first_assum(fn(x385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x378 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s379 = @tactics.mp_tac(x378)
        fn(x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s379(x380)
        }
      })(((x382 : @kernel.Thm) => @bool.spec(t381, x382))(x383))
    })(t384(x385))
  })
  let t377 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_1()])), @tactics.all_tac])
  let t376 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t375 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t460 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")), t375), t376), t377), t386), t387), t396), t397), t401), @tactics.ants_tac), t406), t407), t408), @tactics.strip_tac), t410), t411), t419), t420), t421), t427), @tactics.ants_tac), t428), t429), t438), t439), @int.asm_arith_tac), t459])
  let t374 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) <= (v : Num)"), fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s372 = @tactics.mp_tac(x371)
    fn(x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s372(x373)
    }
  })
  let t369 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(@tactics.strip_assume_tac))
  let t368 = @simp.asm_simp_tac(@list.List([@pocklington.cong_exp_1()]))
  let t367 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t370 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))), t367), t368), t369])
  let t366 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s361 = @tactics.assume_tac(x360)
    fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s361(x362)
    }
  }, fn(x363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s364 = @tactics.mp_tac(x363)
    fn(x365 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s364(x365)
    }
  }))
  let t358 = @simp.simp_tac(@list.List([@arith.div_mult(), @arith.exp_eq_0(), @calc_num.arith_eq()]))
  let t359 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("EXP(2, (s : Num)) * (t : Num) == (n : Num) - 1")))])), t358), @tactics.all_tac])
  let t357 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((n : Num) - 1, EXP(2, (s : Num))) == (t : Num)"), fn(x354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s355 = @tactics.subst_all_tac(x354)
    fn(x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s355(x356)
    }
  })
  let t353 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t352 = @tactics.disch_then(fn(x349 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s350 = @tactics.subst1_tac(x349)
    fn(x351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s350(x351)
    }
  })
  let t348 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq(), @prime.divides_2(), @arith.not_even()]))
  let t345 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@prime.index_unique()))
  let t347 = @tactics.first_assum(fn(x346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s343 = @tactics.mp_tac(x342)
      fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s343(x344)
      }
    })(t345(x346))
  })
  let t339 = @simp.gen_rewrite_rule(fn(x338 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x338
  }, @list.List([miller_rabin_pseudoprime()]))
  let t341 = @tactics.first_x_assum(fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s336 = @tactics.mp_tac(x335)
      fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s336(x337)
      }
    })(t339(x340))
  })
  let t334 = @simp.asm_rewrite_tac(@list.List([]))
  let t331 = @drule.match_mp(miller_rabin_pseudoprime_imp_coprime())
  let t333 = @tactics.first_assum(fn(x332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s329 = @tactics.mp_tac(x328)
      fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s329(x330)
      }
    })(t331(x332))
  })
  let t327 = @tactics.disch_then(fn(x326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s324 = @tactics.assume_tac(x323)
      fn(x325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s324(x325)
      }
    })(@bool.conjunct2(x326))
  })
  let t322 = @simp.simp_tac(@list.List([]))
  let t321 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t320 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_union()]))
  let t319 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_numseg_lt(), @sets.finite_union()]))
  let t318 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"))]))
  let t317 = @tactics.match_mp_tac(@sets.card_subset())
  let t315 = @tactics.disch_then(fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s312 = @tactics.subst1_tac(x311)
      fn(x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s312(x313)
      }
    })(@equal.sym(x314))
  })
  let t310 = @meson.asm_meson_tac(@list.List([@prime.divides_2(), @arith.not_odd()]))
  let t309 = @simp.asm_simp_tac(@list.List([@prime.divides_prime_prime(), @prime.prime_2()]))
  let t306 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("∀ p : Num, op_eq_eq((a : Num), 1, mod((n : Num))) && divides(n, a + 1) → divides(p, n) → divides(p, 2)")))
  let t303 = @term_syntax.parse_term("(p : Num)")
  let t308 = @tactics.disch_then(fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s301 = @tactics.mp_tac(x300)
        fn(x302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s301(x302)
        }
      })(((x304 : @kernel.Thm) => @bool.spec(t303, x304))(x305))
    })(t306(x307))
  })
  let t299 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_minus1()]))
  let t298 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t297 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, !((Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x))) → INTER({(x : _) | (P : (_) -> Bool)(x) && Q(x)}, {(x : _) | P(x) && R(x)}) == {}")))
  let t296 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]))
  let t316 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"))])), t296), t297), t298), t299), t308), t309), t310), t315])
  let t290 = @drule.part_match(fn(x289 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x289))
  }, @sets.card_union())
  let t508 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac)), fn(x295 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x292 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x291 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s287 = @tactics.mp_tac(x286)
            fn(x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s287(x288)
            }
          })(t290(x291))
        })(@kernel.rand(x292))
      })((fn(x293 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x293.1
      })(x294))
    })(x295)(x295)
  }), @tactics.ants_tac), t316), t317), t318), t319), t320), t321), t322), t327), t333), t334), @tactics.disch_tac), t341), t347), t348), t352), t353), t357), t359), t366), t370), t374), t460), t507])
  let t284 = @term_syntax.parse_term("CARD({(a : Num) | a < (n : Num) && op_eq_eq(EXP(a, EXP(2, (v : Num)) * (t : Num)), 1, mod(n))}) + CARD({(a : Num) | a < n && op_eq_eq(EXP(a, EXP(2, v) * t), n - 1, mod(n))})")
  let t285 = @tactics.trans_tac(@arith.le_trans())(t284)
  let t283 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s281 = @tactics.assume_tac(x280)
    fn(x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s281(x282)
    }
  }))
  let t279 = @simp.asm_rewrite_tac(@list.List([@arith.odd()]))
  let t278 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Num) == 0"))
  let t277 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t276 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t275 = @simp.asm_rewrite_tac(@list.List([@arith.odd()]))
  let t274 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t271 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t272 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ODD((n : Num))")), t271)
  let t270 = @simp.rewrite_tac(@list.List([@sets.empty_gspec(), @sets.card_clauses(), @arith.le_0()]))
  let t269 = @simp.asm_rewrite_tac(@list.List([@prime.prime_2(), miller_rabin_pseudoprime(), @equal.gsym(@arith.not_even())]))
  let t273 = @list.List([@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2")), t269), t270), t272])
  let t268 = @tactics.disj_cases_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @arith.even_or_odd()))
  let t509 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t268), t273), t274), t275), t276), t277), t278), t279), t283), t285), @tactics.conj_tac), t508)
  miller_rabin_pseudoprime_bound_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Num, ∀ t : Num, ∀ v : Num, !prime(n) && EXP(2, s) * t == n - 1 && ODD(t) && (∃ p : Num, prime(p) && divides(p, n) && !divides(EXP(2, v + 2), p - 1)) → CARD({(a : Num) | a < n && miller_rabin_pseudoprime(a, n)}) <= 2 * nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => EXP(2, v) * gcd((t, p - 1)))"), t509))
}

///|
let miller_rabin_pseudoprime_bound_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_BOUND_GEN")

///|
/// `MILLER_RABIN_PSEUDOPRIME_BOUND_GEN`
pub fn miller_rabin_pseudoprime_bound_gen() -> @kernel.Thm {
  miller_rabin_pseudoprime_bound_gen_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_BOUND_PHI
fn step_19() -> Unit raise {
  let t827 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_rexp(), @prime.coprime_2()]))
  let t826 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("divides((a : Num), (t : Num)) && divides((b : Num), t) && coprime((a, (v : Num))) && coprime((b, v)) → (s : Num) * t + 1 == (v * a + 1) * (v * b + 1) → v * a == v * b")))
  let t825 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel()]))
  let t824 = @tactics.replicate_tac(2, @tactics.disch_then(fn(x823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x820 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s821 = @tactics.subst1_tac(x820)
      fn(x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s821(x822)
      }
    })(@equal.sym(x823))
  }))
  let t819 = @simp.expand_tac("n")
  let t818 = @simp.asm_rewrite_tac(@list.List([]))
  let t815 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(n : Num) - 1 == (m : Num) → !(n == 0) → m + 1 == n")))
  let t817 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s813 = @tactics.mp_tac(x812)
      fn(x814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s813(x814)
      }
    })(t815(x816))
  }))
  let t809 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(m : Num) == (n : Num) - 1 → !(n == 0) → m + 1 == n")))
  let t811 = @tactics.first_x_assum(fn(x810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s807 = @tactics.mp_tac(x806)
      fn(x808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s807(x808)
      }
    })(t809(x810))
  })
  let t805 = @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) == (q : Num))"))
  let t802 = @meson.asm_meson_tac(@list.List([@arith.odd()]))
  let t801 = @simp.rewrite_tac(@list.List([@int.gcd()]))
  let t800 = @tactics.match_mp_tac(@int.properly_divides_le_imp())
  let t799 = @tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([@arith.odd()])), @tactics.all_tac]))
  let t798 = @simp.asm_rewrite_tac(@list.List([@prime.gcd_le()]))
  let t797 = @tactics.match_mp_tac(@arith.le_mult2())
  let t803 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.disch_tac), t797), t798), t799), t800), t801), t802)
  let t804 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@prime.divides_gcd_right())])), @tactics.strip_tac), t803])
  let t796 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((a' : Num) == (a : Num) && (b' : Num) == (b : Num)) && (!(b' == b) → a' * (2 * b') <= a * b) && (!(a' == a) → b' * (2 * a') <= b * a) → 2 * (a' * b') <= a * b")))
  let t795 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t794 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.exp_1(), @int.arith_rule(@term_syntax.parse_term("(8 * ((v : Num) * (g1 : Num) * (v * (g2 : Num))) <= v * 2 * (a : Num) * (v * 2 * (b : Num))) == (v * v * (2 * (g1 * g2)) <= v * v * (a * b))"))]))
  let t793 = @simp.asm_simp_tac(@list.List([@prime.coprime_rexp(), @prime.coprime_2(), @int.number_rule(@term_syntax.parse_term("coprime(((a : Num), (b : Num))) → gcd((a, b * (c : Num))) == gcd((a, c))"))]))
  let t792 = @tactics.disch_then(fn(x791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x791))
  })
  let t790 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Num)"))
  let t789 = @tactics.disch_then(fn(x788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x788))
  })
  let t787 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t784 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq(), @theorems.left_imp_exists_thm(), @prime.divides_2(), @arith.not_even()]))
  let t785 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 0) == (p == 0 || p == 1)"))])), t784)
  let t783 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 == n + 2"))]))
  let t786 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@prime.index_unique_alt(), @calc_num.arith_eq(), @int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 0) == (p == 0 || p == 1)"))])), t783), t785])
  let t781 = @tactics.conjuncts_then(fn(x778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s779 = @tactics.subst1_tac(x778)
    fn(x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s779(x780)
    }
  })
  let t782 = @tactics.subgoal_then(@term_syntax.parse_term("index(2, (p : Num) - 1) == (v : Num) + 1 && index(2, (q : Num) - 1) == v + 1"), t781)
  let t776 = @term_syntax.parse_term("2")
  let t777 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num) - 1"), t776]), @prime.index_decomposition()))
  let t774 = @term_syntax.parse_term("2")
  let t775 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : Num) - 1"), t774]), @prime.index_decomposition()))
  let t773 = @simp.rewrite_tac(@list.List([@arith.sub_refl(), @arith.exp(), @arith.mult_clauses()]))
  let t772 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.exp_1()])))
  let t771 = @tactics.repeat_tac(@tactics.disch_then(fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s769 = @tactics.subst_all_tac(x768)
    fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s769(x770)
    }
  }))
  let t767 = @simp.asm_rewrite_tac(@list.List([@prime.index_eq_0()]))
  let t764 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!(2 <= (n : Num)) → n == 0 || n == 1")))
  let t766 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x761 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s762 = @tactics.mp_tac(x761)
      fn(x763 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s762(x763)
      }
    })(t764(x765))
  }))
  let t760 = @tactics.repeat_tac(@tactics.strip_tac)
  let t758 = @simp.gen_rewrite_rule(fn(x757 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x757
  }, @list.List([@class.de_morgan_thm()]))
  let t828 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x754 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s755 = @tactics.mp_tac(x754)
      fn(x756 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s755(x756)
      }
    })(t758(x759))
  })), t760), t766), t767), t771), t772), t773), t775), t777), t782), t786), t787), t789), t790), t792), t793), t794), t795), @tactics.disj2_tac), t796), @tactics.conj_tac), t804), t805), t811), t817), t818), t819), t824), t825), t826), t827)
  let t751 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_2()]))
  let t750 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("coprime(((a : Num), (b : Num))) → coprime((a, gcd((b, (c : Num)))))")))
  let t749 = @simp.asm_simp_tac(@list.List([@prime.coprime_lexp()]))
  let t748 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(v : Num) + 1 + 1 == v + 2")), @prime.divides_lmul()]))
  let t747 = @simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("divides(gcd(((a : Num), (b : Num))), (c : Num) * b)"))]))
  let t746 = @tactics.match_mp_tac(@prime.divides_mul())
  let t745 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @arith.exp_eq_0(), @prime.coprime_lexp(), @int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 0) == (p == 0 || p == 1)"))]))
  let t744 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t743 = @tactics.match_mp_tac(@arith.le_mult2())
  let t742 = @int.arith_rule(@term_syntax.parse_term("(8 * ((e1 : Num) * (g1 : Num) * ((e2 : Num) * (g2 : Num))) <= (p : Num) * (p' : Num) * ((q : Num) * (q' : Num))) == (2 * (2 * e1) * g1 * (2 * e2 * g2) <= p * p' * (q * q'))"))
  let t752 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@arith.exp())), @arith.add1(), t742])), t743), @tactics.conj_tac), t744), t745), t746), t747), t748), t749), @tactics.disj1_tac), t750), t751)
  let t741 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_2()]))
  let t740 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("coprime(((a : Num), (b : Num))) → coprime((a, gcd((b, (c : Num)))))")))
  let t739 = @simp.asm_simp_tac(@list.List([@int.gcd(), @prime.coprime_lexp()]))
  let t738 = @tactics.match_mp_tac(@prime.divides_mul())
  let t737 = @list.List([@tactics.all_tac, @tactics.match_mp_tac(@prime.divides_lmul())])
  let t736 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @arith.exp_eq_0(), @int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 0) == (p == 0 || p == 1)"))]))
  let t735 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t734 = @tactics.match_mp_tac(@arith.le_mult2())
  let t732 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 1 <= n - 1"))]))
  let t731 = @simp.rewrite_tac(@list.List([@arith.le_exp(), @calc_num.arith_eq()]))
  let t730 = @simp.gen_rewrite_tac(fn(x727 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s728 = @equal.land_conv(x727)
    fn(x729 : @kernel.Term) -> @kernel.Thm raise {
      s728(x729)
    }
  }, @list.List([@equal.gsym(@arith.exp_1())]))
  let t726 = @simp.asm_simp_tac(@list.List([@arith.exp_mono_le(), @prime.prime_ge_2()]))
  let t725 = @term_syntax.parse_term("EXP(2, index((p : Num), (n : Num)) - 1)")
  let t733 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.trans_tac(@arith.le_trans())(t725), t726), t730), t731), t732), @tactics.all_tac])
  let t724 = @tactics.match_mp_tac(@arith.le_mult2())
  let t723 = @int.arith_rule(@term_syntax.parse_term("(8 * ((e1 : Num) * (g1 : Num) * ((e2 : Num) * (g2 : Num))) <= (p : Num) * (p' : Num) * ((q : Num) * (q' : Num))) == (2 * (2 * e1 * g1 * (2 * e2 * g2)) <= p * (p' * (q * q')))"))
  let t753 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@arith.exp())), @arith.add1(), t723])), t724), @tactics.conj_tac), t733), t734), @tactics.conj_tac), t735), t736), t737), t738), t739), @tactics.disj1_tac), t740), t741), t752])
  let t829 = @list.List([@tactics.thenl(@tactics.first_x_assum(@tactics.disj_cases_tac), t753), t828])
  let t722 = @tactics.disch_then(fn(x721 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s719 = @tactics.assume_tac(x718)
      fn(x720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s719(x720)
      }
    })(@equal.sym(x721))
  })
  let t717 = @simp.asm_simp_tac(@list.List([@iterate.nproduct_clauses(), @sets.finite_insert(), @sets.finite_empty(), @sets.in_insert(), @sets.not_in_empty(), @arith.mult_clauses()]))
  let t716 = @simp.asm_rewrite_tac(@list.List([@multiplicative.multiplicative_id()]))
  let t714 = @term_syntax.parse_term("(n : Num)")
  let t715 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) => n"), t714]), @multiplicative.multiplicative_expand()))
  let t713 = @simp.gen_rewrite_tac(fn(x710 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s711 = @equal.rand_conv(x710)
    fn(x712 : @kernel.Term) -> @kernel.Thm raise {
      s711(x712)
    }
  }, @list.List([@multiplicative.phi_expand()]))
  let t708 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0(), @prime.prime_1()])), @tactics.all_tac])
  let t707 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) && !((q : Num) == 0) && !(q == 1)"), @tactics.strip_assume_tac)
  let t706 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t709 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("prime((p : Num)) && prime((q : Num)) && divides(p, (n : Num)) && divides(q, n)"), @tactics.strip_assume_tac), t706), t707), t708)
  let t705 = @tactics.repeat_tac(@tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s703 = @tactics.assume_tac(x702)
    fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s703(x704)
    }
  })))
  let t700 = @term_syntax.parse_term("(q : Num)")
  let t701 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t700]))
  let t699 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t698 = @simp.rewrite_tac(@list.List([]))
  let t697 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) => 2 <= index(p, (n : Num)) || divides(EXP(2, (v : Num) + 2), p - 1)"))
  let t696 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("∀ P : (_) -> Bool, (∀ p : _, ∀ q : _, (R : (_, _) -> Bool)(p, q) → R(q, p)) && (∀ p : _, ∀ q : _, P(p) → R(p, q)) && (∀ p : _, ∀ q : _, !P(p) && !P(q) → R(p, q)) → (∀ p : _, ∀ q : _, R(p, q))")))
  let t695 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t830 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.land_conv(@sets.has_size_conv)), t695), t696), t697), t698), @tactics.conj_tac), t699), @tactics.conj_tac), t701), t705), t709), t713), t715), t716), t717), t722), t829)
  let t692 = @simp.asm_rewrite_tac(@list.List([@prime.index_eq_0()]))
  let t691 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num) - 1) == (!(n == 0) && !(n == 1))"))]))
  let t690 = @simp.rewrite_tac(@list.List([@arith.le_exp(), @calc_num.arith_eq()]))
  let t689 = @simp.gen_rewrite_tac(fn(x686 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s687 = @equal.land_conv(x686)
    fn(x688 : @kernel.Term) -> @kernel.Thm raise {
      s687(x688)
    }
  }, @list.List([@equal.gsym(@arith.exp_1())]))
  let t685 = @simp.asm_rewrite_tac(@list.List([@arith.exp_mono_le()]))
  let t683 = @term_syntax.parse_term("EXP(4, index((p : Num), (n : Num)) - 1)")
  let t684 = @tactics.trans_tac(@arith.le_trans())(t683)
  let t682 = @simp.asm_rewrite_tac(@list.List([@prime.prime_exp()]))
  let t679 = @term_syntax.parse_term("prime")
  let t693 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.disch_then(fn(x681 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x676 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s677 = @tactics.mp_tac(x676)
      fn(x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s677(x678)
      }
    })(((x680 : @kernel.Thm) => @equal.ap_term(t679, x680))(x681))
  })), t682), @tactics.disch_tac), t684), t685), t689), t690), t691), t692)
  let t675 = @simp.asm_rewrite_tac(@list.List([@arith.lt_exp(), @arith.le_exp()]))
  let t694 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("9 < (n : Num) && (EXP(3, 2) < (i : Num) → EXP(3, 2) <= (j : Num)) → n == i → 4 <= j"))), t675), @int.arith_tac), t693])
  let t674 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s669 = @tactics.subst_all_tac(x668)
    fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s669(x670)
    }
  }, fn(x671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s672 = @tactics.mp_tac(x671)
    fn(x673 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s672(x673)
    }
  }))
  let t667 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(3 <= (p : Num)) == (p == 3 || 4 <= p)"))]))
  let t666 = @list.List([@meson.asm_meson_tac(@list.List([@prime.odd_prime(), @arith.not_odd(), @prime.divides_trans(), @prime.divides_2()])), @tactics.all_tac])
  let t665 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (p : Num)"), fn(x662 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s663 = @tactics.mp_tac(x662)
    fn(x664 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s663(x664)
    }
  })
  let t661 = @simp.asm_rewrite_tac(@list.List([@multiplicative.multiplicative_id(), @products.nproduct_sing()]))
  let t659 = @term_syntax.parse_term("(n : Num)")
  let t660 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) => n"), t659]), @multiplicative.multiplicative_expand()))
  let t657 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_2()]))
  let t656 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("coprime(((a : Num), (b : Num))) → coprime((a, gcd((b, (c : Num)))))")))
  let t655 = @simp.asm_simp_tac(@list.List([@int.gcd(), @prime.coprime_lexp()]))
  let t654 = @tactics.match_mp_tac(@prime.divides_mul())
  let t653 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((p : Num) - 1 == 0) == (p == 0 || p == 1)"))]))
  let t652 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t658 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_assoc(), @equal.gsym(@bool.conjunct2(@arith.exp())), @arith.add1()])), t652), t653), t654), t655), @tactics.disj1_tac), t656), t657), @tactics.all_tac])
  let t651 = @tactics.match_mp_tac(@arith.le_mult2())
  let t650 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(8 * ((v : Num) * (g : Num)) <= (p : Num) * (q : Num)) == (2 * (v * g) * 4 <= q * p)"))]))
  let t649 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_1()])), @tactics.all_tac])
  let t648 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t647 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t646 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t643 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(p : _)} → P(p) && Q(p)")))
  let t645 = @tactics.first_assum(fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t643(x644))
  })
  let t642 = @simp.asm_rewrite_tac(@list.List([@products.nproduct_sing()]))
  let t641 = @simp.gen_rewrite_tac(fn(x638 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s639 = @equal.rand_conv(x638)
    fn(x640 : @kernel.Term) -> @kernel.Thm raise {
      s639(x640)
    }
  }, @list.List([@multiplicative.phi_expand()]))
  let t635 = @term_syntax.parse_term("(p : Num)")
  let t637 = @tactics.disch_then((x636 : @kernel.Thm) => @tactics.x_choose_tac(t635, x636))
  let t831 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.land_conv(@sets.has_size_conv)), t637), t641), t642), t645), t646), t647), t648), t649), t650), t651), @tactics.conj_tac), t658), t660), t661), t665), t666), t667), t674), t694)
  let t634 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @calc_num.arith_eq(), @arith.exp_eq_0()]))
  let t633 = @list.List([@meson.asm_meson_tac(@list.List([@arith.odd()])), @tactics.disj2_tac])
  let t632 = @simp.rewrite_tac(@list.List([@prime.gcd_le(), @arith.le_mult_lcancel()]))
  let t631 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(g : Num) <= (r : Num) && r * 1 <= r * (p : Num) → g <= r * p")))
  let t630 = @simp.asm_simp_tac(@list.List([@prime.le_index()]))
  let t629 = @simp.rewrite_tac(@list.List([@arith.add1(), @arith.le_exp(), @calc_num.arith_eq()]))
  let t628 = @tactics.match_mp_tac(@arith.le_mult2())
  let t627 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t626 = @simp.gen_rewrite_tac(fn(x623 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s624 = @equal.rand_conv(x623)
    fn(x625 : @kernel.Term) -> @kernel.Thm raise {
      s624(x625)
    }
  }, @list.List([@arith.mult_sym()]))
  let t622 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t621 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.mult_assoc(), @equal.gsym(@bool.conjunct2(@arith.exp()))]))
  let t620 = @simp.asm_simp_tac(@list.List([@prime.gcd_one(), @prime.coprime_rexp(), @prime.coprime_2()]))
  let t619 = @simp.asm_simp_tac(@list.List([@prime.gcd_coprime_rmul(), @prime.coprime_lexp(), @prime.coprime_2()]))
  let t618 = @tactics.disch_then(fn(x617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x614 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s615 = @tactics.subst1_tac(x614)
      fn(x616 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s615(x616)
      }
    })(@equal.sym(x617))
  })
  let t613 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x607 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s608 = @tactics.mp_tac(x607)
    fn(x609 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s608(x609)
    }
  }, fn(x610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s611 = @tactics.assume_tac(x610)
    fn(x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s611(x612)
    }
  }))
  let t606 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t605 = @simp.asm_rewrite_tac(@list.List([@prime.divides_2(), @arith.not_even(), @theorems.left_imp_exists_thm()]))
  let t604 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_1()])), @tactics.all_tac])
  let t603 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t602 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t601 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t600 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 == 0) == (n == 0 || n == 1)")), @calc_num.arith_eq()]))
  let t598 = @term_syntax.parse_term("2")
  let t599 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num) - 1"), t598]), @prime.index_decomposition()))
  let t597 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t596 = @simp.asm_simp_tac(@list.List([@prime.finite_special_divisors(), @arith.le_0(), @sets.in_elim_thm()]))
  let t595 = @tactics.match_mp_tac(@products.nproduct_le())
  let t594 = @simp.asm_rewrite_tac(@list.List([]))
  let t593 = @simp.gen_rewrite_tac(fn(x590 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s591 = @equal.rand_conv(x590)
    fn(x592 : @kernel.Term) -> @kernel.Thm raise {
      s591(x592)
    }
  }, @list.List([@multiplicative.phi_expand()]))
  let t588 = @equal.gsym(@products.nproduct_mul())
  let t589 = @simp.asm_simp_tac(@list.List([@equal.gsym(@products.nproduct_const()), @prime.finite_special_divisors(), t588]))
  let t587 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t586 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_rcancel(), @arith.le_exp()]))
  let t584 = @term_syntax.parse_term("EXP(2, CARD({(p : Num) | prime(p) && divides(p, (n : Num))})) * nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => EXP(2, (v : Num)) * gcd(((t : Num), p - 1)))")
  let t585 = @tactics.trans_tac(@arith.le_trans())(t584)
  let t832 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("8 == EXP(2, 3)")))), t585), t586), t587), t589), t593), t594), t595), t596), t597), @tactics.strip_tac), t599), t600), t601), t602), t603), t604), t605), t606), t613), t618), t619), t620), t621), t622), t626), t627), t628), t629), t630), @tactics.conj_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t631), t632), @tactics.conj_tac), t633), t634)
  let t583 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t582 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @prime.prime_factor()))
  let t833 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.card_eq_0()])), t582), t583), t832, t831, t830])
  let t581 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x578 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s579 = @tactics.mp_tac(x578)
    fn(x580 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s579(x580)
    }
  }))
  let t577 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.has_size()])), @int.arith_tac), @tactics.all_tac])
  let t576 = @tactics.subgoal_then(@term_syntax.parse_term("CARD({(p : Num) | prime(p) && divides(p, (n : Num))}) == 0 || 3 <= CARD({(p : Num) | prime(p) && divides(p, n)}) || HAS_SIZE({(p : Num) | prime(p) && divides(p, n)}, 1) || HAS_SIZE({(p : Num) | prime(p) && divides(p, n)}, 2)"), fn(x573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s574 = @tactics.mp_tac(x573)
    fn(x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s574(x575)
    }
  })
  let t572 = @list.List([@simp.asm_simp_tac(@list.List([@prime.finite_special_divisors()])), @tactics.all_tac])
  let t571 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(p : Num) | prime(p) && divides(p, (n : Num))})"), fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s569 = @tactics.assume_tac(x568)
    fn(x570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s569(x570)
    }
  })
  let t567 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(2 * (x : Num) <= DIV((y : Num), 4)) == (8 * x <= y)"))]))
  let t566 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@arith.le_trans()))
  let t565 = @simp.asm_rewrite_tac(@list.List([]))
  let t561 = @term_syntax.parse_term("(v : Num)")
  let t562 = @term_syntax.parse_term("(t : Num)")
  let t563 = @term_syntax.parse_term("(s : Num)")
  let t564 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t563, t562, t561]), miller_rabin_pseudoprime_bound_gen()))
  let t560 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t559 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((v : Num) + 2 <= v + 1)")), @class.not_forall_thm(), @class.not_imp()]))
  let t555 = @term_syntax.parse_term("(v : Num) + 2")
  let t558 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s550 = @tactics.assume_tac(x549)
    fn(x551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s550(x551)
    }
  }, fn(x557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s553 = @tactics.mp_tac(x552)
      fn(x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s553(x554)
      }
    })(((x556 : @kernel.Thm) => @bool.spec(t555, x556))(x557))
  }))
  let t548 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t545 = @tactics.disch_then(fn(x544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t546 = @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(v : Num)")), t545)
  let t543 = @meson.asm_meson_tac(@list.List([@prime.divides_2(), @prime.divides_trans(), @arith.not_even()]))
  let t542 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @prime.divides_2(), @arith.even_sub()]))
  let t538 = @term_syntax.parse_term("1")
  let t541 = @tactics.disch_then(fn(x540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x535 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s536 = @tactics.mp_tac(x535)
      fn(x537 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s536(x537)
      }
    })(((x539 : @kernel.Thm) => @bool.spec(t538, x539))(x540))
  })
  let t547 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(q : Bool) → (p : Bool) && q → (r : Bool)"))), t541), t542), t543), t546])
  let t534 = @tactics.match_mp_tac(@nums.num_induction())
  let t532 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t531 = @meson.asm_meson_tac(@list.List([@prime.prime_0(), @prime.prime_1()]))
  let t530 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 == 0) == (n == 0 || n == 1)")), @calc_num.arith_eq()]))
  let t529 = @simp.rewrite_tac(@list.List([@prime.primepow_divides_index()]))
  let t528 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t527 = @tactics.exists_tac(@term_syntax.parse_term("index(2, (p : Num) - 1)"))
  let t526 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t525 = @simp.asm_rewrite_tac(@list.List([]))
  let t524 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @prime.prime_factor()))
  let t533 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.meson_tac(@list.List([@arith.exp(), @prime.divides_1()])), @tactics.all_tac])), t524), t525), t526), t527), t528), t529), t530), t531), t532])
  let t523 = @simp.rewrite_tac(@list.List([]))
  let t522 = @tactics.mp_tac(@bool.eq_imp_rule(@bool.spec(@term_syntax.parse_term("(v : Num) => ∀ p : Num, prime(p) && divides(p, (n : Num)) → divides(EXP(2, v), p - 1)"), @arith.num_max())).0)
  let t521 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Num)"))(@tactics.strip_assume_tac))
  let t520 = @simp.rewrite_tac(@list.List([@prime.divides_2(), @arith.not_even()]))
  let t519 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 == 0) == (n == 0 || n == 1)")), @calc_num.arith_eq()]))
  let t518 = @simp.abbrev_tac(@term_syntax.parse_term("(s : Num) == index(2, (n : Num) - 1)"))
  let t516 = @term_syntax.parse_term("2")
  let t517 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) - 1"), t516]), @prime.index_decomposition()))
  let t513 = @term_syntax.parse_term("(n : Num) == 2")
  let t514 = @term_syntax.parse_term("(n : Num) == 1")
  let t515 = @tactics.map_every(fn(x510 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x510
    let t512 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
    @tactics.then_tac(@class.asm_cases_tac(t), t512)
  }, @list.List([@term_syntax.parse_term("(n : Num) == 0"), t514, t513]))
  let t834 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@arith.gt()]))), t515), @tactics.strip_tac), t517), t518), t519), t520), t521), t522), t523), @tactics.ants_tac), t533), t534), @tactics.conj_tac), t547), t548), t558), t559), t560), @tactics.disch_tac), t564), t565), t566), t567), t571), t572), t576), t577), t581), t833)
  miller_rabin_pseudoprime_bound_phi_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ODD(n) && !prime(n) && n > 9 → CARD({(a : Num) | a < n && miller_rabin_pseudoprime(a, n)}) <= DIV(phi(n), 4)"), t834))
}

///|
let miller_rabin_pseudoprime_bound_phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_BOUND_PHI")

///|
/// `MILLER_RABIN_PSEUDOPRIME_BOUND_PHI`
pub fn miller_rabin_pseudoprime_bound_phi() -> @kernel.Thm {
  miller_rabin_pseudoprime_bound_phi_c.get()
}

///|
/// ABSOLUTE_MILLER_RABIN_PSEUDOPRIME
fn step_20() -> Unit raise {
  let t885 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t884 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t883 = @tactics.conv_tac(@equal.top_depth_conv(@calc_num.expand_cases_conv))
  let t882 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(∀ x : _, P(x) → !Q(x))"))]))
  let t881 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t880 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t879 = @simp.simp_tac(@list.List([@prime.index_exp(), @prime.index_refl(), @prime.prime_2()]))
  let t878 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("8 == EXP(2, 3)"))]))
  let t877 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t876 = @simp.rewrite_tac(@list.List([miller_rabin_pseudoprime()]))
  let t875 = @tactics.conv_tac(@equal.once_depth_conv(@prime.coprime_conv))
  let t871 = @term_syntax.parse_term("2")
  let t874 = @tactics.disch_then(fn(x873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s869 = @tactics.mp_tac(x868)
      fn(x870 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s869(x870)
      }
    })(((x872 : @kernel.Thm) => @bool.spec(t871, x872))(x873))
  })
  let t867 = @simp.rewrite_tac(@list.List([]))
  let t866 = @tactics.conv_tac(@equal.once_depth_conv(@pocklington.prime_conv))
  let t865 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t864 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t862 = @term_syntax.parse_term("(n : Num)")
  let t863 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t862)
  let t861 = @tactics.pop_assum(fn(x858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s859 = @tactics.mp_tac(x858)
    fn(x860 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s859(x860)
    }
  })
  let t857 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < 10"))
  let t855 = @tactics.repeat_tac(@tactics.pop_assum(fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s853 = @tactics.mp_tac(x852)
    fn(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s853(x854)
    }
  }))
  let t851 = @meson.asm_meson_tac(@list.List([@pocklington.phi_eq_0(), @arith.odd()]))
  let t850 = @simp.asm_simp_tac(@list.List([miller_rabin_pseudoprime_bound_phi()]))
  let t849 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= DIV((b : Num), 4) && !(b == 0) → !(a == b)")))
  let t847 = @simp.rewrite_tac(@list.List([@equal.gsym(@pocklington.phi_alt())]))
  let t848 = @list.List([@meson.asm_meson_tac(@list.List([miller_rabin_pseudoprime_imp_coprime()])), t847])
  let t846 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t845 = @tactics.match_mp_tac(@sets.card_psubset_imp())
  let t844 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("PSUBSET({(a : Num) | a < (n : Num) && miller_rabin_pseudoprime(a, n)}, {(a : Num) | coprime((a, n)) && a < n}) → !(∀ a : Num, coprime((a, n)) → miller_rabin_pseudoprime(a, n))")))
  let t856 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x843 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x843
  }, @list.List([@equal.gsym(@class.contrapos_thm())])), @tactics.disch_tac), t844), t845), t846), @tactics.conj_tac), t848), t849), t850), t851), t855])
  let t842 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) > 9"))
  let t840 = @meson.meson_tac(@list.List([@prime.coprime_1()]))
  let t841 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([miller_rabin_pseudoprime()])), t840)])
  let t839 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((n : Num))"))
  let t838 = @simp.asm_rewrite_tac(@list.List([@prime.prime_2()]))
  let t837 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t836 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([prime_imp_miller_rabin_pseudoprime()]))])
  let t835 = @simp.asm_rewrite_tac(@list.List([miller_rabin_pseudoprime_mod_1()]))
  let t886 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))), t835), @tactics.eq_tac), t836), t837), t838), t839), t841), t842), t856), t857), @list.List([@tactics.all_tac, @int.asm_arith_tac])), t861), t863), t864), t865), t866), t867), t874), t875), t876), t877), t878), t879), t880), t881), t882), t883), t884), t885)
  absolute_miller_rabin_pseudoprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (∀ a : Num, coprime((a, n)) → miller_rabin_pseudoprime(a, n)) == (n == 1 || prime(n))"), t886))
}

///|
let absolute_miller_rabin_pseudoprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTE_MILLER_RABIN_PSEUDOPRIME")

///|
/// `ABSOLUTE_MILLER_RABIN_PSEUDOPRIME`
pub fn absolute_miller_rabin_pseudoprime() -> @kernel.Thm {
  absolute_miller_rabin_pseudoprime_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_BOUND_LT
fn step_21() -> Unit raise {
  let t920 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t921 = @tactics.then_tac(@simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()])), t920)
  let t919 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t918 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t917 = @tactics.conv_tac(@equal.top_depth_conv(@calc_num.expand_cases_conv))
  let t916 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(∀ x : _, P(x) → !Q(x))"))]))
  let t915 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t914 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t913 = @simp.simp_tac(@list.List([@prime.index_exp(), @prime.index_refl(), @prime.prime_2()]))
  let t912 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("8 == EXP(2, 3)"))]))
  let t911 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t910 = @simp.rewrite_tac(@list.List([miller_rabin_pseudoprime()]))
  let t909 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t908 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t907 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
  let t922 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ i : _, IN(i, (s : (_) -> Bool)) → (R : (_) -> Bool)(i)) && (∀ i : _, R(i) → (P : (_) -> Bool)(i) == IN(i, s)) → {(i : _) | R(i) && P(i)} == s"))), t907), t908), t909), t910), t911), t912), t913), t914), t915), t916), t917), t918), t919), t921])
  let t906 = @tactics.subgoal_then(@term_syntax.parse_term("{(a : Num) | a < 9 && miller_rabin_pseudoprime(a, 9)} == {1, 8}"), fn(x903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s904 = @tactics.subst1_tac(x903)
    fn(x905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s904(x905)
    }
  })
  let t900 = @simp.rewrite_tac(@list.List([]))
  let t899 = @tactics.conv_tac(@equal.once_depth_conv(@pocklington.prime_conv))
  let t898 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t901 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@calc_num.expand_cases_conv), t898), t899), t900)
  let t897 = @simp.asm_simp_tac(@list.List([miller_rabin_pseudoprime_bound_phi()]))
  let t896 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(4 * (m : Num) <= (n : Num)) == (m <= DIV(n, 4))"))]))
  let t895 = @simp.asm_simp_tac(@list.List([@pocklington.phi_limit_strong()]))
  let t893 = @term_syntax.parse_term("phi((n : Num))")
  let t894 = @tactics.trans_tac(@arith.le_trans())(t893)
  let t891 = @term_syntax.parse_term("(n : Num) - 1")
  let t892 = @tactics.trans_tac(@arith.let_trans())(t891)
  let t890 = @tactics.repeat_tac(@tactics.strip_tac)
  let t889 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) < 10) == (n > 9)"))]))
  let t902 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t889), t890), t892), @tactics.conj_tac), @list.List([@tactics.all_tac, @int.asm_arith_tac])), t894), t895), t896), t897), t901])
  let t888 = @simp.rewrite_tac(@list.List([]))
  let t887 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => n < 10"))
  let t923 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("∀ Q : (_) -> Bool, (∀ n : _, !Q(n) → (P : (_) -> Bool)(n)) && (∀ n : _, Q(n) → P(n)) → (∀ n : _, P(n))"))), t887), t888), @tactics.conj_tac), t902), t906), t922)
  miller_rabin_pseudoprime_bound_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ODD(n) && !prime(n) && !(n == 1) → 4 * CARD({(a : Num) | a < n && miller_rabin_pseudoprime(a, n)}) < n"), t923))
}

///|
let miller_rabin_pseudoprime_bound_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_BOUND_LT")

///|
/// `MILLER_RABIN_PSEUDOPRIME_BOUND_LT`
pub fn miller_rabin_pseudoprime_bound_lt() -> @kernel.Thm {
  miller_rabin_pseudoprime_bound_lt_c.get()
}

///|
/// MILLER_RABIN_PSEUDOPRIME_BOUND
fn step_22() -> Unit raise {
  let t927 = @drule.match_mp(miller_rabin_pseudoprime_bound_lt())
  let t929 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s925 = @tactics.mp_tac(x924)
      fn(x926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s925(x926)
      }
    })(t927(x928))
  })), @int.arith_tac)
  miller_rabin_pseudoprime_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ODD(n) && !prime(n) && !(n == 1) → CARD({(a : Num) | a < n && miller_rabin_pseudoprime(a, n)}) <= DIV(n, 4)"), t929))
}

///|
let miller_rabin_pseudoprime_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MILLER_RABIN_PSEUDOPRIME_BOUND")

///|
/// `MILLER_RABIN_PSEUDOPRIME_BOUND`
pub fn miller_rabin_pseudoprime_bound() -> @kernel.Thm {
  miller_rabin_pseudoprime_bound_c.get()
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
}
