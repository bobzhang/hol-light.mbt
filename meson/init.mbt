// meson.ml: the load steps are generated (meson.mbt).

///|
fn init {
  @parser.begin_theory("meson")
  load_steps() catch {
    e => abort("HOL Light: loading meson.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
