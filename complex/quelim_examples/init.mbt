// Complex/quelim_examples.ml: the load steps are generated (quelim_examples.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/quelim_examples.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complex_real.load()
  @parser.begin_theory("Complex/quelim_examples")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/quelim_examples.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
