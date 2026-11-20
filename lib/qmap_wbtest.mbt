///|
test "qmap preserves identity and shares the tail after the last change" {
  let xs = @list.List([1, 2, 3, 4, 5])
  @test.assert_eq(physical_equal(qmap(x => x, xs), xs), true)
  let visits = []
  let ys = qmap(
    x => {
      visits.push(x)
      if x == 2 || x == 4 {
        -x
      } else {
        x
      }
    },
    xs,
  )
  @test.assert_eq(visits, [1, 2, 3, 4, 5])
  @test.assert_eq(ys.to_array(), [1, -2, 3, -4, 5])
  @test.assert_eq(physical_equal(suffixes(ys)[4], suffixes(xs)[4]), true)
}

///|
test "qmap stops at the callback that raises" {
  let visits = []
  @test.assert_raise(() => {
    let _ = qmap(
      x => {
        visits.push(x)
        if x == 2 {
          fail("stop")
        }
        -x
      },
      @list.List([1, 2, 3]),
    )
  })
  @test.assert_eq(visits, [1, 2])
}
