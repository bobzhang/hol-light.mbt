// Library/records.ml: the load steps are generated (records.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/records.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @components.load()
  @parser.begin_theory("Library/records")
  load_steps() catch {
    e => abort("HOL Light: loading Library/records.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
