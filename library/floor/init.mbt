// Library/floor.ml: the load steps are generated (floor.mbt).

///|
fn init {
  @parser.begin_theory("Library/floor")
  load_steps() catch {
    e => abort("HOL Light: loading Library/floor.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
