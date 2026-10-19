// Translated from upstream 100/liouville.ml; edit this file directly.

///|
/// algebraic
fn step_1() -> Unit raise {
  algebraic_c.set(@pair.new_definition(@term_syntax.parse_term("(algebraic : (Real) -> Bool)((x : Real)) == (∃ p : List[Real], ALL(integer, p) && !(poly(p) == poly(NIL)) && poly(p, x) == real_of_num(0))")))
}

///|
let algebraic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("algebraic")

///|
/// `algebraic`
pub fn algebraic() -> @kernel.Thm {
  algebraic_c.get()
}

///|
/// transcendental
fn step_2() -> Unit raise {
  transcendental_c.set(@pair.new_definition(@term_syntax.parse_term("(transcendental : (Real) -> Bool)((x : Real)) == !algebraic(x)")))
}

///|
let transcendental_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("transcendental")

///|
/// `transcendental`
pub fn transcendental() -> @kernel.Thm {
  transcendental_c.get()
}

///|
/// REAL_INTEGER_EQ_0
fn step_3() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@floor.real_abs_integer_lemma(), @analysis.real_not_le()]))
  real_integer_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, integer(x) && abs(x) < real_of_num(1) → x == real_of_num(0)"), t1))
}

///|
let real_integer_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGER_EQ_0")

///|
/// `REAL_INTEGER_EQ_0`
pub fn real_integer_eq_0() -> @kernel.Thm {
  real_integer_eq_0_c.get()
}

///|
/// FACT_LE_REFL
fn step_4() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel(), @nums.not_suc(), @arith.fact_lt(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == (0 < n)"))]))
  let t2 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) * 1 <= (a : Num) → x <= a")))
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.fact(), @calc_num.arith()]))), t2), t3)
  fact_le_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n <= FACT(n)"), t4))
}

///|
let fact_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_LE_REFL")

///|
/// `FACT_LE_REFL`
pub fn fact_le_refl() -> @kernel.Thm {
  fact_le_refl_c.get()
}

///|
/// EXP_LE_REFL
fn step_5() -> Unit raise {
  let t13 = @tactics.pop_assum(fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s11 = @tactics.mp_tac(x10)
    fn(x12 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s11(x12)
    }
  })
  let t9 = @simp.rewrite_tac(@list.List([@arith.lt_mult_rcancel(), @arith.exp_eq_0()]))
  let t6 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(n : Num) <= (x : Num) → 1 * x < (y : Num) → SUC(n) <= y")))
  let t8 = @tactics.first_x_assum(fn(x7 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t6(x7))
  })
  let t5 = @simp.rewrite_tac(@list.List([@arith.exp(), @calc_num.arith()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), @nums.induct_tac), t5), t8), t9), t13), @int.arith_tac)
  exp_le_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, 1 < a → (∀ n : Num, n <= EXP(a, n))"), t14))
}

///|
let exp_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_LE_REFL")

///|
/// `EXP_LE_REFL`
pub fn exp_le_refl() -> @kernel.Thm {
  exp_le_refl_c.get()
}

///|
/// MVT_INEQ
fn step_6() -> Unit raise {
  let t54 = @tactics.pop_assum_list(fn(x53 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s50 = @tactics.mp_tac(x49)
      fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s50(x51)
      }
    })(((x52 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x52))(x53))
  })
  let t46 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t45 = @simp.asm_rewrite_tac(@list.List([]))
  let t47 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_lmul()), t45), t46)
  let t48 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.match_mp_tac(@real.real_le_rmul()), t47]))
  let t44 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) * abs((f' : (Real) -> Real)((z : Real)))"))
  let t43 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t42 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t41 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t40 = @list.List([@simp.once_rewrite_tac(@list.List([@real.real_abs_sub()])), @tactics.all_tac])
  let t38 = @tactics.pop_assum_list(fn(x37 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s34 = @tactics.mp_tac(x33)
      fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s34(x35)
      }
    })(((x36 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x36))(x37))
  })
  let t32 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t31 = @tactics.repeat_tac(@tactics.strip_tac)
  let t39 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t31), t32), t38), @calc_rat.real_arith_tac), @tactics.all_tac]))
  let t25 = @term_syntax.parse_term("(x : Real)")
  let t26 = @term_syntax.parse_term("(a : Real)")
  let t27 = @term_syntax.parse_term("(f' : (Real) -> Real)")
  let t28 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t27, t26, t25]), @analysis.mvt_alt()))
  let t22 = @term_syntax.parse_term("(a : Real)")
  let t23 = @term_syntax.parse_term("(x : Real)")
  let t24 = @term_syntax.parse_term("(f' : (Real) -> Real)")
  let t29 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t24, t23, t22]), @analysis.mvt_alt()))
  let t30 = @list.List([@simp.asm_simp_tac(@list.List([@analysis.real_sub_refl(), @calc_int.real_abs_num(), @real.real_lt_mul()])), t29, t28])
  let t20 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (a : Real) || x < a || a < x"))
  let t21 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s18 = @tactics.assume_tac(x17)
    fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s18(x19)
    }
  })(t20)
  let t16 = @tactics.repeat_tac(@tactics.strip_tac)
  let t15 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) == ((a → b) && (a → c))"))])), t15), t16), t21), t30), t39), @tactics.strip_tac), t40), t41), t42), t43), t44), t48), t54), @calc_rat.real_arith_tac)
  mvt_ineq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ f' : (Real) -> Real, ∀ a : Real, ∀ d : Real, ∀ M : Real, real_of_num(0) < M && real_of_num(0) < d && (∀ x : Real, abs(x - a) <= d → diffl(f, f'(x), x) && abs(f'(x)) < M) → (∀ x : Real, abs(x - a) <= d → abs(f(x) - f(a)) < M * d)"), t55))
}

///|
let mvt_ineq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVT_INEQ")

///|
/// `MVT_INEQ`
pub fn mvt_ineq() -> @kernel.Thm {
  mvt_ineq_c.get()
}

///|
/// POLY_MULTIPLE_INTEGER
fn step_7() -> Unit raise {
  let t64 = @simp.asm_simp_tac(@list.List([@floor.integer_closed()]))
  let t63 = @tactics.match_mp_tac(@lib.el(1, @bool.conjuncts_rule(@floor.integer_closed())))
  let t62 = @simp.asm_simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq()]))
  let t61 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(q : Real) * (qp : Real) * ((h : Real) + (pq : Real) * (pol : Real)) == q * (h * qp) + q * pq * (qp * pol)"))]))
  let t60 = @simp.rewrite_tac(@list.List([@lists.length(), @realax.real_pow(), @lists.all()]))
  let t59 = @simp.rewrite_tac(@list.List([@poly.poly(), @analysis.real_mul_rzero(), @floor.integer_closed()]))
  let t57 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @realax.real_pow(), @analysis.real_mul_lzero(), @floor.integer_closed()]))
  let t58 = @list.List([@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@poly.poly(), @analysis.real_mul_rzero(), @floor.integer_closed()]))), t57), @tactics.all_tac])
  let t56 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 0"))
  let t65 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t56), t58), @lists.list_induct_tac), t59), t60), @tactics.disch_tac), t61), t62), t63), t64)
  poly_multiple_integer_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ l : List[Real], ALL(integer, l) → integer(pow(real_of_num(q), LENGTH(l)) * poly(l, real_of_num(p) / real_of_num(q)))"), t65))
}

///|
let poly_multiple_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MULTIPLE_INTEGER")

///|
/// `POLY_MULTIPLE_INTEGER`
pub fn poly_multiple_integer() -> @kernel.Thm {
  poly_multiple_integer_c.get()
}

///|
/// SEPARATE_FINITE_SET
fn step_8() -> Unit raise {
  let t75 = @meson.asm_meson_tac(@list.List([@analysis.real_le_refl()]))
  let t74 = @simp.asm_rewrite_tac(@list.List([@real.real_min_le(), @real.real_lt_min(), @equal.gsym(@real.real_abs_nz()), @analysis.real_sub_0()]))
  let t73 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), abs((x : Real) - (a : Real)))"))
  let t72 = @simp.asm_rewrite_tac(@list.List([]))
  let t71 = @tactics.disch_then(fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x69
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t68 = @tactics.repeat_tac(@tactics.gen_tac)
  let t67 = @list.List([@meson.meson_tac(@list.List([@analysis.real_lt_01()])), @tactics.all_tac])
  let t66 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t76 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t66), @tactics.conj_tac), t67), t68), t71), t72), @tactics.strip_tac), t73), t74), t75)
  separate_finite_set_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ s : (Real) -> Bool, FINITE(s) → !IN(a, s) → (∃ d : Real, real_of_num(0) < d && (∀ x : Real, IN(x, s) → d <= abs(x - a)))"), t76))
}

///|
let separate_finite_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEPARATE_FINITE_SET")

///|
/// `SEPARATE_FINITE_SET`
pub fn separate_finite_set() -> @kernel.Thm {
  separate_finite_set_c.get()
}

///|
/// POLY_ROOT_SEPARATE_LE
fn step_9() -> Unit raise {
  let t83 = @meson.meson_tac(@list.List([@analysis.real_not_lt()]))
  let t82 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_nz()), @analysis.real_sub_0()]))
  let t81 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t80 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t79 = @simp.asm_simp_tac(@list.List([@poly.poly_roots_finite_set(), @sets.finite_delete(), @sets.in_delete()]))
  let t77 = @term_syntax.parse_term("DELETE({(x : Real) | poly((p : List[Real]), x) == real_of_num(0)}, (x : Real))")
  let t78 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t77]), separate_finite_set()))
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t78), t79), t80), t81), t82), t83)
  poly_root_separate_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Real], ∀ x : Real, poly(p, x) == real_of_num(0) && !(poly(p) == poly(NIL)) → (∃ d : Real, real_of_num(0) < d && (∀ x' : Real, real_of_num(0) < abs(x' - x) && abs(x' - x) < d → !(poly(p, x') == real_of_num(0))))"), t84))
}

///|
let poly_root_separate_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ROOT_SEPARATE_LE")

///|
/// `POLY_ROOT_SEPARATE_LE`
pub fn poly_root_separate_le() -> @kernel.Thm {
  poly_root_separate_le_c.get()
}

///|
/// POLY_ROOT_SEPARATE_LT
fn step_10() -> Unit raise {
  let t93 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (d : Real) → real_of_num(0) < d / real_of_num(2) && ((x : Real) <= d / real_of_num(2) → x < d)"))]))
  let t92 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) / real_of_num(2)"))
  let t91 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t88 = @drule.match_mp(poly_root_separate_le())
  let t90 = @tactics.disch_then(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s86 = @tactics.mp_tac(x85)
      fn(x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s86(x87)
      }
    })(t88(x89))
  })
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t90), t91), t92), t93)
  poly_root_separate_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Real], ∀ x : Real, poly(p, x) == real_of_num(0) && !(poly(p) == poly(NIL)) → (∃ d : Real, real_of_num(0) < d && (∀ x' : Real, real_of_num(0) < abs(x' - x) && abs(x' - x) <= d → !(poly(p, x') == real_of_num(0))))"), t94))
}

///|
let poly_root_separate_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ROOT_SEPARATE_LT")

///|
/// `POLY_ROOT_SEPARATE_LT`
pub fn poly_root_separate_lt() -> @kernel.Thm {
  poly_root_separate_lt_c.get()
}

///|
/// POLY_BOUND_INTERVAL
fn step_11() -> Unit raise {
  let t110 = @tactics.pop_assum(fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s108 = @tactics.mp_tac(x107)
    fn(x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s108(x109)
    }
  })
  let t111 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t110), @tactics.all_tac])
  let t106 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real)"))
  let t105 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t104 = @tactics.repeat_tac(@tactics.strip_tac)
  let t103 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) + abs((M : Real))"))
  let t100 = @term_syntax.parse_term("(M : Real)")
  let t102 = @tactics.disch_then((x101 : @kernel.Thm) => @tactics.x_choose_tac(t100, x101))
  let t98 = @bool.spec_all(@poly.poly_cont())
  let t99 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t98)]))
  let t95 = @term_syntax.parse_term("(x : Real) + (d : Real)")
  let t96 = @term_syntax.parse_term("(x : Real) - (d : Real)")
  let t97 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("poly((p : List[Real]))"), t96, t95]), @analysis.cont_bounded_abs()))
  let t112 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t97), t99), t102), t103), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t104), t105), t106), @tactics.conj_tac), t111), @calc_rat.real_arith_tac)
  poly_bound_interval_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Real], ∀ d : Real, ∀ x : Real, ∃ M : Real, real_of_num(0) < M && (∀ x' : Real, abs(x' - x) <= d → abs(poly(p, x')) < M)"), t112))
}

///|
let poly_bound_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_BOUND_INTERVAL")

///|
/// `POLY_BOUND_INTERVAL`
pub fn poly_bound_interval() -> @kernel.Thm {
  poly_bound_interval_c.get()
}

///|
/// LIOUVILLE_INTERVAL
fn step_12() -> Unit raise {
  let t136 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_inv_eq(), @analysis.real_le_refl()]))
  let t135 = @simp.rewrite_tac(@list.List([@real.real_min_le(), @real.real_lt_min()]))
  let t134 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t133 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t132 = @simp.gen_rewrite_tac(fn(x129 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s130 = @equal.land_conv(x129)
    fn(x131 : @kernel.Term) -> @kernel.Thm raise {
      s130(x131)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t128 = @simp.asm_simp_tac(@list.List([]))
  let t127 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real)"))
  let t126 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t125 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t124 = @simp.asm_simp_tac(@list.List([@real.real_lt_min(), @real.real_le_min(), @real.real_lt_inv_eq()]))
  let t123 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), inv((M : Real)))"))
  let t120 = @term_syntax.parse_term("(M : Real)")
  let t122 = @tactics.disch_then((x121 : @kernel.Thm) => @tactics.x_choose_tac(t120, x121))
  let t117 = @term_syntax.parse_term("(x : Real)")
  let t118 = @term_syntax.parse_term("(d : Real)")
  let t119 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("poly_diff((p : List[Real]))"), t118, t117]), poly_bound_interval()))
  let t116 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t115 = @simp.asm_rewrite_tac(@list.List([]))
  let t113 = @term_syntax.parse_term("(x : Real)")
  let t114 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : List[Real])"), t113]), poly_root_separate_lt()))
  let t137 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t114), t115), t116), t119), t122), t123), t124), t125), @tactics.strip_tac), t126), t127), t128), t132), t133), t134), t135), t136)
  liouville_interval_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Real], ∀ x : Real, poly(p, x) == real_of_num(0) && !(poly(p) == poly(NIL)) → (∃ c : Real, real_of_num(0) < c && (∀ x' : Real, abs(x' - x) <= c → abs(poly(poly_diff(p), x')) < real_of_num(1) / c) && (∀ x' : Real, real_of_num(0) < abs(x' - x) && abs(x' - x) <= c → !(poly(p, x') == real_of_num(0))))"), t137))
}

///|
let liouville_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_INTERVAL")

///|
/// `LIOUVILLE_INTERVAL`
pub fn liouville_interval() -> @kernel.Thm {
  liouville_interval_c.get()
}

///|
/// LIOUVILLE
fn step_13() -> Unit raise {
  let t220 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t219 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t218 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @real.real_of_num_lt(), @real.real_lt_rdiv_eq(), @arith.lt_nz()]))
  let t217 = @simp.asm_rewrite_tac(@list.List([]))
  let t216 = @simp.once_rewrite_tac(@list.List([@real.real_abs_sub()]))
  let t215 = @simp.rewrite_tac(@list.List([@analysis.real_sub_rzero()]))
  let t211 = @term_syntax.parse_term("real_of_num((p : Num)) / real_of_num((q : Num))")
  let t214 = @tactics.disch_then(fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s209 = @tactics.mp_tac(x208)
      fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s209(x210)
      }
    })(((x212 : @kernel.Thm) => @bool.spec(t211, x212))(x213))
  })
  let t207 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t206 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @analysis.real_lt_imp_nz()]))
  let t205 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc(), @realax.real_mul_lid()]))
  let t203 = @tactics.undisch_tac(@term_syntax.parse_term("!((q : Num) == 0)"))
  let t202 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t201 = @tactics.match_mp_tac(@real.real_pow_le_1())
  let t200 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_le()]))
  let t199 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t198 = @simp.gen_rewrite_tac(fn(x195 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s196 = @equal.land_conv(x195)
    fn(x197 : @kernel.Term) -> @kernel.Thm raise {
      s196(x197)
    }
  }, @list.List([@equal.gsym(@analysis.real_mul_rid())]))
  let t194 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @real.real_of_num_lt(), @real.real_le_ldiv_eq(), @arith.lt_nz()]))
  let t191 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (d : Real) → d <= (e : Real) → x <= e")))
  let t193 = @tactics.first_x_assum(fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t191(x192))
  })
  let t190 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t189 = @tactics.repeat_tac(@tactics.strip_tac)
  let t188 = @bool.spec_all(@poly.poly_diff_v1())
  let t204 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(t188)])), t189), t190), t193), t194), t198), t199), t200), t201), t202), t203), @int.arith_tac), @tactics.all_tac])
  let t187 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith(), @arith.lt_nz(), @real.real_pow_lt()]))
  let t182 = @term_syntax.parse_term("real_of_num(1) / (c : Real)")
  let t183 = @term_syntax.parse_term("(c : Real) / pow(real_of_num((q : Num)), LENGTH((l : List[Real])))")
  let t184 = @term_syntax.parse_term("(x : Real)")
  let t185 = @term_syntax.parse_term("poly(poly_diff((l : List[Real])))")
  let t186 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("poly((l : List[Real]))"), t185, t184, t183, t182]), mvt_ineq()))
  let t181 = @simp.asm_simp_tac(@list.List([poly_multiple_integer()]))
  let t180 = @tactics.match_mp_tac(real_integer_eq_0())
  let t179 = @list.List([@tactics.all_tac, @simp.asm_rewrite_tac(@list.List([@realarith.real_entire(), @real.real_pow_eq_0(), @realax.real_of_num_eq()]))])
  let t178 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((q : Num)), LENGTH((l : List[Real]))) * poly(l, real_of_num((p : Num)) / real_of_num(q)) == real_of_num(0)"), fn(x175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s176 = @tactics.mp_tac(x175)
    fn(x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s176(x177)
    }
  })
  let t172 = @tactics.undisch_tac(@term_syntax.parse_term("!((q : Num) == 0)"))
  let t171 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t170 = @tactics.match_mp_tac(@real.real_pow_le_1())
  let t169 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_le()]))
  let t168 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t167 = @simp.gen_rewrite_tac(fn(x164 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s165 = @equal.land_conv(x164)
    fn(x166 : @kernel.Term) -> @kernel.Thm raise {
      s165(x166)
    }
  }, @list.List([@equal.gsym(@analysis.real_mul_rid())]))
  let t163 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @real.real_of_num_lt(), @real.real_le_ldiv_eq(), @arith.lt_nz()]))
  let t161 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (y : Real)) <= (d : Real) → d <= (e : Real) → abs(y - x) <= e")))
  let t173 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t161(x162))
  }), t163), t167), t168), t169), t170), t171), t172), @int.arith_tac)
  let t174 = @list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_abs_nz()), @analysis.real_sub_0()])), t173, @tactics.all_tac])
  let t160 = @tactics.repeat_tac(@tactics.conj_tac)
  let t159 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t155 = @term_syntax.parse_term("real_of_num((p : Num)) / real_of_num((q : Num))")
  let t158 = @tactics.disch_then(fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s153 = @tactics.mp_tac(x152)
      fn(x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s153(x154)
      }
    })(((x156 : @kernel.Thm) => @bool.spec(t155, x156))(x157))
  })
  let t151 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x' : Real, real_of_num(0) < abs(x' - (x : Real)) && abs(x' - x) <= (c : Real) → !(poly((l : List[Real]), x') == real_of_num(0))"))
  let t150 = @tactics.repeat_tac(@tactics.strip_tac)
  let t149 = @simp.asm_rewrite_tac(@list.List([]))
  let t148 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num((p : Num)) / real_of_num((q : Num)) == (x : Real)"))
  let t146 = @term_syntax.parse_term("(q : Num)")
  let t147 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t146]))
  let t145 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@analysis.real_not_le())]))
  let t144 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t143 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t142 = @simp.asm_rewrite_tac(@list.List([]))
  let t140 = @term_syntax.parse_term("(x : Real)")
  let t141 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(l : List[Real])"), t140]), liouville_interval()))
  let t139 = @tactics.exists_tac(@term_syntax.parse_term("LENGTH((l : List[Real]))"))
  let t138 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(l : List[Real])"))(@tactics.strip_assume_tac))
  let t221 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([algebraic(), @realax.real_gt()]))), t138), t139), t141), t142), t143), t144), @tactics.strip_tac), t145), t147), @tactics.disch_tac), t148), t149), t150), t151), t158), t159), t160), t174), t178), t179), t180), t181), t186), t187), @tactics.ants_tac), t204), t205), t206), t207), t214), t215), t216), t217), t218), t219), t220)
  liouville_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, algebraic(x) → (∃ n : Num, ∃ c : Real, c > real_of_num(0) && (∀ p : Num, ∀ q : Num, !(q == 0) → real_of_num(p) / real_of_num(q) == x || abs(x - real_of_num(p) / real_of_num(q)) > c / pow(real_of_num(q), n)))"), t221))
}

///|
let liouville_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE")

///|
/// `LIOUVILLE`
pub fn liouville() -> @kernel.Thm {
  liouville_c.get()
}

///|
/// LIOUVILLE_IRRATIONAL
fn step_14() -> Unit raise {
  let t233 = @meson.asm_meson_tac(@list.List([liouville(), @real.real_abs_div(), @calc_int.real_abs_num()]))
  let t232 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t231 = @simp.rewrite_tac(@list.List([]))
  let t230 = @tactics.match_mp_tac(@theorems.mono_and())
  let t229 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t226 = @drule.match_mp(liouville())
  let t228 = @tactics.first_x_assum(fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x223 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s224 = @tactics.mp_tac(x223)
      fn(x225 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s224(x225)
      }
    })(t226(x227))
  })
  let t222 = @tactics.repeat_tac(@tactics.strip_tac)
  let t234 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@floor.rational_alt()])), t222), t228), t229), t230), t231), t232), t233)
  liouville_irrational_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, algebraic(x) && !rational(x) → (∃ n : Num, ∃ c : Real, c > real_of_num(0) && (∀ p : Num, ∀ q : Num, !(q == 0) → abs(x - real_of_num(p) / real_of_num(q)) > c / pow(real_of_num(q), n)))"), t234))
}

///|
let liouville_irrational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_IRRATIONAL")

///|
/// `LIOUVILLE_IRRATIONAL`
pub fn liouville_irrational() -> @kernel.Thm {
  liouville_irrational_c.get()
}

///|
/// liouville
fn step_15() -> Unit raise {
  liouville_v1_c.set(@pair.new_definition(@term_syntax.parse_term("(liouville : Real) == suminf((n : Num) => real_of_num(1) / pow(real_of_num(10), FACT(n)))")))
}

///|
let liouville_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("liouville")

///|
/// `liouville`
pub fn liouville_v1() -> @kernel.Thm {
  liouville_v1_c.get()
}

///|
/// LIOUVILLE_SUM_BOUND
fn step_16() -> Unit raise {
  let t263 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.lt_nz()), @arith.fact_lt()]))
  let t262 = @simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @arith.mult_eq_0()]))
  let t261 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 * (x : Num) <= SUC((n : Num)) * x && !(n * x == 0) → 1 <= SUC(n) * x - x")))
  let t260 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact()]))
  let t259 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t258 = @list.List([@tactics.all_tac, @tactics.match_mp_tac(@real.real_pow_mono())])
  let t257 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(10), 1)"))
  let t256 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t255 = @simp.simp_tac(@list.List([@equal.gsym(@real.real_pow_sub()), @realax.real_of_num_eq(), @calc_num.arith(), @arith.fact_mono(), @arith.le_add()]))
  let t254 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t253 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t252 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t251 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t250 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith()]))
  let t246 = @term_syntax.parse_term("(n : Num) + 1")
  let t249 = @tactics.first_x_assum(fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s244 = @tactics.mp_tac(x243)
      fn(x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s244(x245)
      }
    })(((x247 : @kernel.Thm) => @bool.spec(t246, x247))(x248))
  })
  let t241 = @equal.gsym(@realax.real_div())
  let t242 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + SUC((d : Num)) == n + 1 + d")), t241]))
  let t240 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) <= (x : Real) → real_of_num(1) * x + y <= real_of_num(2) * x")))
  let t239 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t238 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_add()]))
  let t236 = @simp.simp_tac(@list.List([@real.real_le_inv_eq(), @real.real_pow_le(), @realax.real_of_num_le(), @calc_num.arith()]))
  let t235 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t237 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses(), @iterate.sum_sing_numseg(), @realax.real_div()])), t235), t236), @tactics.all_tac])
  let t264 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @tactics.gen_tac), @tactics.disch_tac), t237), t238), t239), t240), t242), t249), t250), t251), t252), t253), t254), t255), t256), t257), @tactics.conj_tac), t258), t259), t260), t261), t262), t263), @int.arith_tac)
  liouville_sum_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, !(n == 0) → sum(op_dot_dot(n, n + d), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k))) <= real_of_num(2) / pow(real_of_num(10), FACT(n))"), t264))
}

///|
let liouville_sum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_SUM_BOUND")

///|
/// `LIOUVILLE_SUM_BOUND`
pub fn liouville_sum_bound() -> @kernel.Thm {
  liouville_sum_bound_c.get()
}

///|
/// LIOUVILLE_PSUM_BOUND
fn step_17() -> Unit raise {
  let t269 = @simp.asm_simp_tac(@list.List([liouville_sum_bound()]))
  let t268 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((d : Num) == 0) → (n : Num) + d - 1 == n + (d - 1)"))]))
  let t267 = @simp.asm_simp_tac(@list.List([@analysis.psum_sum_numseg()]))
  let t266 = @simp.asm_simp_tac(@list.List([@analysis.sum(), @real.real_le_div(), @real.real_pow_le(), @analysis.real_pos()]))
  let t265 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t270 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t265), t266), t267), t268), t269)
  liouville_psum_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Num, !(n == 0) → sum((n, d), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k))) <= real_of_num(2) / pow(real_of_num(10), FACT(n))"), t270))
}

///|
let liouville_psum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_PSUM_BOUND")

///|
/// `LIOUVILLE_PSUM_BOUND`
pub fn liouville_psum_bound() -> @kernel.Thm {
  liouville_psum_bound_c.get()
}

///|
/// LIOUVILLE_SUMS
fn step_18() -> Unit raise {
  let t303 = @simp.simp_tac(@list.List([exp_le_refl(), @calc_num.arith()]))
  let t302 = @simp.rewrite_tac(@list.List([fact_le_refl(), @arith.le_exp(), @calc_num.arith()]))
  let t301 = @tactics.exists_tac(@term_syntax.parse_term("EXP(10, (m : Num))"))
  let t300 = @tactics.match_mp_tac(@arith.le_trans())
  let t299 = @simp.asm_rewrite_tac(@list.List([]))
  let t298 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t297 = @tactics.match_mp_tac(@arith.le_trans())
  let t296 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_le()]))
  let t295 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t293 = @tactics.undisch_tac(@term_syntax.parse_term("inv((e : Real)) <= real_of_num((N : Num))"))
  let t292 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq()), @realax.real_div(), @realax.real_mul_lid()]))
  let t291 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < ((n : Real) + real_of_num(1) / real_of_num(2)) * (e : Real) → real_of_num(2) < e * (real_of_num(2) * n + real_of_num(1))")))
  let t290 = @equal.gsym(@realax.real_of_num_mul())
  let t294 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t290])), t291), t292), t293), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t289 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) * real_of_num(2 * (N : Num) + 1)"))
  let t288 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t287 = @simp.simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t285 = @tactics.undisch_tac(@term_syntax.parse_term("2 * (N : Num) + 1 <= (m : Num)"))
  let t284 = @tactics.match_mp_tac(liouville_psum_bound())
  let t283 = @simp.asm_simp_tac(@list.List([@analysis.sum_pos(), @real.real_le_div(), @real.real_pow_le(), @analysis.real_pos()]))
  let t286 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (a : Real) → abs(x) <= a"))), t283), t284), t285), @int.arith_tac), @tactics.all_tac])
  let t282 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) / pow(real_of_num(10), FACT((m : Num)))"))
  let t281 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t280 = @tactics.repeat_tac(@tactics.strip_tac)
  let t279 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t278 = @tactics.exists_tac(@term_syntax.parse_term("2 * (N : Num) + 1"))
  let t275 = @term_syntax.parse_term("(N : Num)")
  let t277 = @tactics.disch_then((x276 : @kernel.Thm) => @tactics.x_choose_tac(t275, x276))
  let t274 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("inv((e : Real))"), @analysis.real_arch_simple()))
  let t273 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t272 = @simp.rewrite_tac(@list.List([@analysis.ser_cauchy()]))
  let t271 = @tactics.match_mp_tac(@analysis.summable_sum())
  let t304 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([liouville_v1()])), t271), t272), t273), @tactics.disch_tac), t274), t277), t278), t279), t280), t281), t282), @tactics.conj_tac), t286), t287), t288), t289), @tactics.conj_tac), t294), t295), t296), t297), t298), t299), t300), t301), t302), t303)
  liouville_sums_c.set(@tactics.prove(@term_syntax.parse_term("sums((k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k)), liouville)"), t304))
}

///|
let liouville_sums_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_SUMS")

///|
/// `LIOUVILLE_SUMS`
pub fn liouville_sums() -> @kernel.Thm {
  liouville_sums_c.get()
}

///|
/// LIOUVILLE_PSUM_LE
fn step_19() -> Unit raise {
  let t317 = @simp.simp_tac(@list.List([@analysis.sum_pos(), @real.real_le_div(), @real.real_pow_le(), @analysis.real_pos()]))
  let t316 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split()), @arith.add_clauses(), @real.real_le_addr()]))
  let t315 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s313 = @tactics.subst_all_tac(x312)
    fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s313(x314)
    }
  }))
  let t311 = @simp.simp_tac(@list.List([@arith.ge(), @arith.le_exists()]))
  let t310 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t309 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t308 = @simp.rewrite_tac(@list.List([@analysis.seq_const(), @equal.gsym(@analysis.sums()), liouville_sums()]))
  let t307 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum((0, n), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k)))"))
  let t306 = @tactics.exists_tac(@term_syntax.parse_term("(j : Num) => sum((0, (n : Num)), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k)))"))
  let t305 = @tactics.match_mp_tac(@analysis.seq_le())
  let t318 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@analysis.suminf()]))), t305), t306), t307), t308), t309), t310), t311), t315), t316), t317)
  liouville_psum_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, sum((0, n), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k))) <= liouville"), t318))
}

///|
let liouville_psum_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_PSUM_LE")

///|
/// `LIOUVILLE_PSUM_LE`
pub fn liouville_psum_le() -> @kernel.Thm {
  liouville_psum_le_c.get()
}

///|
/// LIOUVILLE_PSUM_LT
fn step_20() -> Unit raise {
  let t321 = @simp.simp_tac(@list.List([@real.real_lt_div(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t320 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (e : Real) → (x : Real) + e <= (y : Real) → x < y")))
  let t319 = @simp.simp_tac(@list.List([@analysis.sum()]))
  let t322 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("SUC((n : Num))"), liouville_psum_le()))), t319), t320), t321)
  liouville_psum_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, sum((0, n), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k))) < liouville"), t322))
}

///|
let liouville_psum_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE_PSUM_LT")

///|
/// `LIOUVILLE_PSUM_LT`
pub fn liouville_psum_lt() -> @kernel.Thm {
  liouville_psum_lt_c.get()
}

///|
/// LIOVILLE_PSUM_DIFF
fn step_21() -> Unit raise {
  let t335 = @simp.asm_simp_tac(@list.List([@arith.add_clauses(), liouville_psum_bound()]))
  let t334 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split()), @analysis.real_le_ladd()]))
  let t333 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s331 = @tactics.subst_all_tac(x330)
    fn(x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s331(x332)
    }
  }))
  let t329 = @simp.simp_tac(@list.List([@arith.ge(), @arith.le_exists()]))
  let t328 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t327 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t326 = @simp.rewrite_tac(@list.List([@analysis.seq_const(), @equal.gsym(@analysis.sums()), liouville_sums()]))
  let t325 = @tactics.exists_tac(@term_syntax.parse_term("(j : Num) => sum((0, (n : Num)), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k))) + real_of_num(2) / pow(real_of_num(10), FACT(n))"))
  let t324 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum((0, n), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k)))"))
  let t323 = @tactics.match_mp_tac(@analysis.seq_le())
  let t336 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t323), t324), t325), t326), t327), t328), t329), t333), t334), t335)
  lioville_psum_diff_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → liouville <= sum((0, n), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k))) + real_of_num(2) / pow(real_of_num(10), FACT(n))"), t336))
}

///|
let lioville_psum_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOVILLE_PSUM_DIFF")

///|
/// `LIOVILLE_PSUM_DIFF`
pub fn lioville_psum_diff() -> @kernel.Thm {
  lioville_psum_diff_c.get()
}

///|
/// TRANSCENDENTAL_LIOUVILLE
fn step_22() -> Unit raise {
  let t413 = @simp.rewrite_tac(@list.List([@arith.fact_lt(), @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == (0 < x)"))]))
  let t412 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t411 = @tactics.match_mp_tac(@arith.le_mult2())
  let t410 = @simp.gen_rewrite_tac(fn(x407 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s408 = @equal.land_conv(x407)
    fn(x409 : @kernel.Term) -> @kernel.Thm raise {
      s408(x409)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) == k * 1"))]))
  let t406 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((k : Num) + (f : Num) * (m : Num) <= SUC(m + k) * f) == (k <= (k + 1) * f)"))]))
  let t405 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @arith.add_clauses(), @arith.fact()]))
  let t404 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) + ((k : Num) + 1) - 1 == m + k"))]))
  let t403 = @analysis.expand_tac("n")
  let t402 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add()), @arith.le_exp(), @calc_num.arith_eq()]))
  let t401 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_mul(), @realax.real_of_num_le()]))
  let t400 = @simp.simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_of_num_lt(), @arith.lt_nz(), @arith.exp_eq_0(), @calc_num.arith()]))
  let t399 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t398 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t397 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_le()]))
  let t396 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(10), (k : Num))"))
  let t395 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t394 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq())]))
  let t393 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t392 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t391 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.lt_nz(), @arith.exp_eq_0(), @calc_num.arith()]))
  let t390 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @equal.gsym(@arith.exp_mult())]))
  let t389 = @simp.rewrite_tac(@list.List([lioville_psum_diff()]))
  let t387 = @analysis.expand_tac("n")
  let t388 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lioville_psum_diff()), t387), @int.arith_tac), @tactics.all_tac])
  let t386 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t385 = @simp.rewrite_tac(@list.List([@analysis.real_le_sub_radd()]))
  let t384 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) / pow(real_of_num(10), FACT((n : Num)))"))
  let t383 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t382 = @simp.rewrite_tac(@list.List([@analysis.real_sub_le(), liouville_psum_le()]))
  let t381 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= y")))
  let t380 = @simp.simp_tac(@list.List([liouville_psum_lt(), @analysis.real_lt_imp_ne()]))
  let t379 = @tactics.disch_then(fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x377
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t376 = @simp.asm_rewrite_tac(@list.List([]))
  let t375 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith(), @arith.add_clauses()]))
  let t371 = @term_syntax.parse_term("(m : Num) + ((k : Num) + 1)")
  let t372 = @term_syntax.parse_term("0")
  let t373 = @bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t372, t371]), @analysis.psum_sum_numseg())
  let t374 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(f : (Num) -> Real)"), t373))
  let t369 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t368 = @simp.simp_tac(@list.List([@realax.real_mul_linv(), @realax.real_of_num_eq(), @real.real_pow_eq_0(), @calc_num.arith()]))
  let t367 = @simp.simp_tac(@list.List([@equal.gsym(@calc_int.real_of_num_pow()), @real.real_pow_sub(), @realax.real_of_num_eq(), @calc_num.arith(), @arith.fact_mono(), @realax.real_div(), @realax.real_mul_assoc()]))
  let t366 = @simp.rewrite_tac(@list.List([@iterate.real_of_num_sum_numseg(), @equal.gsym(@iterate.sum_lmul())]))
  let t365 = @simp.gen_rewrite_tac(fn(x362 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s363 = @equal.land_conv(x362)
    fn(x364 : @kernel.Term) -> @kernel.Thm raise {
      s363(x364)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t370 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t365), t366), t367), t368), t369), @tactics.all_tac])
  let t361 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(nsum(op_dot_dot(0, (n : Num) - 1), (i : Num) => EXP(10, FACT(n - 1) - FACT(i)))) / real_of_num(EXP(10, FACT(n - 1))) == sum(op_dot_dot(0, n - 1), (k : Num) => real_of_num(1) / pow(real_of_num(10), FACT(k)))"), fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s359 = @tactics.subst1_tac(x358)
    fn(x360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s359(x360)
    }
  })
  let t357 = @simp.rewrite_tac(@list.List([@arith.exp_eq_0(), @calc_num.arith()]))
  let t356 = @tactics.exists_tac(@term_syntax.parse_term("EXP(10, FACT((n : Num) - 1))"))
  let t355 = @tactics.exists_tac(@term_syntax.parse_term("nsum(op_dot_dot(0, (n : Num) - 1), (i : Num) => EXP(10, FACT(n - 1) - FACT(i)))"))
  let t354 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == (m : Num) + ((k : Num) + 1)"))
  let t351 = @term_syntax.parse_term("(k : Num)")
  let t353 = @tactics.disch_then((x352 : @kernel.Thm) => @tactics.x_choose_tac(t351, x352))
  let t350 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t348 = @term_syntax.parse_term("real_of_num(2) / (c : Real)")
  let t349 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(10)"), t348]), @analysis.real_arch_pow()))
  let t347 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @realax.real_gt(), @analysis.real_not_lt()]))
  let t345 = @term_syntax.parse_term("(c : Real)")
  let t346 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m : Num)"), t345]))
  let t344 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp()]))
  let t343 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (a → !b)"))]))
  let t340 = @drule.match_mp(liouville())
  let t342 = @tactics.disch_then(fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s338 = @tactics.mp_tac(x337)
      fn(x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s338(x339)
      }
    })(t340(x341))
  })
  let t414 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([transcendental()])), t342), t343), t344), t346), t347), @tactics.disch_tac), t349), t350), t353), t354), t355), t356), t357), t361), t370), t374), t375), t376), t379), t380), t381), t382), t383), t384), t385), t386), @tactics.conj_tac), t388), t389), t390), t391), t392), t393), t394), t395), t396), t397), t398), t399), t400), t401), t402), t403), t404), t405), t406), t410), t411), t412), t413)
  transcendental_liouville_c.set(@tactics.prove(@term_syntax.parse_term("transcendental(liouville)"), t414))
}

///|
let transcendental_liouville_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRANSCENDENTAL_LIOUVILLE")

///|
/// `TRANSCENDENTAL_LIOUVILLE`
pub fn transcendental_liouville() -> @kernel.Thm {
  transcendental_liouville_c.get()
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
