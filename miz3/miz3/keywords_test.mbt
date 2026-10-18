///|
fn check_local_keywords() -> Unit raise {
  for word in ["assume", "proof", "qed", "thus", "by", "be"] {
    assert_false(@lexer.is_reserved_word(word))
    assert_eq(@lexer.lex(word), [@lexer.Ident(word)])
    let term = @parser.parse_term(word + " : bool")
    assert_eq(@kernel.dest_var(term).0, word)
    let tokens = @miz3.lex2(word).to_array()
    assert_eq(tokens.length(), 1)
    assert_eq(tokens[0].1, @lexer.Resword(word))
  }
  let proof = @miz3.thm_of_string("let p be bool; assume p; thus p;")
  assert_true(@kernel.hyp(proof).is_empty())
  assert_true(
    @basics.aconv(
      @kernel.concl(proof),
      @parser.parse_term("forall p:bool. p ==> p"),
    ),
  )
  // A malformed proof must not alter the HOL lexer either.
  try @miz3.thm_of_string("let ;") catch {
    _ => ()
  } noraise {
    _ => fail("expected an invalid proof to fail")
  }
}
