///|
fn same(new : String, old : String) -> Unit raise {
  let t = @term_syntax.parse_term(new)
  let u = @parser.parse_term(old)
  if !@basics.aconv(t, u) {
    fail("\{new} is not \{old}")
  }
}

///|
test "quantifiers, connectives and their precedence" {
  same("∀ n : Num, n + 0 == n", "forall n:num. n + 0 = n")
  same("∀ p : Bool, ∃ q : Bool, p → q", "forall p:bool. ?q:bool. p ==> q")
  same("∀ x : _, ∀ y : _, x + y == y + x", "forall x y. x + y = y + x")
  same("∀ x : Num, x == x && true", "forall x:num. x = x /\\ T")
  same("∀ a : Bool, ∀ b : Bool, ∀ c : Bool, a && b || c", "forall a b c. a /\\ b \\/ c")
  same("∀ p : _, ∀ q : _, ∀ r : _, p → q → r", "forall p q r. p ==> q ==> r")
  same("∀ a : _, ∀ b : _, ∀ c : _, ∀ d : Num, a + b * c == d", "forall a b c d. a + b * c = d")
  same("∀ p : _, ∀ q : _, !p || q", "forall p q. ~p \\/ q")
  same("∀ x : Num, ∀ y : _, x != y → y != x", "forall x:num y. ~(x = y) ==> ~(y = x)")
  same("∀ a : Num, ∀ b : _, a - b <= a", "forall a b. a - b <= a")
}

///|
test "application, lambdas, conditionals, tuples and lists" {
  same("∀ n : _, SUC(n) > n", "forall n. SUC n > n")
  same("(x : Num) => x * 2", "\\x:num. x * 2")
  same("(x : Num, y : Num) => x + y", "\\x:num y:num. x + y")
  same("∀ f : (Num, Num) -> Num, ∀ x : _, ∀ y : _, x.f(y) == f(x, y)", "forall f:num->num->num x y. f x y = f x y")
  same("∀ c : Bool, ∀ a : Num, ∀ b : _, (if c { a } else { b }) <= a + b", "forall c a b. (if c then a else b) <= a + b")
  same("(1, 2)", "1,2")
  same("(1, true, 3)", "1,T,3")
  same("[1, 2, 3]", "[1;2;3]")
}

///|
test "HOL names: primes and capitalised binders" {
  same("∀ x' : Num, x' == x'", "forall x':num. x' = x'")
  // as in MoonBit, a quantifier is not an operand of → without parentheses
  same("∀ P : (Num) -> Bool, P(0) → (∃ n : _, P(n))", "forall P:num->bool. P 0 ==> ?n. P n")
}

///|
test "types" {
  let ty = @term_syntax.parse_type
  assert_eq(ty("(Num, Bool) -> Bool"), @parser.parse_type("num->bool->bool"))
  assert_eq(ty("(Num, Bool)"), @parser.parse_type("num#bool"))
  assert_eq(ty("List[A]"), @parser.parse_type("(A)list"))
  assert_eq(ty("((A) -> B, A) -> B"), @parser.parse_type("(A->B)->A->B"))
}

///|
test "syntax errors name the offset" {
  let msg = try @term_syntax.parse_term("∀ x : Num x") catch {
    Failure(m) => m
    e => raise e
  } noraise {
    _ => "parsed"
  }
  assert_true(msg.has_prefix("term syntax: unexpected"))
}
