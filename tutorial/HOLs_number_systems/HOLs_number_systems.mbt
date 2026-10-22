// Translated from upstream Tutorial/HOLs_number_systems.ml; edit this file directly.

///|
/// Tutorial/HOLs_number_systems.ml:1
fn step_1() -> Unit raise {
  ignore(@calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x) - abs(y) <= abs(x - y)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:3
fn step_2() -> Unit raise {
  ignore(@int.int_arith(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ a' : Int, ∀ b' : Int, ∀ D : Int, (pow(a, 2) - D * pow(b, 2)) * (pow(a', 2) - D * pow(b', 2)) == pow(a * a' + D * (b * b'), 2) - D * pow(a * b' + a' * b, 2)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:8
fn step_3() -> Unit raise {
  ignore(@calc_rat.real_arith(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, ∀ x5 : Real, ∀ x6 : Real, ∀ x7 : Real, ∀ x8 : Real, ∀ x9 : Real, ∀ x10 : Real, ∀ x11 : Real, x3 == abs(x2) - x1 && x4 == abs(x3) - x2 && x5 == abs(x4) - x3 && x6 == abs(x5) - x4 && x7 == abs(x6) - x5 && x8 == abs(x7) - x6 && x9 == abs(x8) - x7 && x10 == abs(x9) - x8 && x11 == abs(x10) - x9 → x1 == x10 && x2 == x11")))
}

///|
/// Tutorial/HOLs_number_systems.ml:21
fn step_4() -> Unit raise {
  ignore(@calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → x < (x + y) / real_of_num(2) && (x + y) / real_of_num(2) < y")))
}

///|
/// Tutorial/HOLs_number_systems.ml:23
fn step_5() -> Unit raise {
  ignore(@calc_rat.real_arith(@term_syntax.parse_term("pow(pow((x1 : Real), 2) + (pow((x2 : Real), 2) + (pow((x3 : Real), 2) + pow((x4 : Real), 2))), 2) == real_of_num(1) / real_of_num(6) * (pow(x1 + x2, 4) + (pow(x1 + x3, 4) + (pow(x1 + x4, 4) + (pow(x2 + x3, 4) + (pow(x2 + x4, 4) + pow(x3 + x4, 4)))))) + real_of_num(1) / real_of_num(6) * (pow(x1 - x2, 4) + (pow(x1 - x3, 4) + (pow(x1 - x4, 4) + (pow(x2 - x3, 4) + (pow(x2 - x4, 4) + pow(x3 - x4, 4))))))")))
}

///|
/// Tutorial/HOLs_number_systems.ml:30
fn step_6() -> Unit raise {
  ignore(@int.arith_rule(@term_syntax.parse_term("(x : Num) < 2 → 2 * x + 1 < 4")))
}

///|
/// Tutorial/HOLs_number_systems.ml:36
fn step_7() -> Unit raise {
  ignore(@int.arith_rule(@term_syntax.parse_term("(x : Num) < EXP(2, 30) → DIV(429496730 * x, EXP(2, 32)) == DIV(x, 10)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:50
fn step_8() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// Tutorial/HOLs_number_systems.ml:52
fn step_9() -> Unit raise {
  ignore(@calc_rat.real_ring(@term_syntax.parse_term("(s : Real) == ((a : Real) + ((b : Real) + (c : Real))) / real_of_num(2) → s * ((s - b) * (s - c)) + (s * ((s - c) * (s - a)) + (s * ((s - a) * (s - b)) - (s - a) * ((s - b) * (s - c)))) == a * (b * c)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:58
fn step_10() -> Unit raise {
  ignore(@calc_rat.real_ring(@term_syntax.parse_term("pow((a : Real), 2) == real_of_num(2) && pow((x : Real), 2) + (a * x + real_of_num(1)) == real_of_num(0) → pow(x, 4) + real_of_num(1) == real_of_num(0)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:60
fn step_11() -> Unit raise {
  ignore(@calc_rat.real_ring(@term_syntax.parse_term("(a : Real) * pow((x : Real), 2) + ((b : Real) * x + (c : Real)) == real_of_num(0) && a * pow((y : Real), 2) + (b * y + c) == real_of_num(0) && !(x == y) → a * (x * y) == c && a * (x + y) + b == real_of_num(0)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:66
fn step_12() -> Unit raise {
  ignore(@calc_rat.real_ring(@term_syntax.parse_term("(p : Real) == (real_of_num(3) * (a1 : Real) - pow((a2 : Real), 2)) / real_of_num(3) && (q : Real) == (real_of_num(9) * (a1 * a2) - real_of_num(27) * (a0 : Real) - real_of_num(2) * pow(a2, 3)) / real_of_num(27) && (x : Real) == (z : Real) + a2 / real_of_num(3) && x * (w : Real) == pow(w, 2) - p / real_of_num(3) → (pow(z, 3) + (a2 * pow(z, 2) + (a1 * z + a0)) == real_of_num(0)) == (if p == real_of_num(0) { pow(x, 3) == q } else { pow(pow(w, 3), 2) - q * pow(w, 3) - pow(p, 3) / real_of_num(27) == real_of_num(0) })")))
}

///|
/// Tutorial/HOLs_number_systems.ml:75
fn step_13() -> Unit raise {
  ignore(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(1) / x - real_of_num(1) / (real_of_num(1) + x) == real_of_num(1) / (x * (real_of_num(1) + x))")))
}

///|
/// Tutorial/HOLs_number_systems.ml:77
fn step_14() -> Unit raise {
  ignore(@calc_rat.real_field(@term_syntax.parse_term("pow((s : Real), 2) == pow((b : Real), 2) - real_of_num(4) * ((a : Real) * (c : Real)) → (a * pow((x : Real), 2) + (b * x + c) == real_of_num(0)) == (if a == real_of_num(0) { if b == real_of_num(0) { if c == real_of_num(0) { true } else { false } } else { x == -c / b } } else { x == (-b + s) / (real_of_num(2) * a) || x == (-b + -s) / (real_of_num(2) * a) })")))
}

///|
/// Tutorial/HOLs_number_systems.ml:120
fn step_15() -> Unit raise {
  ignore(@cooper.cooper_rule(@term_syntax.parse_term("ODD((n : Num)) → 2 * DIV(n, 2) < n")))
}

///|
/// Tutorial/HOLs_number_systems.ml:122
fn step_16() -> Unit raise {
  ignore(@cooper.cooper_rule(@term_syntax.parse_term("∀ n : Num, n >= 8 → (∃ a : Num, ∃ b : Num, n == 3 * a + 5 * b)")))
}

///|
/// Tutorial/HOLs_number_systems.ml:126
fn step_17() -> Unit raise {
  ignore(@rqe_main.real_qelim_conv(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → (∃ y : Real, pow(y, 2) == x)")))
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
