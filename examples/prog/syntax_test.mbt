///|
fn check_explicit_program_syntax() -> Unit raise {
  for word in ["var", "end", "skip", "abort", ":=", "while", "do"] {
    assert_false(@printer.is_reserved_word(word))
    assert_eq(@lexer.lex(word), [Ident(word)])
  }
  for word in ["if", "then", "else"] {
    assert_true(@printer.is_reserved_word(word))
  }
  assert_eq(
    @prog.parse_program_term("var x:num; x := x end"),
    @parser.parse_term("Assign (\\x:num. x)"),
  )
  assert_eq(
    @prog.parse_program_assertion_term("correct T var x:num; skip end T"),
    @parser.parse_term("correct (\\x:num. T) SKIP (\\x:num. T)"),
  )
  for input in ["var x:num; skip end trailing", "var x:num; while end"] {
    try @prog.parse_program_term(input) catch {
      _ => ()
    } noraise {
      _ => fail("expected invalid program to fail: " + input)
    }
  }
  for word in ["var", "end", "skip", "abort", ":=", "while", "do"] {
    assert_false(@printer.is_reserved_word(word))
  }
  // Loading this package no longer intercepts ordinary applications of correct.
  assert_eq(
    @parser.parse_term("correct (p:num->bool) SKIP q"),
    @parser.parse_term("correct (p:num->bool) (SKIP) q"),
  )
}
