///|
/// Classify program keywords for this parse only. The shared keyword table is
/// deliberately left untouched, including on parse failures.
fn lex_program(source : String) -> Array[@lexer.Lexcode] raise {
  @lexer.lex(source).map(token => {
    match token {
      Ident(
        "var"
        | "end"
        | "skip"
        | "abort"
        | ":="
        | "if"
        | "then"
        | "else"
        | "while"
        | "do" as word
      ) => Resword(word)
      _ => token
    }
  })
}

///|
fn parse_program_with(
  source : String,
  parse : (ArrayView[@lexer.Lexcode]) -> (
    @preterm.Preterm,
    ArrayView[@lexer.Lexcode],
  ) raise,
) -> @kernel.Term raise {
  let (preterm, rest) = parse(lex_program(source))
  guard rest.is_empty() else {
    raise Failure("Unparsed input following program")
  }
  @preterm.term_of_preterm(@preterm.retypecheck(@list.List([]), preterm))
}

///|
/// Parse a complete `var ...; ... end` program explicitly, after `load()`.
pub fn parse_program_term(source : String) -> @kernel.Term raise {
  parse_program_with(source, parse_program)
}

///|
/// Parse a complete `correct ... var ...; ... end ...` assertion explicitly,
/// after `load()`, without registering syntax in the general HOL parser.
pub fn parse_program_assertion_term(source : String) -> @kernel.Term raise {
  parse_program_with(source, parse_program_assertion)
}
