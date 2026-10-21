// Translated from upstream Jordan/real_ext_geom_series.ml; edit this file directly.

///|
/// Jordan/real_ext_geom_series.ml:2
fn step_1() -> Unit raise {
  @parse_ext_override_interface.prioritize_real(())
}

///|
/// `TRY_RULE`
pub fn try_rule(x1 : (@kernel.Thm) -> @kernel.Thm raise, x2 : @kernel.Thm) -> @kernel.Thm raise {
  let rl = x1
  let t = x2
  try {
    rl(t)
  } catch {
    _ => t
  }
}

///|
/// REAL_MUL_RTIMES
fn step_2() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([@real.real_eq_mul_rcancel()]))
  real_mul_rtimes_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ a : Real, ∀ b : Real, (!(x == real_of_num(0)) → a * x == b * x) && !(x == real_of_num(0)) → a == b"), t3))
}

///|
let real_mul_rtimes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_RTIMES")

///|
/// `REAL_MUL_RTIMES`
pub fn real_mul_rtimes() -> @kernel.Thm {
  real_mul_rtimes_c.get()
}

///|
/// GEOMETRIC_SUM
fn step_3() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([@analysis.sum_def(), @realax.real_pow(), @arith.add_clauses(), @realax.real_div(), @analysis.real_sub_rdistrib(), @analysis.real_sub_refl()]))
  let tac1 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), @tactics.gen_tac), @tactics.disch_tac), t4)
  let t14 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == pow((x : Real), (m : Num) + (n : Num))"))
  let t13 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Real) == pow((x : Real), (m : Num))"))
  let t12 = @simp.asm_rewrite_tac(@list.List([@realax.real_div()]))
  let t11 = @tactics.repeat_tac(@tactics.disch_tac)
  let t10 = @tactics_ext.taut_tac(@term_syntax.parse_term("((A : Bool) → (B : Bool) → (C : Bool)) → A → (A → B) → C"))
  let t5 = @term_syntax.parse_term("(x : Real)")
  let tac2 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac((x7 : @kernel.Thm) => try_rule((x6 : @kernel.Thm) => @bool.spec(t5, x6), x7)), (x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(1L, x8)), (x9 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x9)), t10), t11), t12), t13), t14)
  let t20 = @tactics.accept_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) + (b - b * (x : Real)) == a - x * b")))
  let t19 = @simp.rewrite_tac(@list.List([@analysis.real_sub_ldistrib(), @realax.real_mul_lid(), @analysis.real_mul_rid(), @realax.real_mul_assoc()]))
  let t18 = @simp.simp_tac(@list.List([@realax.real_mul_linv()]))
  let t17 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), @real.real_add_rdistrib(), @analysis.real_sub_rdistrib()]))
  let t15 = @tactics.accept_tac(@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(1)) → !(real_of_num(1) - x == real_of_num(0))")))
  let t16 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((x : Real) == real_of_num(1))")), t15)])
  let tac3 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) - (x : Real)"), real_mul_rtimes())), @tactics.conj_tac), t16), t17), t18), @tactics.disch_tac), t19), t20)
  let t21 = @tactics.then_tac(@tactics.then_tac(tac1, tac2), tac3)
  geometric_sum_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : Real, !(x == real_of_num(1)) → sum((m, n), (k : Num) => pow(x, k)) == (pow(x, m) - pow(x, m + n)) / (real_of_num(1) - x)"), t21))
}

///|
let geometric_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMETRIC_SUM")

///|
/// `GEOMETRIC_SUM`
pub fn geometric_sum() -> @kernel.Thm {
  geometric_sum_c.get()
}

///|
/// Jordan/real_ext_geom_series.ml:49
fn step_4() -> Unit raise {
  @parse_ext_override_interface.pop_priority(())
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
