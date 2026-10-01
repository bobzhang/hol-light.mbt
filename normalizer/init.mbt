// normalizer.ml: the load steps are generated (normalizer.mbt).

///|
fn init {
  @parser.begin_theory("normalizer")
  load_steps() catch {
    e => abort("HOL Light: loading normalizer.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
