// calc_int.ml: the load steps are generated (calc_int.mbt).

///|
fn init {
  @parser.begin_theory("calc_int")
  load_steps() catch {
    e => abort("HOL Light: loading calc_int.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
