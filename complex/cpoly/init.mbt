// Complex/cpoly.ml: the load steps are generated (cpoly.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/cpoly.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complex_transc.load()
  @complexnumbers.load()
  @parser.begin_theory("Complex/cpoly")
  load_steps() catch {
    e => abort("HOL Light: loading Complex/cpoly.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
