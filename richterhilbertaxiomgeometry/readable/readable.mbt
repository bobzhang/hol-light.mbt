// Translated from upstream RichterHilbertAxiomGeometry/readable.ml; edit this file directly.

///|
/// `parse_qproof`
pub fn parse_qproof(x1 : String) -> String raise {
  let s = x1
  @lib.string_sub(s, 1, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(s)), 1L)))
}

///|
/// `CleanMathFontsForHOL_Light`
pub fn cleanmathfontsforhol_light(x2 : String) -> String raise {
  let s = x2
  fn clean(x3 : String, x4 : @list.List[(String, String)]) -> String raise {
    let s_1 = x3
    let lostringpairs = x4
    match lostringpairs {
      Empty => s_1
      More(hd, tail=tl) => {
        let s_2 = @lib.str_global_replace(@lib.str_regexp(hd.0), hd.1, s_1)
        clean(s_2, tl)
      }
    }
  }
  clean(s, @list.List([("⇒", "==>"), ("⇔", "<=>"), ("∧", "/\\ "), ("∨", "\\/"), ("¬", "~"), ("∀", "forall "), ("∃", "?"), ("∈", "IN"), ("∉", "NOTIN"), ("α", "alpha"), ("β", "beta"), ("γ", "gamma"), ("λ", "\\ "), ("θ", "theta"), ("μ", "mu"), ("⊂", "SUBSET"), ("∩", "INTER"), ("∪", "UNION"), ("∅", "{}"), ("━", "DIFF"), ("≡", "==="), ("≅", "cong"), ("∡", "angle"), ("∥", "parallel"), ("∏", "prod"), ("∘", "_o_"), ("→", "--->"), ("╪", "INSERT"), ("≃", "TarskiCong"), ("≊", "TarskiTriangleCong"), ("ℬ", "TarskiBetween")]))
}

///|
/// `exception Readable_fail`
pub(all) suberror Readable_fail {
  Readable_fail(String)
}

///|
/// `printReadExn`
pub fn printreadexn(x5 : Error) -> Unit raise {
  let e = x5
  match e {
    Readable_fail::Readable_fail(s) => @pp.std_formatter.print_string(s)
    _ => @pp.std_formatter.print_string(@lib.printexc_to_string(e))
  }
}

///|
/// thm_ref
fn step_1() -> Unit raise {
  thm_ref_c.set(Ref::{ val: @bool.truth() })
}

///|
let thm_ref_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("thm_ref")

///|
/// `thm_ref`
pub fn thm_ref() -> Ref[@kernel.Thm] {
  thm_ref_c.get()
}

///|
/// tactic_ref
fn step_2() -> Unit raise {
  tactic_ref_c.set(Ref::{ val: @tactics.all_tac })
}

///|
let tactic_ref_c : @lib.Cell[Ref[@tactics.Tactic]] = @lib.Cell::new("tactic_ref")

///|
/// `tactic_ref`
pub fn tactic_ref() -> Ref[@tactics.Tactic] {
  tactic_ref_c.get()
}

///|
/// thmtactic_ref
fn step_3() -> Unit raise {
  thmtactic_ref_c.set(Ref::{ val: @tactics.match_mp_tac })
}

///|
let thmtactic_ref_c : @lib.Cell[Ref[@tactics.ThmTactic]] = @lib.Cell::new("thmtactic_ref")

///|
/// `thmtactic_ref`
pub fn thmtactic_ref() -> Ref[@tactics.ThmTactic] {
  thmtactic_ref_c.get()
}

///|
/// thmlist_tactic_ref
fn step_4() -> Unit raise {
  thmlist_tactic_ref_c.set(Ref::{ val: @simp.rewrite_tac })
}

///|
let thmlist_tactic_ref_c : @lib.Cell[Ref[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise]] = @lib.Cell::new("thmlist_tactic_ref")

///|
/// `thmlist_tactic_ref`
pub fn thmlist_tactic_ref() -> Ref[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] {
  thmlist_tactic_ref_c.get()
}

///|
/// termlist_thm_thm_ref
fn step_5() -> Unit raise {
  termlist_thm_thm_ref_c.set(Ref::{ val: fn(x6 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x7 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.specl(x6, x7)
    }
  } })
}

///|
let termlist_thm_thm_ref_c : @lib.Cell[Ref[(@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise]] = @lib.Cell::new("termlist_thm_thm_ref")

///|
/// `termlist_thm_thm_ref`
pub fn termlist_thm_thm_ref() -> Ref[(@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] {
  termlist_thm_thm_ref_c.get()
}

///|
/// thm_thm_ref
fn step_6() -> Unit raise {
  thm_thm_ref_c.set(Ref::{ val: @equal.gsym })
}

///|
let thm_thm_ref_c : @lib.Cell[Ref[(@kernel.Thm) -> @kernel.Thm raise]] = @lib.Cell::new("thm_thm_ref")

///|
/// `thm_thm_ref`
pub fn thm_thm_ref() -> Ref[(@kernel.Thm) -> @kernel.Thm raise] {
  thm_thm_ref_c.get()
}

///|
/// term_thm_ref
fn step_7() -> Unit raise {
  term_thm_ref_c.set(Ref::{ val: @int.arith_rule })
}

///|
let term_thm_ref_c : @lib.Cell[Ref[(@kernel.Term) -> @kernel.Thm raise]] = @lib.Cell::new("term_thm_ref")

///|
/// `term_thm_ref`
pub fn term_thm_ref() -> Ref[(@kernel.Term) -> @kernel.Thm raise] {
  term_thm_ref_c.get()
}

///|
/// thmlist_term_thm_ref
fn step_8() -> Unit raise {
  thmlist_term_thm_ref_c.set(Ref::{ val: fn(x8 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x9 : @kernel.Term) -> @kernel.Thm raise {
      @meson.meson(x8, x9)
    }
  } })
}

///|
let thmlist_term_thm_ref_c : @lib.Cell[Ref[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]] = @lib.Cell::new("thmlist_term_thm_ref")

///|
/// `thmlist_term_thm_ref`
pub fn thmlist_term_thm_ref() -> Ref[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] {
  thmlist_term_thm_ref_c.get()
}

///|
/// `exec_thm`
pub fn exec_thm(x10 : String) -> @kernel.Thm raise {
  let s = x10
  if @lib.str_string_match(@lib.str_regexp("[^;]*;"), s, 0L) {
    raise @parserutil.Noparse
  } else {
    try {
      exec(("thm_ref := ((" + (s + "): thm);;")))
      thm_ref().val
    } catch {
      _ => raise @parserutil.Noparse
    }
  }
}

///|
/// `exec_tactic`
pub fn exec_tactic(x11 : String) -> @tactics.Tactic raise {
  let s = x11
  try {
    exec(("tactic_ref := ((" + (s + "): tactic);;")))
    tactic_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `exec_thmlist_tactic`
pub fn exec_thmlist_tactic(x13 : String) -> ((@list.List[@kernel.Thm]) -> @tactics.Tactic raise) raise {
  let s = x13
  try {
    exec(("thmlist_tactic_ref := ((" + (s + "): thm list -> tactic);;")))
    thmlist_tactic_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `exec_thmtactic`
pub fn exec_thmtactic(x15 : String) -> @tactics.ThmTactic raise {
  let s = x15
  try {
    exec(("thmtactic_ref := ((" + (s + "): thm -> tactic);;")))
    thmtactic_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `exec_termlist_thm_thm`
pub fn exec_termlist_thm_thm(x17 : String) -> ((@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  let s = x17
  try {
    exec(("termlist_thm_thm_ref := ((" + (s + "): (term list -> thm -> thm));;")))
    termlist_thm_thm_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `exec_thm_thm`
pub fn exec_thm_thm(x19 : String) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let s = x19
  try {
    exec(("thm_thm_ref := ((" + (s + "): (thm -> thm));;")))
    thm_thm_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `exec_term_thm`
pub fn exec_term_thm(x21 : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let s = x21
  try {
    exec(("term_thm_ref := ((" + (s + "): (term -> thm));;")))
    term_thm_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `exec_thmlist_term_thm`
pub fn exec_thmlist_term_thm(x23 : String) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  let s = x23
  try {
    exec(("thmlist_term_thm_ref := ((" + (s + "): (thm list ->term -> thm));;")))
    thmlist_term_thm_ref().val
  } catch {
    _ => raise @parserutil.Noparse
  }
}

///|
/// `make_env`
pub fn make_env(x25 : @list.List[(String, @kernel.Thm)], x26 : @kernel.Term) -> @list.List[(String, @preterm.Pretype)] raise {
  let (asl, w) = (x25, x26)
  @lib.map(fn(x28 : @kernel.Term) -> (String, @preterm.Pretype) raise {
    (fn(x27 : (String, @kernel.HolType)) -> (String, @preterm.Pretype) raise {
      let (s, ty) = x27
      (s, @preterm.pretype_of_type(ty))
    })(@kernel.dest_var(x28))
  }, @kernel.freesl(@lib.map(fn(x31 : (String, @kernel.Thm)) -> @kernel.Term raise {
    (fn(x29 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x29)
    })((fn(x30 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x30.1
    })(x31))
  }, asl).prepend(w)))
}

///|
/// `parse_env_string`
pub fn parse_env_string(x32 : @list.List[(String, @preterm.Pretype)], x33 : String) -> @kernel.Term raise {
  let env = x32
  let s = x33
  let (ptm, l) = (fn(x34 : String) -> (@preterm.Preterm, ArrayView[@lexer.Lexcode]) raise {
    @parser.parse_preterm(@lexer.lex(x34))
  })(s)
  if l.is_empty() {
    @preterm.term_of_preterm(((x36 : @preterm.Preterm) => @preterm.retypecheck(env, x36))(ptm))
  } else {
    raise Readable_fail::Readable_fail(("Unparsed input  at the end of the term\n" + s))
  }
}

///|
/// `NewConstant`
pub fn newconstant(x37 : String, x38 : @kernel.HolType) -> Unit raise {
  let (x, y) = (x37, x38)
  @kernel.new_constant(cleanmathfontsforhol_light(x), y)
}

///|
/// `ParseAsInfix`
pub fn parseasinfix(x39 : String, x40 : (Int64, String)) -> Unit raise {
  let (x, y) = (x39, x40)
  @printer.parse_as_infix(cleanmathfontsforhol_light(x), y)
}

///|
/// `NewDefinition`
pub fn newdefinition(x41 : String) -> @kernel.Thm raise {
  let s = x41
  @pair.new_definition(parse_env_string(@list.List([]), cleanmathfontsforhol_light(s)))
}

///|
/// `NewAxiom`
pub fn newaxiom(x42 : String) -> @kernel.Thm raise {
  let s = x42
  @kernel.new_axiom(parse_env_string(@list.List([]), cleanmathfontsforhol_light(s)))
}

///|
/// `subgoal_THEN`
pub fn subgoal_then(x43 : String, x44 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let stm = x43
  let ttac = x44
  let gl = x45
  @tactics.subgoal_then(parse_env_string(make_env(gl.0, gl.1), stm), ttac)(gl)
}

///|
/// `subgoal_TAC`
pub fn subgoal_tac(x46 : String, x47 : String, x48 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let stm = x46
  let lab = x47
  let tac = x48
  let gl = x49
  @tactics.subgoal_tac(lab, parse_env_string(make_env(gl.0, gl.1), stm), @list.List([tac]))(gl)
}

///|
/// `exists_TAC`
pub fn exists_tac(x50 : String, x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let stm = x50
  let gl = x51
  @tactics.exists_tac(parse_env_string(make_env(gl.0, gl.1), stm))(gl)
}

///|
/// `X_gen_TAC`
pub fn x_gen_tac(x52 : String, x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let svar = x52
  let (asl, w) as gl = x53
  let vartype = (fn(x57 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
    (fn(x55 : @kernel.Term) -> @kernel.HolType raise {
      (fn(x54 : (String, @kernel.HolType)) -> @kernel.HolType raise {
        x54.1
      })(@kernel.dest_var(x55))
    })((fn(x56 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x56.0
    })(x57))
  })(@basics.dest_forall(w))
  @tactics.x_gen_tac(@kernel.mk_var(svar, vartype))(gl)
}

///|
/// `X_genl_TAC`
pub fn x_genl_tac(x58 : @list.List[String]) -> @tactics.Tactic raise {
  let svarlist = x58
  @tactics.map_every(fn(x60 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      x_gen_tac(x60, x61)
    }
  }, svarlist)
}

///|
/// `intro_TAC`
pub fn intro_tac(x62 : String) -> @tactics.Tactic raise {
  let s = x62
  @theorems.intro_tac(@lib.str_global_replace(@lib.str_regexp(","), ";", s))
}

///|
/// `assume`
pub fn assume_(x64 : String, x65 : String, x66 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let statement = x64
  let lab = x65
  let tac = x66
  let (asl, w) as gl = x67
  let t = parse_env_string(make_env(gl.0, gl.1), statement)
  let t77 = @tactics.hyp_tac(@simp.simp_tac, lab)(@list.List([]))
  let t76 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.first_assum(fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s74 = @tactics.mp_tac(x73)
    fn(x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s74(x75)
    }
  }), tac)])
  let t72 = @bool.spec(t, @class.excluded_middle())
  @tactics.then_tac(@tactics.thenl(@tactics.disj_cases_then(fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s70 = ((x68 : @kernel.Thm) => @tactics.label_tac(lab, x68))(x69)
    fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s70(x71)
    }
  })(t72), t76), t77)(gl)
}

///|
/// `eq_tac`
pub fn eq_tac(x78 : String, x79 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let string = x78
  let tac = x79
  if (string == "Right") {
    @tactics.thenl(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), @tactics.eq_tac), @list.List([tac, @tactics.all_tac]))
  } else {
    if (string == "Left") {
      @tactics.thenl(@tactics.eq_tac, @list.List([tac, @tactics.all_tac]))
    } else {
      raise Readable_fail::Readable_fail(("eq_tac requires " + (string + " to be either Left or Right")))
    }
  }
}

///|
/// `conj_tac`
pub fn conj_tac(x81 : String, x82 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let string = x81
  let tac = x82
  if (string == "Right") {
    @tactics.thenl(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])), @tactics.conj_tac), @list.List([tac, @tactics.all_tac]))
  } else {
    if (string == "Left") {
      @tactics.thenl(@tactics.conj_tac, @list.List([tac, @tactics.all_tac]))
    } else {
      raise Readable_fail::Readable_fail(("conj_tac requires " + (string + " to be either Left or Right")))
    }
  }
}

///|
/// `consider`
pub fn consider(x84 : String, x85 : String, x86 : String, x87 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let svars = x84
  let stm = x85
  let lab = x86
  let tac = x87
  let t89 = @theorems.destruct_tac(("@" + (svars + ("." + lab))))
  let t90 = ("?" + (svars + (". " + stm)))
  @tactics.thenl((x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => subgoal_then(t90, t89, x91), @list.List([tac, @tactics.all_tac]))
}

///|
/// `case_split`
pub fn case_split(x92 : String, x93 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x94 : @list.List[String], x95 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> @tactics.Tactic raise {
  let sdestruct = x92
  let tac = x93
  let listofdisj = x94
  let listoftac = x95
  let disjunction = @lib.itlist(fn(x97 : String, x98 : String) -> String raise {
    let s = x97
    let t = x98
    if (t == "") {
      ("(" + (s + ")"))
    } else {
      ("(" + (s + (") \\/ " + t)))
    }
  }, listofdisj, "")
  @tactics.thenl(@tactics.then_tac((x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => subgoal_tac(disjunction, "", tac, x99), @tactics.first_x_assum(@theorems.destruct_tac(sdestruct))), listoftac)
}

///|
/// fol
fn step_9() -> Unit raise {
  fol_c.set(@meson.meson_tac)
}

///|
let fol_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("fol")

///|
/// `fol`
pub fn fol(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (fol_c.get())(x)
}

///|
/// rewrite
fn step_10() -> Unit raise {
  rewrite_c.set(@simp.rewrite_tac)
}

///|
let rewrite_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewrite")

///|
/// `rewrite`
pub fn rewrite(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewrite_c.get())(x)
}

///|
/// simplify
fn step_11() -> Unit raise {
  simplify_c.set(@simp.simp_tac)
}

///|
let simplify_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("simplify")

///|
/// `simplify`
pub fn simplify(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (simplify_c.get())(x)
}

///|
/// set
fn step_12() -> Unit raise {
  set_c.set(@sets.set_tac)
}

///|
let set_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("set")

///|
/// `set`
pub fn set(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (set_c.get())(x)
}

///|
/// rewriteR
fn step_13() -> Unit raise {
  rewriter_c.set((x103 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x100 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s101 = @equal.rand_conv(x100)
    fn(x102 : @kernel.Term) -> @kernel.Thm raise {
      s101(x102)
    }
  }, x103))
}

///|
let rewriter_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteR")

///|
/// `rewriteR`
pub fn rewriter(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewriter_c.get())(x)
}

///|
/// rewriteL
fn step_14() -> Unit raise {
  rewritel_c.set((x107 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x104 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s105 = @equal.land_conv(x104)
    fn(x106 : @kernel.Term) -> @kernel.Thm raise {
      s105(x106)
    }
  }, x107))
}

///|
let rewritel_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteL")

///|
/// `rewriteL`
pub fn rewritel(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewritel_c.get())(x)
}

///|
/// rewriteI
fn step_15() -> Unit raise {
  rewritei_c.set((x109 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x108 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x108
  }, x109))
}

///|
let rewritei_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteI")

///|
/// `rewriteI`
pub fn rewritei(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewritei_c.get())(x)
}

///|
/// rewriteRLDepth
fn step_16() -> Unit raise {
  rewriterldepth_c.set((x121 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x120 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x116 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x110 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s111 = @equal.rand_conv(x110)
        fn(x112 : @kernel.Term) -> @kernel.Thm raise {
          s111(x112)
        }
      })((fn(x113 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s114 = @equal.land_conv(x113)
        fn(x115 : @kernel.Term) -> @kernel.Thm raise {
          s114(x115)
        }
      })(x116))
    })((fn(x117 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s118 = @equal.depth_conv(x117)
      fn(x119 : @kernel.Term) -> @kernel.Thm raise {
        s118(x119)
      }
    })(x120))
  }, x121))
}

///|
let rewriterldepth_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteRLDepth")

///|
/// `rewriteRLDepth`
pub fn rewriterldepth(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewriterldepth_c.get())(x)
}

///|
/// `TACtoThmTactic`
pub fn tactothmtactic(x122 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x123 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let tac = x122
  let ths = x123
  @tactics.then_tac(@tactics.map_every(fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s126 = @tactics.mp_tac(x125)
    fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s126(x127)
    }
  }, ths), tac)
}

///|
/// arithmetic
fn step_17() -> Unit raise {
  arithmetic_c.set((x128 : @list.List[@kernel.Thm]) => tactothmtactic(@int.arith_tac, x128))
}

///|
let arithmetic_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("arithmetic")

///|
/// `arithmetic`
pub fn arithmetic(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (arithmetic_c.get())(x)
}

///|
/// real_arithmetic
fn step_18() -> Unit raise {
  real_arithmetic_c.set((x129 : @list.List[@kernel.Thm]) => tactothmtactic(@calc_rat.real_arith_tac, x129))
}

///|
let real_arithmetic_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("real_arithmetic")

///|
/// `real_arithmetic`
pub fn real_arithmetic(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (real_arithmetic_c.get())(x)
}

///|
/// num_ring
fn step_19() -> Unit raise {
  let t130 = @tactics.conv_tac(@grobner.num_ring)
  num_ring_c.set((x131 : @list.List[@kernel.Thm]) => tactothmtactic(t130, x131))
}

///|
let num_ring_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("num_ring")

///|
/// `num_ring`
pub fn num_ring(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (num_ring_c.get())(x)
}

///|
/// real_ring
fn step_20() -> Unit raise {
  let t132 = @tactics.conv_tac(@calc_rat.real_ring)
  real_ring_c.set((x133 : @list.List[@kernel.Thm]) => tactothmtactic(t132, x133))
}

///|
let real_ring_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("real_ring")

///|
/// `real_ring`
pub fn real_ring(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (real_ring_c.get())(x)
}

///|
/// ws
fn step_21() -> Unit raise {
  ws_c.set("[ \t\n]+")
}

///|
let ws_c : @lib.Cell[String] = @lib.Cell::new("ws")

///|
/// `ws`
pub fn ws() -> String {
  ws_c.get()
}

///|
/// ws0
fn step_22() -> Unit raise {
  ws0_c.set("[ \t\n]*")
}

///|
let ws0_c : @lib.Cell[String] = @lib.Cell::new("ws0")

///|
/// `ws0`
pub fn ws0() -> String {
  ws0_c.get()
}

///|
/// `StringRegexpEqual`
pub fn stringregexpequal(x134 : @lib.StrRegexp, x135 : String) -> Bool raise {
  let r = x134
  let s = x135
  (@lib.str_string_match(r, s, 0L) && (s == @lib.str_matched_string(s)))
}

///|
/// `FindMatch`
pub fn findmatch(x136 : String, x137 : String, x138 : String) -> Int64 raise {
  let sleft = x136
  let sright = x137
  let s = x138
  let test_ = @lib.str_regexp(("\\(" + (sleft + ("\\|" + (sright + "\\)")))))
  let left = @lib.str_regexp(sleft)
  fn findmatchposition(x139 : String, x140 : Int64) -> Int64 raise {
    let s_1 = x139
    let count = x140
    if (count == 1L) {
      0L
    } else {
      try {
        ignore(@lib.str_search_forward(test_, s_1, 0L))
        let testmatch = @lib.str_matched_group(1L, s_1)
        let aftertest = @lib.str_match_end(())
        let lastchar = @lib.str_last_chars(@lib.str_string_before(s_1, aftertest), 1L)
        let endpos = if @lib.str_string_match(@lib.str_regexp(ws()), lastchar, 0L) {
          @lib.sub63(aftertest, 1L)
        } else {
          aftertest
        }
        let rest = @lib.str_string_after(s_1, endpos)
        let increment = if stringregexpequal(left, testmatch) {
          (-1L)
        } else {
          1L
        }
        @lib.add63(endpos, findmatchposition(rest, @lib.add63(count, increment)))
      } catch {
        @lib.NotFound => raise Readable_fail::Readable_fail(("No matching right bracket operator " + (sright + (" to left bracket operator " + (sleft + (" in " + s_1))))))
        e => raise e
      }
    }
  }
  findmatchposition(s, 0L)
}

///|
/// `FindSemicolon`
pub fn findsemicolon(x141 : String) -> Int64 raise {
  let s = x141
  try {
    fn findmatchposition(x142 : String, x143 : Int64) -> Int64 raise {
      let s_1 = x142
      let pos = x143
      let start = @lib.str_search_forward(@lib.str_regexp(";\\|\\["), s_1, pos)
      if (@lib.str_matched_string(s_1) == ";") {
        start
      } else {
        let rest = @lib.str_string_after(s_1, @lib.add63(start, 1L))
        let matchingsquarebrace = findmatch("\\[", "\\]", rest)
        let newpos = @lib.add63(@lib.add63(start, 1L), matchingsquarebrace)
        findmatchposition(s_1, newpos)
      }
    }
    findmatchposition(s, 0L)
  } catch {
    @lib.NotFound => raise Readable_fail::Readable_fail(("No final semicolon in " + s))
    e => raise e
  }
}

///|
/// `FindCases`
pub fn findcases(x144 : String) -> @list.List[String] raise {
  let s = x144
  let t145 = (ws() + ("end" + (ws0() + ";")))
  let (sleftcase, srightcase) = ((ws() + ("suppose" + ws())), t145)
  if @lib.str_string_match(@lib.str_regexp(sleftcase), s, 0L) {
    let caseendrest = @lib.str_string_after(s, @lib.str_match_end(()))
    let posafterend = findmatch(sleftcase, srightcase, caseendrest)
    let pos = @lib.str_search_backward(@lib.str_regexp(srightcase), caseendrest, posafterend)
    let case = @lib.str_string_before(caseendrest, pos)
    let rest = @lib.str_string_after(caseendrest, posafterend)
    findcases(rest).prepend(case)
  } else {
    @list.List([])
  }
}

///|
/// `StringToList`
pub fn stringtolist(x146 : String) -> @list.List[String] raise {
  let s = x146
  if stringregexpequal(@lib.str_regexp(ws0()), s) {
    @list.List([])
  } else {
    if @lib.str_string_match(@lib.str_regexp("[^;]*;"), s, 0L) {
      let pos = findsemicolon(s)
      let head = @lib.str_string_before(s, pos)
      stringtolist(@lib.str_string_after(s, @lib.add63(pos, 1L))).prepend(head)
    } else {
      @list.List([s])
    }
  }
}

///|
/// `ExtractWsStringList`
pub fn extractwsstringlist(x147 : String) -> ((@list.List[String], String)) raise {
  let string = x147
  if @lib.str_string_match(@lib.str_regexp((ws() + "\\[")), string, 0L) {
    let listrest = @lib.str_string_after(string, @lib.str_match_end(()))
    let rightbrace = findmatch("\\[", "\\]", listrest)
    let rest = @lib.str_string_after(listrest, rightbrace)
    let list = @lib.str_string_before(listrest, @lib.sub63(rightbrace, 1L))
    (stringtolist(list), rest)
  } else {
    raise @lib.NotFound
  }
}

///|
/// `CombTermThm_Term`
pub fn combtermthm_term(x148 : String, x149 : String, x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@kernel.Thm, String)) raise {
  let word = x148
  let rest = x149
  let gl = x150
  let termthm : (@kernel.Term) -> @kernel.Thm raise = exec_term_thm(word)
  try {
    let (stermlist, wsrest) = extractwsstringlist(rest)
    if (Int::to_int64(@lib.length(stermlist)) == 1L) {
      let t151 = @lib.hd(stermlist)
      let term = parse_env_string(make_env(gl.0, gl.1), t151)
      (termthm(term), wsrest)
    } else {
      raise Readable_fail::Readable_fail(("term->thm " + (word + (" not followed by length 1 term list, but instead the list \n[" + (@lib.string_concat(";", stermlist) + "]")))))
    }
  } catch {
    @lib.NotFound => raise Readable_fail::Readable_fail(("term->thm " + (word + (" not followed by term list, but instead \n" + rest))))
    e => raise e
  }
}

///|
/// `theoremify`
pub fn theoremify(x152 : String, x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@kernel.Thm, String)) raise {
  let string = x152
  let gl = x153
  if @lib.str_string_match(@lib.str_regexp((ws() + "\\([^][ \t\n]+\\)")), string, 0L) {
    let word = @lib.str_matched_group(1L, string)
    let rest = @lib.str_string_after(string, @lib.str_match_end(()))
    if (word == "-") {
      (@lib.hd(gl.0).1, rest)
    } else {
      try {
        (exec_thm(word), rest)
      } catch {
        _ => {
          try {
            (@lib.assoc(word, gl.0), rest)
          } catch {
            _ => {
              try {
                let t154 = theoremify(rest, gl)
                firstpairmult(exec_thm_thm(word), t154)
              } catch {
                _ => {
                  try {
                    combtermthm_term(word, rest, gl)
                  } catch {
                    @parserutil.Noparse => {
                      try {
                        combthmlisttermthm_thmlist_term(word, rest, gl)
                      } catch {
                        @parserutil.Noparse => {
                          try {
                            combtermlistthmthm_termlist(word, rest, gl)
                          } catch {
                            @parserutil.Noparse => raise Readable_fail::Readable_fail(("Not a theorem:\n" + string))
                            e => raise e
                          }
                        }
                        e => raise e
                      }
                    }
                    e => raise e
                  }
                }
              }
            }
          }
        }
      }
    }
  } else {
    raise Readable_fail::Readable_fail(("Empty theorem:\n" + string))
  }
}

///|
/// `firstPairMult`
pub fn firstpairmult(x155 : (@kernel.Thm) -> @kernel.Thm raise, x156 : (@kernel.Thm, String)) -> ((@kernel.Thm, String)) raise {
  let f = x155
  let (a, b) = x156
  (f(a), b)
}

///|
/// `CombTermlistThmThm_Termlist`
pub fn combtermlistthmthm_termlist(x157 : String, x158 : String, x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@kernel.Thm, String)) raise {
  let word_1 = x157
  let rest_1 = x158
  let gl_1 = x159
  let termlistthmthm : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = exec_termlist_thm_thm(word_1)
  try {
    let (stermlist, wsthm) = extractwsstringlist(rest_1)
    let t160 = make_env(gl_1.0, gl_1.1)
    let termlist = @lib.map((x161 : String) => parse_env_string(t160, x161), stermlist)
    let t162 = theoremify(wsthm, gl_1)
    firstpairmult(termlistthmthm(termlist), t162)
  } catch {
    @lib.NotFound => raise Readable_fail::Readable_fail(("termlist->thm->thm " + (word_1 + ("\n not followed by term list in\n" + rest_1))))
    e => raise e
  }
}

///|
/// `CombThmlistTermThm_Thmlist_Term`
pub fn combthmlisttermthm_thmlist_term(x163 : String, x164 : String, x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@kernel.Thm, String)) raise {
  let word_2 = x163
  let rest_2 = x164
  let gl_2 = x165
  let thm_create : (String) -> @kernel.Thm raise = fn(x166 : String) -> @kernel.Thm raise {
    let sthm = x166
    let (thm, rest_3) = theoremify((" " + sthm), gl_2)
    if (rest_3 == "") {
      thm
    } else {
      raise Readable_fail::Readable_fail(("an argument of thmlist->term->thm " + (word_2 + ("\n is not a theorem, but instead \n" + sthm))))
    }
  }
  let thmlisttermthm : (@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = exec_thmlist_term_thm(word_2)
  try {
    let (stermlist_1, wstermrest) = extractwsstringlist(rest_2)
    let thmlist = @lib.map(thm_create, stermlist_1)
    if @lib.str_string_match(@lib.str_regexp((ws() + "\\[")), wstermrest, 0L) {
      let termrest = @lib.str_string_after(wstermrest, @lib.str_match_end(()))
      let rightbrace = findmatch("\\[", "\\]", termrest)
      let rest_4 = @lib.str_string_after(termrest, rightbrace)
      let sterm = @lib.str_string_before(termrest, @lib.sub63(rightbrace, 1L))
      let term = parse_env_string(make_env(gl_2.0, gl_2.1), sterm)
      (thmlisttermthm(thmlist)(term), rest_4)
    } else {
      let t167 = ("]\n      not followed by term in\n" + wstermrest)
      raise Readable_fail::Readable_fail(("thmlist->term->thm " + (word_2 + (" followed by list of theorems [" + (@lib.string_concat(";", stermlist_1) + t167)))))
    }
  } catch {
    @lib.NotFound => raise Readable_fail::Readable_fail(("thmlist->term->thm " + (word_2 + (" not followed by thm list in\n" + rest_2))))
    e => raise e
  }
}

///|
/// `CombThmtactic_Thm`
pub fn combthmtactic_thm(x168 : String) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let step = x168
  if @lib.str_string_match(@lib.str_regexp((ws() + "\\([a-zA-Z0-9_]+\\)")), step, 0L) {
    let sthm_tactic = @lib.str_matched_group(1L, step)
    let sthm = @lib.str_string_after(step, @lib.str_match_end(()))
    let thm_tactic : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = exec_thmtactic(sthm_tactic)
    fn(x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let gl = x170
      let (thm, rest) = theoremify(sthm, gl)
      if (rest == "") {
        thm_tactic(thm)(gl)
      } else {
        raise Readable_fail::Readable_fail(("thm_tactic " + (sthm_tactic + (" not followed by a theorem, but instead\n" + sthm))))
      }
    }
  } else {
    raise @lib.NotFound
  }
}

///|
/// `CombThmlisttactic_Thmlist`
pub fn combthmlisttactic_thmlist(x171 : String) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let step = x171
  fn makethmlistaccum(x173 : String, x174 : @list.List[@kernel.Thm], x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @list.List[@kernel.Thm] raise {
    let string = x173
    let list = x174
    let gl = x175
    if stringregexpequal(@lib.str_regexp(ws0()), string) {
      list
    } else {
      let (thm, rest) = theoremify(string, gl)
      makethmlistaccum(rest, list.prepend(thm), gl)
    }
  }
  if @lib.str_string_match(@lib.str_regexp((ws() + "\\([a-zA-Z0-9_]+\\)")), step, 0L) {
    let ttac : (@list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = exec_thmlist_tactic(@lib.str_matched_group(1L, step))
    let labthmstring = @lib.str_string_after(step, @lib.str_match_end(()))
    fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let gl_1 = x176
      let labthmlist = @lib.rev(makethmlistaccum(labthmstring, @list.List([]), gl_1))
      ttac(labthmlist)(gl_1)
    }
  } else {
    raise @lib.NotFound
  }
}

///|
/// `StringToTactic`
pub fn stringtotactic(x177 : String) -> @tactics.Tactic raise {
  let s = x177
  let s_1 = @lib.str_global_replace(@lib.str_regexp("::[^\n]*"), "", s)
  if stringregexpequal(@lib.str_regexp(ws0()), s_1) {
    @tactics.all_tac
  } else {
    try {
      makecasesplit(s_1)
    } catch {
      _ => {
        let pos = findsemicolon(s_1)
        let t179 = @lib.str_string_after(s_1, @lib.add63(pos, 1L))
        let (step, rest) = (@lib.str_string_before(s_1, pos), t179)
        try {
          let tactic : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = steptotactic(step)
          @tactics.then_tac(tactic, stringtotactic(rest))
        } catch {
          @lib.NotFound => {
            let (tactic_1, rest_1) = bigsteptotactic(s_1, step)
            @tactics.then_tac(tactic_1, stringtotactic(rest_1))
          }
          e => raise e
        }
      }
    }
  }
}

///|
/// `GetProof`
pub fn getproof(x180 : String, x181 : String) -> ((@tactics.Tactic, String)) raise {
  let byproof = x180
  let s_2 = x181
  if (byproof == "by") {
    let pos_1 = findsemicolon(s_2)
    let t182 = @lib.str_string_after(s_2, @lib.add63(pos_1, 1L))
    let (step_23, rest_2) = (@lib.str_string_before(s_2, pos_1), t182)
    (steptotactic(step_23), rest_2)
  } else {
    let t183 = (ws() + ("qed" + (ws0() + ";")))
    let pos_after_qed = findmatch((ws() + ("proof" + ws())), t183, s_2)
    let pos_2 = @lib.str_search_backward(@lib.str_regexp("qed"), s_2, pos_after_qed)
    let proof : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = stringtotactic(@lib.str_string_before(s_2, pos_2))
    (proof, @lib.str_string_after(s_2, pos_after_qed))
  }
}

///|
/// `makeCaseSplit`
pub fn makecasesplit(x184 : String) -> @tactics.Tactic raise {
  let s_3 = x184
  if @lib.str_string_match(@lib.str_regexp((ws() + ("case_split" + (ws() + ("\\([^;]+\\)" + (ws() + ("\\(by\\|proof\\)" + ws()))))))), s_3, 0L) {
    let sdestruct = @lib.str_matched_group(1L, s_3)
    let t186 = @lib.str_string_after(s_3, @lib.str_group_end(2L))
    let (proof_1, rest_3) = getproof(@lib.str_matched_group(2L, s_3), t186)
    let splitatsemicolon : (String) -> @list.List[String] raise = fn(x187 : String) -> @list.List[String] raise {
      let case = x187
      let pos_3 = findsemicolon(case)
      let t188 = @lib.str_string_after(case, @lib.add63(pos_3, 1L))
      @list.List([@lib.str_string_before(case, pos_3), t188])
    }
    let list2case = @lib.map(splitatsemicolon, findcases(rest_3))
    let listofdisj = @lib.map(@lib.hd, list2case)
    let listoftac = @lib.map(fn(x190 : @list.List[String]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x189 : @list.List[String]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        stringtotactic(@lib.hd(x189))
      })(@lib.tl(x190))
    }, list2case)
    case_split(sdestruct, proof_1, listofdisj, listoftac)
  } else {
    raise @lib.NotFound
  }
}

///|
/// `StepToTactic`
pub fn steptotactic(x191 : String) -> @tactics.Tactic raise {
  let step_24 = x191
  try {
    if stringregexpequal(@lib.str_regexp((ws() + ("\\([^ \t\n]+\\)" + ws0()))), step_24) {
      exec_tactic(@lib.str_matched_group(1L, step_24))
    } else {
      raise @lib.NotFound
    }
  } catch {
    _ => {
      try {
        combthmtactic_thm(step_24)
      } catch {
        _ => {
          try {
            combthmlisttactic_thmlist(step_24)
          } catch {
            _ => {
              if @lib.str_string_match(@lib.str_regexp((ws() + ("intro_TAC" + ws()))), step_24, 0L) {
                let intro_string = @lib.str_string_after(step_24, @lib.str_match_end(()))
                intro_tac(intro_string)
              } else {
                if @lib.str_string_match(@lib.str_regexp((ws() + ("exists_TAC" + ws()))), step_24, 0L) {
                  let exists_string = @lib.str_string_after(step_24, @lib.str_match_end(()))
                  (x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => exists_tac(exists_string, x193)
                } else {
                  if @lib.str_string_match(@lib.str_regexp((ws() + ("X_genl_TAC" + ws()))), step_24, 0L) {
                    let genl_string = @lib.str_string_after(step_24, @lib.str_match_end(()))
                    let svarlist = @lib.str_split(@lib.str_regexp(ws()), genl_string)
                    x_genl_tac(svarlist)
                  } else {
                    raise @lib.NotFound
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

///|
/// `BigStepToTactic`
pub fn bigsteptotactic(x194 : String, x195 : String) -> ((@tactics.Tactic, String)) raise {
  let s_4 = x194
  let step_25 = x195
  if @lib.str_string_match(@lib.str_regexp((ws() + ("consider" + (ws() + ("\\(\\(.\\|\n\\)+\\)" + (ws() + ("such" + (ws() + ("that" + (ws() + ("\\(\\(.\\|\n\\)+\\)" + (ws() + ("\\[\\(\\(.\\|\n\\)*\\)\\]" + (ws() + ("\\(by\\|proof\\)" + ws()))))))))))))))), step_25, 0L) {
    let t196 = @lib.str_matched_group(3L, step_25)
    let (vars, t) = (@lib.str_matched_group(1L, step_25), t196)
    let lab = @lib.str_matched_group(5L, step_25)
    let t197 = @lib.str_group_end(7L)
    let (keyword, endkeyword) = (@lib.str_matched_group(7L, step_25), t197)
    let (proof_2, rest_4) = getproof(keyword, @lib.str_string_after(s_4, endkeyword))
    (consider(vars, t, lab, proof_2), rest_4)
  } else {
    try {
      let start = @lib.str_search_forward(@lib.str_regexp((ws() + ("\\[\\([^]]*\\)\\]" + (ws() + ("\\(by\\|proof\\)" + ws()))))), step_25, 0L)
      let statement = @lib.str_string_before(step_25, start)
      let lab_1 = @lib.str_matched_group(1L, step_25)
      let keyword_1 = @lib.str_matched_group(2L, step_25)
      let afterword = @lib.str_string_after(s_4, @lib.str_group_end(2L))
      let (proof_3, rest_5) = getproof(keyword_1, afterword)
      if stringregexpequal(@lib.str_regexp((ws() + "eq_tac")), statement) {
        (eq_tac(lab_1, proof_3), rest_5)
      } else {
        if stringregexpequal(@lib.str_regexp((ws() + "conj_tac")), statement) {
          (conj_tac(lab_1, proof_3), rest_5)
        } else {
          if @lib.str_string_match(@lib.str_regexp((ws() + ("\\(assume\\)" + ws()))), statement, 0L) {
            let statement_1 = @lib.str_string_after(statement, @lib.str_match_end(()))
            ((x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => assume_(statement_1, lab_1, proof_3, x198), rest_5)
          } else {
            ((x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => subgoal_tac(statement, lab_1, proof_3, x199), rest_5)
          }
        }
      }
    } catch {
      @lib.NotFound => raise Readable_fail::Readable_fail(("Can't parse as a Proof:\n" + step_25))
      e => raise e
    }
  }
}

///|
/// `theorem`
pub fn theorem(x200 : String) -> @kernel.Thm raise {
  let s = x200
  let s_1 = cleanmathfontsforhol_light(s)
  try {
    let start = @lib.str_search_forward(@lib.str_regexp((ws() + ("proof\\(" + (ws() + ("\\(.\\|\n\\)*\\)" + (ws() + ("qed" + (ws0() + (";" + ws0()))))))))), s_1, 0L)
    let thm = @lib.str_string_before(s_1, start)
    let proof = @lib.str_matched_group(1L, s_1)
    let rest = @lib.str_string_after(s_1, @lib.str_match_end(()))
    if (rest == "") {
      let t201 = stringtotactic(proof)
      @tactics.prove(parse_env_string(@list.List([]), thm), t201)
    } else {
      raise Readable_fail::Readable_fail(("Trailing garbage after the proof...qed:\n" + rest))
    }
  } catch {
    @lib.NotFound => {
      try {
        let start_1 = @lib.str_search_forward(@lib.str_regexp((ws() + "by")), s_1, 0L)
        let thm_1 = @lib.str_string_before(s_1, start_1)
        let proof_1 = @lib.str_string_after(s_1, @lib.str_match_end(()))
        try {
          let t202 = steptotactic(proof_1)
          @tactics.prove(parse_env_string(@list.List([]), thm_1), t202)
        } catch {
          @lib.NotFound => raise Readable_fail::Readable_fail(("Not a proof:\n" + proof_1))
          e => raise e
        }
      } catch {
        @lib.NotFound => raise Readable_fail::Readable_fail(("Missing initial \"proof\", \"by\", or final \"qed;\" in\n" + s_1))
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `interactive_goal`
pub fn interactive_goal(x203 : String) -> @tactics.Goalstack raise {
  let s = x203
  let thm = cleanmathfontsforhol_light(s)
  @tactics.g(parse_env_string(@list.List([]), thm))
}

///|
/// `interactive_proof`
pub fn interactive_proof(x204 : String) -> @tactics.Goalstack raise {
  let s = x204
  let proof = cleanmathfontsforhol_light(s)
  @tactics.e(stringtotactic(proof))
}

///|
/// SKOLEM_THM_GEN
fn step_23() -> Unit raise {
  skolem_thm_gen_c.set(prove(
    "\n  forall P R. (forall x. P x ==> ?y. R x y)  <=>  ?f. forall x. P x ==> R x (f x)",
    steps(
      [
        intro_tac("forall P R"),
        eq_tac("Right", by(fol, [])),
        intro_tac("H1"),
        exists("\\ x. @y. R x y"),
        by(fol, [Label("H1")]),
      ],
    ),
  ))
}

///|
let skolem_thm_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SKOLEM_THM_GEN")

///|
/// `SKOLEM_THM_GEN`
pub fn skolem_thm_gen() -> @kernel.Thm {
  skolem_thm_gen_c.get()
}

///|
/// MOD_MOD_REFL'
fn step_25() -> Unit raise {
  mod_mod_refl_p_c.set(prove(
    "\n  forall m n. ~(n = 0)  ==>  ((m MOD n) MOD n = m MOD n)",
    steps(
      [
        intro_tac("forall m n, H1"),
        by_thm(
          th => @tactics.mp_tac(th),
          TermsRule(
            tms => th => @bool.specl(tms, th),
            ["m", " n", " 1"],
            Thm("MOD_MOD", () => @arith.mod_mod()),
          ),
        ),
        by(
          fol,
          [
            Label("H1"),
            Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
            Thm("MULT_EQ_0", () => @arith.mult_eq_0()),
            Thm("ONE", () => @arith.one()),
            Thm("NOT_SUC", () => @nums.not_suc()),
          ],
        ),
      ],
    ),
  ))
}

///|
let mod_mod_refl_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MOD_REFL'")

///|
/// `MOD_MOD_REFL'`
pub fn mod_mod_refl_p() -> @kernel.Thm {
  mod_mod_refl_p_c.get()
}

///|
/// NSQRT_2
fn step_33() -> Unit raise {
  nsqrt_2_v1_c.set(prove(
    "\n  forall p q. p * p = 2 * q * q  ==>  q = 0",
    steps_then(
      [
        by_thm(@tactics.match_mp_tac, Thm("num_WF", () => @arith.num_wf())),
        intro_tac("forall p, A, forall q, B"),
        have("\n    EVEN(p * p) <=> EVEN(2 * q * q)", "", by(fol, [Label("B")])),
        have(
          "\n    EVEN(p)",
          "",
          by(
            fol,
            [
              Prev,
              Thm("EVEN_DOUBLE", () => @arith.even_double()),
              Thm("EVEN_MULT", () => @arith.even_mult()),
            ],
          ),
        ),
        consider(
          "m",
          "p = 2 * m    ",
          "C",
          by(fol, [Prev, Thm("EVEN_EXISTS", () => @arith.even_exists())]),
        ),
      ],
      case_split(
        "qp | pq",
        by(arithmetic, []),
        @list.List(["q < p", "p <= q"]),
        @list.List(
          [
            steps(
              [
                have(
                  "\n      q * q = 2 * m * m ==> m = 0",
                  "",
                  by(fol, [Label("qp"), Label("A")]),
                ),
                by(num_ring, [Prev, Label("B"), Label("C")]),
              ],
            ),
            steps(
              [
                have(
                  "\n      p * p <= q * q",
                  "",
                  by(fol, [Prev, Thm("LE_MULT2", () => @arith.le_mult2())]),
                ),
                have("\n      q * q = 0", "", by(arithmetic, [Prev, Label("B")])),
                by(num_ring, [Prev]),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let nsqrt_2_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSQRT_2")

///|
/// `NSQRT_2`
pub fn nsqrt_2_v1() -> @kernel.Thm {
  nsqrt_2_v1_c.get()
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:614
fn step_42() -> Unit raise {
  ignore(interactive_goal(parse_qproof(";∀p q. p * p = 2 * q * q  ⇒  q = 0\n")))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:616
fn step_43() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        by_thm(@tactics.match_mp_tac, Thm("num_WF", () => @arith.num_wf())),
        intro_tac("forall p, A, forall q, B"),
        have("\n    EVEN(p * p) <=> EVEN(2 * q * q)", "", @tactics.all_tac),
      ],
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:621
fn step_44() -> Unit raise {
  ignore(@tactics.e(steps([by(fol, [Label("B")])])))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:624
fn step_45() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        have(
          "\n    EVEN(p)",
          "",
          by(
            fol,
            [
              Prev,
              Thm("EVEN_DOUBLE", () => @arith.even_double()),
              Thm("EVEN_MULT", () => @arith.even_mult()),
            ],
          ),
        ),
        consider(
          "m",
          "p = 2 * m    ",
          "C",
          steps([by(fol, [Prev, Thm("EVEN_EXISTS", () => @arith.even_exists())])]),
        ),
      ],
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:628
fn step_46() -> Unit raise {
  ignore(@tactics.e(
    case_split(
      "qp | pq",
      by(arithmetic, []),
      @list.List(["q < p", "p <= q"]),
      @list.List([@tactics.all_tac, @tactics.all_tac]),
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:635
fn step_47() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        have(
          "\n      q * q = 2 * m * m ==> m = 0",
          "",
          by(fol, [Label("qp"), Label("A")]),
        ),
        by(num_ring, [Prev, Label("B"), Label("C")]),
      ],
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:639
fn step_48() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        have(
          "\n      p * p <= q * q",
          "",
          by(fol, [Prev, Thm("LE_MULT2", () => @arith.le_mult2())]),
        ),
        have("\n      q * q = 0", "", by(arithmetic, [Prev, Label("B")])),
        by(num_ring, [Prev]),
      ],
    ),
  ))
}

///|
/// NSQRT_2
fn step_49() -> Unit raise {
  nsqrt_2_c.set(@tactics.top_thm())
}

///|
let nsqrt_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSQRT_2")

///|
/// `NSQRT_2`
pub fn nsqrt_2() -> @kernel.Thm {
  nsqrt_2_c.get()
}

///|
/// EXP_2
fn step_50() -> Unit raise {
  exp_2_c.set(prove(
    "\n  forall n:num. n EXP 2 = n * n",
    by(
      rewrite,
      [
        Thm("BIT0_THM", () => @arith.bit0_thm()),
        Thm("BIT1_THM", () => @arith.bit1_thm()),
        Thm("EXP", () => @arith.exp()),
        Thm("EXP_ADD", () => @arith.exp_add()),
        Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
        Thm("ADD_CLAUSES", () => @arith.add_clauses()),
      ],
    ),
  ))
}

///|
let exp_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_2")

///|
/// `EXP_2`
pub fn exp_2() -> @kernel.Thm {
  exp_2_c.get()
}

///|
/// binom
fn step_57() -> Unit raise {
  binom_c.set(@define.define_(@parser.parse_term("(forall n. binom(n,0) = 1) /\\\n  (forall k. binom(0,SUC(k)) = 0) /\\\n  (forall n k. binom(SUC(n),SUC(k)) = binom(n,SUC(k)) + binom(n,k))")))
}

///|
let binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("binom")

///|
/// `binom`
pub fn binom() -> @kernel.Thm {
  binom_c.get()
}

///|
/// BINOM_LT
fn step_58() -> Unit raise {
  binom_lt_c.set(prove(
    "\n  forall n k. n < k  ==>  binom(n,k) = 0",
    steps(
      [
        @nums.induct_tac,
        @nums.induct_tac,
        by(
          rewrite,
          [
            Thm("binom", () => binom()),
            Thm("ARITH", () => @calc_num.arith()),
            Thm("LT_SUC", () => @arith.lt_suc()),
            Thm("LT", () => @arith.lt()),
          ],
        ),
        by(
          @simp.asm_simp_tac,
          [
            TermRule(@int.arith_rule, "n < k ==> n < SUC(k)"),
            Thm("ARITH", () => @calc_num.arith()),
          ],
        ),
      ],
    ),
  ))
}

///|
let binom_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_LT")

///|
/// `BINOM_LT`
pub fn binom_lt() -> @kernel.Thm {
  binom_lt_c.get()
}

///|
/// BINOMIAL_THEOREM
fn step_66() -> Unit raise {
  binomial_theorem_c.set(prove(
    "\n  forall n. (x + y) EXP n = nsum(0..n) (\\k. binom(n,k) * x EXP k * y EXP (n - k))",
    steps(
      [
        have(
          "\n    forall f n. nsum (0.. SUC n) f = f(0) + nsum (0..n) (\\ i. f (SUC i))",
          "Nsum0SUC",
          by(
            simplify,
            [
              Thm("LE_0", () => @arith.le_0()),
              Thm("ADD1", () => @arith.add1()),
              Thm("NSUM_CLAUSES_LEFT", () => @iterate.nsum_clauses_left()),
              Thm("NSUM_OFFSET", () => @iterate.nsum_offset()),
            ],
          ),
        ),
        by_thm(@tactics.match_mp_tac, Thm("num_INDUCTION", () => @nums.num_induction())),
        by(
          simplify,
          [
            Thm("EXP", () => @arith.exp()),
            Thm("NSUM_SING_NUMSEG", () => @iterate.nsum_sing_numseg()),
            Thm("binom", () => binom()),
            Thm("SUB_0", () => @arith.sub_0()),
            Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
          ],
        ),
        intro_tac("forall n, nThm"),
        by(
          rewrite,
          [
            Label("Nsum0SUC"),
            Thm("binom", () => binom()),
            Thm("RIGHT_ADD_DISTRIB", () => @arith.right_add_distrib()),
            Thm("NSUM_ADD_NUMSEG", () => @iterate.nsum_add_numseg()),
            Rule(@equal.gsym, Thm("NSUM_LMUL", () => @iterate.nsum_lmul())),
            Thm("ADD_ASSOC", () => @arith.add_assoc()),
          ],
        ),
        by(rewriter, [Thm("ADD_SYM", () => @arith.add_sym())]),
        by(
          rewriterldepth,
          [Thm("SUB_SUC", () => @arith.sub_suc()), Thm("EXP", () => @arith.exp())],
        ),
        by(
          rewrite,
          [
            Thm("MULT_AC", () => @arith.mult_ac()),
            Thm("EQ_ADD_LCANCEL", () => @arith.eq_add_lcancel()),
            ThmsTermRule(
              ths => tm => @meson.meson(ths, tm),
              [Thm("binom", () => binom())],
              "1 = binom(n, 0)",
            ),
            Rule(@equal.gsym, Label("Nsum0SUC")),
          ],
        ),
        by(
          simplify,
          [
            Thm("NSUM_CLAUSES_RIGHT", () => @iterate.nsum_clauses_right()),
            TermRule(@int.arith_rule, "0 < SUC n  /\\   0 <= SUC n"),
            Thm("LT", () => @arith.lt()),
            Thm("BINOM_LT", () => binom_lt()),
            Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
            Thm("ADD_CLAUSES", () => @arith.add_clauses()),
            Thm("SUC_SUB1", () => @arith.suc_sub1()),
          ],
        ),
        by(
          simplify,
          [
            TermRule(@int.arith_rule, "k <= n  ==>  SUC n - k = SUC(n - k)"),
            Thm("EXP", () => @arith.exp()),
            Thm("MULT_AC", () => @arith.mult_ac()),
          ],
        ),
      ],
    ),
  ))
}

///|
let binomial_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOMIAL_THEOREM")

///|
/// `BINOMIAL_THEOREM`
pub fn binomial_theorem() -> @kernel.Thm {
  binomial_theorem_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_25()
  step_33()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_57()
  step_58()
  step_66()
}
