///|
fn check_explicit_bitmatch_syntax() -> Unit raise {
  for word in ["BITPAT", "bitmatch"] {
    assert_false(@printer.is_reserved_word(word))
    assert_eq(@lexer.lex(word), [Ident(word)])
  }
  for
    (source, ordinary) in [
      ("BITPAT []", "NILPAT"),
      ("BITPAT [T; F]", "CONSPAT (CONSPAT NILPAT (word1 T)) (word1 F)"),
      ("BITPAT [0b10:2]", "CONSPAT NILPAT (word 2:2 word)"),
    ] {
    let term = @bitmatch.parse_bitpat(source)
    assert_eq(term, @parser.parse_term(ordinary))
    assert_eq(@bitmatch.parse_bitpat(@bitmatch.string_of_bitpat(term)), term)
    assert_eq(@bitmatch.parse_bitpat("((" + source + "))"), term)
  }
  // Use a monomorphic scrutinee: the existing printer omits type annotations.
  let source = "bitmatch (word1 T) with [T] -> T | _ -> F"
  let term = @bitmatch.parse_bitmatch(source)
  assert_true(
    @basics.aconv(
      @bitmatch.parse_bitmatch(@bitmatch.string_of_bitmatch(term)),
      term,
    ),
  )
  assert_true(
    @basics.aconv(@bitmatch.parse_bitmatch("((" + source + "))"), term),
  )
  for source in ["BITPAT", "BITPAT [", "(BITPAT [T]", "(BITPAT [T]) trailing"] {
    try @bitmatch.parse_bitpat(source) catch {
      _ => ()
    } noraise {
      _ => fail("expected invalid bit pattern to fail: " + source)
    }
  }
  for
    source in [
      "bitmatch",
      "bitmatch (word 0:2 word) with [T; F] ->",
      "(" + source + ") trailing",
      "(" + source,
      "bitmatch (word 0:2 word) with [T; F] -> (BITPAT [T])",
    ] {
    try @bitmatch.parse_bitmatch(source) catch {
      _ => ()
    } noraise {
      _ => fail("expected invalid bit match to fail: " + source)
    }
  }
  for word in ["BITPAT", "bitmatch"] {
    assert_false(@printer.is_reserved_word(word))
    // No installed callback intercepts an ordinary variable with this name.
    assert_eq(
      @parser.parse_term(word + ":bool"),
      @kernel.mk_var(word, @kernel.bool_ty),
    )
  }
}
