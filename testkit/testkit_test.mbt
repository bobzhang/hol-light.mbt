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

///|
test "probe_counters prints what the probes that advance the counters print" {
  let peeked = @testkit.Log::new()
  peeked.capture_reports()
  peeked.probe_counters()
  let real = @testkit.Log::new()
  real.capture_reports()
  real.attempt("counter_tyvar", () => {
    @testkit.stm(@parser.parse_term("zz_counter"))
  })
  real.attempt("counter_genvar", () => {
    @testkit.stm(@basics.genvar(@kernel.bool_ty))
  })
  @testkit.release_output()
  assert_eq(peeked.contents(), real.contents())
  inspect(
    real.contents(),
    content=(
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?0
      #|counter_genvar = _0:bool
      #|
    ),
  )
}
