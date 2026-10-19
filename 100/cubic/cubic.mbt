// Translated from upstream 100/cubic.ml; edit this file directly.

///|
/// 100/cubic.ml:7
fn step_1() -> Unit raise {
  @complexnumbers.prioritize_complex(())
}

///|
/// ccbrt
fn step_2() -> Unit raise {
  ccbrt_c.set(@pair.new_definition(@term_syntax.parse_term("(ccbrt : (Complex) -> Complex)((z : Complex)) == (if z == Cx(real_of_num(0)) { Cx(real_of_num(0)) } else { cexp(clog(z) / Cx(real_of_num(3))) })")))
}

///|
let ccbrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ccbrt")

///|
/// `ccbrt`
pub fn ccbrt() -> @kernel.Thm {
  ccbrt_c.get()
}

///|
/// CCBRT
fn step_3() -> Unit raise {
  let t6 = @simp.asm_simp_tac(@list.List([@complex_transc.cexp_clog()]))
  let t5 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_field(@term_syntax.parse_term("(z : Complex) / Cx(real_of_num(3)) + (z / Cx(real_of_num(3)) + z / Cx(real_of_num(3))) == z"))]))
  let t3 = @equal.gsym(@complex_transc.cexp_add())
  let t4 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_field(@term_syntax.parse_term("pow((z : Complex), 3) == z * (z * z)")), t3]))
  let t2 = @list.List([@tactics.conv_tac(@complexnumbers.complex_ring), @tactics.all_tac])
  let t1 = @simp.asm_rewrite_tac(@list.List([]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([ccbrt()]))), @class.cond_cases_tac), t1), t2), t4), t5), t6)
  ccbrt_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Complex, pow(ccbrt(z), 3) == z"), t7))
}

///|
let ccbrt_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CCBRT")

///|
/// `CCBRT`
pub fn ccbrt_v1() -> @kernel.Thm {
  ccbrt_v1_c.get()
}

///|
/// CUBIC_REDUCTION
fn step_4() -> Unit raise {
  cubic_reduction_c.set(@complexnumbers.complex_field(@term_syntax.parse_term("!((a : Complex) == Cx(real_of_num(0))) && (x : Complex) == (y : Complex) - (b : Complex) / (Cx(real_of_num(3)) * a) && (p : Complex) == (Cx(real_of_num(3)) * (a * (c : Complex)) - pow(b, 2)) / (Cx(real_of_num(9)) * pow(a, 2)) && (q : Complex) == (Cx(real_of_num(9)) * (a * (b * c)) - Cx(real_of_num(2)) * pow(b, 3) - Cx(real_of_num(27)) * (pow(a, 2) * (d : Complex))) / (Cx(real_of_num(54)) * pow(a, 3)) → (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d)) == Cx(real_of_num(0))) == (pow(y, 3) + (Cx(real_of_num(3)) * (p * y) - Cx(real_of_num(2)) * q) == Cx(real_of_num(0)))")))
}

///|
let cubic_reduction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC_REDUCTION")

///|
/// `CUBIC_REDUCTION`
pub fn cubic_reduction() -> @kernel.Thm {
  cubic_reduction_c.get()
}

///|
/// CUBIC_BASIC
fn step_5() -> Unit raise {
  cubic_basic_c.set(@complexnumbers.complex_field(@term_syntax.parse_term("∀ i : Complex, ∀ t : Complex, ∀ s : Complex, pow(s, 2) == pow((q : Complex), 2) + pow((p : Complex), 3) && pow((s1 : Complex), 3) == (if p == Cx(real_of_num(0)) { Cx(real_of_num(2)) * q } else { q + s }) && (s2 : Complex) == -s1 * ((Cx(real_of_num(1)) + i * t) / Cx(real_of_num(2))) && (s3 : Complex) == -s1 * ((Cx(real_of_num(1)) - i * t) / Cx(real_of_num(2))) && pow(i, 2) + Cx(real_of_num(1)) == Cx(real_of_num(0)) && pow(t, 2) == Cx(real_of_num(3)) → (if p == Cx(real_of_num(0)) { (pow((y : Complex), 3) + (Cx(real_of_num(3)) * (p * y) - Cx(real_of_num(2)) * q) == Cx(real_of_num(0))) == (y == s1 || y == s2 || y == s3) } else { !(s1 == Cx(real_of_num(0))) && (pow(y, 3) + (Cx(real_of_num(3)) * (p * y) - Cx(real_of_num(2)) * q) == Cx(real_of_num(0))) == (y == s1 - p / s1 || y == s2 - p / s2 || y == s3 - p / s3) })")))
}

///|
let cubic_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC_BASIC")

///|
/// `CUBIC_BASIC`
pub fn cubic_basic() -> @kernel.Thm {
  cubic_basic_c.get()
}

///|
/// CUBIC
fn step_6() -> Unit raise {
  let t29 = @meson.asm_meson_tac(@list.List([@complex_transc.csqrt_v1()]))
  let t28 = @tactics.conv_tac(@complexnumbers.complex_ring)
  let t30 = @tactics.then_tac(@tactics.mp_tac(@complexnumbers.complex_pow_ii_2()), t28)
  let t31 = @meson.asm_meson_tac(@list.List([ccbrt_v1()]))
  let t32 = @list.List([@meson.asm_meson_tac(@list.List([@complex_transc.csqrt_v1()])), t31, t30, t29])
  let t27 = @tactics.repeat_tac(@tactics.conj_tac)
  let t26 = @simp.asm_rewrite_tac(@list.List([]))
  let t23 = @term_syntax.parse_term("csqrt(pow((q : Complex), 2) + pow((p : Complex), 3))")
  let t24 = @term_syntax.parse_term("csqrt(Cx(real_of_num(3)))")
  let t25 = @tactics.map_every(fn(x20 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.exists_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  }, @list.List([@term_syntax.parse_term("ii"), t24, t23]))
  let t19 = @tactics.match_mp_tac(cubic_basic())
  let t18 = @simp.asm_rewrite_tac(@list.List([]))
  let t17 = @simp.once_rewrite_tac(@list.List([@complexnumbers.complex_ring(@term_syntax.parse_term("((x : Complex) == (a : Complex) - (b : Complex)) == (x + b == a)"))]))
  let t15 = @tactics.conv_tac(@complexnumbers.complex_ring)
  let t14 = @analysis.expand_tac("y")
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  let t16 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cubic_reduction()), t13), t14), t15), @tactics.all_tac])
  let t12 = @tactics.subgoal_then(@term_syntax.parse_term("((a : Complex) * pow((x : Complex), 3) + ((b : Complex) * pow(x, 2) + ((c : Complex) * x + (d : Complex))) == Cx(real_of_num(0))) == (pow((y : Complex), 3) + (Cx(real_of_num(3)) * ((p : Complex) * y) - Cx(real_of_num(2)) * (q : Complex)) == Cx(real_of_num(0)))"), fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s10 = @tactics.subst1_tac(x9)
    fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s10(x11)
    }
  })
  let t8 = @simp.abbrev_tac(@term_syntax.parse_term("(y : Complex) == (x : Complex) + (b : Complex) / (Cx(real_of_num(3)) * (a : Complex))"))
  let t33 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.repeat_tac(@pair.let_tac)), t8), t12), t16), t17), t18), t19), t25), t26), t27), t32)
  cubic_c.set(@tactics.prove(@term_syntax.parse_term("!((a : Complex) == Cx(real_of_num(0))) → LET((p : Complex) => (q : Complex) => LET_END(LET((s : Complex) => LET_END(LET((s1 : Complex) => LET_END(LET((s2 : Complex) => (s3 : Complex) => LET_END(if p == Cx(real_of_num(0)) { (a * pow((x : Complex), 3) + ((b : Complex) * pow(x, 2) + ((c : Complex) * x + (d : Complex))) == Cx(real_of_num(0))) == (x == s1 - b / (Cx(real_of_num(3)) * a) || x == s2 - b / (Cx(real_of_num(3)) * a) || x == s3 - b / (Cx(real_of_num(3)) * a)) } else { !(s1 == Cx(real_of_num(0))) && (a * pow(x, 3) + (b * pow(x, 2) + (c * x + d)) == Cx(real_of_num(0))) == (x == s1 - p / s1 - b / (Cx(real_of_num(3)) * a) || x == s2 - p / s2 - b / (Cx(real_of_num(3)) * a) || x == s3 - p / s3 - b / (Cx(real_of_num(3)) * a)) }), -s1 * ((Cx(real_of_num(1)) + ii * csqrt(Cx(real_of_num(3)))) / Cx(real_of_num(2))), -s1 * ((Cx(real_of_num(1)) - ii * csqrt(Cx(real_of_num(3)))) / Cx(real_of_num(2))))), if p == Cx(real_of_num(0)) { ccbrt(Cx(real_of_num(2)) * q) } else { ccbrt(q + s) })), csqrt(pow(q, 2) + pow(p, 3)))), (Cx(real_of_num(3)) * (a * c) - pow(b, 2)) / (Cx(real_of_num(9)) * pow(a, 2)), (Cx(real_of_num(9)) * (a * (b * c)) - Cx(real_of_num(2)) * pow(b, 3) - Cx(real_of_num(27)) * (pow(a, 2) * d)) / (Cx(real_of_num(54)) * pow(a, 3)))"), t33))
}

///|
let cubic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC")

///|
/// `CUBIC`
pub fn cubic() -> @kernel.Thm {
  cubic_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
}
