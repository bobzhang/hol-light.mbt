// Rqe/timers.ml: the load steps are generated (timers.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/timers.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rqe_list.load()
  @parser.begin_theory("Rqe/timers")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/timers.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
