// The parts of miz3.ml that are the operating system's or the OCaml
// toplevel's, by hand (tools/translator/main.ml lists their lines).

///|
/// `exec_phrase b s`: give the OCaml phrase `s` to the toplevel; whether it
/// ran, and what the parser left of `s`. Here it runs what the translator
/// made of the strings upstream's load runs (lib/toplevel.mbt); another
/// string fails, as one that does not type-check does upstream.
pub fn exec_phrase(_b : Bool) -> ((String) -> (Bool, String) raise) raise {
  fn(s : String) -> (Bool, String) raise {
    @lib.exec_phrase(s)
    (true, @lib.phrase_rest(s))
  }
}

///|
/// `TIMED_TAC n tac g`: `tac g`. Upstream sets an alarm signal that stops
/// it after `n` seconds (`Timeout`); there is no timer here, so a step is
/// never timed out.
pub fn[TA, TB] timed_tac(
  _n : Int64,
) -> (((TA) -> TB raise) -> ((TA) -> TB raise) raise) raise {
  fn(tac : (TA) -> TB raise) -> ((TA) -> TB raise) raise {
    fn(g : TA) -> TB raise { tac(g) }
  }
}

///|
/// `print_to_string1 printer prefix n i`: what `printer` prints of `i` on a
/// formatter of its own, at most `!proof_width` wide after `prefix` and
/// `n` spaces, which also follow each of its newlines.
pub fn[TA, TB] print_to_string1(
  printer : (@pp.Formatter) -> ((TA) -> TB raise) raise,
) -> ((String) -> ((Int64) -> ((TA) -> String raise) raise) raise) raise {
  let buf = StringBuilder::new()
  let fmt = @pp.formatter_of_buffer(buf)
  fmt.set_max_boxes(100)
  fn(prefix1 : String) -> ((Int64) -> ((TA) -> String raise) raise) raise {
    fn(n : Int64) -> ((TA) -> String raise) raise {
      fn(i : TA) -> String raise {
        let prefix = prefix1 + " ".repeat(n.to_int())
        fmt.set_margin(proof_width().val.to_int() - @lib.string_length(prefix))
        ignore(printer(fmt)(i))
        fmt.print_flush()
        let s = buf.to_string()
        buf.reset()
        s.replace_all(old="\n", new="\n" + prefix)
      }
    }
  }
}

///|
/// `check_file_verbose name lemma` checks the proof in a file and writes it
/// back with its errors, for the editor that miz3's server talks to: not
/// here.
pub fn check_file_verbose(
  name : String,
) -> ((String?) -> ((Int64, Int64, Int64), @kernel.Thm) raise) raise {
  fn(_lemma : String?) -> ((Int64, Int64, Int64), @kernel.Thm) raise {
    raise Failure("miz3: check_file_verbose (the editor's interface): " + name)
  }
}

///|
/// `server_up ()` records the process for the editor's signal: nothing here.
pub fn server_up(_ : Unit) -> Unit raise {
  ()
}

///|
/// `server_down ()`
pub fn server_down(_ : Unit) -> Unit raise {
  ()
}
