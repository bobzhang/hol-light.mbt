// Examples/mizar.ml: the load steps are generated (mizar.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/mizar.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Examples/mizar")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/mizar.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
