// ===========================================================================
// Type and preterm parsers (parser.ml), built from the same combinators as
// upstream so that backtracking (and the side effects of the actions it
// re-runs, such as `pgenvar`) behaves identically.
// ===========================================================================

///|
using @kernel {type Term, type HolType}

///|
using @preterm {type Preterm, type Pretype}

///|
type Toks = @list.List[Lexcode]

///|
fn init {
  // "," is needed for set enumerations and is not a reserved word.
  @printer.parse_as_infix(",", (14, "right"))
  @printer.reserve_words(@list.singleton("//"))
}

///|
fn res(s : String) -> (Toks) -> (Lexcode, Toks) raise {
  a(Resword(s))
}

///|
fn idt(s : String) -> (Toks) -> (Lexcode, Toks) raise {
  a(Ident(s))
}

// ---------------------------------------------------------------------------
// Pretypes.
//
// TYPE        :: SUMTYPE -> TYPE | SUMTYPE
// SUMTYPE     :: PRODTYPE + SUMTYPE | PRODTYPE
// PRODTYPE    :: POWTYPE # PRODTYPE | POWTYPE
// POWTYPE     :: APPTYPE ^ POWTYPE | APPTYPE
// APPTYPE     :: ATOMICTYPES type-constructor | ATOMICTYPES
// ATOMICTYPES :: type-constructor | type-variable | ( TYPE ) | ( TYPELIST )
// ---------------------------------------------------------------------------

///|
fn mk_prefinty(n : @num.Num) -> Pretype raise {
  if !@num.is_integer_num(n) || n < @num.num_1 {
    raise Failure("mk_prefinty")
  }
  fn go(n : @num.Num) -> Pretype raise {
    if n == @num.num_1 {
      @preterm.Ptycon("1", @list.empty())
    } else {
      let c = if @num.mod_num(n, @num.num_2) == @num.num_0 {
        "tybit0"
      } else {
        "tybit1"
      }
      @preterm.Ptycon(c, @list.singleton(go(@num.quo_num(n, @num.num_2))))
    }
  }

  go(n)
}

///|
fn btyop(n : String) -> (Lexcode, Pretype, Pretype) -> Pretype raise {
  (_, x, y) => @preterm.Ptycon(n, @list.List([x, y]))
}

///|
fn mk_apptype(p : (List[Pretype], List[String])) -> Pretype raise {
  match p {
    (More(s, tail=Empty), Empty) => s
    (tys, More(c, tail=Empty)) => @preterm.Ptycon(c, tys)
    _ => raise Failure("Bad type construction")
  }
}

///|
fn type_atom(input : Toks) -> (Pretype, Toks) raise {
  match input {
    More(Ident(s), tail=rest) => {
      let pty = @preterm.pretype_of_type(@lib.assoc(s, @preterm.type_abbrevs())) catch {
        Failure(_) =>
          mk_prefinty(@num.num_of_string(s)) catch {
            Failure(_) => {
              let nullary = try @kernel.get_type_arity(s) == 0 catch {
                Failure(_) => false
                e => raise e
              }
              if nullary {
                @preterm.Ptycon(s, @list.empty())
              } else {
                @preterm.Utv(s)
              }
            }
            e => raise e
          }
        e => raise e
      }
      (pty, rest)
    }
    _ => raise Noparse
  }
}

///|
fn type_constructor(input : Toks) -> (String, Toks) raise {
  match input {
    More(Ident(s), tail=rest) => {
      let ok = try @kernel.get_type_arity(s) > 0 catch {
        Failure(_) => false
        e => raise e
      }
      if ok {
        (s, rest)
      } else {
        raise Noparse
      }
    }
    _ => raise Noparse
  }
}

///|
/// Parse a pretype from tokens.
pub fn parse_pretype(i : Toks) -> (Pretype, Toks) raise {
  rightbin(sumtype, res("->"), btyop("fun"), "proper use of type operator (->)")(
    i,
  )
}

///|
fn sumtype(i : Toks) -> (Pretype, Toks) raise {
  rightbin(prodtype, idt("+"), btyop("sum"), "proper use of type operator (+)")(
    i,
  )
}

///|
fn prodtype(i : Toks) -> (Pretype, Toks) raise {
  rightbin(carttype, idt("#"), btyop("prod"), "proper use of type operator (#)")(
    i,
  )
}

///|
fn carttype(i : Toks) -> (Pretype, Toks) raise {
  leftbin(apptype, idt("^"), btyop("cart"), "proper use of type operator (^)")(
    i,
  )
}

///|
fn apptype(i : Toks) -> (Pretype, Toks) raise {
  map(
    seq(
      atomictypes,
      alt(map(type_constructor, x => @list.singleton(x)), t => nothing(t)),
    ),
    mk_apptype,
  )(i)
}

///|
fn atomictypes(i : Toks) -> (List[Pretype], Toks) raise {
  alt(
    map(seq(seq(res("("), typelist), res(")")), r => r.0.1),
    map(type_atom, x => @list.singleton(x)),
  )(i)
}

///|
fn typelist(i : Toks) -> (List[Pretype], Toks) raise {
  listof(parse_pretype, idt(","), "comma separated list for type constructor")(
    i,
  )
}

// ---------------------------------------------------------------------------
// User parsers.
// ---------------------------------------------------------------------------

///|
pub type UserParser = (String, (Toks) -> (Preterm, Toks) raise)

///|
let parser_list : Ref[List[UserParser]] = Ref::{ val: @list.empty(), }

///|
pub fn install_parser(
  name : String,
  p : (Toks) -> (Preterm, Toks) raise,
) -> Unit {
  parser_list.val = parser_list.val.prepend((name, p))
}

///|
pub fn delete_parser(key : String) -> Unit raise {
  let (_, rest) = @lib.remove((p : UserParser) => p.0 == key, parser_list.val) catch {
    Failure(_) => return
    e => raise e
  }
  parser_list.val = rest
}

///|
pub fn installed_parsers() -> List[UserParser] {
  parser_list.val
}

///|
fn try_user_parser(i : Toks) -> (Preterm, Toks) raise {
  for p in parser_list.val {
    try (p.1)(i) catch {
      Noparse => continue
      e => raise e
    } noraise {
      r => return r
    }
  }
  raise Noparse
}

// ---------------------------------------------------------------------------
// Preterm construction helpers.
// ---------------------------------------------------------------------------

///|
let dpty : Pretype = @preterm.dpty

///|
fn pv(s : String) -> Preterm {
  @preterm.Varp(s, dpty)
}

///|
fn pairwise(
  r : (Preterm, Preterm) -> Bool raise,
  l : List[Preterm],
) -> Bool raise {
  let mut l = l
  while l is More(h, tail=t) {
    if !@lib.forall(x => r(h, x), t) {
      return false
    }
    l = t
  }
  true
}

///|
/// Free "variables" of a preterm (identifiers that are not constants,
/// numerals or interface names).
fn pfrees(ptm : Preterm) -> List[Preterm] raise {
  match ptm {
    @preterm.Varp(v, pty) =>
      if v == "" && pty == dpty {
        @list.empty()
      } else if @lib.can(c => @kernel.get_const_type(c), v) ||
        @lib.can(@num.num_of_string, v) ||
        @printer.the_interface.val.any(e => e.0 == v) {
        @list.empty()
      } else {
        @list.singleton(ptm)
      }
    @preterm.Constp(_) => @list.empty()
    @preterm.Combp(p1, p2) => {
      // `union (pfrees p1) (pfrees p2)`: arguments right to left.
      let f2 = pfrees(p2)
      @lib.union(pfrees(p1), f2)
    }
    @preterm.Absp(p1, p2) => {
      let f1 = pfrees(p1)
      @lib.subtract(pfrees(p2), f1)
    }
    @preterm.Typing(p, _) => pfrees(p)
  }
}

///|
fn pdest_eq(p : Preterm) -> (Preterm, Preterm) raise {
  match p {
    @preterm.Combp(@preterm.Combp(@preterm.Varp("=" | "<=>", _), l), r) =>
      (l, r)
    _ => raise @lib.MatchFailure("parser.ml: pdest_eq")
  }
}

///|
fn pmk_let(letbindings : List[Preterm], body : Preterm) -> Preterm raise {
  let (vars, tms) = @lib.unzip(@lib.map(pdest_eq, letbindings))
  @lib.warn(
    !pairwise((s, t) => @lib.intersect(pfrees(s), pfrees(t)).is_empty(), vars),
    "duplicate names on left of let-binding: latest is used",
  )
  let lend = @preterm.Combp(pv("LET_END"), body)
  let abs = @lib.itlist((v, t) => @preterm.Absp(v, t), vars, lend)
  let labs = @preterm.Combp(pv("LET"), abs)
  @lib.rev_itlist((x, f) => @preterm.Combp(f, x), tms, labs)
}

///|
fn pmk_vbinder(n : String, v : Preterm, bod : Preterm) -> Preterm {
  if n == "\\" {
    @preterm.Absp(v, bod)
  } else {
    @preterm.Combp(pv(n), @preterm.Absp(v, bod))
  }
}

///|
fn pmk_binder(n : String, vs : List[Preterm], bod : Preterm) -> Preterm {
  @lib.itlist((v, b) => pmk_vbinder(n, v, b), vs, bod)
}

///|
fn pmk_set_enum(ptms : List[Preterm]) -> Preterm {
  @lib.itlist(
    (x, t) => @preterm.Combp(@preterm.Combp(pv("INSERT"), x), t),
    ptms,
    pv("EMPTY"),
  )
}

///|
let pgen_counter : Ref[Int] = Ref::{ val: 0, }

///|
fn pgenvar() -> Preterm {
  let count = pgen_counter.val
  pgen_counter.val = count + 1
  pv("GEN%PVAR%" + count.to_string())
}

///|
fn pmk_exists(v : Preterm, ptm : Preterm) -> Preterm {
  @preterm.Combp(pv("?"), @preterm.Absp(v, ptm))
}

///|
fn pmk_list(els : List[Preterm]) -> Preterm {
  @lib.itlist(
    (x, y) => @preterm.Combp(@preterm.Combp(pv("CONS"), x), y),
    els,
    pv("NIL"),
  )
}

///|
fn pmk_char(c : Int) -> Preterm {
  let bits = @lib.map(
    i => pv(if (c >> i) % 2 == 1 { "T" } else { "F" }),
    @lib.range(0, 7),
  )
  @lib.itlist((x, y) => @preterm.Combp(y, x), bits, pv("ASCII"))
}

///|
/// The bytes of a string literal, as OCaml sees them: ASCII characters are
/// one byte, escaped bytes (see `escaped_byte_base`) one byte, and other
/// characters their UTF-8 encoding.
fn literal_bytes(s : String) -> Array[Int] {
  let out = []
  for ch in s {
    let c = ch.to_int()
    if c < 0x80 {
      out.push(c)
    } else if c >= escaped_byte_base + 0x80 && c <= escaped_byte_base + 0xFF {
      out.push(c - escaped_byte_base)
    } else {
      for b in @utf8.encode(ch.to_string()) {
        out.push(b.to_int())
      }
    }
  }
  out
}

///|
fn pmk_string(s : String) -> Preterm {
  pmk_list(@list.List(literal_bytes(s).map(pmk_char)))
}

///|
fn pmk_setcompr(fabs : Preterm, bvs : List[Preterm], babs : Preterm) -> Preterm {
  let v = pgenvar()
  let bod = @lib.itlist(
    pmk_exists,
    bvs,
    @preterm.Combp(@preterm.Combp(@preterm.Combp(pv("SETSPEC"), v), babs), fabs),
  )
  @preterm.Combp(pv("GSPEC"), @preterm.Absp(v, bod))
}

///|
fn pmk_setabs(fabs : Preterm, babs : Preterm) -> Preterm raise {
  let fvs = pfrees(fabs)
  let bvs = pfrees(babs)
  let evs = if fvs.length() <= 1 || bvs.is_empty() {
    fvs
  } else {
    @lib.intersect(fvs, bvs)
  }
  pmk_setcompr(fabs, evs, babs)
}

///|
fn mk_precedence(
  infxs : List[(String, (Int, String))],
  prs : (Toks) -> (Preterm, Toks) raise,
  inp : Toks,
) -> (Preterm, Toks) raise {
  match infxs {
    More((_, (p, at)), tail=_) => {
      let (topins, rest) = @lib.partition(
        (e : (String, (Int, String))) => e.1 == (p, at),
        infxs,
      )
      let binop = if at == "right" { rightbin } else { leftbin }
      let ops = @lib.end_itlist(
        (p1, p2) => alt(p1, p2),
        @lib.map((e : (String, (Int, String))) => idt(e.0), topins),
      )
      binop(
        i => mk_precedence(rest, prs, i),
        ops,
        (op : Lexcode, x : Preterm, y : Preterm) => {
          match op {
            Ident(o) => @preterm.Combp(@preterm.Combp(pv(o), x), y)
            Resword(_) => raise @lib.MatchFailure("parser.ml: mk_precedence")
          }
        },
        "term after binary operator",
      )(inp)
    }
    Empty => prs(inp)
  }
}

///|
fn pmk_geq(s : Preterm, t : Preterm) -> Preterm {
  @preterm.Combp(@preterm.Combp(pv("GEQ"), s), t)
}

///|
fn pmk_pattern(pgr : ((Preterm, List[Preterm]), Preterm)) -> Preterm raise {
  let ((pat, guards), res) = pgr
  let x = pgenvar()
  let y = pgenvar()
  let vs = pfrees(pat)
  let bod = if guards.is_empty() {
    @preterm.Combp(
      @preterm.Combp(pv("_UNGUARDED_PATTERN"), pmk_geq(pat, x)),
      pmk_geq(res, y),
    )
  } else {
    @preterm.Combp(
      @preterm.Combp(
        @preterm.Combp(pv("_GUARDED_PATTERN"), pmk_geq(pat, x)),
        @lib.hd(guards),
      ),
      pmk_geq(res, y),
    )
  }
  @preterm.Absp(x, @preterm.Absp(y, @lib.itlist(pmk_exists, vs, bod)))
}

///|
fn is_quoted(s : String) -> Bool {
  s.length() >= 2 && s.has_prefix("\"") && s.has_suffix("\"")
}

///|
fn string_tok(inp : Toks) -> (String, Toks) raise {
  match inp {
    More(Ident(s), tail=rst) if is_quoted(s) =>
      (s[1:s.length() - 1].to_owned(), rst)
    _ => raise Noparse
  }
}

///|
fn lmk_typed(p : (Preterm, List[Pretype])) -> Preterm raise {
  match p {
    (p, Empty) => p
    (p, More(ty, tail=Empty)) => @preterm.Typing(p, ty)
    _ => raise Failure("")
  }
}

///|
fn lmk_decimal(p : ((Lexcode, String), List[String])) -> Preterm raise {
  let ((_, l0), ropt) = p
  let (l, r) = match ropt {
    Empty => (l0, "1")
    More(r0, tail=_) => {
      let n_l = @num.num_of_string(l0)
      let n_r = @num.num_of_string(r0)
      let n_d = @num.power_num(
        @num.num_of_int(10),
        @num.num_of_int(@utf8.encode(r0).length()),
      )
      let n_n = n_l * n_d + n_r
      (@num.string_of_num(n_n), @num.string_of_num(n_d))
    }
  }
  @preterm.Combp(@preterm.Combp(pv("DECIMAL"), pv(l)), pv(r))
}

///|
fn any_identifier(inp : Toks) -> (String, Toks) raise {
  match inp {
    More(Ident(s), tail=rest) => (s, rest)
    _ => raise Noparse
  }
}

///|
fn identifier(inp : Toks) -> (String, Toks) raise {
  match inp {
    More(Ident(s), tail=rest) =>
      if @lib.can(@printer.get_infix_status, s) ||
        @printer.is_prefix(s) ||
        @printer.parses_as_binder(s) {
        raise Noparse
      } else {
        (s, rest)
      }
    _ => raise Noparse
  }
}

///|
fn binder(inp : Toks) -> (String, Toks) raise {
  match inp {
    More(Ident(s), tail=rest) if @printer.parses_as_binder(s) => (s, rest)
    _ => raise Noparse
  }
}

///|
fn pre_fix(inp : Toks) -> (String, Toks) raise {
  match inp {
    More(Ident(s), tail=rest) if @printer.is_prefix(s) => (s, rest)
    _ => raise Noparse
  }
}

// ---------------------------------------------------------------------------
// The preterm grammar.
//
// PRETERM            :: APPL_PRETERM binop APPL_PRETERM | APPL_PRETERM
// APPL_PRETERM       :: APPL_PRETERM : type | APPL_PRETERM BINDER_PRETERM
//                     | BINDER_PRETERM
// BINDER_PRETERM     :: binder VARSTRUCT_PRETERMS . PRETERM
//                     | let PRETERM and ... and PRETERM in PRETERM
//                     | ATOMIC_PRETERM
// VARSTRUCT_PRETERMS :: TYPED_PRETERM VARSTRUCT_PRETERMS | TYPED_PRETERM
// TYPED_PRETERM      :: TYPED_PRETERM : type | ATOMIC_PRETERM
// ATOMIC_PRETERM     :: ( PRETERM ) | if PRETERM then PRETERM else PRETERM
//                     | [ PRETERM; .. ; PRETERM ] | { PRETERM, .. , PRETERM }
//                     | { PRETERM | PRETERM } | identifier
// ---------------------------------------------------------------------------

///|
fn preterm(i : Toks) -> (Preterm, Toks) raise {
  mk_precedence(@printer.infixes(), typed_appl_preterm, i)
}

///|
fn nocommapreterm(i : Toks) -> (Preterm, Toks) raise {
  let infs = @lib.filter(
    (e : (String, (Int, String))) => e.0 != ",",
    @printer.infixes(),
  )
  mk_precedence(infs, typed_appl_preterm, i)
}

///|
fn typed_appl_preterm(i : Toks) -> (Preterm, Toks) raise {
  map(
    seq(appl_preterm, possibly(map(seq(res(":"), parse_pretype), r => r.1))),
    lmk_typed,
  )(i)
}

///|
fn appl_preterm(i : Toks) -> (Preterm, Toks) raise {
  alt(
    map(seq(pre_fix, appl_preterm), xy => @preterm.Combp(pv(xy.0), xy.1)),
    map(seq(binder_preterm, many(binder_preterm)), ht => {
      @lib.itlist((x, y) => @preterm.Combp(y, x), ht.1.rev(), ht.0)
    }),
  )(i)
}

///|
fn binder_preterm(i : Toks) -> (Preterm, Toks) raise {
  alt(
    map(
      seq(
        seq(
          seq(
            res("let"),
            leftbin(
              map(preterm, x => @list.singleton(x)),
              res("and"),
              (_, x : List[Preterm], y) => x.concat(y),
              "binding",
            ),
          ),
          res("in"),
        ),
        preterm,
      ),
      r => pmk_let(r.0.0.1, r.1),
    ),
    alt(
      map(
        seq(
          seq(seq(seq(binder, typed_apreterm), many(typed_apreterm)), res(".")),
          preterm,
        ),
        r => {
          let ((((s, h), t), _), p) = r
          pmk_binder(s, t.prepend(h), p)
        },
      ),
      atomic_preterm,
    ),
  )(i)
}

///|
fn typed_apreterm(i : Toks) -> (Preterm, Toks) raise {
  map(
    seq(atomic_preterm, possibly(map(seq(res(":"), parse_pretype), r => r.1))),
    lmk_typed,
  )(i)
}

///|
fn[A] fail_with(msg : String) -> (A) -> Preterm raise {
  _ => raise Failure(msg)
}

///|
fn atomic_preterm(i : Toks) -> (Preterm, Toks) raise {
  let alts : Array[(Toks) -> (Preterm, Toks) raise] = [
    try_user_parser,
    map(seq(seq(seq(res("("), res(":")), parse_pretype), res(")")), r => {
      @preterm.Typing(
        pv("UNIV"),
        @preterm.Ptycon(
          "fun",
          @list.List([r.0.1, @preterm.Ptycon("bool", @list.empty())]),
        ),
      )
    }),
    map(
      seq(seq(res("("), res(":")), parse_pretype),
      fail_with("closing right parenthesis on universe expected"),
    ),
    map(
      seq(res("("), res(":")),
      fail_with("type in universe construction expected"),
    ),
    map(string_tok, pmk_string),
    map(seq(seq(res("("), map(any_identifier, pv)), res(")")), r => r.0.1),
    map(seq(seq(res("("), preterm), res(")")), r => r.0.1),
    map(
      seq(
        seq(
          seq(seq(seq(res("if"), preterm), res("then")), preterm),
          res("else"),
        ),
        preterm,
      ),
      r => {
        let (((((_, b), _), l), _), rr) = r
        @preterm.Combp(@preterm.Combp(@preterm.Combp(pv("COND"), b), l), rr)
      },
    ),
    map(
      seq(seq(seq(seq(res("if"), preterm), res("then")), preterm), res("else")),
      fail_with("malformed else clause"),
    ),
    map(
      seq(seq(seq(res("if"), preterm), res("then")), preterm),
      fail_with("missing else following then clause"),
    ),
    map(
      seq(seq(res("if"), preterm), res("then")),
      fail_with("malformed then clause in if-then-else statement"),
    ),
    map(
      seq(res("if"), preterm),
      fail_with("missing 'then' reserved word in if-then-else statement"),
    ),
    map(res("if"), fail_with("malformed if-then-else")),
    map(
      seq(
        seq(
          res("["),
          elistof(preterm, res(";"), "semicolon separated list of terms"),
        ),
        res("]"),
      ),
      r => pmk_list(r.0.1),
    ),
    map(
      seq(
        res("["),
        elistof(preterm, res(";"), "semicolon separated list of terms"),
      ),
      fail_with("closing square bracket of list expected"),
    ),
    map(
      seq(
        res("{"),
        alt(
          map(
            seq(
              elistof(nocommapreterm, idt(","), "comma separated list of terms"),
              res("}"),
            ),
            r => pmk_set_enum(r.0),
          ),
          alt(
            map(seq(seq(seq(preterm, res("|")), preterm), res("}")), r => {
              pmk_setabs(r.0.0.0, r.0.1)
            }),
            map(
              seq(
                seq(
                  seq(seq(seq(preterm, res("|")), preterm), res("|")),
                  preterm,
                ),
                res("}"),
              ),
              r => {
                let (((((f, _), vs), _), b), _) = r
                pmk_setcompr(f, pfrees(vs), b)
              },
            ),
          ),
        ),
      ),
      r => r.1,
    ),
    map(res("{"), fail_with("malformed set {}")),
    map(seq(seq(seq(res("match"), preterm), res("with")), clauses), r => {
      @preterm.Combp(@preterm.Combp(pv("_MATCH"), r.0.0.1), r.1)
    }),
    map(res("match"), fail_with("malformed match-with statement")),
    map(seq(res("function"), clauses), r => @preterm.Combp(pv("_FUNCTION"), r.1)),
    map(res("function"), fail_with("malformed function and pattern clauses")),
    map(
      seq(
        seq(idt("#"), identifier),
        possibly(map(seq(res("."), identifier), r => r.1)),
      ),
      lmk_decimal,
    ),
    map(idt("#"), fail_with("malformed numerical # identifier")),
    map(identifier, pv),
  ]
  // `p1 ||| p2 ||| ...` associates to the right; trying the alternatives
  // in order is equivalent.
  for p in alts {
    try p(i) catch {
      Noparse => continue
      e => raise e
    } noraise {
      r => return r
    }
  }
  raise Noparse
}

///|
fn pattern(i : Toks) -> ((Preterm, List[Preterm]), Toks) raise {
  seq(preterm, possibly(map(seq(res("when"), preterm), r => r.1)))(i)
}

///|
fn clause(i : Toks) -> (Preterm, Toks) raise {
  map(seq(pattern, map(seq(res("->"), preterm), r => r.1)), pmk_pattern)(i)
}

///|
fn clauses(i : Toks) -> (Preterm, Toks) raise {
  map(
    map(
      seq(possibly(res("|")), listof(clause, res("|"), "pattern-match clause")),
      r => r.1,
    ),
    cs => {
      @lib.end_itlist(
        (s, t) => @preterm.Combp(@preterm.Combp(pv("_SEQPATTERN"), s), t),
        cs,
      )
    },
  )(i)
}

///|
/// Parse a preterm from tokens.
pub fn parse_preterm(inp : Toks) -> (Preterm, Toks) raise {
  match inp {
    More(Ident(s), tail=Empty) if !is_quoted(s) => (pv(s), @list.empty())
    _ => preterm(inp)
  }
}

///|
/// Parse a HOL type.
pub fn parse_type(s : String) -> HolType raise {
  let (pty, l) = parse_pretype(lex(s))
  if l.is_empty() {
    @preterm.type_of_pretype(pty)
  } else {
    raise Failure("Unparsed input following type")
  }
}

///|
/// Parse and typecheck a HOL term.
pub fn parse_term(s : String) -> Term raise {
  let (ptm, l) = parse_preterm(lex(s))
  if l.is_empty() {
    @preterm.term_of_preterm(@preterm.retypecheck(@list.empty(), ptm))
  } else {
    raise Failure("Unparsed input following term")
  }
}
