// Library/prime.ml: the load steps are generated (prime.mbt).

///|
fn init {
  @parser.begin_theory("Library/prime")
  load_steps() catch {
    e => abort("HOL Light: loading Library/prime.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
