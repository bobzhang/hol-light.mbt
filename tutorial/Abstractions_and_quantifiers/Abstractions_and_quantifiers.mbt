// Translated from upstream Tutorial/Abstractions_and_quantifiers.ml; edit this file directly.

///|
/// Tutorial/Abstractions_and_quantifiers.ml:1
fn step_1() -> Unit raise {
  ignore(@meson.meson(@list.List([]), @term_syntax.parse_term("((∃ x : _, ∀ y : _, (P : (_) -> Bool)(x) == P(y)) == ((∃ x : _, (Q : (_) -> Bool)(x)) == (∀ y : _, Q(y)))) == ((∃ x : _, ∀ y : _, Q(x) == Q(y)) == ((∃ x : _, P(x)) == (∀ y : _, P(y))))")))
}

///|
/// Tutorial/Abstractions_and_quantifiers.ml:5
fn step_2() -> Unit raise {
  ignore(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, ∀ z : _, (P : (_, _) -> Bool)(x, y) && P(y, z) → P(x, z)) && (∀ x : _, ∀ y : _, ∀ z : _, (Q : (_, _) -> Bool)(x, y) && Q(y, z) → Q(x, z)) && (∀ x : _, ∀ y : _, P(x, y) → P(y, x)) && (∀ x : _, ∀ y : _, P(x, y) || Q(x, y)) → (∀ x : _, ∀ y : _, P(x, y)) || (∀ x : _, ∀ y : _, Q(x, y))")))
}

///|
/// ewd1062
fn step_3() -> Unit raise {
  ewd1062_v1_c.set(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : Num, x <= x) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x <= y && y <= z → x <= z) && (∀ x : Num, ∀ y : Num, ((f : (Num) -> Num)(x) <= y) == (x <= (g : (Num) -> Num)(y))) → (∀ x : Num, ∀ y : Num, x <= y → f(x) <= f(y)) && (∀ x : Num, ∀ y : Num, x <= y → g(x) <= g(y))")))
}

///|
let ewd1062_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ewd1062")

///|
/// `ewd1062`
pub fn ewd1062_v1() -> @kernel.Thm {
  ewd1062_v1_c.get()
}

///|
/// ewd1062
fn step_4() -> Unit raise {
  ewd1062_c.set(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (R : (_, _) -> Bool)(x, x)) && (∀ x : _, ∀ y : _, ∀ z : _, R(x, y) && R(y, z) → R(x, z)) && (∀ x : _, ∀ y : _, R((f : (_) -> _)(x), y) == R(x, (g : (_) -> _)(y))) → (∀ x : _, ∀ y : _, R(x, y) → R(f(x), f(y))) && (∀ x : _, ∀ y : _, R(x, y) → R(g(x), g(y)))")))
}

///|
let ewd1062_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ewd1062")

///|
/// `ewd1062`
pub fn ewd1062() -> @kernel.Thm {
  ewd1062_c.get()
}

///|
/// Tutorial/Abstractions_and_quantifiers.ml:26
fn step_5() -> Unit raise {
  ignore(@meson.meson(@list.List([]), @term_syntax.parse_term("existsunique((x : _) => (g : (_) -> _)((f : (_) -> _)(x)) == x) == existsunique((y : _) => f(g(y)) == y)")))
}

///|
/// Tutorial/Abstractions_and_quantifiers.ml:28
fn step_6() -> Unit raise {
  ignore(@meson.meson(@list.List([@arith.add_assoc(), @arith.add_sym()]), @term_syntax.parse_term("(m : Num) + ((n : Num) + (p : Num)) == n + (m + p)")))
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
