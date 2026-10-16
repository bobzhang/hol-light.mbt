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
