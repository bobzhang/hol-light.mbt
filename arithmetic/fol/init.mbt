// Arithmetic/fol.ml: the load steps are generated (fol.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/fol.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rstc.load()
  @prime.load()
  @parser.begin_theory("Arithmetic/fol")
  load_steps() catch {
    e => abort("HOL Light: loading Arithmetic/fol.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
