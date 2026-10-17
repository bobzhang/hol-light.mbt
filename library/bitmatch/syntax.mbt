///|
/// Recognize domain keywords without modifying the shared keyword table.
fn lex_bitmatch(source : String) -> Array[@lexer.Lexcode] raise {
  @lexer.lex(source).map(token => {
    match token {
      Ident("BITPAT" | "bitmatch" as word) => Resword(word)
      _ => token
    }
  })
}

///|
/// Accept the enclosing parentheses emitted by the domain pretty-printers.
fn parse_bitmatch_parens(
  tokens : ArrayView[@lexer.Lexcode],
  parse : (ArrayView[@lexer.Lexcode]) -> (
    @preterm.Preterm,
    ArrayView[@lexer.Lexcode],
  ) raise,
) -> (@preterm.Preterm, ArrayView[@lexer.Lexcode]) raise {
  match tokens {
    [Resword("("), .. rest] => {
      let (term, rest) = parse_bitmatch_parens(rest, parse)
      match rest {
        [Resword(")"), .. rest] => (term, rest)
        _ => raise Failure("Missing closing parenthesis in bit syntax")
      }
    }
    _ => parse(tokens)
  }
}

///|
fn parse_bitmatch_with(
  source : String,
  parse : (ArrayView[@lexer.Lexcode]) -> (
    @preterm.Preterm,
    ArrayView[@lexer.Lexcode],
  ) raise,
) -> @kernel.Term raise {
  let (preterm, rest) = parse_bitmatch_parens(lex_bitmatch(source), parse)
  guard rest.is_empty() else {
    raise Failure("Unparsed input following bit syntax")
  }
  @preterm.term_of_preterm(@preterm.retypecheck(@list.List([]), preterm))
}

///|
/// Parse a complete `BITPAT [...]` expression, after `load()`.
/// Enclosing parentheses are accepted. Custom syntax is recognized only at the
/// top level; embedded expressions use ordinary HOL syntax.
pub fn parse_bitpat(source : String) -> @kernel.Term raise {
  parse_bitmatch_with(source, preparse_bitpat)
}

///|
/// Parse a complete `bitmatch ... with ...` expression, after `load()`.
/// Enclosing parentheses are accepted. Scrutinees, patterns, and branch results
/// use ordinary HOL syntax; this does not register a general HOL parser callback.
pub fn parse_bitmatch(source : String) -> @kernel.Term raise {
  parse_bitmatch_with(source, preparse_bitmatch)
}
