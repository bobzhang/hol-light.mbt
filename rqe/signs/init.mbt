// Rqe/signs.ml: the load steps are generated (signs.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/signs.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @matinsert.load()
  @parser.begin_theory("Rqe/signs")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/signs.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
