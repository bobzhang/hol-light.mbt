// Multivariate/metric.ml: the load steps are generated (metric.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/metric.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @products.load()
  @misc.load()
  @iter.load()
  @parser.begin_theory("Multivariate/metric")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/metric.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
