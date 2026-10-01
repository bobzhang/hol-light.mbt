// canon.ml: the load steps are generated (canon.mbt).

///|
fn init {
  @parser.begin_theory("canon")
  load_steps() catch {
    e => abort("HOL Light: loading canon.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
