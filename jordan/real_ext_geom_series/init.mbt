// Jordan/real_ext_geom_series.ml: the load steps are generated (real_ext_geom_series.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/real_ext_geom_series.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @num_ext_nabs.load()
  @parser.begin_theory("Jordan/real_ext_geom_series")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/real_ext_geom_series.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load Jordan/real_ext_geom_series.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Jordan/real_ext_geom_series")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/real_ext_geom_series.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
