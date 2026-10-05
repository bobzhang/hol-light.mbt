// Rqe/condense.ml: the load steps are generated (condense.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/condense.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @testform.load()
  @parser.begin_theory("Rqe/condense")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/condense.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
