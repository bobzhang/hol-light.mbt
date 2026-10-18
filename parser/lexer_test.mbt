///|
test "parser consumes lexer tokens" {
  let (term, rest) = @parser.parse_preterm(@lexer.lex("f x"))
  assert_true(term is @preterm.Combp(Varp("f", _), Varp("x", _)))
  assert_true(rest.is_empty())
}

///|
test "line comments are fixed lexer syntax" {
  assert_eq(@parser.parse_type("A // ignored"), @parser.parse_type("A"))
  assert_true(@lexer.is_reserved_word("//"))
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
