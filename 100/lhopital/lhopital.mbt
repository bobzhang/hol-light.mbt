// Translated from upstream 100/lhopital.ml; edit this file directly.

///|
/// 100/lhopital.ml:7
fn step_1() -> Unit raise {
  @preterm.override_interface("-->", @term_syntax.parse_term("tends_real_real"))
}

///|
/// 100/lhopital.ml:9
fn step_2() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// MVT2
fn step_3() -> Unit raise {
  let t57 = @simp.asm_simp_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@analysis.diff_cmul()), @analysis.diff_sub()]))
  let t56 = @tactics.exists_tac(@term_syntax.parse_term("(z : Real)"))
  let t55 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(x) * ((g : (Real) -> Real)((b : Real)) - g((a : Real))) - g(x) * (f(b) - f(a))"))
  let t54 = @tactics.match_mp_tac(@analysis.diff_uniq())
  let t53 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_0())]))
  let t52 = @tactics.conv_tac(@equal.sym_conv)
  let t51 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t50 = @simp.asm_rewrite_tac(@list.List([]))
  let t48 = @term_syntax.parse_term("(g' : Real)")
  let t49 = @tactics.map_every(fn(x45 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s46 = @tactics.exists_tac(x45)
    fn(x47 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s46(x47)
    }
  }, @list.List([@term_syntax.parse_term("(f' : Real)"), t48]))
  let t42 = @term_syntax.parse_term("(g' : Real)")
  let t40 = @term_syntax.parse_term("(f' : Real)")
  let t44 = @tactics.disch_then(@tactics.conjuncts_then2((x41 : @kernel.Thm) => @tactics.x_choose_tac(t40, x41), (x43 : @kernel.Thm) => @tactics.x_choose_tac(t42, x43)))
  let t39 = @simp.asm_rewrite_tac(@list.List([@analysis.differentiable()]))
  let t35 = @term_syntax.parse_term("(z : Real)")
  let t38 = @tactics.disch_then(fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s33 = @tactics.mp_tac(x32)
      fn(x34 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s33(x34)
      }
    })(((x36 : @kernel.Thm) => @bool.spec(t35, x36))(x37))
  })
  let t31 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Real, (a : Real) < x && x < (b : Real) → differentiable((f : (Real) -> Real), x) && differentiable((g : (Real) -> Real), x)"))
  let t30 = @tactics.undisch_then(@term_syntax.parse_term("(l : Real) == real_of_num(0)"), fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s28 = @tactics.subst_all_tac(x27)
    fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s28(x29)
    }
  })
  let t26 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(l : Real)"))(@tactics.strip_assume_tac))
  let t25 = @simp.asm_simp_tac(@list.List([@realarith.real_entire(), @analysis.real_sub_0(), @analysis.real_lt_imp_ne()]))
  let t24 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((fb : Real) * ((gb : Real) - (ga : Real)) - gb * (fb - (fa : Real)) - (fa * (gb - ga) - ga * (fb - fa)) == (y : Real)) == (y == real_of_num(0))"))]))
  let t23 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)"))
  let t22 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t21 = @simp.gen_rewrite_tac(fn(x18 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s19 = @equal.land_conv(x18)
    fn(x20 : @kernel.Term) -> @kernel.Thm raise {
      s19(x20)
    }
  }, @list.List([@theorems.swap_exists_thm()]))
  let t16 = @simp.asm_simp_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@analysis.diff_cmul()), @analysis.diff_sub()]))
  let t15 = @tactics.exists_tac(@term_syntax.parse_term("(f' : Real) * ((g : (Real) -> Real)((b : Real)) - g((a : Real))) - (g' : Real) * ((f : (Real) -> Real)(b) - f(a))"))
  let t12 = @term_syntax.parse_term("(g' : Real)")
  let t10 = @term_syntax.parse_term("(f' : Real)")
  let t14 = @tactics.disch_then(@tactics.conjuncts_then2((x11 : @kernel.Thm) => @tactics.x_choose_tac(t10, x11), (x13 : @kernel.Thm) => @tactics.x_choose_tac(t12, x13)))
  let t9 = @simp.rewrite_tac(@list.List([@analysis.differentiable()]))
  let t8 = @tactics.disch_then(@tactics.ante_res_then(fn(x5 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s6 = @tactics.mp_tac(x5)
    fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s6(x7)
    }
  }))
  let t4 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t17 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@analysis.cont_sub(), @analysis.cont_mul(), @analysis.cont_const()])), t4), t8), t9), t14), t15), t16), @tactics.all_tac])
  let t1 = @term_syntax.parse_term("(b : Real)")
  let t2 = @term_syntax.parse_term("(a : Real)")
  let t3 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(x) * ((g : (Real) -> Real)((b : Real)) - g((a : Real))) - g(x) * (f(b) - f(a))"), t2, t1]), @analysis.mvt()))
  let t58 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3), @tactics.ants_tac), t17), t21), t22), t23), t24), t25), t26), t30), t31), t38), t39), t44), t49), t50), t51), t52), t53), t54), t55), t56), t57)
  mvt2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ a : Real, ∀ b : Real, a < b && (∀ x : Real, a <= x && x <= b → contl(f, x) && contl(g, x)) && (∀ x : Real, a < x && x < b → differentiable(f, x) && differentiable(g, x)) → (∃ z : Real, ∃ f' : Real, ∃ g' : Real, a < z && z < b && diffl(f, f', z) && diffl(g, g', z) && (f(b) - f(a)) * g' == (g(b) - g(a)) * f')"), t58))
}

///|
let mvt2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVT2")

///|
/// `MVT2`
pub fn mvt2() -> @kernel.Thm {
  mvt2_c.get()
}

///|
/// LHOPITAL_WEAK
fn step_4() -> Unit raise {
  let t228 = @meson.asm_meson_tac(@list.List([@analysis.diff_uniq()]))
  let t224 = @term_syntax.parse_term("(w : Real)")
  let t227 = @tactics.first_x_assum(fn(x226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s222 = @tactics.mp_tac(x221)
      fn(x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s222(x223)
      }
    })(((x225 : @kernel.Thm) => @bool.spec(t224, x225))(x226))
  })
  let t220 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Real)"))
  let t219 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t218 = @list.List([@meson.asm_meson_tac(@list.List([@analysis.differentiable(), @realarith.real_lt_trans(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (z : Real) && z < (c : Real) && abs(x - c) < (d : Real) → real_of_num(0) < abs(z - c) && abs(z - c) < d"))])), @tactics.all_tac])
  let t216 = @meson.asm_meson_tac(@list.List([@analysis.contl_lim(), @analysis.diff_cont(), @realarith.real_lt_trans(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (z : Real) && z < (c : Real) && z < c && abs(x - c) < (d : Real) → real_of_num(0) < abs(z - c) && abs(z - c) < d"))]))
  let t217 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x215 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x209 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s210 = @equal.land_conv(x209)
      fn(x211 : @kernel.Term) -> @kernel.Thm raise {
        s210(x211)
      }
    })((fn(x212 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s213 = @equal.rand_conv(x212)
      fn(x214 : @kernel.Term) -> @kernel.Thm raise {
        s213(x214)
      }
    })(x215))
  }, @list.List([@analysis.real_le_lt()]))), t216), @tactics.all_tac])
  let t208 = @simp.asm_rewrite_tac(@list.List([@class.not_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t206 = @term_syntax.parse_term("(c : Real)")
  let t207 = @term_syntax.parse_term("(x : Real)")
  let t229 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(g : (Real) -> Real)"), t207, t206]), @analysis.rolle())), t208), @tactics.conj_tac), t217), @tactics.conj_tac), t218), t219), t220), @tactics.strip_tac), t227), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t228)
  let t205 = @meson.asm_meson_tac(@list.List([@analysis.diff_uniq()]))
  let t201 = @term_syntax.parse_term("(w : Real)")
  let t204 = @tactics.first_x_assum(fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s199 = @tactics.mp_tac(x198)
      fn(x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s199(x200)
      }
    })(((x202 : @kernel.Thm) => @bool.spec(t201, x202))(x203))
  })
  let t197 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Real)"))
  let t196 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t195 = @list.List([@meson.asm_meson_tac(@list.List([@analysis.differentiable(), @realarith.real_lt_trans(), @calc_rat.real_arith(@term_syntax.parse_term("(c : Real) < (z : Real) && z < (x : Real) && abs(x - c) < (d : Real) → real_of_num(0) < abs(z - c) && abs(z - c) < d"))])), @tactics.all_tac])
  let t193 = @meson.asm_meson_tac(@list.List([@analysis.contl_lim(), @analysis.diff_cont(), @realarith.real_lt_trans(), @calc_rat.real_arith(@term_syntax.parse_term("(c : Real) < (z : Real) && z <= (x : Real) && abs(x - c) < (d : Real) → real_of_num(0) < abs(z - c) && abs(z - c) < d"))]))
  let t194 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac((x192 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x189 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s190 = @equal.land_conv(x189)
    fn(x191 : @kernel.Term) -> @kernel.Thm raise {
      s190(x191)
    }
  }, x192), @list.List([@analysis.real_le_lt()]))), t193), @tactics.all_tac])
  let t188 = @simp.asm_rewrite_tac(@list.List([@class.not_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t186 = @term_syntax.parse_term("(x : Real)")
  let t187 = @term_syntax.parse_term("(c : Real)")
  let t230 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(g : (Real) -> Real)"), t187, t186]), @analysis.rolle())), t188), @tactics.conj_tac), t194), @tactics.conj_tac), t195), t196), t197), @tactics.strip_tac), t204), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t205), t229])
  let t185 = @tactics.repeat_tac(@tactics.strip_tac)
  let t182 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < abs((x : Real) - (c : Real)) → c < x || x < c")))
  let t184 = @tactics.disch_then(fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s180 = @tactics.mp_tac(x179)
      fn(x181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s180(x181)
      }
    })(t182(x183))
  })
  let t178 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("real_of_num(0) < abs((x : Real) - (c : Real))")))
  let t177 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_trans()])), @tactics.all_tac])
  let t176 = @simp.asm_rewrite_tac(@list.List([]))
  let t175 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((gz : Real) == real_of_num(0)) && !((gx : Real) == real_of_num(0)) && (fx : Real) * gz == (fz : Real) * gx → fz / gz == fx / gx")))
  let t174 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) → abs(x - (l : Real)) < (e : Real) → abs(y - l) < e")))
  let t170 = @term_syntax.parse_term("(z : Real)")
  let t173 = @tactics.disch_then(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s168 = @tactics.mp_tac(x167)
      fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s168(x169)
      }
    })(((x171 : @kernel.Thm) => @bool.spec(t170, x171))(x172))
  })
  let t166 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Real)"))(@tactics.strip_assume_tac))
  let t162 = @term_syntax.parse_term("(x : Real)")
  let t165 = @tactics.remove_then("*", fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s160 = @tactics.mp_tac(x159)
      fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s160(x161)
      }
    })(((x163 : @kernel.Thm) => @bool.spec(t162, x163))(x164))
  })
  let t158 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < abs(x - (c : Real)) && abs(x - c) < (r : Real) → abs((f' : (Real) -> Real)(x) / (g' : (Real) -> Real)(x) - (L : Real)) < (e : Real)"))
  let t157 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t155 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Real)"))
  let t154 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t153 = @simp.asm_rewrite_tac(@list.List([]))
  let t151 = @term_syntax.parse_term("(r : Real)")
  let t152 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Real)"), t151]), @real.real_down2()))
  let t150 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Real)"))(@tactics.strip_assume_tac))
  let t149 = @simp.asm_rewrite_tac(@list.List([]))
  let t145 = @term_syntax.parse_term("(e : Real)")
  let t148 = @tactics.disch_then(fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s143 = @tactics.mp_tac(x142)
      fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s143(x144)
      }
    })(((x146 : @kernel.Thm) => @bool.spec(t145, x146))(x147))
  })
  let t141 = @simp.rewrite_tac(@list.List([@analysis.lim_v1()]))
  let t140 = @tactics.undisch_tac(@term_syntax.parse_term("tends_real_real((x : Real) => (f' : (Real) -> Real)(x) / (g' : (Real) -> Real)(x), (L : Real), (c : Real))"))
  let t139 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t138 = @simp.rewrite_tac(@list.List([@analysis.lim_v1()]))
  let t133 = @meson.asm_meson_tac(@list.List([@analysis.diff_uniq(), @calc_rat.real_arith(@term_syntax.parse_term("(c : Real) - (d : Real) < (x : Real) && x < (z : Real) && z < c → real_of_num(0) < abs(z - c) && abs(z - c) < d"))]))
  let t134 = @list.List([@calc_rat.asm_real_arith_tac, @calc_rat.asm_real_arith_tac, @tactics.then_tac(@tactics.first_x_assum(fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x130
    let t132 = @tactics.match_mp_tac(@theorems.eq_imp())
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th_1), t132), @tactics.binop_tac)
  }), t133)])
  let t129 = @tactics.repeat_tac(@tactics.strip_tac)
  let t128 = @simp.gen_rewrite_tac((x127 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(4, fn(x124 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s125 = @equal.rand_conv(x124)
    fn(x126 : @kernel.Term) -> @kernel.Thm raise {
      s125(x126)
    }
  }, x127), @list.List([@realax.real_mul_sym()]))
  let t123 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t122 = @simp.asm_rewrite_tac(@list.List([@analysis.real_sub_lzero(), @calc_int.real_mul_lneg(), @real.real_eq_neg2()]))
  let t120 = @meson.asm_meson_tac(@list.List([@analysis.contl_lim(), @analysis.diff_cont(), @analysis.real_lt_imp_le(), @analysis.differentiable(), @calc_rat.real_arith(@term_syntax.parse_term("(c : Real) - (d : Real) < (x : Real) && x <= (z : Real) && z < c → real_of_num(0) < abs(z - c) && abs(z - c) < d"))]))
  let t119 = @simp.gen_rewrite_tac(fn(x118 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x114 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x110 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x104 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s105 = @equal.land_conv(x104)
          fn(x106 : @kernel.Term) -> @kernel.Thm raise {
            s105(x106)
          }
        })((fn(x107 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s108 = @equal.binder_conv(x107)
          fn(x109 : @kernel.Term) -> @kernel.Thm raise {
            s108(x109)
          }
        })(x110))
      })((fn(x111 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s112 = @equal.land_conv(x111)
        fn(x113 : @kernel.Term) -> @kernel.Thm raise {
          s112(x113)
        }
      })(x114))
    })((fn(x115 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s116 = @equal.rand_conv(x115)
      fn(x117 : @kernel.Term) -> @kernel.Thm raise {
        s116(x117)
      }
    })(x118))
  }, @list.List([@analysis.real_le_lt()]))
  let t121 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t119), t120), @tactics.all_tac])
  let t101 = @term_syntax.parse_term("(c : Real)")
  let t102 = @term_syntax.parse_term("(x : Real)")
  let t103 = @term_syntax.parse_term("(g : (Real) -> Real)")
  let t135 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t103, t102, t101]), mvt2())), @tactics.ants_tac), t121), t122), t123), @tactics.gen_tac), t128), t129), t134)
  let t99 = @meson.asm_meson_tac(@list.List([@analysis.diff_uniq(), @calc_rat.real_arith(@term_syntax.parse_term("(c : Real) < (z : Real) && z < (x : Real) && x < c + (d : Real) → real_of_num(0) < abs(z - c) && abs(z - c) < d"))]))
  let t100 = @list.List([@calc_rat.asm_real_arith_tac, @calc_rat.asm_real_arith_tac, @tactics.then_tac(@tactics.first_x_assum(fn(x96 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x96
    let t98 = @tactics.match_mp_tac(@theorems.eq_imp())
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th), t98), @tactics.binop_tac)
  }), t99)])
  let t95 = @tactics.repeat_tac(@tactics.strip_tac)
  let t94 = @simp.gen_rewrite_tac((x93 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(4, fn(x90 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s91 = @equal.rand_conv(x90)
    fn(x92 : @kernel.Term) -> @kernel.Thm raise {
      s91(x92)
    }
  }, x93), @list.List([@realax.real_mul_sym()]))
  let t89 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t88 = @simp.asm_rewrite_tac(@list.List([@analysis.real_sub_rzero()]))
  let t86 = @meson.asm_meson_tac(@list.List([@analysis.contl_lim(), @analysis.diff_cont(), @analysis.real_lt_imp_le(), @analysis.differentiable(), @calc_rat.real_arith(@term_syntax.parse_term("(c : Real) < (z : Real) && z <= (x : Real) && x < c + (d : Real) → real_of_num(0) < abs(z - c) && abs(z - c) < d"))]))
  let t85 = @simp.gen_rewrite_tac(fn(x84 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x79 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x73 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s74 = @equal.land_conv(x73)
        fn(x75 : @kernel.Term) -> @kernel.Thm raise {
          s74(x75)
        }
      })((fn(x76 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s77 = @equal.binder_conv(x76)
        fn(x78 : @kernel.Term) -> @kernel.Thm raise {
          s77(x78)
        }
      })(x79))
    })(((x83 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x80 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s81 = @equal.land_conv(x80)
      fn(x82 : @kernel.Term) -> @kernel.Thm raise {
        s81(x82)
      }
    }, x83))(x84))
  }, @list.List([@analysis.real_le_lt()]))
  let t87 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t85), t86), @tactics.all_tac])
  let t70 = @term_syntax.parse_term("(x : Real)")
  let t71 = @term_syntax.parse_term("(c : Real)")
  let t72 = @term_syntax.parse_term("(g : (Real) -> Real)")
  let t136 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t72, t71, t70]), mvt2())), @tactics.ants_tac), t87), t88), t89), @tactics.gen_tac), t94), t95), t100), t135])
  let t67 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < abs((x : Real) - (c : Real)) && abs(x - c) < (d : Real) → c < x && x < c + d || c - d < x && x < c")))
  let t69 = @tactics.disch_then(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s65 = @tactics.mp_tac(x64)
      fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s65(x66)
      }
    })(t67(x68))
  })
  let t137 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t69), @tactics.strip_tac), t136), @tactics.all_tac])
  let t63 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < abs(x - (c : Real)) && abs(x - c) < (d : Real) → (∃ z : Real, real_of_num(0) < abs(z - c) && abs(z - c) < abs(x - c) && (f : (Real) -> Real)(x) * (g' : (Real) -> Real)(z) == (f' : (Real) -> Real)(z) * (g : (Real) -> Real)(x))"), fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = ((x59 : @kernel.Thm) => @tactics.label_tac("*", x59))(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  })
  let t231 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t63), t137), t138), t139), @tactics.disch_tac), t140), t141), t148), t149), t150), t152), t153), t154), t155), @tactics.strip_tac), t156), t157), @tactics.strip_tac), t158), t165), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t166), t173), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t174), t175), t176), @tactics.conj_tac), t177), t178), t184), t185), t230)
  lhopital_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ f' : (Real) -> Real, ∀ g' : (Real) -> Real, ∀ c : Real, ∀ L : Real, ∀ d : Real, real_of_num(0) < d && (∀ x : Real, real_of_num(0) < abs(x - c) && abs(x - c) < d → diffl(f, f'(x), x) && diffl(g, g'(x), x) && !(g'(x) == real_of_num(0))) && f(c) == real_of_num(0) && g(c) == real_of_num(0) && tends_real_real(f, real_of_num(0), c) && tends_real_real(g, real_of_num(0), c) && tends_real_real((x : Real) => f'(x) / g'(x), L, c) → tends_real_real((x : Real) => f(x) / g(x), L, c)"), t231))
}

///|
let lhopital_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LHOPITAL_WEAK")

///|
/// `LHOPITAL_WEAK`
pub fn lhopital_weak() -> @kernel.Thm {
  lhopital_weak_c.get()
}

///|
/// LHOPITAL
fn step_5() -> Unit raise {
  let t256 = @simp.asm_rewrite_tac(@list.List([@analysis.real_sub_refl(), @calc_int.real_abs_num()]))
  let t255 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < abs((x : Real) - (c : Real)) && real_of_num(0) < abs((z : Real)) && abs(z) < abs(x - c) → !(x + z == c)"))]))
  let t254 = @simp.rewrite_tac(@list.List([@analysis.real_sub_rzero()]))
  let t253 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real) - (c : Real))"))
  let t252 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t251 = @simp.rewrite_tac(@list.List([@analysis.lim_v1()]))
  let t250 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < abs((x : Real) - (c : Real)) → !(x == c)"))]))
  let t247 = @meson.asm_meson_tac(@list.List([]))
  let t246 = @tactics.exists_tac(@term_syntax.parse_term("(h : Real) => ((g : (Real) -> Real)((x : Real) + h) - g(x)) / h"))
  let t248 = @tactics.then_tac(@tactics.match_mp_tac(@analysis.lim_transform()), t246)
  let t245 = @tactics.exists_tac(@term_syntax.parse_term("(h : Real) => ((f : (Real) -> Real)((x : Real) + h) - f(x)) / h"))
  let t249 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@analysis.lim_transform()), t245), t248, t247])
  let t244 = @simp.asm_simp_tac(@list.List([@analysis.diffl()]))
  let t243 = @tactics.repeat_tac(@tactics.strip_tac)
  let t242 = @simp.asm_rewrite_tac(@list.List([]))
  let t241 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t240 = @simp.rewrite_tac(@list.List([@analysis.diffl()]))
  let t239 = @simp.simp_tac(@list.List([@analysis.lim_v1(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < abs((x : Real) - (c : Real)) → !(x == c)"))]))
  let t232 = @term_syntax.parse_term("(d : Real)")
  let t233 = @term_syntax.parse_term("(L : Real)")
  let t234 = @term_syntax.parse_term("(c : Real)")
  let t235 = @term_syntax.parse_term("(g' : (Real) -> Real)")
  let t236 = @term_syntax.parse_term("(f' : (Real) -> Real)")
  let t237 = @term_syntax.parse_term("(x : Real) => if x == (c : Real) { real_of_num(0) } else { (g : (Real) -> Real)(x) }")
  let t238 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => if x == (c : Real) { real_of_num(0) } else { (f : (Real) -> Real)(x) }"), t237, t236, t235, t234, t233, t232]), lhopital_weak()))
  let t257 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t238), t239), t240), @tactics.strip_tac), @tactics.strip_tac), t241), t242), t243), t244), t249), t250), t251), t252), @tactics.disch_tac), t253), t254), t255), t256)
  lhopital_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ f' : (Real) -> Real, ∀ g' : (Real) -> Real, ∀ c : Real, ∀ L : Real, ∀ d : Real, real_of_num(0) < d && (∀ x : Real, real_of_num(0) < abs(x - c) && abs(x - c) < d → diffl(f, f'(x), x) && diffl(g, g'(x), x) && !(g'(x) == real_of_num(0))) && tends_real_real(f, real_of_num(0), c) && tends_real_real(g, real_of_num(0), c) && tends_real_real((x : Real) => f'(x) / g'(x), L, c) → tends_real_real((x : Real) => f(x) / g(x), L, c)"), t257))
}

///|
let lhopital_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LHOPITAL")

///|
/// `LHOPITAL`
pub fn lhopital() -> @kernel.Thm {
  lhopital_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
}
