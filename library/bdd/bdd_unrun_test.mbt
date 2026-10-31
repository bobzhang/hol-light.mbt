// A test of Library/bdd.ml's mk_vtable, which no theory calls while it
// loads: a variable table of n + 1 entries, each T until a variable is
// added.

///|
test "mk_vtable makes a table of n + 1 entries" {
  @bdd.load()
  let (vars, next, _) = @bdd.mk_vtable(3L)
  assert_eq(vars.length(), 4)
  assert_eq(next.val, 1L)
  let t = @term_syntax.parse_term("true")
  for v in vars {
    assert_eq(v, t)
  }
}
