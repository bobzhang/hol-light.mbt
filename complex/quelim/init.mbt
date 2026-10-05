// Complex/quelim.ml: the load steps are generated (quelim.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/quelim.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fundamental.load()
  @fundamental.load()
  @parser.begin_theory("Complex/quelim")
  load_steps() catch {
    e => abort("HOL Light: loading Complex/quelim.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
