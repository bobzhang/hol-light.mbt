// EC/secp224k1.ml: the load steps are generated (secp224k1.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/secp224k1.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @parser.begin_theory("EC/secp224k1")
  load_steps() catch {
    e => abort("HOL Light: loading EC/secp224k1.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
