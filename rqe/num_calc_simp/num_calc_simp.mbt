// Translated from upstream Rqe/num_calc_simp.ml; edit this file directly.

///|
/// `arith_ss`
pub fn arith_ss(x1 : @list.List[@kernel.Thm]) -> @simp.Simpset raise {
  let thml = x1
  let t19 = @simp.basic_ss(thml)
  let t4 = (@term_syntax.parse_term("MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))"), @calc_num.num_mod_conv)
  let t5 = (@term_syntax.parse_term("DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))"), @calc_num.num_div_conv)
  let t6 = (@term_syntax.parse_term("EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))"), @calc_num.num_exp_conv)
  let t7 = (@term_syntax.parse_term("NUMERAL((m : Num)) * NUMERAL((n : Num))"), @calc_num.num_mult_conv)
  let t8 = (@term_syntax.parse_term("NUMERAL((m : Num)) - NUMERAL((n : Num))"), @calc_num.num_sub_conv)
  let t9 = (@term_syntax.parse_term("NUMERAL((m : Num)) + NUMERAL((n : Num))"), @calc_num.num_add_conv)
  let t10 = (@term_syntax.parse_term("ODD(NUMERAL((n : Num)))"), @calc_num.num_odd_conv)
  let t11 = (@term_syntax.parse_term("EVEN(NUMERAL((n : Num)))"), @calc_num.num_even_conv)
  let t12 = (@term_syntax.parse_term("NUMERAL((m : Num)) == NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t13 = (@term_syntax.parse_term("NUMERAL((m : Num)) >= NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t14 = (@term_syntax.parse_term("NUMERAL((m : Num)) > NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t15 = (@term_syntax.parse_term("NUMERAL((m : Num)) <= NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t16 = (@term_syntax.parse_term("NUMERAL((m : Num)) < NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t17 = (@term_syntax.parse_term("FACT(NUMERAL((n : Num)))"), @calc_num.num_fact_conv)
  let t18 = (@term_syntax.parse_term("PRE(NUMERAL((n : Num)))"), @calc_num.num_pre_conv)
  @lib.itlist(fn(x2 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise), x3 : @simp.Simpset) -> @simp.Simpset raise {
    let (x, y) = x2
    let ss = x3
    @simp.ss_of_conv(x, y, ss)
  }, @list.List([(@term_syntax.parse_term("SUC(NUMERAL((n : Num)))"), @calc_num.num_suc_conv), t18, t17, t16, t15, t14, t13, t12, t11, t10, t9, t8, t7, t6, t5, t4]), t19)
}

///|
/// `ARITH_SIMP_CONV`
pub fn arith_simp_conv(x20 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let thl = x20
  @simp.simplify_conv(arith_ss(@list.List([])), thl)
}

///|
/// `arith_net`
pub fn arith_net(x22 : Unit) -> @nets.Net[@simp.GconvOf[@equal.Conv]] raise {
  let _ = x22
  let t45 = @simp.basic_net()
  let t30 = (@term_syntax.parse_term("MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))"), @calc_num.num_mod_conv)
  let t31 = (@term_syntax.parse_term("DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))"), @calc_num.num_div_conv)
  let t32 = (@term_syntax.parse_term("EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))"), @calc_num.num_exp_conv)
  let t33 = (@term_syntax.parse_term("NUMERAL((m : Num)) * NUMERAL((n : Num))"), @calc_num.num_mult_conv)
  let t34 = (@term_syntax.parse_term("NUMERAL((m : Num)) - NUMERAL((n : Num))"), @calc_num.num_sub_conv)
  let t35 = (@term_syntax.parse_term("NUMERAL((m : Num)) + NUMERAL((n : Num))"), @calc_num.num_add_conv)
  let t36 = (@term_syntax.parse_term("ODD(NUMERAL((n : Num)))"), @calc_num.num_odd_conv)
  let t37 = (@term_syntax.parse_term("EVEN(NUMERAL((n : Num)))"), @calc_num.num_even_conv)
  let t38 = (@term_syntax.parse_term("NUMERAL((m : Num)) == NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t39 = (@term_syntax.parse_term("NUMERAL((m : Num)) >= NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t40 = (@term_syntax.parse_term("NUMERAL((m : Num)) > NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t41 = (@term_syntax.parse_term("NUMERAL((m : Num)) <= NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t42 = (@term_syntax.parse_term("NUMERAL((m : Num)) < NUMERAL((n : Num))"), @calc_num.num_rel_conv)
  let t43 = (@term_syntax.parse_term("FACT(NUMERAL((n : Num)))"), @calc_num.num_fact_conv)
  let t44 = (@term_syntax.parse_term("PRE(NUMERAL((n : Num)))"), @calc_num.num_pre_conv)
  @lib.itlist(fn(x27 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise), x28 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let s29 = ((x26 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => @lib.uncurry(fn(x23 : @kernel.Term, x24 : (@kernel.Term) -> @kernel.Thm raise) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
      fn(x25 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        @simp.net_of_conv(x23, x24, x25)
      }
    }, x26))(x27)
    s29(x28)
  }, @list.List([(@term_syntax.parse_term("SUC(NUMERAL((n : Num)))"), @calc_num.num_suc_conv), t44, t43, t42, t41, t40, t39, t38, t37, t36, t35, t34, t33, t32, t31, t30]), t45)
}

///|
/// `ARITH_REWRITE_CONV`
pub fn arith_rewrite_conv(x46 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let thl = x46
  @simp.general_rewrite_conv(true, fn(x48 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s49 = @equal.top_depth_conv(x48)
    fn(x50 : @kernel.Term) -> @kernel.Thm raise {
      s49(x50)
    }
  }, arith_net(()), thl)
}

///|
/// `ARITH_SIMP_TAC`
pub fn arith_simp_tac(x51 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let thl = x51
  @tactics.conv_tac(arith_simp_conv(thl))
}

///|
fn load_steps() -> Unit raise {
  ()
}
