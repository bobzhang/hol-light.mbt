///|
test "view alternatives backtrack without undoing parser actions" {
  let tokens : Array[String] = ["a", "b", "c"]
  let actions : Array[String] = []
  let first = @parserutil.seq(
    @parserutil.map(@parserutil.a("a"), token => {
      actions.push("first")
      token
    }),
    @parserutil.a("missing"),
  )
  let second = @parserutil.seq(
    @parserutil.map(@parserutil.a("a"), token => {
      actions.push("second")
      token
    }),
    @parserutil.a("b"),
  )
  let (parsed, rest) = @parserutil.alt(first, second)(tokens[:])
  assert_eq(parsed, ("a", "b"))
  assert_eq(rest, tokens[2:])
  assert_eq(rest.start_offset(), 2)
  assert_eq(actions, ["first", "second"])
  assert_eq(tokens, ["a", "b", "c"])
}

///|
test "view alternatives propagate hard errors" {
  let mut tried_alternative = false
  let parser = @parserutil.alt(@parserutil.fix("b", @parserutil.a("b")), input => {
    tried_alternative = true
    @parserutil.a("a")(input)
  })
  let failed = try {
    ignore(parser(["a"]))
    false
  } catch {
    Failure(message) => {
      assert_eq(message, "b expected")
      true
    }
    e => raise e
  }
  assert_true(failed)
  assert_false(tried_alternative)
}
