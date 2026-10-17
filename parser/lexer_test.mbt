///|
test "parser consumes lexer tokens" {
  let (term, rest) = @parser.parse_preterm(@lexer.lex("f x"))
  assert_true(term is @preterm.Combp(Varp("f", _), Varp("x", _)))
  assert_true(rest.is_empty())
}

///|
test "parser uses lexer comment configuration" {
  let saved = @lexer.comment_token.val
  fn restore() {
    @lexer.comment_token.val = saved
  }
  errdefer restore()
  @lexer.comment_token.val = Ident("!")
  assert_eq(@parser.parse_type("A ! ignored"), @parser.parse_type("A"))
  restore()
}

///|
test "parser returns a remainder view into the original token array" {
  let tokens = @lexer.lex("before f x ; after")
  let (term, rest) = @parser.parse_preterm(tokens[1:])
  assert_true(term is @preterm.Combp(Varp("f", _), Varp("x", _)))
  assert_eq(rest, tokens[3:])
  assert_eq(rest.start_offset(), 3)
  assert_eq(tokens.length(), 5)
}

///|
test "custom parser backtracks on parserutil Noparse and propagates hard errors" {
  let name = "parserutil error integration"
  let mut called = false
  let mut hard_error = false
  @parser.install_parser(name, _ => {
    called = true
    if hard_error {
      raise Failure("custom parser failed")
    }
    raise @parserutil.Noparse
  })
  errdefer @parser.delete_parser(name)
  let (term, rest) = @parser.parse_preterm(@lexer.lex("f x"))
  assert_true(called)
  assert_true(term is @preterm.Combp(Varp("f", _), Varp("x", _)))
  assert_true(rest.is_empty())
  hard_error = true
  try @parser.parse_preterm(@lexer.lex("f x")) catch {
    Failure(message) => assert_eq(message, "custom parser failed")
    e => raise e
  } noraise {
    _ => fail("expected a hard error from the custom parser")
  }
  @parser.delete_parser(name)
}
