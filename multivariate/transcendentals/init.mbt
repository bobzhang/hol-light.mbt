// Multivariate/transcendentals.ml: the load steps are generated (transcendentals.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/transcendentals.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @canal.load()
  @measure.load()
  @canal.load()
  @parser.begin_theory("Multivariate/transcendentals")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/transcendentals.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
