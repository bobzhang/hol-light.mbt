// GL/gl.ml: the load steps are generated (gl.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/gl.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @modal.load()
  @parser.begin_theory("GL/gl")
  load_steps() catch {
    e => abort("HOL Light: loading GL/gl.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
