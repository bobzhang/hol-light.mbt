// Rqe/poly_ext.ml: the load steps are generated (poly_ext.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/poly_ext.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rol.load()
  @parser.begin_theory("Rqe/poly_ext")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/poly_ext.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
