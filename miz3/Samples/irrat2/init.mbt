// miz3/Samples/irrat2.ml: the load steps are generated (irrat2.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load miz3/Samples/irrat2.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @miz3.load()
  @transc.load()
  @sos.load()
  @parser.begin_theory("miz3/Samples/irrat2")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading miz3/Samples/irrat2.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
