// Model/modelset.ml: the load steps are generated (modelset.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Model/modelset.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @syntax.load()
  @parser.begin_theory("Model/modelset")
  load_steps() catch {
    e => abort("HOL Light: loading Model/modelset.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
