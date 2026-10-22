// Translated from upstream Tutorial/HOL_basics.ml; edit this file directly.

///|
/// Tutorial/HOL_basics.ml:1
fn step_1() -> Unit raise {
  ignore(@int.arith_rule(@term_syntax.parse_term("EXP((a : Num) * (x : Num) + ((b : Num) * (y : Num) + a * y), 3) + (EXP(b * x, 3) + (EXP(a * x + (b * y + b * x), 3) + EXP(a * y, 3))) == EXP(a * x + (a * y + b * x), 3) + (EXP(b * y, 3) + (EXP(a * y + (b * y + b * x), 3) + EXP(a * x, 3)))")))
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
