// Formal_ineqs/lib/ssrfun.hl in its directory's load order: the test block of
// formal_ineqs/lib/ssrfun/ssrfun_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_lib_ssrfun_ref.expected).

///|
test "Formal_ineqs/lib/ssrfun matches Formal_ineqs/lib/ssrfun.ml" {
  @testkit.release_output()
  @ssrfun.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/lib/ssrfun"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/lib/ssrfun")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Ssrfun.oapp", () => sthm(@ssrfun.oapp()))
  log.attempt("Ssrfun.odflt", () => sthm(@ssrfun.odflt()))
  log.attempt("Ssrfun.obind", () => sthm(@ssrfun.obind()))
  log.attempt("Ssrfun.omap", () => sthm(@ssrfun.omap()))
  log.attempt("Ssrfun.pcomp", () => sthm(@ssrfun.pcomp()))
  log.attempt("Ssrfun.odflt_alt", () => sthm(@ssrfun.odflt_alt()))
  log.attempt("Ssrfun.obind_alt", () => sthm(@ssrfun.obind_alt()))
  log.attempt("Ssrfun.omap_alt", () => sthm(@ssrfun.omap_alt()))
  log.attempt("Ssrfun.eq_sym", () => sthm(@ssrfun.eq_sym()))
  log.attempt("Ssrfun.eq_trans", () => sthm(@ssrfun.eq_trans()))
  log.attempt("Ssrfun.f_equal", () => sthm(@ssrfun.f_equal()))
  log.attempt("Ssrfun.f_equal2", () => sthm(@ssrfun.f_equal2()))
  log.attempt("Ssrfun.erefl", () => sthm(@ssrfun.erefl()))
  log.attempt("Ssrfun.esym", () => sthm(@ssrfun.esym()))
  log.attempt("Ssrfun.etrans", () => sthm(@ssrfun.etrans()))
  log.attempt("Ssrfun.congr1", () => sthm(@ssrfun.congr1()))
  log.attempt("Ssrfun.congr2", () => sthm(@ssrfun.congr2()))
  log.attempt("Ssrfun.eq_ext", () => sthm(@ssrfun.eq_ext()))
  log.attempt("Ssrfun.injective", () => sthm(@ssrfun.injective()))
  log.attempt("Ssrfun.cancel", () => sthm(@ssrfun.cancel()))
  log.attempt("Ssrfun.pcancel", () => sthm(@ssrfun.pcancel()))
  log.attempt("Ssrfun.ocancel", () => sthm(@ssrfun.ocancel()))
  log.attempt("Ssrfun.can_pcan", () => sthm(@ssrfun.can_pcan_v1()))
  log.attempt("Ssrfun.pcan_inj", () => sthm(@ssrfun.pcan_inj_v1()))
  log.attempt("Ssrfun.can_inj", () => sthm(@ssrfun.can_inj_v1()))
  log.attempt("Ssrfun.canLR", () => sthm(@ssrfun.canlr_v1()))
  log.attempt("Ssrfun.canRL", () => sthm(@ssrfun.canrl_v1()))
  log.attempt("Ssrfun.some_inj", () => sthm(@ssrfun.some_inj()))
  log.attempt("Ssrfun.inj_id", () => sthm(@ssrfun.inj_id_v1()))
  log.attempt("Ssrfun.inj_can_sym", () => sthm(@ssrfun.inj_can_sym_v1()))
  log.attempt("Ssrfun.inj_comp", () => sthm(@ssrfun.inj_comp_v1()))
  log.attempt("Ssrfun.can_comp", () => sthm(@ssrfun.can_comp_v1()))
  log.attempt("Ssrfun.pcan_pcomp", () => sthm(@ssrfun.pcan_pcomp_v1()))
  log.attempt("Ssrfun.eq_inj", () => sthm(@ssrfun.eq_inj_v1()))
  log.attempt("Ssrfun.eq_can", () => sthm(@ssrfun.eq_can_v1()))
  log.attempt("Ssrfun.inj_can_eq", () => sthm(@ssrfun.inj_can_eq_v1()))
  log.attempt("Ssrfun.bijective", () => sthm(@ssrfun.bijective()))
  log.attempt("Ssrfun.bij_inj", () => sthm(@ssrfun.bij_inj_v1()))
  log.attempt("Ssrfun.bij_can_sym", () => sthm(@ssrfun.bij_can_sym_v1()))
  log.attempt("Ssrfun.bij_can_eq", () => sthm(@ssrfun.bij_can_eq_v1()))
  log.attempt("Ssrfun.eq_bij", () => sthm(@ssrfun.eq_bij_v1()))
  log.attempt("Ssrfun.bij_comp", () => sthm(@ssrfun.bij_comp_v1()))
  log.attempt("Ssrfun.bij_can_bij", () => sthm(@ssrfun.bij_can_bij_v1()))
  log.attempt("Ssrfun.involutive", () => sthm(@ssrfun.involutive()))
  log.attempt("Ssrfun.inv_inj", () => sthm(@ssrfun.inv_inj_v1()))
  log.attempt("Ssrfun.inv_bij", () => sthm(@ssrfun.inv_bij_v1()))
  log.attempt("Ssrfun.left_inverse", () => sthm(@ssrfun.left_inverse()))
  log.attempt("Ssrfun.right_inverse", () => sthm(@ssrfun.right_inverse()))
  log.attempt("Ssrfun.left_injective", () => sthm(@ssrfun.left_injective()))
  log.attempt("Ssrfun.right_injective", () => sthm(@ssrfun.right_injective()))
  log.attempt("Ssrfun.right_id", () => sthm(@ssrfun.right_id()))
  log.attempt("Ssrfun.left_zero", () => sthm(@ssrfun.left_zero()))
  log.attempt("Ssrfun.right_commutative", () => {
    sthm(@ssrfun.right_commutative())
  })
  log.attempt("Ssrfun.left_distributive", () => {
    sthm(@ssrfun.left_distributive())
  })
  log.attempt("Ssrfun.right_loop", () => sthm(@ssrfun.right_loop()))
  log.attempt("Ssrfun.rev_right_loop", () => sthm(@ssrfun.rev_right_loop()))
  log.attempt("Ssrfun.left_id", () => sthm(@ssrfun.left_id()))
  log.attempt("Ssrfun.right_zero", () => sthm(@ssrfun.right_zero()))
  log.attempt("Ssrfun.left_commutative", () => sthm(@ssrfun.left_commutative()))
  log.attempt("Ssrfun.right_distributive", () => {
    sthm(@ssrfun.right_distributive())
  })
  log.attempt("Ssrfun.left_loop", () => sthm(@ssrfun.left_loop()))
  log.attempt("Ssrfun.rev_left_loop", () => sthm(@ssrfun.rev_left_loop()))
  log.attempt("Ssrfun.self_inverse", () => sthm(@ssrfun.self_inverse()))
  log.attempt("Ssrfun.commutative", () => sthm(@ssrfun.commutative()))
  log.attempt("Ssrfun.idempotent", () => sthm(@ssrfun.idempotent()))
  log.attempt("Ssrfun.associative", () => sthm(@ssrfun.associative()))
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
      #|Formal_ineqs/lib/ssrfun quotations (72):
      #|  forall f x y. oapp f x (SOME y) = f y /\\ oapp f x NONE = x
      #|  odflt = oapp I
      #|  obind f = oapp f NONE
      #|  omap f = obind (\\x. SOME (f x))
      #|  pcomp f g x = obind f (g x)
      #|  (forall y. odflt x (SOME y) = y) /\\ odflt x NONE = x
      #|  obind f NONE = NONE /\\ (forall x. obind f (SOME x) = f x)
      #|  omap f NONE = NONE /\\ (forall x. omap f (SOME x) = SOME (f x))
      #|  x = y ==> y = x
      #|  x = y ==> y = z ==> x = z
      #|  x = y ==> f x = f y
      #|  x1 = y1 ==> x2 = y2 ==> f x1 x2 = f y1 y2
      #|  (forall x. f x = g x) <=> f = g
      #|  :A -> R
      #|  injective f <=> (forall x1 x2. f x1 = f x2 ==> x1 = x2)
      #|  cancel f g <=> forall x. g (f x) = x
      #|  pcancel f g <=> forall x. g (f x) = SOME x
      #|  ocancel g h <=> forall x. oapp h x (g x) = x
      #|  cancel f g ==> pcancel f (\\y. SOME (g y))
      #|  pcancel f g ==> injective f
      #|  cancel f g ==> injective f
      #|  cancel f g ==> x = f y ==> g x = y
      #|  cancel f g ==> f x = y ==> x = g y
      #|  injective SOME
      #|  :B -> A
      #|  :B -> A
      #|  :C -> B
      #|  injective I
      #|  cancel f f' ==> injective f' ==> cancel f' f
      #|  injective f ==> injective h ==> injective (f o h)
      #|  cancel f f' ==> cancel h h' ==> cancel (f o h) (h' o f')
      #|  pcancel f f' ==> pcancel h h' ==> pcancel (f o h) (pcomp h' f')
      #|  injective f ==> (forall x. f x = g x) ==> injective g
      #|  cancel f f' ==> (forall x. f x = g x) ==> (forall x. f' x = g' x) ==> cancel g g'
      #|  cancel f f' ==> injective f' ==> cancel g f' ==> f = g
      #|  :B -> A
      #|  bijective f <=> ?g. cancel f g /\\ cancel g f
      #|  bijective f
      #|  injective f
      #|  cancel f' f <=> cancel f f'
      #|  cancel f f' ==> cancel f f'' ==> f' = f''
      #|  :BB -> AA
      #|  :CC -> BB
      #|  bijective f ==> forall g. (forall x. f x = g x) ==> bijective g
      #|  r o g
      #|  bijective f ==> bijective h ==> bijective (f o h)
      #|  bijective f ==> forall f'. cancel f f' ==> bijective f'
      #|  :A -> A
      #|  involutive f <=> cancel f f
      #|  involutive f
      #|  injective f
      #|  bijective f
      #|  left_inverse e inv op = forall x. op (inv x) x = e
      #|  right_inverse e inv op = forall x. op x (inv x) = e
      #|  left_injective op = forall x. injective (\\y. op y x)
      #|  right_injective op = forall y. injective (op y)
      #|  right_id e op = forall x. op x e = x
      #|  left_zero z op = forall x. op z x = z
      #|  right_commutative op = forall x y z. op (op x y) z = op (op x z) y
      #|  left_distributive op add = forall x y z. op (add x y) z = add (op x z) (op y z)
      #|  right_loop inv op = forall y. cancel (\\x. op x y) (\\x. op x (inv y))
      #|  rev_right_loop inv op = forall y. cancel (\\x. op x (inv y)) (\\x. op x y)
      #|  left_id e op = forall x. op e x = x
      #|  right_zero z op = forall x. op x z = z
      #|  left_commutative op = forall x y z. op x (op y z) = op y (op x z)
      #|  right_distributive op add = forall x y z. op x (add y z) = add (op x y) (op x z)
      #|  left_loop inv op = forall x. cancel (op x) (op (inv x))
      #|  rev_left_loop inv op = forall x. cancel (op (inv x)) (op x)
      #|  self_inverse e op = forall x. op x x = e
      #|  commutative op = forall x y. op x y = op y x
      #|  idempotent op = forall x. op x x = x
      #|  associative op = forall x y z. op x (op y z) = op (op x y) z
      #|Ssrfun.oapp =  |- (#forall:fun(fun(fun('?1967451,'?1967445),bool),bool) (\f:fun('?1967451,'?1967445). (#forall:fun(fun('?1967445,bool),bool) (\x:'?1967445. (#forall:fun(fun('?1967451,bool),bool) (\y:'?1967451. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('?1967445,fun('?1967445,bool)) (((#oapp:fun(fun('?1967451,'?1967445),fun('?1967445,fun(option('?1967451),'?1967445))) f:fun('?1967451,'?1967445)) x:'?1967445) (#SOME:fun('?1967451,option('?1967451)) y:'?1967451))) (f:fun('?1967451,'?1967445) y:'?1967451))) ((#=:fun('?1967445,fun('?1967445,bool)) (((#oapp:fun(fun('?1967451,'?1967445),fun('?1967445,fun(option('?1967451),'?1967445))) f:fun('?1967451,'?1967445)) x:'?1967445) #NONE:option('?1967451))) x:'?1967445))))))))
      #|Ssrfun.odflt =  |- ((#=:fun(fun('?1967459,fun(option('?1967459),'?1967459)),fun(fun('?1967459,fun(option('?1967459),'?1967459)),bool)) #odflt:fun('?1967459,fun(option('?1967459),'?1967459))) (#oapp:fun(fun('?1967459,'?1967459),fun('?1967459,fun(option('?1967459),'?1967459))) #I:fun('?1967459,'?1967459)))
      #|Ssrfun.obind =  |- (#forall:fun(fun(fun('?1967467,option('?1967469)),bool),bool) (\f:fun('?1967467,option('?1967469)). ((#=:fun(fun(option('?1967467),option('?1967469)),fun(fun(option('?1967467),option('?1967469)),bool)) (#obind:fun(fun('?1967467,option('?1967469)),fun(option('?1967467),option('?1967469))) f:fun('?1967467,option('?1967469)))) ((#oapp:fun(fun('?1967467,option('?1967469)),fun(option('?1967469),fun(option('?1967467),option('?1967469)))) f:fun('?1967467,option('?1967469))) #NONE:option('?1967469)))))
      #|Ssrfun.omap =  |- (#forall:fun(fun(fun('?1967482,'?1967480),bool),bool) (\f:fun('?1967482,'?1967480). ((#=:fun(fun(option('?1967482),option('?1967480)),fun(fun(option('?1967482),option('?1967480)),bool)) (#omap:fun(fun('?1967482,'?1967480),fun(option('?1967482),option('?1967480))) f:fun('?1967482,'?1967480))) (#obind:fun(fun('?1967482,option('?1967480)),fun(option('?1967482),option('?1967480))) (\x:'?1967482. (#SOME:fun('?1967480,option('?1967480)) (f:fun('?1967482,'?1967480) x:'?1967482)))))))
      #|Ssrfun.pcomp =  |- (#forall:fun(fun(fun('?1967492,option('?1967493)),bool),bool) (\f:fun('?1967492,option('?1967493)). (#forall:fun(fun(fun('?1967494,option('?1967492)),bool),bool) (\g:fun('?1967494,option('?1967492)). (#forall:fun(fun('?1967494,bool),bool) (\x:'?1967494. ((#=:fun(option('?1967493),fun(option('?1967493),bool)) (((#pcomp:fun(fun('?1967492,option('?1967493)),fun(fun('?1967494,option('?1967492)),fun('?1967494,option('?1967493)))) f:fun('?1967492,option('?1967493))) g:fun('?1967494,option('?1967492))) x:'?1967494)) ((#obind:fun(fun('?1967492,option('?1967493)),fun(option('?1967492),option('?1967493))) f:fun('?1967492,option('?1967493))) (g:fun('?1967494,option('?1967492)) x:'?1967494)))))))))
      #|Ssrfun.odflt_alt =  |- (#forall:fun(fun('?1967516,bool),bool) (\x:'?1967516. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?1967516,bool),bool) (\y:'?1967516. ((#=:fun('?1967516,fun('?1967516,bool)) ((#odflt:fun('?1967516,fun(option('?1967516),'?1967516)) x:'?1967516) (#SOME:fun('?1967516,option('?1967516)) y:'?1967516))) y:'?1967516)))) ((#=:fun('?1967516,fun('?1967516,bool)) ((#odflt:fun('?1967516,fun(option('?1967516),'?1967516)) x:'?1967516) #NONE:option('?1967516))) x:'?1967516))))
      #|Ssrfun.obind_alt =  |- (#forall:fun(fun(fun('?1967542,option('?1967528)),bool),bool) (\f:fun('?1967542,option('?1967528)). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(option('?1967528),fun(option('?1967528),bool)) ((#obind:fun(fun('?1967542,option('?1967528)),fun(option('?1967542),option('?1967528))) f:fun('?1967542,option('?1967528))) #NONE:option('?1967542))) #NONE:option('?1967528))) (#forall:fun(fun('?1967542,bool),bool) (\x:'?1967542. ((#=:fun(option('?1967528),fun(option('?1967528),bool)) ((#obind:fun(fun('?1967542,option('?1967528)),fun(option('?1967542),option('?1967528))) f:fun('?1967542,option('?1967528))) (#SOME:fun('?1967542,option('?1967542)) x:'?1967542))) (f:fun('?1967542,option('?1967528)) x:'?1967542)))))))
      #|Ssrfun.omap_alt =  |- (#forall:fun(fun(fun('?1967570,'?1967568),bool),bool) (\f:fun('?1967570,'?1967568). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(option('?1967568),fun(option('?1967568),bool)) ((#omap:fun(fun('?1967570,'?1967568),fun(option('?1967570),option('?1967568))) f:fun('?1967570,'?1967568)) #NONE:option('?1967570))) #NONE:option('?1967568))) (#forall:fun(fun('?1967570,bool),bool) (\x:'?1967570. ((#=:fun(option('?1967568),fun(option('?1967568),bool)) ((#omap:fun(fun('?1967570,'?1967568),fun(option('?1967570),option('?1967568))) f:fun('?1967570,'?1967568)) (#SOME:fun('?1967570,option('?1967570)) x:'?1967570))) (#SOME:fun('?1967568,option('?1967568)) (f:fun('?1967570,'?1967568) x:'?1967570))))))))
      #|Ssrfun.eq_sym =  |- (#forall:fun(fun('?1967577,bool),bool) (\x:'?1967577. (#forall:fun(fun('?1967577,bool),bool) (\y:'?1967577. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967577,fun('?1967577,bool)) x:'?1967577) y:'?1967577)) ((#=:fun('?1967577,fun('?1967577,bool)) y:'?1967577) x:'?1967577))))))
      #|Ssrfun.eq_trans =  |- (#forall:fun(fun('?1967591,bool),bool) (\x:'?1967591. (#forall:fun(fun('?1967591,bool),bool) (\y:'?1967591. (#forall:fun(fun('?1967591,bool),bool) (\z:'?1967591. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967591,fun('?1967591,bool)) x:'?1967591) y:'?1967591)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967591,fun('?1967591,bool)) y:'?1967591) z:'?1967591)) ((#=:fun('?1967591,fun('?1967591,bool)) x:'?1967591) z:'?1967591)))))))))
      #|Ssrfun.f_equal =  |- (#forall:fun(fun(fun('?1967604,'?1967600),bool),bool) (\f:fun('?1967604,'?1967600). (#forall:fun(fun('?1967604,bool),bool) (\x:'?1967604. (#forall:fun(fun('?1967604,bool),bool) (\y:'?1967604. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967604,fun('?1967604,bool)) x:'?1967604) y:'?1967604)) ((#=:fun('?1967600,fun('?1967600,bool)) (f:fun('?1967604,'?1967600) x:'?1967604)) (f:fun('?1967604,'?1967600) y:'?1967604)))))))))
      #|Ssrfun.f_equal2 =  |- (#forall:fun(fun(fun('?1967622,fun('?1967621,'?1967616)),bool),bool) (\f:fun('?1967622,fun('?1967621,'?1967616)). (#forall:fun(fun('?1967622,bool),bool) (\x1:'?1967622. (#forall:fun(fun('?1967622,bool),bool) (\y1:'?1967622. (#forall:fun(fun('?1967621,bool),bool) (\x2:'?1967621. (#forall:fun(fun('?1967621,bool),bool) (\y2:'?1967621. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967622,fun('?1967622,bool)) x1:'?1967622) y1:'?1967622)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967621,fun('?1967621,bool)) x2:'?1967621) y2:'?1967621)) ((#=:fun('?1967616,fun('?1967616,bool)) ((f:fun('?1967622,fun('?1967621,'?1967616)) x1:'?1967622) x2:'?1967621)) ((f:fun('?1967622,fun('?1967621,'?1967616)) y1:'?1967622) y2:'?1967621))))))))))))))
      #|Ssrfun.erefl =  |- (#forall:fun(fun('?1967577,bool),bool) (\x:'?1967577. (#forall:fun(fun('?1967577,bool),bool) (\y:'?1967577. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967577,fun('?1967577,bool)) x:'?1967577) y:'?1967577)) ((#=:fun('?1967577,fun('?1967577,bool)) y:'?1967577) x:'?1967577))))))
      #|Ssrfun.esym =  |- (#forall:fun(fun('?1967577,bool),bool) (\x:'?1967577. (#forall:fun(fun('?1967577,bool),bool) (\y:'?1967577. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967577,fun('?1967577,bool)) x:'?1967577) y:'?1967577)) ((#=:fun('?1967577,fun('?1967577,bool)) y:'?1967577) x:'?1967577))))))
      #|Ssrfun.etrans =  |- (#forall:fun(fun('?1967591,bool),bool) (\x:'?1967591. (#forall:fun(fun('?1967591,bool),bool) (\y:'?1967591. (#forall:fun(fun('?1967591,bool),bool) (\z:'?1967591. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967591,fun('?1967591,bool)) x:'?1967591) y:'?1967591)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967591,fun('?1967591,bool)) y:'?1967591) z:'?1967591)) ((#=:fun('?1967591,fun('?1967591,bool)) x:'?1967591) z:'?1967591)))))))))
      #|Ssrfun.congr1 =  |- (#forall:fun(fun(fun('?1967604,'?1967600),bool),bool) (\f:fun('?1967604,'?1967600). (#forall:fun(fun('?1967604,bool),bool) (\x:'?1967604. (#forall:fun(fun('?1967604,bool),bool) (\y:'?1967604. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967604,fun('?1967604,bool)) x:'?1967604) y:'?1967604)) ((#=:fun('?1967600,fun('?1967600,bool)) (f:fun('?1967604,'?1967600) x:'?1967604)) (f:fun('?1967604,'?1967600) y:'?1967604)))))))))
      #|Ssrfun.congr2 =  |- (#forall:fun(fun(fun('?1967622,fun('?1967621,'?1967616)),bool),bool) (\f:fun('?1967622,fun('?1967621,'?1967616)). (#forall:fun(fun('?1967622,bool),bool) (\x1:'?1967622. (#forall:fun(fun('?1967622,bool),bool) (\y1:'?1967622. (#forall:fun(fun('?1967621,bool),bool) (\x2:'?1967621. (#forall:fun(fun('?1967621,bool),bool) (\y2:'?1967621. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967622,fun('?1967622,bool)) x1:'?1967622) y1:'?1967622)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967621,fun('?1967621,bool)) x2:'?1967621) y2:'?1967621)) ((#=:fun('?1967616,fun('?1967616,bool)) ((f:fun('?1967622,fun('?1967621,'?1967616)) x1:'?1967622) x2:'?1967621)) ((f:fun('?1967622,fun('?1967621,'?1967616)) y1:'?1967622) y2:'?1967621))))))))))))))
      #|Ssrfun.eq_ext =  |- (#forall:fun(fun(fun('?1967634,'?1967630),bool),bool) (\f:fun('?1967634,'?1967630). (#forall:fun(fun(fun('?1967634,'?1967630),bool),bool) (\g:fun('?1967634,'?1967630). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('?1967634,bool),bool) (\x:'?1967634. ((#=:fun('?1967630,fun('?1967630,bool)) (f:fun('?1967634,'?1967630) x:'?1967634)) (g:fun('?1967634,'?1967630) x:'?1967634))))) ((#=:fun(fun('?1967634,'?1967630),fun(fun('?1967634,'?1967630),bool)) f:fun('?1967634,'?1967630)) g:fun('?1967634,'?1967630)))))))
      #|Ssrfun.injective =  |- (#forall:fun(fun(fun('?1967657,'?1967652),bool),bool) (\f:fun('?1967657,'?1967652). ((#=:fun(bool,fun(bool,bool)) (#injective:fun(fun('?1967657,'?1967652),bool) f:fun('?1967657,'?1967652))) (#forall:fun(fun('?1967657,bool),bool) (\x1:'?1967657. (#forall:fun(fun('?1967657,bool),bool) (\x2:'?1967657. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1967652,fun('?1967652,bool)) (f:fun('?1967657,'?1967652) x1:'?1967657)) (f:fun('?1967657,'?1967652) x2:'?1967657))) ((#=:fun('?1967657,fun('?1967657,bool)) x1:'?1967657) x2:'?1967657)))))))))
      #|Ssrfun.cancel =  |- (#forall:fun(fun(fun('?1967672,'?1967669),bool),bool) (\g:fun('?1967672,'?1967669). (#forall:fun(fun(fun('?1967669,'?1967672),bool),bool) (\f:fun('?1967669,'?1967672). ((#=:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('?1967669,'?1967672),fun(fun('?1967672,'?1967669),bool)) f:fun('?1967669,'?1967672)) g:fun('?1967672,'?1967669))) (#forall:fun(fun('?1967669,bool),bool) (\x:'?1967669. ((#=:fun('?1967669,fun('?1967669,bool)) (g:fun('?1967672,'?1967669) (f:fun('?1967669,'?1967672) x:'?1967669))) x:'?1967669))))))))
      #|Ssrfun.pcancel =  |- (#forall:fun(fun(fun('?1967686,option('?1967688)),bool),bool) (\g:fun('?1967686,option('?1967688)). (#forall:fun(fun(fun('?1967688,'?1967686),bool),bool) (\f:fun('?1967688,'?1967686). ((#=:fun(bool,fun(bool,bool)) ((#pcancel:fun(fun('?1967688,'?1967686),fun(fun('?1967686,option('?1967688)),bool)) f:fun('?1967688,'?1967686)) g:fun('?1967686,option('?1967688)))) (#forall:fun(fun('?1967688,bool),bool) (\x:'?1967688. ((#=:fun(option('?1967688),fun(option('?1967688),bool)) (g:fun('?1967686,option('?1967688)) (f:fun('?1967688,'?1967686) x:'?1967688))) (#SOME:fun('?1967688,option('?1967688)) x:'?1967688)))))))))
      #|Ssrfun.ocancel =  |- (#forall:fun(fun(fun('?1967705,'?1967707),bool),bool) (\h:fun('?1967705,'?1967707). (#forall:fun(fun(fun('?1967707,option('?1967705)),bool),bool) (\g:fun('?1967707,option('?1967705)). ((#=:fun(bool,fun(bool,bool)) ((#ocancel:fun(fun('?1967707,option('?1967705)),fun(fun('?1967705,'?1967707),bool)) g:fun('?1967707,option('?1967705))) h:fun('?1967705,'?1967707))) (#forall:fun(fun('?1967707,bool),bool) (\x:'?1967707. ((#=:fun('?1967707,fun('?1967707,bool)) (((#oapp:fun(fun('?1967705,'?1967707),fun('?1967707,fun(option('?1967705),'?1967707))) h:fun('?1967705,'?1967707)) x:'?1967707) (g:fun('?1967707,option('?1967705)) x:'?1967707))) x:'?1967707))))))))
      #|Ssrfun.can_pcan =  |- (#forall:fun(fun(fun('A,'R),bool),bool) (\f:fun('A,'R). (#forall:fun(fun(fun('R,'A),bool),bool) (\g:fun('R,'A). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('A,'R),fun(fun('R,'A),bool)) f:fun('A,'R)) g:fun('R,'A))) ((#pcancel:fun(fun('A,'R),fun(fun('R,option('A)),bool)) f:fun('A,'R)) (\y:'R. (#SOME:fun('A,option('A)) (g:fun('R,'A) y:'R)))))))))
      #|Ssrfun.pcan_inj =  |- (#forall:fun(fun(fun('A,'R),bool),bool) (\f:fun('A,'R). (#forall:fun(fun(fun('R,option('A)),bool),bool) (\g:fun('R,option('A)). ((#==>:fun(bool,fun(bool,bool)) ((#pcancel:fun(fun('A,'R),fun(fun('R,option('A)),bool)) f:fun('A,'R)) g:fun('R,option('A)))) (#injective:fun(fun('A,'R),bool) f:fun('A,'R)))))))
      #|Ssrfun.can_inj =  |- (#forall:fun(fun(fun('A,'R),bool),bool) (\f:fun('A,'R). (#forall:fun(fun(fun('R,'A),bool),bool) (\g:fun('R,'A). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('A,'R),fun(fun('R,'A),bool)) f:fun('A,'R)) g:fun('R,'A))) (#injective:fun(fun('A,'R),bool) f:fun('A,'R)))))))
      #|Ssrfun.canLR =  |- (#forall:fun(fun(fun('A,'R),bool),bool) (\f:fun('A,'R). (#forall:fun(fun(fun('R,'A),bool),bool) (\g:fun('R,'A). (#forall:fun(fun('R,bool),bool) (\x:'R. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('A,'R),fun(fun('R,'A),bool)) f:fun('A,'R)) g:fun('R,'A))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('R,fun('R,bool)) x:'R) (f:fun('A,'R) y:'A))) ((#=:fun('A,fun('A,bool)) (g:fun('R,'A) x:'R)) y:'A)))))))))))
      #|Ssrfun.canRL =  |- (#forall:fun(fun(fun('A,'R),bool),bool) (\f:fun('A,'R). (#forall:fun(fun(fun('R,'A),bool),bool) (\g:fun('R,'A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('R,bool),bool) (\y:'R. ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('A,'R),fun(fun('R,'A),bool)) f:fun('A,'R)) g:fun('R,'A))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('R,fun('R,bool)) (f:fun('A,'R) x:'A)) y:'R)) ((#=:fun('A,fun('A,bool)) x:'A) (g:fun('R,'A) y:'R))))))))))))
      #|Ssrfun.some_inj =  |- (#injective:fun(fun('?1967782,option('?1967782)),bool) #SOME:fun('?1967782,option('?1967782)))
      #|Ssrfun.inj_id =  |- (#injective:fun(fun('?1967787,'?1967787),bool) #I:fun('?1967787,'?1967787))
      #|Ssrfun.inj_can_sym =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f':fun('A,'B))) ((#==>:fun(bool,fun(bool,bool)) (#injective:fun(fun('A,'B),bool) f':fun('A,'B))) ((#cancel:fun(fun('A,'B),fun(fun('B,'A),bool)) f':fun('A,'B)) f:fun('B,'A))))))))
      #|Ssrfun.inj_comp =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('C,'B),bool),bool) (\h:fun('C,'B). ((#==>:fun(bool,fun(bool,bool)) (#injective:fun(fun('B,'A),bool) f:fun('B,'A))) ((#==>:fun(bool,fun(bool,bool)) (#injective:fun(fun('C,'B),bool) h:fun('C,'B))) (#injective:fun(fun('C,'A),bool) ((#o:fun(fun('B,'A),fun(fun('C,'B),fun('C,'A))) f:fun('B,'A)) h:fun('C,'B)))))))))
      #|Ssrfun.can_comp =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('C,'B),bool),bool) (\h:fun('C,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\h':fun('B,'C). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f':fun('A,'B))) ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('C,'B),fun(fun('B,'C),bool)) h:fun('C,'B)) h':fun('B,'C))) ((#cancel:fun(fun('C,'A),fun(fun('A,'C),bool)) ((#o:fun(fun('B,'A),fun(fun('C,'B),fun('C,'A))) f:fun('B,'A)) h:fun('C,'B))) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) h':fun('B,'C)) f':fun('A,'B)))))))))))))
      #|Ssrfun.pcan_pcomp =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('C,'B),bool),bool) (\h:fun('C,'B). (#forall:fun(fun(fun('A,option('B)),bool),bool) (\f':fun('A,option('B)). (#forall:fun(fun(fun('B,option('C)),bool),bool) (\h':fun('B,option('C)). ((#==>:fun(bool,fun(bool,bool)) ((#pcancel:fun(fun('B,'A),fun(fun('A,option('B)),bool)) f:fun('B,'A)) f':fun('A,option('B)))) ((#==>:fun(bool,fun(bool,bool)) ((#pcancel:fun(fun('C,'B),fun(fun('B,option('C)),bool)) h:fun('C,'B)) h':fun('B,option('C)))) ((#pcancel:fun(fun('C,'A),fun(fun('A,option('C)),bool)) ((#o:fun(fun('B,'A),fun(fun('C,'B),fun('C,'A))) f:fun('B,'A)) h:fun('C,'B))) ((#pcomp:fun(fun('B,option('C)),fun(fun('A,option('B)),fun('A,option('C)))) h':fun('B,option('C))) f':fun('A,option('B))))))))))))))
      #|Ssrfun.eq_inj =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) (#injective:fun(fun('B,'A),bool) f:fun('B,'A))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#=:fun('A,fun('A,bool)) (f:fun('B,'A) x:'B)) (g:fun('B,'A) x:'B))))) (#injective:fun(fun('B,'A),bool) g:fun('B,'A))))))))
      #|Ssrfun.eq_can =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g':fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f':fun('A,'B))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#=:fun('A,fun('A,bool)) (f:fun('B,'A) x:'B)) (g:fun('B,'A) x:'B))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f':fun('A,'B) x:'A)) (g':fun('A,'B) x:'A))))) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) g:fun('B,'A)) g':fun('A,'B)))))))))))))
      #|Ssrfun.inj_can_eq =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f':fun('A,'B))) ((#==>:fun(bool,fun(bool,bool)) (#injective:fun(fun('A,'B),bool) f':fun('A,'B))) ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) g:fun('B,'A)) f':fun('A,'B))) ((#=:fun(fun('B,'A),fun(fun('B,'A),bool)) f:fun('B,'A)) g:fun('B,'A)))))))))))
      #|Ssrfun.bijective =  |- (#forall:fun(fun(fun('?1967964,'?1967963),bool),bool) (\f:fun('?1967964,'?1967963). ((#=:fun(bool,fun(bool,bool)) (#bijective:fun(fun('?1967964,'?1967963),bool) f:fun('?1967964,'?1967963))) (#?:fun(fun(fun('?1967963,'?1967964),bool),bool) (\g:fun('?1967963,'?1967964). ((#/\:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('?1967964,'?1967963),fun(fun('?1967963,'?1967964),bool)) f:fun('?1967964,'?1967963)) g:fun('?1967963,'?1967964))) ((#cancel:fun(fun('?1967963,'?1967964),fun(fun('?1967964,'?1967963),bool)) g:fun('?1967963,'?1967964)) f:fun('?1967964,'?1967963))))))))
      #|Ssrfun.bij_inj =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('B,'A),bool) f:fun('B,'A))) (#injective:fun(fun('B,'A),bool) f:fun('B,'A)))))
      #|Ssrfun.bij_can_sym =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('B,'A),bool) f:fun('B,'A))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('A,'B),fun(fun('B,'A),bool)) f':fun('A,'B)) f:fun('B,'A))) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f':fun('A,'B))))))))
      #|Ssrfun.bij_can_eq =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('B,'A),bool) f:fun('B,'A))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\f'':fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f':fun('A,'B))) ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('B,'A),fun(fun('A,'B),bool)) f:fun('B,'A)) f'':fun('A,'B))) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) f':fun('A,'B)) f'':fun('A,'B)))))))))))
      #|Ssrfun.eq_bij =  |- (#forall:fun(fun(fun('BB,'AA),bool),bool) (\f:fun('BB,'AA). ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('BB,'AA),bool) f:fun('BB,'AA))) (#forall:fun(fun(fun('BB,'AA),bool),bool) (\g:fun('BB,'AA). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('BB,bool),bool) (\x:'BB. ((#=:fun('AA,fun('AA,bool)) (f:fun('BB,'AA) x:'BB)) (g:fun('BB,'AA) x:'BB))))) (#bijective:fun(fun('BB,'AA),bool) g:fun('BB,'AA))))))))
      #|Ssrfun.bij_comp =  |- (#forall:fun(fun(fun('BB,'AA),bool),bool) (\f:fun('BB,'AA). (#forall:fun(fun(fun('CC,'BB),bool),bool) (\h:fun('CC,'BB). ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('BB,'AA),bool) f:fun('BB,'AA))) ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('CC,'BB),bool) h:fun('CC,'BB))) (#bijective:fun(fun('CC,'AA),bool) ((#o:fun(fun('BB,'AA),fun(fun('CC,'BB),fun('CC,'AA))) f:fun('BB,'AA)) h:fun('CC,'BB)))))))))
      #|Ssrfun.bij_can_bij =  |- (#forall:fun(fun(fun('BB,'AA),bool),bool) (\f:fun('BB,'AA). ((#==>:fun(bool,fun(bool,bool)) (#bijective:fun(fun('BB,'AA),bool) f:fun('BB,'AA))) (#forall:fun(fun(fun('AA,'BB),bool),bool) (\f':fun('AA,'BB). ((#==>:fun(bool,fun(bool,bool)) ((#cancel:fun(fun('BB,'AA),fun(fun('AA,'BB),bool)) f:fun('BB,'AA)) f':fun('AA,'BB))) (#bijective:fun(fun('AA,'BB),bool) f':fun('AA,'BB))))))))
      #|Ssrfun.involutive =  |- (#forall:fun(fun(fun('?1968079,'?1968079),bool),bool) (\f:fun('?1968079,'?1968079). ((#=:fun(bool,fun(bool,bool)) (#involutive:fun(fun('?1968079,'?1968079),bool) f:fun('?1968079,'?1968079))) ((#cancel:fun(fun('?1968079,'?1968079),fun(fun('?1968079,'?1968079),bool)) f:fun('?1968079,'?1968079)) f:fun('?1968079,'?1968079)))))
      #|Ssrfun.inv_inj =  |- (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). ((#==>:fun(bool,fun(bool,bool)) (#involutive:fun(fun('A,'A),bool) f:fun('A,'A))) (#injective:fun(fun('A,'A),bool) f:fun('A,'A)))))
      #|Ssrfun.inv_bij =  |- (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). ((#==>:fun(bool,fun(bool,bool)) (#involutive:fun(fun('A,'A),bool) f:fun('A,'A))) (#bijective:fun(fun('A,'A),bool) f:fun('A,'A)))))
      #|Ssrfun.left_inverse =  |- (#forall:fun(fun(fun(real,fun(real,'?1968103)),bool),bool) (\op:fun(real,fun(real,'?1968103)). (#forall:fun(fun('?1968103,bool),bool) (\e:'?1968103. ((#=:fun(bool,fun(bool,bool)) (((#left_inverse:fun('?1968103,fun(fun(real,real),fun(fun(real,fun(real,'?1968103)),bool))) e:'?1968103) #real_inv:fun(real,real)) op:fun(real,fun(real,'?1968103)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun('?1968103,fun('?1968103,bool)) ((op:fun(real,fun(real,'?1968103)) (#real_inv:fun(real,real) x:real)) x:real)) e:'?1968103))))))))
      #|Ssrfun.right_inverse =  |- (#forall:fun(fun(fun(real,fun(real,'?1968122)),bool),bool) (\op:fun(real,fun(real,'?1968122)). (#forall:fun(fun('?1968122,bool),bool) (\e:'?1968122. ((#=:fun(bool,fun(bool,bool)) (((#right_inverse:fun('?1968122,fun(fun(real,real),fun(fun(real,fun(real,'?1968122)),bool))) e:'?1968122) #real_inv:fun(real,real)) op:fun(real,fun(real,'?1968122)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun('?1968122,fun('?1968122,bool)) ((op:fun(real,fun(real,'?1968122)) x:real) (#real_inv:fun(real,real) x:real))) e:'?1968122))))))))
      #|Ssrfun.left_injective =  |- (#forall:fun(fun(fun('?1968144,fun('?1968143,'?1968141)),bool),bool) (\op:fun('?1968144,fun('?1968143,'?1968141)). ((#=:fun(bool,fun(bool,bool)) (#left_injective:fun(fun('?1968144,fun('?1968143,'?1968141)),bool) op:fun('?1968144,fun('?1968143,'?1968141)))) (#forall:fun(fun('?1968143,bool),bool) (\x:'?1968143. (#injective:fun(fun('?1968144,'?1968141),bool) (\y:'?1968144. ((op:fun('?1968144,fun('?1968143,'?1968141)) y:'?1968144) x:'?1968143))))))))
      #|Ssrfun.right_injective =  |- (#forall:fun(fun(fun('?1968157,fun('?1968155,'?1968156)),bool),bool) (\op:fun('?1968157,fun('?1968155,'?1968156)). ((#=:fun(bool,fun(bool,bool)) (#right_injective:fun(fun('?1968157,fun('?1968155,'?1968156)),bool) op:fun('?1968157,fun('?1968155,'?1968156)))) (#forall:fun(fun('?1968157,bool),bool) (\y:'?1968157. (#injective:fun(fun('?1968155,'?1968156),bool) (op:fun('?1968157,fun('?1968155,'?1968156)) y:'?1968157)))))))
      #|Ssrfun.right_id =  |- (#forall:fun(fun(fun('?1968168,fun('?1968171,'?1968168)),bool),bool) (\op:fun('?1968168,fun('?1968171,'?1968168)). (#forall:fun(fun('?1968171,bool),bool) (\e:'?1968171. ((#=:fun(bool,fun(bool,bool)) ((#right_id:fun('?1968171,fun(fun('?1968168,fun('?1968171,'?1968168)),bool)) e:'?1968171) op:fun('?1968168,fun('?1968171,'?1968168)))) (#forall:fun(fun('?1968168,bool),bool) (\x:'?1968168. ((#=:fun('?1968168,fun('?1968168,bool)) ((op:fun('?1968168,fun('?1968171,'?1968168)) x:'?1968168) e:'?1968171)) x:'?1968168))))))))
      #|Ssrfun.left_zero =  |- (#forall:fun(fun(fun('?1968183,fun('?1968186,'?1968183)),bool),bool) (\op:fun('?1968183,fun('?1968186,'?1968183)). (#forall:fun(fun('?1968183,bool),bool) (\z:'?1968183. ((#=:fun(bool,fun(bool,bool)) ((#left_zero:fun('?1968183,fun(fun('?1968183,fun('?1968186,'?1968183)),bool)) z:'?1968183) op:fun('?1968183,fun('?1968186,'?1968183)))) (#forall:fun(fun('?1968186,bool),bool) (\x:'?1968186. ((#=:fun('?1968183,fun('?1968183,bool)) ((op:fun('?1968183,fun('?1968186,'?1968183)) z:'?1968183) x:'?1968186)) z:'?1968183))))))))
      #|Ssrfun.right_commutative =  |- (#forall:fun(fun(fun('?1968215,fun('?1968214,'?1968215)),bool),bool) (\op:fun('?1968215,fun('?1968214,'?1968215)). ((#=:fun(bool,fun(bool,bool)) (#right_commutative:fun(fun('?1968215,fun('?1968214,'?1968215)),bool) op:fun('?1968215,fun('?1968214,'?1968215)))) (#forall:fun(fun('?1968215,bool),bool) (\x:'?1968215. (#forall:fun(fun('?1968214,bool),bool) (\y:'?1968214. (#forall:fun(fun('?1968214,bool),bool) (\z:'?1968214. ((#=:fun('?1968215,fun('?1968215,bool)) ((op:fun('?1968215,fun('?1968214,'?1968215)) ((op:fun('?1968215,fun('?1968214,'?1968215)) x:'?1968215) y:'?1968214)) z:'?1968214)) ((op:fun('?1968215,fun('?1968214,'?1968215)) ((op:fun('?1968215,fun('?1968214,'?1968215)) x:'?1968215) z:'?1968214)) y:'?1968214)))))))))))
      #|Ssrfun.left_distributive =  |- (#forall:fun(fun(fun('?1968241,fun('?1968241,'?1968241)),bool),bool) (\add:fun('?1968241,fun('?1968241,'?1968241)). (#forall:fun(fun(fun('?1968241,fun('?1968245,'?1968241)),bool),bool) (\op:fun('?1968241,fun('?1968245,'?1968241)). ((#=:fun(bool,fun(bool,bool)) ((#left_distributive:fun(fun('?1968241,fun('?1968245,'?1968241)),fun(fun('?1968241,fun('?1968241,'?1968241)),bool)) op:fun('?1968241,fun('?1968245,'?1968241))) add:fun('?1968241,fun('?1968241,'?1968241)))) (#forall:fun(fun('?1968241,bool),bool) (\x:'?1968241. (#forall:fun(fun('?1968241,bool),bool) (\y:'?1968241. (#forall:fun(fun('?1968245,bool),bool) (\z:'?1968245. ((#=:fun('?1968241,fun('?1968241,bool)) ((op:fun('?1968241,fun('?1968245,'?1968241)) ((add:fun('?1968241,fun('?1968241,'?1968241)) x:'?1968241) y:'?1968241)) z:'?1968245)) ((add:fun('?1968241,fun('?1968241,'?1968241)) ((op:fun('?1968241,fun('?1968245,'?1968241)) x:'?1968241) z:'?1968245)) ((op:fun('?1968241,fun('?1968245,'?1968241)) y:'?1968241) z:'?1968245))))))))))))))
      #|Ssrfun.right_loop =  |- (#forall:fun(fun(fun('?1968269,fun(real,'?1968269)),bool),bool) (\op:fun('?1968269,fun(real,'?1968269)). ((#=:fun(bool,fun(bool,bool)) ((#right_loop:fun(fun(real,real),fun(fun('?1968269,fun(real,'?1968269)),bool)) #real_inv:fun(real,real)) op:fun('?1968269,fun(real,'?1968269)))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#cancel:fun(fun('?1968269,'?1968269),fun(fun('?1968269,'?1968269),bool)) (\x:'?1968269. ((op:fun('?1968269,fun(real,'?1968269)) x:'?1968269) y:real))) (\x:'?1968269. ((op:fun('?1968269,fun(real,'?1968269)) x:'?1968269) (#real_inv:fun(real,real) y:real)))))))))
      #|Ssrfun.rev_right_loop =  |- (#forall:fun(fun(fun('?1968296,fun(real,'?1968296)),bool),bool) (\op:fun('?1968296,fun(real,'?1968296)). ((#=:fun(bool,fun(bool,bool)) ((#rev_right_loop:fun(fun(real,real),fun(fun('?1968296,fun(real,'?1968296)),bool)) #real_inv:fun(real,real)) op:fun('?1968296,fun(real,'?1968296)))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#cancel:fun(fun('?1968296,'?1968296),fun(fun('?1968296,'?1968296),bool)) (\x:'?1968296. ((op:fun('?1968296,fun(real,'?1968296)) x:'?1968296) (#real_inv:fun(real,real) y:real)))) (\x:'?1968296. ((op:fun('?1968296,fun(real,'?1968296)) x:'?1968296) y:real))))))))
      #|Ssrfun.left_id =  |- (#forall:fun(fun(fun('?1968311,fun('?1968307,'?1968307)),bool),bool) (\op:fun('?1968311,fun('?1968307,'?1968307)). (#forall:fun(fun('?1968311,bool),bool) (\e:'?1968311. ((#=:fun(bool,fun(bool,bool)) ((#left_id:fun('?1968311,fun(fun('?1968311,fun('?1968307,'?1968307)),bool)) e:'?1968311) op:fun('?1968311,fun('?1968307,'?1968307)))) (#forall:fun(fun('?1968307,bool),bool) (\x:'?1968307. ((#=:fun('?1968307,fun('?1968307,bool)) ((op:fun('?1968311,fun('?1968307,'?1968307)) e:'?1968311) x:'?1968307)) x:'?1968307))))))))
      #|Ssrfun.right_zero =  |- (#forall:fun(fun(fun('?1968326,fun('?1968322,'?1968322)),bool),bool) (\op:fun('?1968326,fun('?1968322,'?1968322)). (#forall:fun(fun('?1968322,bool),bool) (\z:'?1968322. ((#=:fun(bool,fun(bool,bool)) ((#right_zero:fun('?1968322,fun(fun('?1968326,fun('?1968322,'?1968322)),bool)) z:'?1968322) op:fun('?1968326,fun('?1968322,'?1968322)))) (#forall:fun(fun('?1968326,bool),bool) (\x:'?1968326. ((#=:fun('?1968322,fun('?1968322,bool)) ((op:fun('?1968326,fun('?1968322,'?1968322)) x:'?1968326) z:'?1968322)) z:'?1968322))))))))
      #|Ssrfun.left_commutative =  |- (#forall:fun(fun(fun('?1968354,fun('?1968353,'?1968353)),bool),bool) (\op:fun('?1968354,fun('?1968353,'?1968353)). ((#=:fun(bool,fun(bool,bool)) (#left_commutative:fun(fun('?1968354,fun('?1968353,'?1968353)),bool) op:fun('?1968354,fun('?1968353,'?1968353)))) (#forall:fun(fun('?1968354,bool),bool) (\x:'?1968354. (#forall:fun(fun('?1968354,bool),bool) (\y:'?1968354. (#forall:fun(fun('?1968353,bool),bool) (\z:'?1968353. ((#=:fun('?1968353,fun('?1968353,bool)) ((op:fun('?1968354,fun('?1968353,'?1968353)) x:'?1968354) ((op:fun('?1968354,fun('?1968353,'?1968353)) y:'?1968354) z:'?1968353))) ((op:fun('?1968354,fun('?1968353,'?1968353)) y:'?1968354) ((op:fun('?1968354,fun('?1968353,'?1968353)) x:'?1968354) z:'?1968353))))))))))))
      #|Ssrfun.right_distributive =  |- (#forall:fun(fun(fun('?1968380,fun('?1968380,'?1968380)),bool),bool) (\add:fun('?1968380,fun('?1968380,'?1968380)). (#forall:fun(fun(fun('?1968385,fun('?1968380,'?1968380)),bool),bool) (\op:fun('?1968385,fun('?1968380,'?1968380)). ((#=:fun(bool,fun(bool,bool)) ((#right_distributive:fun(fun('?1968385,fun('?1968380,'?1968380)),fun(fun('?1968380,fun('?1968380,'?1968380)),bool)) op:fun('?1968385,fun('?1968380,'?1968380))) add:fun('?1968380,fun('?1968380,'?1968380)))) (#forall:fun(fun('?1968385,bool),bool) (\x:'?1968385. (#forall:fun(fun('?1968380,bool),bool) (\y:'?1968380. (#forall:fun(fun('?1968380,bool),bool) (\z:'?1968380. ((#=:fun('?1968380,fun('?1968380,bool)) ((op:fun('?1968385,fun('?1968380,'?1968380)) x:'?1968385) ((add:fun('?1968380,fun('?1968380,'?1968380)) y:'?1968380) z:'?1968380))) ((add:fun('?1968380,fun('?1968380,'?1968380)) ((op:fun('?1968385,fun('?1968380,'?1968380)) x:'?1968385) y:'?1968380)) ((op:fun('?1968385,fun('?1968380,'?1968380)) x:'?1968385) z:'?1968380))))))))))))))
      #|Ssrfun.left_loop =  |- (#forall:fun(fun(fun(real,fun('?1968400,'?1968400)),bool),bool) (\op:fun(real,fun('?1968400,'?1968400)). ((#=:fun(bool,fun(bool,bool)) ((#left_loop:fun(fun(real,real),fun(fun(real,fun('?1968400,'?1968400)),bool)) #real_inv:fun(real,real)) op:fun(real,fun('?1968400,'?1968400)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#cancel:fun(fun('?1968400,'?1968400),fun(fun('?1968400,'?1968400),bool)) (op:fun(real,fun('?1968400,'?1968400)) x:real)) (op:fun(real,fun('?1968400,'?1968400)) (#real_inv:fun(real,real) x:real))))))))
      #|Ssrfun.rev_left_loop =  |- (#forall:fun(fun(fun(real,fun('?1968419,'?1968419)),bool),bool) (\op:fun(real,fun('?1968419,'?1968419)). ((#=:fun(bool,fun(bool,bool)) ((#rev_left_loop:fun(fun(real,real),fun(fun(real,fun('?1968419,'?1968419)),bool)) #real_inv:fun(real,real)) op:fun(real,fun('?1968419,'?1968419)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#cancel:fun(fun('?1968419,'?1968419),fun(fun('?1968419,'?1968419),bool)) (op:fun(real,fun('?1968419,'?1968419)) (#real_inv:fun(real,real) x:real))) (op:fun(real,fun('?1968419,'?1968419)) x:real)))))))
      #|Ssrfun.self_inverse =  |- (#forall:fun(fun(fun('?1968437,fun('?1968437,'?1968434)),bool),bool) (\op:fun('?1968437,fun('?1968437,'?1968434)). (#forall:fun(fun('?1968434,bool),bool) (\e:'?1968434. ((#=:fun(bool,fun(bool,bool)) ((#self_inverse:fun('?1968434,fun(fun('?1968437,fun('?1968437,'?1968434)),bool)) e:'?1968434) op:fun('?1968437,fun('?1968437,'?1968434)))) (#forall:fun(fun('?1968437,bool),bool) (\x:'?1968437. ((#=:fun('?1968434,fun('?1968434,bool)) ((op:fun('?1968437,fun('?1968437,'?1968434)) x:'?1968437) x:'?1968437)) e:'?1968434))))))))
      #|Ssrfun.commutative =  |- (#forall:fun(fun(fun('?1968458,fun('?1968458,'?1968452)),bool),bool) (\op:fun('?1968458,fun('?1968458,'?1968452)). ((#=:fun(bool,fun(bool,bool)) (#commutative:fun(fun('?1968458,fun('?1968458,'?1968452)),bool) op:fun('?1968458,fun('?1968458,'?1968452)))) (#forall:fun(fun('?1968458,bool),bool) (\x:'?1968458. (#forall:fun(fun('?1968458,bool),bool) (\y:'?1968458. ((#=:fun('?1968452,fun('?1968452,bool)) ((op:fun('?1968458,fun('?1968458,'?1968452)) x:'?1968458) y:'?1968458)) ((op:fun('?1968458,fun('?1968458,'?1968452)) y:'?1968458) x:'?1968458)))))))))
      #|Ssrfun.idempotent =  |- (#forall:fun(fun(fun('?1968468,fun('?1968468,'?1968468)),bool),bool) (\op:fun('?1968468,fun('?1968468,'?1968468)). ((#=:fun(bool,fun(bool,bool)) (#idempotent:fun(fun('?1968468,fun('?1968468,'?1968468)),bool) op:fun('?1968468,fun('?1968468,'?1968468)))) (#forall:fun(fun('?1968468,bool),bool) (\x:'?1968468. ((#=:fun('?1968468,fun('?1968468,bool)) ((op:fun('?1968468,fun('?1968468,'?1968468)) x:'?1968468) x:'?1968468)) x:'?1968468))))))
      #|Ssrfun.associative =  |- (#forall:fun(fun(fun('?1968500,fun('?1968500,'?1968500)),bool),bool) (\op:fun('?1968500,fun('?1968500,'?1968500)). ((#=:fun(bool,fun(bool,bool)) (#associative:fun(fun('?1968500,fun('?1968500,'?1968500)),bool) op:fun('?1968500,fun('?1968500,'?1968500)))) (#forall:fun(fun('?1968500,bool),bool) (\x:'?1968500. (#forall:fun(fun('?1968500,bool),bool) (\y:'?1968500. (#forall:fun(fun('?1968500,bool),bool) (\z:'?1968500. ((#=:fun('?1968500,fun('?1968500,bool)) ((op:fun('?1968500,fun('?1968500,'?1968500)) x:'?1968500) ((op:fun('?1968500,fun('?1968500,'?1968500)) y:'?1968500) z:'?1968500))) ((op:fun('?1968500,fun('?1968500,'?1968500)) ((op:fun('?1968500,fun('?1968500,'?1968500)) x:'?1968500) y:'?1968500)) z:'?1968500)))))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = associative idempotent commutative self_inverse rev_left_loop left_loop right_distributive left_commutative right_zero left_id rev_right_loop right_loop left_distributive right_commutative left_zero right_id right_injective left_injective right_inverse left_inverse involutive bijective ocancel pcancel cancel injective pcomp omap obind odflt oapp ssreflect_eq error_mul_f1 error_mul_f2 list_sum2 list_sum ddmatan dmatan matan halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1100
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1968501
      #|counter_genvar = _3718946:bool
      #|
    ),
  )
}
