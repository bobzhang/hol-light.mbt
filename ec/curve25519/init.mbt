// EC/curve25519.ml: the load steps are generated (curve25519.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/curve25519.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @montgomery.load()
  @excluderoots.load()
  @computegroup.load()
  @parser.begin_theory("EC/curve25519")
  load_steps() catch {
    e => abort("HOL Light: loading EC/curve25519.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
