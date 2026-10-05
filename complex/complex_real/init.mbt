// Complex/complex_real.ml: the load steps are generated (complex_real.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/complex_real.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complex_grobner.load()
  @parser.begin_theory("Complex/complex_real")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/complex_real.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
