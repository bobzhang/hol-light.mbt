// Translated from upstream Complex/quelim_examples.ml; edit this file directly.

///|
/// th
fn step_1() -> Unit raise {
  let t2 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v1_c.set(@lib.time(fn(x1 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x1.0, x1.1)
  }, (@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, pow(x, 2) == Cx(real_of_num(2)) && pow(y, 2) == Cx(real_of_num(3)) → pow(x * y, 2) == Cx(real_of_num(6))"), t2)))
}

///|
let th_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v1() -> @kernel.Thm {
  th_v1_c.get()
}

///|
/// th
fn step_2() -> Unit raise {
  let t4 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v2_c.set(@lib.time(fn(x3 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x3.0, x3.1)
  }, (@term_syntax.parse_term("∀ x : Complex, ∀ a : Complex, pow(a, 2) == Cx(real_of_num(2)) && pow(x, 2) + (a * x + Cx(real_of_num(1))) == Cx(real_of_num(0)) → pow(x, 4) + Cx(real_of_num(1)) == Cx(real_of_num(0))"), t4)))
}

///|
let th_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v2() -> @kernel.Thm {
  th_v2_c.get()
}

///|
/// th
fn step_3() -> Unit raise {
  let t6 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v3_c.set(@lib.time(fn(x5 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x5.0, x5.1)
  }, (@term_syntax.parse_term("∀ a : Complex, ∀ x : Complex, pow(a, 2) == Cx(real_of_num(2)) && pow(x, 2) + (a * x + Cx(real_of_num(1))) == Cx(real_of_num(0)) → pow(x, 4) + Cx(real_of_num(1)) == Cx(real_of_num(0))"), t6)))
}

///|
let th_v3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v3() -> @kernel.Thm {
  th_v3_c.get()
}

///|
/// th
fn step_4() -> Unit raise {
  let t8 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v4_c.set(@lib.time(fn(x7 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x7.0, x7.1)
  }, (@term_syntax.parse_term("!(∃ a : Complex, ∃ x : Complex, ∃ y : Complex, pow(a, 2) == Cx(real_of_num(2)) && pow(x, 2) + (a * x + Cx(real_of_num(1))) == Cx(real_of_num(0)) && y * (pow(x, 4) + Cx(real_of_num(1))) + Cx(real_of_num(1)) == Cx(real_of_num(0)))"), t8)))
}

///|
let th_v4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v4() -> @kernel.Thm {
  th_v4_c.get()
}

///|
/// th
fn step_5() -> Unit raise {
  let t10 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v5_c.set(@lib.time(fn(x9 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x9.0, x9.1)
  }, (@term_syntax.parse_term("∀ x : Complex, ∃ y : Complex, pow(x, 2) == pow(y, 3)"), t10)))
}

///|
let th_v5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v5() -> @kernel.Thm {
  th_v5_c.get()
}

///|
/// th
fn step_6() -> Unit raise {
  let t12 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v6_c.set(@lib.time(fn(x11 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x11.0, x11.1)
  }, (@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ z : Complex, ∀ a : Complex, ∀ b : Complex, (a + b) * (x - y + z) - (a - b) * (x + (y + z)) == Cx(real_of_num(2)) * (b * x + (b * z - a * y))"), t12)))
}

///|
let th_v6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v6() -> @kernel.Thm {
  th_v6_c.get()
}

///|
/// th
fn step_7() -> Unit raise {
  let t14 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v7_c.set(@lib.time(fn(x13 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x13.0, x13.1)
  }, (@term_syntax.parse_term("∀ a : Complex, ∀ b : Complex, !(a == b) → (∃ x : Complex, ∃ y : Complex, y * pow(x, 2) == a && y * pow(x, 2) + x == b)"), t14)))
}

///|
let th_v7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v7() -> @kernel.Thm {
  th_v7_c.get()
}

///|
/// th
fn step_8() -> Unit raise {
  let t16 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v8_c.set(@lib.time(fn(x15 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x15.0, x15.1)
  }, (@term_syntax.parse_term("∀ a : Complex, ∀ b : Complex, ∀ c : Complex, ∀ x : Complex, ∀ y : Complex, a * pow(x, 2) + (b * x + c) == Cx(real_of_num(0)) && a * pow(y, 2) + (b * y + c) == Cx(real_of_num(0)) && !(x == y) → a * (x * y) == c && a * (x + y) + b == Cx(real_of_num(0))"), t16)))
}

///|
let th_v8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v8() -> @kernel.Thm {
  th_v8_c.get()
}

///|
/// th
fn step_9() -> Unit raise {
  let t18 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v9_c.set(@lib.time(fn(x17 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x17.0, x17.1)
  }, (@term_syntax.parse_term("!(∀ a : Complex, ∀ b : Complex, ∀ c : Complex, ∀ x : Complex, ∀ y : Complex, a * pow(x, 2) + (b * x + c) == Cx(real_of_num(0)) && a * pow(y, 2) + (b * y + c) == Cx(real_of_num(0)) → a * (x * y) == c && a * (x + y) + b == Cx(real_of_num(0)))"), t18)))
}

///|
let th_v9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v9() -> @kernel.Thm {
  th_v9_c.get()
}

///|
/// th
fn step_10() -> Unit raise {
  let t20 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v10_c.set(@lib.time(fn(x19 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x19.0, x19.1)
  }, (@term_syntax.parse_term("∀ y_1 : Complex, ∀ y_2 : Complex, ∀ y_3 : Complex, ∀ y_4 : Complex, y_1 == Cx(real_of_num(2)) * y_3 && y_2 == Cx(real_of_num(2)) * y_4 && y_1 * y_3 == y_2 * y_4 → pow(y_1, 2) == pow(y_2, 2)"), t20)))
}

///|
let th_v10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v10() -> @kernel.Thm {
  th_v10_c.get()
}

///|
/// th
fn step_11() -> Unit raise {
  let t22 = @tactics.conv_tac(@quelim.full_complex_quelim_conv)
  th_v11_c.set(@lib.time(fn(x21 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x21.0, x21.1)
  }, (@term_syntax.parse_term("∀ a1 : Complex, ∀ b1 : Complex, ∀ c1 : Complex, ∀ a2 : Complex, ∀ b2 : Complex, ∀ c2 : Complex, !(a1 * b2 == a2 * b1) → (∃ x : Complex, ∃ y : Complex, a1 * x + b1 * y == c1 && a2 * x + b2 * y == c2)"), t22)))
}

///|
let th_v11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th_v11() -> @kernel.Thm {
  th_v11_c.get()
}

///|
/// th
fn step_12() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t37 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_pow_2(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_mul_lzero()]))
  let t36 = @simp.asm_rewrite_tac(@list.List([]))
  let t35 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Complex) == Cx(real_of_num(0))"))
  let t34 = @simp.asm_rewrite_tac(@list.List([]))
  let t33 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Complex) == Cx(real_of_num(0))"))
  let t32 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t31 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_entire(), @complexnumbers.complex_sub_0(), @complexnumbers.cx_inj()]))
  let t30 = @simp.once_rewrite_tac(@list.List([@cpoly.simple_complex_arith(@term_syntax.parse_term("(b : Complex) * (b * Cx(real_of_num(1))) + (a : Complex) * ((c : Complex) * Cx(-real_of_num(4))) == Cx(-real_of_num(1)) * (Cx(real_of_num(4)) * (a * c) - b * b)"))]))
  let t29 = @simp.once_rewrite_tac(@list.List([@cpoly.simple_complex_arith(@term_syntax.parse_term("(b : Complex) * (b * (b * Cx(-real_of_num(1)))) + (a : Complex) * (b * ((c : Complex) * Cx(real_of_num(4)))) == b * (Cx(real_of_num(4)) * (a * c) - b * b)"))]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@cpoly.simple_complex_arith(@term_syntax.parse_term("(b : Complex) * (b * ((c : Complex) * Cx(-real_of_num(1)))) + (a : Complex) * (c * (c * Cx(real_of_num(4)))) == c * (Cx(real_of_num(4)) * (a * c) - b * b)"))])), t29), t30), t31), t32), t33), t34), t35), t36), t37), t38)
  let t28 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_mul_lzero(), @complexnumbers.complex_mul_rzero()]))
  let t40 = @list.List([@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(b : Complex) == Cx(real_of_num(0))")), t28), t39])
  let t27 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_mul_lzero(), @complexnumbers.complex_mul_rzero()]))
  let t26 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Complex) == Cx(real_of_num(0))"))
  let t25 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_entire(), @complexnumbers.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith()]))
  let t24 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_lid(), @complexnumbers.complex_add_rid()]))
  let t41 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.land_conv(@quelim.full_complex_quelim_conv)), t24), t25), t26), t27), t40)
  th_c.set(@lib.time(fn(x23 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x23.0, x23.1)
  }, (@term_syntax.parse_term("(∃ x : Complex, ∃ y : Complex, (a : Complex) * pow(x, 2) + ((b : Complex) * x + (c : Complex)) == Cx(real_of_num(0)) && a * pow(y, 2) + (b * y + c) == Cx(real_of_num(0)) && !(x == y)) == (a == Cx(real_of_num(0)) && b == Cx(real_of_num(0)) && c == Cx(real_of_num(0)) || !(a == Cx(real_of_num(0))) && !(pow(b, 2) == Cx(real_of_num(4)) * (a * c)))"), t41)))
}

///|
let th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("th")

///|
/// `th`
pub fn th() -> @kernel.Thm {
  th_c.get()
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
}
