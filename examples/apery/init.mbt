// Examples/apery.ml: the load steps are generated (apery.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/apery.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pnt.load()
  @parser.begin_theory("Examples/apery")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/apery.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
