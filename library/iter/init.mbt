// Library/iter.ml: the load steps are generated (iter.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false }

///|
/// Load Library/iter.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Library/iter")
  load_steps() catch {
    e => abort("HOL Light: loading Library/iter.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
