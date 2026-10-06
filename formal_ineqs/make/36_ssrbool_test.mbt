// Formal_ineqs/lib/ssrbool.hl in its directory's load order: the test block of
// formal_ineqs/lib/ssrbool/ssrbool_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_lib_ssrbool_ref.expected).

///|
test "Formal_ineqs/lib/ssrbool matches Formal_ineqs/lib/ssrbool.ml" {
  @testkit.release_output()
  @ssrbool.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/lib/ssrbool"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/lib/ssrbool")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Ssrbool.iffLR", () => sthm(@ssrbool.ifflr_v1()))
  log.attempt("Ssrbool.iffRL", () => sthm(@ssrbool.iffrl_v1()))
  log.attempt("Ssrbool.iffLRn", () => sthm(@ssrbool.ifflrn_v1()))
  log.attempt("Ssrbool.iffRLn", () => sthm(@ssrbool.iffrln_v1()))
  log.attempt("Ssrbool.is_true_true", () => sthm(@ssrbool.is_true_true()))
  log.attempt("Ssrbool.not_false_is_true", () => {
    sthm(@ssrbool.not_false_is_true())
  })
  log.attempt("Ssrbool.isT", () => sthm(@ssrbool.ist()))
  log.attempt("Ssrbool.notF", () => sthm(@ssrbool.notf()))
  log.attempt("Ssrbool.negbT", () => sthm(@ssrbool.negbt()))
  log.attempt("Ssrbool.negbTE", () => sthm(@ssrbool.negbte()))
  log.attempt("Ssrbool.negbF", () => sthm(@ssrbool.negbf()))
  log.attempt("Ssrbool.negbFE", () => sthm(@ssrbool.negbfe()))
  log.attempt("Ssrbool.negbK", () => sthm(@ssrbool.negbk()))
  log.attempt("Ssrbool.negbNE", () => sthm(@ssrbool.negbne()))
  log.attempt("Ssrbool.negb_inj", () => sthm(@ssrbool.negb_inj()))
  log.attempt("Ssrbool.negbLR", () => sthm(@ssrbool.negblr()))
  log.attempt("Ssrbool.negbRL", () => sthm(@ssrbool.negbrl()))
  log.attempt("Ssrbool.contra", () => sthm(@ssrbool.contra()))
  log.attempt("Ssrbool.contraNN", () => sthm(@ssrbool.contrann()))
  log.attempt("Ssrbool.contraL", () => sthm(@ssrbool.contral()))
  log.attempt("Ssrbool.contraR", () => sthm(@ssrbool.contrar()))
  log.attempt("Ssrbool.contraLR", () => sthm(@ssrbool.contralr()))
  log.attempt("Ssrbool.contraT", () => sthm(@ssrbool.contrat()))
  log.attempt("Ssrbool.wlog_neg", () => sthm(@ssrbool.wlog_neg()))
  log.attempt("Ssrbool.contraFT", () => sthm(@ssrbool.contraft()))
  log.attempt("Ssrbool.contraFN", () => sthm(@ssrbool.contrafn()))
  log.attempt("Ssrbool.contraTF", () => sthm(@ssrbool.contratf()))
  log.attempt("Ssrbool.contraNF", () => sthm(@ssrbool.contranf()))
  log.attempt("Ssrbool.contraFF", () => sthm(@ssrbool.contraff()))
  log.attempt("Ssrbool.isSome", () => sthm(@ssrbool.issome()))
  log.attempt("Ssrbool.if_same", () => sthm(@ssrbool.if_same_v1()))
  log.attempt("Ssrbool.if_neg", () => sthm(@ssrbool.if_neg_v1()))
  log.attempt("Ssrbool.fun_if", () => sthm(@ssrbool.fun_if_v1()))
  log.attempt("Ssrbool.if_arg", () => sthm(@ssrbool.if_arg_v1()))
  log.attempt("Ssrbool.andTb", () => sthm(@ssrbool.andtb()))
  log.attempt("Ssrbool.andFb", () => sthm(@ssrbool.andfb()))
  log.attempt("Ssrbool.andbT", () => sthm(@ssrbool.andbt()))
  log.attempt("Ssrbool.andbF", () => sthm(@ssrbool.andbf()))
  log.attempt("Ssrbool.andbb", () => sthm(@ssrbool.andbb()))
  log.attempt("Ssrbool.andbC", () => sthm(@ssrbool.andbc()))
  log.attempt("Ssrbool.andbA", () => sthm(@ssrbool.andba()))
  log.attempt("Ssrbool.andbCA", () => sthm(@ssrbool.andbca()))
  log.attempt("Ssrbool.andbAC", () => sthm(@ssrbool.andbac()))
  log.attempt("Ssrbool.orTb", () => sthm(@ssrbool.ortb()))
  log.attempt("Ssrbool.orFb", () => sthm(@ssrbool.orfb()))
  log.attempt("Ssrbool.orbT", () => sthm(@ssrbool.orbt()))
  log.attempt("Ssrbool.orbF", () => sthm(@ssrbool.orbf()))
  log.attempt("Ssrbool.orbb", () => sthm(@ssrbool.orbb()))
  log.attempt("Ssrbool.orbC", () => sthm(@ssrbool.orbc()))
  log.attempt("Ssrbool.orbA", () => sthm(@ssrbool.orba()))
  log.attempt("Ssrbool.orbCA", () => sthm(@ssrbool.orbca()))
  log.attempt("Ssrbool.orbAC", () => sthm(@ssrbool.orbac()))
  log.attempt("Ssrbool.andbN", () => sthm(@ssrbool.andbn()))
  log.attempt("Ssrbool.andNb", () => sthm(@ssrbool.andnb()))
  log.attempt("Ssrbool.orbN", () => sthm(@ssrbool.orbn()))
  log.attempt("Ssrbool.orNb", () => sthm(@ssrbool.ornb()))
  log.attempt("Ssrbool.andb_orl", () => sthm(@ssrbool.andb_orl()))
  log.attempt("Ssrbool.andb_orr", () => sthm(@ssrbool.andb_orr()))
  log.attempt("Ssrbool.orb_andl", () => sthm(@ssrbool.orb_andl()))
  log.attempt("Ssrbool.orb_andr", () => sthm(@ssrbool.orb_andr()))
  log.attempt("Ssrbool.andb_idl", () => sthm(@ssrbool.andb_idl()))
  log.attempt("Ssrbool.andb_idr", () => sthm(@ssrbool.andb_idr()))
  log.attempt("Ssrbool.andb_id2l", () => sthm(@ssrbool.andb_id2l()))
  log.attempt("Ssrbool.andb_id2r", () => sthm(@ssrbool.andb_id2r()))
  log.attempt("Ssrbool.orb_idl", () => sthm(@ssrbool.orb_idl()))
  log.attempt("Ssrbool.orbb_idr", () => sthm(@ssrbool.orbb_idr()))
  log.attempt("Ssrbool.orb_id2l", () => sthm(@ssrbool.orb_id2l()))
  log.attempt("Ssrbool.orb_id2r", () => sthm(@ssrbool.orb_id2r()))
  log.attempt("Ssrbool.negb_and", () => sthm(@ssrbool.negb_and()))
  log.attempt("Ssrbool.negb_or", () => sthm(@ssrbool.negb_or()))
  log.attempt("Ssrbool.andbK", () => sthm(@ssrbool.andbk()))
  log.attempt("Ssrbool.andKb", () => sthm(@ssrbool.andkb()))
  log.attempt("Ssrbool.orbK", () => sthm(@ssrbool.orbk()))
  log.attempt("Ssrbool.orKb", () => sthm(@ssrbool.orkb()))
  log.attempt("Ssrbool.implybT", () => sthm(@ssrbool.implybt()))
  log.attempt("Ssrbool.implybF", () => sthm(@ssrbool.implybf()))
  log.attempt("Ssrbool.implyFb", () => sthm(@ssrbool.implyfb()))
  log.attempt("Ssrbool.implyTb", () => sthm(@ssrbool.implytb()))
  log.attempt("Ssrbool.implybb", () => sthm(@ssrbool.implybb()))
  log.attempt("Ssrbool.negb_imply", () => sthm(@ssrbool.negb_imply()))
  log.attempt("Ssrbool.implybE", () => sthm(@ssrbool.implybe()))
  log.attempt("Ssrbool.implyNb", () => sthm(@ssrbool.implynb()))
  log.attempt("Ssrbool.implybN", () => sthm(@ssrbool.implybn()))
  log.attempt("Ssrbool.implybNN", () => sthm(@ssrbool.implybnn()))
  log.attempt("Ssrbool.implyb_idl", () => sthm(@ssrbool.implyb_idl()))
  log.attempt("Ssrbool.implyb_idr", () => sthm(@ssrbool.implyb_idr()))
  log.attempt("Ssrbool.implyb_id2l", () => sthm(@ssrbool.implyb_id2l()))
  log.attempt("Ssrbool.XOR_DEF", () => sthm(@ssrbool.xor_def()))
  log.attempt("Ssrbool.addFb", () => sthm(@ssrbool.addfb()))
  log.attempt("Ssrbool.addbF", () => sthm(@ssrbool.addbf()))
  log.attempt("Ssrbool.addbb", () => sthm(@ssrbool.addbb()))
  log.attempt("Ssrbool.addbC", () => sthm(@ssrbool.addbc()))
  log.attempt("Ssrbool.addbA", () => sthm(@ssrbool.addba()))
  log.attempt("Ssrbool.addbCA", () => sthm(@ssrbool.addbca()))
  log.attempt("Ssrbool.addbAC", () => sthm(@ssrbool.addbac()))
  log.attempt("Ssrbool.andb_addl", () => sthm(@ssrbool.andb_addl()))
  log.attempt("Ssrbool.andb_addr", () => sthm(@ssrbool.andb_addr()))
  log.attempt("Ssrbool.addKb", () => sthm(@ssrbool.addkb()))
  log.attempt("Ssrbool.addbK", () => sthm(@ssrbool.addbk()))
  log.attempt("Ssrbool.addIb", () => sthm(@ssrbool.addib()))
  log.attempt("Ssrbool.addbI", () => sthm(@ssrbool.addbi()))
  log.attempt("Ssrbool.addTb", () => sthm(@ssrbool.addtb()))
  log.attempt("Ssrbool.addbT", () => sthm(@ssrbool.addbt()))
  log.attempt("Ssrbool.addbN", () => sthm(@ssrbool.addbn()))
  log.attempt("Ssrbool.addNb", () => sthm(@ssrbool.addnb()))
  log.attempt("Ssrbool.subpred", () => sthm(@ssrbool.subpred()))
  log.attempt("Ssrbool.subrel", () => sthm(@ssrbool.subrel()))
  log.attempt("Ssrbool.pred0", () => sthm(@ssrbool.pred0()))
  log.attempt("Ssrbool.predT", () => sthm(@ssrbool.predt()))
  log.attempt("Ssrbool.predI", () => sthm(@ssrbool.predi()))
  log.attempt("Ssrbool.predU", () => sthm(@ssrbool.predu()))
  log.attempt("Ssrbool.predC", () => sthm(@ssrbool.predc()))
  log.attempt("Ssrbool.predD", () => sthm(@ssrbool.predd()))
  log.attempt("Ssrbool.preim", () => sthm(@ssrbool.preim()))
  log.attempt("Ssrbool.relU", () => sthm(@ssrbool.relu()))
  log.attempt("Ssrbool.subrelUl", () => sthm(@ssrbool.subrelul()))
  log.attempt("Ssrbool.subrelUr", () => sthm(@ssrbool.subrelur()))
  // END generated theorem list
  let tm = @parser.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
    content=(
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Formal_ineqs/lib/ssrbool quotations (122):
      #|  :bool
      #|  :bool
      #|  P <=> Q
      #|  P ==> Q
      #|  Q ==> P
      #|  ~P ==> ~Q
      #|  ~Q ==> ~P
      #|  T
      #|  ~F
      #|  (b = F) ==> ~b
      #|  ~b ==> b = F
      #|  b ==> ~b = F
      #|  ~b = F ==> b
      #|  ~ ~b = b
      #|  ~ ~ b ==> b
      #|  ~b1 = ~b2 ==> b1 = b2
      #|  b = ~c ==> ~b = c
      #|  ~b = c ==> b = ~c
      #|  (c ==> b) ==> ~b ==> ~c
      #|  (c ==> ~b) ==> b ==> ~c
      #|  (~c ==> b) ==> ~b ==> c
      #|  (~c ==> ~b) ==> b ==> c
      #|  (~b ==> F) ==> b
      #|  (~b ==> b) ==> b
      #|  (~c ==> b) ==> b = F ==> c
      #|  (c ==> b) ==> b = F ==> ~c
      #|  (c ==> ~b) ==> b ==> c = F
      #|  (c ==> b) ==> ~b ==> c = F
      #|  (c ==> b) ==> b = F ==> c = F
      #|  isSome NONE = F /\\ (!x. isSome (SOME x) = T)
      #|  :A
      #|  :A
      #|  :A -> B
      #|  :bool
      #|  (if b then vT else vT) = vT
      #|  (if ~b then vT else vF) = if b then vF else vT
      #|  f (if b then vT else vF) = if b then f vT else f vF
      #|  (if b then (fT:A->B) else fF) x = if b then fT x else fF x
      #|  (T /\\ b) = b
      #|  (F /\\ b) = F
      #|  (b /\\ T) = b
      #|  (b /\\ F) = F
      #|  (b /\\ b) = b
      #|  (b /\\ c) = (c /\\ b)
      #|  b /\\ (c /\\ p) <=> (b /\\ c) /\\ p
      #|  b /\\ (c /\\ p) <=> c /\\ (b /\\ p)
      #|  (b /\\ c) /\\ p <=> (b /\\ p) /\\ c
      #|  T \\/ b <=> T
      #|  F \\/ b <=> b
      #|  b \\/ T <=> T
      #|  b \\/ F <=> b
      #|  b \\/ b <=> b
      #|  b \\/ c <=> c \\/ b
      #|  b \\/ (c \\/ p) <=> (b \\/ c) \\/ p
      #|  b \\/ (c \\/ p) <=> c \\/ (b \\/ p)
      #|  (b \\/ c) \\/ p <=> (b \\/ p) \\/ c
      #|  b /\\ ~b <=> F
      #|  ~b /\\ b <=> F
      #|  b \\/ ~b
      #|  ~b \\/ b
      #|  (b \\/ c) /\\ p <=> (b /\\ p) \\/ (c /\\ p)
      #|  b /\\ (c \\/ p) <=> (b /\\ c) \\/ (b /\\ p)
      #|  (b /\\ c) \\/ p <=> (b \\/ p) /\\ (c \\/ p)
      #|  b \\/ (c /\\ p) <=> (b \\/ c) /\\ (b \\/ p)
      #|  (b ==> a) ==> (a /\\ b <=> b)
      #|  (a ==> b) ==> (a /\\ b <=> a)
      #|  (a ==> (b <=> c)) ==> (a /\\ b <=> a /\\ c)
      #|  (b ==> (a <=> c)) ==> (a /\\ b <=> c /\\ b)
      #|  (a ==> b) ==> (a \\/ b <=> b)
      #|  (b ==> a) ==> (a \\/ b <=> a)
      #|  (~ a ==> (b <=> c)) ==> (a \\/ b <=> a \\/ c)
      #|  (~ b ==> (a <=> c)) ==> (a \\/ b <=> c \\/ b)
      #|  ~ (a /\\ b) <=> ~ a \\/ ~ b
      #|  ~ (a \\/ b) <=> ~ a /\\ ~ b
      #|  ((a /\\ b) \\/ a) = a
      #|  a \\/ b /\\ a <=> a
      #|  (a \\/ b) /\\ a <=> a
      #|  a /\\ (b \\/ a) <=> a
      #|  b ==> T
      #|  (b ==> F) <=> ~ b
      #|  F ==> b
      #|  (T ==> b) <=> b
      #|  b ==> b
      #|  ~ (a ==> b) <=> a /\\ ~ b
      #|  (a ==> b) <=> ~ a \\/ b
      #|  (~ a ==> b) <=> a \\/ b
      #|  (a ==> ~ b) <=> (b ==> ~ a)
      #|  (~ a ==> ~ b) <=> b ==> a
      #|  (~ a ==> b) ==> ((a ==> b) <=> b)
      #|  (b ==> ~ a) ==> ((a ==> b) <=> ~ a)
      #|  (a ==> (b <=> c)) ==> ((a ==> b) <=> (a ==> c))
      #|  XOR p q = if p then ~q else q
      #|  XOR
      #|  F + b <=> b
      #|  b + F <=> b
      #|  b + b <=> F
      #|  b + c <=> c + b
      #|  a + (b + c) <=> (a + b) + c
      #|  (a + b) + c <=> (a + c) + b
      #|  a + (b + c) <=> b + (a + c)
      #|  (a + b) /\\ c <=> (a /\\ c) + (b /\\ c)
      #|  a /\\ (b + c) <=> (a /\\ b) + (a /\\ c)
      #|  x + (x + y) <=> y
      #|  (y + x) + x <=> y
      #|  (y1 + x <=> y2 + x) ==> (y1 = y2)
      #|  (x + y1 <=> x + y2) ==> (y1 = y2)
      #|  T + b <=> ~b
      #|  b + T <=> ~ b
      #|  a + ~ b <=> ~ (a + b)
      #|  ~ a + b <=> ~ (a + b)
      #|  subpred p1 p2 <=> (!x. p1 x ==> p2 x)
      #|  subrel r1 r2 <=> (!x y. r1 x y ==> r2 x y)
      #|  pred0 = (\\x. F)
      #|  predT = (\\x. T)
      #|  predI p1 p2 = (\\x. p1 x /\\ p2 x)
      #|  predU p1 p2 = (\\x. p1 x \\/ p2 x)
      #|  predC p = (\\x. ~p x)
      #|  predD p1 p2 = (\\x. ~p2 x /\\ p1 x)
      #|  preim f (d:A->bool) = (\\x. d (f x))
      #|  relU r1 r2 = (\\x y. r1 x y \\/ r2 x y)
      #|  subrel r1 (relU r1 r2)
      #|  subrel r2 (relU r1 r2)
      #|Ssrbool.iffLR =  |- (#!:fun(fun(bool,bool),bool) (\P:bool. (#!:fun(fun(bool,bool),bool) (\Q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) P:bool) Q:bool))))))
      #|Ssrbool.iffRL =  |- (#!:fun(fun(bool,bool),bool) (\Q:bool. (#!:fun(fun(bool,bool),bool) (\P:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) Q:bool) P:bool))))))
      #|Ssrbool.iffLRn =  |- (#!:fun(fun(bool,bool),bool) (\P:bool. (#!:fun(fun(bool,bool),bool) (\Q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) P:bool)) (#~:fun(bool,bool) Q:bool)))))))
      #|Ssrbool.iffRLn =  |- (#!:fun(fun(bool,bool),bool) (\Q:bool. (#!:fun(fun(bool,bool),bool) (\P:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) Q:bool)) (#~:fun(bool,bool) P:bool)))))))
      #|Ssrbool.is_true_true =  |- #T:bool
      #|Ssrbool.not_false_is_true =  |- (#~:fun(bool,bool) #F:bool)
      #|Ssrbool.isT =  |- #T:bool
      #|Ssrbool.notF =  |- (#~:fun(bool,bool) #F:bool)
      #|Ssrbool.negbT =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.negbTE =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool))))
      #|Ssrbool.negbF =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) #F:bool))))
      #|Ssrbool.negbFE =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) #F:bool)) b:bool)))
      #|Ssrbool.negbK =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#~:fun(bool,bool) b:bool))) b:bool)))
      #|Ssrbool.negbNE =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#~:fun(bool,bool) b:bool))) b:bool)))
      #|Ssrbool.negb_inj =  |- (#!:fun(fun(bool,bool),bool) (\b1:bool. (#!:fun(fun(bool,bool),bool) (\b2:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b1:bool)) (#~:fun(bool,bool) b2:bool))) ((#=:fun(bool,fun(bool,bool)) b1:bool) b2:bool))))))
      #|Ssrbool.negbLR =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) c:bool))))))
      #|Ssrbool.negbRL =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) c:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contra =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraNN =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraL =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraR =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) c:bool))))))
      #|Ssrbool.contraLR =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool))))))
      #|Ssrbool.contraT =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) #F:bool)) b:bool)))
      #|Ssrbool.wlog_neg =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) b:bool)) b:bool)))
      #|Ssrbool.contraFT =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) b:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) c:bool))))))
      #|Ssrbool.contraFN =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraTF =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool)))))))
      #|Ssrbool.contraNF =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool)))))))
      #|Ssrbool.contraFF =  |- (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool)))))))
      #|Ssrbool.isSome =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#isSome:fun(option('?1968718),bool) #NONE:option('?1968718))) #F:bool)) (#!:fun(fun('?1968718,bool),bool) (\x:'?1968718. ((#=:fun(bool,fun(bool,bool)) (#isSome:fun(option('?1968718),bool) (#SOME:fun('?1968718,option('?1968718)) x:'?1968718))) #T:bool))))
      #|Ssrbool.if_same =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun('A,bool),bool) (\vT:'A. ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) vT:'A) vT:'A)) vT:'A)))))
      #|Ssrbool.if_neg =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun('A,bool),bool) (\vF:'A. (#!:fun(fun('A,bool),bool) (\vT:'A. ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) (#~:fun(bool,bool) b:bool)) vT:'A) vF:'A)) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) vF:'A) vT:'A))))))))
      #|Ssrbool.fun_if =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun('A,bool),bool) (\vT:'A. (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun('A,bool),bool) (\vF:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) vT:'A) vF:'A))) (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (f:fun('A,'B) vT:'A)) (f:fun('A,'B) vF:'A)))))))))))
      #|Ssrbool.if_arg =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(fun('A,'B),bool),bool) (\fT:fun('A,'B). (#!:fun(fun(fun('A,'B),bool),bool) (\fF:fun('A,'B). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) ((((#COND:fun(bool,fun(fun('A,'B),fun(fun('A,'B),fun('A,'B)))) b:bool) fT:fun('A,'B)) fF:fun('A,'B)) x:'A)) (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (fT:fun('A,'B) x:'A)) (fF:fun('A,'B) x:'A)))))))))))
      #|Ssrbool.andTb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #T:bool) b:bool)) b:bool)))
      #|Ssrbool.andFb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #F:bool) b:bool)) #F:bool)))
      #|Ssrbool.andbT =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) #T:bool)) b:bool)))
      #|Ssrbool.andbF =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) #F:bool)) #F:bool)))
      #|Ssrbool.andbb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) b:bool)) b:bool)))
      #|Ssrbool.andbC =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) b:bool))))))
      #|Ssrbool.andbA =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool))))))))
      #|Ssrbool.andbCA =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) c:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.andbAC =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)) c:bool))))))))
      #|Ssrbool.orTb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #T:bool) b:bool)) #T:bool)))
      #|Ssrbool.orFb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #F:bool) b:bool)) b:bool)))
      #|Ssrbool.orbT =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) #T:bool)) #T:bool)))
      #|Ssrbool.orbF =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) #F:bool)) b:bool)))
      #|Ssrbool.orbb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) b:bool)) b:bool)))
      #|Ssrbool.orbC =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) b:bool))))))
      #|Ssrbool.orbA =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool))))))))
      #|Ssrbool.orbCA =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#\/:fun(bool,fun(bool,bool)) c:bool) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.orbAC =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)) c:bool))))))))
      #|Ssrbool.andbN =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) b:bool))) #F:bool)))
      #|Ssrbool.andNb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) b:bool)) #F:bool)))
      #|Ssrbool.orbN =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#\/:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.orNb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) b:bool)))
      #|Ssrbool.andb_orl =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool)))))))))
      #|Ssrbool.andb_orr =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.orb_andl =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool)))))))))
      #|Ssrbool.orb_andr =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. (#!:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.andb_idl =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) b:bool))))))
      #|Ssrbool.andb_idr =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool))))))
      #|Ssrbool.andb_id2l =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#=:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.andb_id2r =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#=:fun(bool,fun(bool,bool)) a:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) b:bool)))))))))
      #|Ssrbool.orb_idl =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) b:bool))))))
      #|Ssrbool.orbb_idr =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool))))))
      #|Ssrbool.orb_id2l =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.orb_id2r =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) b:bool)))))))))
      #|Ssrbool.negb_and =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool))) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool)))))))
      #|Ssrbool.negb_or =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool)))))))
      #|Ssrbool.andbK =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool)) a:bool)))))
      #|Ssrbool.andKb =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) a:bool))) a:bool)))))
      #|Ssrbool.orbK =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool)) a:bool)))))
      #|Ssrbool.orKb =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#\/:fun(bool,fun(bool,bool)) b:bool) a:bool))) a:bool)))))
      #|Ssrbool.implybT =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) b:bool) #T:bool)))
      #|Ssrbool.implybF =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) #F:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.implyFb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) #F:bool) b:bool)))
      #|Ssrbool.implyTb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #T:bool) b:bool)) b:bool)))
      #|Ssrbool.implybb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) b:bool) b:bool)))
      #|Ssrbool.negb_imply =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool))) ((#/\:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool)))))))
      #|Ssrbool.implybE =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool))))))
      #|Ssrbool.implyNb =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool))))))
      #|Ssrbool.implybN =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) a:bool)))))))
      #|Ssrbool.implybNN =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool))))))
      #|Ssrbool.implyb_idl =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) b:bool))))))
      #|Ssrbool.implyb_idr =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) a:bool))) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) (#~:fun(bool,bool) a:bool)))))))
      #|Ssrbool.implyb_id2l =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#=:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.XOR_DEF =  |- (#!:fun(fun(bool,bool),bool) (\p:bool. (#!:fun(fun(bool,bool),bool) (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) p:bool) q:bool)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) p:bool) (#~:fun(bool,bool) q:bool)) q:bool))))))
      #|Ssrbool.addFb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) #F:bool) b:bool)) b:bool)))
      #|Ssrbool.addbF =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) #F:bool)) b:bool)))
      #|Ssrbool.addbb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) b:bool)) #F:bool)))
      #|Ssrbool.addbC =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#XOR:fun(bool,fun(bool,bool)) c:bool) b:bool))))))
      #|Ssrbool.addbA =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool))))))))
      #|Ssrbool.addbCA =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) c:bool)) b:bool))))))))
      #|Ssrbool.addbAC =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#XOR:fun(bool,fun(bool,bool)) b:bool) ((#XOR:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.andb_addl =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)))))))))
      #|Ssrbool.andb_addr =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. (#!:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#XOR:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.addKb =  |- (#!:fun(fun(bool,bool),bool) (\x:bool. (#!:fun(fun(bool,bool),bool) (\y:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) x:bool) ((#XOR:fun(bool,fun(bool,bool)) x:bool) y:bool))) y:bool)))))
      #|Ssrbool.addbK =  |- (#!:fun(fun(bool,bool),bool) (\x:bool. (#!:fun(fun(bool,bool),bool) (\y:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) y:bool) x:bool)) x:bool)) y:bool)))))
      #|Ssrbool.addIb =  |- (#!:fun(fun(bool,bool),bool) (\x:bool. (#!:fun(fun(bool,bool),bool) (\y1:bool. (#!:fun(fun(bool,bool),bool) (\y2:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) y1:bool) x:bool)) ((#XOR:fun(bool,fun(bool,bool)) y2:bool) x:bool))) ((#=:fun(bool,fun(bool,bool)) y1:bool) y2:bool))))))))
      #|Ssrbool.addbI =  |- (#!:fun(fun(bool,bool),bool) (\x:bool. (#!:fun(fun(bool,bool),bool) (\y1:bool. (#!:fun(fun(bool,bool),bool) (\y2:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) x:bool) y1:bool)) ((#XOR:fun(bool,fun(bool,bool)) x:bool) y2:bool))) ((#=:fun(bool,fun(bool,bool)) y1:bool) y2:bool))))))))
      #|Ssrbool.addTb =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) #T:bool) b:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.addbT =  |- (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) #T:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.addbN =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool))) (#~:fun(bool,bool) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)))))))
      #|Ssrbool.addNb =  |- (#!:fun(fun(bool,bool),bool) (\a:bool. (#!:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool)) (#~:fun(bool,bool) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)))))))
      #|Ssrbool.subpred =  |- (#!:fun(fun(fun('?1969423,bool),bool),bool) (\p1:fun('?1969423,bool). (#!:fun(fun(fun('?1969423,bool),bool),bool) (\p2:fun('?1969423,bool). ((#=:fun(bool,fun(bool,bool)) ((#subpred:fun(fun('?1969423,bool),fun(fun('?1969423,bool),bool)) p1:fun('?1969423,bool)) p2:fun('?1969423,bool))) (#!:fun(fun('?1969423,bool),bool) (\x:'?1969423. ((#==>:fun(bool,fun(bool,bool)) (p1:fun('?1969423,bool) x:'?1969423)) (p2:fun('?1969423,bool) x:'?1969423)))))))))
      #|Ssrbool.subrel =  |- (#!:fun(fun(fun('?1969442,fun('?1969441,bool)),bool),bool) (\r1:fun('?1969442,fun('?1969441,bool)). (#!:fun(fun(fun('?1969442,fun('?1969441,bool)),bool),bool) (\r2:fun('?1969442,fun('?1969441,bool)). ((#=:fun(bool,fun(bool,bool)) ((#subrel:fun(fun('?1969442,fun('?1969441,bool)),fun(fun('?1969442,fun('?1969441,bool)),bool)) r1:fun('?1969442,fun('?1969441,bool))) r2:fun('?1969442,fun('?1969441,bool)))) (#!:fun(fun('?1969442,bool),bool) (\x:'?1969442. (#!:fun(fun('?1969441,bool),bool) (\y:'?1969441. ((#==>:fun(bool,fun(bool,bool)) ((r1:fun('?1969442,fun('?1969441,bool)) x:'?1969442) y:'?1969441)) ((r2:fun('?1969442,fun('?1969441,bool)) x:'?1969442) y:'?1969441)))))))))))
      #|Ssrbool.pred0 =  |- ((#=:fun(fun('?1969448,bool),fun(fun('?1969448,bool),bool)) #pred0:fun('?1969448,bool)) (\x:'?1969448. #F:bool))
      #|Ssrbool.predT =  |- ((#=:fun(fun('?1969454,bool),fun(fun('?1969454,bool),bool)) #predT:fun('?1969454,bool)) (\x:'?1969454. #T:bool))
      #|Ssrbool.predI =  |- (#!:fun(fun(fun('?1969466,bool),bool),bool) (\p1:fun('?1969466,bool). (#!:fun(fun(fun('?1969466,bool),bool),bool) (\p2:fun('?1969466,bool). ((#=:fun(fun('?1969466,bool),fun(fun('?1969466,bool),bool)) ((#predI:fun(fun('?1969466,bool),fun(fun('?1969466,bool),fun('?1969466,bool))) p1:fun('?1969466,bool)) p2:fun('?1969466,bool))) (\x:'?1969466. ((#/\:fun(bool,fun(bool,bool)) (p1:fun('?1969466,bool) x:'?1969466)) (p2:fun('?1969466,bool) x:'?1969466))))))))
      #|Ssrbool.predU =  |- (#!:fun(fun(fun('?1969478,bool),bool),bool) (\p1:fun('?1969478,bool). (#!:fun(fun(fun('?1969478,bool),bool),bool) (\p2:fun('?1969478,bool). ((#=:fun(fun('?1969478,bool),fun(fun('?1969478,bool),bool)) ((#predU:fun(fun('?1969478,bool),fun(fun('?1969478,bool),fun('?1969478,bool))) p1:fun('?1969478,bool)) p2:fun('?1969478,bool))) (\x:'?1969478. ((#\/:fun(bool,fun(bool,bool)) (p1:fun('?1969478,bool) x:'?1969478)) (p2:fun('?1969478,bool) x:'?1969478))))))))
      #|Ssrbool.predC =  |- (#!:fun(fun(fun('?1969487,bool),bool),bool) (\p:fun('?1969487,bool). ((#=:fun(fun('?1969487,bool),fun(fun('?1969487,bool),bool)) (#predC:fun(fun('?1969487,bool),fun('?1969487,bool)) p:fun('?1969487,bool))) (\x:'?1969487. (#~:fun(bool,bool) (p:fun('?1969487,bool) x:'?1969487))))))
      #|Ssrbool.predD =  |- (#!:fun(fun(fun('?1969500,bool),bool),bool) (\p2:fun('?1969500,bool). (#!:fun(fun(fun('?1969500,bool),bool),bool) (\p1:fun('?1969500,bool). ((#=:fun(fun('?1969500,bool),fun(fun('?1969500,bool),bool)) ((#predD:fun(fun('?1969500,bool),fun(fun('?1969500,bool),fun('?1969500,bool))) p1:fun('?1969500,bool)) p2:fun('?1969500,bool))) (\x:'?1969500. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (p2:fun('?1969500,bool) x:'?1969500))) (p1:fun('?1969500,bool) x:'?1969500))))))))
      #|Ssrbool.preim =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\d:fun('A,bool). (#!:fun(fun(fun('?1969510,'A),bool),bool) (\f:fun('?1969510,'A). ((#=:fun(fun('?1969510,bool),fun(fun('?1969510,bool),bool)) ((#preim:fun(fun('?1969510,'A),fun(fun('A,bool),fun('?1969510,bool))) f:fun('?1969510,'A)) d:fun('A,bool))) (\x:'?1969510. (d:fun('A,bool) (f:fun('?1969510,'A) x:'?1969510))))))))
      #|Ssrbool.relU =  |- (#!:fun(fun(fun('?1969526,fun('?1969525,bool)),bool),bool) (\r1:fun('?1969526,fun('?1969525,bool)). (#!:fun(fun(fun('?1969526,fun('?1969525,bool)),bool),bool) (\r2:fun('?1969526,fun('?1969525,bool)). ((#=:fun(fun('?1969526,fun('?1969525,bool)),fun(fun('?1969526,fun('?1969525,bool)),bool)) ((#relU:fun(fun('?1969526,fun('?1969525,bool)),fun(fun('?1969526,fun('?1969525,bool)),fun('?1969526,fun('?1969525,bool)))) r1:fun('?1969526,fun('?1969525,bool))) r2:fun('?1969526,fun('?1969525,bool)))) (\x:'?1969526. (\y:'?1969525. ((#\/:fun(bool,fun(bool,bool)) ((r1:fun('?1969526,fun('?1969525,bool)) x:'?1969526) y:'?1969525)) ((r2:fun('?1969526,fun('?1969525,bool)) x:'?1969526) y:'?1969525)))))))))
      #|Ssrbool.subrelUl =  |- (#!:fun(fun(fun('?1969534,fun('?1969535,bool)),bool),bool) (\r1:fun('?1969534,fun('?1969535,bool)). (#!:fun(fun(fun('?1969534,fun('?1969535,bool)),bool),bool) (\r2:fun('?1969534,fun('?1969535,bool)). ((#subrel:fun(fun('?1969534,fun('?1969535,bool)),fun(fun('?1969534,fun('?1969535,bool)),bool)) r1:fun('?1969534,fun('?1969535,bool))) ((#relU:fun(fun('?1969534,fun('?1969535,bool)),fun(fun('?1969534,fun('?1969535,bool)),fun('?1969534,fun('?1969535,bool)))) r1:fun('?1969534,fun('?1969535,bool))) r2:fun('?1969534,fun('?1969535,bool))))))))
      #|Ssrbool.subrelUr =  |- (#!:fun(fun(fun('?1969543,fun('?1969544,bool)),bool),bool) (\r1:fun('?1969543,fun('?1969544,bool)). (#!:fun(fun(fun('?1969543,fun('?1969544,bool)),bool),bool) (\r2:fun('?1969543,fun('?1969544,bool)). ((#subrel:fun(fun('?1969543,fun('?1969544,bool)),fun(fun('?1969543,fun('?1969544,bool)),bool)) r2:fun('?1969543,fun('?1969544,bool))) ((#relU:fun(fun('?1969543,fun('?1969544,bool)),fun(fun('?1969543,fun('?1969544,bool)),fun('?1969543,fun('?1969544,bool)))) r1:fun('?1969543,fun('?1969544,bool))) r2:fun('?1969543,fun('?1969544,bool))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = relU preim predD predC predU predI predT pred0 subrel subpred XOR isSome associative idempotent commutative self_inverse rev_left_loop left_loop right_distributive left_commutative right_zero left_id rev_right_loop right_loop left_distributive right_commutative left_zero right_id right_injective left_injective right_inverse left_inverse involutive bijective ocancel pcancel cancel injective pcomp omap obind odflt oapp ssreflect_eq error_mul_f1 error_mul_f2 list_sum2 list_sum ddmatan dmatan matan halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? ! ==> /\ T =
      #|definitions = 1112
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1969545
      #|counter_genvar = _3719611:bool
      #|
    ),
  )
}
