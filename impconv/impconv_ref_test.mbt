// Load-fidelity and behaviour test for impconv.ml: replays
// tools/ocaml_ref/impconv_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
fn sgoal(g : @tactics.Goal) -> String {
  let (asl, w) = g
  "[" +
  asl.map(p => p.0 + ": " + sthm(p.1)).to_array().join("; ") +
  "] ?- " +
  stm(w)
}

///|
test "impconv matches impconv.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("impconv")
  log.capture_stdout()
  let tm = @parser.parse_term
  let st = (
    name : String,
    g : @tactics.Goal,
    tac : (@tactics.Goal) -> @tactics.Goalstate raise,
  ) => {
    log.attempt(name, () => {
      let (_, gls, _) = tac(g)
      "[" + gls.map(sgoal).to_array().join("; ") + "]"
    })
  }
  let pv = (
    name : String,
    w : @kernel.Term,
    tac : (@tactics.Goal) -> @tactics.Goalstate raise,
  ) => log.attempt(name, () => sthm(@tactics.prove(w, tac)))
  let (ax, ax2, px) = try {
    let ax = @kernel.assume_rule(tm("!x:bool. P x ==> (f x <=> g x)"))
    let ax2 = @kernel.assume_rule(tm("!x:bool. Q x ==> (g x <=> h x)"))
    let px = @kernel.assume_rule(tm("P (a:bool):bool"))
    (ax, ax2, px)
  } catch {
    e => fail("setup: \{e}")
  }
  let none : @list.List[(String, @kernel.Thm)] = @list.empty()
  let ths = (a : Array[@kernel.Thm]) => @list.List(a)
  let goal = (s : String) => (none, tm(s))
  try {
    st(
      "imp_rewrite",
      goal("P a ==> g a ==> f (a:bool)"),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    st(
      "imp_rewrite_seq",
      goal("f (a:bool) /\\ f b"),
      @impconv.seq_imp_rewrite_tac(ths([ax, ax2])),
    )
    st(
      "imp_rewrite_two",
      goal("f (a:bool) ==> g a"),
      @impconv.imp_rewrite_tac(ths([ax, ax2])),
    )
    st(
      "imp_rewrite_eq",
      goal("~(p /\\ q) ==> ~p \\/ ~q"),
      @impconv.imp_rewrite_tac(ths([@class.de_morgan_thm()])),
    )
    st(
      "imp_rewrite_unchanged",
      goal("p:bool"),
      @impconv.imp_rewrite_tac(ths([])),
    )
    st(
      "imp_rewrite_hyp",
      (@list.singleton(("h", px)), tm("f (a:bool)")),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    st("case_rewrite", goal("f (a:bool)"), @impconv.case_rewrite_tac(ax))
    st(
      "target_rewrite",
      goal("f (a:bool)"),
      @impconv.target_rewrite_tac(ths([ax2]))(ax),
    )
    st(
      "hint_exists",
      (@list.singleton(("h", px)), tm("?x:bool. P x")),
      @impconv.hint_exists_tac,
    )
    st("hint_exists_none", goal("?x:bool. P x"), @impconv.hint_exists_tac)
    st(
      "imp_rewrite_forall",
      goal("!y:bool. P y ==> f y"),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    st(
      "imp_rewrite_exists",
      goal("?y:bool. f y"),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    pv(
      "prove_imp_rewrite",
      tm("(!x:bool. P x ==> (f x <=> g x)) ==> P a ==> g a ==> f a"),
      @tactics.then_tac(
        @tactics.disch_then(th => @impconv.imp_rewrite_tac(ths([th]))),
        @itab.itaut_tac,
      ),
    )
    st(
      "case_rewrite_conj",
      goal("q ==> f (a:bool)"),
      @impconv.case_rewrite_tac(ax),
    )
    st(
      "target_rewrite_hyp",
      goal("f (a:bool)"),
      @impconv.target_rewrite_tac(ths([ax]))(ax2),
    )
  } catch {
    e => fail("\{e}")
  }
  inspect(
    log.contents(),
    content=(
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..7..15..26..54..86..136..solved at 208
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 10
      #|0..0..1..4..9..solved at 21
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..22..38..70..solved at 116
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..41..76..solved at 108
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|impconv quotations (31):
      #|  (/\\)
      #|  A:bool
      #|  B:bool
      #|  C:bool
      #|  D:bool
      #|  T:bool
      #|  A ==> A
      #|  (x ==> y /\\ z) <=> (x==>y) /\\(x==>z)
      #|  (p==>q==>r) <=> (q==>p==>r)
      #|  ((A ==> B) ==> (C ==> D)) /\\ ((B ==> A) ==> (D ==> C)) ==> (A <=> B)\n      ==> (C <=> D)
      #|  ((A ==> B) ==> C) /\\ ((B ==> A) ==> D) ==> (A <=> B) ==> C /\\ D
      #|  ((A ==> B) ==> C) ==> (A <=> B) ==> C /\\ (B ==> A)
      #|  ((B ==> A) ==> D) ==> (A <=> B) ==> (A ==> B) /\\ D
      #|  (C ==> A ==> B) /\\ (D ==> B ==> A) ==> C /\\ D ==> (A <=> B)
      #|  (C ==> A ==> B) ==> C /\\ (B ==> A) ==> (A <=> B)
      #|  (D ==> B ==> A) ==> (A ==> B) /\\ D ==> (A <=> B)
      #|  (B==>A) /\\ (A==>B==>C==>D) ==> (A==>C) ==> (B==>D)
      #|  (A==>B) /\\ (A==>B==>D==>C) ==> (B==>D) ==> (A==>C)
      #|  (A==>C==>D) ==> (A==>C) ==> (A==>D)
      #|  (C==>A==>B) /\\ (A==>B==>C==>D) ==> (A/\\C==>B/\\D)
      #|  (C==>A==>B) ==> (A/\\C==>B/\\C)
      #|  (A==>C==>D) ==> (A/\\C==>A/\\D)
      #|  (B==>A) /\\ (B==>D==>C) ==> (B/\\D==>A/\\C)
      #|  (B==>A) ==> (B/\\C==>A/\\C)
      #|  (C==>B==>A) ==> (B/\\C==>A/\\C)
      #|  :bool->bool->bool
      #|  A==>B==>C <=> B==>A==>C
      #|  (~P ==> Q = R) ==> (Q <=> (~P ==> R) /\\ (P ==> Q))
      #|  (P ==> Q = R) ==> (Q <=> (P ==> R) /\\ (~P ==> Q))
      #|  :bool->bool->bool
      #|  A==>B==>C <=> B==>A==>C
      #|imp_rewrite = []
      #|imp_rewrite_seq = [[] ?- ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (h:fun(bool,bool) a:bool)) (Q:fun(bool,bool) a:bool))) (P:fun(bool,bool) a:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (h:fun(bool,bool) b:bool)) (Q:fun(bool,bool) b:bool))) (P:fun(bool,bool) b:bool)))]
      #|imp_rewrite_two = [[] ?- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) a:bool)) (g:fun(bool,bool) a:bool))) ((#/\:fun(bool,fun(bool,bool)) #T:bool) (P:fun(bool,bool) a:bool)))]
      #|imp_rewrite_eq = []
      #|imp_rewrite_unchanged ! Unchanged
      #|Warning: inventing type variables
      #|imp_rewrite_hyp ! Unchanged
      #|Warning: inventing type variables
      #|case_rewrite !! Unchanged
      #|Warning: inventing type variables
      #|target_rewrite ! vsubst: Bad substitution list
      #|hint_exists = []
      #|hint_exists_none ! Unchanged
      #|imp_rewrite_forall = [[] ?- (#!:fun(fun(bool,bool),bool) (\y:bool. ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) y:bool)) (g:fun(bool,bool) y:bool))))]
      #|imp_rewrite_exists = [[] ?- (#?:fun(fun(bool,bool),bool) (\y:bool. ((#/\:fun(bool,fun(bool,bool)) (g:fun(bool,bool) y:bool)) (P:fun(bool,bool) y:bool))))]
      #|prove_imp_rewrite =  |- ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) x:bool)) ((#=:fun(bool,fun(bool,bool)) (f:fun(bool,bool) x:bool)) (g:fun(bool,bool) x:bool)))))) ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) a:bool)) ((#==>:fun(bool,fun(bool,bool)) (g:fun(bool,bool) a:bool)) (f:fun(bool,bool) a:bool))))
      #|case_rewrite_conj = [[] ?- ((#==>:fun(bool,fun(bool,bool)) q:bool) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) a:bool)) (g:fun(bool,bool) a:bool))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (P:fun(bool,bool) a:bool))) (f:fun(bool,bool) a:bool))))]
      #|Warning: inventing type variables
      #|target_rewrite_hyp ! vsubst: Bad substitution list
      #|
    ),
  )
}
