// HOL terms and types in a subset of MoonBit's syntax:
//
//   ∀ n : Num, n + 0 == n                    ∃ x : _, p(x) && q(x)
//   (x : Num) => x * 2                        if c { a } else { b }
//   f(x, y)   s.subset(t)   (a, b)   [a, b]   !p || q   p → q
//
// Binders take a type (`_` lets it be inferred). Names are HOL's: constants
// and variables by their own name, operators by their usual reading (`==`
// is `=`, `&&` is `/\`, `→` is `==>`, ...), so overloading works as in the
// quotation syntax. Types: `Bool`, `Num`, `List[A]`, `(A, B) -> C`, `(A, B)`;
// a name that is not a type constant is a type variable.

///|
fn describe(e : @grammar.ParseError) -> String {
  match e {
    UnexpectedToken(tok, (start, _), _) =>
      "unexpected \{@debug.to_string(tok)} at offset \{start}"
    UnexpectedEndOfInput(pos, _) => "unexpected end of input at offset \{pos}"
  }
}

///|
/// The preterm of `s`, before elaboration.
pub fn parse_preterm(s : String) -> @preterm.Preterm raise {
  let toks = tokens(s)
  @grammar.term(toks) catch {
    e => raise Failure("term syntax: " + describe(e))
  }
}

///|
/// The HOL term `s` denotes.
pub fn parse_term(s : String) -> @kernel.Term raise {
  @preterm.term_of_preterm(
    @preterm.retypecheck(@list.List([]), parse_preterm(s)),
  )
}

///|
/// The HOL type `s` denotes.
pub fn parse_type(s : String) -> @kernel.HolType raise {
  let toks = tokens(s)
  let pty = @grammar.pretype(toks) catch {
    e => raise Failure("term syntax: " + describe(e))
  }
  @preterm.type_of_pretype(pty)
}
