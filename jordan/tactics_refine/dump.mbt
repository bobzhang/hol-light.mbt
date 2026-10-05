// Jordan/tactics_refine.ml's dump_thm and load_thm, written by hand (named
// in tools/translator/main.ml's manifest): the two functions upstream
// implements with OCaml's output_value and input_value.

///|
/// `dump_thm`: upstream writes its table of proved theorems to a file.
/// Not provided: this port never serializes theorems (a file of theorems
/// read back would bypass the kernel; PLAN.md, trust boundary). Upstream
/// does not call it while loading.
pub fn dump_thm(file_name : String) -> Unit raise {
  raise Failure(
    "dump_thm: theorems are not written to files (" + file_name + ")",
  )
}

///|
/// `load_thm`: upstream reads such a file back and takes the theorems in it
/// as proved. Not provided, for the same reason. Upstream only calls it from
/// `set_fast_load`, which tactics_refine.ml itself leaves off.
pub fn load_thm(file_name : String) -> Unit raise {
  raise Failure(
    "load_thm: theorems are not read from files (" + file_name + ")",
  )
}
