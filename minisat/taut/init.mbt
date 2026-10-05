// Minisat/taut.ml: the load steps are generated (taut.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Minisat/taut.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Minisat/taut")
  load_steps() catch {
    e => abort("HOL Light: loading Minisat/taut.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
