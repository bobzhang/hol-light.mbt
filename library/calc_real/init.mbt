// Library/calc_real.ml: the load steps are generated (calc_real.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/calc_real.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transc.load()
  @parser.begin_theory("Library/calc_real")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/calc_real.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
