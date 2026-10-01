// Library/isum.ml: the load steps are generated (isum.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/isum.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Library/isum")
  load_steps() catch {
    e => abort("HOL Light: loading Library/isum.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
