// Unity/mk_unless.ml: the load steps are generated (mk_unless.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Unity/mk_unless.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @mk_state_logic.load()
  @parser.begin_theory("Unity/mk_unless")
  load_steps() catch {
    e => abort("HOL Light: loading Unity/mk_unless.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
