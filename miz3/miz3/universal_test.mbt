///|
test "Unicode universal tokens preserve Miz3 proof layout" {
  @miz3.load()
  assert_eq(
    @miz3.lex2("∀x"),
    @list.List([("", @lexer.Ident("∀"), ""), ("", @lexer.Ident("x"), "")]),
  )
  let source = " // ∀ in a comment\n\t∀x. \"∀ forall !\" = \"∀ forall !\";\n"
  let (prefix, body, suffix) = @miz3.strings_of_toks(@miz3.lex2(source))
  assert_eq(prefix + body + suffix, source)
}
