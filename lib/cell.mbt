// ===========================================================================
// Cells for values computed when a theory is loaded.
//
// Upstream computes theorems (and precomputed proof steps inside derived
// rules) as OCaml files load, in order. Here each theory package has a
// `load()` function that runs those steps in the same order and stores the
// results in cells; accessors read them.
// ===========================================================================

///|
/// A value set once when its theory is loaded.
pub struct Cell[T] {
  priv name : String
  priv mut value : T?
}

///|
pub fn[T] Cell::new(name : String) -> Cell[T] {
  { name, value: None, }
}

///|
/// The value; aborts if the theory that defines it has not been loaded.
pub fn[T] Cell::get(self : Cell[T]) -> T {
  match self.value {
    Some(v) => v
    None =>
      abort("HOL Light: " + self.name + " used before its theory was loaded")
  }
}

///|
pub fn[T] Cell::set(self : Cell[T], v : T) -> Unit {
  self.value = Some(v)
}

///|
pub fn[T] Cell::is_set(self : Cell[T]) -> Bool {
  self.value is Some(_)
}
