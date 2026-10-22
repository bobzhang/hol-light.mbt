// Translated from upstream Tutorial/Propositional_logic.ml; edit this file directly.

///|
/// Tutorial/Propositional_logic.ml:1
fn step_1() -> Unit raise {
  ignore(@class.taut(@term_syntax.parse_term("(!(input_a : Bool) → (internal : Bool) == true) && (!(input_b : Bool) → (output : Bool) == internal) && (input_a → output == false) && (input_b → output == false) → output == !(input_a || input_b)")))
}

///|
/// Tutorial/Propositional_logic.ml:8
fn step_2() -> Unit raise {
  ignore(@class.taut(@term_syntax.parse_term("((i1 : Bool) && (i2 : Bool)) == (a : Bool) && (i1 && (i3 : Bool)) == (b : Bool) && (i2 && i3) == (c : Bool) && (i1 && c) == (d : Bool) && ((m : Bool) && (r : Bool)) == (e : Bool) && (m && (w : Bool)) == (f : Bool) && ((n : Bool) && w) == (g : Bool) && ((p : Bool) && w) == (h : Bool) && ((q : Bool) && w) == (i : Bool) && ((s : Bool) && (x : Bool)) == (j : Bool) && ((t : Bool) && x) == (k : Bool) && ((v : Bool) && x) == (l : Bool) && (i1 || i2) == m && (i1 || i3) == n && (i1 || q) == p && (i2 || i3) == q && (i3 || a) == r && (a || w) == s && (b || w) == t && (d || h) == (u : Bool) && (c || w) == v && !e == w && !u == x && (i || l) == (o1 : Bool) && (g || k) == (o2 : Bool) && (f || j) == (o3 : Bool) → o1 == !i1 && o2 == !i2 && o3 == !i3")))
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
