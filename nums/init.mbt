// nums.ml: the load steps are generated (nums.mbt).

///|
fn init {
  @parser.begin_theory("nums")
  load_steps() catch {
    e => abort("HOL Light: loading nums.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
