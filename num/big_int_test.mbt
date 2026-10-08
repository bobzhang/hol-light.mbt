///|
test "Big_int: Euclidean division, square root, power" {
  let b = @num.big_int_of_int
  debug_inspect(@num.quomod_big_int(b(-7L), b(2L)), content="(-4, 1)")
  debug_inspect(@num.quomod_big_int(b(-7L), b(-2L)), content="(4, 1)")
  debug_inspect(@num.quomod_big_int(b(7L), b(-2L)), content="(-3, 1)")
  inspect(@num.sqrt_big_int(b(99L)), content="9")
  inspect(@num.sqrt_big_int(b(100L)), content="10")
  inspect(
    @num.sqrt_big_int(@num.power_int_positive_int(10L, 40L)),
    content="100000000000000000000",
  )
  inspect(@num.sign_big_int(b(-3L)), content="-1")
}
