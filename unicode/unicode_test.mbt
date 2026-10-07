///|
/// Parse `s` and print it back, with the Unicode symbols on.
fn roundtrip(s : String) -> String raise {
  @unicode.set_symbols()
  defer @unicode.unset_symbols()
  @printer.string_of_term(@parser.parse_term(s))
}

///|
test "upstream's spelling prints with the symbols" {
  let s =
    #|!x:num. p x ==> ?y:num. q x y /\ ~r y \/ (p y <=> q y x)
  inspect(
    roundtrip(s),
    content=(
      #|∀x. p x ⇒ (∃y. q x y ∧ ¬r y ∨ (p y ⇔ q y x))
    ),
  )
  let s =
    #|\x. x + 1
  inspect(
    roundtrip(s),
    content=(
      #|λx. x + 1
    ),
  )
  inspect(
    roundtrip("!m n. m <= n ==> n >= m"),
    content=(
      #|∀m n. m ≤ n ⇒ n ≥ m
    ),
  )
}

///|
test "the symbols parse, as the same terms" {
  inspect(
    roundtrip("∀x:num. p x ⇒ ∃y:num. q x y ∧ ¬r y ∨ (p y ⇔ q y x)"),
    content=(
      #|∀x. p x ⇒ (∃y. q x y ∧ ¬r y ∨ (p y ⇔ q y x))
    ),
  )
  inspect(
    roundtrip("λx. x + 1"),
    content=(
      #|λx. x + 1
    ),
  )
  inspect(
    roundtrip("¬¬p ⇔ p"),
    content=(
      #|¬¬p ⇔ p
    ),
  )
  @unicode.set_symbols()
  let a = @parser.parse_term("∀m n. m ≤ n ⇒ ¬(n < m) ∧ n ≥ m")
  let ascii =
    #|!m n. m <= n ==> ~(n < m) /\ n >= m
  let b = @parser.parse_term(ascii)
  @unicode.unset_symbols()
  assert_true(a == b)
}

///|
test "the overloads of <= come along" {
  inspect(
    roundtrip("∀x y:real. x ≤ y ⇒ ¬(y < x)"),
    content=(
      #|∀x y. x ≤ y ⇒ ¬(y < x)
    ),
  )
  inspect(
    roundtrip("∀x y:int. x ≤ y ∨ x ≥ y"),
    content=(
      #|∀x y. x ≤ y ∨ x ≥ y
    ),
  )
}

///|
test "a theorem, laid out as upstream lays out its own spelling" {
  @unicode.set_symbols()
  let stmt =
    #|∀lo hi mid.
    #|  lo ≤ hi ∧ mid = lo + (hi - lo) DIV 2 ⇒ lo ≤ mid ∧ mid ≤ hi ∧ mid = (lo + hi) DIV 2
  let th = @int.arith_rule(@parser.parse_term(stmt))
  let s = @printer.string_of_thm(th)
  @unicode.unset_symbols()
  inspect(
    s,
    content=(
      #|⊢ ∀lo hi mid.
      #|      lo ≤ hi ∧ mid = lo + (hi - lo) DIV 2
      #|      ⇒ lo ≤ mid ∧ mid ≤ hi ∧ mid = (lo + hi) DIV 2
    ),
  )
  // the same theorem, with the symbols off
  inspect(
    @printer.string_of_thm(th),
    content=(
      #||- forall lo hi mid.
      #|       lo <= hi /\ mid = lo + (hi - lo) DIV 2
      #|       ==> lo <= mid /\ mid <= hi /\ mid = (lo + hi) DIV 2
    ),
  )
}

///|
test "off: as upstream" {
  let r = try @parser.parse_term("∀x. p x") catch {
    Failure(m) => m
    e => e.to_string()
  } noraise {
    t => @printer.string_of_term(t)
  }
  inspect(
    r,
    content=(
      #|Unparsed input
    ),
  )
  let s =
    #|!x:num. x <= x /\ (\y. y) x = x
  inspect(
    @printer.string_of_term(@parser.parse_term(s)),
    content=(
      #|forall x. x <= x /\ (\y. y) x = x
    ),
  )
}

///|
test "the README's example" {
  @unicode.set_symbols()
  defer @unicode.unset_symbols()
  let th = @int.arith_rule(@parser.parse_term("∀m n. m ≤ n ⇒ ¬(n < m)"))
  inspect(
    @printer.string_of_thm(th),
    content=(
      #|⊢ ∀m n. m ≤ n ⇒ ¬(n < m)
    ),
  )
}
