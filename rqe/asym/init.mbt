// Rqe/asym.ml: the load steps are generated (asym.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/asym.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @num_calc_simp.load()
  @parser.begin_theory("Rqe/asym")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/asym.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
