// Translated from upstream Examples/bitblast_generic.ml; edit this file directly.

///|
/// Examples/bitblast_generic.ml:11
fn step_1() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ z : Word[N], ∀ c : Word[N], word_and(c, word(1)) == word(0) → word_xor(word_and(z, c), word_or(c, word(1))) == word_neg(word_or(z, word_not(c)))")))
}

///|
/// Examples/bitblast_generic.ml:17
fn step_2() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ z : Word[N], ∀ c : Word[N], (word_xor(word_and(z, c), word_or(c, word(1))) == word_neg(word_or(z, word_not(c)))) == (word_and(c, word(1)) == word(0))")))
}

///|
/// Examples/bitblast_generic.ml:23
fn step_3() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ z : Word[N], ∀ c : Word[N], word_add(word_xor(word_or(z, word_not(c)), c), word(1)) == word_neg(word_and(z, c))")))
}

///|
/// Examples/bitblast_generic.ml:28
fn step_4() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ z : Word[N], ∀ c : Word[N], word_add(word_xor(word_and(z, c), c), word(1)) == word_neg(word_or(z, word_not(c)))")))
}

///|
/// Examples/bitblast_generic.ml:33
fn step_5() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_add(word_add(x, word(1)), word_not(y)) == word_sub(x, y)")))
}

///|
/// Examples/bitblast_generic.ml:38
fn step_6() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_add(word_not(x), word_not(y)) == word_sub(word_sub(word(0), word(2)), word_add(x, y))")))
}

///|
/// Examples/bitblast_generic.ml:43
fn step_7() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ c1 : Word[N], ∀ c2 : Word[N], c2 == word_neg(c1) → word_add(word_or(x, c2), c1) == word_xor(word_or(x, c2), c2)")))
}

///|
/// Examples/bitblast_generic.ml:48
fn step_8() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ c1 : Word[N], ∀ c2 : Word[N], word_and(c2, word_sub(c2, word(1))) == word(0) && word_and(c1, word_sub(c2, word(1))) == word(0) && !(word_and(c1, c2) == word(0)) → word_and(word_add(x, c1), c2) == word_xor(word_and(x, c2), c2)")))
}

///|
/// Examples/bitblast_generic.ml:55
fn step_9() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_and(word_not(x), word_sub(x, word(1))) == word_not(word_or(x, word_neg(x)))")))
}

///|
/// Examples/bitblast_generic.ml:60
fn step_10() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], (word_and(x, word_not(word(1))) == word(0)) == (x == word(0) || x == word(1))")))
}

///|
/// Examples/bitblast_generic.ml:64
fn step_11() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("word_xor((x : Word[S]), (y : Word[S])) == word_sub(word_or(x, y), word_and(x, y))")))
}

///|
/// Examples/bitblast_generic.ml:67
fn step_12() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("word_add((x : Word[M]), (y : Word[M])) == word_sub(word_shl(word_or(x, y), 1), word_xor(x, y))")))
}

///|
/// Examples/bitblast_generic.ml:70
fn step_13() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[R], (word_and(x, word_sub(x, word(1))) == word(0) && word_and(x, word_not(word(1))) == word(0)) == (x == word(0) || x == word(1))")))
}

///|
/// Examples/bitblast_generic.ml:79
fn step_14() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ b : Word[N], ∀ x : Word[N], !(b == word(0)) && word_shl(b, 1) == word(0) → !(x == word(0)) == (word_and(b, word_or(x, word_neg(x))) == b)")))
}

///|
/// Examples/bitblast_generic.ml:84
fn step_15() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ b : Word[N], ∀ x : Word[N], !(b == word(0)) && word_shl(b, 1) == word(0) → (x == word(0)) == (word_and(b, word_or(x, word_neg(x))) == word(0))")))
}

///|
/// Examples/bitblast_generic.ml:89
fn step_16() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ b : Word[N], ∀ c : Word[N], !(b == word(0)) && word_shl(b, 1) == word(0) && word_add(c, word(1)) == word_not(c) && !(c == word_not(word(0))) → b == word_not(c)")))
}

///|
/// Examples/bitblast_generic.ml:98
fn step_17() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ m : Word[N], ∀ x : Word[N], m == word_neg(word_and((b : Word[N]), word(1))) → word_sub(word_xor(x, m), m) == word_xor(word_add(x, m), m)")))
}

///|
/// Examples/bitblast_generic.ml:106
fn step_18() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_and(word(3), word_shl(x, 2)) == word(0)")))
}

///|
/// Examples/bitblast_generic.ml:113
fn step_19() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_and(word(3), word_mul(word(5), x)) == word_and(x, word(3))")))
}

///|
/// Examples/bitblast_generic.ml:121
fn step_20() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[R], ∀ y : Word[R], (word_xor(x, word_ushr(x, 1)) == word_xor(y, word_ushr(y, 1))) == (x == y)")))
}

///|
/// Examples/bitblast_generic.ml:125
fn step_21() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[M], word_and(word_xor(word_add(word_ushr(x, 2), word_ushr(x, 2)), word_ushr(x, 1)), word_not(word(1))) == word(0)")))
}

///|
/// Examples/bitblast_generic.ml:134
fn step_22() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_add(word_and(x, y), word_ushr(word_xor(x, y), 1)) == word_add(word_add(word_ushr(x, 1), word_ushr(y, 1)), word_and(word(1), word_and(x, y)))")))
}

///|
/// Examples/bitblast_generic.ml:143
fn step_23() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], word_ule(x, y) && word_ule(y, z) → word_ule(x, z)")))
}

///|
/// Examples/bitblast_generic.ml:147
fn step_24() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], word_ule(x, y) && word_ult(y, z) → word_ugt(z, x)")))
}

///|
/// Examples/bitblast_generic.ml:151
fn step_25() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], word_ile(x, y) && word_ile(y, z) → word_ile(x, z)")))
}

///|
/// Examples/bitblast_generic.ml:155
fn step_26() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], ∀ z : Word[N], word_ile(x, y) && word_ilt(y, z) → word_igt(z, x)")))
}

///|
/// Examples/bitblast_generic.ml:159
fn step_27() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_ushr(word_shl(x, 1), 1) == x && word_ushr(word_shl(y, 1), 1) == y → word_ule(x, y) == word_ile(x, y)")))
}

///|
/// Examples/bitblast_generic.ml:165
fn step_28() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_ule(word_and(x, y), x)")))
}

///|
/// Examples/bitblast_generic.ml:168
fn step_29() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_ule(word_xor(x, y), word_or(x, y))")))
}

///|
/// Examples/bitblast_generic.ml:175
fn step_30() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_not(word_or(x, word_neg(x))) == word_sub(word_and(x, word_neg(x)), word(1))")))
}

///|
/// Examples/bitblast_generic.ml:179
fn step_31() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_and(word_add(word_or(x, word_sub(x, word(1))), word(1)), x) == word_and(word_add(word_and(x, word_neg(x)), x), x)")))
}

///|
/// Examples/bitblast_generic.ml:183
fn step_32() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_not(word_add(x, (y : Word[N]))) == word_sub(word_not(x), y)")))
}

///|
/// Examples/bitblast_generic.ml:186
fn step_33() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_or(x, y) == word_add(word_and(x, word_not(y)), y)")))
}

///|
/// Examples/bitblast_generic.ml:189
fn step_34() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_sub(x, y) == word_sub(word_mul(word(2), word_and(x, word_not(y))), word_xor(x, y))")))
}

///|
/// Examples/bitblast_generic.ml:194
fn step_35() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_ilt(x, y) == !(word_and(word_INT_MIN, word_sub(word_sub(word_ishr(x, 1), word_ishr(y, 1)), word_and(word_and(word_not(x), y), word(1)))) == word(0))")))
}

///|
/// Examples/bitblast_generic.ml:202
fn step_36() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], word_ult(x, y) == !(word_and(word_INT_MIN, word_sub(word_sub(word_ushr(x, 1), word_ushr(y, 1)), word_and(word_and(word_not(x), y), word(1)))) == word(0))")))
}

///|
/// Examples/bitblast_generic.ml:210
fn step_37() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], !(x == word(0)) == (ival(word_or(x, word_neg(x))) < int_of_num(0))")))
}

///|
/// Examples/bitblast_generic.ml:213
fn step_38() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], ∀ y : Word[N], (x == y) == (ival(word_or(word_sub(x, y), word_sub(y, x))) >= int_of_num(0))")))
}

///|
/// Examples/bitblast_generic.ml:216
fn step_39() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_igt(x, word(0)) == (ival(word_sub(word_ishr(x, 1), x)) < int_of_num(0))")))
}

///|
/// Examples/bitblast_generic.ml:220
fn step_40() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ x : Word[N], word_igt(x, word(0)) == (ival(word_and(word_neg(x), word_not(x))) < int_of_num(0))")))
}

///|
/// Examples/bitblast_generic.ml:228
fn step_41() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ a : Word[N], ∀ b : Word[N], ∀ x : Word[N], word_ile(a, b) → (word_ile(a, x) && word_ile(x, b)) == word_ule(word_sub(x, a), word_sub(b, a))")))
}

///|
/// Examples/bitblast_generic.ml:234
fn step_42() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("∀ a : Word[N], ∀ b : Word[N], ∀ x : Word[N], word_ile(a, b) → (word_ile(a, x) && word_ilt(x, b)) == word_ult(word_sub(x, a), word_sub(b, a))")))
}

///|
/// Examples/bitblast_generic.ml:244
fn step_43() -> Unit raise {
  ignore(@lib.time(@word_automata.word_auto_rule, @term_syntax.parse_term("(val : (Word[N]) -> Num)((x : Word[N])) < (val : (Word[N]) -> Num)((word : (Num) -> Word[N])(64)) → (word_sub : (Word[N], Word[N]) -> Word[N])((word : (Num) -> Word[N])(63), x) == (word_xor : (Word[N], Word[N]) -> Word[N])(x, (word : (Num) -> Word[N])(63))")))
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
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
}
