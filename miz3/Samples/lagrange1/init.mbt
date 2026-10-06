// miz3/Samples/lagrange1.ml: the load steps are generated (lagrange1.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load miz3/Samples/lagrange1.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @miz3.load()
  @prime.load()
  @parser.begin_theory("miz3/Samples/lagrange1")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading miz3/Samples/lagrange1.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
