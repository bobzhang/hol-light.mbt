// EC/computegroup.ml: the load steps are generated (computegroup.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/computegroup.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @grouptheory.load()
  @ringtheory.load()
  @parser.begin_theory("EC/computegroup")
  load_steps() catch {
    e => abort("HOL Light: loading EC/computegroup.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
