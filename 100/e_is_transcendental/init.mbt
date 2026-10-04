// 100/e_is_transcendental.ml: the load steps are generated (e_is_transcendental.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false }

///|
/// Load 100/e_is_transcendental.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binomial.load()
  @analysis.load()
  @transc.load()
  @prime.load()
  @iter.load()
  @integer.load()
  @floor.load()
  @liouville.load()
  @parser.begin_theory("100/e_is_transcendental")
  load_steps() catch {
    e => abort("HOL Light: loading 100/e_is_transcendental.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
