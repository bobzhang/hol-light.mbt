// ===========================================================================
// Helpers shared by the differential tests: the same structural printers
// and failure reporting as tools/ocaml_ref/prelude.ml.
// ===========================================================================

///|
using @kernel {type Term, type HolType, type Thm}

///|
/// Structural rendering of a type (`'A` for variables).
pub fn sty(ty : HolType) -> String {
  match ty {
    Tyvar(s) => "'" + s
    Tyapp(s, Empty) => s
    Tyapp(s, args) => s + "(" + args.map(sty).to_array().join(",") + ")"
  }
}

///|
/// Structural rendering of a term with all types.
pub fn stm(tm : Term) -> String {
  match tm {
    Var(s, ty) => s + ":" + sty(ty)
    Const(s, ty) => "#" + s + ":" + sty(ty)
    Comb(f, x) => "(" + stm(f) + " " + stm(x) + ")"
    Abs(v, b) => "(\\" + stm(v) + ". " + stm(b) + ")"
  }
}

///|
/// Structural rendering of a theorem.
pub fn sthm(th : Thm) -> String {
  let (asl, c) = @kernel.dest_thm(th)
  asl.map(stm).to_array().join(", ") + " |- " + stm(c)
}

///|
/// A line-oriented log of results, as upstream's `attempt`.
pub struct Log {
  priv buf : StringBuilder
}

///|
pub fn Log::new() -> Log {
  { buf: StringBuilder(), }
}

///|
pub fn Log::out(self : Log, s : String) -> Unit {
  self.buf.write_string(s + "\n")
}

///|
/// Record `name = result`, or `name ! msg` for a `Failure`, or
/// `name !! exn` for other errors (named as OCaml prints them).
pub fn Log::attempt(self : Log, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    @parser.Noparse => name + " !! Noparse"
    @lib.MatchFailure(_) => name + " !! Match_failure"
    @num.InvalidArgument(m) => name + " !! Invalid_argument(\"" + m + "\")"
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.out(line)
}

///|
pub fn Log::contents(self : Log) -> String {
  self.buf.to_string()
}

///|
/// Send `report`/`warn` output to the log (upstream prints warnings on the
/// same stream as the results).
pub fn Log::capture_reports(self : Log) -> Unit {
  @lib.report_sink.val = s => self.out(s)
}
