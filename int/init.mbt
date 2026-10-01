// int.ml: the load steps are generated (int.mbt).

///|
fn init {
  @parser.begin_theory("int")
  load_steps() catch {
    e => abort("HOL Light: loading int.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
