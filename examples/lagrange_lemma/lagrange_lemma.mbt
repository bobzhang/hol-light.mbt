// Translated from upstream Examples/lagrange_lemma.ml; edit this file directly.

///|
/// Examples/lagrange_lemma.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// LAGRANGE_4
fn step_2() -> Unit raise {
  let t2 = @tactics.conv_tac(@calc_rat.real_ring)
  lagrange_4_v1_c.set(@lib.time(fn(x1 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x1.0, x1.1)
  }, (@term_syntax.parse_term("(pow((x1 : Real), 2) + (pow((x2 : Real), 2) + (pow((x3 : Real), 2) + pow((x4 : Real), 2)))) * (pow((y1 : Real), 2) + (pow((y2 : Real), 2) + (pow((y3 : Real), 2) + pow((y4 : Real), 2)))) == pow(x1 * y1 - x2 * y2 - x3 * y3 - x4 * y4, 2) + (pow(x1 * y2 + x2 * y1 + x3 * y4 - x4 * y3, 2) + (pow(x1 * y3 - x2 * y4 + x3 * y1 + x4 * y2, 2) + pow(x1 * y4 + x2 * y3 - x3 * y2 + x4 * y1, 2)))"), t2)))
}

///|
let lagrange_4_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_4")

///|
/// `LAGRANGE_4`
pub fn lagrange_4_v1() -> @kernel.Thm {
  lagrange_4_v1_c.get()
}

///|
/// LAGRANGE_8
fn step_3() -> Unit raise {
  let t4 = @tactics.conv_tac(@calc_rat.real_ring)
  lagrange_8_v1_c.set(@lib.time(fn(x3 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x3.0, x3.1)
  }, (@term_syntax.parse_term("(pow((p1 : Real), 2) + (pow((q1 : Real), 2) + (pow((r1 : Real), 2) + (pow((s1 : Real), 2) + (pow((t1 : Real), 2) + (pow((u1 : Real), 2) + (pow((v1 : Real), 2) + pow((w1 : Real), 2)))))))) * (pow((p2 : Real), 2) + (pow((q2 : Real), 2) + (pow((r2 : Real), 2) + (pow((s2 : Real), 2) + (pow((t2 : Real), 2) + (pow((u2 : Real), 2) + (pow((v2 : Real), 2) + pow((w2 : Real), 2)))))))) == pow(p1 * p2 - q1 * q2 - r1 * r2 - s1 * s2 - t1 * t2 - u1 * u2 - v1 * v2 - w1 * w2, 2) + (pow(p1 * q2 + (q1 * p2 + (r1 * s2 - s1 * r2 + (t1 * u2 - u1 * t2 - v1 * w2 + w1 * v2))), 2) + (pow(p1 * r2 - q1 * s2 + (r1 * p2 + (s1 * q2 + (t1 * v2 + (u1 * w2 - v1 * t2 - w1 * u2)))), 2) + (pow(p1 * s2 + (q1 * r2 - r1 * q2 + (s1 * p2 + (t1 * w2 - u1 * v2 + (v1 * u2 - w1 * t2)))), 2) + (pow(p1 * t2 - q1 * u2 - r1 * v2 - s1 * w2 + (t1 * p2 + (u1 * q2 + (v1 * r2 + w1 * s2))), 2) + (pow(p1 * u2 + (q1 * t2 - r1 * w2 + (s1 * v2 - t1 * q2 + (u1 * p2 - v1 * s2 + w1 * r2))), 2) + (pow(p1 * v2 + (q1 * w2 + (r1 * t2 - s1 * u2 - t1 * r2 + (u1 * s2 + (v1 * p2 - w1 * q2)))), 2) + pow(p1 * w2 - q1 * v2 + (r1 * u2 + (s1 * t2 - t1 * s2 - u1 * r2 + (v1 * q2 + w1 * p2))), 2)))))))"), t4)))
}

///|
let lagrange_8_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_8")

///|
/// `LAGRANGE_8`
pub fn lagrange_8_v1() -> @kernel.Thm {
  lagrange_8_v1_c.get()
}

///|
/// LAGRANGE_4
fn step_4() -> Unit raise {
  lagrange_4_v2_c.set(@lib.time(fn(x5 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x5.0, x5.1)
  }, (@term_syntax.parse_term("(pow((x1 : Real), 2) + (pow((x2 : Real), 2) + (pow((x3 : Real), 2) + pow((x4 : Real), 2)))) * (pow((y1 : Real), 2) + (pow((y2 : Real), 2) + (pow((y3 : Real), 2) + pow((y4 : Real), 2)))) == pow(x1 * y1 - x2 * y2 - x3 * y3 - x4 * y4, 2) + (pow(x1 * y2 + x2 * y1 + x3 * y4 - x4 * y3, 2) + (pow(x1 * y3 - x2 * y4 + x3 * y1 + x4 * y2, 2) + pow(x1 * y4 + x2 * y3 - x3 * y2 + x4 * y1, 2)))"), @calc_rat.real_arith_tac)))
}

///|
let lagrange_4_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_4")

///|
/// `LAGRANGE_4`
pub fn lagrange_4_v2() -> @kernel.Thm {
  lagrange_4_v2_c.get()
}

///|
/// LAGRANGE_8
fn step_5() -> Unit raise {
  lagrange_8_v2_c.set(@lib.time(fn(x6 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x6.0, x6.1)
  }, (@term_syntax.parse_term("(pow((p1 : Real), 2) + (pow((q1 : Real), 2) + (pow((r1 : Real), 2) + (pow((s1 : Real), 2) + (pow((t1 : Real), 2) + (pow((u1 : Real), 2) + (pow((v1 : Real), 2) + pow((w1 : Real), 2)))))))) * (pow((p2 : Real), 2) + (pow((q2 : Real), 2) + (pow((r2 : Real), 2) + (pow((s2 : Real), 2) + (pow((t2 : Real), 2) + (pow((u2 : Real), 2) + (pow((v2 : Real), 2) + pow((w2 : Real), 2)))))))) == pow(p1 * p2 - q1 * q2 - r1 * r2 - s1 * s2 - t1 * t2 - u1 * u2 - v1 * v2 - w1 * w2, 2) + (pow(p1 * q2 + (q1 * p2 + (r1 * s2 - s1 * r2 + (t1 * u2 - u1 * t2 - v1 * w2 + w1 * v2))), 2) + (pow(p1 * r2 - q1 * s2 + (r1 * p2 + (s1 * q2 + (t1 * v2 + (u1 * w2 - v1 * t2 - w1 * u2)))), 2) + (pow(p1 * s2 + (q1 * r2 - r1 * q2 + (s1 * p2 + (t1 * w2 - u1 * v2 + (v1 * u2 - w1 * t2)))), 2) + (pow(p1 * t2 - q1 * u2 - r1 * v2 - s1 * w2 + (t1 * p2 + (u1 * q2 + (v1 * r2 + w1 * s2))), 2) + (pow(p1 * u2 + (q1 * t2 - r1 * w2 + (s1 * v2 - t1 * q2 + (u1 * p2 - v1 * s2 + w1 * r2))), 2) + (pow(p1 * v2 + (q1 * w2 + (r1 * t2 - s1 * u2 - t1 * r2 + (u1 * s2 + (v1 * p2 - w1 * q2)))), 2) + pow(p1 * w2 - q1 * v2 + (r1 * u2 + (s1 * t2 - t1 * s2 - u1 * r2 + (v1 * q2 + w1 * p2))), 2)))))))"), @calc_rat.real_arith_tac)))
}

///|
let lagrange_8_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_8")

///|
/// `LAGRANGE_8`
pub fn lagrange_8_v2() -> @kernel.Thm {
  lagrange_8_v2_c.get()
}

///|
/// LAGRANGE_4
fn step_6() -> Unit raise {
  let t8 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) == (b : Real) - (c : Real)) == (a + c == b)"))
  let t9 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) == (c : Real)) == (a == b + c)"))
  let t10 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) - (c : Real) == a - (b + c)"))
  let t11 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) + (c : Real) == a + c - b"))
  let t12 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - ((b : Real) - (c : Real)) == a + (c - b)"))
  let t13 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_add_ldistrib(), @real.real_add_rdistrib(), @real.real_sub_ldistrib(), @real.real_sub_rdistrib(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) - (c : Real)) == a + b - c")), t12, t11, t10, t9, t8, @calc_int.real_add_ac(), @real.real_mul_ac()]))
  lagrange_4_c.set(@lib.time(fn(x7 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x7.0, x7.1)
  }, (@term_syntax.parse_term("(pow((x1 : Real), 2) + (pow((x2 : Real), 2) + (pow((x3 : Real), 2) + pow((x4 : Real), 2)))) * (pow((y1 : Real), 2) + (pow((y2 : Real), 2) + (pow((y3 : Real), 2) + pow((y4 : Real), 2)))) == pow(x1 * y1 - x2 * y2 - x3 * y3 - x4 * y4, 2) + (pow(x1 * y2 + x2 * y1 + x3 * y4 - x4 * y3, 2) + (pow(x1 * y3 - x2 * y4 + x3 * y1 + x4 * y2, 2) + pow(x1 * y4 + x2 * y3 - x3 * y2 + x4 * y1, 2)))"), t13)))
}

///|
let lagrange_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_4")

///|
/// `LAGRANGE_4`
pub fn lagrange_4() -> @kernel.Thm {
  lagrange_4_c.get()
}

///|
/// LAGRANGE_8
fn step_7() -> Unit raise {
  let t15 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) == (b : Real) - (c : Real)) == (a + c == b)"))
  let t16 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) == (c : Real)) == (a == b + c)"))
  let t17 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) - (c : Real) == a - (b + c)"))
  let t18 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) + (c : Real) == a + c - b"))
  let t19 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - ((b : Real) - (c : Real)) == a + (c - b)"))
  let t20 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_add_ldistrib(), @real.real_add_rdistrib(), @real.real_sub_ldistrib(), @real.real_sub_rdistrib(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) - (c : Real)) == a + b - c")), t19, t18, t17, t16, t15, @calc_int.real_add_ac(), @real.real_mul_ac()]))
  lagrange_8_c.set(@lib.time(fn(x14 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x14.0, x14.1)
  }, (@term_syntax.parse_term("(pow((p1 : Real), 2) + (pow((q1 : Real), 2) + (pow((r1 : Real), 2) + (pow((s1 : Real), 2) + (pow((t1 : Real), 2) + (pow((u1 : Real), 2) + (pow((v1 : Real), 2) + pow((w1 : Real), 2)))))))) * (pow((p2 : Real), 2) + (pow((q2 : Real), 2) + (pow((r2 : Real), 2) + (pow((s2 : Real), 2) + (pow((t2 : Real), 2) + (pow((u2 : Real), 2) + (pow((v2 : Real), 2) + pow((w2 : Real), 2)))))))) == pow(p1 * p2 - q1 * q2 - r1 * r2 - s1 * s2 - t1 * t2 - u1 * u2 - v1 * v2 - w1 * w2, 2) + (pow(p1 * q2 + (q1 * p2 + (r1 * s2 - s1 * r2 + (t1 * u2 - u1 * t2 - v1 * w2 + w1 * v2))), 2) + (pow(p1 * r2 - q1 * s2 + (r1 * p2 + (s1 * q2 + (t1 * v2 + (u1 * w2 - v1 * t2 - w1 * u2)))), 2) + (pow(p1 * s2 + (q1 * r2 - r1 * q2 + (s1 * p2 + (t1 * w2 - u1 * v2 + (v1 * u2 - w1 * t2)))), 2) + (pow(p1 * t2 - q1 * u2 - r1 * v2 - s1 * w2 + (t1 * p2 + (u1 * q2 + (v1 * r2 + w1 * s2))), 2) + (pow(p1 * u2 + (q1 * t2 - r1 * w2 + (s1 * v2 - t1 * q2 + (u1 * p2 - v1 * s2 + w1 * r2))), 2) + (pow(p1 * v2 + (q1 * w2 + (r1 * t2 - s1 * u2 - t1 * r2 + (u1 * s2 + (v1 * p2 - w1 * q2)))), 2) + pow(p1 * w2 - q1 * v2 + (r1 * u2 + (s1 * t2 - t1 * s2 - u1 * r2 + (v1 * q2 + w1 * p2))), 2)))))))"), t20)))
}

///|
let lagrange_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_8")

///|
/// `LAGRANGE_8`
pub fn lagrange_8() -> @kernel.Thm {
  lagrange_8_c.get()
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
}
