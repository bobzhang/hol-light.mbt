// GL/completeness.ml: the load steps are generated (completeness.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/completeness.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @gl.load()
  @parser.begin_theory("GL/completeness")
  load_steps() catch {
    e => abort("HOL Light: loading GL/completeness.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
