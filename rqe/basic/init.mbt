// Rqe/basic.ml: the load steps are generated (basic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/basic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rewrites.load()
  @parser.begin_theory("Rqe/basic")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/basic.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
