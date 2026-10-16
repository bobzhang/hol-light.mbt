///|
test "standalone lexer preserves tokens and default comments" {
  let source = "x <= y // ignored\nz"
  let expected : @list.List[@lexer.Lexcode] = @list.List([
    Ident("x"),
    Ident("<="),
    Ident("y"),
    Ident("z"),
  ])
  assert_eq(@lexer.lex(source), expected)
  assert_eq(@lexer.lex_list(@list.List([source])), expected)
}
