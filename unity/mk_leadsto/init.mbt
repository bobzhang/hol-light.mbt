// Unity/mk_leadsto.ml: the load steps are generated (mk_leadsto.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Unity/mk_leadsto.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @mk_gen_induct.load()
  @parser.begin_theory("Unity/mk_leadsto")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Unity/mk_leadsto.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
