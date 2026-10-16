///|
test "standalone lexer preserves tokens and default comments" {
  let source = "x <= y // ignored\nz"
  let expected : Array[@lexer.Lexcode] = [
    Ident("x"),
    Ident("<="),
    Ident("y"),
    Ident("z"),
  ]
  assert_eq(@lexer.lex(source), expected)
}
