///|
fn check_local_keywords() -> Unit raise {
  for word in ["assume", "proof", "thus", "by", "be", "endcase"] {
    assert_false(@lexer.is_reserved_word(word))
    assert_eq(@lexer.lex(word), [@lexer.Ident(word)])
    assert_eq(@kernel.dest_var(@parser.parse_term(word + " : bool")).0, word)
  }
  let goal = @parser.parse_term("forall p:bool. p ==> p")
  ignore(@tactics.g(goal))
  ignore(@mizar.parse_term_v1("let p be bool; assume h:p; thus p by h; end"))
  let proof = @tactics.top_thm()
  assert_true(@kernel.hyp(proof).is_empty())
  assert_true(@basics.aconv(@kernel.concl(proof), goal))
  // The token entry point accepts ordinary HOL lexer output, including slices.
  ignore(@tactics.g(goal))
  let tokens = @lexer.lex("unused let p be bool; assume h:p; thus p by h; end")
  ignore(@mizar.run_steps(tokens[1:]))
  assert_true(@basics.aconv(@kernel.concl(@tactics.top_thm()), goal))
  assert_eq(tokens[6], @lexer.Ident("assume"))
  ignore(@tactics.g(goal))
  try @mizar.parse_term_v1("assume ;") catch {
    _ => ()
  } noraise {
    _ => fail("expected invalid proof syntax to fail")
  }
}
