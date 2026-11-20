///|
test "qmap reuses the input or the suffix after the last change" {
  let tail = @list.List([3, 4])
  let xs = tail.prepend(2).prepend(1)
  @test.assert_eq(physical_equal(@lib.qmap(x => x, xs), xs), true)
  let ys = @lib.qmap(x => if x == 2 { -2 } else { x }, xs)
  @test.assert_eq(ys.to_array(), [1, -2, 3, 4])
  @test.assert_eq(physical_equal(@lib.tl(@lib.tl(ys)), tail), true)
}
