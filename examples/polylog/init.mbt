// Examples/polylog.ml: the load steps are generated (polylog.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/polylog.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transc.load()
  @parser.begin_theory("Examples/polylog")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/polylog.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
