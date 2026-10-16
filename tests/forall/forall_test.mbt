///|
test "forall is the universal quantifier and round trips through the printer" {
  let term = @parser.parse_term("forall x:bool. x = x")
  let x = @kernel.mk_var("x", @kernel.bool_ty)
  assert_eq(term, @bool.mk_forall(x, @basics.mk_eq(x, x)))
  let printed = @printer.string_of_term(term)
  assert_true(printed.has_prefix("forall "))
  assert_eq(@parser.parse_term(printed), term)
  assert_true(@basics.is_forall(term))
  let (quantifier, _) = @kernel.dest_comb(term)
  assert_eq(@kernel.dest_const(quantifier).0, "forall")
  assert_true(@kernel.constants().any(entry => entry.0 == "forall"))
  assert_true(!@kernel.constants().any(entry => entry.0 == "!"))
  assert_true(@basics.is_uexists(@parser.parse_term("?!x:bool. x")))
  assert_true(!@printer.parses_as_binder("!"))
}

///|
test "legacy universal notation is rejected" {
  for source in ["!x:bool. x", "(!)", "!", "forall x:bool. !y:bool. x = y"] {
    try @parser.parse_term(source) catch {
      Failure(message) =>
        assert_eq(message, "'!' notation has been removed; use 'forall'")
      error => raise error
    } noraise {
      _ => fail("legacy notation was accepted: " + source)
    }
  }
  try @parser.parse_preterm([Ident("!")]) catch {
    @parser.Noparse => ()
    error => raise error
  } noraise {
    _ => fail("legacy token was accepted")
  }
}

///|
test "forall remains available when verbose aliases are disabled" {
  errdefer @bool.set_verbose_symbols()
  @bool.unset_verbose_symbols()
  let term = @parser.parse_term("forall x:bool. x = x")
  let printed = @printer.string_of_term(term)
  assert_true(printed.has_prefix("forall "))
  assert_eq(@parser.parse_term(printed), term)
  @bool.set_verbose_symbols()
}
