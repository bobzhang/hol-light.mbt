///|
fn check_explicit_ntrie_syntax() -> Unit raise {
  @ntrie.load()
  assert_false(@printer.is_reserved_word("%%"))
  assert_eq(@lexer.lex("%%(0)"), [
    Ident("%%"),
    Resword("("),
    Ident("0"),
    Resword(")"),
  ])
  assert_eq(@ntrie.parse_ntrie("%%()"), @parser.parse_term("NTRIE NEMPTY"))
  assert_eq(@ntrie.parse_ntrie("%%(0)"), @parser.parse_term("NTRIE NZERO"))
  assert_eq(
    @ntrie.parse_ntrie("%%(1)"),
    @parser.parse_term("NTRIE (NNODE NEMPTY NZERO)"),
  )
  let term = @ntrie.parse_ntrie("%%(0 1 2 2)")
  assert_eq(@ntrie.parse_ntrie(@printer.string_of_term(term)), term)
  assert_eq(@ntrie.parse_ntrie("%%(0 1 2)"), term)
  let tokens = @lexer.lex("%%(0) trailing")
  let (_, rest) = @ntrie.preparse_ntrie(tokens)
  assert_eq(rest, tokens[4:])
  assert_eq(rest.start_offset(), 4)
  for input in ["%%(0) trailing", "%%(", "%%(x)"] {
    try @ntrie.parse_ntrie(input) catch {
      _ => ()
    } noraise {
      _ => fail("expected invalid ntrie input to fail: " + input)
    }
  }
  // The same spelling is ordinary HOL function application outside this API.
  let ordinary = @parser.parse_term("%%(0)")
  assert_true(@kernel.frees(ordinary).any(v => v is @kernel.Var("%%", _)))
}
