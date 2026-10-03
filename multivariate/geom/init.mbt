// Multivariate/geom.ml: the load steps are generated (geom.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/geom.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @realanalysis.load()
  @parser.begin_theory("Multivariate/geom")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/geom.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
