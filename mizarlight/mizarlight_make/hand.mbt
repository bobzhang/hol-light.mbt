// Mizarlight/make.ml loads a syntax extension into the OCaml toplevel
// (Mizarlight/pa_f.ml: infix `by`, `st`, `at`, `from`, `using`, `proof`,
// `THEN'`). The translator's session has it; nothing of it is left in the
// translated files, where those are function applications.

///|
/// What loading pa_f.cmo prints.
fn infixes_set_up() -> Unit {
  @pp.std_formatter.print_string("New infixes set up")
  @pp.std_formatter.print_newline()
}
