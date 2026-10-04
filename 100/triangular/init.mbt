// 100/triangular.ml: the load steps are generated (triangular.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/triangular.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @analysis.load()
  @parser.begin_theory("100/triangular")
  load_steps() catch {
    e => abort("HOL Light: loading 100/triangular.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
