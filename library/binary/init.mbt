// Library/binary.ml: the load steps are generated (binary.mbt).

///|
fn init {
  @parser.begin_theory("Library/binary")
  load_steps() catch {
    e => abort("HOL Light: loading Library/binary.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
