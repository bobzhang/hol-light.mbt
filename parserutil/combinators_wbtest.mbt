///|
test "view item parser rejects empty input" {
  let empty : ArrayView[String] = []
  let no_parse = try {
    ignore(some(_ => true)(empty))
    false
  } catch {
    Noparse => true
    e => raise e
  }
  assert_true(no_parse)
}
