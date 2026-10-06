// OCaml given to the toplevel as a string while a file loads
// (`Toploop.execute_phrase` on `Lexing.from_string`: `exec` of
// RichterHilbertAxiomGeometry/readable.ml, whose proofs name their
// theorems and tactics in strings). There is no OCaml toplevel here. The
// translator makes a function of every string the reference session runs
// and registers it under the string's text before the phrase that runs it
// (tools/translator/emit.ml: exec_phrases); running a string looks it up.

///|
let phrases : Map[String, (Unit) -> Unit raise] = {}

///|
/// The translation of the phrase `text` is `run`.
pub fn register_phrase(text : String, run : (Unit) -> Unit raise) -> Unit {
  phrases[text] = run
}

///|
/// Run the phrase `text`. One that upstream's load does not run, or that is
/// not a well-typed expression there, fails.
pub fn exec_phrase(text : String) -> Unit raise {
  match phrases.get(text) {
    Some(run) => run(())
    None =>
      raise Failure("exec: not a phrase of the reference session: " + text)
  }
}

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

///|
let phrase_rests : Map[String, String] = {}

///|
/// The parser leaves `rest` of the string `text` after its first phrase.
pub fn register_phrase_rest(text : String, rest : String) -> Unit {
  phrase_rests[text] = rest
}

///|
/// What the toplevel's parser leaves of `text` after the phrase it runs
/// (miz3's `exec_phrase` returns it): nothing, for a string that is one
/// phrase.
pub fn phrase_rest(text : String) -> String {
  phrase_rests.get(text).unwrap_or("")
}
