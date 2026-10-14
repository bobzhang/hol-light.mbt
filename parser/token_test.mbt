///|
test "built-in symbols have token identities" {
  let tokens = @parser.lex("! ? ?! @ \\ /\\ \\/ ~ ==> <=> = < <= > >=")
  let expected : @list.List[@parser.Lexcode] = @list.List([
    Symbol(Forall),
    Symbol(Exists),
    Symbol(ExistsUnique),
    Symbol(Choice),
    Symbol(Lambda),
    Symbol(And),
    Symbol(Or),
    Symbol(Not),
    Symbol(Implies),
    Symbol(Iff),
    Symbol(Equal),
    Symbol(Less),
    Symbol(LessEqual),
    Symbol(Greater),
    Symbol(GreaterEqual),
  ])
  assert_eq(tokens, expected)
  for token in tokens {
    assert_eq(@parser.Lexcode::ident(token.text()), token)
    assert_eq(token.identifier(), Some(token.text()))
  }
}

///|
test "longest symbolic and underscore runs are preserved" {
  let tokens = @parser.lex("?!x !! ~~ /\\~ ==>_name _!x foo_! ;; (<=)")
  let expected : @list.List[@parser.Lexcode] = @list.List([
    Symbol(ExistsUnique),
    Ident("x"),
    Ident("!!"),
    Ident("~~"),
    Ident("/\\~"),
    Ident("==>_name"),
    Ident("_!"),
    Ident("x"),
    Ident("foo_"),
    Symbol(Forall),
    Ident(";;"),
    Resword("("),
    Symbol(LessEqual),
    Resword(")"),
  ])
  assert_eq(tokens, expected)
  assert_eq(@parser.lex_list(@list.List(["?", "!", "x"])), @parser.lex("?!x"))
}

///|
test "reserved symbols and custom comment tokens retain their roles" {
  let was_reserved = @printer.is_reserved_word("<=")
  let comment = @parser.comment_token.val
  fn restore() {
    if !was_reserved {
      @printer.unreserve_words(@list.List(["<="]))
    }
    @parser.comment_token.val = comment
  }
  errdefer restore()
  {
    @printer.reserve_words(@list.List(["<="]))
    let tokens = @parser.lex("x <= y")
    assert_eq(tokens, @list.List([Ident("x"), Resword("<="), Ident("y")]))
    let reserved : @parser.Lexcode = Resword("<=")
    assert_eq(reserved.identifier(), None)
    @parser.comment_token.val = Symbol(Forall)
    assert_eq(@parser.lex("! ∀ ignored\nx"), @list.List([Ident("x")]))
    // Matching remains sensitive to reservation, as it was before.
    @parser.comment_token.val = Symbol(LessEqual)
    assert_eq(@parser.lex("x <= y"), tokens)
  }
  restore()
}

///|
fn complete_preterm(source : String) -> @preterm.Preterm raise {
  let (term, rest) = @parser.parse_preterm(@parser.lex(source))
  assert_true(rest.is_empty())
  term
}

///|
test "symbol syntax remains dynamically configurable" {
  let was_binder = @printer.parses_as_binder("!")
  let was_prefix = @printer.is_prefix("~")
  let old_infix = Some(@printer.get_infix_status("<=")) catch {
    Failure(_) => None
    e => raise e
  }
  fn restore() {
    if was_binder {
      @printer.parse_as_binder("!")
    } else {
      @printer.unparse_as_binder("!")
    }
    if was_prefix {
      @printer.parse_as_prefix("~")
    } else {
      @printer.unparse_as_prefix("~")
    }
    match old_infix {
      Some(status) => @printer.parse_as_infix("<=", status)
      None => @printer.unparse_as_infix("<=")
    }
    @printer.unparse_as_binder("TOKEN_BINDER")
    @printer.unparse_as_infix("<~>")
  }
  errdefer restore()
  {
    @printer.unparse_as_binder("!")
    @printer.unparse_as_prefix("~")
    @printer.unparse_as_infix("<=")
    assert_true(complete_preterm("(!)") is @preterm.Varp("!", _))
    assert_true(complete_preterm("(~)") is @preterm.Varp("~", _))
    assert_true(complete_preterm("(<=)") is @preterm.Varp("<=", _))
    @printer.parse_as_binder("!")
    @printer.parse_as_binder("TOKEN_BINDER")
    assert_true(
      complete_preterm("!x. x")
      is @preterm.Combp(Varp("!", _), Absp(Varp("x", _), Varp("x", _))),
    )
    assert_true(
      complete_preterm("TOKEN_BINDER x. x")
      is @preterm.Combp(
        Varp("TOKEN_BINDER", _),
        Absp(Varp("x", _), Varp("x", _))
      ),
    )
    @printer.parse_as_prefix("~")
    assert_true(
      complete_preterm("~x") is @preterm.Combp(Varp("~", _), Varp("x", _)),
    )
    @printer.parse_as_infix("<=", (12L, "right"))
    assert_true(
      complete_preterm("x <= y <= z")
      is @preterm.Combp(
        Combp(Varp("<=", _), Varp("x", _)),
        Combp(Combp(Varp("<=", _), Varp("y", _)), Varp("z", _))
      ),
    )
    @printer.parse_as_infix("<=", (12L, "left"))
    assert_true(
      complete_preterm("x <= y <= z")
      is @preterm.Combp(
        Combp(
          Varp("<=", _),
          Combp(Combp(Varp("<=", _), Varp("x", _)), Varp("y", _))
        ),
        Varp("z", _)
      ),
    )
    @printer.parse_as_infix("<~>", (12L, "right"))
    assert_true(
      complete_preterm("x <~> y")
      is @preterm.Combp(Combp(Varp("<~>", _), Varp("x", _)), Varp("y", _)),
    )
    // Token identity must not prevent symbols from being type names, either.
    let (ty, rest) = @parser.parse_pretype(@parser.lex("!"))
    assert_true(ty is @preterm.Utv("!"))
    assert_true(rest.is_empty())
  }
  restore()
}

///|
test "string literals retain UTF-8 bytes and raw numeric escapes" {
  let source = "\"∀é😀\\255\\x80\\xA_\\000\""
  let tokens = @parser.lex(source)
  let text = @lib.hd(tokens).text()
  let bytes = [ for c in text => c.to_int() ]
  assert_eq(bytes, [
    34, 226, 136, 128, 195, 169, 240, 159, 152, 128, 255, 128, 10, 0, 34,
  ])
  assert_eq(@parser.lex("\"!\""), @list.List([Ident("\"!\"")]))
}

///|
fn lex_error(source : String) -> String {
  try {
    ignore(@parser.lex(source))
    "accepted"
  } catch {
    Failure(message) => message
    e => e.to_string()
  }
}

///|
test "Unicode syntax and malformed input remain rejected" {
  for source in ["∀x. x", "λx. x", "é", "😀", "\"unterminated"] {
    assert_eq(lex_error(source), "Unparsed input")
  }
  assert_eq(
    lex_error("\"\\q\""),
    "lex:unrecognized OCaml-style escape in string",
  )
  assert_eq(lex_error("\"\\xG0\""), "int_of_string")
}
