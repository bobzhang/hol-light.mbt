// Rqe/matinsert.ml: the load steps are generated (matinsert.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/matinsert.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @inferisign.load()
  @parser.begin_theory("Rqe/matinsert")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/matinsert.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
