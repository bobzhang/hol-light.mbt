// readable.ml's `exec` (line 81) gives its string to the OCaml toplevel:
// here it runs what the translator made of the string (lib/toplevel.mbt).

///|
/// `exec`
pub fn exec(s : String) -> Unit raise {
  @lib.exec_phrase(s)
}
