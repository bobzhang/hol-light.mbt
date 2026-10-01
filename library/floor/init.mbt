// Library/floor.ml: the load steps are generated (floor.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/floor.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Library/floor")
  load_steps() catch {
    e => abort("HOL Light: loading Library/floor.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
