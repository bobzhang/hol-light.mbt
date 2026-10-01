// calc_num.ml: the load steps are generated (calc_num.mbt).

///|
fn init {
  @parser.begin_theory("calc_num")
  load_steps() catch {
    e => abort("HOL Light: loading calc_num.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
