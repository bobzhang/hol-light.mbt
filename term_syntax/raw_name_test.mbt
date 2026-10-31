///|
test "a binder with a symbolic name is written between backticks" {
  inspect(spell("\\(<<). (<<) a b"), content=(
    #|(`<<` : (_, _) -> _) => `<<`((a : _), (b : _))
  ))
  inspect(spell("forall (<<) x y. (<<) x y ==> (<<) y x"), content=(
    #|∀ `<<` : (_, _) -> Bool, ∀ x : _, ∀ y : _, `<<`(x, y) → `<<`(y, x)
  ))
  inspect(spell("?(<<=). forall m:num. (<<=) m m"), content=(
    #|∃ `<<=` : (Num, Num) -> Bool, ∀ m : Num, `<<=`(m, m)
  ))
  // bound occurrences carry the binder's spelling, also typed
  inspect(spell("\\(**) a. (**) a a"), content=(
    #|(`**` : (_, _) -> _) => (a : _) => `**`(a, a)
  ))
}

///|
test "a free symbolic variable keeps its op_ spelling" {
  inspect(spell("(<<) a b"), content=(
    #|(op_lt_lt : (_, _) -> _)((a : _), (b : _))
  ))
}

///|
test "a raw name reads as the variable of that name" {
  let t = @term_syntax.parse_term("∀ `<<` : (Num, Num) -> Bool, `<<`(1, 2)")
  inspect(@term_syntax.same_term(t, @parser.parse_term("forall (<<):num->num->bool. (<<) 1 2")), content="true")
  match t {
    Comb(_, Abs(Var(name, _), _)) => inspect(name, content="<<")
    _ => fail("not a quantifier")
  }
}

///|
test "backticks take symbol characters only" {
  // keywords and ordinary names are not escaped this way
  for s in ["`fn`", "`x`", "`a<b`", "``"] {
    let read = try {
      @term_syntax.parse_term(s) |> ignore
      true
    } catch {
      _ => false
    }
    assert_false(read)
  }
}

///|
test "a binder named like a constant gets no backticks" {
  // `+` would read as the constant: no spelling reads back exactly
  let q = "\\(+) a. (+) a a"
  let printable = try {
    @term_syntax.spell_quotation(q, @parser.parse_term(q)) |> ignore
    true
  } catch {
    _ => false
  }
  assert_false(printable)
}
