///|
test "with_interface_restored undoes interface changes, also on failure" {
  let before = @printer.the_interface.val
  let v = @kernel.mk_var("scoped_sym_impl", @kernel.bool_ty)
  let seen = @preterm.with_interface_restored(() => {
    @preterm.override_interface("scoped_sym", v)
    @printer.the_interface.val.length()
  })
  assert_eq(seen, before.length() + 1)
  assert_true(@printer.the_interface.val == before)
  let failing : () -> Unit raise = () => {
    @preterm.override_interface("scoped_sym", v)
    raise Failure("boom")
  }
  try @preterm.with_interface_restored(failing) catch {
    Failure(_) => ()
    e => raise e
  } noraise {
    _ => fail("expected the failure to propagate")
  }
  assert_true(@printer.the_interface.val == before)
}
