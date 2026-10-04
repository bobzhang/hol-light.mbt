// Complex/complex_transc.ml: the load steps are generated (complex_transc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/complex_transc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complexnumbers.load()
  @transc.load()
  @floor.load()
  @complexnumbers.load()
  @parser.begin_theory("Complex/complex_transc")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/complex_transc.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
