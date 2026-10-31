// Translated from upstream 100/lagrange.ml; edit this file directly.

///|
/// group
fn step_1() -> Unit raise {
  group_c.set(@pair.new_definition(@term_syntax.parse_term("(group : (((A) -> Bool, (A, A) -> A, (A) -> A, A)) -> Bool)(((g : (A) -> Bool), (op_star_star : (A, A) -> A), (i : (A) -> A), (e : A))) == (IN(e, g) && (∀ x : A, IN(x, g) → IN(i(x), g)) && (∀ x : A, ∀ y : A, IN(x, g) && IN(y, g) → IN(op_star_star(x, y), g)) && (∀ x : A, ∀ y : A, ∀ z : A, IN(x, g) && IN(y, g) && IN(z, g) → op_star_star(x, op_star_star(y, z)) == op_star_star(op_star_star(x, y), z)) && (∀ x : A, IN(x, g) → op_star_star(x, e) == x && op_star_star(e, x) == x) && (∀ x : A, IN(x, g) → op_star_star(x, i(x)) == e && op_star_star(i(x), x) == e))")))
}

///|
let group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("group")

///|
/// `group`
pub fn group() -> @kernel.Thm {
  group_c.get()
}

///|
/// subgroup
fn step_2() -> Unit raise {
  subgroup_c.set(@pair.new_definition(@term_syntax.parse_term("(subgroup : ((A) -> Bool, ((A) -> Bool, (A, A) -> A, (A) -> A, A)) -> Bool)((h : (A) -> Bool), ((g : (A) -> Bool), (op_star_star : (A, A) -> A), (i : (A) -> A), (e : A))) == (SUBSET(h, g) && group((h, op_star_star, i, e)))")))
}

///|
let subgroup_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subgroup")

///|
/// `subgroup`
pub fn subgroup() -> @kernel.Thm {
  subgroup_c.get()
}

///|
/// GROUP_LAGRANGE_COSETS
fn step_3() -> Unit raise {
  let t333 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t332 = @tactics.exists_tac(@term_syntax.parse_term("(g : (A) -> Bool)"))
  let t331 = @tactics.match_mp_tac(@sets.finite_subset())
  let t330 = @tactics.match_mp_tac(@sets.card_product())
  let t328 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t327 = @tactics.exists_tac(@term_syntax.parse_term("(g : (A) -> Bool)"))
  let t326 = @tactics.match_mp_tac(@sets.finite_subset())
  let t325 = @tactics.match_mp_tac(@sets.finite_product())
  let t323 = @meson.asm_meson_tac(@list.List([]))
  let t322 = @simp.asm_rewrite_tac(@list.List([]))
  let t321 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s319 = @tactics.mp_tac(x318)
    fn(x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s319(x320)
    }
  })))
  let t317 = @tactics.repeat_tac(@tactics.gen_tac)
  let t316 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t315 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t324 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_thm()])), t315), t316), t317), t321), t322), t323), @tactics.all_tac])
  let t329 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_image_inj()), @tactics.conj_tac), t324), t325), @tactics.conj_tac), t326), t327), t328), @tactics.all_tac])
  let t314 = @tactics.exists_tac(@term_syntax.parse_term("CARD({((a : A), (x : A)) | IN(a, (q : (A) -> Bool)) && IN(x, (h : (A) -> Bool))})"))
  let t313 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t311 = @meson.asm_meson_tac(@list.List([]))
  let t310 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc(), @simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(@theorems.unwind_thm1())]))
  let t309 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t308 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t307 = @simp.rewrite_tac(@list.List([@pair.exists_pair_thm()]))
  let t312 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t307), t308), t309), t310), t311), @tactics.all_tac])
  let t306 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (A) -> Bool) == IMAGE(GABS((f : ((A, A)) -> A) => ∀ a : A, ∀ x : A, GEQ(f((a, x)), (op_star_star : (A, A) -> A)(a, x))), {((a : A), (x : A)) | IN(a, (q : (A) -> Bool)) && IN(x, (h : (A) -> Bool))})"), fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s304 = @tactics.subst1_tac(x303)
    fn(x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s304(x305)
    }
  })
  let t301 = @meson.asm_meson_tac(@list.List([]))
  let t300 = @tactics.disch_then(fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s297 = @tactics.subst1_tac(x296)
      fn(x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s297(x298)
      }
    })(@equal.sym(x299))
  })
  let t292 = @term_syntax.parse_term("(op_star_star : (A, A) -> A)")
  let t289 = @term_syntax.parse_term("(i : (A) -> A)((x' : A))")
  let t295 = @tactics.disch_then(fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s285 = @tactics.mp_tac(x284)
        fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s285(x286)
        }
      })((fn(x290 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x287 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x288 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x287, x288)
          }
        })(x290)(t289)
      })(x291))
    })(((x293 : @kernel.Thm) => @equal.ap_term(t292, x293))(x294))
  })
  let t283 = @tactics.undisch_tac(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((a' : A), (x' : A)) == op_star_star((a : A), (x : A))"))
  let t282 = @simp.asm_simp_tac(@list.List([]))
  let t281 = @tactics.exists_tac(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((x : A), (i : (A) -> A)((x' : A)))"))
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t279 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t278 = @simp.expand_tac("coset")
  let t277 = @simp.asm_rewrite_tac(@list.List([]))
  let t276 = @tactics.first_assum(@tactics.match_mp_tac)
  let t275 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t274 = @tactics.disch_then(@tactics.conjuncts_then(fn(x271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s272 = @tactics.subst_all_tac(x271)
    fn(x273 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s272(x273)
    }
  }))
  let t269 = @simp.asm_simp_tac(@list.List([]))
  let t268 = @tactics.first_assum(@tactics.match_mp_tac)
  let t270 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.conv_tac(@equal.sym_conv)), t268), t269), @tactics.all_tac])
  let t267 = @tactics.subgoal_then(@term_syntax.parse_term("(coset : (A, A) -> Bool)((a1 : A)) == coset((a : A)) && coset((a2 : A)) == coset((a' : A))"), fn(x264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s265 = @tactics.mp_tac(x264)
    fn(x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s265(x266)
    }
  })
  let t263 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t262 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")))
  let t260 = @meson.asm_meson_tac(@list.List([]))
  let t261 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t260), @tactics.all_tac])
  let t259 = @tactics.subgoal_then(@term_syntax.parse_term("IN((a : A), (g : (A) -> Bool)) && IN((a' : A), g)"), @tactics.strip_assume_tac)
  let t257 = @tactics.x_choose_then(@term_syntax.parse_term("(a2 : A)"))(@tactics.strip_assume_tac)
  let t258 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(a1 : A)"))(@tactics.strip_assume_tac), t257))
  let t256 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((c : Bool) → (a : Bool) && (b : Bool) → (d : Bool)) → a && b && c → d")))
  let t255 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t254 = @simp.expand_tac("q")
  let t302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t254), t255), t256), @tactics.strip_tac), t258), t259), t261), t262), @tactics.conj_tac), t263), t267), t270), t274), t275), @tactics.ap_term_tac), t276), t277), t278), t279), t280), t281), t282), t283), t295), t300), t301), @tactics.all_tac])
  let t253 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ x : A, ∀ a' : A, ∀ x' : A, IN(a, (q : (A) -> Bool)) && IN(a', q) && IN(x, (h : (A) -> Bool)) && IN(x', h) && (op_star_star : (A, A) -> A)(a', x') == op_star_star(a, x) → a' == a && x' == x"), fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s251 = @tactics.assume_tac(x250)
    fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s251(x252)
    }
  })
  let t248 = @meson.asm_meson_tac(@list.List([]))
  let t247 = @simp.asm_rewrite_tac(@list.List([]))
  let t246 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t249 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("q")), t246), @tactics.strip_tac), t247), t248), @tactics.all_tac])
  let t245 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, IN(a, (q : (A) -> Bool)) → IN(a, (g : (A) -> Bool))"), fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s243 = @tactics.assume_tac(x242)
    fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s243(x244)
    }
  })
  let t240 = @simp.rewrite_tac(@list.List([@sets.in_(), @class.select_ax()]))
  let t239 = @simp.asm_rewrite_tac(@list.List([]))
  let t235 = @term_syntax.parse_term("(a : A)")
  let t238 = @tactics.disch_then(fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s233 = @tactics.mp_tac(x232)
      fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s233(x234)
      }
    })(((x236 : @kernel.Thm) => @bool.spec(t235, x236))(x237))
  })
  let t231 = @tactics.undisch_tac(@term_syntax.parse_term("∀ a : A, IN(a, (g : (A) -> Bool)) → IN(a, (coset : (A, A) -> Bool)(a))"))
  let t241 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t231), t238), t239), t240), @tactics.all_tac])
  let t230 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, IN(a, (g : (A) -> Bool)) → IN(select((coset : (A, A) -> Bool)(a)), coset(a))"), fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s228 = @tactics.assume_tac(x227)
    fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s228(x229)
    }
  })
  let t225 = @meson.meson_tac(@list.List([]))
  let t222 = @term_syntax.parse_term("∀ a : A, ∀ b : A, IN(a, (g : (A) -> Bool)) && IN(b, g) && IN(a, (coset : (A, A) -> Bool)(b)) → IN(b, coset(a))")
  let t223 = @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, IN(a, (coset : (A, A) -> Bool)(b)) && IN(b, coset(c)) && IN(c, (g : (A) -> Bool)) → IN(a, coset(c))")
  let t224 = @tactics.map_every(fn(x219 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s220 = @tactics.undisch_tac(x219)
    fn(x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s220(x221)
    }
  }, @list.List([@term_syntax.parse_term("∀ a : A, ∀ b : A, IN(a, (coset : (A, A) -> Bool)(b)) → IN(a, (g : (A) -> Bool))"), t223, t222]))
  let t226 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension()])), t224), t225), @tactics.all_tac])
  let t218 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ b : A, IN(a, (coset : (A, A) -> Bool)(b)) && IN(b, (g : (A) -> Bool)) → coset(a) == coset(b)"), fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s216 = @tactics.assume_tac(x215)
    fn(x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s216(x217)
    }
  })
  let t213 = @meson.meson_tac(@list.List([]))
  let t212 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t214 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("coset"), t212), t213), @tactics.all_tac])
  let t211 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ b : A, IN(a, (coset : (A, A) -> Bool)(b)) → IN(a, (g : (A) -> Bool))"), fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s209 = @tactics.assume_tac(x208)
    fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s209(x210)
    }
  })
  let t206 = @meson.asm_meson_tac(@list.List([]))
  let t205 = @simp.asm_rewrite_tac(@list.List([]))
  let t204 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t203 = @simp.expand_tac("coset")
  let t207 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t203), t204), @tactics.strip_tac), t205), t206), @tactics.all_tac])
  let t202 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, IN(a, (coset : (A, A) -> Bool)(b)) && IN(b, coset(c)) && IN(c, (g : (A) -> Bool)) → IN(a, coset(c))"), fn(x199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s200 = @tactics.assume_tac(x199)
    fn(x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s200(x201)
    }
  })
  let t197 = @meson.asm_meson_tac(@list.List([]))
  let t196 = @simp.asm_rewrite_tac(@list.List([]))
  let t195 = @tactics.exists_tac(@term_syntax.parse_term("(i : (A) -> A)((c : A))"))
  let t194 = @simp.asm_rewrite_tac(@list.List([]))
  let t193 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : A)"))(@tactics.strip_assume_tac))
  let t192 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s187 = @tactics.assume_tac(x186)
    fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s187(x188)
    }
  }, fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s190 = @tactics.mp_tac(x189)
    fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s190(x191)
    }
  })))
  let t185 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t184 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t183 = @simp.expand_tac("coset")
  let t198 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t183), t184), t185), t192), t193), t194), t195), t196), t197), @tactics.all_tac])
  let t182 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ b : A, IN(a, (g : (A) -> Bool)) && IN(b, g) && IN(a, (coset : (A, A) -> Bool)(b)) → IN(b, coset(a))"), fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s180 = @tactics.assume_tac(x179)
    fn(x181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s180(x181)
    }
  })
  let t178 = @simp.abbrev_tac(@term_syntax.parse_term("(q : (A) -> Bool) == {(c : A) | ∃ a : A, IN(a, (g : (A) -> Bool)) && c == select((coset : (A, A) -> Bool)(a))}"))
  let t176 = @meson.asm_meson_tac(@list.List([]))
  let t175 = @simp.asm_simp_tac(@list.List([]))
  let t174 = @tactics.exists_tac(@term_syntax.parse_term("(i : (A) -> A)((c : A))"))
  let t173 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s171 = @tactics.assume_tac(x170)
    fn(x172 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s171(x172)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(c : A)"))(@tactics.strip_assume_tac)))
  let t169 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t168 = @simp.abbrev_tac(@term_syntax.parse_term("(C : A) == select((coset : (A, A) -> Bool)((b : A)))"))
  let t167 = @simp.rewrite_tac(@list.List([]))
  let t166 = @tactics.first_assum(fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x153
    @simp.gen_rewrite_tac(fn(x165 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x161 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x155 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s156 = @equal.land_conv(x155)
          fn(x157 : @kernel.Term) -> @kernel.Thm raise {
            s156(x157)
          }
        })((fn(x158 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s159 = @equal.rand_conv(x158)
          fn(x160 : @kernel.Term) -> @kernel.Thm raise {
            s159(x160)
          }
        })(x161))
      })((fn(x162 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s163 = @equal.rator_conv(x162)
        fn(x164 : @kernel.Term) -> @kernel.Thm raise {
          s163(x164)
        }
      })(x165))
    }, @list.List([@equal.sym(th_3)]))
  })
  let t151 = @meson.asm_meson_tac(@list.List([@sets.in_()]))
  let t150 = @tactics.match_mp_tac(@class.select_ax())
  let t152 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_()])), t150), t151), @tactics.all_tac])
  let t149 = @tactics.subgoal_then(@term_syntax.parse_term("IN(select((coset : (A, A) -> Bool)((b : A))), coset(b))"), fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s147 = @tactics.mp_tac(x146)
    fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s147(x148)
    }
  })
  let t144 = @simp.asm_rewrite_tac(@list.List([]))
  let t143 = @tactics.exists_tac(@term_syntax.parse_term("(b : A)"))
  let t145 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm()])), t143), t144), @tactics.all_tac])
  let t142 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()]))
  let t141 = @tactics.exists_tac(@term_syntax.parse_term("select((coset : (A, A) -> Bool)((b : A)))"))
  let t177 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(b : A)")), @tactics.disch_tac), t141), t142), @tactics.conj_tac), t145), t149), t152), t166), t167), t168), t169), t173), t174), t175), t176), @tactics.all_tac])
  let t140 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → b && a")))
  let t139 = @tactics.exists_tac(@term_syntax.parse_term("{(c : A) | ∃ a : A, IN(a, (g : (A) -> Bool)) && c == select((coset : (A, A) -> Bool)(a))}"))
  let t137 = @meson.asm_meson_tac(@list.List([]))
  let t136 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t135 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((i : (A) -> A)((b : A)), (a : A)) == op_star_star((z : A), i((y : A)))"), fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s133 = @tactics.assume_tac(x132)
    fn(x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s133(x134)
    }
  })
  let t131 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t130 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)(op_star_star((i : (A) -> A)((b : A)), (a : A)), (e : A)) == op_star_star((z : A), i((y : A)))"), fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s128 = @tactics.assume_tac(x127)
    fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s128(x129)
    }
  })
  let t126 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t125 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)(op_star_star((i : (A) -> A)((b : A)), (a : A)), op_star_star((y : A), i(y))) == op_star_star((z : A), i(y))"), fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s123 = @tactics.assume_tac(x122)
    fn(x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s123(x124)
    }
  })
  let t121 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t120 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)(op_star_star(op_star_star((i : (A) -> A)((b : A)), (a : A)), (y : A)), i(y)) == op_star_star((z : A), i(y))"), fn(x117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s118 = @tactics.assume_tac(x117)
    fn(x119 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s118(x119)
    }
  })
  let t116 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t115 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)(op_star_star((i : (A) -> A)((b : A)), (a : A)), (y : A)) == (z : A)"), fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s113 = @tactics.assume_tac(x112)
    fn(x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s113(x114)
    }
  })
  let t111 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t110 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((i : (A) -> A)((b : A)), op_star_star((a : A), (y : A))) == (z : A)"), fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s108 = @tactics.assume_tac(x107)
    fn(x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s108(x109)
    }
  })
  let t106 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t105 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((i : (A) -> A)((b : A)), op_star_star((a : A), (y : A))) == op_star_star((e : A), (z : A))"), fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s103 = @tactics.assume_tac(x102)
    fn(x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s103(x104)
    }
  })
  let t101 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t100 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((i : (A) -> A)((b : A)), op_star_star((a : A), (y : A))) == op_star_star(i(b), op_star_star(b, (z : A)))"), fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s98 = @tactics.assume_tac(x97)
    fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s98(x99)
    }
  })
  let t95 = @tactics.x_choose_then(@term_syntax.parse_term("(z : A)"))(@tactics.strip_assume_tac)
  let t96 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(y : A)"))(@tactics.strip_assume_tac), t95))
  let t94 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s89 = @tactics.assume_tac(x88)
    fn(x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s89(x90)
    }
  }, fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s92 = @tactics.mp_tac(x91)
    fn(x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s92(x93)
    }
  }))
  let t87 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && a && (c : Bool)) == (a && b && c)"))]))
  let t86 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t85 = @simp.expand_tac("coset")
  let t84 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t83 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_inter()]))
  let t81 = @simp.asm_simp_tac(@list.List([]))
  let t80 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : A, IN(x, (h : (A) -> Bool)) → (op_star_star : (A, A) -> A)((b : A), op_star_star(op_star_star((i : (A) -> A)(b), (a : A)), x)) == op_star_star(a, x) && op_star_star(a, op_star_star(i(op_star_star(i(b), a)), x)) == op_star_star(b, x)"), fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x76
    let t79 = @meson.asm_meson_tac(@list.List([th_2]))
    let t78 = @simp.asm_rewrite_tac(@list.List([]))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.repeat_tac(@tactics.strip_tac)), t78), t79)
  })
  let t75 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t82 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @simp.expand_tac("coset")), t75), @tactics.gen_tac), @tactics.ap_term_tac), t80), t81), @tactics.all_tac])
  let t74 = @class.asm_cases_tac(@term_syntax.parse_term("IN((op_star_star : (A, A) -> A)((i : (A) -> A)((b : A)), (a : A)), (h : (A) -> Bool))"))
  let t138 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t74), t82), @tactics.disj2_tac), t83), t84), t85), t86), t87), t94), t96), t100), t101), t105), t106), t110), t111), t115), t116), t120), t121), t125), t126), t130), t131), t135), t136), t137), @tactics.all_tac])
  let t73 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ b : A, IN(a, (g : (A) -> Bool)) && IN(b, g) → (coset : (A, A) -> Bool)(a) == coset(b) || INTER(coset(a), coset(b)) == EMPTY"), fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s71 = @tactics.assume_tac(x70)
    fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s71(x72)
    }
  })
  let t68 = @meson.asm_meson_tac(@list.List([]))
  let t67 = @tactics.exists_tac(@term_syntax.parse_term("(i : (A) -> A)((x : A))"))
  let t66 = @tactics.first_assum(@tactics.match_mp_tac)
  let t69 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t66), t67), t68), @tactics.all_tac])
  let t65 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : A, IN(x, (g : (A) -> Bool)) → (i : (A) -> A)(i(x)) == x"), fn(x62 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s63 = @tactics.assume_tac(x62)
    fn(x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s63(x64)
    }
  })
  let t60 = @meson.asm_meson_tac(@list.List([]))
  let t59 = @tactics.exists_tac(@term_syntax.parse_term("(op_star_star : (A, A) -> A)(op_star_star((x : A), op_star_star((y : A), (i : (A) -> A)(y))), i(x))"))
  let t58 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t57 = @simp.asm_simp_tac(@list.List([]))
  let t56 = @tactics.exists_tac(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((x : A), (y : A))"))
  let t55 = @tactics.first_assum(@tactics.match_mp_tac)
  let t61 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t55), t56), t57), t58), t59), t60), @tactics.all_tac])
  let t54 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : A, ∀ y : A, IN(x, (g : (A) -> Bool)) && IN(y, g) → (i : (A) -> A)((op_star_star : (A, A) -> A)(x, y)) == op_star_star(i(y), i(x))"), fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s52 = @tactics.assume_tac(x51)
    fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s52(x53)
    }
  })
  let t49 = @meson.asm_meson_tac(@list.List([]))
  let t48 = @simp.asm_rewrite_tac(@list.List([]))
  let t47 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t45 = @meson.asm_meson_tac(@list.List([]))
  let t44 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image(), @sets.in_elim_thm()]))
  let t46 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("coset"), t44), t45), @tactics.all_tac])
  let t43 = @tactics.subgoal_then(@term_syntax.parse_term("(coset : (A, A) -> Bool)((a : A)) == IMAGE((x : A) => (op_star_star : (A, A) -> A)(a, x), (h : (A) -> Bool))"), fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s41 = @tactics.subst1_tac(x40)
    fn(x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s41(x42)
    }
  })
  let t50 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t43), t46), t47), t48), t49), @tactics.all_tac])
  let t39 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, IN(a, (g : (A) -> Bool)) → CARD((coset : (A, A) -> Bool)(a)) == CARD((h : (A) -> Bool))"), fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @tactics.assume_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  })
  let t34 = @meson.asm_meson_tac(@list.List([]))
  let t33 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)(op_star_star((i : (A) -> A)((a : A)), a), (x : A)) == op_star_star(op_star_star(i(a), a), (y : A))"), fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x31
    @meson.asm_meson_tac(@list.List([th_1]))
  })
  let t30 = @tactics.subgoal_then(@term_syntax.parse_term("(op_star_star : (A, A) -> A)((e : A), (x : A)) == op_star_star(e, (y : A))"), fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x28
    @meson.asm_meson_tac(@list.List([th]))
  })
  let t35 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t30), t33), t34), @tactics.all_tac])
  let t27 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ x : A, ∀ y : A, IN(a, (g : (A) -> Bool)) && IN(x, g) && IN(y, g) && (op_star_star : (A, A) -> A)(a, x) == op_star_star(a, y) → x == y"), fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s25 = @tactics.assume_tac(x24)
    fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s25(x26)
    }
  })
  let t22 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @sets.subset()]))
  let t21 = @tactics.exists_tac(@term_syntax.parse_term("(g : (A) -> Bool)"))
  let t20 = @tactics.match_mp_tac(@sets.finite_subset())
  let t23 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("coset")), t20), t21), t22), @tactics.all_tac])
  let t19 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, FINITE((coset : (A, A) -> Bool)(a))"), fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s17 = @tactics.assume_tac(x16)
    fn(x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s17(x18)
    }
  })
  let t15 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_subset(), @sets.subset()])), @tactics.all_tac])
  let t14 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((h : (A) -> Bool))"), fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = @tactics.assume_tac(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  })
  let t9 = @meson.asm_meson_tac(@list.List([]))
  let t8 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t7 = @simp.expand_tac("coset")
  let t10 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t7), t8), t9), @tactics.all_tac])
  let t6 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, IN(a, (g : (A) -> Bool)) → IN(a, (coset : (A, A) -> Bool)(a))"), fn(x3 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4 = @tactics.assume_tac(x3)
    fn(x5 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4(x5)
    }
  })
  let t2 = @simp.abbrev_tac(@term_syntax.parse_term("(coset : (A, A) -> Bool) == ((a : A) => {(b : A) | IN(b, (g : (A) -> Bool)) && (∃ x : A, IN(x, (h : (A) -> Bool)) && b == (op_star_star : (A, A) -> A)(a, x))})"))
  let t1 = @simp.rewrite_tac(@list.List([group(), subgroup(), @sets.subset()]))
  let t334 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), @tactics.strip_tac), t2), t6), t10), t14), t15), t19), t23), t27), t35), t39), t50), t54), t61), t65), t69), t73), t138), t139), t140), @tactics.conj_tac), t177), t178), @tactics.disch_tac), t182), t198), t202), t207), t211), t214), t218), t226), t230), t241), t245), t249), t253), t302), t306), t312), t313), t314), @tactics.conj_tac), t329), t330), @tactics.conj_tac), t331), t332), t333)
  group_lagrange_cosets_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (A) -> Bool, ∀ h : (A) -> Bool, ∀ `**` : (A, A) -> A, ∀ i : (A) -> A, ∀ e : A, group((g, `**`, i, e)) && subgroup(h, (g, `**`, i, e)) && FINITE(g) → (∃ q : (A) -> Bool, CARD(g) == CARD(q) * CARD(h) && (∀ b : A, IN(b, g) → (∃ a : A, ∃ x : A, IN(a, q) && IN(x, h) && b == `**`(a, x))))"), t334))
}

///|
let group_lagrange_cosets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GROUP_LAGRANGE_COSETS")

///|
/// `GROUP_LAGRANGE_COSETS`
pub fn group_lagrange_cosets() -> @kernel.Thm {
  group_lagrange_cosets_c.get()
}

///|
/// GROUP_LAGRANGE
fn step_4() -> Unit raise {
  let t341 = @meson.meson_tac(@list.List([@prime.divides_lmul(), @prime.divides_refl()]))
  let t338 = @drule.match_mp(group_lagrange_cosets())
  let t340 = @tactics.disch_then(fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s336 = @tactics.mp_tac(x335)
      fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s336(x337)
      }
    })(t338(x339))
  })
  let t342 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t340), t341)
  group_lagrange_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (A) -> Bool, ∀ h : (A) -> Bool, ∀ `**` : (A, A) -> A, ∀ i : (A) -> A, ∀ e : A, group((g, `**`, i, e)) && subgroup(h, (g, `**`, i, e)) && FINITE(g) → divides(CARD(h), CARD(g))"), t342))
}

///|
let group_lagrange_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GROUP_LAGRANGE")

///|
/// `GROUP_LAGRANGE`
pub fn group_lagrange() -> @kernel.Thm {
  group_lagrange_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
