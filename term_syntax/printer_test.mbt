///|
fn show(quotation : String) -> String raise {
  let t = @parser.parse_term(quotation)
  let s = @term_syntax.print_term(t)
  assert_true(@basics.aconv(@term_syntax.parse_term(s), t))
  s
}

///|
test "printing" {
  inspect(show("forall n. n + 0 = n"), content="∀ n : Num, n + 0 == n")
  inspect(
    show("forall p q r. p /\\ q \\/ r ==> ~p"),
    content="∀ p : Bool, ∀ q : Bool, ∀ r : Bool, p && q || r → !p",
  )
  inspect(show("\\x:num y. x * (y + 1)"), content="(x : Num) => (y : Num) => x * (y + 1)")
  inspect(
    show("forall x:num. (if x = 0 then 1 else x) > 0"),
    content="∀ x : Num, (if x == 0 { 1 } else { x }) > 0",
  )
  inspect(show("SUC n = n + 1"), content="SUC((n : Num)) == n + 1")
  inspect(show("[1;2], (T, F)"), content=(
    #|([1, 2], true, false)
  ))
  inspect(show("forall x':num. x' = x'"), content="∀ x' : Num, x' == x'")
}

///|
test "symbolic constants and operators as values" {
  inspect(show("@x:num. x = 1"), content="select((x : Num) => x == 1)")
  inspect(show("?!x:num. x = 1"), content="existsunique((x : Num) => x == 1)")
  inspect(show("(+) 1"), content="op_plus(1)")
  // a binder named like a constant is renamed
  let v = @kernel.mk_var("SUC", @kernel.mk_type("num", @list.List([])))
  let t = @kernel.mk_abs(v, v)
  let s = @term_syntax.print_term(t)
  assert_true(@basics.aconv(@term_syntax.parse_term(s), t))
  inspect(s, content=(
    #|(SUC' : Num) => SUC'
  ))
}

///|
test "types" {
  let ty = @term_syntax.print_type
  inspect(ty(@parser.parse_type("num->bool->bool")), content="(Num, Bool) -> Bool")
  inspect(ty(@parser.parse_type("(A->B)->A#B")), content="((A) -> B) -> (A, B)")
  inspect(ty(@parser.parse_type("(num)list")), content="List[Num]")
}

///|
fn round(t : @kernel.Term) -> String raise {
  let s = @term_syntax.print_term(t)
  assert_true(@basics.aconv(@term_syntax.parse_term(s), t))
  s
}

///|
test "spellings that would read back as something else" {
  let num = @kernel.mk_type("num", @list.List([]))
  // a type variable named like a type is not written as that type
  let unit_var = @kernel.mk_vartype("Unit")
  let r = try @term_syntax.print_type(unit_var) catch {
    @term_syntax.Unprintable(_) => "unprintable"
  }
  inspect(r, content="unprintable")
  // a numeral not in canonical form keeps its structure
  let bit0 = @kernel.mk_comb(
    @kernel.mk_const("BIT0", @list.List([])),
    @kernel.mk_const("_0", @list.List([])),
  )
  inspect(
    round(@kernel.mk_comb(@kernel.mk_const("NUMERAL", @list.List([])), bit0)),
    content="NUMERAL(BIT0(_0))",
  )
  // binders named like an interface name or a keyword are renamed
  let ex = @kernel.mk_var("exists", num)
  inspect(round(@kernel.mk_abs(ex, ex)), content="(exists' : Num) => exists'")
  let kw = @kernel.mk_var("let", num)
  inspect(round(@kernel.mk_abs(kw, kw)), content="(v : Num) => v")
}

///|
test "overloaded operators and names" {
  inspect(
    show("forall x y:real. x + y = y + x"),
    content="∀ x : Real, ∀ y : Real, x + y == y + x",
  )
  inspect(
    show("forall x:int. --x * x >= &0"),
    content="∀ x : Int, -x * x >= int_of_num(0)",
  )
  inspect(
    show("forall m n d. d divides m /\\ d divides n ==> d divides m + n"),
    content="∀ m : Num, ∀ n : Num, ∀ d : Num, divides(d, m) && divides(d, n) → divides(d, m + n)",
  )
}
