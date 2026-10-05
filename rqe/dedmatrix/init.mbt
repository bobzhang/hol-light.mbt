// Rqe/dedmatrix.ml: the load steps are generated (dedmatrix.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/dedmatrix.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @inferpsign.load()
  @parser.begin_theory("Rqe/dedmatrix")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/dedmatrix.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
