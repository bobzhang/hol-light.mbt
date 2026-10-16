///|
test "miz3 preserves symbol tokens and source text" {
  @miz3.load()
  let source = "  !x. x = x;  "
  let tokens = @miz3.lex2(source)
  assert_eq(tokens.map(t => t.1), @parser.lex(source))
  let (leading, body, trailing) = @miz3.strings_of_toks(tokens)
  assert_eq(leading + body + trailing, source)
  for name in ["!", "?!", "=", "<=", "custom_name"] {
    let (parsed, rest) = @miz3.ident_p(@miz3.unident_p(name))
    assert_eq(parsed, name)
    assert_true(rest.is_empty())
  }
  assert_eq(@miz3.parse_labels(@miz3.lex2("[!] [=]")), @list.List(["!", "="]))
}
