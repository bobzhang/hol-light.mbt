// EC/misc.ml: the load steps are generated (misc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/misc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pocklington.load()
  @primitive.load()
  @grouptheory.load()
  @ringtheory.load()
  @parser.begin_theory("EC/misc")
  load_steps() catch {
    e => abort("HOL Light: loading EC/misc.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
