///|
test "∀ is the universal quantifier and round trips through the printer" {
  let term = @parser.parse_term("∀x:bool. x = x")
  let x = @kernel.mk_var("x", @kernel.bool_ty)
  assert_eq(term, @bool.mk_forall(x, @basics.mk_eq(x, x)))
  let printed = @printer.string_of_term(term)
  assert_true(printed.has_prefix("∀"))
  assert_eq(@parser.parse_term(printed), term)
  assert_true(@basics.is_forall(term))
  let (quantifier, _) = @kernel.dest_comb(term)
  assert_eq(@kernel.dest_const(quantifier).0, "∀")
  assert_true(@kernel.constants().any(entry => entry.0 == "∀"))
  assert_true(!@kernel.constants().any(entry => entry.0 == "!"))
  assert_true(@basics.is_uexists(@parser.parse_term("?!x:bool. x")))
  assert_true(!@printer.parses_as_binder("!"))
  assert_true(!@printer.parses_as_binder("forall"))
  assert_true(!@kernel.constants().any(entry => entry.0 == "forall"))
}

///|
test "legacy universal notation is rejected" {
  for
    source in [
      "!x:bool. x", "(!)", "!", "forall x:bool. x", "(forall)", "forall", "∀ x:bool. !y:bool. x = y",
    ] {
    try @parser.parse_term(source) catch {
      Failure(message) => assert_eq(message, "The universal binder is ∀")
      error => raise error
    } noraise {
      _ => fail("legacy notation was accepted: " + source)
    }
  }
  for spelling in ["!", "forall"] {
    try @parser.parse_preterm([Ident(spelling)]) catch {
      @parser.Noparse => ()
      error => raise error
    } noraise {
      _ => fail("legacy token was accepted")
    }
  }
}

///|
test "∀ remains available when verbose aliases are disabled" {
  errdefer @bool.set_verbose_symbols()
  @bool.unset_verbose_symbols()
  let term = @parser.parse_term("∀x:bool. x = x")
  let printed = @printer.string_of_term(term)
  assert_true(printed.has_prefix("∀"))
  assert_eq(@parser.parse_term(printed), term)
  @bool.set_verbose_symbols()
}

///|
test "canonical ∀ preserves the quantifier's precedence in term ordering" {
  let quantifier = @kernel.mk_const("∀", @list.List([]))
  for (name, _) in @kernel.constants() {
    let constant = @kernel.mk_const(name, @list.List([]))
    if name == "∀" {
      assert_eq(quantifier.compare(constant), 0)
    } else {
      assert_true(quantifier.compare(constant) < 0)
      assert_true(constant.compare(quantifier) > 0)
      assert_true(@kernel.alphaorder(quantifier, constant) < 0)
    }
  }
  // Ordinary strings and variable names still use lexical ordering.
  assert_true(@kernel.compare_string("∀", "T") > 0)
  assert_true(
    @kernel.mk_var("∀", @kernel.bool_ty).compare(
      @kernel.mk_var("T", @kernel.bool_ty),
    ) >
    0,
  )
}
