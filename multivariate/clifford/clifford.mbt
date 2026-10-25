// Translated from upstream Multivariate/clifford.ml; edit this file directly.

///|
/// Multivariate/clifford.ml:10
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// CARD_UNION_LEMMA
fn step_2() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@sets.card_union()]))
  card_union_lemma_c.set(@tactics.prove(@term_syntax.parse_term("FINITE((s : (_) -> Bool)) && FINITE((t : (_) -> Bool)) && FINITE((u : (_) -> Bool)) && FINITE((v : (_) -> Bool)) && INTER(s, t) == {} && INTER(u, v) == {} && UNION(s, t) == UNION(u, v) → CARD(s) + CARD(t) == CARD(u) + CARD(v)"), t1))
}

///|
let card_union_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_UNION_LEMMA")

///|
/// `CARD_UNION_LEMMA`
pub fn card_union_lemma() -> @kernel.Thm {
  card_union_lemma_c.get()
}

///|
/// CARD_DIFF_INTER
fn step_3() -> Unit raise {
  let t5 = @sets.set_tac(@list.List([]))
  let t4 = @simp.asm_rewrite_tac(@list.List([]))
  let t3 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t2 = @tactics.conv_tac(@equal.sym_conv)
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2), t3), t4), t5)
  card_diff_inter_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) → CARD(s) == CARD(DIFF(s, t)) + CARD(INTER(s, t))"), t6))
}

///|
let card_diff_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_DIFF_INTER")

///|
/// `CARD_DIFF_INTER`
pub fn card_diff_inter() -> @kernel.Thm {
  card_diff_inter_c.get()
}

///|
/// CARD_ADD_SYMDIFF_INTER
fn step_4() -> Unit raise {
  let t17 = @sets.set_tac(@list.List([]))
  let t16 = @simp.asm_simp_tac(@list.List([@sets.finite_diff()]))
  let t15 = @tactics.match_mp_tac(@sets.card_union())
  let t14 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(c : Num) == (a : Num) + (b : Num) → a + (x : Num) + (b + x) == c + 2 * x")))
  let t13 = @simp.rewrite_tac(@list.List([@sets.inter_aci()]))
  let t10 = @kernel.assume_rule(@term_syntax.parse_term("FINITE((t : (A) -> Bool))"))
  let t11 = @drule.match_mp(card_diff_inter())(t10)
  let t12 = @tactics.subst1_tac(@bool.spec(@term_syntax.parse_term("(s : (A) -> Bool)"), t11))
  let t7 = @kernel.assume_rule(@term_syntax.parse_term("FINITE((s : (A) -> Bool))"))
  let t8 = @drule.match_mp(card_diff_inter())(t7)
  let t9 = @tactics.subst1_tac(@bool.spec(@term_syntax.parse_term("(t : (A) -> Bool)"), t8))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t9), t12), t13), t14), t15), t16), t17)
  card_add_symdiff_inter_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) → CARD(s) + CARD(t) == CARD(UNION(DIFF(s, t), DIFF(t, s))) + 2 * CARD(INTER(s, t))"), t18))
}

///|
let card_add_symdiff_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_ADD_SYMDIFF_INTER")

///|
/// `CARD_ADD_SYMDIFF_INTER`
pub fn card_add_symdiff_inter() -> @kernel.Thm {
  card_add_symdiff_inter_c.get()
}

///|
/// SYMDIFF_PARITY_LEMMA
fn step_5() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()]))
  let t19 = @simp.simp_tac(@list.List([card_add_symdiff_inter()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.even_add())])), t19), t20)
  symdiff_parity_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, FINITE(s) && FINITE(t) && UNION(DIFF(s, t), DIFF(t, s)) == u → EVEN(CARD(u)) == (EVEN(CARD(s)) == EVEN(CARD(t)))"), t21))
}

///|
let symdiff_parity_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMDIFF_PARITY_LEMMA")

///|
/// `SYMDIFF_PARITY_LEMMA`
pub fn symdiff_parity_lemma() -> @kernel.Thm {
  symdiff_parity_lemma_c.get()
}

///|
/// FINITE_CART_SUBSET_LEMMA
fn step_6() -> Unit raise {
  let t25 = @simp.simp_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t24 = @simp.simp_tac(@list.List([@sets.subset(), @sets.finite_product(), @iterate.finite_numseg()]))
  let t23 = @tactics.exists_tac(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, op_dot_dot(1, (m : Num))) && IN(j, op_dot_dot(1, (n : Num)))}"))
  let t22 = @tactics.match_mp_tac(@sets.finite_subset())
  let t26 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t22), t23), t24), t25)
  finite_cart_subset_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num, Num) -> Bool, ∀ m : Num, ∀ n : Num, FINITE({((i : Num), (j : Num)) | IN(i, op_dot_dot(1, m)) && IN(j, op_dot_dot(1, n)) && P(i, j)})"), t26))
}

///|
let finite_cart_subset_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_CART_SUBSET_LEMMA")

///|
/// `FINITE_CART_SUBSET_LEMMA`
pub fn finite_cart_subset_lemma() -> @kernel.Thm {
  finite_cart_subset_lemma_c.get()
}

///|
/// multivector_tybij_th
fn step_7() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([@sets.empty_subset()]))
  multivector_tybij_th_c.set(@tactics.prove(@term_syntax.parse_term("∃ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"), t27))
}

///|
let multivector_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multivector_tybij_th")

///|
/// `multivector_tybij_th`
pub fn multivector_tybij_th() -> @kernel.Thm {
  multivector_tybij_th_c.get()
}

///|
/// multivector_tybij
fn step_8() -> Unit raise {
  multivector_tybij_c.set(@class.new_type_definition("multivector", ("mk_multivector", "dest_multivector"), multivector_tybij_th()))
}

///|
let multivector_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multivector_tybij")

///|
/// `multivector_tybij`
pub fn multivector_tybij() -> @kernel.Thm {
  multivector_tybij_c.get()
}

///|
/// MULTIVECTOR_IMAGE
fn step_9() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([multivector_tybij()]))
  let t29 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_image(), @sets.in_elim_thm()])), t28)
  multivector_image_c.set(@tactics.prove(@term_syntax.parse_term("(UNIV : (Multivector[N]) -> Bool) == (IMAGE : (((Num) -> Bool) -> Multivector[N], ((Num) -> Bool) -> Bool, Multivector[N]) -> Bool)((mk_multivector : ((Num) -> Bool) -> Multivector[N]), {(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))})"), t29))
}

///|
let multivector_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_IMAGE")

///|
/// `MULTIVECTOR_IMAGE`
pub fn multivector_image() -> @kernel.Thm {
  multivector_image_c.get()
}

///|
/// HAS_SIZE_MULTIVECTOR
fn step_10() -> Unit raise {
  let t32 = @meson.meson_tac(@list.List([multivector_tybij()]))
  let t31 = @simp.simp_tac(@list.List([@sets.has_size_powerset(), @iterate.has_size_numseg_1(), @sets.in_elim_thm()]))
  let t30 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([multivector_image()])), t30), t31), t32)
  has_size_multivector_c.set(@tactics.prove(@term_syntax.parse_term("(HAS_SIZE : ((Multivector[N]) -> Bool, Num) -> Bool)((UNIV : (Multivector[N]) -> Bool), EXP(2, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"), t33))
}

///|
let has_size_multivector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_MULTIVECTOR")

///|
/// `HAS_SIZE_MULTIVECTOR`
pub fn has_size_multivector() -> @kernel.Thm {
  has_size_multivector_c.get()
}

///|
/// FINITE_MULTIVECTOR
fn step_11() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([@sets.has_size(), has_size_multivector()]))
  finite_multivector_c.set(@tactics.prove(@term_syntax.parse_term("(FINITE : ((Multivector[N]) -> Bool) -> Bool)((UNIV : (Multivector[N]) -> Bool))"), t34))
}

///|
let finite_multivector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_MULTIVECTOR")

///|
/// `FINITE_MULTIVECTOR`
pub fn finite_multivector() -> @kernel.Thm {
  finite_multivector_c.get()
}

///|
/// DIMINDEX_MULTIVECTOR
fn step_12() -> Unit raise {
  let t35 = @meson.meson_tac(@list.List([@cart.dimindex_unique(), has_size_multivector()]))
  dimindex_multivector_c.set(@tactics.prove(@term_syntax.parse_term("(dimindex : ((Multivector[N]) -> Bool) -> Num)((UNIV : (Multivector[N]) -> Bool)) == EXP(2, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"), t35))
}

///|
let dimindex_multivector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_MULTIVECTOR")

///|
/// `DIMINDEX_MULTIVECTOR`
pub fn dimindex_multivector() -> @kernel.Thm {
  dimindex_multivector_c.get()
}

///|
/// DEST_MK_MULTIVECTOR
fn step_13() -> Unit raise {
  let t38 = @simp.asm_rewrite_tac(@list.List([]))
  let t37 = @simp.gen_rewrite_tac(fn(x36 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x36
  }, @list.List([@equal.gsym(multivector_tybij())]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t37), t38)
  dest_mk_multivector_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (dest_multivector : (Multivector[N], Num) -> Bool)((mk_multivector : ((Num) -> Bool) -> Multivector[N])(s)) == s"), t39))
}

///|
let dest_mk_multivector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_MK_MULTIVECTOR")

///|
/// `DEST_MK_MULTIVECTOR`
pub fn dest_mk_multivector() -> @kernel.Thm {
  dest_mk_multivector_c.get()
}

///|
/// FORALL_MULTIVECTOR
fn step_14() -> Unit raise {
  let t43 = @meson.asm_meson_tac(@list.List([]))
  let t42 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_image(), @pair.exists_pair_thm(), @sets.in_elim_thm()]))
  let t40 = @simp.rewrite_rule(@list.List([@sets.extension()]))(multivector_image())
  let t41 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(m : Multivector[N])"), t40))
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])), @tactics.disch_tac), @tactics.gen_tac), t41), t42), t43)
  forall_multivector_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (P : (Multivector[N]) -> Bool)((mk_multivector : ((Num) -> Bool) -> Multivector[N])(s))) == (∀ m : Multivector[N], P(m))"), t44))
}

///|
let forall_multivector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_MULTIVECTOR")

///|
/// `FORALL_MULTIVECTOR`
pub fn forall_multivector() -> @kernel.Thm {
  forall_multivector_c.get()
}

///|
/// setcode
fn step_15() -> Unit raise {
  setcode_c.set(@pair.new_definition(@term_syntax.parse_term("(setcode : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == 1 + binarysum(IMAGE(PRE, s))")))
}

///|
let setcode_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setcode")

///|
/// `setcode`
pub fn setcode() -> @kernel.Thm {
  setcode_c.get()
}

///|
/// codeset
fn step_16() -> Unit raise {
  codeset_c.set(@pair.new_definition(@term_syntax.parse_term("(codeset : (Num, Num) -> Bool)((n : Num)) == IMAGE(SUC, bitset(n - 1))")))
}

///|
let codeset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("codeset")

///|
/// `codeset`
pub fn codeset() -> @kernel.Thm {
  codeset_c.get()
}

///|
/// CODESET_SETCODE_BIJECTIONS
fn step_17() -> Unit raise {
  let t82 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → SUC(PRE(n)) == n"))]))
  let t81 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.extension(), @sets.in_image(), @iterate.in_numseg()]))
  let t80 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((s : (Num) -> Bool), op_dot_dot(1, (n : Num)))"))
  let t79 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_image(), @sets.finite_subset(), @iterate.finite_numseg(), @binary.bitset_binarysum()])), @tactics.all_tac])
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(SUC, IMAGE(PRE, (s : (Num) -> Bool)))"))
  let t77 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t75 = @simp.asm_rewrite_tac(@list.List([@sets.in_image(), @iterate.in_numseg()]))
  let t71 = @term_syntax.parse_term("(i : Num)")
  let t74 = @tactics.first_x_assum(fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s69 = @tactics.mp_tac(x68)
      fn(x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s69(x70)
      }
    })(((x72 : @kernel.Thm) => @bool.spec(t71, x72))(x73))
  })
  let t67 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t66 = @tactics.match_mp_tac(@binary.binarysum_bound())
  let t76 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → 1 <= 1 + x && 1 + x <= n"))), t66), t67), @tactics.disch_tac), t74), t75), @int.arith_tac), @tactics.all_tac])
  let t65 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @sets.subset()]))
  let t62 = @drule.match_mp(@sets.image_subset())
  let t59 = @term_syntax.parse_term("PRE")
  let t64 = @tactics.first_assum(fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s57 = @tactics.mp_tac(x56)
        fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s57(x58)
        }
      })(((x60 : @kernel.Thm) => @bool.ispec(t59, x60))(x61))
    })(t62(x63))
  })
  let t54 = @meson.meson_tac(@list.List([@binary.bitset_bound(), @binary.binarysum_bitset()]))
  let t51 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) && i <= (t : Num) → i - 1 < t")))
  let t53 = @tactics.disch_then(fn(x52 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s49 = @tactics.mp_tac(x48)
      fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s49(x50)
      }
    })(t51(x52))
  })
  let t47 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= SUC((n : Num)) && SUC(n) <= (k : Num)) == (n < k)"))]))
  let t46 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → (1 + (b : Num) == i) == (b == i - 1)"))]))
  let t55 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @iterate.in_numseg()])), t46), t47), t53), t54), @tactics.all_tac])
  let t45 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("IMAGE((x : _) => x, (s : (_) -> Bool)) == s"))]))
  let t83 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([codeset(), setcode(), @arith.add_sub2(), @equal.gsym(@sets.image_o()), @trivia.o_def(), @arith.pre()])), t45), @tactics.conj_tac), @tactics.gen_tac), t55), @tactics.disch_tac), t64), t65), @tactics.disch_tac), @tactics.conj_tac), t76), t77), t78), @tactics.conj_tac), t79), t80), t81), t82)
  codeset_setcode_bijections_c.set(@tactics.prove(@term_syntax.parse_term("(∀ i : Num, IN(i, op_dot_dot(1, EXP(2, (n : Num)))) → SUBSET(codeset(i), op_dot_dot(1, n)) && setcode(codeset(i)) == i) && (∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, n)) → IN(setcode(s), op_dot_dot(1, EXP(2, n))) && codeset(setcode(s)) == s)"), t83))
}

///|
let codeset_setcode_bijections_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CODESET_SETCODE_BIJECTIONS")

///|
/// `CODESET_SETCODE_BIJECTIONS`
pub fn codeset_setcode_bijections() -> @kernel.Thm {
  codeset_setcode_bijections_c.get()
}

///|
/// FORALL_SETCODE
fn step_18() -> Unit raise {
  let t84 = @meson.meson_tac(@list.List([codeset_setcode_bijections(), @sets.subset()]))
  forall_setcode_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (n : Num))) → (P : (Num) -> Bool)(setcode(s))) == (∀ i : Num, IN(i, op_dot_dot(1, EXP(2, n))) → P(i))"), t84))
}

///|
let forall_setcode_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_SETCODE")

///|
/// `FORALL_SETCODE`
pub fn forall_setcode() -> @kernel.Thm {
  forall_setcode_c.get()
}

///|
/// SETCODE_BOUNDS
fn step_19() -> Unit raise {
  let t85 = @meson.meson_tac(@list.List([codeset_setcode_bijections()]))
  setcode_bounds_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ n : Num, SUBSET(s, op_dot_dot(1, n)) → IN(setcode(s), op_dot_dot(1, EXP(2, n)))"), t85))
}

///|
let setcode_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETCODE_BOUNDS")

///|
/// `SETCODE_BOUNDS`
pub fn setcode_bounds() -> @kernel.Thm {
  setcode_bounds_c.get()
}

///|
/// Multivariate/clifford.ml:156
fn step_20() -> Unit raise {
  @printer.parse_as_infix("$$", (25L, "left"))
}

///|
/// sindex
fn step_21() -> Unit raise {
  sindex_c.set(@pair.new_definition(@term_syntax.parse_term("(op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)((x : Cart[Real, Multivector[N]]), (s : (Num) -> Bool)) == op_dollar(x, setcode(s))")))
}

///|
let sindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sindex")

///|
/// `sindex`
pub fn sindex() -> @kernel.Thm {
  sindex_c.get()
}

///|
/// Multivariate/clifford.ml:161
fn step_22() -> Unit raise {
  @printer.parse_as_binder("lambdas")
}

///|
/// lambdas
fn step_23() -> Unit raise {
  lambdas_c.set(@pair.new_definition(@term_syntax.parse_term("(lambdas : (((Num) -> Bool) -> Real) -> Cart[Real, Multivector[N]])((g : ((Num) -> Bool) -> Real)) == lambda((i : Num) => g(codeset(i)))")))
}

///|
let lambdas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lambdas")

///|
/// `lambdas`
pub fn lambdas() -> @kernel.Thm {
  lambdas_c.get()
}

///|
/// MULTIVECTOR_EQ
fn step_24() -> Unit raise {
  let t86 = @simp.simp_tac(@list.List([@cart.cart_eq(), sindex(), forall_setcode(), @equal.gsym(@iterate.in_numseg()), dimindex_multivector()]))
  multivector_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], (x == y) == (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x, s) == (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(y, s))"), t86))
}

///|
let multivector_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_EQ")

///|
/// `MULTIVECTOR_EQ`
pub fn multivector_eq() -> @kernel.Thm {
  multivector_eq_c.get()
}

///|
/// MULTIVECTOR_BETA
fn step_25() -> Unit raise {
  let t87 = @meson.meson_tac(@list.List([codeset_setcode_bijections()]))
  let t88 = @tactics.then_tac(@simp.simp_tac(@list.List([sindex(), lambdas(), @cart.lambda_beta(), setcode_bounds(), dimindex_multivector(), @equal.gsym(@iterate.in_numseg())])), t87)
  multivector_beta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)((lambdas : (((Num) -> Bool) -> Real) -> Cart[Real, Multivector[N]])((g : ((Num) -> Bool) -> Real)), s) == g(s)"), t88))
}

///|
let multivector_beta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_BETA")

///|
/// `MULTIVECTOR_BETA`
pub fn multivector_beta() -> @kernel.Thm {
  multivector_beta_c.get()
}

///|
/// MULTIVECTOR_UNIQUE
fn step_26() -> Unit raise {
  let t89 = @meson.meson_tac(@list.List([]))
  let t90 = @tactics.then_tac(@simp.simp_tac(@list.List([multivector_eq(), multivector_beta()])), t89)
  multivector_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Cart[Real, Multivector[N]], ∀ g : ((Num) -> Bool) -> Real, (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(m, s) == g(s)) → (lambdas : (((Num) -> Bool) -> Real) -> Cart[Real, Multivector[N]])(g) == m"), t90))
}

///|
let multivector_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_UNIQUE")

///|
/// `MULTIVECTOR_UNIQUE`
pub fn multivector_unique() -> @kernel.Thm {
  multivector_unique_c.get()
}

///|
/// MULTIVECTOR_ETA
fn step_27() -> Unit raise {
  let t91 = @simp.simp_tac(@list.List([multivector_eq(), multivector_beta()]))
  multivector_eta_c.set(@tactics.prove(@term_syntax.parse_term("lambdas((s : (Num) -> Bool) => op_dollar_dollar((m : Cart[Real, Multivector[_]]), s)) == m"), t91))
}

///|
let multivector_eta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_ETA")

///|
/// `MULTIVECTOR_ETA`
pub fn multivector_eta() -> @kernel.Thm {
  multivector_eta_c.get()
}

///|
/// MULTIVECTOR_ADD_COMPONENT
fn step_28() -> Unit raise {
  let t92 = @simp.simp_tac(@list.List([sindex(), setcode_bounds(), dimindex_multivector(), @equal.gsym(@iterate.in_numseg()), @vectors.vector_add_component()]))
  multivector_add_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x + y, s) == (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x, s) + (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(y, s)"), t92))
}

///|
let multivector_add_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_ADD_COMPONENT")

///|
/// `MULTIVECTOR_ADD_COMPONENT`
pub fn multivector_add_component() -> @kernel.Thm {
  multivector_add_component_c.get()
}

///|
/// MULTIVECTOR_MUL_COMPONENT
fn step_29() -> Unit raise {
  let t93 = @simp.simp_tac(@list.List([sindex(), setcode_bounds(), dimindex_multivector(), @equal.gsym(@iterate.in_numseg()), @vectors.vector_mul_component()]))
  multivector_mul_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, Multivector[N]], ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)((op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(c, x), s) == c * (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x, s)"), t93))
}

///|
let multivector_mul_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_MUL_COMPONENT")

///|
/// `MULTIVECTOR_MUL_COMPONENT`
pub fn multivector_mul_component() -> @kernel.Thm {
  multivector_mul_component_c.get()
}

///|
/// MULTIVECTOR_VEC_COMPONENT
fn step_30() -> Unit raise {
  let t94 = @simp.simp_tac(@list.List([sindex(), setcode_bounds(), dimindex_multivector(), @equal.gsym(@iterate.in_numseg()), @vectors.vec_component()]))
  multivector_vec_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)((vec : (Num) -> Cart[Real, Multivector[N]])(k), s) == real_of_num(k)"), t94))
}

///|
let multivector_vec_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_VEC_COMPONENT")

///|
/// `MULTIVECTOR_VEC_COMPONENT`
pub fn multivector_vec_component() -> @kernel.Thm {
  multivector_vec_component_c.get()
}

///|
/// MULTIVECTOR_VSUM_COMPONENT
fn step_31() -> Unit raise {
  let t95 = @simp.simp_tac(@list.List([@vectors.vsum(), sindex(), @cart.lambda_beta(), setcode_bounds(), @equal.gsym(@iterate.in_numseg()), dimindex_multivector()]))
  multivector_vsum_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, Multivector[N]], ∀ t : (A) -> Bool, ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)((vsum : ((A) -> Bool, (A) -> Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(t, f), s) == (sum : ((A) -> Bool, (A) -> Real) -> Real)(t, (x : A) => (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(f(x), s))"), t95))
}

///|
let multivector_vsum_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_VSUM_COMPONENT")

///|
/// `MULTIVECTOR_VSUM_COMPONENT`
pub fn multivector_vsum_component() -> @kernel.Thm {
  multivector_vsum_component_c.get()
}

///|
/// MULTIVECTOR_VSUM
fn step_32() -> Unit raise {
  let t96 = @simp.simp_tac(@list.List([multivector_eq(), multivector_beta(), multivector_vsum_component()]))
  multivector_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (_) -> Bool, ∀ f : (_) -> Cart[Real, Multivector[_]], vsum(t, f) == lambdas((s : (Num) -> Bool) => sum(t, (x : _) => op_dollar_dollar(f(x), s)))"), t96))
}

///|
let multivector_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_VSUM")

///|
/// `MULTIVECTOR_VSUM`
pub fn multivector_vsum() -> @kernel.Thm {
  multivector_vsum_c.get()
}

///|
/// mbasis
fn step_33() -> Unit raise {
  mbasis_c.set(@pair.new_definition(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])((i : (Num) -> Bool)) == lambdas((s : (Num) -> Bool) => if i == s { real_of_num(1) } else { real_of_num(0) })")))
}

///|
let mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mbasis")

///|
/// `mbasis`
pub fn mbasis() -> @kernel.Thm {
  mbasis_c.get()
}

///|
/// MBASIS_COMPONENT
fn step_34() -> Unit raise {
  let t97 = @meson.meson_tac(@list.List([]))
  let t98 = @tactics.then_tac(@simp.simp_tac(@list.List([mbasis(), @sets.in_elim_thm(), multivector_beta()])), t97)
  mbasis_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(t), s) == (if s == t { real_of_num(1) } else { real_of_num(0) })"), t98))
}

///|
let mbasis_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MBASIS_COMPONENT")

///|
/// `MBASIS_COMPONENT`
pub fn mbasis_component() -> @kernel.Thm {
  mbasis_component_c.get()
}

///|
/// MBASIS_EQ_0
fn step_35() -> Unit raise {
  let t99 = @meson.meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(1) == real_of_num(0))"))]))
  let t100 = @tactics.then_tac(@simp.simp_tac(@list.List([multivector_eq(), mbasis_component(), multivector_vec_component()])), t99)
  mbasis_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s) == (vec : (Num) -> Cart[Real, Multivector[N]])(0)) == !SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"), t100))
}

///|
let mbasis_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MBASIS_EQ_0")

///|
/// `MBASIS_EQ_0`
pub fn mbasis_eq_0() -> @kernel.Thm {
  mbasis_eq_0_c.get()
}

///|
/// MBASIS_NONZERO
fn step_36() -> Unit raise {
  let t101 = @simp.rewrite_tac(@list.List([mbasis_eq_0()]))
  mbasis_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → !((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s) == (vec : (Num) -> Cart[Real, Multivector[N]])(0))"), t101))
}

///|
let mbasis_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MBASIS_NONZERO")

///|
/// `MBASIS_NONZERO`
pub fn mbasis_nonzero() -> @kernel.Thm {
  mbasis_nonzero_c.get()
}

///|
/// MBASIS_EXPANSION
fn step_37() -> Unit raise {
  let t111 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (if (p : Bool) { real_of_num(1) } else { real_of_num(0) }) == (if p { x } else { real_of_num(0) })")), @iterate.sum_delta(), @sets.in_elim_thm()]))
  let t110 = @simp.gen_rewrite_tac(fn(x109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x103 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s104 = @equal.land_conv(x103)
      fn(x105 : @kernel.Term) -> @kernel.Thm raise {
        s104(x105)
      }
    })((fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s107 = @equal.once_depth_conv(x106)
      fn(x108 : @kernel.Term) -> @kernel.Thm raise {
        s107(x108)
      }
    })(x109))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t102 = @tactics.repeat_tac(@tactics.strip_tac)
  let t112 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([multivector_eq(), multivector_vsum_component(), multivector_mul_component(), mbasis_component()])), t102), t110), t111)
  mbasis_expansion_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}, (s : (Num) -> Bool) => (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x, s), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s))) == x"), t112))
}

///|
let mbasis_expansion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MBASIS_EXPANSION")

///|
/// `MBASIS_EXPANSION`
pub fn mbasis_expansion() -> @kernel.Thm {
  mbasis_expansion_c.get()
}

///|
/// SPAN_MBASIS
fn step_38() -> Unit raise {
  let t124 = @meson.asm_meson_tac(@list.List([]))
  let t123 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t122 = @tactics.match_mp_tac(@vectors.span_superset())
  let t121 = @tactics.match_mp_tac(@vectors.span_mul())
  let t120 = @tactics.repeat_tac(@tactics.strip_tac)
  let t119 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_powerset(), @sets.in_elim_thm()]))
  let t118 = @tactics.match_mp_tac(@vectors.span_vsum())
  let t117 = @simp.gen_rewrite_tac(fn(x114 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s115 = @equal.land_conv(x114)
    fn(x116 : @kernel.Term) -> @kernel.Thm raise {
      s115(x116)
    }
  }, @list.List([@equal.gsym(mbasis_expansion())]))
  let t113 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Multivector[N]])"))
  let t125 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ()])), t113), t117), t118), t119), t120), t121), t122), t123), t124)
  span_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("(span : ((Cart[Real, Multivector[N]]) -> Bool, Cart[Real, Multivector[N]]) -> Bool)({(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}) == (UNIV : (Cart[Real, Multivector[N]]) -> Bool)"), t125))
}

///|
let span_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SPAN_MBASIS")

///|
/// `SPAN_MBASIS`
pub fn span_mbasis() -> @kernel.Thm {
  span_mbasis_c.get()
}

///|
/// LINEAR_EQ_MBASIS
fn step_39() -> Unit raise {
  let t133 = @meson.asm_meson_tac(@list.List([]))
  let t132 = @simp.asm_rewrite_tac(@list.List([span_mbasis(), @sets.subset_refl(), @sets.in_elim_thm()]))
  let t131 = @tactics.exists_tac(@term_syntax.parse_term("{(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool))))}"))
  let t130 = @tactics.match_mp_tac(@vectors.linear_eq())
  let t129 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[M]], IN(x, UNIV) → (f : (Cart[Real, Multivector[M]]) -> Cart[Real, N])(x) == (g : (Cart[Real, Multivector[M]]) -> Cart[Real, N])(x)"), fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x126
    let t128 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @sets.in_univ()]))
    @tactics.then_tac(@tactics.mp_tac(th), t128)
  })
  let t134 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t129), t130), t131), t132), t133)
  linear_eq_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Multivector[M]]) -> Cart[Real, N], ∀ g : (Cart[Real, Multivector[M]]) -> Cart[Real, N], ∀ s : _, (linear : ((Cart[Real, Multivector[M]]) -> Cart[Real, N]) -> Bool)(f) && (linear : ((Cart[Real, Multivector[M]]) -> Cart[Real, N]) -> Bool)(g) && (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)))) → f((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])(s)) == g((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])(s))) → f == g"), t134))
}

///|
let linear_eq_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_EQ_MBASIS")

///|
/// `LINEAR_EQ_MBASIS`
pub fn linear_eq_mbasis() -> @kernel.Thm {
  linear_eq_mbasis_c.get()
}

///|
/// BILINEAR_EQ_MBASIS
fn step_40() -> Unit raise {
  let t143 = @meson.asm_meson_tac(@list.List([]))
  let t142 = @simp.asm_rewrite_tac(@list.List([span_mbasis(), @sets.subset_refl(), @sets.in_elim_thm()]))
  let t141 = @tactics.exists_tac(@term_syntax.parse_term("{(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])((t : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}"))
  let t140 = @tactics.exists_tac(@term_syntax.parse_term("{(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool))))}"))
  let t139 = @tactics.match_mp_tac(@vectors.bilinear_eq())
  let t138 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[M]], ∀ y : Cart[Real, Multivector[N]], IN(x, UNIV) && IN(y, UNIV) → (f : (Cart[Real, Multivector[M]], Cart[Real, Multivector[N]]) -> Cart[Real, P])(x, y) == (g : (Cart[Real, Multivector[M]], Cart[Real, Multivector[N]]) -> Cart[Real, P])(x, y)"), fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x135
    let t137 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @sets.in_univ()]))
    @tactics.then_tac(@tactics.mp_tac(th), t137)
  })
  let t144 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t138), t139), t140), t141), t142), t143)
  bilinear_eq_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Multivector[M]], Cart[Real, Multivector[N]]) -> Cart[Real, P], ∀ g : (Cart[Real, Multivector[M]], Cart[Real, Multivector[N]]) -> Cart[Real, P], ∀ s : _, (bilinear : ((Cart[Real, Multivector[M]], Cart[Real, Multivector[N]]) -> Cart[Real, P]) -> Bool)(f) && (bilinear : ((Cart[Real, Multivector[M]], Cart[Real, Multivector[N]]) -> Cart[Real, P]) -> Bool)(g) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)))) && (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → f((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(t)) == g((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(t))) → f == g"), t144))
}

///|
let bilinear_eq_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_EQ_MBASIS")

///|
/// `BILINEAR_EQ_MBASIS`
pub fn bilinear_eq_mbasis() -> @kernel.Thm {
  bilinear_eq_mbasis_c.get()
}

///|
/// LINEAR_PROPERTY
fn step_41() -> Unit raise {
  let t147 = @simp.asm_simp_tac(@list.List([@vectors.vsum_clauses(), @sets.in_insert()]))
  let t146 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t145 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), @tactics.gen_tac), t145), t146), t147)
  linear_property_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, _]) -> Bool, P(vec(0)) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], P(x) && P(y) → P(x + y)) → (∀ f : (_) -> Cart[Real, _], ∀ s : (_) -> Bool, FINITE(s) && (∀ i : _, IN(i, s) → P(f(i))) → P(vsum(s, f)))"), t148))
}

///|
let linear_property_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_PROPERTY")

///|
/// `LINEAR_PROPERTY`
pub fn linear_property() -> @kernel.Thm {
  linear_property_c.get()
}

///|
/// MBASIS_EXTENSION
fn step_42() -> Unit raise {
  let t155 = @meson.asm_meson_tac(@list.List([@sets.empty_subset(), @vectors.vector_mul_lzero()]))
  let t154 = @simp.asm_simp_tac(@list.List([@sets.finite_powerset(), @iterate.finite_numseg(), @sets.in_elim_thm()]))
  let t153 = @tactics.match_mp_tac(@simp.simp_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))(linear_property()))
  let t152 = @simp.gen_rewrite_tac(fn(x149 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s150 = @equal.rand_conv(x149)
    fn(x151 : @kernel.Term) -> @kernel.Thm raise {
      s150(x151)
    }
  }, @list.List([@equal.gsym(mbasis_expansion())]))
  let t156 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t152), t153), t154), t155)
  mbasis_extension_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, Multivector[N]]) -> Bool, (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → P((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s))) && (∀ c : Real, ∀ x : Cart[Real, Multivector[N]], P(x) → P((op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(c, x))) && (∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], P(x) && P(y) → P(x + y)) → (∀ x : Cart[Real, Multivector[N]], P(x))"), t156))
}

///|
let mbasis_extension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MBASIS_EXTENSION")

///|
/// `MBASIS_EXTENSION`
pub fn mbasis_extension() -> @kernel.Thm {
  mbasis_extension_c.get()
}

///|
/// multivec
fn step_43() -> Unit raise {
  multivec_c.set(@pair.new_definition(@term_syntax.parse_term("(multivec : (Cart[Real, N]) -> Cart[Real, Multivector[N]])((x : Cart[Real, N])) == (vsum : ((Num) -> Bool, (Num) -> Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (i : Num) => (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((op_dollar : (Cart[Real, N], Num) -> Real)(x, i), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i})))")))
}

///|
let multivec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multivec")

///|
/// `multivec`
pub fn multivec() -> @kernel.Thm {
  multivec_c.get()
}

///|
/// Multivariate/clifford.ml:333
fn step_44() -> Unit raise {
  @printer.parse_as_infix("multivector", (12L, "right"))
}

///|
/// multivector
fn step_45() -> Unit raise {
  multivector_c.set(@pair.new_definition(@term_syntax.parse_term("(multivector : (Num, Cart[Real, Multivector[N]]) -> Bool)((k : Num), (p : Cart[Real, Multivector[N]])) == (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && !((op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(p, s) == real_of_num(0)) → (HAS_SIZE : ((Num) -> Bool, Num) -> Bool)(s, k))")))
}

///|
let multivector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multivector")

///|
/// `multivector`
pub fn multivector() -> @kernel.Thm {
  multivector_c.get()
}

///|
/// Multivariate/clifford.ml:343
fn step_46() -> Unit raise {
  @printer.parse_as_infix("grade", (22L, "right"))
}

///|
/// grade
fn step_47() -> Unit raise {
  grade_c.set(@pair.new_definition(@term_syntax.parse_term("(grade : (Num, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((k : Num), (p : Cart[Real, Multivector[N]])) == lambdas((s : (Num) -> Bool) => if HAS_SIZE(s, k) { op_dollar_dollar(p, s) } else { real_of_num(0) })")))
}

///|
let grade_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("grade")

///|
/// `grade`
pub fn grade() -> @kernel.Thm {
  grade_c.get()
}

///|
/// MULTIVECTOR_GRADE
fn step_48() -> Unit raise {
  let t157 = @meson.meson_tac(@list.List([]))
  let t158 = @tactics.then_tac(@simp.simp_tac(@list.List([multivector(), grade(), multivector_beta(), @theorems.imp_conj()])), t157)
  multivector_grade_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∀ x : Cart[Real, Multivector[_]], multivector(k, grade(k, x))"), t158))
}

///|
let multivector_grade_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECTOR_GRADE")

///|
/// `MULTIVECTOR_GRADE`
pub fn multivector_grade() -> @kernel.Thm {
  multivector_grade_c.get()
}

///|
/// GRADE_ADD
fn step_49() -> Unit raise {
  let t159 = @tactics.then_tac(@simp.simp_tac(@list.List([grade(), multivector_eq(), multivector_add_component(), multivector_beta(), @vectors.cond_component()])), @calc_rat.real_arith_tac)
  grade_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[_]], ∀ y : Cart[Real, Multivector[_]], ∀ k : Num, grade(k, x + y) == grade(k, x) + grade(k, y)"), t159))
}

///|
let grade_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GRADE_ADD")

///|
/// `GRADE_ADD`
pub fn grade_add() -> @kernel.Thm {
  grade_add_c.get()
}

///|
/// GRADE_CMUL
fn step_50() -> Unit raise {
  let t160 = @tactics.then_tac(@simp.simp_tac(@list.List([grade(), multivector_eq(), multivector_mul_component(), multivector_beta(), @vectors.cond_component()])), @calc_rat.real_arith_tac)
  grade_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, Multivector[_]], ∀ k : Num, grade(k, op_pct(c, x)) == op_pct(c, grade(k, x))"), t160))
}

///|
let grade_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GRADE_CMUL")

///|
/// `GRADE_CMUL`
pub fn grade_cmul() -> @kernel.Thm {
  grade_cmul_c.get()
}

///|
/// Product_DEF
fn step_51() -> Unit raise {
  product_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mult : ((Num) -> Bool, (Num) -> Bool) -> Real), (op : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool), (x : Cart[Real, Multivector[N]]), (y : Cart[Real, Multivector[N]])) == (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}, (s : (Num) -> Bool) => (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}, (t : (Num) -> Bool) => (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x, s) * ((op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(y, t) * mult(s, t)), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(op(s, t)))))")))
}

///|
let product_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Product_DEF")

///|
/// `Product_DEF`
pub fn product_def() -> @kernel.Thm {
  product_def_c.get()
}

///|
/// BILINEAR_PRODUCT
fn step_52() -> Unit raise {
  let t169 = @simp.asm_simp_tac(@list.List([multivector_add_component()]))
  let t167 = @tactics.repeat_tac(@tactics.strip_tac)
  let t166 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t168 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_eq()), t166), t167))
  let t165 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_add()), @sets.finite_powerset(), @iterate.finite_numseg()]))
  let t164 = @simp.rewrite_tac(@list.List([product_def()]))
  let t163 = @tactics.repeat_tac(@tactics.strip_tac)
  let t162 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @real.real_mul_ac()]))
  let t161 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_lmul()), multivector_mul_component()]))
  let t170 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.bilinear(), @vectors.linear(), product_def()])), t161), t162), t163), t164), t165), t168), t169), @vectors.vector_arith_tac)
  bilinear_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ mult : ((Num) -> Bool, (Num) -> Bool) -> Real, ∀ op : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, (bilinear : ((Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]) -> Bool)((Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])(mult, op))"), t170))
}

///|
let bilinear_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_PRODUCT")

///|
/// `BILINEAR_PRODUCT`
pub fn bilinear_product() -> @kernel.Thm {
  bilinear_product_c.get()
}

///|
/// PRODUCT_LADD
fn step_53() -> Unit raise {
  let t171 = @drule.match_mp(@vectors.bilinear_ladd())
  product_ladd_c.set(t171(@bool.spec_all(bilinear_product())))
}

///|
let product_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_LADD")

///|
/// `PRODUCT_LADD`
pub fn product_ladd() -> @kernel.Thm {
  product_ladd_c.get()
}

///|
/// PRODUCT_RADD
fn step_54() -> Unit raise {
  let t172 = @drule.match_mp(@vectors.bilinear_radd())
  product_radd_c.set(t172(@bool.spec_all(bilinear_product())))
}

///|
let product_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_RADD")

///|
/// `PRODUCT_RADD`
pub fn product_radd() -> @kernel.Thm {
  product_radd_c.get()
}

///|
/// PRODUCT_LMUL
fn step_55() -> Unit raise {
  let t173 = @drule.match_mp(@vectors.bilinear_lmul())
  product_lmul_c.set(t173(@bool.spec_all(bilinear_product())))
}

///|
let product_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_LMUL")

///|
/// `PRODUCT_LMUL`
pub fn product_lmul() -> @kernel.Thm {
  product_lmul_c.get()
}

///|
/// PRODUCT_RMUL
fn step_56() -> Unit raise {
  let t174 = @drule.match_mp(@vectors.bilinear_rmul())
  product_rmul_c.set(t174(@bool.spec_all(bilinear_product())))
}

///|
let product_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_RMUL")

///|
/// `PRODUCT_RMUL`
pub fn product_rmul() -> @kernel.Thm {
  product_rmul_c.get()
}

///|
/// PRODUCT_LNEG
fn step_57() -> Unit raise {
  let t175 = @drule.match_mp(@vectors.bilinear_lneg())
  product_lneg_c.set(t175(@bool.spec_all(bilinear_product())))
}

///|
let product_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_LNEG")

///|
/// `PRODUCT_LNEG`
pub fn product_lneg() -> @kernel.Thm {
  product_lneg_c.get()
}

///|
/// PRODUCT_RNEG
fn step_58() -> Unit raise {
  let t176 = @drule.match_mp(@vectors.bilinear_rneg())
  product_rneg_c.set(t176(@bool.spec_all(bilinear_product())))
}

///|
let product_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_RNEG")

///|
/// `PRODUCT_RNEG`
pub fn product_rneg() -> @kernel.Thm {
  product_rneg_c.get()
}

///|
/// PRODUCT_LZERO
fn step_59() -> Unit raise {
  let t177 = @drule.match_mp(@vectors.bilinear_lzero())
  product_lzero_c.set(t177(@bool.spec_all(bilinear_product())))
}

///|
let product_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_LZERO")

///|
/// `PRODUCT_LZERO`
pub fn product_lzero() -> @kernel.Thm {
  product_lzero_c.get()
}

///|
/// PRODUCT_RZERO
fn step_60() -> Unit raise {
  let t178 = @drule.match_mp(@vectors.bilinear_rzero())
  product_rzero_c.set(t178(@bool.spec_all(bilinear_product())))
}

///|
let product_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_RZERO")

///|
/// `PRODUCT_RZERO`
pub fn product_rzero() -> @kernel.Thm {
  product_rzero_c.get()
}

///|
/// PRODUCT_ASSOCIATIVE
fn step_61() -> Unit raise {
  let t181 = @bool.ispec(@term_syntax.parse_term("(f : ((Num) -> Bool, (Num) -> Bool) -> Real)"), @iterate.sum_swap())
  let t179 = @term_syntax.parse_term("{(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}")
  let t182 = @lib.repeat((x180 : @kernel.Thm) => @bool.spec(t179, x180), t181)
  let sum_swap_powerset = @simp.simp_rule(@list.List([@sets.finite_powerset(), @iterate.finite_numseg()]))(t182)
  let swap_tac : (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x183 : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let cnv = x183
    fn(x184 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let n = x184
      let t192 = @simp.rewrite_tac(@list.List([]))
      let t189 = @lib.int63_to_int(n)
      @tactics.then_tac(@simp.gen_rewrite_tac(fn(x191 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        cnv(((x190 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(t189, fn(x186 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s187 = @equal.binder_conv(x186)
          fn(x188 : @kernel.Term) -> @kernel.Thm raise {
            s187(x188)
          }
        }, x190))(x191))
      }, @list.List([sum_swap_powerset])), t192)
    }
  }
  let swaps_tac : (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[Int64]) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise = fn(x193 : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[Int64]) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
    let cnv_1 = x193
    fn(x194 : @list.List[Int64]) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      let ns = x194
      fn(x195 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let x = x195
        let t199 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
        let t198 = @tactics.x_gen_tac(x)
        let t197 = @tactics.match_mp_tac(@iterate.sum_eq())
        @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(swap_tac(cnv_1), ns), t197), t198), t199), @tactics.strip_tac)
      }
    }
  }
  let t235 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t234 = @simp.asm_rewrite_tac(@list.List([]))
  let t233 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid(), @realarith.real_mul_rid()]))
  let t232 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t231 = @simp.simp_tac(@list.List([@iterate.sum_delta()]))
  let t228 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (if (p : Bool) { (b : Real) } else { real_of_num(0) }) == (if p { a * b } else { real_of_num(0) })"))
  let t229 = @calc_rat.real_arith(@term_syntax.parse_term("(if (p : Bool) { (a : Real) } else { real_of_num(0) }) * (b : Real) == (if p { a * b } else { real_of_num(0) })"))
  let t230 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), t229, t228]))
  let t226 = @term_syntax.parse_term("(u : (Num) -> Bool)")
  let t227 = swaps_tac(fn(x223 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s224 = @equal.land_conv(x223)
    fn(x225 : @kernel.Term) -> @kernel.Thm raise {
      s224(x225)
    }
  })(@list.List([0L]))(t226)
  let t222 = swap_tac(fn(x219 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s220 = @equal.rand_conv(x219)
    fn(x221 : @kernel.Term) -> @kernel.Thm raise {
      s220(x221)
    }
  })(0L)
  let t217 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t218 = swaps_tac(fn(x214 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s215 = @equal.rand_conv(x214)
    fn(x216 : @kernel.Term) -> @kernel.Thm raise {
      s215(x216)
    }
  })(@list.List([1L, 0L]))(t217)
  let t213 = swap_tac(fn(x210 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s211 = @equal.land_conv(x210)
    fn(x212 : @kernel.Term) -> @kernel.Thm raise {
      s211(x212)
    }
  })(0L)
  let t208 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t209 = swaps_tac(fn(x205 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s206 = @equal.rand_conv(x205)
    fn(x207 : @kernel.Term) -> @kernel.Thm raise {
      s206(x207)
    }
  })(@list.List([1L, 0L]))(t208)
  let t204 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : (Num) -> Bool)"))
  let t202 = @equal.gsym(@iterate.sum_rmul())
  let t203 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t202]))
  let t201 = @simp.simp_tac(@list.List([multivector_eq(), multivector_vsum_component(), mbasis_component(), multivector_mul_component()]))
  let t200 = @tactics.repeat_tac(@tactics.strip_tac)
  let t236 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([product_def()])), t200), t201), t203), t204), @tactics.strip_tac), t209), t213), t218), t222), t227), t230), t231), t232), @class.cond_cases_tac), t233), t234), t235)
  product_associative_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, ∀ mult : ((Num) -> Bool, (Num) -> Bool) -> Real, (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(op(s, t), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ u : (Num) -> Bool, op(s, op(t, u)) == op(op(s, t), u)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ u : (Num) -> Bool, mult(t, u) * mult(s, op(t, u)) == mult(s, t) * mult(op(s, t), u)) → (∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], ∀ z : Cart[Real, Multivector[N]], (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(mult, op, x, (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(mult, op, y, z)) == (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(mult, op, (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(mult, op, x, y), z))"), t236))
}

///|
let product_associative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_ASSOCIATIVE")

///|
/// `PRODUCT_ASSOCIATIVE`
pub fn product_associative() -> @kernel.Thm {
  product_associative_c.get()
}

///|
/// Multivariate/clifford.ml:442
fn step_62() -> Unit raise {
  @preterm.overload_interface("*", @term_syntax.parse_term("(geom_mul : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])"))
}

///|
/// geom_mul
fn step_63() -> Unit raise {
  geom_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(geom_mul : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((x : Cart[Real, Multivector[N]]), (y : Cart[Real, Multivector[N]])) == (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})), (s : (Num) -> Bool) => (t : (Num) -> Bool) => (UNION : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)((DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t), (DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(t, s)), x, y)")))
}

///|
let geom_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("geom_mul")

///|
/// `geom_mul`
pub fn geom_mul() -> @kernel.Thm {
  geom_mul_c.get()
}

///|
/// BILINEAR_GEOM
fn step_64() -> Unit raise {
  let t237 = @tactics.match_accept_tac(bilinear_product())
  let t238 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(geom_mul())])), t237)
  bilinear_geom_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]) -> Bool)((geom_mul : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]))"), t238))
}

///|
let bilinear_geom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_GEOM")

///|
/// `BILINEAR_GEOM`
pub fn bilinear_geom() -> @kernel.Thm {
  bilinear_geom_c.get()
}

///|
/// GEOM_LADD
fn step_65() -> Unit raise {
  let t239 = @drule.match_mp(@vectors.bilinear_ladd())
  geom_ladd_c.set(t239(@bool.spec_all(bilinear_geom())))
}

///|
let geom_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_LADD")

///|
/// `GEOM_LADD`
pub fn geom_ladd() -> @kernel.Thm {
  geom_ladd_c.get()
}

///|
/// GEOM_RADD
fn step_66() -> Unit raise {
  let t240 = @drule.match_mp(@vectors.bilinear_radd())
  geom_radd_c.set(t240(@bool.spec_all(bilinear_geom())))
}

///|
let geom_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_RADD")

///|
/// `GEOM_RADD`
pub fn geom_radd() -> @kernel.Thm {
  geom_radd_c.get()
}

///|
/// GEOM_LMUL
fn step_67() -> Unit raise {
  let t241 = @drule.match_mp(@vectors.bilinear_lmul())
  geom_lmul_c.set(t241(@bool.spec_all(bilinear_geom())))
}

///|
let geom_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_LMUL")

///|
/// `GEOM_LMUL`
pub fn geom_lmul() -> @kernel.Thm {
  geom_lmul_c.get()
}

///|
/// GEOM_RMUL
fn step_68() -> Unit raise {
  let t242 = @drule.match_mp(@vectors.bilinear_rmul())
  geom_rmul_c.set(t242(@bool.spec_all(bilinear_geom())))
}

///|
let geom_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_RMUL")

///|
/// `GEOM_RMUL`
pub fn geom_rmul() -> @kernel.Thm {
  geom_rmul_c.get()
}

///|
/// GEOM_LNEG
fn step_69() -> Unit raise {
  let t243 = @drule.match_mp(@vectors.bilinear_lneg())
  geom_lneg_c.set(t243(@bool.spec_all(bilinear_geom())))
}

///|
let geom_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_LNEG")

///|
/// `GEOM_LNEG`
pub fn geom_lneg() -> @kernel.Thm {
  geom_lneg_c.get()
}

///|
/// GEOM_RNEG
fn step_70() -> Unit raise {
  let t244 = @drule.match_mp(@vectors.bilinear_rneg())
  geom_rneg_c.set(t244(@bool.spec_all(bilinear_geom())))
}

///|
let geom_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_RNEG")

///|
/// `GEOM_RNEG`
pub fn geom_rneg() -> @kernel.Thm {
  geom_rneg_c.get()
}

///|
/// GEOM_LZERO
fn step_71() -> Unit raise {
  let t245 = @drule.match_mp(@vectors.bilinear_lzero())
  geom_lzero_c.set(t245(@bool.spec_all(bilinear_geom())))
}

///|
let geom_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_LZERO")

///|
/// `GEOM_LZERO`
pub fn geom_lzero() -> @kernel.Thm {
  geom_lzero_c.get()
}

///|
/// GEOM_RZERO
fn step_72() -> Unit raise {
  let t246 = @drule.match_mp(@vectors.bilinear_rzero())
  geom_rzero_c.set(t246(@bool.spec_all(bilinear_geom())))
}

///|
let geom_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_RZERO")

///|
/// `GEOM_RZERO`
pub fn geom_rzero() -> @kernel.Thm {
  geom_rzero_c.get()
}

///|
/// GEOM_ASSOC
fn step_73() -> Unit raise {
  let t267 = @tactics.conv_tac(@class.taut)
  let t266 = @simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_union(), @sets.in_diff()]))
  let t265 = @simp.rewrite_tac(@list.List([finite_cart_subset_lemma()]))
  let t264 = @tactics.match_mp_tac(symdiff_parity_lemma())
  let t262 = @tactics.then_tac(@tactics.ap_term_tac, @tactics.conv_tac(@equal.sym_conv))
  let t263 = @list.List([@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(x : Bool) == ((y : Bool) == (z : Bool)) → ((a : Bool) == x) == (y == (z == a))"))), t262])
  let t252 = @simp.rewrite_tac(@list.List([@arith.even_add()]))
  let t251 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @real.real_pow_one()]))
  let t250 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t249 = @tactics.repeat_tac(@tactics.gen_tac)
  let t248 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])))
  let t247 = @tactics.match_mp_tac(product_associative())
  let t268 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([geom_mul()])), t247), t248), t249), t250), t251), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t252), fn(x261 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x253 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (_, w) = x253
      let tu = @lib.funpow(2, @equal.lhand, w)
      let t255 = @term_syntax.parse_term("(t : (Num) -> Bool)")
      let su = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(s : (Num) -> Bool)"), t255)]), tu)
      let t256 = @term_syntax.parse_term("(u : (Num) -> Bool)")
      let st = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(t : (Num) -> Bool)"), t256)]), su)
      let t260 = @tactics.exists_tac(@lib.end_itlist((x258 : @kernel.Term, x259 : @kernel.Term) => @lib.curry(fn(x257 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @basics.mk_eq(x257.0, x257.1)
      }, x258, x259), @list.List([st, su, tu])))
      @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t260)
    })(x261)(x261)
  }), @tactics.conj_tac), t263), t264), t265), t266), t267)
  geom_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], ∀ z : Cart[Real, Multivector[N]], geom_mul(x, geom_mul(y, z)) == geom_mul(geom_mul(x, y), z)"), t268))
}

///|
let geom_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_ASSOC")

///|
/// `GEOM_ASSOC`
pub fn geom_assoc() -> @kernel.Thm {
  geom_assoc_c.get()
}

///|
/// Multivariate/clifford.ml:494
fn step_74() -> Unit raise {
  @printer.parse_as_infix("outer", (20L, "right"))
}

///|
/// outer
fn step_75() -> Unit raise {
  outer_c.set(@pair.new_definition(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], (outer : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(x, y) == (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if !((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t) == ({} : (Num) -> Bool)) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) }, (s : (Num) -> Bool) => (t : (Num) -> Bool) => (UNION : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)((DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t), (DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(t, s)), x, y)")))
}

///|
let outer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("outer")

///|
/// `outer`
pub fn outer() -> @kernel.Thm {
  outer_c.get()
}

///|
/// OUTER
fn step_76() -> Unit raise {
  let t273 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → UNION(DIFF(s, t), DIFF(t, s)) == UNION(s, t)"))]))
  let t272 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @vectors.vector_mul_lzero()]))
  let t271 = @class.asm_cases_tac(@term_syntax.parse_term("INTER((s : (Num) -> Bool), (t : (Num) -> Bool)) == {}"))
  let t270 = @tactics.repeat_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac))
  let t269 = @simp.rewrite_tac(@list.List([outer(), product_def()]))
  let t274 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t269), t270), t271), t272), t273)
  outer_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], (outer : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(x, y) == (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if !((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t) == ({} : (Num) -> Bool)) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) }, (UNION : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool), x, y)"), t274))
}

///|
let outer_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER")

///|
/// `OUTER`
pub fn outer_v1() -> @kernel.Thm {
  outer_v1_c.get()
}

///|
/// BILINEAR_OUTER
fn step_77() -> Unit raise {
  let t275 = @tactics.match_accept_tac(bilinear_product())
  let t276 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(outer())])), t275)
  bilinear_outer_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]) -> Bool)((outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]))"), t276))
}

///|
let bilinear_outer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_OUTER")

///|
/// `BILINEAR_OUTER`
pub fn bilinear_outer() -> @kernel.Thm {
  bilinear_outer_c.get()
}

///|
/// OUTER_LADD
fn step_78() -> Unit raise {
  let t277 = @drule.match_mp(@vectors.bilinear_ladd())
  outer_ladd_c.set(t277(@bool.spec_all(bilinear_outer())))
}

///|
let outer_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_LADD")

///|
/// `OUTER_LADD`
pub fn outer_ladd() -> @kernel.Thm {
  outer_ladd_c.get()
}

///|
/// OUTER_RADD
fn step_79() -> Unit raise {
  let t278 = @drule.match_mp(@vectors.bilinear_radd())
  outer_radd_c.set(t278(@bool.spec_all(bilinear_outer())))
}

///|
let outer_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_RADD")

///|
/// `OUTER_RADD`
pub fn outer_radd() -> @kernel.Thm {
  outer_radd_c.get()
}

///|
/// OUTER_LMUL
fn step_80() -> Unit raise {
  let t279 = @drule.match_mp(@vectors.bilinear_lmul())
  outer_lmul_c.set(t279(@bool.spec_all(bilinear_outer())))
}

///|
let outer_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_LMUL")

///|
/// `OUTER_LMUL`
pub fn outer_lmul() -> @kernel.Thm {
  outer_lmul_c.get()
}

///|
/// OUTER_RMUL
fn step_81() -> Unit raise {
  let t280 = @drule.match_mp(@vectors.bilinear_rmul())
  outer_rmul_c.set(t280(@bool.spec_all(bilinear_outer())))
}

///|
let outer_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_RMUL")

///|
/// `OUTER_RMUL`
pub fn outer_rmul() -> @kernel.Thm {
  outer_rmul_c.get()
}

///|
/// OUTER_LNEG
fn step_82() -> Unit raise {
  let t281 = @drule.match_mp(@vectors.bilinear_lneg())
  outer_lneg_c.set(t281(@bool.spec_all(bilinear_outer())))
}

///|
let outer_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_LNEG")

///|
/// `OUTER_LNEG`
pub fn outer_lneg() -> @kernel.Thm {
  outer_lneg_c.get()
}

///|
/// OUTER_RNEG
fn step_83() -> Unit raise {
  let t282 = @drule.match_mp(@vectors.bilinear_rneg())
  outer_rneg_c.set(t282(@bool.spec_all(bilinear_outer())))
}

///|
let outer_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_RNEG")

///|
/// `OUTER_RNEG`
pub fn outer_rneg() -> @kernel.Thm {
  outer_rneg_c.get()
}

///|
/// OUTER_LZERO
fn step_84() -> Unit raise {
  let t283 = @drule.match_mp(@vectors.bilinear_lzero())
  outer_lzero_c.set(t283(@bool.spec_all(bilinear_outer())))
}

///|
let outer_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_LZERO")

///|
/// `OUTER_LZERO`
pub fn outer_lzero() -> @kernel.Thm {
  outer_lzero_c.get()
}

///|
/// OUTER_RZERO
fn step_85() -> Unit raise {
  let t284 = @drule.match_mp(@vectors.bilinear_rzero())
  outer_rzero_c.set(t284(@bool.spec_all(bilinear_outer())))
}

///|
let outer_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_RZERO")

///|
/// `OUTER_RZERO`
pub fn outer_rzero() -> @kernel.Thm {
  outer_rzero_c.get()
}

///|
/// OUTER_ASSOC
fn step_86() -> Unit raise {
  let t299 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t298 = @simp.rewrite_tac(@list.List([@sets.in_elim_pair_thm()]))
  let t297 = @simp.simp_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.not_in_empty(), @sets.in_union(), @sets.in_inter()]))
  let t296 = @simp.rewrite_tac(@list.List([finite_cart_subset_lemma()]))
  let t295 = @tactics.match_mp_tac(card_union_lemma())
  let t294 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t293 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]))
  let t290 = @term_syntax.parse_term("INTER((t : (Num) -> Bool), (u : (Num) -> Bool)) == {}")
  let t291 = @term_syntax.parse_term("INTER((s : (Num) -> Bool), (u : (Num) -> Bool)) == {}")
  let t292 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("INTER((s : (Num) -> Bool), (t : (Num) -> Bool)) == {}"), t291, t290]))
  let t289 = @tactics.repeat_tac(@tactics.gen_tac)
  let t288 = @simp.rewrite_tac(@list.List([@sets.empty_union()]))
  let t286 = @sets.set_rule(@term_syntax.parse_term("INTER(UNION((t : (_) -> Bool), (u : (_) -> Bool)), (s : (_) -> Bool)) == UNION(INTER(t, s), INTER(u, s))"))
  let t287 = @simp.simp_tac(@list.List([@sets.union_subset(), @sets.union_assoc(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == UNION(INTER(s, t), INTER(s, u))")), t286]))
  let t285 = @tactics.match_mp_tac(product_associative())
  let t300 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([outer_v1()])), t285), t287), t288), t289), t292), t293), t294), @tactics.ap_term_tac), t295), t296), t297), t298), t299)
  outer_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], ∀ z : Cart[Real, Multivector[N]], outer(x, outer(y, z)) == outer(outer(x, y), z)"), t300))
}

///|
let outer_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_ASSOC")

///|
/// `OUTER_ASSOC`
pub fn outer_assoc() -> @kernel.Thm {
  outer_assoc_c.get()
}

///|
/// Multivariate/clifford.ml:557
fn step_87() -> Unit raise {
  @printer.parse_as_infix("inner", (20L, "right"))
}

///|
/// inner
fn step_88() -> Unit raise {
  inner_c.set(@pair.new_definition(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[N]], ∀ y : Cart[Real, Multivector[N]], (inner : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(x, y) == (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if s == ({} : (Num) -> Bool) || t == ({} : (Num) -> Bool) || !((DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t) == ({} : (Num) -> Bool) && !((DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(t, s) == ({} : (Num) -> Bool))) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) }, (s : (Num) -> Bool) => (t : (Num) -> Bool) => (UNION : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)((DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t), (DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(t, s)), x, y)")))
}

///|
let inner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inner")

///|
/// `inner`
pub fn inner() -> @kernel.Thm {
  inner_c.get()
}

///|
/// BILINEAR_INNER
fn step_89() -> Unit raise {
  let t301 = @tactics.match_accept_tac(bilinear_product())
  let t302 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(inner())])), t301)
  bilinear_inner_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]) -> Bool)((inner : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]))"), t302))
}

///|
let bilinear_inner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_INNER")

///|
/// `BILINEAR_INNER`
pub fn bilinear_inner() -> @kernel.Thm {
  bilinear_inner_c.get()
}

///|
/// INNER_LADD
fn step_90() -> Unit raise {
  let t303 = @drule.match_mp(@vectors.bilinear_ladd())
  inner_ladd_c.set(t303(@bool.spec_all(bilinear_inner())))
}

///|
let inner_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_LADD")

///|
/// `INNER_LADD`
pub fn inner_ladd() -> @kernel.Thm {
  inner_ladd_c.get()
}

///|
/// INNER_RADD
fn step_91() -> Unit raise {
  let t304 = @drule.match_mp(@vectors.bilinear_radd())
  inner_radd_c.set(t304(@bool.spec_all(bilinear_inner())))
}

///|
let inner_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_RADD")

///|
/// `INNER_RADD`
pub fn inner_radd() -> @kernel.Thm {
  inner_radd_c.get()
}

///|
/// INNER_LMUL
fn step_92() -> Unit raise {
  let t305 = @drule.match_mp(@vectors.bilinear_lmul())
  inner_lmul_c.set(t305(@bool.spec_all(bilinear_inner())))
}

///|
let inner_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_LMUL")

///|
/// `INNER_LMUL`
pub fn inner_lmul() -> @kernel.Thm {
  inner_lmul_c.get()
}

///|
/// INNER_RMUL
fn step_93() -> Unit raise {
  let t306 = @drule.match_mp(@vectors.bilinear_rmul())
  inner_rmul_c.set(t306(@bool.spec_all(bilinear_inner())))
}

///|
let inner_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_RMUL")

///|
/// `INNER_RMUL`
pub fn inner_rmul() -> @kernel.Thm {
  inner_rmul_c.get()
}

///|
/// INNER_LNEG
fn step_94() -> Unit raise {
  let t307 = @drule.match_mp(@vectors.bilinear_lneg())
  inner_lneg_c.set(t307(@bool.spec_all(bilinear_inner())))
}

///|
let inner_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_LNEG")

///|
/// `INNER_LNEG`
pub fn inner_lneg() -> @kernel.Thm {
  inner_lneg_c.get()
}

///|
/// INNER_RNEG
fn step_95() -> Unit raise {
  let t308 = @drule.match_mp(@vectors.bilinear_rneg())
  inner_rneg_c.set(t308(@bool.spec_all(bilinear_inner())))
}

///|
let inner_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_RNEG")

///|
/// `INNER_RNEG`
pub fn inner_rneg() -> @kernel.Thm {
  inner_rneg_c.get()
}

///|
/// INNER_LZERO
fn step_96() -> Unit raise {
  let t309 = @drule.match_mp(@vectors.bilinear_lzero())
  inner_lzero_c.set(t309(@bool.spec_all(bilinear_inner())))
}

///|
let inner_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_LZERO")

///|
/// `INNER_LZERO`
pub fn inner_lzero() -> @kernel.Thm {
  inner_lzero_c.get()
}

///|
/// INNER_RZERO
fn step_97() -> Unit raise {
  let t310 = @drule.match_mp(@vectors.bilinear_rzero())
  inner_rzero_c.set(t310(@bool.spec_all(bilinear_inner())))
}

///|
let inner_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_RZERO")

///|
/// `INNER_RZERO`
pub fn inner_rzero() -> @kernel.Thm {
  inner_rzero_c.get()
}

///|
/// PRODUCT_MBASIS
fn step_98() -> Unit raise {
  let t331 = @simp.asm_rewrite_tac(@list.List([]))
  let t330 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET((t : (Num) -> Bool), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"))
  let t329 = @simp.simp_tac(@list.List([@vectors.vector_mul_lzero(), @class.cond_id(), @vectors.vsum_delta(), @sets.in_elim_thm(), @vectors.vsum_0()]))
  let t328 = @simp.gen_rewrite_tac(fn(x327 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x321 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s322 = @equal.land_conv(x321)
      fn(x323 : @kernel.Term) -> @kernel.Thm raise {
        s322(x323)
      }
    })((fn(x324 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s325 = @equal.once_depth_conv(x324)
      fn(x326 : @kernel.Term) -> @kernel.Thm raise {
        s325(x326)
      }
    })(x327))
  }, @list.List([@class.cond_rator()]))
  let t332 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x320 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x314 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s315 = @equal.land_conv(x314)
      fn(x316 : @kernel.Term) -> @kernel.Thm raise {
        s315(x316)
      }
    })((fn(x317 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s318 = @equal.once_depth_conv(x317)
      fn(x319 : @kernel.Term) -> @kernel.Thm raise {
        s318(x319)
      }
    })(x320))
  }, @list.List([@class.cond_rand()])), t328), t329), t330), t331))
  let t313 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(if (p : Bool) { real_of_num(1) } else { real_of_num(0) }) * ((if (q : Bool) { real_of_num(1) } else { real_of_num(0) }) * (x : Real)) == (if q { if p { x } else { real_of_num(0) } } else { real_of_num(0) })"))]))
  let t312 = @simp.simp_tac(@list.List([multivector_mul_component(), mbasis_component()]))
  let t311 = @simp.rewrite_tac(@list.List([product_def()]))
  let t333 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t311), t312), t313), t332)
  product_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mult : ((Num) -> Bool, (Num) -> Bool) -> Real), (op : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(t)) == (if SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && SUBSET(t, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) { (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(mult(s, t), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(op(s, t))) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t333))
}

///|
let product_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_MBASIS")

///|
/// `PRODUCT_MBASIS`
pub fn product_mbasis() -> @kernel.Thm {
  product_mbasis_c.get()
}

///|
/// PRODUCT_MBASIS_SING
fn step_99() -> Unit raise {
  let t334 = @simp.rewrite_tac(@list.List([product_mbasis(), @sets.set_rule(@term_syntax.parse_term("SUBSET({(x : _)}, (s : (_) -> Bool)) == IN(x, s)"))]))
  product_mbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (Product : (((Num) -> Bool, (Num) -> Bool) -> Real, ((Num) -> Bool, (Num) -> Bool, Num) -> Bool, Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mult : ((Num) -> Bool, (Num) -> Bool) -> Real), (op : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({j})) == (if IN(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && IN(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) { (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(mult({i}, {j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(op({i}, {j}))) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t334))
}

///|
let product_mbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_MBASIS_SING")

///|
/// `PRODUCT_MBASIS_SING`
pub fn product_mbasis_sing() -> @kernel.Thm {
  product_mbasis_sing_c.get()
}

///|
/// GEOM_MBASIS
fn step_100() -> Unit raise {
  let t338 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t337 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_pair_thm(), @pair.forall_pair_thm()]))
  let t336 = @simp.asm_rewrite_tac(@list.List([]))
  let t335 = @simp.rewrite_tac(@list.List([geom_mul(), product_mbasis()]))
  let t339 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t335), @class.cond_cases_tac), t336), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t337), t338)
  geom_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (geom_mul : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(t)) == (if SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && SUBSET(t, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) { (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(pow(-real_of_num(1), CARD({((i : Num), (j : Num)) | IN(i, s) && IN(j, t) && i > j})), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(UNION(DIFF(s, t), DIFF(t, s)))) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t339))
}

///|
let geom_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MBASIS")

///|
/// `GEOM_MBASIS`
pub fn geom_mbasis() -> @kernel.Thm {
  geom_mbasis_c.get()
}

///|
/// GEOM_MBASIS_SING
fn step_101() -> Unit raise {
  let t361 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t360 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) < (j : Num)"))
  let t357 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → (j < i) == !(i < j)")))
  let t359 = @tactics.first_assum(fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s355 = @tactics.subst1_tac(x354)
      fn(x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s355(x356)
      }
    })(t357(x358))
  })
  let t353 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("!((i : _) == (j : _)) → UNION(DIFF({i}, {j}), DIFF({j}, {i})) == {i, j}"))]))
  let t351 = @sets.set_tac(@list.List([]))
  let t352 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()])), @tactics.ap_term_tac), t351), @tactics.all_tac])
  let t350 = @simp.asm_rewrite_tac(@list.List([@arith.gt(), @arith.lt_refl()]))
  let t349 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t347 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t346 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing(), @sets.not_in_empty(), @pair.pair_eq()]))
  let t348 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_sing()])), @class.cond_cases_tac), t346), t347), @tactics.all_tac])
  let t345 = @tactics.subgoal_then(@term_syntax.parse_term("{((i' : Num), (j' : Num)) | IN(i', op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && IN(j', op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && i' == (i : Num) && j' == (j : Num) && i' > j'} == (if i > j { {(i, j)} } else { {} })"), fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s343 = @tactics.subst1_tac(x342)
    fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s343(x344)
    }
  })
  let t341 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing()]))
  let t340 = @simp.rewrite_tac(@list.List([geom_mul(), product_mbasis_sing()]))
  let t362 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t340), @class.cond_cases_tac), t341), t345), t348), t349), t350), t352), t353), t359), t360), t361), @vectors.vector_arith_tac)
  geom_mbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (geom_mul : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({j})) == (if IN(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && IN(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) { if i == j { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({}) } else { if i < j { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i, j}) } else { -(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i, j}) } } } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t362))
}

///|
let geom_mbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MBASIS_SING")

///|
/// `GEOM_MBASIS_SING`
pub fn geom_mbasis_sing() -> @kernel.Thm {
  geom_mbasis_sing_c.get()
}

///|
/// OUTER_MBASIS
fn step_102() -> Unit raise {
  let t368 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t367 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_pair_thm(), @pair.forall_pair_thm()]))
  let t366 = @simp.asm_rewrite_tac(@list.List([]))
  let t365 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @class.cond_id()]))
  let t364 = @class.asm_cases_tac(@term_syntax.parse_term("INTER((s : (Num) -> Bool), (t : (Num) -> Bool)) == {}"))
  let t363 = @simp.rewrite_tac(@list.List([outer_v1(), product_mbasis()]))
  let t369 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t363), t364), t365), @class.cond_cases_tac), t366), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t367), t368)
  outer_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (outer : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(t)) == (if SUBSET(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && SUBSET(t, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && INTER(s, t) == {} { (op_pct : (Real, Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])(pow(-real_of_num(1), CARD({((i : Num), (j : Num)) | IN(i, s) && IN(j, t) && i > j})), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(UNION(s, t))) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t369))
}

///|
let outer_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MBASIS")

///|
/// `OUTER_MBASIS`
pub fn outer_mbasis() -> @kernel.Thm {
  outer_mbasis_c.get()
}

///|
/// OUTER_MBASIS_SING
fn step_103() -> Unit raise {
  let t390 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t389 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) < (j : Num)"))
  let t386 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → (j < i) == !(i < j)")))
  let t388 = @tactics.first_assum(fn(x387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s384 = @tactics.subst1_tac(x383)
      fn(x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s384(x385)
      }
    })(t386(x387))
  })
  let t382 = @simp.asm_simp_tac(@list.List([@arith.gt(), @sets.set_rule(@term_syntax.parse_term("UNION({(i : _)}, {(j : _)}) == {i, j}"))]))
  let t380 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t379 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing(), @sets.not_in_empty(), @pair.pair_eq()]))
  let t381 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_sing()])), @class.cond_cases_tac), t379), t380), @tactics.all_tac])
  let t378 = @tactics.subgoal_then(@term_syntax.parse_term("{((i' : Num), (j' : Num)) | IN(i', op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && IN(j', op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && i' == (i : Num) && j' == (j : Num) && i' > j'} == (if i > j { {(i, j)} } else { {} })"), fn(x375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s376 = @tactics.subst1_tac(x375)
    fn(x377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s376(x377)
    }
  })
  let t374 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing()]))
  let t373 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @class.cond_id()]))
  let t372 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t371 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER({(i : _)}, {(j : _)}) == {}) == !(i == j)"))]))
  let t370 = @simp.rewrite_tac(@list.List([outer_v1(), product_mbasis_sing()]))
  let t391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t370), t371), t372), t373), @class.cond_cases_tac), t374), t378), t381), t382), t388), t389), t390), @vectors.vector_arith_tac)
  outer_mbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (outer : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({j})) == (if IN(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && IN(j, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && !(i == j) { if i < j { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i, j}) } else { -(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i, j}) } } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t391))
}

///|
let outer_mbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MBASIS_SING")

///|
/// `OUTER_MBASIS_SING`
pub fn outer_mbasis_sing() -> @kernel.Thm {
  outer_mbasis_sing_c.get()
}

///|
/// OUTER_MBASIS_SKEWSYM
fn step_104() -> Unit raise {
  let t401 = @sets.set_tac(@list.List([]))
  let t400 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t399 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_neg(), @vectors.vector_neg_0()]))
  let t398 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t395 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → i < j && !(j < i) || j < i && !(i < j)")))
  let t397 = @tactics.first_assum(fn(x396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t395(x396))
  })
  let t394 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_0()]))
  let t393 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t392 = @simp.rewrite_tac(@list.List([outer_mbasis_sing()]))
  let t402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t392), t393), t394), t397), t398), @class.cond_cases_tac), t399), t400), t401)
  outer_mbasis_skewsym_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j})) == -(outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}))"), t402))
}

///|
let outer_mbasis_skewsym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MBASIS_SKEWSYM")

///|
/// `OUTER_MBASIS_SKEWSYM`
pub fn outer_mbasis_skewsym() -> @kernel.Thm {
  outer_mbasis_skewsym_c.get()
}

///|
/// OUTER_MBASIS_REFL
fn step_105() -> Unit raise {
  let t403 = @tactics.match_accept_tac(outer_mbasis_skewsym())
  let t404 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@vectors.vector_arith(@term_syntax.parse_term("∀ x : Cart[Real, N], x == -x → x == vec(0)")))), t403)
  outer_mbasis_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i})) == (vec : (Num) -> Cart[Real, Multivector[_]])(0)"), t404))
}

///|
let outer_mbasis_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MBASIS_REFL")

///|
/// `OUTER_MBASIS_REFL`
pub fn outer_mbasis_refl() -> @kernel.Thm {
  outer_mbasis_refl_c.get()
}

///|
/// OUTER_MBASIS_LSCALAR
fn step_106() -> Unit raise {
  let t408 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()]))
  let t407 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, {}) && IN(j, (s : (Num) -> Bool)) && i > j} == {}"))]))
  let t406 = @simp.simp_tac(@list.List([outer_mbasis(), @sets.empty_subset(), @sets.inter_empty(), @sets.union_empty()]))
  let t405 = @simp.simp_tac(@list.List([outer_rmul(), outer_radd()]))
  let t409 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mbasis_extension()), t405), t406), t407), t408)
  outer_mbasis_lscalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[_]], outer(mbasis({}), x) == x"), t409))
}

///|
let outer_mbasis_lscalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MBASIS_LSCALAR")

///|
/// `OUTER_MBASIS_LSCALAR`
pub fn outer_mbasis_lscalar() -> @kernel.Thm {
  outer_mbasis_lscalar_c.get()
}

///|
/// OUTER_MBASIS_RSCALAR
fn step_107() -> Unit raise {
  let t413 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()]))
  let t412 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, (s : (Num) -> Bool)) && IN(j, {}) && i > j} == {}"))]))
  let t411 = @simp.simp_tac(@list.List([outer_mbasis(), @sets.empty_subset(), @sets.inter_empty(), @sets.union_empty()]))
  let t410 = @simp.simp_tac(@list.List([outer_lmul(), outer_ladd()]))
  let t414 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mbasis_extension()), t410), t411), t412), t413)
  outer_mbasis_rscalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[_]], outer(x, mbasis({})) == x"), t414))
}

///|
let outer_mbasis_rscalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MBASIS_RSCALAR")

///|
/// `OUTER_MBASIS_RSCALAR`
pub fn outer_mbasis_rscalar() -> @kernel.Thm {
  outer_mbasis_rscalar_c.get()
}

///|
/// MBASIS_SPLIT
fn step_108() -> Unit raise {
  let t428 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) < (m : Num) && n > m)"))]))
  let t427 = @simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_sing(), @sets.not_in_empty()]))
  let t426 = @tactics.subgoal_then(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, {(a : Num)}) && IN(j, (s : (Num) -> Bool)) && i > j} == {}"), fn(x424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x424
    @simp.simp_tac(@list.List([th, @sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()]))
  })
  let t423 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION({(a : _)}, (s : (_) -> Bool)) == INSERT(a, s)"))]))
  let t422 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([mbasis_eq_0()]))])
  let t421 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(SUBSET({(a : _)}, (t : (_) -> Bool)) && SUBSET((s : (_) -> Bool), t)) == SUBSET(INSERT(a, s), t)"))]))
  let t420 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([@arith.lt_refl()])), @tactics.all_tac])
  let t419 = @tactics.subgoal_then(@term_syntax.parse_term("INTER({(a : Num)}, (s : (Num) -> Bool)) == {}"), fn(x416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s417 = @tactics.subst1_tac(x416)
    fn(x418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s417(x418)
    }
  })
  let t415 = @simp.rewrite_tac(@list.List([outer_mbasis()]))
  let t429 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t415), t419), t420), t421), @class.cond_cases_tac), t422), t423), t426), t427), t428)
  mbasis_split_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ s : (Num) -> Bool, (∀ x : Num, IN(x, s) → a < x) → (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])(INSERT(a, s)) == (outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({a}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])(s))"), t429))
}

///|
let mbasis_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MBASIS_SPLIT")

///|
/// `MBASIS_SPLIT`
pub fn mbasis_split() -> @kernel.Thm {
  mbasis_split_c.get()
}

///|
/// SETENUM_NORM_CONV
fn step_109() -> Unit raise {
  let t438 = @simp.gen_rewrite_conv(fn(x437 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x437
  }, @list.List([@theorems.forall_simp()]))
  let t436 = @equal.binder_conv(fn(x435 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_intro(@canon.disj_aci_rule(x435))
  })
  let t434 = @simp.gen_rewrite_conv(fn(x431 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s432 = @equal.top_sweep_conv(x431)
    fn(x433 : @kernel.Term) -> @kernel.Thm raise {
      s432(x433)
    }
  }, @list.List([@sets.in_sing(), @sets.in_insert()]))
  let conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x430 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x430
  }, @list.List([@sets.extension()])), t434), t436), t438)
  setenum_norm_conv_c.set(fn(x439 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x439
    let nums = @sets.dest_setenum(tm)
    let nums_p = @lib.map(@nums.mk_numeral, @lib.sort(fn(x440 : @num.Num, x441 : @num.Num) -> Bool raise {
      @num.lt_num(x440, x441)
    }, @lib.map(@basics.dest_numeral, @lib.setify(nums))))
    if (nums_p == nums) {
      @kernel.refl(tm)
    } else {
      let eq = @basics.mk_eq(tm, @sets.mk_setenum((nums_p, @basics.dest_fun_ty(@kernel.type_of(tm)).0)))
      @bool.eqt_elim(conv(eq))
    }
  })
}

///|
let setenum_norm_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("SETENUM_NORM_CONV")

///|
/// `SETENUM_NORM_CONV`
pub fn setenum_norm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (setenum_norm_conv_c.get())(x)
}

///|
let mbasis_split_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("MBASIS_SPLIT_CONV")

///|
/// `MBASIS_SPLIT_CONV`
pub fn mbasis_split_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (mbasis_split_conv_c.get())(x)
}

///|
let mbasis_merge_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("MBASIS_MERGE_CONV")

///|
/// `MBASIS_MERGE_CONV`
pub fn mbasis_merge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (mbasis_merge_conv_c.get())(x)
}

///|
/// MBASIS_SPLIT_CONV, MBASIS_MERGE_CONV
fn step_110() -> Unit raise {
  let setlemma = @sets.set_rule(@term_syntax.parse_term("(∀ x : Num, IN(x, {}) → (a : Num) < x) == true && (∀ x : Num, IN(x, INSERT((y : Num), (s : (Num) -> Bool))) → a < x) == (a < y && (∀ x : Num, IN(x, s) → a < x))"))
  let set_check_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@simp.gen_rewrite_conv(fn(x442 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s443 = @equal.top_sweep_conv(x442)
    fn(x444 : @kernel.Term) -> @kernel.Thm raise {
      s443(x444)
    }
  }, @list.List([setlemma])), @calc_num.num_reduce_conv)
  let inst_split : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x445 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x445))
  }, mbasis_split())
  let inst_merge : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x446 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x446))
  }, @equal.gsym(mbasis_split()))
  fn conv(x447 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x447
    if (Int::to_int64(@lib.length(@sets.dest_setenum(@kernel.rand(tm)))) <= 1L) {
      @kernel.refl(tm)
    } else {
      let th = @drule.mp_conv(set_check_conv, inst_split(tm))
      let t448 = @kernel.rand(@kernel.concl(th))
      let th_p = @equal.rand_conv(conv)(t448)
      @kernel.trans(th, th_p)
    }
  }
  let (mbasis_split_conv, mbasis_merge_conv) = (fn(x449 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x449
    try {
      let (op, se) = @kernel.dest_comb(tm_1)
      if ((@kernel.dest_const(op).0 == "mbasis") && @lib.forall(@nums.is_numeral, @sets.dest_setenum(se))) {
        @equal.thenc(@equal.rand_conv(setenum_norm_conv), conv)(tm_1)
      } else {
        @lib.failure()
      }
    } catch {
      Failure(_) => raise Failure("MBASIS_SPLIT_CONV")
      e => raise e
    }
  }, fn(x450 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x450
    try {
      @drule.mp_conv(set_check_conv, inst_merge(tm_2))
    } catch {
      Failure(_) => raise Failure("MBASIS_MERGE_CONV")
      e => raise e
    }
  })
  mbasis_split_conv_c.set(mbasis_split_conv)
  mbasis_merge_conv_c.set(mbasis_merge_conv)
}

///|
/// OUTER_ACI
fn step_111() -> Unit raise {
  let t455 = @meson.meson_tac(@list.List([outer_mbasis_skewsym(), outer_lneg()]))
  let t453 = @vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (y : Cart[Real, N]) == x + -y"))
  let t454 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vector_neg_minus1()), t453]))
  let t452 = @simp.rewrite_tac(@list.List([outer_mbasis_lscalar(), outer_mbasis_rscalar()]))
  let t451 = @simp.rewrite_tac(@list.List([outer_mbasis_refl(), outer_lzero()]))
  let t456 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([outer_assoc(), outer_lzero(), outer_rzero(), outer_ladd(), outer_radd(), outer_lmul(), outer_rmul(), outer_lzero(), outer_rzero()])), t451), t452), t454), t455)
  outer_aci_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, Multivector[_]], ∀ y : Cart[Real, Multivector[_]], ∀ z : Cart[Real, Multivector[_]], outer(outer(x, y), z) == outer(x, outer(y, z))) && (∀ i : Num, ∀ j : Num, i > j → (outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j})) == (op_pct : (Real, Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])(-real_of_num(1), (outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i})))) && (∀ i : Num, ∀ j : Num, ∀ x : Cart[Real, Multivector[_]], i > j → outer(mbasis({i}), outer(mbasis({j}), x)) == op_pct(-real_of_num(1), outer(mbasis({j}), outer(mbasis({i}), x)))) && (∀ i : Num, (outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i})) == (vec : (Num) -> Cart[Real, Multivector[_]])(0)) && (∀ i : Num, ∀ x : Cart[Real, Multivector[_]], outer(mbasis({i}), outer(mbasis({i}), x)) == vec(0)) && (∀ x : Cart[Real, Multivector[_]], outer(mbasis({}), x) == x) && (∀ x : Cart[Real, Multivector[_]], outer(x, mbasis({})) == x)"), t456))
}

///|
let outer_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_ACI")

///|
/// `OUTER_ACI`
pub fn outer_aci() -> @kernel.Thm {
  outer_aci_c.get()
}

///|
/// `MBASIS_GROUP_CONV`
pub fn mbasis_group_conv(x457 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x457
  let tms = @lib.striplist((x458 : @kernel.Term) => @basics.dest_binary("vector_add", x458), tm)
  if (Int::to_int64(@lib.length(tms)) == 1L) {
    @equal.land_conv(@calc_rat.real_poly_conv)(tm)
  } else {
    let vadd_tm = @kernel.rator(@kernel.rator(tm))
    let mk_vadd : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x461 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      fn(x462 : @kernel.Term) -> @kernel.Term raise {
        ((x459 : @kernel.Term, x460 : @kernel.Term) => @basics.mk_binop(vadd_tm, x459, x460))(x461, x462)
      }
    }
    let mbs = @lib.map(fn(x465 : @kernel.Term) -> @kernel.Term raise {
      (fn(x463 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x463.1
      })(((x464 : @kernel.Term) => @basics.dest_binary("%", x464))(x465))
    }, tms)
    let tmbs = @lib.zip(mbs, tms)
    let mset = @lib.setify(mbs)
    let grps = @lib.map(fn(x466 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      let x = x466
      @lib.map(fn(x467 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x467.1
      }, @lib.filter(fn(x468 : (@kernel.Term, @kernel.Term)) -> Bool raise {
        let (x_p, _) = x468
        (x_p == x)
      }, tmbs))
    }, mset)
    let tm_p = @lib.end_itlist(fn(x469 : @kernel.Term, x470 : @kernel.Term) -> @kernel.Term raise {
      let s471 = mk_vadd(x469)
      s471(x470)
    }, @lib.map((x475 : @list.List[@kernel.Term]) => @lib.end_itlist(fn(x472 : @kernel.Term, x473 : @kernel.Term) -> @kernel.Term raise {
      let s474 = mk_vadd(x472)
      s474(x473)
    }, x475), grps))
    let t476 = @basics.mk_eq(tm, tm_p)
    let th1 = @theorems.ac(@vectors.vector_add_ac())(t476)
    let t480 = @equal.depth_binop_conv(vadd_tm, @equal.land_conv(@calc_rat.real_poly_conv))
    let th2 = @equal.thenc(@simp.gen_rewrite_conv(fn(x477 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s478 = @equal.depth_conv(x477)
      fn(x479 : @kernel.Term) -> @kernel.Thm raise {
        s478(x479)
      }
    }, @list.List([@equal.gsym(@vectors.vector_add_rdistrib())])), t480)(tm_p)
    @kernel.trans(th1, th2)
  }
}

///|
/// OUTER_CANON_CONV
fn step_112() -> Unit raise {
  let t495 = @simp.gen_rewrite_conv(fn(x492 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s493 = @equal.depth_conv(x492)
    fn(x494 : @kernel.Term) -> @kernel.Thm raise {
      s493(x494)
    }
  }, @list.List([@equal.gsym(@vectors.vector_add_rdistrib())]))
  let t491 = @equal.depth_conv(mbasis_merge_conv)
  let t490 = @simp.pure_rewrite_conv(@list.List([@equal.gsym(@vectors.vector_add_assoc())]))
  let t489 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_add_ldistrib(), @vectors.vector_add_rdistrib(), @vectors.vector_mul_assoc()]))
  let t488 = @simp.gen_rewrite_conv(fn(x487 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x487
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())]))
  let t486 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_rzero(), @vectors.vector_add_lid(), @vectors.vector_add_rid(), @vectors.vector_mul_assoc()]))
  let t485 = @simp.pure_simp_conv(@list.List([outer_aci(), @calc_num.arith_gt(), @calc_num.arith_ge(), outer_lmul(), outer_rmul(), outer_lzero(), outer_rzero()]))
  let t484 = @simp.gen_rewrite_conv(fn(x481 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s482 = @equal.top_depth_conv(x481)
    fn(x483 : @kernel.Term) -> @kernel.Thm raise {
      s482(x483)
    }
  }, @list.List([@vectors.vector_sub_v1(), @vectors.vector_neg_minus1(), outer_ladd(), outer_radd(), outer_lmul(), outer_rmul(), outer_lzero(), outer_rzero(), @vectors.vector_add_ldistrib(), @vectors.vector_add_rdistrib(), @vectors.vector_mul_assoc(), @vectors.vector_mul_lzero(), @vectors.vector_mul_rzero()]))
  outer_canon_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.once_depth_conv(mbasis_split_conv), t484), @calc_rat.real_rat_reduce_conv), t485), t486), t488), t489), @calc_rat.real_rat_reduce_conv), t490), t491), mbasis_group_conv), t495), @calc_rat.real_rat_reduce_conv))
}

///|
let outer_canon_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("OUTER_CANON_CONV")

///|
/// `OUTER_CANON_CONV`
pub fn outer_canon_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (outer_canon_conv_c.get())(x)
}

///|
/// seqiterate_EXISTS
fn step_113() -> Unit raise {
  let t515 = @simp.asm_simp_tac(@list.List([@sets.card_delete(), @sets.card_eq_0(), @int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)"))]))
  let t514 = @simp.gen_rewrite_tac(fn(x511 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s512 = @equal.land_conv(x511)
    fn(x513 : @kernel.Term) -> @kernel.Thm raise {
      s512(x513)
    }
  }, @list.List([@arith.minimal_v1()]))
  let t510 = @list.List([@meson.asm_meson_tac(@list.List([@sets.member_not_empty()])), @tactics.all_tac])
  let t509 = @tactics.subgoal_then(@term_syntax.parse_term("∃ i : Num, IN(i, (s : (Num) -> Bool))"), fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s507 = @tactics.mp_tac(x506)
    fn(x508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s507(x508)
    }
  })
  let t505 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.de_morgan_thm()])))
  let t504 = @simp.rewrite_tac(@list.List([@wf.measure()]))
  let t503 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t502 = @simp.asm_rewrite_tac(@list.List([]))
  let t501 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t500 = @simp.asm_rewrite_tac(@list.List([]))
  let t499 = @tactics.repeat_tac(@tactics.strip_tac)
  let t497 = @bool.ispec(@term_syntax.parse_term("(CARD : ((Num) -> Bool) -> Num)"), @wf.wf_measure())
  let t498 = @tactics.match_mp_tac(@drule.match_mp(@wf.wf_rec())(t497))
  let t496 = @simp.rewrite_tac(@list.List([@sets.infinite()]))
  let t516 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t496), t498), t499), @class.cond_cases_tac), t500), @pair.let_tac), t501), @class.cond_cases_tac), t502), @tactics.ap_term_tac), t503), t504), t505), t509), t510), t514), t515)
  seqiterate_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : (_, _) -> _, ∀ f : (Num) -> _, ∃ h : ((Num) -> Bool) -> _, ∀ s : (Num) -> Bool, h(s) == (if INFINITE(s) || s == {} { neutral(op) } else { LET((i : Num) => LET_END(if s == {i} { f(i) } else { op(f(i), h(DELETE(s, i))) }), minimal((x : Num) => IN(x, s))) })"), t516))
}

///|
let seqiterate_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("seqiterate_EXISTS")

///|
/// `seqiterate_EXISTS`
pub fn seqiterate_exists() -> @kernel.Thm {
  seqiterate_exists_c.get()
}

///|
/// EXISTS_SWAP
fn step_114() -> Unit raise {
  let t519 = @meson.asm_meson_tac(@list.List([]))
  let t518 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t520 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a : A) => (b : B) => (f : (B, A) -> C)(b, a)")), t518), t519])
  let t517 = @tactics.disch_then(@tactics.choose_tac)
  let t521 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t517), t520)
  exists_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((B, A) -> C) -> Bool, (∃ f : (B, A) -> C, P(f)) == (∃ f : (A, B) -> C, P((b : B) => (a : A) => f(a, b)))"), t521))
}

///|
let exists_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_SWAP")

///|
/// `EXISTS_SWAP`
pub fn exists_swap() -> @kernel.Thm {
  exists_swap_c.get()
}

///|
/// seqiterate
fn step_115() -> Unit raise {
  let t522 = @simp.once_rewrite_rule(@list.List([@class.skolem_thm()]))(seqiterate_exists())
  let t523 = @simp.once_rewrite_rule(@list.List([exists_swap()]))(t522)
  let t524 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(t523)
  seqiterate_c.set(@nums.new_specification(@list.List(["seqiterate"]))(t524))
}

///|
let seqiterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("seqiterate")

///|
/// `seqiterate`
pub fn seqiterate() -> @kernel.Thm {
  seqiterate_c.get()
}

///|
/// MINIMAL_IN_INSERT
fn step_116() -> Unit raise {
  let t528 = @meson.asm_meson_tac(@list.List([@arith.lt_antisym()]))
  let t527 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t526 = @tactics.match_mp_tac(@class.select_unique())
  let t525 = @simp.rewrite_tac(@list.List([@arith.minimal()]))
  let t529 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t525), t526), t527), t528)
  minimal_in_insert_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ i : Num, (∀ j : Num, IN(j, s) → i < j) → minimal((j : Num) => IN(j, INSERT(i, s))) == i"), t529))
}

///|
let minimal_in_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL_IN_INSERT")

///|
/// `MINIMAL_IN_INSERT`
pub fn minimal_in_insert() -> @kernel.Thm {
  minimal_in_insert_c.get()
}

///|
/// SEQITERATE_CLAUSES
fn step_117() -> Unit raise {
  let t541 = @simp.asm_simp_tac(@list.List([@sets.delete_insert(), @sets.set_rule(@term_syntax.parse_term("!IN((i : _), (s : (_) -> Bool)) && !(s == {}) → DELETE(s, i) == s && !(INSERT(i, s) == {i})"))]))
  let t540 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lt_refl()])), @tactics.all_tac])
  let t539 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((i : Num), (s : (Num) -> Bool))"), fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s537 = @tactics.assume_tac(x536)
    fn(x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s537(x538)
    }
  })
  let t535 = @simp.asm_simp_tac(@list.List([minimal_in_insert(), @sets.not_in_empty(), @pair.let_def(), @pair.let_end_def()]))
  let t534 = @simp.asm_simp_tac(@list.List([@sets.not_insert_empty(), @sets.infinite(), @sets.finite_insert(), @sets.finite_rules()]))
  let t533 = @simp.gen_rewrite_tac(fn(x530 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s531 = @equal.land_conv(x530)
    fn(x532 : @kernel.Term) -> @kernel.Thm raise {
      s531(x532)
    }
  }, @list.List([seqiterate()]))
  let t542 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t533), t534), t535), t539), t540), t541)
  seqiterate_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ op : (_, _) -> _, ∀ f : (Num) -> _, seqiterate(op, {}, f) == neutral(op)) && (∀ op : (_, _) -> _, ∀ f : (Num) -> _, ∀ i : Num, seqiterate(op, {i}, f) == f(i)) && (∀ op : (_, _) -> _, ∀ f : (Num) -> _, ∀ i : Num, ∀ s : (Num) -> Bool, FINITE(s) && !(s == {}) && (∀ j : Num, IN(j, s) → i < j) → seqiterate(op, INSERT(i, s), f) == op(f(i), seqiterate(op, s, f)))"), t542))
}

///|
let seqiterate_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_CLAUSES")

///|
/// `SEQITERATE_CLAUSES`
pub fn seqiterate_clauses() -> @kernel.Thm {
  seqiterate_clauses_c.get()
}

///|
/// SEQITERATE_ITERATE
fn step_118() -> Unit raise {
  let t576 = @meson.asm_meson_tac(@list.List([@arith.lt_antisym(), @arith.lt_cases()]))
  let t575 = @simp.asm_rewrite_tac(@list.List([@sets.finite_delete(), @sets.in_delete()]))
  let t574 = @tactics.match_mp_tac(@lib.last(@bool.conjuncts_rule(seqiterate_clauses())))
  let t572 = @tactics.first_x_assum(fn(x571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s569 = @tactics.subst1_tac(x568)
      fn(x570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s569(x570)
      }
    })(@equal.sym(x571))
  })
  let t573 = @list.List([@meson.asm_meson_tac(@list.List([@iterate.monoidal()])), t572])
  let t567 = @simp.asm_simp_tac(@list.List([seqiterate_clauses(), @iterate.iterate_clauses()]))
  let t566 = @class.asm_cases_tac(@term_syntax.parse_term("DELETE((s : (Num) -> Bool), (i : Num)) == {}"))
  let t565 = @simp.asm_simp_tac(@list.List([@iterate.iterate_clauses(), @sets.finite_delete(), @sets.in_delete()]))
  let t562 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((i : _), (s : (_) -> Bool)) → s == INSERT(i, DELETE(s, i))")))
  let t564 = @tactics.first_x_assum(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s560 = @tactics.subst1_tac(x559)
      fn(x561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s560(x561)
      }
    })(t562(x563))
  })
  let t558 = @simp.asm_rewrite_tac(@list.List([]))
  let t557 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t556 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t555 = @simp.gen_rewrite_tac(fn(x552 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s553 = @equal.land_conv(x552)
    fn(x554 : @kernel.Term) -> @kernel.Thm raise {
      s553(x554)
    }
  }, @list.List([@arith.num_wop()]))
  let t549 = @simp.gen_rewrite_rule(fn(x548 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x548
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t551 = @tactics.first_x_assum(fn(x550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s546 = @tactics.mp_tac(x545)
      fn(x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s546(x547)
      }
    })(t549(x550))
  })
  let t544 = @simp.asm_simp_tac(@list.List([seqiterate_clauses(), @iterate.iterate_clauses()]))
  let t543 = @tactics.match_mp_tac(@sets.finite_induct_delete())
  let t577 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), @tactics.gen_tac), t543), t544), @tactics.gen_tac), @tactics.strip_tac), t551), t555), t556), t557), @tactics.strip_tac), t558), @tactics.disch_tac), t564), t565), t566), t567), t573), t574), t575), t576)
  seqiterate_iterate_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : (_, _) -> _, ∀ f : (Num) -> _, ∀ s : (Num) -> Bool, monoidal(op) && FINITE(s) → seqiterate(op, s, f) == iterate(op, s, f)"), t577))
}

///|
let seqiterate_iterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_ITERATE")

///|
/// `SEQITERATE_ITERATE`
pub fn seqiterate_iterate() -> @kernel.Thm {
  seqiterate_iterate_c.get()
}

///|
/// outermorphism
fn step_119() -> Unit raise {
  outermorphism_c.set(@pair.new_definition(@term_syntax.parse_term("(outermorphism : ((Cart[Real, N]) -> Cart[Real, P], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[P]])((f : (Cart[Real, N]) -> Cart[Real, P]), (x : Cart[Real, Multivector[N]])) == (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Multivector[P]]) -> Cart[Real, Multivector[P]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))}, (s : (Num) -> Bool) => (op_pct : (Real, Cart[Real, Multivector[P]]) -> Cart[Real, Multivector[P]])((op_dollar_dollar : (Cart[Real, Multivector[N]], (Num) -> Bool) -> Real)(x, s), (seqiterate : ((Cart[Real, Multivector[P]], Cart[Real, Multivector[P]]) -> Cart[Real, Multivector[P]], (Num) -> Bool, (Num) -> Cart[Real, Multivector[P]]) -> Cart[Real, Multivector[P]])((outer : (Cart[Real, Multivector[P]], Cart[Real, Multivector[P]]) -> Cart[Real, Multivector[P]]), s, (o : ((Cart[Real, P]) -> Cart[Real, Multivector[P]], (Num) -> Cart[Real, P], Num) -> Cart[Real, Multivector[P]])((multivec : (Cart[Real, P]) -> Cart[Real, Multivector[P]]), (o : ((Cart[Real, N]) -> Cart[Real, P], (Num) -> Cart[Real, N], Num) -> Cart[Real, P])(f, (basis : (Num) -> Cart[Real, N]))))))")))
}

///|
let outermorphism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("outermorphism")

///|
/// `outermorphism`
pub fn outermorphism() -> @kernel.Thm {
  outermorphism_c.get()
}

///|
/// NEUTRAL_OUTER
fn step_120() -> Unit raise {
  let t579 = @meson.meson_tac(@list.List([outer_mbasis_lscalar(), outer_mbasis_rscalar()]))
  let t578 = @tactics.match_mp_tac(@class.select_unique())
  let t580 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.neutral()])), t578), t579)
  neutral_outer_c.set(@tactics.prove(@term_syntax.parse_term("(neutral : ((Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])((outer : (Cart[Real, Multivector[_]], Cart[Real, Multivector[_]]) -> Cart[Real, Multivector[_]])) == (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({})"), t580))
}

///|
let neutral_outer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_OUTER")

///|
/// `NEUTRAL_OUTER`
pub fn neutral_outer() -> @kernel.Thm {
  neutral_outer_c.get()
}

///|
/// OUTERMORPHISM_MBASIS
fn step_121() -> Unit raise {
  let t584 = @simp.simp_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vsum_delta(), @sets.in_elim_thm(), @vectors.vector_mul_lid()]))
  let t583 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t582 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t581 = @simp.simp_tac(@list.List([mbasis_component()]))
  let t585 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([outermorphism()])), t581), t582), t583), t584)
  outermorphism_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)))) → (outermorphism : ((Cart[Real, M]) -> Cart[Real, N], Cart[Real, Multivector[M]]) -> Cart[Real, Multivector[N]])(f, (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[M]])(s)) == (seqiterate : ((Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]], (Num) -> Bool, (Num) -> Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((outer : (Cart[Real, Multivector[N]], Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]]), s, (o : ((Cart[Real, N]) -> Cart[Real, Multivector[N]], (Num) -> Cart[Real, N], Num) -> Cart[Real, Multivector[N]])((multivec : (Cart[Real, N]) -> Cart[Real, Multivector[N]]), (o : ((Cart[Real, M]) -> Cart[Real, N], (Num) -> Cart[Real, M], Num) -> Cart[Real, N])(f, (basis : (Num) -> Cart[Real, M]))))"), t585))
}

///|
let outermorphism_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERMORPHISM_MBASIS")

///|
/// `OUTERMORPHISM_MBASIS`
pub fn outermorphism_mbasis() -> @kernel.Thm {
  outermorphism_mbasis_c.get()
}

///|
/// OUTERMORPHISM_MBASIS_EMPTY
fn step_122() -> Unit raise {
  let t586 = @simp.rewrite_tac(@list.List([neutral_outer()]))
  let t587 = @tactics.then_tac(@simp.simp_tac(@list.List([outermorphism_mbasis(), @sets.empty_subset(), seqiterate_clauses()])), t586)
  outermorphism_mbasis_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, _], outermorphism(f, mbasis({})) == mbasis({})"), t587))
}

///|
let outermorphism_mbasis_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERMORPHISM_MBASIS_EMPTY")

///|
/// `OUTERMORPHISM_MBASIS_EMPTY`
pub fn outermorphism_mbasis_empty() -> @kernel.Thm {
  outermorphism_mbasis_empty_c.get()
}

///|
/// reversion
fn step_123() -> Unit raise {
  reversion_c.set(@pair.new_definition(@term_syntax.parse_term("(reversion : (Cart[Real, Multivector[N]]) -> Cart[Real, Multivector[N]])((x : Cart[Real, Multivector[N]])) == lambdas((s : (Num) -> Bool) => pow(-real_of_num(1), DIV(CARD(s) * (CARD(s) - 1), 2)) * op_dollar_dollar(x, s))")))
}

///|
let reversion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reversion")

///|
/// `reversion`
pub fn reversion() -> @kernel.Thm {
  reversion_c.get()
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
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
}
