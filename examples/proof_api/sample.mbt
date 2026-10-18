///|
fn all(
  vars : ArrayView[@kernel.Term],
  body : @kernel.Term,
) -> @kernel.Term raise {
  @bool.list_mk_forall(@list.List(vars), body)
}

///|
/// Port of upstream miz3/Samples/sample.ml. For a reflexive, transitive
/// relation R on naturals, respecting <= is equivalent to R n (SUC n).
/// All propositions use checked term builders; no proof or term strings.
pub fn relation_successors() -> @kernel.Thm raise {
  let nat = @kernel.mk_type("num", @list.List([]))
  let r = @kernel.mk_var(
    "R",
    @basics.mk_fun_ty(nat, @basics.mk_fun_ty(nat, @kernel.bool_ty)),
  )
  let x = @kernel.mk_var("x", nat)
  let y = @kernel.mk_var("y", nat)
  let z = @kernel.mk_var("z", nat)
  let m = @kernel.mk_var("m", nat)
  let n = @kernel.mk_var("n", nat)
  let d = @kernel.mk_var("d", nat)
  let zero = @nums.mk_small_numeral(0L)
  let plus = @kernel.mk_const("+", @list.List([]))
  let successor = @kernel.mk_const("SUC", @list.List([]))
  let less_equal = @kernel.mk_const("<=", @list.List([]))
  fn rel(a : @kernel.Term, b : @kernel.Term) -> @kernel.Term raise {
    @basics.mk_binop(r, a, b)
  }
  fn add(a : @kernel.Term, b : @kernel.Term) -> @kernel.Term raise {
    @basics.mk_binop(plus, a, b)
  }
  fn suc(a : @kernel.Term) -> @kernel.Term raise {
    @kernel.mk_comb(successor, a)
  }
  fn le(a : @kernel.Term, b : @kernel.Term) -> @kernel.Term raise {
    @basics.mk_binop(less_equal, a, b)
  }
  let reflexivity = all([x], rel(x, x))
  let transitivity = all(
    [x, y, z],
    @bool.mk_imp(@bool.mk_conj(rel(x, y), rel(y, z)), rel(x, z)),
  )
  let ordered = all([m, n], @bool.mk_imp(le(m, n), rel(m, n)))
  let successors = all([n], rel(n, suc(n)))
  let reflexive = @kernel.assume_rule(reflexivity)
  let transitive = @kernel.assume_rule(transitivity)

  // Backward direction: extend R m m one successor at a time.
  let backward = {
    let successive = @kernel.assume_rule(successors)
    let step = @proof.by(
      all([d], @bool.mk_imp(rel(m, add(m, d)), rel(m, add(m, suc(d))))),
      [transitive, successive, @arith.add_clauses()],
    )
    let base = @proof.by(rel(m, add(m, zero)), [reflexive, @arith.add_clauses()])
    let induction = @proof.by(
      all([d], rel(m, add(m, d))),
      [base, step],
      first=@nums.induct_tac,
    )
    let distances = @bool.gen(m, induction)
    let respects_order = @proof.by(ordered, [distances, @arith.le_exists()])
    @bool.disch(successors, respects_order)
  }

  // Forward direction: every natural number is <= its successor.
  let successor_order = @proof.by(all([n], le(n, suc(n))), [])
  let forward = @proof.by(@bool.mk_imp(ordered, successors), [successor_order])
  let equivalence = @bool.imp_antisym_rule(forward, backward)
  @bool.gen(r, @bool.disch(reflexivity, @bool.disch(transitivity, equivalence)))
}
