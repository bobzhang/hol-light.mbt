// Complex/complexnumbers.ml: the load steps are generated (complexnumbers.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/complexnumbers.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @transc.load()
  @floor.load()
  @transc.load()
  @parser.begin_theory("Complex/complexnumbers")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/complexnumbers.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
