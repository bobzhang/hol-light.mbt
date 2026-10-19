// Translated from upstream 100/quartic.ml; edit this file directly.

///|
/// 100/quartic.ml:1
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// QUARTIC_1
fn step_2() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_rat.real_ring)
  quartic_1_v1_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && R == real_of_num(0) && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s && (x : Real) == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t1))
}

///|
let quartic_1_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_1")

///|
/// `QUARTIC_1`
pub fn quartic_1_v1() -> @kernel.Thm {
  quartic_1_v1_c.get()
}

///|
/// QUARTIC_2
fn step_3() -> Unit raise {
  let t2 = @tactics.conv_tac(@calc_rat.real_ring)
  quartic_2_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && R == real_of_num(0) && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s && (x : Real) == -a / real_of_num(4) + (R / real_of_num(2) - D / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t2))
}

///|
let quartic_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_2")

///|
/// `QUARTIC_2`
pub fn quartic_2() -> @kernel.Thm {
  quartic_2_c.get()
}

///|
/// QUARTIC_3
fn step_4() -> Unit raise {
  let t3 = @tactics.conv_tac(@calc_rat.real_ring)
  quartic_3_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && R == real_of_num(0) && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((E : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b - real_of_num(2) * s && (x : Real) == -a / real_of_num(4) - R / real_of_num(2) + E / real_of_num(2) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t3))
}

///|
let quartic_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_3")

///|
/// `QUARTIC_3`
pub fn quartic_3() -> @kernel.Thm {
  quartic_3_c.get()
}

///|
/// QUARTIC_4
fn step_5() -> Unit raise {
  let t4 = @tactics.conv_tac(@calc_rat.real_ring)
  quartic_4_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && R == real_of_num(0) && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((E : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b - real_of_num(2) * s && (x : Real) == -a / real_of_num(4) - R / real_of_num(2) - E / real_of_num(2) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t4))
}

///|
let quartic_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_4")

///|
/// `QUARTIC_4`
pub fn quartic_4() -> @kernel.Thm {
  quartic_4_c.get()
}

///|
/// QUARTIC_1'
fn step_6() -> Unit raise {
  let t5 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_1_p_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && !(R == real_of_num(0)) && pow((D : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) && (x : Real) == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t5))
}

///|
let quartic_1_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_1'")

///|
/// `QUARTIC_1'`
pub fn quartic_1_p() -> @kernel.Thm {
  quartic_1_p_c.get()
}

///|
/// QUARTIC_2'
fn step_7() -> Unit raise {
  let t6 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_2_p_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && !(R == real_of_num(0)) && pow((D : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) && (x : Real) == -a / real_of_num(4) + (R / real_of_num(2) - D / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t6))
}

///|
let quartic_2_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_2'")

///|
/// `QUARTIC_2'`
pub fn quartic_2_p() -> @kernel.Thm {
  quartic_2_p_c.get()
}

///|
/// QUARTIC_3'
fn step_8() -> Unit raise {
  let t7 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_3_p_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && !(R == real_of_num(0)) && pow((E : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b - (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) && (x : Real) == -a / real_of_num(4) - R / real_of_num(2) + E / real_of_num(2) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t7))
}

///|
let quartic_3_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_3'")

///|
/// `QUARTIC_3'`
pub fn quartic_3_p() -> @kernel.Thm {
  quartic_3_p_c.get()
}

///|
/// QUARTIC_4'
fn step_9() -> Unit raise {
  let t8 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_4_p_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && !(R == real_of_num(0)) && pow((E : Real), 2) == real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b - (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) && (x : Real) == -a / real_of_num(4) - R / real_of_num(2) - E / real_of_num(2) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t8))
}

///|
let quartic_4_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_4'")

///|
/// `QUARTIC_4'`
pub fn quartic_4_p() -> @kernel.Thm {
  quartic_4_p_c.get()
}

///|
/// QUARTIC_1
fn step_10() -> Unit raise {
  let t9 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_1_v2_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && (x : Real) == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t9))
}

///|
let quartic_1_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_1")

///|
/// `QUARTIC_1`
pub fn quartic_1_v2() -> @kernel.Thm {
  quartic_1_v2_c.get()
}

///|
/// QUARTIC_1
fn step_11() -> Unit raise {
  let t10 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_1_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && pow((E : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b - real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b - (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && ((x : Real) == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) || x == -a / real_of_num(4) - R / real_of_num(2) + E / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t10))
}

///|
let quartic_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_1")

///|
/// `QUARTIC_1`
pub fn quartic_1() -> @kernel.Thm {
  quartic_1_c.get()
}

///|
/// QUARTIC_CASES
fn step_12() -> Unit raise {
  let t15 = @tactics.conv_tac(@calc_rat.real_field)
  let t14 = @tactics.pop_assum(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = @tactics.mp_tac(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  })
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t14), t15)
  quartic_cases_v1_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && pow((E : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b - real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b - (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && ((x : Real) == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) || x == -a / real_of_num(4) + (R / real_of_num(2) - D / real_of_num(2)) || x == -a / real_of_num(4) - R / real_of_num(2) + E / real_of_num(2) || x == -a / real_of_num(4) - R / real_of_num(2) - E / real_of_num(2)) → pow(x, 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)"), t16))
}

///|
let quartic_cases_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_CASES")

///|
/// `QUARTIC_CASES`
pub fn quartic_cases_v1() -> @kernel.Thm {
  quartic_cases_v1_c.get()
}

///|
/// QUARTIC_CASES
fn step_13() -> Unit raise {
  let t21 = @tactics.conv_tac(@calc_rat.real_field)
  let t20 = @tactics.pop_assum(fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s18 = @tactics.mp_tac(x17)
    fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s18(x19)
    }
  })
  let t22 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t20), t21)
  quartic_cases_v2_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && pow((E : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b - real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b - (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) → (pow((x : Real), 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)) == (x == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) || x == -a / real_of_num(4) + (R / real_of_num(2) - D / real_of_num(2)) || x == -a / real_of_num(4) - R / real_of_num(2) + E / real_of_num(2) || x == -a / real_of_num(4) - R / real_of_num(2) - E / real_of_num(2))"), t22))
}

///|
let quartic_cases_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_CASES")

///|
/// `QUARTIC_CASES`
pub fn quartic_cases_v2() -> @kernel.Thm {
  quartic_cases_v2_c.get()
}

///|
/// QUARTIC_CASES
fn step_14() -> Unit raise {
  let t23 = @tactics.conv_tac(@calc_rat.real_field)
  quartic_cases_c.set(@tactics.prove(@term_syntax.parse_term("pow((y : Real), 3) - (b : Real) * pow(y, 2) + (((a : Real) * (c : Real) - real_of_num(4) * (d : Real)) * y - pow(a, 2) * d + (real_of_num(4) * (b * d) - pow(c, 2))) == real_of_num(0) && pow((R : Real), 2) == pow(a, 2) / real_of_num(4) - b + y && pow((s : Real), 2) == pow(y, 2) - real_of_num(4) * d && pow((D : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b + real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b + (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) && pow((E : Real), 2) == (if R == real_of_num(0) { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - real_of_num(2) * b - real_of_num(2) * s } else { real_of_num(3) * (pow(a, 2) / real_of_num(4)) - pow(R, 2) - real_of_num(2) * b - (real_of_num(4) * (a * b) - real_of_num(8) * c - pow(a, 3)) / (real_of_num(4) * R) }) → (pow((x : Real), 4) + (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d))) == real_of_num(0)) == (x == -a / real_of_num(4) + (R / real_of_num(2) + D / real_of_num(2)) || x == -a / real_of_num(4) + (R / real_of_num(2) - D / real_of_num(2)) || x == -a / real_of_num(4) - R / real_of_num(2) + E / real_of_num(2) || x == -a / real_of_num(4) - R / real_of_num(2) - E / real_of_num(2))"), t23))
}

///|
let quartic_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUARTIC_CASES")

///|
/// `QUARTIC_CASES`
pub fn quartic_cases() -> @kernel.Thm {
  quartic_cases_c.get()
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
}
