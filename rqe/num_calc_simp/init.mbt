// Rqe/num_calc_simp.ml: the load steps are generated (num_calc_simp.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/num_calc_simp.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @timers.load()
  @parser.begin_theory("Rqe/num_calc_simp")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Rqe/num_calc_simp.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Rqe/num_calc_simp.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Rqe/num_calc_simp")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Rqe/num_calc_simp.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
