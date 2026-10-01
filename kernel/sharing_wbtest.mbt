// Sharing behaviour of the lib.ml helpers copied into the kernel.

///|
test "qmap keeps the unchanged suffix" {
  let a = Tyvar("A")
  let b = Tyvar("B")
  let c = Tyvar("C")
  let l = @list.List([a, b, c])
  let suf = suffixes(l)
  let l1 = qmap(t => if t == a { bool_ty } else { t }, l)
  @test.assert_eq(physical_equal(suf[1], suffixes(l1)[1]), true)
  @test.assert_eq(physical_equal(qmap(t => t, l), l), true)
}

///|
test "filter_share keeps the suffix after the last removed element" {
  let l = @list.List([1, 2, 3, 4])
  let l1 = filter_share(x => x != 2, l)
  @test.assert_eq(l1.to_array(), [1, 3, 4])
  @test.assert_eq(physical_equal(suffixes(l1)[1], suffixes(l)[2]), true)
  @test.assert_eq(physical_equal(filter_share(_ => true, l), l), true)
}

///|
test "filter_share applies the predicate from the last element" {
  let seen = []
  let _ = filter_share(
    x => {
      seen.push(x)
      true
    },
    @list.List([1, 2, 3]),
  )
  @test.assert_eq(seen, [3, 2, 1])
}

///|
test "term_image keeps the unchanged tail" {
  let p = Var("p", bool_ty)
  let q = Var("q", bool_ty)
  let r = Var("r", bool_ty)
  let hyps = @list.List([p, q, r])
  let out = term_image(t => if t == p { Var("a", bool_ty) } else { t }, hyps)
  @test.assert_eq(out.to_array(), [Var("a", bool_ty), q, r])
  @test.assert_eq(physical_equal(suffixes(out)[1], suffixes(hyps)[1]), true)
}
