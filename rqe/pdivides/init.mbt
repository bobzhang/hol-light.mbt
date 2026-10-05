// Rqe/pdivides.ml: the load steps are generated (pdivides.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/pdivides.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @dedmatrix.load()
  @parser.begin_theory("Rqe/pdivides")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/pdivides.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
