// 100/morley.ml: the load steps are generated (morley.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/morley.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @iter.load()
  @geom.load()
  @parser.begin_theory("100/morley")
  load_steps() catch {
    e => abort("HOL Light: loading 100/morley.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
