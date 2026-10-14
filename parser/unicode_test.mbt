// The Unicode spellings of symbols (not in upstream): the lexer gives the
// tokens of upstream's spelling, so everything after it is unchanged.

///|
/// Whether the two spellings are the same tokens.
fn same_tokens(unicode : String, ascii : String) -> Bool raise {
  @parser.lex(unicode) == @parser.lex(ascii)
}

///|
test "each symbol is upstream's token" {
  let ascii =
    #|!x. p x ==> ?y. q x y /\ ~ r y \/ (p y <=> q y x)
  assert_true(
    same_tokens(
      "∀x. p x ⇒ ∃y. q x y ∧ ¬r y ∨ (p y ⇔ q y x)", ascii,
    ),
  )
  assert_true(
    same_tokens("∀m n. m ≤ n ⇒ n ≥ m", "!m n. m <= n ==> n >= m"),
  )
  let ascii =
    #|\x. x + 1
  assert_true(same_tokens("λx. x + 1", ascii))
  debug_inspect(
    @parser.lex("λx. ¬(x ≤ 1)"),
    content=(
      #|<List:
      #|  [
      #|    Ident("\\"),
      #|    Ident("x"),
      #|    Resword("."),
      #|    Ident("~"),
      #|    Resword("("),
      #|    Ident("x"),
      #|    Ident("<="),
      #|    Ident("1"),
      #|    Resword(")"),
      #|  ]>
    ),
  )
}

///|
test "a symbol is a token by itself" {
  // upstream's symbols run together: `~~` and `/\~` are single tokens
  let ascii =
    #|~ ~p /\ ~ q
  assert_true(same_tokens("¬¬p∧¬q", ascii))
  assert_true(same_tokens("x≤y", "x <= y"))
  let run_together =
    #|~~p/\~q
  assert_false(same_tokens("¬¬p∧¬q", run_together))
}

///|
test "in a string literal a symbol is text" {
  let toks = @parser.lex("f \"∀\"")
  assert_eq(toks.length(), 2)
  assert_true(toks != @parser.lex("f \"!\""))
}

///|
test "other non-ASCII characters are unparsed, as upstream" {
  let r = try @parser.lex("x ∈ s") catch {
    Failure(m) => m
    e => e.to_string()
  } noraise {
    _ => "tokens"
  }
  inspect(
    r,
    content=(
      #|Unparsed input
    ),
  )
}
