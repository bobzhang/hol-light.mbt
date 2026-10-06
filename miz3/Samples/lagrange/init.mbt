// miz3/Samples/lagrange.ml: the load steps are generated (lagrange.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load miz3/Samples/lagrange.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @miz3.load()
  @prime.load()
  @parser.begin_theory("miz3/Samples/lagrange")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading miz3/Samples/lagrange.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
