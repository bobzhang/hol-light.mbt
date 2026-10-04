///|
test "check_axioms rejects an axiom that is not upstream's" {
  // nothing asserted yet
  @testkit.check_axioms()
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  let _ = @kernel.new_axiom(p)
  try @testkit.check_axioms() catch {
    e =>
      inspect(
        e,
        content=(
          #|Failure(check_axioms: unexpected axiom |- p:bool)
        ),
      )
  } noraise {
    _ => fail("an unknown axiom was accepted")
  }
}
