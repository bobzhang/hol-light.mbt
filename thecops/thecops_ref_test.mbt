// Load-fidelity and behaviour test for thecops.ml: replays
// tools/ocaml_ref/thecops_ref.ml (keep in sync).

///|
using @testkit {sthm}

///|
test "thecops matches thecops.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("thecops")
  log.capture_stdout()
  let tm = @parser.parse_term
  let pv = (name : String, s : String, tac : @tactics.Tactic) => {
    log.attempt(name, () => sthm(@tactics.prove(tm(s), tac)))
  }
  let none : @list.List[@kernel.Thm] = @list.empty()
  let trans = "(!x y:A. R x y ==> R y x) /\\ (!x y z. R x y /\\ R y z ==> R x z) /\\ (!x. ?y. R x y) ==> !x. R x x"
  let sym = @list.singleton(@theorems.conj_sym())
  pv("lean_refl", "!x:A. P x ==> P x", @thecops.leancop_tac(none))
  pv("lean_drinker", "?x:A. P x ==> !y. P y", @thecops.leancop_tac(none))
  pv("lean_trans", trans, @thecops.leancop_tac(none))
  pv("lean_lemma", "!p q. p /\\ q ==> q /\\ p", @thecops.leancop_tac(sym))
  pv("nano_refl", "!x:A. P x ==> P x", @thecops.nanocop_tac(none))
  pv("nano_drinker", "?x:A. P x ==> !y. P y", @thecops.nanocop_tac(none))
  pv("nano_trans", trans, @thecops.nanocop_tac(none))
  pv("nano_lemma", "!p q. p /\\ q ==> q /\\ p", @thecops.nanocop_tac(sym))
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
      #|thecops quotations (21):
      #|  hashek = T
      #|  hashek
      #|  hashek
      #|  ((x /\\ hashek) ==> (y /\\ hashek)) ==> (x ==> y)
      #|  ~ hashek <=> F
      #|  hashek
      #|  x:A = y
      #|  (x:A = x) /\\ (~(x = y) \\/ y = x) /\\\n     (~(x:A = y) \\/ ~(x = z) \\/ (y = z))
      #|  (a ==> b) <=> ~a \\/ b
      #|  (a <=> b) ==> b \\/ ~a
      #|  c \\/ b \\/ a
      #|  c ==> c \\/ b \\/ a
      #|  b ==> c \\/ b \\/ a
      #|  a ==> c \\/ b \\/ a
      #|  a \\/ b \\/ c
      #|  F
      #|  p:bool
      #|  ~p
      #|  F
      #|  ~p
      #|  p:bool
      #|lean_refl =  |- (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) x:'A))))
      #|lean_drinker =  |- (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#!:fun(fun('A,bool),bool) (\y:'A. (P:fun('A,bool) y:'A))))))
      #|lean_trans =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) z:'A))) ((R:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#!:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. ((R:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#!:fun(fun('A,bool),bool) (\x:'A. ((R:fun('A,fun('A,bool)) x:'A) x:'A))))
      #|lean_lemma =  |- (#!:fun(fun(bool,bool),bool) (\p:bool. (#!:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool))))))
      #|nano_refl =  |- (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) x:'A))))
      #|nano_drinker =  |- (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#!:fun(fun('A,bool),bool) (\y:'A. (P:fun('A,bool) y:'A))))))
      #|nano_trans =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) z:'A))) ((R:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#!:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. ((R:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#!:fun(fun('A,bool),bool) (\x:'A. ((R:fun('A,fun('A,bool)) x:'A) x:'A))))
      #|nano_lemma =  |- (#!:fun(fun(bool,bool),bool) (\p:bool. (#!:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool))))))
      #|
    ),
  )
}
