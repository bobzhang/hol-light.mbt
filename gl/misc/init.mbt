// GL/misc.ml: the load steps are generated (misc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/misc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @rstc.load()
  @parser.begin_theory("GL/misc")
  load_steps() catch {
    e => abort("HOL Light: loading GL/misc.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
