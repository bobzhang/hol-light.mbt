// Library/products.ml: the load steps are generated (products.mbt).

///|
fn init {
  @parser.begin_theory("Library/products")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/products.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
