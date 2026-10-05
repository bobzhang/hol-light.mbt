// Rqe/simplify.ml: the load steps are generated (simplify.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/simplify.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @poly_ext.load()
  @parser.begin_theory("Rqe/simplify")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/simplify.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
