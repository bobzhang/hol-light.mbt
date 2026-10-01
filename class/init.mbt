// class.ml: the load steps are generated (class.mbt).

///|
fn init {
  @parser.begin_theory("class")
  load_steps() catch {
    e => abort("HOL Light: loading class.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
