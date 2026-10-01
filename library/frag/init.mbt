// Library/frag.ml: the load steps are generated (frag.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/frag.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Library/frag")
  load_steps() catch {
    e => abort("HOL Light: loading Library/frag.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
