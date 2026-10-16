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

///|
test "∀ spelling leaves strings and other symbolic tokens unchanged" {
  assert_eq(@lexer.lex("∀ x. ?!y. P x y"), [
    Ident("∀"),
    Ident("x"),
    Resword("."),
    Ident("?!"),
    Ident("y"),
    Resword("."),
    Ident("P"),
    Ident("x"),
    Ident("y"),
  ])
  assert_eq(@lexer.lex("\"!\" !! !_x // ! is only a comment\n∀"), [
    Ident("\"!\""),
    Ident("!!"),
    Ident("!_x"),
    Ident("∀"),
  ])
}
