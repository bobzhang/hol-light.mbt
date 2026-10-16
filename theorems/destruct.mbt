// Hand port of theorems.ml's DESTRUCT_TAC, FIX_TAC, INTRO_TAC and HYP_TAC
// block (parsers of destruct/intro patterns built from the parser
// combinators). OCaml's `p ++ q` is `seq`, `p >> f` is `map`, `p ||| q` is
// `alt`; `++` binds tighter than `>>` and `|||`, which group to the left.

///|
using @kernel {type Term, type Thm}

///|
using @list {type List}

///|
using @parser {type Lexcode}

///|
using @tactics {
  type Tactic,
  type ThmTactic,
  type ThmTactical,
  type Goal,
  type Goalstate,
}

///|
type P[A] = (List[Lexcode]) -> (A, List[Lexcode]) raise

///|
let swap_forall_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "SWAP_FORALL_CONV",
)

///|
let and_forall_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "AND_FORALL_CONV",
)

///|
let right_imp_forall_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "RIGHT_IMP_FORALL_CONV",
)

///|
/// The block's load-time work, in upstream order (`let ... and ...`).
fn destruct_setup() -> Unit raise {
  swap_forall_conv_c.set(@simp.rewr_conv(swap_forall_thm()))
  and_forall_conv_c.set(
    @simp.gen_rewrite_conv(c => c, @list.singleton(and_forall_thm())),
  )
  right_imp_forall_conv_c.set(
    @simp.gen_rewrite_conv(c => c, @list.singleton(right_imp_forall_thm())),
  )
}

///|
/// `PURE_GEN_TAC`: like GEN_TAC, but fails instead of priming a variable
/// that occurs free in the context.
fn pure_gen_tac(g : Goal) -> Goalstate raise {
  let (asl, w) = g
  let r = try {
    let x = @basics.dest_forall(w).0
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => @lib.union(@basics.thm_frees(p.1), acc),
      asl,
      @kernel.frees(w),
    )
    if @lib.mem(x, avoids) {
      raise Failure("")
    }
    @tactics.x_gen_tac(x)(g)
  } catch {
    Failure(_) => raise Failure("PURE_GEN_TAC")
    e => raise e
  }
  r
}

///|
/// `NAME_GEN_TAC s`: X_GEN_TAC with a variable of the right type named `s`.
fn name_gen_tac(s : String) -> Tactic {
  gl => {
    let ty = @kernel.dest_var(@basics.dest_forall(gl.1).0).1
    @tactics.x_gen_tac(@kernel.mk_var(s, ty))(gl)
  }
}

///|
/// `OBTAIN_THEN v`
fn obtain_then(v : String) -> ThmTactical {
  ttac => {
    th => {
      let ty = @kernel.dest_var(@basics.dest_exists(@kernel.concl(th)).0).1
      @tactics.x_choose_then(@kernel.mk_var(v, ty))(ttac)(th)
    }
  }
}

///|
/// `CONJ_LIST_TAC`
fn conj_list_tac(tacs : List[Tactic]) -> Tactic raise {
  @lib.end_itlist(
    (t1, t2) => @tactics.thenl(@tactics.conj_tac, @list.List([t1, t2])),
    tacs,
  )
}

///|
/// `NUM_DISJ_TAC n`
fn num_disj_tac(n : Int) -> Tactic raise {
  if n <= 0 {
    raise Failure("NUM_DISJ_TAC")
  }
  // `REPLICATE_TAC (n-1) DISJ2_TAC THEN REPEAT DISJ1_TAC`
  let r = @tactics.repeat_tac(@tactics.disj1_tac)
  @tactics.then_tac(@tactics.replicate_tac(n - 1, @tactics.disj2_tac), r)
}

///|
/// `NAME_PULL_FORALL_CONV s`: pull the quantifier of variable `s` out.
fn name_pull_forall_conv(s : String) -> @equal.Conv {
  fn pull_forall(tm : Term) -> Thm raise {
    if @basics.is_forall(tm) {
      if @printer.name_of(@basics.dest_forall(tm).0) == s {
        @kernel.refl(tm)
      } else {
        @equal.thenc(@equal.binder_conv(pull_forall), swap_forall_conv_c.get())(
          tm,
        )
      }
    } else if @basics.is_imp(tm) {
      @equal.thenc(@equal.rand_conv(pull_forall), right_imp_forall_conv_c.get())(
        tm,
      )
    } else if @basics.is_conj(tm) {
      @equal.thenc(@equal.binop_conv(pull_forall), and_forall_conv_c.get())(tm)
    } else {
      raise Failure("")
    }
  }

  pull_forall
}

///|
fn pa_ident(p : (String) -> Bool) -> P[String] {
  inp => {
    match inp {
      More(Ident(s), tail=rest) if p(s) => (s, rest)
      _ => raise @parser.Noparse
    }
  }
}

///|
fn pa_label(inp : List[Lexcode]) -> (String, List[Lexcode]) raise {
  pa_ident(@printer.isalnum)(inp)
}

///|
fn pa_var(inp : List[Lexcode]) -> (String, List[Lexcode]) raise {
  pa_ident(@printer.isalpha)(inp)
}

///|
fn tok(t : Lexcode) -> P[Lexcode] {
  @parser.a(t)
}

// ---------------------------------------------------------------------------
// FIX_TAC patterns.
// ---------------------------------------------------------------------------

///|
fn fix_var(v : String) -> Tactic {
  @tactics.then_tac(@tactics.conv_tac(name_pull_forall_conv(v)), g => {
    pure_gen_tac(g)
  })
}

///|
fn fix_rename(p : (String, List[String])) -> Tactic {
  match p {
    (u, More(v, tail=Empty)) =>
      @tactics.then_tac(
        @tactics.conv_tac(name_pull_forall_conv(v)),
        name_gen_tac(u),
      )
    (u, _) => name_gen_tac(u)
  }
}

///|
fn fix_parser(inp : List[Lexcode]) -> (Tactic, List[Lexcode]) raise {
  // `[` var (`/` var)? `]`
  let oname = @parser.possibly(
    @parser.map(@parser.seq(tok(Ident("/")), pa_var), p => p.1),
  )
  let pa_rename = @parser.map(
    @parser.seq(
      @parser.seq(
        @parser.map(@parser.seq(tok(Resword("[")), pa_var), p => p.1),
        oname,
      ),
      tok(Resword("]")),
    ),
    p => p.0,
  )
  let vars = @parser.map(
    @parser.many(
      @parser.alt(
        @parser.map(pa_rename, fix_rename),
        @parser.map(pa_var, fix_var),
      ),
    ),
    tacs => @tactics.every(tacs),
  )
  let star = @parser.possibly(@parser.map(tok(Ident("*")), _ => ()))
  @parser.map(@parser.seq(vars, star), p => {
    match p {
      (tac, Empty) => tac
      (tac, _) => @tactics.then_tac(tac, @tactics.repeat_tac(@tactics.gen_tac))
    }
  })(inp)
}

// ---------------------------------------------------------------------------
// DESTRUCT_TAC patterns.
// ---------------------------------------------------------------------------

///|
/// `OBTAINL_THEN = EVERY_TCL o map OBTAIN_THEN`
fn obtainl_then(vs : List[String]) -> ThmTactical {
  @tactics.every_tcl(@lib.map(obtain_then, vs))
}

///|
fn destruct(inp : List[Lexcode]) -> (ThmTactic, List[Lexcode]) raise {
  disj(inp)
}

///|
fn disj(inp : List[Lexcode]) -> (ThmTactic, List[Lexcode]) raise {
  @parser.map(@parser.listof(conj, tok(Resword("|")), "Disjunction"), ttacs => {
    @lib.end_itlist(@tactics.disj_cases_then2, ttacs)
  })(inp)
}

///|
fn conj(inp : List[Lexcode]) -> (ThmTactic, List[Lexcode]) raise {
  @parser.map(@parser.atleast(1, atom), ttacs => {
    @lib.end_itlist(@tactics.conjuncts_then2, ttacs)
  })(inp)
}

///|
fn obtain(inp : List[Lexcode]) -> (ThmTactic, List[Lexcode]) raise {
  let var_list = @parser.atleast(1, pa_var)
  let obtain_prfx = @parser.map(
    @parser.seq(
      @parser.map(@parser.seq(tok(Ident("@")), var_list), p => p.1),
      tok(Resword(".")),
    ),
    p => p.0,
  )
  @parser.map(@parser.seq(obtain_prfx, destruct), p => obtainl_then(p.0)(p.1))(
    inp,
  )
}

///|
fn atom(inp : List[Lexcode]) -> (ThmTactic, List[Lexcode]) raise {
  let label : P[ThmTactic] = inp => {
    match inp {
      More(Ident("_"), tail=res) => (_ => @tactics.all_tac, res)
      More(Ident("+"), tail=res) => (th => @tactics.mp_tac(th), res)
      More(Ident(s), tail=res) if @printer.isalnum(s) =>
        (th => @tactics.label_tac(s, th), res)
      _ => raise @parser.Noparse
    }
  }
  let paren = @parser.map(
    @parser.seq(
      @parser.map(@parser.seq(tok(Resword("(")), destruct), p => p.1),
      tok(Resword(")")),
    ),
    p => p.0,
  )
  @parser.alt(@parser.alt(obtain, label), paren)(inp)
}

// ---------------------------------------------------------------------------
// INTRO_TAC patterns.
// ---------------------------------------------------------------------------

///|
fn number(inp : List[Lexcode]) -> (Int, List[Lexcode]) raise {
  match inp {
    More(Ident(s), tail=rest) => {
      let n = @lib.check(n => 1 <= n, @lib.int_of_string(s)) catch {
        Failure(_) => raise @parser.Noparse
        e => raise e
      }
      (n, rest)
    }
    _ => raise @parser.Noparse
  }
}

///|
fn pa_prefix(inp : List[Lexcode]) -> (List[Tactic], List[Lexcode]) raise {
  let pa_fix = @parser.map(@parser.seq(tok(Ident("!")), fix_parser), p => p.1)
  let pa_dest = @parser.map(destruct, ttac => @tactics.disch_then(ttac))
  @parser.elistof(
    @parser.alt(pa_fix, pa_dest),
    tok(Resword(";")),
    "Prefix intro pattern",
  )(inp)
}

///|
fn pa_intro(toks : List[Lexcode]) -> (Tactic, List[Lexcode]) raise {
  @parser.map(
    @parser.map(@parser.seq(pa_prefix, @parser.possibly(pa_postfix)), p => {
      p.0.concat(p.1)
    }),
    tacs => @tactics.every(tacs),
  )(toks)
}

///|
fn pa_postfix(toks : List[Lexcode]) -> (Tactic, List[Lexcode]) raise {
  @parser.alt(pa_conj, pa_disj)(toks)
}

///|
fn pa_conj(toks : List[Lexcode]) -> (Tactic, List[Lexcode]) raise {
  let conjs = @parser.map(
    @parser.listof(pa_intro, tok(Ident("&")), "Intro pattern"),
    conj_list_tac,
  )
  @parser.map(
    @parser.seq(
      @parser.map(@parser.seq(tok(Resword("{")), conjs), p => p.1),
      tok(Resword("}")),
    ),
    p => p.0,
  )(toks)
}

///|
fn pa_disj(toks : List[Lexcode]) -> (Tactic, List[Lexcode]) raise {
  let disj = @parser.map(number, num_disj_tac)
  @parser.map(
    @parser.seq(
      @parser.map(@parser.seq(tok(Ident("#")), disj), p => p.1),
      pa_intro,
    ),
    p => @tactics.then_tac(p.0, p.1),
  )(toks)
}

// ---------------------------------------------------------------------------
// HYP_TAC patterns.
// ---------------------------------------------------------------------------

///|
fn hyp_parser(rule : (Thm) -> Thm raise) -> P[Tactic] {
  let pa_action : P[(String, ThmTactic) -> Tactic] = inp => {
    match inp {
      More(Resword(":"), tail=rest) =>
        ((s, ttac) => @tactics.remove_then(s, ttac), rest)
      More(Resword("->"), tail=rest) =>
        ((s, ttac) => @tactics.use_then(s, ttac), rest)
      _ => raise @parser.Noparse
    }
  }
  @parser.map(
    @parser.seq(pa_label, @parser.possibly(@parser.seq(pa_action, destruct))),
    p => {
      match p {
        (lbl, More((action, tac), tail=Empty)) =>
          action(lbl, th => tac(rule(th)))
        (lbl, _) =>
          @tactics.remove_then(lbl, th => @tactics.label_tac(lbl, rule(th)))
      }
    },
  )
}

// ---------------------------------------------------------------------------
// The tactics.
// ---------------------------------------------------------------------------

///|
/// `DESTRUCT_TAC s`: destruct a theorem by a pattern such as
/// `@x. a b | c` (obtain, conjunction, disjunction, labels).
pub fn destruct_tac(s : String) -> ThmTactic raise {
  let (tac, rest) = @parser.fix("Destruct pattern", destruct)(@parser.lex(s))
  if rest.is_empty() {
    tac
  } else {
    raise Failure("Garbage after destruct pattern")
  }
}

///|
/// `INTRO_TAC s`: introduce universals and antecedents by a pattern.
pub fn intro_tac(s : String) -> Tactic raise {
  let (tac, rest) = @parser.fix("Introduction pattern", pa_intro)(
    @parser.lex(s),
  )
  if rest.is_empty() {
    tac
  } else {
    raise Failure("Garbage after intro pattern")
  }
}

///|
/// `FIX_TAC s`: introduce universals by name (`[a/b]` renames, `*` all).
pub fn fix_tac(s : String) -> Tactic raise {
  let (tac, rest) = fix_parser(@parser.lex(s))
  if rest.is_empty() {
    tac
  } else {
    raise Failure("FIX_TAC: invalid pattern")
  }
}

///|
/// `HYP_TAC s rule`: apply `rule` to labelled assumptions by a pattern.
pub fn hyp_tac(s : String, rule : (Thm) -> Thm raise) -> Tactic raise {
  let (tac, rest) = hyp_parser(rule)(@parser.lex(s))
  if rest.is_empty() {
    tac
  } else {
    raise Failure("HYP_TAC: invalid pattern")
  }
}
