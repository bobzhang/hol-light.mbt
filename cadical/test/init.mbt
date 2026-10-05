// Cadical/test.ml: the load steps are generated (test_ml.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Cadical/test.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cadical.load()
  @taut.load()
  @parser.begin_theory("Cadical/test")
  load_steps() catch {
    e => abort("HOL Light: loading Cadical/test.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
