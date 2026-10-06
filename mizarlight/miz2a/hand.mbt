// `let sketch_prover = K CHEAT_TAC` (miz2a.ml, line 46): OCaml leaves the
// type of the argument it ignores open until duality.ml uses the prover at
// `thm list`; a MoonBit value has that type from the start.

///|
/// `sketch_prover`
pub fn sketch_prover(_thl : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  g => @tactics.cheat_tac(g)
}
