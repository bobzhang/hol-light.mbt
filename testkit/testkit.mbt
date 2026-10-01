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

///|
/// OCaml's `String.escaped` on the UTF-8 bytes of `s`.
pub fn ocaml_escaped(s : String) -> String {
  let buf = StringBuilder()
  for b in @utf8.encode(s) {
    let c = b.to_int()
    match c {
      0x22 => buf.write_string("\\\"")
      0x5C => buf.write_string("\\\\")
      0x0A => buf.write_string("\\n")
      0x09 => buf.write_string("\\t")
      0x0D => buf.write_string("\\r")
      0x08 => buf.write_string("\\b")
      _ =>
        if c >= 32 && c <= 126 {
          buf.write_char(c.unsafe_to_char())
        } else {
          buf.write_string("\\")
          buf.write_string((c / 100).to_string())
          buf.write_string((c / 10 % 10).to_string())
          buf.write_string((c % 10).to_string())
        }
    }
  }
  buf.to_string()
}

///|
/// Start recording the quotations parsed (see `@parser.quotation_trace`).
pub fn start_trace() -> Unit {
  @parser.quotation_trace.val = Some([])
}

///|
/// Log the recorded quotations as tools/ocaml_ref/prelude.ml's `show_trace`.
pub fn Log::show_trace(self : Log, name : String) -> Unit {
  let t = @parser.quotation_trace.val.unwrap_or([])
  self.out(name + " quotations (" + t.length().to_string() + "):")
  for s in t {
    self.out("  " + ocaml_escaped(s))
  }
  @parser.quotation_trace.val = None
}
