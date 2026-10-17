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
test "view alternatives backtrack without undoing parser actions" {
  let tokens : Array[@lexer.Lexcode] = [Ident("a"), Ident("b"), Ident("c")]
  let actions : Array[String] = []
  let first = @parser.seq(
    @parser.map(@parser.a(@lexer.Ident("a")), token => {
      actions.push("first")
      token
    }),
    @parser.a(@lexer.Ident("missing")),
  )
  let second = @parser.seq(
    @parser.map(@parser.a(@lexer.Ident("a")), token => {
      actions.push("second")
      token
    }),
    @parser.a(@lexer.Ident("b")),
  )
  let (parsed, rest) = @parser.alt(first, second)(tokens[:])
  assert_eq(parsed, (Ident("a"), Ident("b")))
  assert_eq(rest, tokens[2:])
  assert_eq(rest.start_offset(), 2)
  assert_eq(actions, ["first", "second"])
  assert_eq(tokens, [Ident("a"), Ident("b"), Ident("c")])
}

///|
test "view alternatives propagate hard errors" {
  let mut tried_alternative = false
  let parser = @parser.alt(@parser.fix("b", @parser.a(@lexer.Ident("b"))), input => {
    tried_alternative = true
    @parser.a(@lexer.Ident("a"))(input)
  })
  let failed = try {
    ignore(parser([Ident("a")]))
    false
  } catch {
    Failure(message) => {
      assert_eq(message, "b expected")
      true
    }
    e => raise e
  }
  assert_true(failed)
  assert_false(tried_alternative)
}
