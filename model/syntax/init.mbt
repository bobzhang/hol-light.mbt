// Model/syntax.ml: the load steps are generated (syntax.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Model/syntax.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @parser.begin_theory("Model/syntax")
  load_steps() catch {
    e => abort("HOL Light: loading Model/syntax.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
