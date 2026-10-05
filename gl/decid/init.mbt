// GL/decid.ml: the load steps are generated (decid.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/decid.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @k4lr.load()
  @parser.begin_theory("GL/decid")
  load_steps() catch {
    e => abort("HOL Light: loading GL/decid.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
