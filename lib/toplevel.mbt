// OCaml standard-library behaviour the translated files rely on at the
// toplevel.

///|
/// `Printexc.to_string e`, for the exceptions of the standard library that
/// files raise (`Failure("...")`, `Not_found`, ...); another one by its
/// own text.
pub fn printexc_to_string(e : Error) -> String {
  match e {
    Failure(m) => "Failure(\"" + string_escaped(m) + "\")"
    @num.InvalidArgument(m) => "Invalid_argument(\"" + string_escaped(m) + "\")"
    NotFound => "Not_found"
    EndOfFile => "End_of_file"
    @num.DivisionByZero => "Division_by_zero"
    _ => e.to_string()
  }
}
