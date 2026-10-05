// Autoformalization/sarkovskii.ml: the load steps are generated (sarkovskii.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/sarkovskii.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @parser.begin_theory("Autoformalization/sarkovskii")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/sarkovskii.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
