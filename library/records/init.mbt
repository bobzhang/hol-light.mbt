// Library/records.ml: the load steps are generated (records.mbt).

///|
fn init {
  @parser.begin_theory("Library/records")
  load_steps() catch {
    e => abort("HOL Light: loading Library/records.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
