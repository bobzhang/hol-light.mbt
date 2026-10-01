// Library/products.ml: the load steps are generated (products.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/products.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Library/products")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/products.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
