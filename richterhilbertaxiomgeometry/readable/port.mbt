// Temporary: generate the MoonBit form (script.mbt) of a proof in the
// readable text format, for porting the proofs that use it. Each function
// mirrors the one of the text format's parser it is named after (theorem,
// StringToTactic, ...), with the same regular expressions and the same
// order of alternatives, but produces source code instead of a tactic.
//
// A name the text format would look up with `exec` becomes a marker
// `⟦<phrase>⟧` for the phrase it would run; the porting script replaces it
// with the expression that phrase evaluates. Run it after the file being
// ported has loaded, so the phrases registered are those its proofs see.

///|
priv struct Script {
  steps : Array[String]
  last : String?
}

///|
fn lit(s : String) -> String {
  let b = StringBuilder()
  b.write_char('"')
  for c in s {
    match c {
      '\\' => b.write_string("\\\\")
      '"' => b.write_string("\\\"")
      '\n' => b.write_string("\\n")
      '\t' => b.write_string("\\t")
      '\r' => b.write_string("\\r")
      c => b.write_char(c)
    }
  }
  b.write_char('"')
  b.to_string()
}

///|
fn lits(ss : @list.List[String]) -> String {
  "@list.List([" + ss.map(lit).to_array().join(", ") + "])"
}

///|
fn phrase(kind : String, s : String) -> String raise {
  let text = match kind {
    "thm" => "thm_ref := ((" + s + "): thm);;"
    "tactic" => "tactic_ref := ((" + s + "): tactic);;"
    "thmlist_tactic" => "thmlist_tactic_ref := ((" + s + "): thm list -> tactic);;"
    "thmtactic" => "thmtactic_ref := ((" + s + "): thm -> tactic);;"
    "termlist_thm_thm" =>
      "termlist_thm_thm_ref := ((" + s + "): (term list -> thm -> thm));;"
    "thm_thm" => "thm_thm_ref := ((" + s + "): (thm -> thm));;"
    "term_thm" => "term_thm_ref := ((" + s + "): (term -> thm));;"
    "thmlist_term_thm" =>
      "thmlist_term_thm_ref := ((" + s + "): (thm list ->term -> thm));;"
    _ => abort("phrase kind " + kind)
  }
  // `exec_thm` refuses a string with a semicolon before running it
  if kind == "thm" && @lib.str_string_match(@lib.str_regexp("[^;]*;"), s, 0L) {
    raise @parserutil.Noparse
  }
  if @lib.has_phrase(text) {
    "⟦" + text + "⟧"
  } else {
    raise @parserutil.Noparse
  }
}

///|
fn render(s : Script) -> String {
  match (s.steps.is_empty(), s.last) {
    (true, None) => "@tactics.all_tac"
    (true, Some(last)) => last
    (false, None) => "@readable.steps([" + s.steps.join(", ") + "])"
    (false, Some(last)) =>
      "@readable.steps_then([" + s.steps.join(", ") + "], " + last + ")"
  }
}

///|
/// `theoremify`, without a goal: the word's meaning is decided by the
/// phrases there are, as the text format decides it when the step runs.
fn port_theoremify(string : String) -> (String, String) raise {
  if @lib.str_string_match(@lib.str_regexp(ws() + "\\([^][ \t\n]+\\)"), string, 0L) {
    let word = @lib.str_matched_group(1L, string)
    let rest = @lib.str_string_after(string, @lib.str_match_end(()))
    if word == "-" {
      return ("@readable.Prev", rest)
    }
    try {
      let m = phrase("thm", word)
      return ("@readable.Thm(" + lit(word) + ", () => " + m + ")", rest)
    } catch {
      _ => ()
    }
    try {
      let m = phrase("thm_thm", word)
      let (arg, rest_1) = port_theoremify(rest)
      return ("@readable.Rule(" + m + ", " + arg + ")", rest_1)
    } catch {
      _ => ()
    }
    try {
      let m = phrase("term_thm", word)
      let (stermlist, wsrest) = extractwsstringlist(rest)
      if stermlist.length() == 1 {
        return (
          "@readable.TermRule(" + m + ", " + lit(@lib.hd(stermlist)) + ")",
          wsrest,
        )
      }
      raise Failure("term->thm " + word + " not followed by one term")
    } catch {
      @parserutil.Noparse => ()
      e => raise e
    }
    try {
      let m = phrase("thmlist_term_thm", word)
      let (sthms, wstermrest) = extractwsstringlist(rest)
      let args = sthms.map(sthm => {
        let (arg, rest_3) = port_theoremify(" " + sthm)
        if rest_3 != "" {
          raise Failure("not a theorem: " + sthm)
        }
        arg
      })
      if @lib.str_string_match(@lib.str_regexp(ws() + "\\["), wstermrest, 0L) {
        let termrest = @lib.str_string_after(wstermrest, @lib.str_match_end(()))
        let rightbrace = findmatch("\\[", "\\]", termrest)
        let rest_4 = @lib.str_string_after(termrest, rightbrace)
        let sterm = @lib.str_string_before(termrest, @lib.sub63(rightbrace, 1L))
        return (
          "@readable.ThmsTermRule(" +
          m +
          ", [" +
          args.to_array().join(", ") +
          "], " +
          lit(sterm) +
          ")",
          rest_4,
        )
      }
      raise Failure("thmlist->term->thm " + word + " not followed by a term")
    } catch {
      @parserutil.Noparse => ()
      e => raise e
    }
    try {
      let m = phrase("termlist_thm_thm", word)
      let (sterms, wsthm) = extractwsstringlist(rest)
      let (arg, rest_5) = port_theoremify(wsthm)
      return (
        "@readable.TermsRule(" +
        m +
        ", [" +
        sterms.map(lit).to_array().join(", ") +
        "], " +
        arg +
        ")",
        rest_5,
      )
    } catch {
      @parserutil.Noparse => ()
      e => raise e
    }
    ("@readable.Label(" + lit(word) + ")", rest)
  } else {
    raise Failure("Empty theorem:\n" + string)
  }
}

///|
fn port_thmtactic_thm(step : String) -> String raise {
  if @lib.str_string_match(@lib.str_regexp(ws() + "\\([a-zA-Z0-9_]+\\)"), step, 0L) {
    let sthm_tactic = @lib.str_matched_group(1L, step)
    let sthm = @lib.str_string_after(step, @lib.str_match_end(()))
    let m = phrase("thmtactic", sthm_tactic)
    let (arg, rest) = port_theoremify(sthm)
    if rest != "" {
      raise Failure("thm_tactic " + sthm_tactic + " not followed by a theorem")
    }
    "@readable.by_thm(" + m + ", " + arg + ")"
  } else {
    raise @lib.NotFound
  }
}

///|
fn port_thmlisttactic_thmlist(step : String) -> String raise {
  if @lib.str_string_match(@lib.str_regexp(ws() + "\\([a-zA-Z0-9_]+\\)"), step, 0L) {
    let m = phrase("thmlist_tactic", @lib.str_matched_group(1L, step))
    let labthmstring = @lib.str_string_after(step, @lib.str_match_end(()))
    let args = []
    let mut s = labthmstring
    while !stringregexpequal(@lib.str_regexp(ws0()), s) {
      let (arg, rest) = port_theoremify(s)
      args.push(arg)
      s = rest
    }
    "@readable.by(" + m + ", [" + args.join(", ") + "])"
  } else {
    raise @lib.NotFound
  }
}

///|
fn port_steptotactic(step : String) -> String raise {
  try {
    if stringregexpequal(@lib.str_regexp(ws() + "\\([^ \t\n]+\\)" + ws0()), step) {
      phrase("tactic", @lib.str_matched_group(1L, step))
    } else {
      raise @lib.NotFound
    }
  } catch {
    _ =>
      try port_thmtactic_thm(step) catch {
        _ =>
          try port_thmlisttactic_thmlist(step) catch {
            _ =>
              if @lib.str_string_match(@lib.str_regexp(ws() + "intro_TAC" + ws()), step, 0L) {
                let s = @lib.str_string_after(step, @lib.str_match_end(()))
                "@readable.intro_tac(" + lit(s) + ")"
              } else if @lib.str_string_match(
                  @lib.str_regexp(ws() + "exists_TAC" + ws()),
                  step,
                  0L,
                ) {
                let s = @lib.str_string_after(step, @lib.str_match_end(()))
                "@readable.exists(" + lit(s) + ")"
              } else if @lib.str_string_match(
                  @lib.str_regexp(ws() + "X_genl_TAC" + ws()),
                  step,
                  0L,
                ) {
                let s = @lib.str_string_after(step, @lib.str_match_end(()))
                "@readable.x_genl_tac(" +
                lits(@lib.str_split(@lib.str_regexp(ws()), s)) +
                ")"
              } else {
                raise @lib.NotFound
              }
          }
      }
  }
}

///|
fn port_getproof(byproof : String, s : String) -> (String, String) raise {
  if byproof == "by" {
    let pos = findsemicolon(s)
    let rest = @lib.str_string_after(s, @lib.add63(pos, 1L))
    (port_steptotactic(@lib.str_string_before(s, pos)), rest)
  } else {
    let pos_after_qed = findmatch(
      ws() + "proof" + ws(),
      ws() + "qed" + ws0() + ";",
      s,
    )
    let pos = @lib.str_search_backward(@lib.str_regexp("qed"), s, pos_after_qed)
    let proof = render(port_stringtotactic(@lib.str_string_before(s, pos)))
    (proof, @lib.str_string_after(s, pos_after_qed))
  }
}

///|
fn port_makecasesplit(s : String) -> String raise {
  if @lib.str_string_match(
      @lib.str_regexp(
        ws() +
        "case_split" +
        ws() +
        "\\([^;]+\\)" +
        ws() +
        "\\(by\\|proof\\)" +
        ws(),
      ),
      s,
      0L,
    ) {
    let sdestruct = @lib.str_matched_group(1L, s)
    let keyword = @lib.str_matched_group(2L, s)
    let after = @lib.str_string_after(s, @lib.str_group_end(2L))
    let (proof, rest) = port_getproof(keyword, after)
    let cases = @lib.map(
      fn(case : String) -> @list.List[String] raise {
        let pos = findsemicolon(case)
        let t = @lib.str_string_after(case, @lib.add63(pos, 1L))
        @list.List([@lib.str_string_before(case, pos), t])
      },
      findcases(rest),
    )
    let disjs = @lib.map(@lib.hd, cases)
    let tacs = @lib.map(
      (c : @list.List[String]) => render(port_stringtotactic(@lib.hd(@lib.tl(c)))),
      cases,
    )
    "@readable.case_split(" +
    lit(sdestruct) +
    ", " +
    proof +
    ", " +
    lits(disjs) +
    ", @list.List([" +
    tacs.to_array().join(", ") +
    "]))"
  } else {
    raise @lib.NotFound
  }
}

///|
fn port_bigsteptotactic(s : String, step : String) -> (String, String) raise {
  if @lib.str_string_match(
      @lib.str_regexp(
        ws() +
        "consider" +
        ws() +
        "\\(\\(.\\|\n\\)+\\)" +
        ws() +
        "such" +
        ws() +
        "that" +
        ws() +
        "\\(\\(.\\|\n\\)+\\)" +
        ws() +
        "\\[\\(\\(.\\|\n\\)*\\)\\]" +
        ws() +
        "\\(by\\|proof\\)" +
        ws(),
      ),
      step,
      0L,
    ) {
    let vars = @lib.str_matched_group(1L, step)
    let t = @lib.str_matched_group(3L, step)
    let lab = @lib.str_matched_group(5L, step)
    let keyword = @lib.str_matched_group(7L, step)
    let endkeyword = @lib.str_group_end(7L)
    let (proof, rest) = port_getproof(keyword, @lib.str_string_after(s, endkeyword))
    (
      "@readable.consider(" +
      lit(vars) +
      ", " +
      lit(t) +
      ", " +
      lit(lab) +
      ", " +
      proof +
      ")",
      rest,
    )
  } else {
    try {
      let start = @lib.str_search_forward(
        @lib.str_regexp(
          ws() + "\\[\\([^]]*\\)\\]" + ws() + "\\(by\\|proof\\)" + ws(),
        ),
        step,
        0L,
      )
      let statement = @lib.str_string_before(step, start)
      let lab = @lib.str_matched_group(1L, step)
      let keyword = @lib.str_matched_group(2L, step)
      let afterword = @lib.str_string_after(s, @lib.str_group_end(2L))
      let (proof, rest) = port_getproof(keyword, afterword)
      let code = if stringregexpequal(@lib.str_regexp(ws() + "eq_tac"), statement) {
        "@readable.eq_tac(" + lit(lab) + ", " + proof + ")"
      } else if stringregexpequal(@lib.str_regexp(ws() + "conj_tac"), statement) {
        "@readable.conj_tac(" + lit(lab) + ", " + proof + ")"
      } else if @lib.str_string_match(
          @lib.str_regexp(ws() + "\\(assume\\)" + ws()),
          statement,
          0L,
        ) {
        let st = @lib.str_string_after(statement, @lib.str_match_end(()))
        "@readable.assuming(" + lit(st) + ", " + lit(lab) + ", " + proof + ")"
      } else {
        "@readable.have(" + lit(statement) + ", " + lit(lab) + ", " + proof + ")"
      }
      (code, rest)
    } catch {
      @lib.NotFound => raise Failure("Can't parse as a Proof:\n" + step)
      e => raise e
    }
  }
}

///|
fn port_stringtotactic(s : String) -> Script raise {
  let s_1 = @lib.str_global_replace(@lib.str_regexp("::[^\n]*"), "", s)
  if stringregexpequal(@lib.str_regexp(ws0()), s_1) {
    { steps: [], last: None }
  } else {
    try {
      { steps: [], last: Some(port_makecasesplit(s_1)) }
    } catch {
      _ => {
        let pos = findsemicolon(s_1)
        let rest = @lib.str_string_after(s_1, @lib.add63(pos, 1L))
        let step = @lib.str_string_before(s_1, pos)
        try {
          let tactic = port_steptotactic(step)
          let more = port_stringtotactic(rest)
          { steps: [tactic, ..more.steps], last: more.last }
        } catch {
          @lib.NotFound => {
            let (tactic, rest_1) = port_bigsteptotactic(s_1, step)
            let more = port_stringtotactic(rest_1)
            { steps: [tactic, ..more.steps], last: more.last }
          }
          e => raise e
        }
      }
    }
  }
}

///|
/// The MoonBit source of `theorem(s)`: a call of `@readable.prove`.
pub fn port_theorem(s : String) -> String raise {
  let s_1 = cleanmathfontsforhol_light(s)
  try {
    let start = @lib.str_search_forward(
      @lib.str_regexp(
        ws() + "proof\\(" + ws() + "\\(.\\|\n\\)*\\)" + ws() + "qed" + ws0() + ";" + ws0(),
      ),
      s_1,
      0L,
    )
    let thm = @lib.str_string_before(s_1, start)
    let proof = @lib.str_matched_group(1L, s_1)
    let rest = @lib.str_string_after(s_1, @lib.str_match_end(()))
    if rest == "" {
      "@readable.prove(" + lit(thm) + ", " + render(port_stringtotactic(proof)) + ")"
    } else {
      raise Failure("Trailing garbage after the proof...qed:\n" + rest)
    }
  } catch {
    @lib.NotFound => {
      let start = @lib.str_search_forward(@lib.str_regexp(ws() + "by"), s_1, 0L)
      let thm = @lib.str_string_before(s_1, start)
      let proof = @lib.str_string_after(s_1, @lib.str_match_end(()))
      "@readable.prove(" + lit(thm) + ", " + port_steptotactic(proof) + ")"
    }
    e => raise e
  }
}
