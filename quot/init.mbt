// quot.ml: the load steps are generated (quot.mbt).

///|
fn init {
  @parser.begin_theory("quot")
  load_steps() catch {
    e => abort("HOL Light: loading quot.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
