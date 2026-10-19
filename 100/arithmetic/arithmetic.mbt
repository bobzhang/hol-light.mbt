// Translated from upstream 100/arithmetic.ml; edit this file directly.

///|
/// ARITHMETIC_PROGRESSION_LEMMA
fn step_1() -> Unit raise {
  let t1 = @tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@iterate.nsum_clauses_numseg()]))), @int.arith_tac)
  arithmetic_progression_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, nsum(op_dot_dot(0, n), (i : Num) => (a : Num) + (d : Num) * i) == DIV((n + 1) * (2 * a + n * d), 2)"), t1))
}

///|
let arithmetic_progression_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITHMETIC_PROGRESSION_LEMMA")

///|
/// `ARITHMETIC_PROGRESSION_LEMMA`
pub fn arithmetic_progression_lemma() -> @kernel.Thm {
  arithmetic_progression_lemma_c.get()
}

///|
/// ARITHMETIC_PROGRESSION
fn step_2() -> Unit raise {
  let t2 = @tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([arithmetic_progression_lemma(), @arith.suc_sub1()]))), @int.arith_tac)
  arithmetic_progression_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → nsum(op_dot_dot(0, n - 1), (i : Num) => (a : Num) + (d : Num) * i) == DIV(n * (2 * a + (n - 1) * d), 2)"), t2))
}

///|
let arithmetic_progression_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITHMETIC_PROGRESSION")

///|
/// `ARITHMETIC_PROGRESSION`
pub fn arithmetic_progression() -> @kernel.Thm {
  arithmetic_progression_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
