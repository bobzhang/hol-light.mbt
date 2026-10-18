///|
test "named facts, slices, and explicit hypothesis discharge" {
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  let q = @kernel.mk_var("q", @kernel.bool_ty)
  let implication = @bool.mk_imp(p, q)
  let premise = @kernel.assume_rule(p)
  let rule = @kernel.assume_rule(implication)
  let unused = @kernel.assume_rule(@kernel.mk_var("unused", @kernel.bool_ty))
  let facts = [unused, premise, rule]
  let derived = @proof.by(q, facts[1:])
  assert_eq(@kernel.concl(derived), q)
  assert_eq(@kernel.hyp(derived).length(), 2)
  assert_true(@kernel.hyp(derived).contains(p))
  assert_true(@kernel.hyp(derived).contains(implication))
  let closed = @bool.disch(p, @bool.disch(implication, derived))
  assert_true(@kernel.hyp(closed).is_empty())
  assert_true(
    @basics.aconv(
      @kernel.concl(closed),
      @bool.mk_imp(p, @bool.mk_imp(implication, q)),
    ),
  )
}

///|
test "explicit tactics cannot introduce unsupplied hypotheses" {
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  let assumed = @kernel.assume_rule(p)
  try @proof.by(p, [], first=@tactics.accept_tac(assumed)) catch {
    Failure(_) => ()
    e => raise e
  } noraise {
    _ => fail("a proof step must not silently introduce assumptions")
  }
  let allowed = @proof.by(p, [assumed], first=@tactics.accept_tac(assumed))
  assert_eq(@kernel.concl(allowed), p)
  assert_eq(@kernel.hyp(allowed), @kernel.hyp(assumed))
}

///|
test "tactic failure propagates instead of admitting a goal" {
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  try @proof.by(p, [], first=_ => raise Failure("unfinished step")) catch {
    Failure(message) => assert_eq(message, "unfinished step")
    e => raise e
  } noraise {
    _ => fail("an unfinished step must fail")
  }
}

///|
test "check the requested conclusion and normalize bound variable names" {
  let x = @kernel.mk_var("x", @kernel.bool_ty)
  let y = @kernel.mk_var("y", @kernel.bool_ty)
  let identity = @proof.by(@bool.mk_imp(x, x), [])
  assert_true(@kernel.hyp(identity).is_empty())
  // Tactics are ordinary functions and can mistakenly ignore their goal.
  let wrong : @tactics.Tactic = _ => {
    @tactics.accept_tac(identity)((@list.List([]), @kernel.concl(identity)))
  }
  try @proof.by(y, [], first=wrong) catch {
    Failure(message) =>
      assert_eq(
        message, "proof.by: justification proved a different proposition",
      )
    e => raise e
  } noraise {
    _ => fail("a theorem of a different proposition must be rejected")
  }
  let universal = @bool.gen(x, identity)
  let renamed = @bool.mk_forall(y, @bool.mk_imp(y, y))
  let result = @proof.by(renamed, [], first=@tactics.accept_tac(universal))
  assert_eq(@kernel.concl(result), renamed)
  assert_true(@kernel.hyp(result).is_empty())
}

///|
test "a tactic cannot change the supplied facts through an array alias" {
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  let q = @kernel.mk_var("q", @kernel.bool_ty)
  let assumed = @kernel.assume_rule(p)
  let facts = [@kernel.assume_rule(q)]
  let mutate : @tactics.Tactic = goal => {
    facts[0] = assumed
    @tactics.accept_tac(assumed)(goal)
  }
  try @proof.by(p, facts, first=mutate) catch {
    Failure(message) =>
      assert_eq(message, "proof.by: unexpected hypothesis in result")
    e => raise e
  } noraise {
    _ => fail("hypotheses must be checked against the original facts")
  }
}
