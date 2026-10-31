// A test of compute.ml's basic_compset, which no theory calls while it
// loads: the compset of basic rewrites, with LET's conversion and COND's
// lazy arguments.

///|
test "basic_compset evaluates with the basic rewrites" {
  let conv = @compute.cbv_conv(@compute.basic_compset(()))
  let t = @term_syntax.parse_term("true && (p : Bool)")
  let th = conv(t)
  assert_eq(@kernel.hyp(th), @list.List([]))
  let (l, r) = @kernel.dest_eq(@kernel.concl(th))
  assert_eq(l, t)
  assert_eq(r, @term_syntax.parse_term("(p : Bool)"))
}
