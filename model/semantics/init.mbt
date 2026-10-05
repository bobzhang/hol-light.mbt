// Model/semantics.ml: the load steps are generated (semantics.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Model/semantics.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @modelset.load()
  @parser.begin_theory("Model/semantics")
  load_steps() catch {
    e => abort("HOL Light: loading Model/semantics.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
