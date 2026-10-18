///|
// Keep proof-language keywords out of the shared HOL lexer state.
let mizar_words : @list.List[String] = @list.List([
  "assume", "take", "set", "given", "such", "that", "proof", "end", "consider", "suffices",
  "to", "show", "per", "cases", "endcase", "suppose", "be", "then", "thus", "hence",
  "by", "so",
])

///|
fn mizar_tokens(tokens : ArrayView[@lexer.Lexcode]) -> Array[@lexer.Lexcode] {
  [
    for token in tokens => {
      match token {
        Ident(name) if @lib.mem(name, mizar_words) => @lexer.Resword(name)
        _ => token
      }
    }
  ]
}
