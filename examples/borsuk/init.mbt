// Examples/borsuk.ml: the load steps are generated (borsuk.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/borsuk.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @moretop.load()
  @parser.begin_theory("Examples/borsuk")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/borsuk.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
