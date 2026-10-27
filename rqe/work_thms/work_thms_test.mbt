// A test of Rqe/work_thms.ml's LENGTH_N, which no theory calls while it
// loads. For n of 2 or more it proves !t. LENGTH t = n <=> ?x1 ... xn. t = [...].

///|
test "length_n characterizes the lists of length n" {
  @work_thms.load()
  for n in [2L, 3L, 4L] {
    let th = @work_thms.length_n(n, @kernel.mk_type("num", @list.List([])))
    assert_eq(@kernel.hyp(th), @list.List([]))
    let (t, body) = @basics.dest_forall(@kernel.concl(th))
    let (lhs, rhs) = @kernel.dest_eq(body)
    let (len_t, k) = @kernel.dest_eq(lhs)
    let (len, arg) = @kernel.dest_comb(len_t)
    assert_eq(@kernel.dest_const(len).0, "LENGTH")
    assert_eq(arg, t)
    assert_eq(k, @nums.mk_small_numeral(n))
    // ?x1 ... xn. t = [x1; ...; xn]
    let (xs, eq) = @basics.strip_exists(rhs)
    assert_eq(xs.length(), n.to_int())
    let (l, r) = @kernel.dest_eq(eq)
    assert_eq(l, t)
    assert_eq(@lib.setify(@basics.dest_list(r)), @lib.setify(xs))
    assert_eq(@basics.dest_list(r).length(), n.to_int())
  }
}
