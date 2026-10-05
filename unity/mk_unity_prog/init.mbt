// Unity/mk_unity_prog.ml: the load steps are generated (mk_unity_prog.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Unity/mk_unity_prog.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @mk_comp_unity.load()
  @parser.begin_theory("Unity/mk_unity_prog")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Unity/mk_unity_prog.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
