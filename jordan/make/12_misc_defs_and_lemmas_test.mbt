// Jordan/misc_defs_and_lemmas.ml in its directory's load order: the test block of
// jordan/misc_defs_and_lemmas/misc_defs_and_lemmas_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Jordan_misc_defs_and_lemmas_ref.expected).

///|
test "Jordan/misc_defs_and_lemmas matches Jordan/misc_defs_and_lemmas.ml" {
  @testkit.release_output()
  @misc_defs_and_lemmas.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/transc", "Examples/polylog", "Jordan/tactics_refine",
      "Jordan/lib_ext", "Jordan/tactics_fix", "Jordan/parse_ext_override_interface",
      "Jordan/tactics_ext", "Jordan/num_ext_gcd", "Jordan/num_ext_nabs", "Jordan/real_ext_geom_series",
      "Rqe/num_calc_simp", "Jordan/real_ext", "Jordan/float", "Jordan/tactics_ext2",
      "Jordan/misc_defs_and_lemmas",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Jordan/misc_defs_and_lemmas")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("dirac_delta", () => sthm(@misc_defs_and_lemmas.dirac_delta()))
  log.attempt("min_num", () => sthm(@misc_defs_and_lemmas.min_num()))
  log.attempt("min_least", () => sthm(@misc_defs_and_lemmas.min_least()))
  log.attempt("max_real", () => sthm(@misc_defs_and_lemmas.max_real()))
  log.attempt("min_real", () => sthm(@misc_defs_and_lemmas.min_real()))
  log.attempt("deriv", () => sthm(@misc_defs_and_lemmas.deriv()))
  log.attempt("deriv2", () => sthm(@misc_defs_and_lemmas.deriv2()))
  log.attempt("square_le", () => sthm(@misc_defs_and_lemmas.square_le()))
  log.attempt("max_num_sequence", () => {
    sthm(@misc_defs_and_lemmas.max_num_sequence())
  })
  log.attempt("REAL_INV_LT", () => sthm(@misc_defs_and_lemmas.real_inv_lt()))
  log.attempt("REAL_MUL_NN", () => sthm(@misc_defs_and_lemmas.real_mul_nn()))
  log.attempt("ABS_SQUARE", () => sthm(@misc_defs_and_lemmas.abs_square()))
  log.attempt("ABS_SQUARE_LE", () => sthm(@misc_defs_and_lemmas.abs_square_le()))
  log.attempt("twopow_eps", () => sthm(@misc_defs_and_lemmas.twopow_eps()))
  log.attempt("prod_EXISTS", () => sthm(@misc_defs_and_lemmas.prod_exists()))
  log.attempt("prod_DEF", () => sthm(@misc_defs_and_lemmas.prod_def()))
  log.attempt("prod", () => sthm(@misc_defs_and_lemmas.prod()))
  log.attempt("PROD_TWO", () => sthm(@misc_defs_and_lemmas.prod_two()))
  log.attempt("ABS_PROD", () => sthm(@misc_defs_and_lemmas.abs_prod()))
  log.attempt("PROD_EQ", () => sthm(@misc_defs_and_lemmas.prod_eq()))
  log.attempt("PROD_POS", () => sthm(@misc_defs_and_lemmas.prod_pos()))
  log.attempt("PROD_POS_GEN", () => sthm(@misc_defs_and_lemmas.prod_pos_gen()))
  log.attempt("PROD_ABS", () => sthm(@misc_defs_and_lemmas.prod_abs()))
  log.attempt("PROD_ZERO", () => sthm(@misc_defs_and_lemmas.prod_zero()))
  log.attempt("PROD_MUL", () => sthm(@misc_defs_and_lemmas.prod_mul()))
  log.attempt("PROD_CMUL", () => sthm(@misc_defs_and_lemmas.prod_cmul()))
  log.attempt("IN_ELIM_THM'", () => sthm(@misc_defs_and_lemmas.in_elim_thm_p()))
  log.attempt("SURJ_IMAGE", () => sthm(@misc_defs_and_lemmas.surj_image()))
  log.attempt("SURJ_FINITE", () => sthm(@misc_defs_and_lemmas.surj_finite()))
  log.attempt("BIJ_INVERSE", () => sthm(@misc_defs_and_lemmas.bij_inverse()))
  log.attempt("UNIONS_INTERS", () => sthm(@misc_defs_and_lemmas.unions_inters()))
  log.attempt("INTERS_SUBSET", () => sthm(@misc_defs_and_lemmas.inters_subset()))
  log.attempt("sub_union", () => sthm(@misc_defs_and_lemmas.sub_union()))
  log.attempt("IMAGE_SURJ", () => sthm(@misc_defs_and_lemmas.image_surj()))
  log.attempt("SUBSET_PREIMAGE", () => {
    sthm(@misc_defs_and_lemmas.subset_preimage())
  })
  log.attempt("UNIONS_INTER", () => sthm(@misc_defs_and_lemmas.unions_inter()))
  log.attempt("UNIONS_SUBSET", () => sthm(@misc_defs_and_lemmas.unions_subset()))
  log.attempt("SUBSET_INTER", () => sthm(@misc_defs_and_lemmas.subset_inter()))
  log.attempt("EMPTY_EXISTS", () => sthm(@misc_defs_and_lemmas.empty_exists()))
  log.attempt("UNIONS_UNIONS", () => sthm(@misc_defs_and_lemmas.unions_unions()))
  log.attempt("UNIONS_IMAGE_UNIONS", () => {
    sthm(@misc_defs_and_lemmas.unions_image_unions())
  })
  log.attempt("INTERS_SUBSET2", () => {
    sthm(@misc_defs_and_lemmas.inters_subset2())
  })
  log.attempt("INTERS_EMPTY", () => sthm(@misc_defs_and_lemmas.inters_empty()))
  log.attempt("preimage", () => sthm(@misc_defs_and_lemmas.preimage()))
  log.attempt("in_preimage", () => sthm(@misc_defs_and_lemmas.in_preimage()))
  log.attempt("supp", () => sthm(@misc_defs_and_lemmas.supp()))
  log.attempt("func", () => sthm(@misc_defs_and_lemmas.func()))
  log.attempt("reflexive", () => sthm(@misc_defs_and_lemmas.reflexive()))
  log.attempt("symmetric", () => sthm(@misc_defs_and_lemmas.symmetric()))
  log.attempt("transitive", () => sthm(@misc_defs_and_lemmas.transitive()))
  log.attempt("equivalence_relation", () => {
    sthm(@misc_defs_and_lemmas.equivalence_relation())
  })
  log.attempt("partition_DEF", () => sthm(@misc_defs_and_lemmas.partition_def()))
  log.attempt("DIFF_DIFF2", () => sthm(@misc_defs_and_lemmas.diff_diff2()))
  log.attempt("GSPEC_THM", () => sthm(@misc_defs_and_lemmas.gspec_thm()))
  log.attempt("CARD_GE_REFL", () => sthm(@misc_defs_and_lemmas.card_ge_refl()))
  log.attempt("FINITE_HAS_SIZE_LEMMA", () => {
    sthm(@misc_defs_and_lemmas.finite_has_size_lemma())
  })
  log.attempt("NUM_COUNTABLE", () => sthm(@misc_defs_and_lemmas.num_countable()))
  log.attempt("NUM2_COUNTABLE", () => {
    sthm(@misc_defs_and_lemmas.num2_countable())
  })
  log.attempt("COUNTABLE_UNIONS", () => {
    sthm(@misc_defs_and_lemmas.countable_unions())
  })
  log.attempt("COUNTABLE_IMAGE", () => {
    sthm(@misc_defs_and_lemmas.countable_image())
  })
  log.attempt("COUNTABLE_CARD", () => {
    sthm(@misc_defs_and_lemmas.countable_card())
  })
  log.attempt("COUNTABLE_NUMSEG", () => {
    sthm(@misc_defs_and_lemmas.countable_numseg())
  })
  log.attempt("FINITE_COUNTABLE", () => {
    sthm(@misc_defs_and_lemmas.finite_countable())
  })
  log.attempt("num_infinite", () => sthm(@misc_defs_and_lemmas.num_infinite()))
  log.attempt("num_SEG_UNION", () => sthm(@misc_defs_and_lemmas.num_seg_union()))
  log.attempt("num_above_infinite", () => {
    sthm(@misc_defs_and_lemmas.num_above_infinite())
  })
  log.attempt("INTER_FINITE", () => sthm(@misc_defs_and_lemmas.inter_finite()))
  log.attempt("num_above_finite", () => {
    sthm(@misc_defs_and_lemmas.num_above_finite())
  })
  log.attempt("SUBSET_SUC", () => sthm(@misc_defs_and_lemmas.subset_suc()))
  log.attempt("SUBSET_SUC2", () => sthm(@misc_defs_and_lemmas.subset_suc2()))
  log.attempt("INFINITE_PIGEONHOLE", () => {
    sthm(@misc_defs_and_lemmas.infinite_pigeonhole())
  })
  log.attempt("real_FINITE", () => sthm(@misc_defs_and_lemmas.real_finite()))
  log.attempt("UNIONS_DELETE", () => sthm(@misc_defs_and_lemmas.unions_delete()))
  log.attempt("SUPP", () => sthm(@misc_defs_and_lemmas.supp_v1()))
  log.attempt("FUN", () => sthm(@misc_defs_and_lemmas.fun()))
  log.attempt("compose", () => sthm(@misc_defs_and_lemmas.compose()))
  log.attempt("COMP_ASSOC", () => sthm(@misc_defs_and_lemmas.comp_assoc()))
  log.attempt("COMP_INJ", () => sthm(@misc_defs_and_lemmas.comp_inj()))
  log.attempt("COMP_SURJ", () => sthm(@misc_defs_and_lemmas.comp_surj()))
  log.attempt("COMP_BIJ", () => sthm(@misc_defs_and_lemmas.comp_bij()))
  log.attempt("INVERSE_FN", () => sthm(@misc_defs_and_lemmas.inverse_fn()))
  log.attempt("INVERSE_DEF", () => sthm(@misc_defs_and_lemmas.inverse_def()))
  log.attempt("INVERSE_BIJ", () => sthm(@misc_defs_and_lemmas.inverse_bij()))
  log.attempt("INVERSE_XY", () => sthm(@misc_defs_and_lemmas.inverse_xy()))
  log.attempt("FINITE_BIJ", () => sthm(@misc_defs_and_lemmas.finite_bij()))
  log.attempt("FINITE_INJ", () => sthm(@misc_defs_and_lemmas.finite_inj()))
  log.attempt("FINITE_BIJ2", () => sthm(@misc_defs_and_lemmas.finite_bij2()))
  log.attempt("BIJ_CARD", () => sthm(@misc_defs_and_lemmas.bij_card()))
  log.attempt("PAIR_LEMMA", () => sthm(@misc_defs_and_lemmas.pair_lemma()))
  log.attempt("CARD_SING", () => sthm(@misc_defs_and_lemmas.card_sing()))
  log.attempt("FINITE_SING", () => sthm(@misc_defs_and_lemmas.finite_sing()))
  log.attempt("NUM_INTRO", () => sthm(@misc_defs_and_lemmas.num_intro()))
  log.attempt("DOMAIN_EMPTY", () => sthm(@misc_defs_and_lemmas.domain_empty()))
  log.attempt("DOMAIN_INSERT", () => sthm(@misc_defs_and_lemmas.domain_insert()))
  log.attempt("CARD_DELETE_CHOICE", () => {
    sthm(@misc_defs_and_lemmas.card_delete_choice())
  })
  log.attempt("FUN_SIZE", () => sthm(@misc_defs_and_lemmas.fun_size()))
  log.attempt("drop0", () => sthm(@misc_defs_and_lemmas.drop0()))
  log.attempt("drop1", () => sthm(@misc_defs_and_lemmas.drop1()))
  log.attempt("drop2", () => sthm(@misc_defs_and_lemmas.drop2()))
  log.attempt("drop3", () => sthm(@misc_defs_and_lemmas.drop3()))
  log.attempt("part0", () => sthm(@misc_defs_and_lemmas.part0()))
  log.attempt("part1", () => sthm(@misc_defs_and_lemmas.part1()))
  log.attempt("part2", () => sthm(@misc_defs_and_lemmas.part2()))
  log.attempt("part3", () => sthm(@misc_defs_and_lemmas.part3()))
  log.attempt("part4", () => sthm(@misc_defs_and_lemmas.part4()))
  log.attempt("part5", () => sthm(@misc_defs_and_lemmas.part5()))
  log.attempt("part6", () => sthm(@misc_defs_and_lemmas.part6()))
  log.attempt("part7", () => sthm(@misc_defs_and_lemmas.part7()))
  log.attempt("euclid_scale", () => sthm(@misc_defs_and_lemmas.euclid_scale()))
  log.attempt("euclid_neg", () => sthm(@misc_defs_and_lemmas.euclid_neg()))
  log.attempt("euclid_plus", () => sthm(@misc_defs_and_lemmas.euclid_plus()))
  log.attempt("euclid", () => sthm(@misc_defs_and_lemmas.euclid()))
  log.attempt("euclidean", () => sthm(@misc_defs_and_lemmas.euclidean()))
  log.attempt("euclid_minus", () => sthm(@misc_defs_and_lemmas.euclid_minus()))
  log.attempt("euclid0", () => sthm(@misc_defs_and_lemmas.euclid0()))
  log.attempt("coord", () => sthm(@misc_defs_and_lemmas.coord()))
  log.attempt("dot", () => sthm(@misc_defs_and_lemmas.dot()))
  log.attempt("norm", () => sthm(@misc_defs_and_lemmas.norm()))
  log.attempt("d_euclid", () => sthm(@misc_defs_and_lemmas.d_euclid()))
  log.attempt("sum_vector_EXISTS", () => {
    sthm(@misc_defs_and_lemmas.sum_vector_exists())
  })
  log.attempt("sum_vector", () => sthm(@misc_defs_and_lemmas.sum_vector()))
  log.attempt("mk_segment", () => sthm(@misc_defs_and_lemmas.mk_segment()))
  log.attempt("mk_open_segment", () => {
    sthm(@misc_defs_and_lemmas.mk_open_segment())
  })
  log.attempt("convex", () => sthm(@misc_defs_and_lemmas.convex()))
  log.attempt("convex_hull", () => sthm(@misc_defs_and_lemmas.convex_hull()))
  log.attempt("affine_hull", () => sthm(@misc_defs_and_lemmas.affine_hull()))
  log.attempt("mk_line", () => sthm(@misc_defs_and_lemmas.mk_line()))
  log.attempt("affine", () => sthm(@misc_defs_and_lemmas.affine()))
  log.attempt("affine_dim", () => sthm(@misc_defs_and_lemmas.affine_dim()))
  log.attempt("collinear", () => sthm(@misc_defs_and_lemmas.collinear()))
  log.attempt("coplanar", () => sthm(@misc_defs_and_lemmas.coplanar()))
  log.attempt("line", () => sthm(@misc_defs_and_lemmas.line()))
  log.attempt("plane", () => sthm(@misc_defs_and_lemmas.plane()))
  log.attempt("space", () => sthm(@misc_defs_and_lemmas.space()))
  log.attempt("mk_open_half_set", () => {
    sthm(@misc_defs_and_lemmas.mk_open_half_set())
  })
  log.attempt("mk_half_set", () => sthm(@misc_defs_and_lemmas.mk_half_set()))
  log.attempt("mk_angle", () => sthm(@misc_defs_and_lemmas.mk_angle()))
  log.attempt("mk_signed_angle", () => {
    sthm(@misc_defs_and_lemmas.mk_signed_angle())
  })
  log.attempt("mk_convex_cone", () => {
    sthm(@misc_defs_and_lemmas.mk_convex_cone())
  })
  log.attempt("packing", () => sthm(@misc_defs_and_lemmas.packing()))
  log.attempt("saturated_packing", () => {
    sthm(@misc_defs_and_lemmas.saturated_packing())
  })
  log.attempt("cross_product3", () => {
    sthm(@misc_defs_and_lemmas.cross_product3())
  })
  log.attempt("triple_product", () => {
    sthm(@misc_defs_and_lemmas.triple_product())
  })
  log.attempt("mk_triangle", () => sthm(@misc_defs_and_lemmas.mk_triangle()))
  log.attempt("mk_interior_triangle", () => {
    sthm(@misc_defs_and_lemmas.mk_interior_triangle())
  })
  log.attempt("mk_triangular_region", () => {
    sthm(@misc_defs_and_lemmas.mk_triangular_region())
  })
  log.attempt("metric_space", () => sthm(@misc_defs_and_lemmas.metric_space()))
  log.attempt("set_translate", () => sthm(@misc_defs_and_lemmas.set_translate()))
  log.attempt("set_scale", () => sthm(@misc_defs_and_lemmas.set_scale()))
  log.attempt("mk_rectangle", () => sthm(@misc_defs_and_lemmas.mk_rectangle()))
  log.attempt("one_vec", () => sthm(@misc_defs_and_lemmas.one_vec()))
  log.attempt("mk_cube", () => sthm(@misc_defs_and_lemmas.mk_cube()))
  log.attempt("inner_cube", () => sthm(@misc_defs_and_lemmas.inner_cube()))
  log.attempt("outer_cube", () => sthm(@misc_defs_and_lemmas.outer_cube()))
  log.attempt("inner_vol", () => sthm(@misc_defs_and_lemmas.inner_vol()))
  log.attempt("outer_vol", () => sthm(@misc_defs_and_lemmas.outer_vol()))
  log.attempt("euclid_bounded", () => {
    sthm(@misc_defs_and_lemmas.euclid_bounded())
  })
  log.attempt("vol", () => sthm(@misc_defs_and_lemmas.vol()))
  log.attempt("SER_APPROX1", () => sthm(@misc_defs_and_lemmas.ser_approx1()))
  log.attempt("SER_APPROX", () => sthm(@misc_defs_and_lemmas.ser_approx()))
  log.attempt("PI_EST", () => sthm(@misc_defs_and_lemmas.pi_est()))
  log.attempt("pi_fun", () => sthm(@misc_defs_and_lemmas.pi_fun()))
  log.attempt("pi_bound_fun", () => sthm(@misc_defs_and_lemmas.pi_bound_fun()))
  log.attempt("PI_EST2", () => sthm(@misc_defs_and_lemmas.pi_est2()))
  log.attempt("GP16", () => sthm(@misc_defs_and_lemmas.gp16()))
  log.attempt("GP16a", () => sthm(@misc_defs_and_lemmas.gp16a()))
  log.attempt("PI_SER", () => sthm(@misc_defs_and_lemmas.pi_ser()))
  log.attempt("inv_twopow", () => sthm(@misc_defs_and_lemmas.inv_twopow()))
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
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..5..13..solved at 26
      #|0..0..1..5..13..solved at 26
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..1..2..5..9..15..29..44..68..142..260..solved at 420
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..35..62..solved at 73
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..35..62..solved at 73
      #|0..0..solved at 2
      #|0..0..2..12..solved at 18
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..5..11..22..49..95..171..305..solved at 319
      #|0..0..1..4..10..20..34..56..88..130..180..238..304..378..468..574..696..850..1032..1258..1520..1834..2228..2782..3536..4510..5728..7250..8852..10582..12504..14450..16716..19194..22436..26450..31796..solved at 33408
      #|0..0..3..13..37..solved at 48
      #|0..0..3..solved at 8
      #|0..0..2..8..solved at 23
      #|0..0..solved at 2
      #|0..0..0..1..3..5..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..13..21..solved at 31
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 11
      #|0..0..2..7..19..39..74..156..solved at 223
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
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
      #|0..0..1..4..solved at 10
      #|0..0..2..8..31..79..254..629..1685..solved at 3183
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..4..13..29..74..solved at 99
      #|0..0..1..4..19..49..130..solved at 165
      #|0..0..3..10..29..63..170..solved at 283
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 17
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..6..12..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..7..16..32..solved at 45
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..6..15..solved at 21
      #|0..0..2..6..15..57..160..883..4135..solved at 8792
      #|0..0..1..2..7..15..43..86..233..456..solved at 886
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..11..38..157..solved at 291
      #|0..0..2..11..solved at 16
      #|0..0..2..10..39..151..solved at 158
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..6..13..28..55..102..solved at 169
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..6..14..solved at 19
      #|0..0..2..solved at 5
      #|0..0..2..6..13..45..solved at 52
      #|0..0..2..solved at 5
      #|0..0..2..6..18..42..solved at 52
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..1..3..5..10..19..31..52..solved at 74
      #|0..0..2..4..10..24..solved at 34
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..solved at 11
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..8..solved at 12
      #|0..0..2..6..17..solved at 25
      #|0..0..2..solved at 5
      #|0..0..2..4..11..34..77..165..solved at 194
      #|0..0..1..2..solved at 7
      #|0..0..1..2..7..solved at 13
      #|0..0..2..solved at 6
      #|0..0..2..5..11..22..40..solved at 53
      #|0..0..1..solved at 4
      #|0..0..3..6..14..32..57..102..188..solved at 204
      #|0..0..3..6..22..41..72..122..175..248..386..solved at 407
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..1..3..6..15..34..67..132..266..solved at 510
      #|0..0..1..3..6..13..29..59..110..solved at 162
      #|0..0..1..3..6..15..34..68..130..solved at 182
      #|0..0..1..3..6..15..34..67..132..266..solved at 510
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..3..10..solved at 15
      #|0..0..3..10..solved at 14
      #|0..0..solved at 3
      #|0..0..2..6..21..solved at 27
      #|0..0..solved at 2
      #|0..0..2..6..21..69..246..solved at 261
      #|0..0..2..8..solved at 14
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..solved at 17
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..5..16..32..solved at 40
      #|0..0..1..5..18..37..solved at 48
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..solved at 17
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..14..66..287..1310..solved at 1325
      #|0..0..solved at 3
      #|0..0..2..5..16..72..302..solved at 311
      #|0..0..1..2..3..7..12..17..23..29..35..solved at 84
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..4..7..solved at 21
      #|0..0..2..4..solved at 10
      #|0..0..0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..14..37..solved at 59
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..6..18..31..solved at 38
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..10..solved at 18
      #|0..0..1..5..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..55..112..263..solved at 489
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..7..14..22..33..57..84..141..221..305..441..638..849..solved at 1042
      #|0..0..0..1..2..3..4..5..6..11..16..21..40..59..78..103..128..153..192..231..270..358..446..534..650..766..882..1036..1190..1344..solved at 3172
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..2..5..8..25..57..89..solved at 97
      #|0..0..0..1..5..10..solved at 15
      #|0..0..0..0..2..5..8..25..57..89..solved at 97
      #|0..0..solved at 2
      #|0..0..2..10..25..solved at 35
      #|0..0..0..1..4..7..solved at 12
      #|0..0..solved at 2
      #|0..0..0..3..6..9..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..8..solved at 13
      #|0..0..solved at 3
      #|0..0..2..4..8..solved at 13
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..10..25..solved at 35
      #|0..0..solved at 2
      #|0..0..1..3..11..solved at 20
      #|0..0..1..2..4..12..24..45..78..125..solved at 140
      #|0..0..0..2..7..solved at 12
      #|0..0..1..3..13..29..63..128..226..388..642..977..1459..2097..3319..solved at 3649
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..4..15..41..98..211..420..solved at 656
      #|0..0..1..2..5..9..17..33..55..97..162..262..411..solved at 543
      #|0..0..1..6..23..68..172..410..880..solved at 911
      #|0..0..0..1..4..7..solved at 16
      #|0..0..2..8..24..54..solved at 69
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..8..solved at 12
      #|0..0..2..8..solved at 13
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..0..1..2..3..4..5..6..9..12..15..solved at 28
      #|0..0..1..2..9..27..54..solved at 63
      #|0..0..0..0..4..11..21..solved at 31
      #|0..0..0..2..5..18..49..94..177..301..448..682..998..1426..2070..3047..4168..6085..8572..solved at 9229
      #|0..0..solved at 2
      #|0..0..3..7..20..54..150..solved at 180
      #|0..0..solved at 2
      #|0..0..2..6..solved at 13
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 8
      #|0..0..2..6..solved at 14
      #|0..0..1..3..solved at 8
      #|0..0..2..4..solved at 11
      #|0..0..5..12..39..solved at 71
      #|0..0..4..10..30..solved at 55
      #|0..0..5..13..38..solved at 66
      #|0..0..4..10..31..solved at 57
      #|0..0..3..6..19..35..60..118..solved at 270
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..5..15..51..120..259..solved at 434
      #|0..0..1..5..15..51..120..259..solved at 394
      #|0..0..1..4..13..31..solved at 37
      #|0..0..1..2..solved at 6
      #|0..0..1..5..15..51..120..259..solved at 394
      #|0..0..1..5..15..51..120..259..solved at 434
      #|0..0..1..4..12..28..58..118..solved at 128
      #|0..0..2..9..28..85..206..492..solved at 618
      #|0..0..2..9..28..94..222..491..1165..solved at 1499
      #|0..0..2..9..28..94..223..491..1149..solved at 1472
      #|0..0..2..10..28..82..204..solved at 236
      #|0..0..1..4..11..43..116..246..648..1354..solved at 1611
      #|0..0..solved at 2
      #|0..0..1..5..15..51..120..259..solved at 434
      #|0..0..1..5..15..51..120..259..solved at 394
      #|0..0..1..4..13..31..solved at 37
      #|0..0..2..7..24..55..104..223..440..827..1504..solved at 1616
      #|0..0..2..7..24..65..133..290..574..solved at 904
      #|0..0..2..7..24..65..134..294..583..solved at 913
      #|0..0..2..8..25..52..110..solved at 145
      #|0..0..1..2..7..13..26..50..83..132..216..308..447..705..1020..1530..2268..3184..4455..6310..solved at 8365
      #|0..0..1..3..9..17..43..86..154..300..472..714..1138..1664..2466..4129..6181..solved at 6305
      #|0..0..2..7..20..49..89..185..solved at 215
      #|0..0..1..2..7..17..34..70..132..223..396..solved at 427
      #|0..0..1..2..6..12..23..46..74..119..197..285..418..630..886..solved at 1210
      #|0..0..2..8..24..solved at 32
      #|0..0..2..7..24..61..134..280..548..1144..solved at 1169
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..8..18..solved at 48
      #|0..0..1..2..8..18..solved at 55
      #|0..0..1..2..10..24..118..279..1321..3190..solved at 4661
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..28..51..solved at 84
      #|0..0..1..2..6..12..28..57..solved at 90
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..8..18..68..147..solved at 443
      #|0..0..1..2..8..18..67..146..solved at 427
      #|0..0..1..2..8..18..solved at 55
      #|0..0..1..2..8..18..solved at 48
      #|0..0..1..2..7..14..solved at 23
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..12..31..100..solved at 139
      #|0..0..1..2..solved at 8
      #|0..0..1..2..6..13..29..solved at 39
      #|0..0..1..2..6..12..28..51..solved at 80
      #|0..0..1..2..6..13..29..solved at 39
      #|0..0..1..2..6..12..28..51..solved at 80
      #|0..0..1..2..7..15..35..77..161..solved at 177
      #|0..0..1..2..6..12..28..51..104..192..solved at 349
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..1..2..9..20..73..154..solved at 284
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..1..2..9..20..73..154..solved at 229
      #|0..0..1..2..8..18..65..140..472..992..solved at 2047
      #|0..0..0..1..2..3..4..5..6..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..20..52..96..204..356..638..1042..1916..3036..solved at 4498
      #|0..0..1..2..7..16..42..78..161..285..685..solved at 954
      #|0..0..1..2..7..16..42..78..160..281..solved at 672
      #|0..0..2..4..11..21..59..116..239..426..800..1336..solved at 1840
      #|0..0..1..2..7..16..45..86..174..312..724..solved at 772
      #|0..0..1..2..7..16..44..84..168..solved at 185
      #|0..0..2..4..11..21..59..116..239..426..solved at 540
      #|0..0..1..2..7..18..46..solved at 77
      #|0..0..1..2..7..18..47..92..185..solved at 281
      #|0..0..2..4..12..22..solved at 41
      #|0..0..1..2..7..solved at 21
      #|0..0..1..2..7..solved at 18
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..6..13..30..solved at 70
      #|0..0..1..2..6..13..30..solved at 70
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..55..112..263..solved at 489
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 26
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 13
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..solved at 67
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..solved at 7
      #|0..0..1..5..9..19..44..73..solved at 80
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..5..7..9..13..solved at 22
      #|0..0..1..2..3..5..7..9..13..solved at 22
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..solved at 56
      #|0..0..solved at 2
      #|0..0..2..6..17..43..98..solved at 116
      #|0..0..3..8..16..solved at 33
      #|0..0..3..8..16..solved at 35
      #|0..0..solved at 2
      #|0..0..3..8..16..solved at 35
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..4..10..22..75..155..solved at 209
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 9
      #|0..0..1..3..6..22..49..93..169..273..405..601..837..1131..1577..2127..solved at 2538
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..6..solved at 25
      #|0..0..2..4..6..solved at 18
      #|0..0..1..2..3..14..solved at 25
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..29..solved at 50
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|0..0..1..2..3..10..solved at 16
      #|0..0..1..3..6..12..solved at 21
      #|0..0..1..3..6..16..solved at 33
      #|0..0..1..4..10..23..48..94..solved at 172
      #|0..0..1..4..8..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..19..42..solved at 59
      #|0..0..1..3..6..16..37..70..121..205..325..solved at 432
      #|0..0..1..2..solved at 6
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|0..0..1..4..8..solved at 17
      #|0..0..1..4..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..3..8..15..solved at 20
      #|0..0..3..12..23..40..63..solved at 72
      #|0..0..3..6..18..34..61..94..145..206..solved at 249
      #|0..0..3..14..36..111..307..901..solved at 935
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..35..62..solved at 73
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..19..44..solved at 81
      #|0..0..solved at 2
      #|0..0..1..3..9..25..64..166..437..1159..3190..solved at 4411
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..19..44..112..275..694..solved at 932
      #|0..0..1..3..8..19..40..85..174..348..696..1556..3482..solved at 6840
      #|0..0..1..2..6..12..28..solved at 55
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..19..36..53..76..121..solved at 164
      #|0..0..3..solved at 9
      #|0..0..1..7..solved at 12
      #|0..0..1..5..12..24..solved at 30
      #|0..0..1..5..12..23..solved at 30
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..6..17..34..81..solved at 102
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..9..solved at 16
      #|0..0..0..2..solved at 6
      #|0..0..2..6..16..solved at 22
      #|0..0..1..2..5..15..28..59..solved at 68
      #|0..0..1..2..4..10..19..solved at 27
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 13
      #|0..0..2..4..11..32..75..solved at 142
      #|0..0..2..4..12..33..75..solved at 143
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..17..34..solved at 61
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..18..35..solved at 63
      #|0..0..1..2..solved at 6
      #|0..0..2..4..10..18..34..76..138..336..872..2366..solved at 5076
      #|CPU time (user): <t>
      #|0..0..1..2..7..14..37..72..174..325..solved at 392
      #|0..0..2..solved at 5
      #|0..0..1..2..6..11..21..34..52..73..solved at 103
      #|0..0..1..2..3..11..21..solved at 28
      #|0..0..1..2..3..11..21..solved at 28
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..8..17..30..solved at 47
      #|0..0..solved at 3
      #|0..0..2..4..8..solved at 15
      #|0..0..1..2..6..14..39..solved at 73
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..1..3..9..solved at 15
      #|0..0..1..2..5..11..20..solved at 29
      #|0..0..1..2..5..15..29..solved at 49
      #|0..0..1..2..7..19..41..79..146..solved at 200
      #|0..0..1..2..7..19..41..solved at 77
      #|0..0..1..2..7..19..41..79..146..solved at 175
      #|0..0..1..2..7..19..41..solved at 68
      #|0..0..1..2..9..23..64..133..315..solved at 511
      #|0..0..1..2..9..23..64..solved at 116
      #|0..0..1..2..9..23..64..133..315..solved at 415
      #|0..0..1..2..9..23..64..solved at 116
      #|0..0..2..9..solved at 14
      #|0..0..2..9..20..40..87..solved at 94
      #|0..0..2..8..18..34..73..solved at 91
      #|0..0..1..5..12..23..solved at 29
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..solved at 8
      #|0..0..3..6..solved at 13
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..1..4..9..17..solved at 23
      #|0..0..1..4..solved at 9
      #|0..0..1..5..10..18..solved at 24
      #|0..0..1..5..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 10
      #|0..0..1..2..solved at 8
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..47..81..143..solved at 159
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..49..85..149..solved at 165
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..45..77..137..solved at 218
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..47..81..143..solved at 224
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..49..85..149..solved at 230
      #|0..0..1..2..3..7..14..25..51..89..155..solved at 171
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..47..81..143..solved at 224
      #|0..0..1..2..3..7..14..25..49..85..149..solved at 165
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..2..11..34..84..193..424..970..solved at 1151
      #|0..0..1..2..3..8..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 11
      #|0..0..0..3..solved at 8
      #|0..0..1..7..18..45..solved at 68
      #|0..0..1..5..12..31..92..191..solved at 234
      #|0..0..1..2..3..11..21..31..63..101..139..solved at 265
      #|0..0..2..9..20..50..124..264..solved at 287
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..5..11..22..49..95..171..305..solved at 319
      #|0..0..1..4..10..20..34..56..88..130..180..238..304..378..468..574..696..850..1032..1258..1520..1834..2228..2782..3536..4510..5728..7250..8852..10582..12504..14450..16716..19194..22436..26450..31796..solved at 33408
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..29..solved at 43
      #|0..0..1..2..8..16..37..solved at 58
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..8..16..solved at 25
      #|0..0..1..solved at 4
      #|0..0..1..4..9..19..41..75..solved at 84
      #|0..0..1..5..12..solved at 17
      #|0..0..1..solved at 5
      #|0..0..1..4..11..solved at 16
      #|0..0..1..solved at 5
      #|0..0..1..3..8..22..54..118..267..565..1172..solved at 1415
      #|0..0..solved at 2
      #|0..0..1..4..9..21..50..101..195..398..788..1469..solved at 1634
      #|0..0..1..2..3..7..13..21..solved at 29
      #|0..0..1..4..10..25..53..111..256..493..871..1565..2714..4572..7748..12991..solved at 20439
      #|0..0..1..2..3..7..12..17..solved at 25
      #|0..0..1..2..6..11..18..37..59..96..158..229..326..solved at 350
      #|0..0..1..2..5..9..15..30..47..76..solved at 158
      #|0..0..1..2..3..7..13..21..solved at 30
      #|0..0..1..2..4..9..15..21..35..solved at 48
      #|0..0..3..solved at 6
      #|0..0..1..4..12..53..156..809..solved at 3536
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..53..96..175..solved at 250
      #|0..0..2..4..10..20..38..solved at 58
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..5..11..22..49..95..171..305..solved at 319
      #|0..0..1..4..10..20..34..56..88..130..180..238..304..378..468..574..696..850..1032..1258..1520..1834..2228..2782..3536..4510..5728..7250..8852..10582..12504..14450..16716..19194..22436..26450..31796..solved at 33408
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..5..solved at 9
      #|0..0..1..2..5..8..solved at 14
      #|0..0..2..5..11..23..42..71..111..171..262..solved at 304
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..4..6..14..30..53..152..368..solved at 435
      #|Warning: inventing type variables
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..5..14..48..solved at 54
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..12..37..73..solved at 91
      #|0..0..1..2..5..10..solved at 19
      #|0..0..1..2..5..11..27..50..solved at 62
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..2..5..11..solved at 16
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..4..solved at 9
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..5..9..22..solved at 37
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..4..10..23..42..83..solved at 141
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 2 critical pairs
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 6 critical pairs
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 8 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..4..11..25..54..solved at 82
      #|0..0..1..4..solved at 12
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..0..2..6..solved at 11
      #|0..0..0..2..6..solved at 11
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..2..7..12..27..solved at 38
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 5 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 7 critical pairs
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 12 critical pairs
      #|9 basis elements and 17 critical pairs
      #|10 basis elements and 21 critical pairs
      #|10 basis elements and 20 critical pairs
      #|10 basis elements and 19 critical pairs
      #|11 basis elements and 26 critical pairs
      #|11 basis elements and 25 critical pairs
      #|11 basis elements and 24 critical pairs
      #|11 basis elements and 23 critical pairs
      #|12 basis elements and 27 critical pairs
      #|12 basis elements and 26 critical pairs
      #|13 basis elements and 33 critical pairs
      #|13 basis elements and 32 critical pairs
      #|13 basis elements and 31 critical pairs
      #|13 basis elements and 30 critical pairs
      #|13 basis elements and 29 critical pairs
      #|14 basis elements and 37 critical pairs
      #|14 basis elements and 36 critical pairs
      #|14 basis elements and 35 critical pairs
      #|14 basis elements and 34 critical pairs
      #|14 basis elements and 33 critical pairs
      #|14 basis elements and 32 critical pairs
      #|14 basis elements and 31 critical pairs
      #|14 basis elements and 30 critical pairs
      #|15 basis elements and 37 critical pairs
      #|16 basis elements and 46 critical pairs
      #|16 basis elements and 45 critical pairs
      #|17 basis elements and 54 critical pairs
      #|17 basis elements and 53 critical pairs
      #|17 basis elements and 52 critical pairs
      #|17 basis elements and 51 critical pairs
      #|17 basis elements and 50 critical pairs
      #|17 basis elements and 49 critical pairs
      #|17 basis elements and 48 critical pairs
      #|17 basis elements and 47 critical pairs
      #|17 basis elements and 46 critical pairs
      #|17 basis elements and 45 critical pairs
      #|17 basis elements and 44 critical pairs
      #|17 basis elements and 43 critical pairs
      #|17 basis elements and 42 critical pairs
      #|17 basis elements and 41 critical pairs
      #|17 basis elements and 40 critical pairs
      #|17 basis elements and 39 critical pairs
      #|17 basis elements and 38 critical pairs
      #|17 basis elements and 37 critical pairs
      #|17 basis elements and 36 critical pairs
      #|17 basis elements and 35 critical pairs
      #|17 basis elements and 34 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|17 basis elements and 30 critical pairs
      #|17 basis elements and 29 critical pairs
      #|17 basis elements and 28 critical pairs
      #|17 basis elements and 27 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|17 basis elements and 24 critical pairs
      #|17 basis elements and 23 critical pairs
      #|17 basis elements and 22 critical pairs
      #|17 basis elements and 21 critical pairs
      #|17 basis elements and 20 critical pairs
      #|17 basis elements and 19 critical pairs
      #|17 basis elements and 18 critical pairs
      #|17 basis elements and 17 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|17 basis elements and 12 critical pairs
      #|17 basis elements and 11 critical pairs
      #|17 basis elements and 10 critical pairs
      #|17 basis elements and 9 critical pairs
      #|17 basis elements and 8 critical pairs
      #|17 basis elements and 7 critical pairs
      #|17 basis elements and 6 critical pairs
      #|17 basis elements and 5 critical pairs
      #|17 basis elements and 4 critical pairs
      #|17 basis elements and 3 critical pairs
      #|17 basis elements and 2 critical pairs
      #|17 basis elements and 1 critical pairs
      #|17 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 7 critical pairs
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 14 critical pairs
      #|9 basis elements and 20 critical pairs
      #|10 basis elements and 26 critical pairs
      #|10 basis elements and 25 critical pairs
      #|11 basis elements and 31 critical pairs
      #|12 basis elements and 35 critical pairs
      #|12 basis elements and 34 critical pairs
      #|13 basis elements and 41 critical pairs
      #|13 basis elements and 40 critical pairs
      #|13 basis elements and 39 critical pairs
      #|14 basis elements and 48 critical pairs
      #|14 basis elements and 47 critical pairs
      #|14 basis elements and 46 critical pairs
      #|14 basis elements and 45 critical pairs
      #|14 basis elements and 44 critical pairs
      #|14 basis elements and 43 critical pairs
      #|14 basis elements and 42 critical pairs
      #|15 basis elements and 51 critical pairs
      #|15 basis elements and 50 critical pairs
      #|15 basis elements and 49 critical pairs
      #|16 basis elements and 60 critical pairs
      #|16 basis elements and 59 critical pairs
      #|16 basis elements and 58 critical pairs
      #|16 basis elements and 57 critical pairs
      #|16 basis elements and 56 critical pairs
      #|16 basis elements and 55 critical pairs
      #|16 basis elements and 54 critical pairs
      #|17 basis elements and 67 critical pairs
      #|18 basis elements and 80 critical pairs
      #|19 basis elements and 90 critical pairs
      #|19 basis elements and 89 critical pairs
      #|20 basis elements and 99 critical pairs
      #|20 basis elements and 98 critical pairs
      #|20 basis elements and 97 critical pairs
      #|20 basis elements and 96 critical pairs
      #|20 basis elements and 95 critical pairs
      #|20 basis elements and 94 critical pairs
      #|20 basis elements and 93 critical pairs
      #|20 basis elements and 92 critical pairs
      #|20 basis elements and 91 critical pairs
      #|20 basis elements and 90 critical pairs
      #|20 basis elements and 89 critical pairs
      #|20 basis elements and 88 critical pairs
      #|20 basis elements and 87 critical pairs
      #|20 basis elements and 86 critical pairs
      #|20 basis elements and 85 critical pairs
      #|20 basis elements and 84 critical pairs
      #|20 basis elements and 83 critical pairs
      #|20 basis elements and 82 critical pairs
      #|20 basis elements and 81 critical pairs
      #|20 basis elements and 80 critical pairs
      #|20 basis elements and 79 critical pairs
      #|20 basis elements and 78 critical pairs
      #|20 basis elements and 77 critical pairs
      #|20 basis elements and 76 critical pairs
      #|20 basis elements and 75 critical pairs
      #|20 basis elements and 74 critical pairs
      #|20 basis elements and 73 critical pairs
      #|20 basis elements and 72 critical pairs
      #|20 basis elements and 71 critical pairs
      #|20 basis elements and 70 critical pairs
      #|20 basis elements and 69 critical pairs
      #|20 basis elements and 68 critical pairs
      #|20 basis elements and 67 critical pairs
      #|20 basis elements and 66 critical pairs
      #|20 basis elements and 65 critical pairs
      #|20 basis elements and 64 critical pairs
      #|20 basis elements and 63 critical pairs
      #|21 basis elements and 75 critical pairs
      #|22 basis elements and 88 critical pairs
      #|22 basis elements and 87 critical pairs
      #|22 basis elements and 86 critical pairs
      #|22 basis elements and 85 critical pairs
      #|22 basis elements and 84 critical pairs
      #|22 basis elements and 83 critical pairs
      #|22 basis elements and 82 critical pairs
      #|22 basis elements and 81 critical pairs
      #|22 basis elements and 80 critical pairs
      #|22 basis elements and 79 critical pairs
      #|22 basis elements and 78 critical pairs
      #|23 basis elements and 91 critical pairs
      #|23 basis elements and 90 critical pairs
      #|23 basis elements and 89 critical pairs
      #|23 basis elements and 88 critical pairs
      #|23 basis elements and 87 critical pairs
      #|23 basis elements and 86 critical pairs
      #|23 basis elements and 85 critical pairs
      #|23 basis elements and 84 critical pairs
      #|23 basis elements and 83 critical pairs
      #|23 basis elements and 82 critical pairs
      #|23 basis elements and 81 critical pairs
      #|23 basis elements and 80 critical pairs
      #|23 basis elements and 79 critical pairs
      #|23 basis elements and 78 critical pairs
      #|23 basis elements and 77 critical pairs
      #|23 basis elements and 76 critical pairs
      #|23 basis elements and 75 critical pairs
      #|23 basis elements and 74 critical pairs
      #|23 basis elements and 73 critical pairs
      #|23 basis elements and 72 critical pairs
      #|23 basis elements and 71 critical pairs
      #|23 basis elements and 70 critical pairs
      #|23 basis elements and 69 critical pairs
      #|23 basis elements and 68 critical pairs
      #|23 basis elements and 67 critical pairs
      #|23 basis elements and 66 critical pairs
      #|23 basis elements and 65 critical pairs
      #|23 basis elements and 64 critical pairs
      #|23 basis elements and 63 critical pairs
      #|23 basis elements and 62 critical pairs
      #|23 basis elements and 61 critical pairs
      #|23 basis elements and 60 critical pairs
      #|23 basis elements and 59 critical pairs
      #|23 basis elements and 58 critical pairs
      #|23 basis elements and 57 critical pairs
      #|23 basis elements and 56 critical pairs
      #|23 basis elements and 55 critical pairs
      #|23 basis elements and 54 critical pairs
      #|23 basis elements and 53 critical pairs
      #|23 basis elements and 52 critical pairs
      #|23 basis elements and 51 critical pairs
      #|23 basis elements and 50 critical pairs
      #|23 basis elements and 49 critical pairs
      #|23 basis elements and 48 critical pairs
      #|23 basis elements and 47 critical pairs
      #|23 basis elements and 46 critical pairs
      #|23 basis elements and 45 critical pairs
      #|23 basis elements and 44 critical pairs
      #|23 basis elements and 43 critical pairs
      #|23 basis elements and 42 critical pairs
      #|23 basis elements and 41 critical pairs
      #|23 basis elements and 40 critical pairs
      #|23 basis elements and 39 critical pairs
      #|23 basis elements and 38 critical pairs
      #|23 basis elements and 37 critical pairs
      #|23 basis elements and 36 critical pairs
      #|23 basis elements and 35 critical pairs
      #|23 basis elements and 34 critical pairs
      #|23 basis elements and 33 critical pairs
      #|23 basis elements and 32 critical pairs
      #|23 basis elements and 31 critical pairs
      #|23 basis elements and 30 critical pairs
      #|23 basis elements and 29 critical pairs
      #|23 basis elements and 28 critical pairs
      #|23 basis elements and 27 critical pairs
      #|23 basis elements and 26 critical pairs
      #|23 basis elements and 25 critical pairs
      #|23 basis elements and 24 critical pairs
      #|23 basis elements and 23 critical pairs
      #|23 basis elements and 22 critical pairs
      #|23 basis elements and 21 critical pairs
      #|23 basis elements and 20 critical pairs
      #|23 basis elements and 19 critical pairs
      #|23 basis elements and 18 critical pairs
      #|23 basis elements and 17 critical pairs
      #|23 basis elements and 16 critical pairs
      #|23 basis elements and 15 critical pairs
      #|23 basis elements and 14 critical pairs
      #|23 basis elements and 13 critical pairs
      #|23 basis elements and 12 critical pairs
      #|23 basis elements and 11 critical pairs
      #|23 basis elements and 10 critical pairs
      #|23 basis elements and 9 critical pairs
      #|23 basis elements and 8 critical pairs
      #|23 basis elements and 7 critical pairs
      #|23 basis elements and 6 critical pairs
      #|23 basis elements and 5 critical pairs
      #|23 basis elements and 4 critical pairs
      #|23 basis elements and 3 critical pairs
      #|23 basis elements and 2 critical pairs
      #|23 basis elements and 1 critical pairs
      #|23 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 19 critical pairs
      #|10 basis elements and 18 critical pairs
      #|10 basis elements and 17 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 20 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 24 critical pairs
      #|13 basis elements and 23 critical pairs
      #|13 basis elements and 22 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|14 basis elements and 26 critical pairs
      #|14 basis elements and 25 critical pairs
      #|14 basis elements and 24 critical pairs
      #|14 basis elements and 23 critical pairs
      #|14 basis elements and 22 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|14 basis elements and 16 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|15 basis elements and 23 critical pairs
      #|16 basis elements and 34 critical pairs
      #|16 basis elements and 33 critical pairs
      #|17 basis elements and 46 critical pairs
      #|18 basis elements and 55 critical pairs
      #|18 basis elements and 54 critical pairs
      #|19 basis elements and 69 critical pairs
      #|20 basis elements and 80 critical pairs
      #|20 basis elements and 79 critical pairs
      #|21 basis elements and 93 critical pairs
      #|22 basis elements and 101 critical pairs
      #|22 basis elements and 100 critical pairs
      #|23 basis elements and 115 critical pairs
      #|24 basis elements and 134 critical pairs
      #|25 basis elements and 154 critical pairs
      #|25 basis elements and 153 critical pairs
      #|25 basis elements and 152 critical pairs
      #|25 basis elements and 151 critical pairs
      #|26 basis elements and 170 critical pairs
      #|26 basis elements and 169 critical pairs
      #|27 basis elements and 190 critical pairs
      #|27 basis elements and 189 critical pairs
      #|27 basis elements and 188 critical pairs
      #|28 basis elements and 208 critical pairs
      #|28 basis elements and 207 critical pairs
      #|28 basis elements and 206 critical pairs
      #|28 basis elements and 205 critical pairs
      #|28 basis elements and 204 critical pairs
      #|29 basis elements and 222 critical pairs
      #|29 basis elements and 221 critical pairs
      #|29 basis elements and 220 critical pairs
      #|29 basis elements and 219 critical pairs
      #|29 basis elements and 218 critical pairs
      #|29 basis elements and 217 critical pairs
      #|29 basis elements and 216 critical pairs
      #|29 basis elements and 215 critical pairs
      #|30 basis elements and 237 critical pairs
      #|30 basis elements and 236 critical pairs
      #|30 basis elements and 235 critical pairs
      #|30 basis elements and 234 critical pairs
      #|30 basis elements and 233 critical pairs
      #|30 basis elements and 232 critical pairs
      #|30 basis elements and 231 critical pairs
      #|31 basis elements and 257 critical pairs
      #|32 basis elements and 284 critical pairs
      #|33 basis elements and 312 critical pairs
      #|33 basis elements and 311 critical pairs
      #|33 basis elements and 310 critical pairs
      #|33 basis elements and 309 critical pairs
      #|34 basis elements and 336 critical pairs
      #|34 basis elements and 335 critical pairs
      #|35 basis elements and 368 critical pairs
      #|35 basis elements and 367 critical pairs
      #|35 basis elements and 366 critical pairs
      #|35 basis elements and 365 critical pairs
      #|36 basis elements and 393 critical pairs
      #|36 basis elements and 392 critical pairs
      #|36 basis elements and 391 critical pairs
      #|36 basis elements and 390 critical pairs
      #|36 basis elements and 389 critical pairs
      #|37 basis elements and 421 critical pairs
      #|37 basis elements and 420 critical pairs
      #|37 basis elements and 419 critical pairs
      #|37 basis elements and 418 critical pairs
      #|37 basis elements and 417 critical pairs
      #|37 basis elements and 416 critical pairs
      #|37 basis elements and 415 critical pairs
      #|37 basis elements and 414 critical pairs
      #|37 basis elements and 413 critical pairs
      #|37 basis elements and 412 critical pairs
      #|38 basis elements and 439 critical pairs
      #|38 basis elements and 438 critical pairs
      #|38 basis elements and 437 critical pairs
      #|38 basis elements and 436 critical pairs
      #|38 basis elements and 435 critical pairs
      #|38 basis elements and 434 critical pairs
      #|38 basis elements and 433 critical pairs
      #|39 basis elements and 464 critical pairs
      #|39 basis elements and 463 critical pairs
      #|39 basis elements and 462 critical pairs
      #|39 basis elements and 461 critical pairs
      #|39 basis elements and 460 critical pairs
      #|39 basis elements and 459 critical pairs
      #|39 basis elements and 458 critical pairs
      #|39 basis elements and 457 critical pairs
      #|40 basis elements and 492 critical pairs
      #|41 basis elements and 522 critical pairs
      #|41 basis elements and 521 critical pairs
      #|41 basis elements and 520 critical pairs
      #|41 basis elements and 519 critical pairs
      #|41 basis elements and 518 critical pairs
      #|41 basis elements and 517 critical pairs
      #|41 basis elements and 516 critical pairs
      #|41 basis elements and 515 critical pairs
      #|41 basis elements and 514 critical pairs
      #|41 basis elements and 513 critical pairs
      #|41 basis elements and 512 critical pairs
      #|41 basis elements and 511 critical pairs
      #|41 basis elements and 510 critical pairs
      #|41 basis elements and 509 critical pairs
      #|41 basis elements and 508 critical pairs
      #|41 basis elements and 507 critical pairs
      #|41 basis elements and 506 critical pairs
      #|41 basis elements and 505 critical pairs
      #|41 basis elements and 504 critical pairs
      #|41 basis elements and 503 critical pairs
      #|41 basis elements and 502 critical pairs
      #|41 basis elements and 501 critical pairs
      #|41 basis elements and 500 critical pairs
      #|41 basis elements and 499 critical pairs
      #|41 basis elements and 498 critical pairs
      #|41 basis elements and 497 critical pairs
      #|41 basis elements and 496 critical pairs
      #|41 basis elements and 495 critical pairs
      #|41 basis elements and 494 critical pairs
      #|41 basis elements and 493 critical pairs
      #|41 basis elements and 492 critical pairs
      #|41 basis elements and 491 critical pairs
      #|41 basis elements and 490 critical pairs
      #|41 basis elements and 489 critical pairs
      #|41 basis elements and 488 critical pairs
      #|41 basis elements and 487 critical pairs
      #|41 basis elements and 486 critical pairs
      #|41 basis elements and 485 critical pairs
      #|41 basis elements and 484 critical pairs
      #|41 basis elements and 483 critical pairs
      #|41 basis elements and 482 critical pairs
      #|41 basis elements and 481 critical pairs
      #|41 basis elements and 480 critical pairs
      #|41 basis elements and 479 critical pairs
      #|41 basis elements and 478 critical pairs
      #|41 basis elements and 477 critical pairs
      #|41 basis elements and 476 critical pairs
      #|41 basis elements and 475 critical pairs
      #|41 basis elements and 474 critical pairs
      #|41 basis elements and 473 critical pairs
      #|41 basis elements and 472 critical pairs
      #|41 basis elements and 471 critical pairs
      #|41 basis elements and 470 critical pairs
      #|41 basis elements and 469 critical pairs
      #|41 basis elements and 468 critical pairs
      #|41 basis elements and 467 critical pairs
      #|41 basis elements and 466 critical pairs
      #|41 basis elements and 465 critical pairs
      #|41 basis elements and 464 critical pairs
      #|41 basis elements and 463 critical pairs
      #|41 basis elements and 462 critical pairs
      #|41 basis elements and 461 critical pairs
      #|41 basis elements and 460 critical pairs
      #|41 basis elements and 459 critical pairs
      #|41 basis elements and 458 critical pairs
      #|41 basis elements and 457 critical pairs
      #|41 basis elements and 456 critical pairs
      #|41 basis elements and 455 critical pairs
      #|41 basis elements and 454 critical pairs
      #|41 basis elements and 453 critical pairs
      #|41 basis elements and 452 critical pairs
      #|41 basis elements and 451 critical pairs
      #|41 basis elements and 450 critical pairs
      #|41 basis elements and 449 critical pairs
      #|41 basis elements and 448 critical pairs
      #|41 basis elements and 447 critical pairs
      #|41 basis elements and 446 critical pairs
      #|41 basis elements and 445 critical pairs
      #|41 basis elements and 444 critical pairs
      #|41 basis elements and 443 critical pairs
      #|41 basis elements and 442 critical pairs
      #|41 basis elements and 441 critical pairs
      #|41 basis elements and 440 critical pairs
      #|41 basis elements and 439 critical pairs
      #|41 basis elements and 438 critical pairs
      #|41 basis elements and 437 critical pairs
      #|41 basis elements and 436 critical pairs
      #|41 basis elements and 435 critical pairs
      #|41 basis elements and 434 critical pairs
      #|41 basis elements and 433 critical pairs
      #|41 basis elements and 432 critical pairs
      #|41 basis elements and 431 critical pairs
      #|41 basis elements and 430 critical pairs
      #|41 basis elements and 429 critical pairs
      #|41 basis elements and 428 critical pairs
      #|41 basis elements and 427 critical pairs
      #|41 basis elements and 426 critical pairs
      #|41 basis elements and 425 critical pairs
      #|41 basis elements and 424 critical pairs
      #|41 basis elements and 423 critical pairs
      #|41 basis elements and 422 critical pairs
      #|41 basis elements and 421 critical pairs
      #|41 basis elements and 420 critical pairs
      #|41 basis elements and 419 critical pairs
      #|41 basis elements and 418 critical pairs
      #|41 basis elements and 417 critical pairs
      #|41 basis elements and 416 critical pairs
      #|41 basis elements and 415 critical pairs
      #|41 basis elements and 414 critical pairs
      #|41 basis elements and 413 critical pairs
      #|41 basis elements and 412 critical pairs
      #|41 basis elements and 411 critical pairs
      #|41 basis elements and 410 critical pairs
      #|41 basis elements and 409 critical pairs
      #|41 basis elements and 408 critical pairs
      #|41 basis elements and 407 critical pairs
      #|41 basis elements and 406 critical pairs
      #|41 basis elements and 405 critical pairs
      #|41 basis elements and 404 critical pairs
      #|41 basis elements and 403 critical pairs
      #|41 basis elements and 402 critical pairs
      #|41 basis elements and 401 critical pairs
      #|41 basis elements and 400 critical pairs
      #|41 basis elements and 399 critical pairs
      #|41 basis elements and 398 critical pairs
      #|41 basis elements and 397 critical pairs
      #|41 basis elements and 396 critical pairs
      #|41 basis elements and 395 critical pairs
      #|41 basis elements and 394 critical pairs
      #|41 basis elements and 393 critical pairs
      #|41 basis elements and 392 critical pairs
      #|41 basis elements and 391 critical pairs
      #|41 basis elements and 390 critical pairs
      #|41 basis elements and 389 critical pairs
      #|41 basis elements and 388 critical pairs
      #|41 basis elements and 387 critical pairs
      #|41 basis elements and 386 critical pairs
      #|41 basis elements and 385 critical pairs
      #|41 basis elements and 384 critical pairs
      #|41 basis elements and 383 critical pairs
      #|41 basis elements and 382 critical pairs
      #|41 basis elements and 381 critical pairs
      #|41 basis elements and 380 critical pairs
      #|41 basis elements and 379 critical pairs
      #|41 basis elements and 378 critical pairs
      #|41 basis elements and 377 critical pairs
      #|41 basis elements and 376 critical pairs
      #|41 basis elements and 375 critical pairs
      #|41 basis elements and 374 critical pairs
      #|41 basis elements and 373 critical pairs
      #|41 basis elements and 372 critical pairs
      #|41 basis elements and 371 critical pairs
      #|41 basis elements and 370 critical pairs
      #|41 basis elements and 369 critical pairs
      #|41 basis elements and 368 critical pairs
      #|41 basis elements and 367 critical pairs
      #|41 basis elements and 366 critical pairs
      #|41 basis elements and 365 critical pairs
      #|41 basis elements and 364 critical pairs
      #|41 basis elements and 363 critical pairs
      #|41 basis elements and 362 critical pairs
      #|41 basis elements and 361 critical pairs
      #|41 basis elements and 360 critical pairs
      #|41 basis elements and 359 critical pairs
      #|41 basis elements and 358 critical pairs
      #|41 basis elements and 357 critical pairs
      #|41 basis elements and 356 critical pairs
      #|41 basis elements and 355 critical pairs
      #|41 basis elements and 354 critical pairs
      #|41 basis elements and 353 critical pairs
      #|41 basis elements and 352 critical pairs
      #|41 basis elements and 351 critical pairs
      #|41 basis elements and 350 critical pairs
      #|41 basis elements and 349 critical pairs
      #|41 basis elements and 348 critical pairs
      #|41 basis elements and 347 critical pairs
      #|41 basis elements and 346 critical pairs
      #|41 basis elements and 345 critical pairs
      #|41 basis elements and 344 critical pairs
      #|41 basis elements and 343 critical pairs
      #|41 basis elements and 342 critical pairs
      #|41 basis elements and 341 critical pairs
      #|41 basis elements and 340 critical pairs
      #|41 basis elements and 339 critical pairs
      #|41 basis elements and 338 critical pairs
      #|41 basis elements and 337 critical pairs
      #|41 basis elements and 336 critical pairs
      #|41 basis elements and 335 critical pairs
      #|41 basis elements and 334 critical pairs
      #|41 basis elements and 333 critical pairs
      #|41 basis elements and 332 critical pairs
      #|41 basis elements and 331 critical pairs
      #|41 basis elements and 330 critical pairs
      #|41 basis elements and 329 critical pairs
      #|41 basis elements and 328 critical pairs
      #|41 basis elements and 327 critical pairs
      #|41 basis elements and 326 critical pairs
      #|41 basis elements and 325 critical pairs
      #|41 basis elements and 324 critical pairs
      #|41 basis elements and 323 critical pairs
      #|41 basis elements and 322 critical pairs
      #|41 basis elements and 321 critical pairs
      #|41 basis elements and 320 critical pairs
      #|41 basis elements and 319 critical pairs
      #|41 basis elements and 318 critical pairs
      #|41 basis elements and 317 critical pairs
      #|41 basis elements and 316 critical pairs
      #|41 basis elements and 315 critical pairs
      #|41 basis elements and 314 critical pairs
      #|41 basis elements and 313 critical pairs
      #|41 basis elements and 312 critical pairs
      #|41 basis elements and 311 critical pairs
      #|41 basis elements and 310 critical pairs
      #|41 basis elements and 309 critical pairs
      #|41 basis elements and 308 critical pairs
      #|41 basis elements and 307 critical pairs
      #|41 basis elements and 306 critical pairs
      #|41 basis elements and 305 critical pairs
      #|41 basis elements and 304 critical pairs
      #|41 basis elements and 303 critical pairs
      #|41 basis elements and 302 critical pairs
      #|41 basis elements and 301 critical pairs
      #|41 basis elements and 300 critical pairs
      #|41 basis elements and 299 critical pairs
      #|41 basis elements and 298 critical pairs
      #|41 basis elements and 297 critical pairs
      #|41 basis elements and 296 critical pairs
      #|41 basis elements and 295 critical pairs
      #|41 basis elements and 294 critical pairs
      #|41 basis elements and 293 critical pairs
      #|41 basis elements and 292 critical pairs
      #|41 basis elements and 291 critical pairs
      #|41 basis elements and 290 critical pairs
      #|41 basis elements and 289 critical pairs
      #|41 basis elements and 288 critical pairs
      #|41 basis elements and 287 critical pairs
      #|41 basis elements and 286 critical pairs
      #|41 basis elements and 285 critical pairs
      #|41 basis elements and 284 critical pairs
      #|41 basis elements and 283 critical pairs
      #|41 basis elements and 282 critical pairs
      #|41 basis elements and 281 critical pairs
      #|41 basis elements and 280 critical pairs
      #|41 basis elements and 279 critical pairs
      #|41 basis elements and 278 critical pairs
      #|41 basis elements and 277 critical pairs
      #|41 basis elements and 276 critical pairs
      #|41 basis elements and 275 critical pairs
      #|41 basis elements and 274 critical pairs
      #|41 basis elements and 273 critical pairs
      #|41 basis elements and 272 critical pairs
      #|41 basis elements and 271 critical pairs
      #|41 basis elements and 270 critical pairs
      #|41 basis elements and 269 critical pairs
      #|41 basis elements and 268 critical pairs
      #|41 basis elements and 267 critical pairs
      #|41 basis elements and 266 critical pairs
      #|42 basis elements and 294 critical pairs
      #|43 basis elements and 323 critical pairs
      #|43 basis elements and 322 critical pairs
      #|43 basis elements and 321 critical pairs
      #|43 basis elements and 320 critical pairs
      #|43 basis elements and 319 critical pairs
      #|43 basis elements and 318 critical pairs
      #|43 basis elements and 317 critical pairs
      #|43 basis elements and 316 critical pairs
      #|43 basis elements and 315 critical pairs
      #|43 basis elements and 314 critical pairs
      #|43 basis elements and 313 critical pairs
      #|44 basis elements and 340 critical pairs
      #|44 basis elements and 339 critical pairs
      #|44 basis elements and 338 critical pairs
      #|44 basis elements and 337 critical pairs
      #|44 basis elements and 336 critical pairs
      #|44 basis elements and 335 critical pairs
      #|44 basis elements and 334 critical pairs
      #|44 basis elements and 333 critical pairs
      #|44 basis elements and 332 critical pairs
      #|44 basis elements and 331 critical pairs
      #|44 basis elements and 330 critical pairs
      #|44 basis elements and 329 critical pairs
      #|44 basis elements and 328 critical pairs
      #|44 basis elements and 327 critical pairs
      #|44 basis elements and 326 critical pairs
      #|44 basis elements and 325 critical pairs
      #|44 basis elements and 324 critical pairs
      #|44 basis elements and 323 critical pairs
      #|44 basis elements and 322 critical pairs
      #|44 basis elements and 321 critical pairs
      #|44 basis elements and 320 critical pairs
      #|44 basis elements and 319 critical pairs
      #|44 basis elements and 318 critical pairs
      #|44 basis elements and 317 critical pairs
      #|44 basis elements and 316 critical pairs
      #|44 basis elements and 315 critical pairs
      #|44 basis elements and 314 critical pairs
      #|44 basis elements and 313 critical pairs
      #|44 basis elements and 312 critical pairs
      #|44 basis elements and 311 critical pairs
      #|44 basis elements and 310 critical pairs
      #|44 basis elements and 309 critical pairs
      #|44 basis elements and 308 critical pairs
      #|44 basis elements and 307 critical pairs
      #|44 basis elements and 306 critical pairs
      #|44 basis elements and 305 critical pairs
      #|44 basis elements and 304 critical pairs
      #|44 basis elements and 303 critical pairs
      #|44 basis elements and 302 critical pairs
      #|44 basis elements and 301 critical pairs
      #|44 basis elements and 300 critical pairs
      #|44 basis elements and 299 critical pairs
      #|44 basis elements and 298 critical pairs
      #|44 basis elements and 297 critical pairs
      #|44 basis elements and 296 critical pairs
      #|44 basis elements and 295 critical pairs
      #|44 basis elements and 294 critical pairs
      #|44 basis elements and 293 critical pairs
      #|44 basis elements and 292 critical pairs
      #|44 basis elements and 291 critical pairs
      #|44 basis elements and 290 critical pairs
      #|44 basis elements and 289 critical pairs
      #|44 basis elements and 288 critical pairs
      #|44 basis elements and 287 critical pairs
      #|44 basis elements and 286 critical pairs
      #|44 basis elements and 285 critical pairs
      #|44 basis elements and 284 critical pairs
      #|44 basis elements and 283 critical pairs
      #|44 basis elements and 282 critical pairs
      #|44 basis elements and 281 critical pairs
      #|44 basis elements and 280 critical pairs
      #|44 basis elements and 279 critical pairs
      #|44 basis elements and 278 critical pairs
      #|44 basis elements and 277 critical pairs
      #|44 basis elements and 276 critical pairs
      #|44 basis elements and 275 critical pairs
      #|44 basis elements and 274 critical pairs
      #|44 basis elements and 273 critical pairs
      #|44 basis elements and 272 critical pairs
      #|44 basis elements and 271 critical pairs
      #|44 basis elements and 270 critical pairs
      #|44 basis elements and 269 critical pairs
      #|44 basis elements and 268 critical pairs
      #|44 basis elements and 267 critical pairs
      #|44 basis elements and 266 critical pairs
      #|44 basis elements and 265 critical pairs
      #|44 basis elements and 264 critical pairs
      #|44 basis elements and 263 critical pairs
      #|44 basis elements and 262 critical pairs
      #|44 basis elements and 261 critical pairs
      #|44 basis elements and 260 critical pairs
      #|44 basis elements and 259 critical pairs
      #|44 basis elements and 258 critical pairs
      #|44 basis elements and 257 critical pairs
      #|44 basis elements and 256 critical pairs
      #|44 basis elements and 255 critical pairs
      #|44 basis elements and 254 critical pairs
      #|44 basis elements and 253 critical pairs
      #|44 basis elements and 252 critical pairs
      #|44 basis elements and 251 critical pairs
      #|44 basis elements and 250 critical pairs
      #|44 basis elements and 249 critical pairs
      #|44 basis elements and 248 critical pairs
      #|44 basis elements and 247 critical pairs
      #|44 basis elements and 246 critical pairs
      #|44 basis elements and 245 critical pairs
      #|44 basis elements and 244 critical pairs
      #|44 basis elements and 243 critical pairs
      #|44 basis elements and 242 critical pairs
      #|44 basis elements and 241 critical pairs
      #|44 basis elements and 240 critical pairs
      #|44 basis elements and 239 critical pairs
      #|44 basis elements and 238 critical pairs
      #|44 basis elements and 237 critical pairs
      #|44 basis elements and 236 critical pairs
      #|44 basis elements and 235 critical pairs
      #|44 basis elements and 234 critical pairs
      #|44 basis elements and 233 critical pairs
      #|44 basis elements and 232 critical pairs
      #|44 basis elements and 231 critical pairs
      #|44 basis elements and 230 critical pairs
      #|44 basis elements and 229 critical pairs
      #|44 basis elements and 228 critical pairs
      #|44 basis elements and 227 critical pairs
      #|44 basis elements and 226 critical pairs
      #|44 basis elements and 225 critical pairs
      #|44 basis elements and 224 critical pairs
      #|44 basis elements and 223 critical pairs
      #|44 basis elements and 222 critical pairs
      #|44 basis elements and 221 critical pairs
      #|44 basis elements and 220 critical pairs
      #|44 basis elements and 219 critical pairs
      #|44 basis elements and 218 critical pairs
      #|44 basis elements and 217 critical pairs
      #|44 basis elements and 216 critical pairs
      #|44 basis elements and 215 critical pairs
      #|44 basis elements and 214 critical pairs
      #|44 basis elements and 213 critical pairs
      #|44 basis elements and 212 critical pairs
      #|44 basis elements and 211 critical pairs
      #|44 basis elements and 210 critical pairs
      #|44 basis elements and 209 critical pairs
      #|44 basis elements and 208 critical pairs
      #|44 basis elements and 207 critical pairs
      #|44 basis elements and 206 critical pairs
      #|44 basis elements and 205 critical pairs
      #|44 basis elements and 204 critical pairs
      #|44 basis elements and 203 critical pairs
      #|44 basis elements and 202 critical pairs
      #|44 basis elements and 201 critical pairs
      #|44 basis elements and 200 critical pairs
      #|44 basis elements and 199 critical pairs
      #|44 basis elements and 198 critical pairs
      #|44 basis elements and 197 critical pairs
      #|44 basis elements and 196 critical pairs
      #|44 basis elements and 195 critical pairs
      #|44 basis elements and 194 critical pairs
      #|44 basis elements and 193 critical pairs
      #|44 basis elements and 192 critical pairs
      #|44 basis elements and 191 critical pairs
      #|44 basis elements and 190 critical pairs
      #|44 basis elements and 189 critical pairs
      #|44 basis elements and 188 critical pairs
      #|44 basis elements and 187 critical pairs
      #|44 basis elements and 186 critical pairs
      #|44 basis elements and 185 critical pairs
      #|44 basis elements and 184 critical pairs
      #|44 basis elements and 183 critical pairs
      #|44 basis elements and 182 critical pairs
      #|44 basis elements and 181 critical pairs
      #|44 basis elements and 180 critical pairs
      #|44 basis elements and 179 critical pairs
      #|44 basis elements and 178 critical pairs
      #|44 basis elements and 177 critical pairs
      #|44 basis elements and 176 critical pairs
      #|44 basis elements and 175 critical pairs
      #|44 basis elements and 174 critical pairs
      #|44 basis elements and 173 critical pairs
      #|44 basis elements and 172 critical pairs
      #|44 basis elements and 171 critical pairs
      #|44 basis elements and 170 critical pairs
      #|44 basis elements and 169 critical pairs
      #|44 basis elements and 168 critical pairs
      #|44 basis elements and 167 critical pairs
      #|44 basis elements and 166 critical pairs
      #|44 basis elements and 165 critical pairs
      #|44 basis elements and 164 critical pairs
      #|44 basis elements and 163 critical pairs
      #|44 basis elements and 162 critical pairs
      #|44 basis elements and 161 critical pairs
      #|44 basis elements and 160 critical pairs
      #|44 basis elements and 159 critical pairs
      #|44 basis elements and 158 critical pairs
      #|44 basis elements and 157 critical pairs
      #|44 basis elements and 156 critical pairs
      #|44 basis elements and 155 critical pairs
      #|44 basis elements and 154 critical pairs
      #|44 basis elements and 153 critical pairs
      #|44 basis elements and 152 critical pairs
      #|44 basis elements and 151 critical pairs
      #|44 basis elements and 150 critical pairs
      #|44 basis elements and 149 critical pairs
      #|44 basis elements and 148 critical pairs
      #|44 basis elements and 147 critical pairs
      #|44 basis elements and 146 critical pairs
      #|44 basis elements and 145 critical pairs
      #|44 basis elements and 144 critical pairs
      #|44 basis elements and 143 critical pairs
      #|44 basis elements and 142 critical pairs
      #|44 basis elements and 141 critical pairs
      #|44 basis elements and 140 critical pairs
      #|44 basis elements and 139 critical pairs
      #|44 basis elements and 138 critical pairs
      #|44 basis elements and 137 critical pairs
      #|44 basis elements and 136 critical pairs
      #|44 basis elements and 135 critical pairs
      #|44 basis elements and 134 critical pairs
      #|44 basis elements and 133 critical pairs
      #|44 basis elements and 132 critical pairs
      #|44 basis elements and 131 critical pairs
      #|44 basis elements and 130 critical pairs
      #|44 basis elements and 129 critical pairs
      #|44 basis elements and 128 critical pairs
      #|44 basis elements and 127 critical pairs
      #|44 basis elements and 126 critical pairs
      #|44 basis elements and 125 critical pairs
      #|44 basis elements and 124 critical pairs
      #|44 basis elements and 123 critical pairs
      #|44 basis elements and 122 critical pairs
      #|44 basis elements and 121 critical pairs
      #|44 basis elements and 120 critical pairs
      #|44 basis elements and 119 critical pairs
      #|44 basis elements and 118 critical pairs
      #|44 basis elements and 117 critical pairs
      #|44 basis elements and 116 critical pairs
      #|44 basis elements and 115 critical pairs
      #|44 basis elements and 114 critical pairs
      #|44 basis elements and 113 critical pairs
      #|44 basis elements and 112 critical pairs
      #|44 basis elements and 111 critical pairs
      #|44 basis elements and 110 critical pairs
      #|44 basis elements and 109 critical pairs
      #|44 basis elements and 108 critical pairs
      #|44 basis elements and 107 critical pairs
      #|44 basis elements and 106 critical pairs
      #|44 basis elements and 105 critical pairs
      #|44 basis elements and 104 critical pairs
      #|44 basis elements and 103 critical pairs
      #|44 basis elements and 102 critical pairs
      #|44 basis elements and 101 critical pairs
      #|44 basis elements and 100 critical pairs
      #|44 basis elements and 99 critical pairs
      #|44 basis elements and 98 critical pairs
      #|44 basis elements and 97 critical pairs
      #|44 basis elements and 96 critical pairs
      #|44 basis elements and 95 critical pairs
      #|44 basis elements and 94 critical pairs
      #|44 basis elements and 93 critical pairs
      #|44 basis elements and 92 critical pairs
      #|44 basis elements and 91 critical pairs
      #|44 basis elements and 90 critical pairs
      #|44 basis elements and 89 critical pairs
      #|44 basis elements and 88 critical pairs
      #|44 basis elements and 87 critical pairs
      #|44 basis elements and 86 critical pairs
      #|44 basis elements and 85 critical pairs
      #|44 basis elements and 84 critical pairs
      #|44 basis elements and 83 critical pairs
      #|44 basis elements and 82 critical pairs
      #|44 basis elements and 81 critical pairs
      #|44 basis elements and 80 critical pairs
      #|44 basis elements and 79 critical pairs
      #|44 basis elements and 78 critical pairs
      #|44 basis elements and 77 critical pairs
      #|44 basis elements and 76 critical pairs
      #|44 basis elements and 75 critical pairs
      #|44 basis elements and 74 critical pairs
      #|44 basis elements and 73 critical pairs
      #|44 basis elements and 72 critical pairs
      #|44 basis elements and 71 critical pairs
      #|44 basis elements and 70 critical pairs
      #|44 basis elements and 69 critical pairs
      #|44 basis elements and 68 critical pairs
      #|44 basis elements and 67 critical pairs
      #|44 basis elements and 66 critical pairs
      #|44 basis elements and 65 critical pairs
      #|44 basis elements and 64 critical pairs
      #|44 basis elements and 63 critical pairs
      #|44 basis elements and 62 critical pairs
      #|44 basis elements and 61 critical pairs
      #|44 basis elements and 60 critical pairs
      #|44 basis elements and 59 critical pairs
      #|44 basis elements and 58 critical pairs
      #|44 basis elements and 57 critical pairs
      #|44 basis elements and 56 critical pairs
      #|44 basis elements and 55 critical pairs
      #|44 basis elements and 54 critical pairs
      #|44 basis elements and 53 critical pairs
      #|44 basis elements and 52 critical pairs
      #|44 basis elements and 51 critical pairs
      #|44 basis elements and 50 critical pairs
      #|44 basis elements and 49 critical pairs
      #|44 basis elements and 48 critical pairs
      #|44 basis elements and 47 critical pairs
      #|44 basis elements and 46 critical pairs
      #|44 basis elements and 45 critical pairs
      #|44 basis elements and 44 critical pairs
      #|44 basis elements and 43 critical pairs
      #|44 basis elements and 42 critical pairs
      #|44 basis elements and 41 critical pairs
      #|44 basis elements and 40 critical pairs
      #|44 basis elements and 39 critical pairs
      #|44 basis elements and 38 critical pairs
      #|44 basis elements and 37 critical pairs
      #|44 basis elements and 36 critical pairs
      #|44 basis elements and 35 critical pairs
      #|44 basis elements and 34 critical pairs
      #|44 basis elements and 33 critical pairs
      #|44 basis elements and 32 critical pairs
      #|44 basis elements and 31 critical pairs
      #|44 basis elements and 30 critical pairs
      #|44 basis elements and 29 critical pairs
      #|44 basis elements and 28 critical pairs
      #|44 basis elements and 27 critical pairs
      #|44 basis elements and 26 critical pairs
      #|44 basis elements and 25 critical pairs
      #|44 basis elements and 24 critical pairs
      #|44 basis elements and 23 critical pairs
      #|44 basis elements and 22 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|44 basis elements and 19 critical pairs
      #|44 basis elements and 18 critical pairs
      #|44 basis elements and 17 critical pairs
      #|44 basis elements and 16 critical pairs
      #|44 basis elements and 15 critical pairs
      #|44 basis elements and 14 critical pairs
      #|44 basis elements and 13 critical pairs
      #|44 basis elements and 12 critical pairs
      #|44 basis elements and 11 critical pairs
      #|44 basis elements and 10 critical pairs
      #|44 basis elements and 9 critical pairs
      #|44 basis elements and 8 critical pairs
      #|44 basis elements and 7 critical pairs
      #|44 basis elements and 6 critical pairs
      #|44 basis elements and 5 critical pairs
      #|44 basis elements and 4 critical pairs
      #|44 basis elements and 3 critical pairs
      #|44 basis elements and 2 critical pairs
      #|44 basis elements and 1 critical pairs
      #|44 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 7 critical pairs
      #|9 basis elements and 11 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|11 basis elements and 11 critical pairs
      #|11 basis elements and 10 critical pairs
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|11 basis elements and 5 critical pairs
      #|11 basis elements and 4 critical pairs
      #|11 basis elements and 3 critical pairs
      #|11 basis elements and 2 critical pairs
      #|11 basis elements and 1 critical pairs
      #|11 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..7..12..22..47..79..123..solved at 145
      #|0..0..1..3..7..12..22..47..79..123..solved at 145
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..55..132..411..solved at 832
      #|0..0..1..solved at 4
      #|0..0..2..5..15..30..69..187..solved at 492
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..16..27..42..58..77..100..128..160..222..solved at 242
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..12..27..solved at 52
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..4..15..solved at 37
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..21..34..55..solved at 73
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|0..0..1..2..5..solved at 12
      #|0..0..1..2..5..solved at 11
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|0..0..2..9..19..47..102..172..273..486..879..solved at 1333
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..6..14..41..82..151..270..441..654..1139..1949..solved at 2548
      #|1 basis elements and 0 critical pairs
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 10
      #|0..0..2..solved at 7
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..8..solved at 12
      #|0..0..2..6..solved at 10
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..2..5..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..solved at 26
      #|0..0..1..2..solved at 6
      #|0..0..1..3..9..17..46..solved at 96
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..5..16..36..114..solved at 121
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..4..12..21..solved at 31
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..9..18..34..59..100..167..solved at 240
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..3..11..solved at 23
      #|0..0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..0..0..3..11..solved at 23
      #|0..0..1..solved at 5
      #|0..0..0..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..1..3..5..solved at 11
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..3..solved at 9
      #|0..0..2..4..6..14..26..solved at 42
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..solved at 13
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..7..12..solved at 19
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..4..10..16..31..solved at 42
      #|0..0..1..solved at 5
      #|0..0..1..2..5..9..15..22..31..44..62..solved at 80
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..2..7..13..solved at 19
      #|0..0..1..3..7..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..2..5..12..22..solved at 33
      #|0..0..1..3..7..solved at 12
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..5..7..9..15..21..27..solved at 44
      #|0..0..0..1..solved at 5
      #|0..0..0..1..3..7..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..0..1..2..3..7..11..15..28..41..54..solved at 140
      #|0..0..1..2..3..7..12..17..33..49..65..97..129..161..solved at 201
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..0..0..0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..0..0..solved at 6
      #|0..0..1..2..5..9..15..25..40..66..123..229..496..solved at 530
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..0..1..2..3..6..12..19..29..44..60..90..132..174..237..347..461..671..924..1242..1638..2121..2674..3528..4540..5883..7460..9417..solved at 9827
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..6..9..12..solved at 20
      #|0..0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..16..solved at 25
      #|0..0..0..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..0..1..2..3..7..11..15..27..39..51..solved at 139
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 9
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..7..11..15..28..41..54..solved at 140
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..4..10..20..36..57..80..solved at 102
      #|0..0..0..0..4..10..20..36..solved at 56
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..1..2..3..6..12..20..32..49..67..101..149..197..269..393..521..756..1037..1386..1819..2341..2939..3838..4894..solved at 5394
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..0..3..7..13..23..37..56..84..121..167..232..306..397..505..632..811..1028..1316..1696..2170..2748..3498..4387..5428..6873..8564..10748..13749..solved at 17244
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..14..35..60..99..166..245..378..solved at 392
      #|0..0..4..8..20..44..77..154..265..solved at 316
      #|0..0..4..9..27..63..114..solved at 128
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..3..7..15..solved at 21
      #|0..0..3..6..13..30..55..solved at 72
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..4..10..22..41..solved at 51
      #|0..0..0..0..4..10..solved at 20
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..21..46..solved at 96
      #|0..0..1..2..5..9..15..22..29..36..solved at 45
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..29..44..68..108..150..213..348..523..solved at 570
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..18..40..86..solved at 175
      #|0..0..1..3..7..15..26..46..68..96..129..166..207..268..333..414..solved at 465
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..4..5..6..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..0..0..2..9..20..46..solved at 72
      #|0..0..0..2..6..solved at 11
      #|0..0..1..3..8..17..33..59..98..146..217..solved at 276
      #|0..0..1..2..5..9..15..solved at 24
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..12..21..solved at 31
      #|0..0..1..2..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..1..3..7..solved at 14
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..1..solved at 6
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..9..solved at 15
      #|0..0..0..0..1..4..9..solved at 17
      #|0..0..1..2..3..7..13..21..solved at 34
      #|0..0..1..2..11..25..52..solved at 59
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..7..15..26..46..77..solved at 96
      #|0..0..solved at 2
      #|0..0..0..0..1..4..9..solved at 22
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..0..0..2..4..6..9..12..15..23..31..39..56..73..90..116..142..168..276..solved at 403
      #|0..0..0..0..0..0..2..4..6..10..14..18..27..36..45..61..77..93..120..147..174..213..252..291..465..651..890..solved at 1040
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..11..27..56..102..187..282..507..789..1249..2185..3446..solved at 4008
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..11..27..57..106..191..284..468..692..1090..1990..3213..solved at 3826
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..2..3..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..4..9..17..26..35..50..65..105..solved at 128
      #|0..0..0..0..1..4..9..18..28..39..58..77..solved at 90
      #|0..0..1..3..7..solved at 17
      #|0..0..1..3..7..13..20..solved at 35
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..2..6..11..23..47..91..186..333..537..880..1386..2121..3496..5629..8957..14874..24097..37962..solved at 40441
      #|0..0..2..7..13..27..57..114..242..439..707..1140..1754..2620..4198..6611..10369..17055..27259..42383..solved at 45658
      #|0..0..3..6..13..31..58..118..solved at 181
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 11
      #|0..0..2..solved at 8
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..10..solved at 14
      #|0..0..2..8..solved at 12
      #|0..0..0..2..solved at 6
      #|0..0..0..1..7..18..40..73..113..191..298..467..830..solved at 1350
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..4..8..16..28..solved at 37
      #|0..0..solved at 2
      #|0..0..1..5..10..15..30..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..4..8..16..28..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..8..11..28..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..9..17..25..38..51..64..98..132..166..243..320..669..1192..2483..3902..5643..7672..solved at 7764
      #|0..0..1..solved at 5
      #|0..0..1..6..13..solved at 19
      #|0..0..1..10..solved at 21
      #|0..0..1..solved at 8
      #|0..0..1..11..solved at 24
      #|0..0..solved at 2
      #|0..0..1..2..9..19..31..63..105..solved at 121
      #|0..0..solved at 2
      #|CPU time (user): <t>
      #|0..0..1..3..8..14..33..66..99..154..219..284..365..450..535..843..1220..1621..2226..2892..3660..5020..6510..8326..10667..13397..16922..20942..25267..30727..solved at 35152
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..1..5..11..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..7..13..23..34..45..56..80..104..141..237..solved at 327
      #|0..0..1..3..7..17..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..25..35..47..67..87..114..solved at 152
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..18..30..48..66..88..solved at 99
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..4..7..17..31..66..117..228..383..696..1122..1957..solved at 2075
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..2..8..20..49..103..solved at 184
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..37..56..solved at 74
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..7..solved at 13
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..7..15..25..40..62..93..159..253..solved at 294
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..10..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..9..21..44..solved at 58
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..4..solved at 14
      #|0..0..1..2..4..6..8..10..12..14..solved at 22
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..3..6..16..33..60..123..solved at 148
      #|0..0..2..4..10..20..35..77..136..243..470..842..1459..solved at 2793
      #|0..0..3..9..24..59..112..228..solved at 259
      #|0..0..2..solved at 5
      #|0..0..1..2..9..21..47..87..161..241..405..578..951..1711..2759..solved at 3322
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..solved at 2
      #|0..0..1..2..4..6..8..18..solved at 27
      #|0..0..1..2..9..21..47..87..161..241..405..578..951..1711..2759..solved at 3322
      #|0..0..1..2..6..13..24..41..61..90..135..187..273..solved at 328
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..15..35..68..118..207..306..581..923..1443..2563..4010..solved at 4635
      #|0..0..1..2..11..27..57..106..191..284..468..696..1098..2178..3581..solved at 4197
      #|0..0..1..2..3..7..13..23..36..59..88..140..211..338..488..746..1043..1621..2861..4543..solved at 5474
      #|0..0..1..2..3..7..13..23..36..55..76..116..166..254..389..630..892..1347..1849..2763..4990..7936..solved at 8664
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..1..2..3..7..14..solved at 24
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..1..solved at 6
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..8..solved at 21
      #|0..0..1..4..12..30..solved at 48
      #|0..0..1..3..7..15..26..51..82..126..188..259..358..solved at 471
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..1..2..3..7..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..14..41..solved at 109
      #|0..0..1..4..14..41..solved at 109
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..8..13..18..57..118..228..519..solved at 739
      #|0..0..7..17..41..84..159..304..solved at 320
      #|0..0..6..15..37..75..146..284..507..916..1621..2866..solved at 3447
      #|0..0..6..solved at 15
      #|0..0..7..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 5
      #|0..0..1..2..3..7..14..26..47..77..solved at 94
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 6
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..15..32..67..114..173..245..344..468..solved at 605
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..2..5..10..solved at 16
      #|0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..0..1..solved at 6
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..6..solved at 10
      #|0..0..2..6..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..15..31..56..96..solved at 122
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..9..16..36..63..98..178..268..solved at 293
      #|0..0..2..5..10..23..40..solved at 54
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..6..9..12..solved at 20
      #|0..0..0..0..1..2..3..4..5..6..9..12..15..23..31..39..solved at 63
      #|0..0..0..1..2..3..6..9..12..solved at 22
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..4..9..solved at 14
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..0..4..12..20..39..62..89..solved at 132
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..4..solved at 7
      #|0..0..2..6..14..46..85..182..345..630..solved at 708
      #|0..0..1..3..7..13..24..51..78..126..184..solved at 193
      #|0..0..1..3..5..11..21..32..45..63..81..solved at 90
      #|0..0..1..3..7..13..24..53..82..134..193..solved at 202
      #|0..0..1..3..7..12..20..30..40..71..106..solved at 115
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..8..14..solved at 20
      #|0..0..1..3..8..13..solved at 19
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..4..10..22..42..solved at 53
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..solved at 8
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..5..12..solved at 17
      #|0..0..2..7..14..32..82..191..466..1144..2508..5758..13277..28479..solved at 31328
      #|0..0..1..4..8..15..solved at 34
      #|0..0..1..6..18..solved at 25
      #|0..0..0..2..6..14..solved at 32
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 19
      #|0..0..3..8..solved at 22
      #|0..0..2..6..solved at 19
      #|0..0..solved at 2
      #|0..0..3..8..solved at 22
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..6..solved at 22
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..7..22..54..solved at 65
      #|0..0..0..4..11..21..46..76..solved at 89
      #|0..0..2..4..14..solved at 32
      #|0..0..1..2..8..solved at 17
      #|0..0..solved at 2
      #|0..0..1..2..8..solved at 18
      #|0..0..1..2..5..12..21..solved at 30
      #|0..0..1..2..5..12..23..solved at 35
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..2..14..38..solved at 134
      #|0..0..0..2..14..solved at 42
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 8
      #|0..0..solved at 2
      #|0..0..3..7..solved at 11
      #|0..0..solved at 2
      #|0..0..3..7..solved at 11
      #|0..0..solved at 2
      #|0..0..2..5..11..26..solved at 51
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..5..15..41..solved at 49
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..19..40..67..101..solved at 127
      #|0..0..2..4..8..18..31..46..solved at 60
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 19
      #|0..0..2..4..8..solved at 16
      #|0..0..2..4..8..28..54..solved at 68
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 19
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..10..22..solved at 31
      #|0..0..2..4..8..solved at 16
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..2..4..12..24..solved at 30
      #|0..0..solved at 2
      #|0..0..3..7..15..31..53..solved at 71
      #|0..0..2..5..10..22..44..solved at 56
      #|0..0..2..4..8..solved at 17
      #|0..0..2..4..8..solved at 19
      #|0..0..3..6..13..32..58..solved at 74
      #|0..0..3..6..13..32..58..solved at 70
      #|0..0..2..4..8..solved at 17
      #|0..0..2..4..8..22..48..87..137..213..310..439..solved at 478
      #|0..0..2..4..8..22..48..87..137..213..310..439..solved at 486
      #|0..0..2..4..8..solved at 16
      #|0..0..2..4..8..16..36..71..114..180..267..433..653..908..1270..solved at 1348
      #|Warning: inventing type variables
      #|0..0..2..5..solved at 9
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 6
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..8..solved at 20
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..0..0..2..6..13..25..solved at 34
      #|0..0..0..0..2..6..13..25..solved at 34
      #|0..0..1..2..5..12..23..38..64..solved at 78
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..1..2..5..12..23..38..64..solved at 78
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..0..0..0..1..3..5..12..solved at 21
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..1..2..3..7..15..23..35..49..63..solved at 77
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|0..0..1..3..6..9..12..solved at 19
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|0..0..1..3..6..9..12..solved at 19
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..7..solved at 13
      #|0..0..3..7..15..solved at 28
      #|0..0..solved at 2
      #|0..0..4..9..18..solved at 35
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..22..34..48..69..99..140..211..307..435..642..905..1303..1847..solved at 2499
      #|0..0..1..6..19..47..109..225..399..solved at 564
      #|0..0..0..1..2..3..12..solved at 21
      #|0..0..1..2..5..12..22..36..52..74..106..152..212..321..452..711..1026..1572..2205..3406..5353..8956..solved at 11113
      #|0..0..1..2..5..solved at 13
      #|0..0..2..9..20..43..82..solved at 135
      #|0..0..1..2..5..9..15..22..solved at 40
      #|0..0..0..0..1..2..3..4..5..6..9..12..15..32..solved at 51
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..10..24..51..solved at 66
      #|0..0..solved at 2
      #|0..0..4..8..19..41..solved at 64
      #|0..0..4..8..19..42..solved at 65
      #|0..0..5..10..24..solved at 32
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..5..8..11..14..17..20..36..56..78..109..148..191..248..317..solved at 371
      #|0..0..1..2..5..8..11..14..17..20..36..56..78..109..148..191..248..317..solved at 375
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..1..2..3..5..7..9..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..1..2..3..4..5..6..9..12..15..21..27..33..solved at 55
      #|0..0..1..2..5..8..11..14..17..20..28..36..44..55..66..77..solved at 97
      #|0..0..1..2..5..8..11..14..17..20..28..36..44..55..66..77..solved at 97
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..5..9..17..26..38..solved at 48
      #|0..0..1..2..7..solved at 12
      #|0..0..1..2..5..9..15..23..34..48..solved at 65
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..5..11..solved at 18
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..18..31..46..63..88..solved at 117
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..30..47..76..solved at 120
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..8..15..29..58..solved at 87
      #|0..0..1..3..8..15..solved at 21
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..5..13..34..70..160..300..605..1071..2263..3998..8099..solved at 12555
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 10
      #|0..0..2..solved at 7
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..8..solved at 12
      #|0..0..2..6..solved at 10
      #|0..0..2..solved at 5
      #|0..0..2..5..solved at 10
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..6..9..12..21..30..39..58..77..96..solved at 107
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..7..17..36..76..145..262..solved at 474
      #|0..0..1..6..16..31..71..132..229..443..713..1082..1694..2623..4077..6756..11110..18048..29639..47994..76336..solved at 115499
      #|0..0..2..4..8..22..42..66..112..161..223..297..381..481..707..949..1227..1650..2105..2606..3270..3978..4770..5888..7090..8445..10095..11890..14206..solved at 14609
      #|0..0..2..8..16..42..99..163..346..solved at 408
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..12..30..56..solved at 64
      #|0..0..2..4..11..26..47..solved at 55
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..12..27..47..solved at 54
      #|0..0..2..4..11..26..46..solved at 53
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..8..14..36..77..126..246..516..1204..3264..solved at 3298
      #|0..0..1..solved at 7
      #|0..0..1..7..15..33..83..171..solved at 204
      #|0..0..2..5..10..33..62..93..150..209..272..339..414..499..747..1045..1349..solved at 1473
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..4..8..12..16..solved at 25
      #|0..0..1..5..14..solved at 20
      #|0..0..2..4..8..16..28..44..solved at 54
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..3..10..23..57..122..234..solved at 262
      #|0..0..1..4..12..31..76..162..294..558..959..1533..2548..solved at 2588
      #|0..0..2..4..9..25..48..84..142..210..337..solved at 387
      #|0..0..2..5..11..35..65..100..176..254..338..437..544..687..1040..1443..1912..solved at 2135
      #|0..0..1..5..11..solved at 16
      #|0..0..1..3..7..solved at 17
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1693..2329..3064..solved at 3378
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1693..2329..3064..solved at 3370
      #|0..0..3..6..14..41..79..141..244..366..591..solved at 701
      #|0..0..3..6..14..41..79..141..244..366..591..solved at 662
      #|0..0..1..2..3..10..21..32..55..solved at 64
      #|0..0..2..solved at 5
      #|0..0..0..4..solved at 12
      #|0..0..0..4..solved at 8
      #|0..0..2..solved at 8
      #|0..0..2..solved at 5
      #|0..0..2..solved at 9
      #|0..0..3..12..30..77..192..408..957..2317..5293..solved at 9312
      #|0..0..2..8..solved at 14
      #|0..0..2..10..solved at 17
      #|0..0..3..11..28..74..192..410..solved at 619
      #|0..0..2..10..31..89..255..622..1544..3861..9467..solved at 9606
      #|0..0..2..7..17..36..76..145..262..solved at 483
      #|0..0..1..6..16..31..71..132..229..443..713..1082..1694..2617..4067..6744..11120..18071..29739..48196..76749..solved at 117331
      #|0..0..2..4..8..22..42..66..112..161..223..297..381..481..707..949..1227..1650..2105..2606..3270..3978..4770..5891..7096..8454..10131..11953..14289..solved at 14763
      #|0..0..2..8..16..42..99..163..346..solved at 408
      #|0..0..2..4..12..27..48..solved at 56
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..11..29..55..solved at 63
      #|0..0..2..4..12..27..47..solved at 54
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..11..26..46..solved at 53
      #|0..0..1..3..8..14..36..77..126..246..516..1202..3262..solved at 3309
      #|0..0..1..solved at 7
      #|0..0..1..7..15..33..83..171..solved at 204
      #|0..0..2..5..10..33..62..93..150..209..272..339..414..499..749..1049..1355..solved at 1479
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..5..14..solved at 20
      #|0..0..1..4..8..12..16..solved at 27
      #|0..0..2..4..8..16..28..45..solved at 55
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..6..16..41..78..solved at 112
      #|0..0..3..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..2..5..11..43..97..169..307..507..781..1260..1924..solved at 2571
      #|0..0..2..5..11..40..91..161..351..626..solved at 723
      #|0..0..1..4..11..30..75..161..294..559..961..1532..2548..solved at 2599
      #|0..0..2..4..10..26..49..86..143..211..338..solved at 362
      #|0..0..2..5..11..35..65..100..176..254..338..437..544..687..1042..1447..1918..solved at 2141
      #|0..0..1..5..11..solved at 16
      #|0..0..1..3..7..solved at 17
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1695..2333..3070..solved at 3384
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1695..2333..3070..solved at 3376
      #|0..0..3..6..16..43..81..145..246..368..593..solved at 658
      #|0..0..3..6..16..43..81..145..246..368..593..solved at 619
      #|0..0..1..2..3..10..21..32..55..solved at 64
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 8
      #|0..0..0..0..4..8..12..32..70..solved at 82
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..2..5..11..29..63..103..180..solved at 196
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..2..5..11..29..63..103..180..solved at 196
      #|0..0..1..3..8..18..37..58..91..126..165..204..271..346..451..613..783..1037..1319..1611..1959..2388..2833..3328..solved at 3724
      #|0..0..1..3..8..18..37..58..91..126..165..204..271..346..451..613..783..1037..1319..1611..1959..2387..2831..3323..solved at 3718
      #|0..0..1..2..solved at 6
      #|0..0..0..1..3..5..7..9..11..solved at 18
      #|0..0..1..2..solved at 6
      #|0..0..0..1..3..5..7..9..11..solved at 18
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..7..solved at 11
      #|0..0..0..4..13..solved at 25
      #|0..0..2..7..15..39..100..234..587..1410..3140..7378..16891..solved at 18714
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..24..33..44..67..90..125..solved at 185
      #|0..0..1..2..5..8..11..solved at 19
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..0..0..1..3..5..12..21..41..70..112..159..242..330..451..600..781..1008..1316..1670..solved at 2062
      #|0..0..1..solved at 4
      #|0..0..2..8..19..solved at 25
      #|0..0..2..8..18..solved at 24
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..27..41..66..107..solved at 125
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..19..42..78..127..186..270..412..638..solved at 773
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..23..51..93..156..solved at 190
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..1..2..8..17..53..104..solved at 158
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..11..20..34..72..114..190..381..solved at 438
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 16
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..5..9..15..solved at 22
      #|0..0..solved at 2
      #|0..0..3..6..12..25..46..94..155..254..479..solved at 599
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..53..70..97..132..167..210..282..354..455..576..697..838..1034..1230..1481..solved at 1835
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..8..29..83..252..796..2457..solved at 6383
      #|0..0..1..2..6..solved at 11
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..5..18..39..95..203..357..828..1513..2671..4683..8315..solved at 12845
      #|Warning: inventing type variables
      #|0..0..3..6..13..solved at 24
      #|0..0..2..4..8..16..28..43..67..95..155..236..348..490..727..solved at 823
      #|0..0..4..8..19..solved at 30
      #|0..0..3..6..solved at 13
      #|0..0..1..7..15..31..64..111..solved at 125
      #|0..0..solved at 2
      #|0..0..1..7..15..31..64..111..solved at 125
      #|0..0..0..1..3..7..20..solved at 34
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..35..solved at 65
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 6
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..solved at 31
      #|0..0..solved at 2
      #|0..0..1..5..solved at 9
      #|0..0..3..7..solved at 11
      #|0..0..2..4..12..24..44..84..solved at 142
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..10..22..49..93..171..282..522..811..solved at 842
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 18
      #|0..0..1..2..5..solved at 13
      #|0..0..3..11..31..solved at 42
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..4..8..18..34..solved at 48
      #|0..0..2..4..solved at 8
      #|0..0..4..8..18..34..solved at 48
      #|0..0..2..4..8..16..39..83..147..248..472..749..1436..solved at 2196
      #|0..0..4..8..18..solved at 32
      #|0..0..2..4..8..solved at 14
      #|0..0..1..3..solved at 8
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..11..25..55..100..209..399..solved at 697
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..solved at 12
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..3..27..62..115..232..373..528..901..1355..1992..3226..4642..6943..11993..17782..25228..solved at 26787
      #|0..0..1..2..3..27..62..115..232..375..534..921..1398..2034..3299..4800..7116..12226..18239..26036..solved at 27625
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..11..30..94..solved at 127
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..8..18..34..solved at 45
      #|0..0..4..8..18..34..65..114..169..250..357..480..719..986..1285..solved at 1469
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 13
      #|0..0..1..2..6..36..79..solved at 105
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..4..8..16..solved at 24
      #|0..0..solved at 2
      #|0..0..2..4..8..16..28..45..solved at 56
      #|0..0..1..2..3..27..62..115..232..373..528..901..1355..1992..3226..4642..6943..11993..17782..25228..solved at 26787
      #|0..0..1..2..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 4
      #|0..0..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 11
      #|0..0..2..6..13..25..56..95..152..224..327..455..690..976..solved at 1019
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..6..15..30..73..134..229..368..553..800..1208..1747..2508..3645..5152..7046..solved at 7159
      #|0..0..3..6..9..solved at 14
      #|0..0..3..6..9..solved at 14
      #|0..0..2..5..8..solved at 18
      #|0..0..2..solved at 6
      #|0..0..1..3..7..13..30..solved at 37
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..5..15..30..solved at 36
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..5..15..solved at 22
      #|0..0..2..6..22..76..261..solved at 597
      #|0..0..1..2..7..13..26..42..67..97..161..234..375..537..790..1087..1727..2450..solved at 2485
      #|0..0..0..solved at 3
      #|0..0..2..6..15..30..77..142..259..422..679..1002..1619..2374..3785..5636..9224..13422..solved at 13525
      #|0..0..1..2..5..9..15..23..31..39..57..75..103..solved at 139
      #|0..0..1..2..6..11..19..34..49..70..117..164..237..386..553..836..1215..1685..2287..solved at 2745
      #|0..0..1..solved at 5
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..38..52..75..98..130..solved at 171
      #|0..0..solved at 2
      #|0..0..1..2..5..11..19..solved at 26
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..12..30..solved at 51
      #|0..0..solved at 2
      #|0..0..1..3..7..14..32..solved at 40
      #|0..0..solved at 2
      #|0..0..1..3..7..14..30..solved at 38
      #|0..0..2..4..10..18..30..solved at 46
      #|0..0..2..4..8..16..28..59..103..173..solved at 212
      #|0..0..2..4..solved at 8
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..3..6..solved at 10
      #|0..0..2..4..8..26..55..85..141..solved at 150
      #|0..0..1..4..13..29..64..122..204..solved at 247
      #|0..0..1..7..18..38..78..147..solved at 161
      #|0..0..1..solved at 4
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..2..3..7..13..21..32..solved at 48
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..6..15..30..73..134..229..368..553..800..1208..1747..2508..3645..5152..7046..solved at 7159
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..8..solved at 12
      #|0..0..1..5..15..31..solved at 37
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..6..9..25..47..79..153..solved at 167
      #|0..0..3..6..9..25..48..84..158..solved at 175
      #|0..0..2..5..8..19..37..63..117..solved at 165
      #|0..0..2..solved at 6
      #|0..0..1..2..3..4..9..22..35..56..81..solved at 94
      #|0..0..1..solved at 4
      #|0..0..2..9..16..26..59..solved at 68
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..5..15..solved at 22
      #|0..0..2..6..22..76..261..solved at 597
      #|0..0..1..2..7..13..26..42..67..97..161..234..375..537..790..1087..1727..2450..solved at 2485
      #|0..0..2..5..10..21..39..63..93..148..228..393..701..1290..2397..solved at 3736
      #|0..0..0..solved at 3
      #|0..0..2..6..15..30..77..142..253..408..639..934..1487..2172..3341..4925..7743..11077..solved at 11180
      #|0..0..2..5..10..25..47..75..111..172..258..425..731..1326..2461..4773..8965..solved at 14712
      #|0..0..1..2..5..9..15..23..31..39..57..75..103..solved at 139
      #|0..0..1..2..6..11..19..34..49..70..117..164..237..386..553..836..1213..1681..2277..solved at 2731
      #|0..0..1..solved at 5
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..38..52..75..98..130..solved at 171
      #|0..0..solved at 2
      #|0..0..1..2..5..11..19..solved at 26
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..10..25..solved at 41
      #|0..0..1..solved at 4
      #|0..0..2..4..10..18..30..solved at 46
      #|0..0..2..4..8..16..28..59..103..173..solved at 214
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..0..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..3..6..solved at 10
      #|0..0..2..4..8..26..55..85..141..solved at 150
      #|0..0..1..4..13..29..64..122..204..solved at 247
      #|0..0..1..7..18..38..78..147..solved at 161
      #|0..0..1..2..6..12..28..48..72..100..147..195..316..458..652..894..1207..1592..2128..2732..3491..4404..5471..6812..8440..10222..12256..14610..17294..solved at 19757
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..3..5..10..19..31..60..103..157..249..361..504..748..1123..1718..2921..solved at 3656
      #|Warning: inventing type variables
      #|0..0..1..3..7..16..35..68..116..212..392..759..solved at 1033
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..8..19..39..solved at 69
      #|0..0..solved at 2
      #|0..0..1..5..20..solved at 25
      #|0..0..solved at 2
      #|0..0..2..8..27..solved at 33
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 31
      #|0..0..2..solved at 6
      #|0..0..1..2..5..11..solved at 17
      #|0..0..2..4..10..19..solved at 25
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..5..9..15..30..47..76..solved at 127
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..4..solved at 9
      #|0..0..1..2..5..9..15..30..47..76..solved at 124
      #|0..0..1..2..5..9..15..22..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..10..solved at 16
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..1..2..5..9..15..solved at 30
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..2..5..9..solved at 16
      #|0..0..0..0..4..9..18..30..solved at 42
      #|0..0..0..0..0..4..10..16..26..36..46..64..82..100..131..162..193..solved at 219
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..5..9..15..40..67..116..solved at 201
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..8..15..solved at 40
      #|0..0..solved at 2
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..3..5..10..19..32..60..solved at 97
      #|0..0..1..3..5..10..18..28..52..solved at 83
      #|0..0..2..5..8..17..31..47..86..solved at 135
      #|0..0..1..3..5..10..18..28..51..solved at 81
      #|0..0..2..5..8..17..31..47..87..solved at 133
      #|0..0..2..5..8..17..31..49..92..solved at 144
      #|0..0..3..7..11..24..43..62..111..solved at 167
      #|0..0..1..2..5..9..15..40..67..116..solved at 198
      #|0..0..2..4..8..16..29..65..127..215..solved at 297
      #|0..0..2..4..8..16..31..73..144..245..solved at 327
      #|0..0..3..6..11..23..45..104..216..372..solved at 528
      #|0..0..2..4..8..16..29..65..128..217..solved at 299
      #|0..0..3..6..11..23..43..96..200..344..solved at 500
      #|0..0..3..6..11..23..43..90..185..310..solved at 396
      #|0..0..4..8..14..30..57..127..269..465..solved at 707
      #|0..0..2..4..8..16..30..69..136..231..solved at 313
      #|0..0..3..6..11..23..42..92..192..330..solved at 486
      #|0..0..3..6..11..23..44..94..193..324..solved at 410
      #|0..0..4..8..14..30..56..123..261..451..solved at 693
      #|0..0..3..6..11..23..42..86..177..296..solved at 382
      #|0..0..4..8..14..30..54..115..245..423..solved at 665
      #|0..0..4..8..14..30..54..103..214..353..solved at 447
      #|0..0..5..10..17..37..66..138..294..508..solved at 848
      #|0..0..2..4..8..16..30..69..135..229..solved at 311
      #|0..0..3..6..11..23..42..92..189..324..solved at 480
      #|0..0..3..6..11..23..44..94..194..326..solved at 412
      #|0..0..4..8..14..30..56..123..260..449..solved at 691
      #|0..0..3..6..11..23..44..94..194..326..solved at 412
      #|0..0..4..8..14..30..56..123..260..449..solved at 691
      #|0..0..4..8..14..30..56..111..233..387..solved at 481
      #|0..0..5..10..17..37..68..146..311..538..solved at 878
      #|0..0..3..6..11..23..45..98..202..340..solved at 426
      #|0..0..4..8..14..30..55..119..252..435..solved at 677
      #|0..0..4..8..14..30..57..115..241..401..solved at 495
      #|0..0..5..10..17..37..67..142..303..524..solved at 864
      #|0..0..4..8..14..30..57..115..241..401..solved at 495
      #|0..0..5..10..17..37..67..142..303..524..solved at 864
      #|0..0..5..10..17..37..67..124..260..426..solved at 532
      #|0..0..6..12..20..44..77..157..334..577..solved at 1027
      #|0..0..2..4..8..16..29..65..126..213..solved at 295
      #|0..0..3..6..11..23..43..96..198..340..solved at 465
      #|0..0..3..6..11..23..43..90..185..310..solved at 395
      #|0..0..4..8..14..30..57..127..269..465..solved at 673
      #|0..0..3..6..11..23..43..90..185..310..solved at 395
      #|0..0..4..8..14..30..57..127..269..465..solved at 673
      #|0..0..4..8..14..30..55..107..224..371..solved at 463
      #|0..0..5..10..17..37..69..150..320..554..solved at 857
      #|0..0..3..6..11..23..44..94..193..324..solved at 409
      #|0..0..4..8..14..30..56..123..261..451..solved at 659
      #|0..0..4..8..14..30..56..111..232..385..solved at 477
      #|0..0..5..10..17..37..68..146..312..540..solved at 843
      #|0..0..4..8..14..30..56..111..232..385..solved at 477
      #|0..0..5..10..17..37..68..146..312..540..solved at 843
      #|0..0..5..10..17..37..66..120..251..410..solved at 513
      #|0..0..6..12..20..44..78..161..343..593..solved at 1003
      #|0..0..3..6..11..23..42..86..176..294..solved at 379
      #|0..0..4..8..14..30..54..115..242..417..solved at 625
      #|0..0..4..8..14..30..54..103..217..359..solved at 451
      #|0..0..5..10..17..37..66..138..295..510..solved at 813
      #|0..0..4..8..14..30..56..111..233..387..solved at 479
      #|0..0..5..10..17..37..68..146..311..538..solved at 841
      #|0..0..5..10..17..37..66..120..254..416..solved at 519
      #|0..0..6..12..20..44..78..161..344..595..solved at 1005
      #|0..0..4..8..14..30..57..115..241..401..solved at 493
      #|0..0..5..10..17..37..67..142..303..524..solved at 827
      #|0..0..5..10..17..37..67..124..262..430..solved at 533
      #|0..0..6..12..20..44..77..157..336..581..solved at 991
      #|0..0..5..10..17..37..69..132..278..458..solved at 561
      #|0..0..6..12..20..44..79..165..352..609..solved at 1019
      #|0..0..6..12..20..44..77..133..279..451..solved at 569
      #|0..0..7..14..23..51..87..172..365..630..solved at 1159
      #|0..0..1..8..31..110..474..1716..solved at 3337
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..5..9..15..40..67..116..solved at 201
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 22
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 17
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 16
      #|0..0..3..6..17..36..64..solved at 95
      #|0..0..2..4..13..27..47..solved at 60
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..3..8..14..solved at 20
      #|0..0..1..3..8..13..solved at 19
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..8..solved at 16
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..1..9..solved at 20
      #|0..0..0..0..3..12..solved at 27
      #|0..0..1..2..6..16..solved at 31
      #|0..0..solved at 2
      #|0..0..1..2..10..23..45..73..109..150..237..341..solved at 482
      #|0..0..2..7..17..57..111..252..solved at 259
      #|0..0..1..2..5..9..15..24..33..44..67..90..125..186..247..334..524..solved at 604
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..6..11..19..28..37..46..73..100..145..212..279..368..509..650..841..1124..1407..1782..2305..2828..3499..solved at 4403
      #|0..0..1..2..6..12..25..47..84..141..245..solved at 353
      #|0..0..1..2..3..7..35..80..139..252..387..solved at 519
      #|0..0..1..2..3..7..35..80..139..252..387..solved at 463
      #|0..0..1..2..6..11..19..29..39..50..91..141..235..375..577..845..1399..solved at 1533
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..24..45..76..125..208..solved at 288
      #|0..0..2..4..8..16..28..44..69..101..151..223..solved at 286
      #|0..0..2..4..8..16..28..44..69..100..149..220..309..441..solved at 521
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..19..38..65..106..192..292..436..solved at 553
      #|0..0..2..4..9..18..52..121..210..359..620..solved at 701
      #|0..0..2..4..9..18..52..121..210..359..620..solved at 878
      #|0..0..3..6..12..25..83..212..381..638..1118..1786..2598..solved at 2715
      #|Warning: inventing type variables
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..432..589..787..1065..1365..1753..2218..2731..3327..4085..4879..5831..solved at 6125
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..432..589..787..1063..1361..1745..2206..2715..3307..4060..4849..5795..6839..7919..9094..10526..11984..13723..solved at 14089
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..410..545..699..915..1153..1461..1852..2291..2819..3481..4179..5007..5941..6911..7984..9353..10748..12463..14302..16229..18272..20734..23204..26101..solved at 26928
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..410..545..699..915..1153..1461..1852..2291..2819..3479..4175..4999..5929..6895..7964..9326..10714..12419..14242..16153..18174..20613..23060..25933..29025..32229..35676..39609..43606..48073..solved at 49267
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..1..2..3..7..15..33..92..182..286..491..717..1000..1344..solved at 1660
      #|0..0..1..2..3..7..15..33..92..182..286..491..717..1000..1344..solved at 1547
      #|0..0..1..2..7..13..26..42..66..109..184..282..450..645..906..1214..1585..solved at 1922
      #|0..0..1..2..7..13..26..42..66..109..184..282..450..645..906..1214..1585..solved at 1922
      #|0..0..1..2..6..12..25..41..68..113..197..307..500..726..1041..1410..1881..solved at 2329
      #|0..0..1..2..6..12..25..41..68..113..197..307..500..726..1041..1410..1881..solved at 2329
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..1..2..3..7..13..23..41..70..112..191..solved at 250
      #|Warning: inventing type variables
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..2..4..14..35..68..solved at 84
      #|0..0..2..4..14..35..68..solved at 104
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..19..42..78..140..solved at 193
      #|0..0..2..4..16..39..78..solved at 101
      #|0..0..2..4..16..39..78..solved at 121
      #|0..0..2..4..12..33..80..solved at 109
      #|0..0..1..2..3..7..28..58..93..156..224..320..452..612..798..1098..1416..1822..2337..2900..3583..solved at 4191
      #|0..0..2..4..12..33..80..solved at 89
      #|0..0..1..2..3..7..28..58..93..156..224..320..452..612..798..1098..1416..1822..2337..2900..3583..solved at 4521
      #|0..0..1..2..9..26..54..solved at 83
      #|0..0..1..2..3..7..20..41..67..110..157..227..331..463..620..867..1133..1468..1887..2352..2941..solved at 3821
      #|0..0..1..2..9..26..54..solved at 63
      #|0..0..1..2..3..7..20..41..67..110..157..227..331..463..620..867..1133..1468..1887..2352..2941..solved at 3463
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..6..12..25..solved at 45
      #|0..0..1..2..3..10..solved at 17
      #|0..0..1..2..9..26..53..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..9..26..53..solved at 62
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..67..104..175..273..solved at 350
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..6..12..25..41..67..solved at 102
      #|0..0..1..2..3..7..17..30..46..70..97..140..solved at 190
      #|0..0..1..2..9..26..53..solved at 82
      #|0..0..0..solved at 3
      #|0..0..1..2..9..26..53..solved at 62
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..15..22..29..36..53..70..97..161..232..370..554..815..1134..1579..2071..2741..3531..4571..5783..7374..solved at 8357
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..3..11..33..69..solved at 111
      #|0..0..1..3..11..33..69..solved at 89
      #|0..0..1..4..13..solved at 18
      #|0..0..1..4..13..solved at 19
      #|0..0..1..4..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..3..11..31..61..114..201..302..473..solved at 633
      #|0..0..1..3..11..31..61..114..201..302..473..solved at 562
      #|0..0..1..4..12..27..55..116..196..solved at 236
      #|0..0..1..4..12..27..55..108..178..solved at 219
      #|0..0..2..6..19..50..101..solved at 143
      #|0..0..2..6..19..50..101..solved at 121
      #|0..0..2..7..21..solved at 26
      #|0..0..2..7..21..solved at 27
      #|0..0..1..2..5..11..19..32..solved at 51
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..6..11..28..59..115..212..391..solved at 471
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 12
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..3..7..solved at 12
      #|0..0..3..7..solved at 14
      #|0..0..3..8..solved at 17
      #|0..0..3..7..solved at 15
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..3..7..solved at 12
      #|0..0..3..7..solved at 14
      #|0..0..3..8..solved at 17
      #|0..0..2..5..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..10..17..solved at 26
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..5..solved at 12
      #|0..0..0..1..4..7..28..62..98..175..306..469..729..1116..1619..2577..3946..5710..solved at 5758
      #|Warning: Benign redefinition
      #|0..0..0..solved at 3
      #|0..0..0..3..12..27..60..solved at 71
      #|0..0..1..5..14..solved at 21
      #|0..0..solved at 2
      #|0..0..1..4..9..21..solved at 29
      #|0..0..1..5..13..27..57..95..solved at 104
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..2..11..34..84..193..424..970..solved at 1151
      #|0..0..1..2..3..11..21..31..63..101..139..solved at 265
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..34..49..69..109..168..243..solved at 373
      #|0..0..1..2..4..7..10..18..29..42..94..158..316..581..1094..1913..3693..solved at 3718
      #|0..0..2..5..12..29..55..solved at 62
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..0..2..5..8..18..30..46..82..120..161..246..339..solved at 357
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..0..0..4..10..19..29..42..56..82..108..167..240..353..486..683..solved at 745
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..5..12..solved at 19
      #|0..0..1..2..5..12..21..35..64..109..193..349..solved at 498
      #|0..0..1..2..6..13..solved at 20
      #|0..0..1..3..6..11..18..29..42..solved at 52
      #|0..0..solved at 2
      #|0..0..1..3..5..8..solved at 14
      #|0..0..0..3..6..9..16..23..30..solved at 43
      #|0..0..1..2..3..7..13..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..5..8..12..solved at 19
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..10..28..59..143..267..501..896..1553..2724..5081..solved at 7620
      #|0..0..1..10..32..71..178..solved at 203
      #|0..0..0..5..24..64..176..352..665..1173..2045..3449..solved at 4190
      #|0..0..1..11..42..96..solved at 122
      #|0..0..1..2..3..7..13..23..40..63..102..160..256..376..592..854..1310..1869..2906..4294..solved at 4901
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..6..15..solved at 20
      #|0..0..1..2..5..9..14..25..40..solved at 55
      #|0..0..0..3..6..9..14..19..26..36..46..56..66..76..86..96..106..126..189..252..solved at 270
      #|0..0..1..3..8..solved at 14
      #|0..0..1..solved at 4
      #|0..0..0..3..6..9..12..15..20..25..30..35..40..45..50..55..60..solved at 73
      #|0..0..solved at 2
      #|0..0..1..5..10..15..20..25..30..35..66..97..128..159..190..221..300..379..458..577..696..815..solved at 833
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..4..7..11..18..26..34..58..82..119..solved at 171
      #|0..0..2..5..9..14..35..90..162..solved at 179
      #|0..0..2..5..9..14..35..90..164..solved at 178
      #|0..0..1..2..4..7..11..17..25..33..55..77..112..solved at 164
      #|0..0..2..5..9..14..35..90..164..solved at 180
      #|0..0..2..5..9..14..35..88..158..solved at 172
      #|0..0..1..2..6..13..23..38..solved at 48
      #|0..0..1..2..6..13..23..38..solved at 48
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..7..solved at 13
      #|0..0..1..4..7..19..36..65..118..188..solved at 214
      #|0..0..1..5..14..27..solved at 33
      #|0..0..1..5..solved at 10
      #|0..0..1..4..13..26..solved at 32
      #|0..0..1..4..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 13
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..4..12..29..88..202..405..882..solved at 1334
      #|0..0..1..solved at 5
      #|0..0..1..3..6..15..31..56..solved at 78
      #|0..0..1..3..6..15..solved at 29
      #|0..0..1..3..6..15..31..56..solved at 78
      #|0..0..1..3..6..15..solved at 29
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..9..16..29..51..76..118..203..313..478..733..1034..1488..solved at 1787
      #|0..0..0..0..0..solved at 5
      #|0..0..0..1..4..7..16..29..49..76..114..157..248..343..466..solved at 507
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..7..solved at 13
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 14
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..5..11..20..63..solved at 114
      #|0..0..1..10..19..32..solved at 71
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..3..7..12..17..24..31..38..solved at 67
      #|0..0..1..2..3..4..17..33..54..81..120..159..208..269..330..391..460..529..622..715..solved at 765
      #|0..0..1..2..3..4..17..33..54..81..120..159..208..269..330..391..460..529..622..715..solved at 741
      #|0..0..2..7..solved at 11
      #|0..0..1..5..12..25..55..solved at 99
      #|0..0..1..5..11..24..58..solved at 95
      #|0..0..1..3..6..13..28..57..102..180..290..473..750..1141..1743..2638..solved at 3072
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|0..0..0..2..4..6..11..18..29..45..67..solved at 85
      #|0..0..solved at 2
      #|0..0..2..6..11..26..53..solved at 60
      #|0..0..2..6..12..27..72..161..326..686..solved at 784
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..3..6..17..36..solved at 43
      #|0..0..3..7..solved at 11
      #|0..0..3..7..solved at 14
      #|0..0..2..4..solved at 8
      #|0..0..2..4..9..21..solved at 28
      #|0..0..1..2..3..4..10..19..31..54..93..151..328..solved at 441
      #|0..0..2..4..9..19..43..85..155..277..499..864..1698..solved at 1810
      #|0..0..3..11..48..120..262..615..1117..2593..4807..solved at 5684
      #|0..0..4..solved at 7
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..6..17..51..solved at 56
      #|0..0..5..14..solved at 22
      #|0..0..5..12..solved at 18
      #|0..0..5..12..32..62..solved at 82
      #|0..0..solved at 3
      #|0..0..6..13..solved at 17
      #|0..0..4..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..5..solved at 8
      #|0..0..4..10..32..61..115..185..291..410..solved at 547
      #|0..0..4..10..30..55..105..170..256..353..solved at 389
      #|0..0..4..solved at 7
      #|0..0..4..9..25..46..90..157..255..413..668..1013..1557..solved at 1574
      #|0..0..5..solved at 8
      #|0..0..1..3..7..15..27..60..107..183..352..618..1081..1877..3199..5523..9477..16174..27871..solved at 46833
      #|0..0..2..6..15..30..74..141..267..463..solved at 505
      #|0..0..2..7..solved at 11
      #|0..0..2..5..10..21..40..70..117..188..solved at 199
      #|0..0..2..5..10..19..35..58..solved at 67
      #|0..0..2..7..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..solved at 11
      #|0..0..1..2..9..20..39..70..111..161..250..366..solved at 376
      #|0..0..solved at 2
      #|0..0..4..8..16..32..solved at 43
      #|0..0..0..1..2..3..6..12..19..29..43..57..89..145..solved at 175
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..11..15..solved at 25
      #|0..0..1..3..7..11..15..solved at 24
      #|0..0..solved at 2
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..7..14..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..2..8..21..42..81..139..213..340..520..762..1126..1617..solved at 1830
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..4..5..8..12..16..21..26..31..solved at 42
      #|0..0..1..2..3..4..5..7..9..11..16..21..26..solved at 37
      #|0..0..1..4..solved at 10
      #|0..0..2..8..15..solved at 22
      #|0..0..2..4..11..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..34..49..69..94..123..158..212..272..347..439..546..669..833..1013..1230..1496..1799..2134..solved at 2276
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..3..10..19..28..42..59..solved at 70
      #|0..0..1..solved at 6
      #|0..0..2..8..24..58..169..462..solved at 794
      #|0..0..2..8..24..58..169..460..solved at 794
      #|0..0..1..2..3..7..14..25..46..71..108..155..212..283..solved at 310
      #|0..0..solved at 3
      #|0..0..1..5..22..114..solved at 609
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..4..10..20..solved at 26
      #|0..0..1..2..4..9..17..solved at 23
      #|0..0..1..2..8..17..51..106..269..solved at 320
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..4..10..20..solved at 26
      #|0..0..1..2..4..9..17..solved at 23
      #|0..0..1..2..8..17..51..106..269..solved at 320
      #|priority is now real
      #|num_ext_gcd loaded
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..1..2..5..9..15..22..29..36..49..62..81..solved at 104
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..49..62..81..solved at 104
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|priority is now real
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..4..12..23..41..70..solved at 88
      #|0..0..1..2..4..12..23..41..70..solved at 88
      #|priority is now real
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 11
      #|0..0..1..2..solved at 11
      #|0..0..1..2..6..12..27..46..solved at 85
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..3..9..solved at 19
      #|0..0..1..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..6..17..38..84..solved at 103
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..13..21..solved at 36
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..13..21..solved at 36
      #|0..0..1..3..7..16..31..54..95..158..249..382..565..818..solved at 1233
      #|0..0..1..2..5..9..15..33..53..90..167..269..451..solved at 776
      #|0..0..1..2..6..11..20..37..60..104..solved at 160
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..3..5..10..19..30..solved at 40
      #|0..0..1..5..12..27..61..114..202..378..707..1267..solved at 1292
      #|0..0..1..5..12..27..61..113..197..363..639..1077..solved at 1107
      #|0..0..1..2..7..13..solved at 22
      #|0..0..1..4..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..11..22..solved at 34
      #|0..0..1..2..3..solved at 11
      #|0..0..1..2..3..11..22..solved at 36
      #|0..0..1..2..3..solved at 9
      #|priority is now real
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..9..21..36..solved at 43
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
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
      #|Searching with limit 5
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
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
      #|Searching with limit 5
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..13..solved at 33
      #|0..0..1..4..13..solved at 24
      #|0..0..1..2..5..11..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..6..solved at 19
      #|0..0..2..7..solved at 13
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..12..37..124..344..980..solved at 2136
      #|0..0..solved at 2
      #|0..0..2..8..24..83..226..636..solved at 1215
      #|0..0..3..10..27..90..237..636..solved at 1186
      #|0..0..2..6..14..49..119..302..solved at 318
      #|0..0..1..2..solved at 6
      #|0..0..1..3..6..solved at 12
      #|0..0..2..4..6..solved at 13
      #|0..0..2..4..6..solved at 11
      #|0..0..2..4..6..solved at 18
      #|0..0..2..4..6..solved at 15
      #|0..0..1..2..3..solved at 10
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..5..8..11..19..solved at 30
      #|0..0..0..1..2..3..4..5..6..solved at 19
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..38..65..116..solved at 202
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..0..0..0..0..1..2..3..4..5..6..7..8..9..11..13..15..17..19..21..23..25..27..solved at 48
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..solved at 16
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..solved at 21
      #|0..0..2..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..22..38..58..82..120..solved at 165
      #|0..0..1..3..solved at 7
      #|0..0..0..1..2..3..5..7..9..21..42..67..111..solved at 151
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..39..solved at 62
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..solved at 13
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..2..3..7..13..21..44..73..solved at 108
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 21
      #|0..0..1..2..6..solved at 11
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..2..5..9..16..24..33..42..81..120..189..282..375..492..717..942..1275..1654..2033..2458..6920..11785..30392..solved at 49891
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..3..9..21..solved at 28
      #|0..0..4..9..solved at 13
      #|0..0..2..solved at 5
      #|0..0..1..2..12..28..127..297..solved at 1025
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..5..11..22..solved at 29
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..8..17..32..65..solved at 94
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..solved at 11
      #|priority is now real
      #|Jordan/misc_defs_and_lemmas quotations (605):
      #|  dirac_delta (i:num) =\n     (\\j. if (i=j) then (&.1) else (&.0))
      #|  min_num (X:num->bool) = @m. (m IN X) /\\ (!n. (n IN X) ==> (m <= n))
      #|  ~(n' < n) ==> (n <=| n') 
      #|  r = @m. (X:num->bool) m /\\ (!n. X n ==> m <=| n)
      #|  n:num
      #|  \\m. (X:num->bool) m /\\ (!n. X n ==> m <=| n)
      #|  X:num->bool
      #|  ?n. (X:num->bool) n /\\ (!m. m <| n ==> ~X m)
      #|  !(X:num->bool) c. (X c) ==> (X (min_num X) /\\ (min_num X <=| c))
      #|  max_real x y =\n        if (y <. x) then x else y
      #|  min_real x y =\n        if (x <. y) then x else y
      #|  deriv f x = @d. (f diffl d)(x)
      #|  deriv2 f = (deriv (deriv f))
      #|  &.0 <=. (&.0 -. (&.0))
      #|  (&.0 <= y) /\\ (&.0 <=. x) /\\ (y+x <= (&.0)) ==> ((x= &.0) /\\ (y= &.0))
      #|  x * (&.0) = (&.0)
      #|  (y+x):real
      #|  &.0 < (y+x) \\/ (y+x <=. (&.0))
      #|  (a <=. b) <=> (&.0 <= (b - a))
      #|  ( *. )
      #|  !x y. (&.0 <=. x) /\\ (&.0 <=. y) /\\ (x*.x <=. y*.y) ==> (x <=. y)
      #|  x <=| M ==> (x <=| M+ u)
      #|  (i:num) = n
      #|  (M:num) + (t:num->num) n
      #|  (n <=| m) /\\ (~(m = n)) ==> (SUC n <=| m)
      #|  m = (n:num)
      #|  !m. (n<=|m) ==> (b m =0)
      #|  ((b:num->num) (n) = 0) /\\ (!m. ~(m=n) ==> (b m = t m))
      #|  b = \\m. (if (m=n) then 0 else (t (m:num)) )
      #|  (a=0) ==> (a <=|0)
      #|  0
      #|  0<=|m
      #|  n:num
      #|  n:num
      #|  t:num->num
      #|  t:num->num
      #|  !(t:num->num). (?n. !m. (n <=| m) ==> (t m = 0)) ==>\n      (?M. !i. (t i <=| M))
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  b:num->num
      #|  inv x * y = y* inv x
      #|  !x y z. (&.0 <. x) ==> ((inv(x)*y < z) <=> (y <. x*z))
      #|  (x <. &.0) ==> (x <=. &.0)
      #|  ((x <. &.0) ==> ~(&.0 <=. x))
      #|  --. (y:real)
      #|  --. (x:real)
      #|  (x <. &.0) ==> (x <=. &.0)
      #|  ((x <. &.0) ==> ~(&.0 <=. x))
      #|  (&.0 < x) \\/ (x = &.0) \\/ (x < &.0)
      #|  (&.0 <. x) ==> ~(x <=. &.0)
      #|  ((&.0 <. x) ==> (&.0 <=. x))
      #|  ! x y. ((&.0 < x) ==> ((&.0 <= x*y) <=> ((&.0 <= x /\\ (&.0 <=. y)) \\/ ((x <= &.0) /\\ (y <= &.0) ))))
      #|  !x y. (&.0 <= x*y) <=>\n    ((&.0 <= x /\\ (&.0 <=. y)) \\/ ((x <= &.0) /\\ (y <= &.0) ))
      #|  (b:real) = (abs t)
      #|  t:real
      #|  t:real
      #|  !t u. abs(t) <. u ==> t*t <. u*u
      #|  (b:real) = (abs t)
      #|  t:real
      #|  t:real
      #|  !t u. abs(t) <=. u ==> t*t <=. u*u
      #|  n:num
      #|  R/e
      #|  !n. &.0 < &.2 pow n
      #|  !R e. ?n. (&.0 <. R)/\\ (&.0 <. e) ==> R*(twopow(--: (&:n))) <. e
      #|  TAGB
      #|  \\(n,m) f. (sm:num->num->(num->real)->real) n m f
      #|  (!f n. sm n 0 f = &1) /\\ (!f m n. sm  n (SUC m) f = sm n m f * f(n + m))
      #|  ?prod. (!f n.  prod(n,0) f = &1) /\\\n         (!f m n. prod(n,SUC m) f = prod(n,m) f * f(n + m))
      #|  !n m. (prod(n,0) f = &1) /\\\n   (prod(n,SUC m) f = prod(n,m) f * f(n + m))
      #|  0+|n = n
      #|  n+| (SUC p) = (SUC (n+|p))
      #|  !f n p. prod(0,n) f * prod(n,p) f = prod(0,n + p) f
      #|  !f m n. abs(prod(m,n) f) = prod(m,n) (\\n. abs(f n))
      #|  r <| (n+| m) ==> (r <| (SUC n +| m))
      #|  (m<=| (m+|n))/\\ (m +| n <| (SUC n +| m))
      #|  !f g m n. (!r. m <= r /\\ r < (n + m) ==> (f(r) = g(r)))\n        ==> (prod(m,n) f = prod(m,n) g)
      #|  m+|n
      #|  !f. (!n. &0 <= f(n)) ==> !m n. &0 <= prod(m,n) f
      #|  m <=| (m +| n)
      #|  n:num
      #|  n:num
      #|  !f m n.\n     (!n. m <= n ==> &0 <= f(n))\n     ==> &0 <= prod(m,n) f
      #|  ||. (||. x) = (||. x)
      #|  !f m n. abs(prod(m,n) (\\m. abs(f m))) = prod(m,n) (\\m. abs(f m))
      #|  (x = (&.0)) ==> (y *. x = (&.0))
      #|  (x = (&.0)) ==> (x *. y = (&.0))
      #|  p <| (n+| m)
      #|  !f m n. (?p. (m <= p /\\ (p < (n+| m)) /\\ (f p = (&.0)))) ==>\n         (prod(m,n) f = &0)
      #|  (~(p <| (n+|m)) ==> ((p <| ((SUC n) +| m)) ==> (p = ((m +| n)))))
      #|  !f g m n. prod(m,n) (\\n. f(n) * g(n)) = prod(m,n) f * prod(m,n) g
      #|  !f c m n. prod(m,n) (\\n. c * f(n)) = (c **. n) * prod(m,n) f
      #|  !(f:A->B) a b. SURJ f a b ==> (b = (IMAGE f a))
      #|  !a b (f:A->B). FINITE a /\\ (SURJ f a b) ==> FINITE b
      #|  u:B->A
      #|  !y. ?u. ((y IN b) ==> ((u IN a) /\\ ((f:A->B) u = y)))
      #|  !a b (f:A->B). (SURJ f a b) ==> (?(g:B->A). (INJ g b a))
      #|  x:A->bool
      #|  (?)
      #|  (IN)
      #|  c:A
      #|  t:A->bool
      #|  (X DIFF t):A->bool
      #|  (?)
      #|  c:A
      #|  !(X:A->bool)  V.\n     (X DIFF (INTERS V) = UNIONS (IMAGE ((DIFF) X) V))
      #|  !X (A:A->bool).  (A IN X) ==> (INTERS X SUBSET A)
      #|  X:A->bool
      #|  !X (U:(A->bool)->bool). (U X) ==> (X SUBSET (UNIONS U))
      #|  !(f:A->B) a. SURJ f a (IMAGE f a)
      #|  (SUBSET)
      #|  y:B
      #|  {x | (x IN (X:A->bool))/\\ (f x IN (Y:B->bool)) }
      #|  !(f:A->B) X Y. (Y SUBSET (IMAGE f X)) ==>\n    (?Z. (Z SUBSET X) /\\ (Y = IMAGE f Z))
      #|  y:B
      #|  A INTER (u:A->bool)
      #|  (?)
      #|  y:A
      #|  y:A
      #|  ((C SUBSET (B:A->bool)) /\\ (C SUBSET A) /\\ ((A INTER B) SUBSET C)) ==> ((B INTER A) = C)
      #|  !(U:(A->bool)->bool) A. (((UNIONS U) INTER A) =\n       (UNIONS (IMAGE ((INTER) A) U)))
      #|  !U (X:A->bool). (!A. (A IN U) ==> (A SUBSET X))  ==> (UNIONS U SUBSET X)
      #|  !X A (B:A->bool). (X SUBSET (A INTER B)) <=> (X SUBSET A) /\\ (X SUBSET B)
      #|  !X. ~(X = {}) <=> (? (u:A). (u IN X))
      #|  !A B. (A SUBSET B) ==>(UNIONS (A:(A->bool)->bool) SUBSET (UNIONS B))
      #|  x':(A->bool)->bool
      #|  t':(A->bool)
      #|  (x:A) IN t
      #|  (t':(A->bool)->bool)
      #|  UNIONS (t':(A->bool)->bool)
      #|  !(X:((A->bool)->bool)->bool).\n    UNIONS (UNIONS X) = (UNIONS (IMAGE UNIONS X))
      #|  !X A. (?(x:A->bool). (A x /\\ (x SUBSET X))) ==> ((INTERS A) SUBSET X)
      #|  INTERS EMPTY = (UNIV:A->bool)
      #|  preimage dom (f:A->B)\n  Z = {x | (x IN dom) /\\ (f x IN Z)}
      #|  !f x Z dom. x IN (preimage dom (f:A->B) Z) <=> (x IN dom) /\\ (f x IN Z)
      #|  supp (f:A->B) = \\ x.  ~(f x = (CHOICE (UNIV:B ->bool)) )
      #|  func a b = (\\ (f:A->B). ((!x. (x IN a) ==> (f x IN b)) /\\\n              ((supp f) SUBSET a))) 
      #|  reflexive (f:A->A->bool) <=> (!x. f x x)
      #|  symmetric (f:A->A->bool) <=> (!x y. f x y ==> f y x)
      #|  transitive (f:A->A->bool) <=> (!x y z. f x y /\\ f y z ==> f x z)
      #|  equivalence_relation (f:A->A->bool) <=>\n    (reflexive f) /\\ (symmetric f) /\\ (transitive f)
      #|  partition (A:A->bool) SA <=> (UNIONS SA = A) /\\\n   (!a b. ((a IN SA) /\\ (b IN SA) /\\ (~(a = b)) ==> ({} = (a INTER b))))
      #|  !X (A:A->bool). (A SUBSET X) ==> ((X DIFF (X DIFF A)) = A)
      #|  !P (x:A). (?y. P y /\\ (x = y)) <=> P x
      #|  \\x:A. x
      #|  !s:A->bool. s >=_c s
      #|  n:num < N
      #|  n:num
      #|  n:num
      #|  N:num
      #|  y:A
      #|  \\n:num. if n = N then x:A else f n
      #|  f:num->A
      #|  SUC N
      #|  N:num
      #|  0
      #|  !s:A->bool. FINITE s ==> ?n:num. {x | x < n} >=_c s
      #|  COUNTABLE (UNIV:num->bool)
      #|  SUC a = a+| 1
      #|  n:num
      #|  SUC n
      #|  n:num
      #|  SUC a +| b = a +| SUC b
      #|  SUC b
      #|  t'  = SUC t
      #|  SUC t = t+|1
      #|  SUC n
      #|  n:num
      #|  n:num
      #|  t:num
      #|  0
      #|  0
      #|  b:num
      #|  y':num
      #|  a:num
      #|  x:num
      #|  ?t. t = x+|y'
      #|  p:num#num
      #|  fn:num -> (num#num)
      #|  (\\ (a:num,b:num) (n:num) . if (b=0) then (0,a+b+1) else (a+1,b-1))
      #|  (0,0)
      #|  COUNTABLE {((x:num),(y:num)) | T}
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  x':num
      #|  ?x' y'. (u:num,v:num) = (x',y')
      #|  (u:num,v:num)
      #|  y:A
      #|  t:A->bool
      #|  (\\p. (g:(A->bool)->num->A) ((f:num->(A->bool)) (FST ((h:num->(num#num)) p))) (SND (h p)))
      #|  h:num->(num#num)
      #|  (x:(A->bool)->num) a
      #|  a:A->bool
      #|  a:A->bool
      #|  !a y. (a IN (A:(A->bool)->bool)) /\\ (y IN a) ==> (? (u:num) (v:num). ( a = f u) /\\ (y = g a v))
      #|  g:(A->bool)->num->A
      #|  !A:(A->bool)->bool. (COUNTABLE A) /\\\n      (!a. (a IN A) ==> (COUNTABLE a)) ==> (COUNTABLE (UNIONS A))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  x':A
      #|  y:B
      #|  (f':A->B) o (f:num->A)
      #|  !(A:A->bool) (B:B->bool) . (COUNTABLE A) /\\ (?f. (B SUBSET IMAGE f A)) ==>\n        (COUNTABLE B)
      #|  f:A->B
      #|  A:A->bool
      #|  !(A:A->bool) (B:B->bool). (COUNTABLE A) /\\ (A >=_c B) ==>\n     (COUNTABLE B)
      #|  I:num->num
      #|  !n. COUNTABLE {x | x <| n}
      #|  n:num
      #|  !(A:A->bool). (FINITE A) ==> (COUNTABLE A)
      #|  ~ (FINITE (UNIV:num->bool))
      #|  ({u | i <| u} UNION {m | m <=| i}) = UNIV
      #|  !i. ({u | i <| u} UNION {m | m <=| i}) = UNIV
      #|  ({u | i <| u} UNION {m | m <=| i}) = UNIV
      #|  i:num
      #|  !i. ~ (FINITE {u | i <| u})
      #|  s INTER t SUBSET (s:A->bool)
      #|  !s (t:A->bool). (FINITE s ==> FINITE(s INTER t)) /\\ (FINITE t ==> FINITE (s INTER t))
      #|  TAGB
      #|  TAGB
      #|  i:num
      #|  J = (J INTER {u | (i <| u)}) UNION (J INTER {m | m <=| i})
      #|  !i J. (FINITE (J INTER {u | (i <| u)})) ==> (FINITE J)
      #|  (SUC n = j -| i) ==> (0 < j -| i)
      #|  (i<=| j')
      #|  (n = j'-|i)
      #|  i:num
      #|  j':num
      #|  j':num
      #|  j:num
      #|  ?j'. j = SUC j'
      #|  j:num
      #|  j:num
      #|  i:num
      #|  i:num
      #|  ?n. n = j -| i
      #|  !(f:num->A->bool). (!i. f i SUBSET f (SUC i)) ==> (! i j. ( i <=| j) ==> (f i SUBSET f j))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (SUC n = j -| i) ==> (0 < j -| i)
      #|  (i<=| j')
      #|  (n = j'-|i)
      #|  i:num
      #|  j':num
      #|  j':num
      #|  j:num
      #|  ?j'. j = SUC j'
      #|  j:num
      #|  j:num
      #|  i:num
      #|  i:num
      #|  ?n. n = j -| i
      #|  !(f:num->A->bool). (!i. f (SUC i) SUBSET (f i)) ==> (! i j. ( i <=| j) ==> (f j SUBSET f i))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  r = {i | I' i /\\ (C INTER b) ((f:A->B) i)}
      #|  b:B->bool
      #|  b:B->bool
      #|  FINITE (IMAGE (\\b. {i | I' i /\\ (C INTER b) ((f:A->B) i)}) B)
      #|  {i' | I' i' /\\ (C INTER u) ((f:A->B) i')}
      #|  u:B->bool
      #|  (f:A->B) j
      #|  j = (x:A)
      #|  {i | I' i /\\ (C ((f:A->B) i))} = UNIONS (IMAGE (\\b. {i | I' i /\\ ((C INTER b) (f i))}) B)
      #|  P ==> (~P ==> F)
      #|  !I (f:A->B) B C. (~(FINITE {i | (I i) /\\ (C (f i))})) /\\ (FINITE B) /\\\n    (C SUBSET (UNIONS B)) ==>\n    (?b. (B b) /\\ ~(FINITE {i | (I i) /\\ (C INTER b) (f i) }))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  a<=b ==> ((x <= a) ==> (x <=. b))
      #|  x:real
      #|  (n:real->num) x
      #|  x:real
      #|  &.a
      #|  IMAGE (n:real->num) s
      #|  FINITE (IMAGE (n:real->num) s)
      #|  !(s:real->bool). FINITE s ==> (?a. !x. x IN s ==> (x <=. a))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !s. (UNIONS (s:(A->bool)->bool)) = (UNIONS (s DELETE (EMPTY)))
      #|  SUPP (f:A->B) = \\ x.  ~(f x = (CHOICE (UNIV:B ->bool)) )
      #|  FUN a b = (\\ (f:A->B). ((!x. (x IN a) ==> (f x IN b)) /\\\n              ((SUPP f) SUBSET a))) 
      #|  compose f g = \\x. (f (g x))
      #|  !(f:num ->num) (g:num->num) (h:num->num).\n      (compose f (compose g h)) = (compose (compose f g) h)
      #|  !(f:A->B) (g:B->C) s t u.\n      INJ f s t /\\ (INJ g t u) ==>\n  (INJ (compose g f) s u)
      #|  !(f:A->B) (g:B->C) s t u.\n   SURJ f s t /\\ (SURJ g t u) ==> (SURJ (compose g f) s u)
      #|  !(f:A->B) s t (g:B->C) u.\n    BIJ f s t /\\ (BIJ g t u) ==> (BIJ (compose g f) s u)
      #|  u:B->A
      #|  ?u. !y. ((y IN b)==> ((u y IN a) /\\ ((f:A->B) (u y) = y)))
      #|  !A B. (A ==> (?x. (B x))) ==> (?(x:B->A). (A ==> (B x)))
      #|  ?INV. (! (f:A->B) a b. (SURJ f a b) ==> ((INJ (INV f a b) b a) /\\\n       (!(x:B). (x IN b) ==> (f ((INV f a b) x) = x))))
      #|  f:A->B
      #|  f:A->B
      #|  f:A->B
      #|  INV (f:A->B) a b (f x) IN a
      #|  (f:A->B) (INV f a b (f x)) = (f x)
      #|  ((f:A->B) x) IN b
      #|  (f:A->B) x
      #|  !(f:A->B) a b. (BIJ f a b) ==> ((BIJ (INV f a b) b a))
      #|  x:A
      #|  INV (f:A->B) a b (f x)
      #|  x:A
      #|  INV (f:A->B) a b (f x)
      #|  !(f:A->B) a b x y. (BIJ f a b) /\\ (x IN a) /\\ (y IN b) ==> ((INV f a b y = x) <=> (f x = y))
      #|  !a b (f:A->B). FINITE a /\\ (BIJ f a b) ==> (FINITE b)
      #|  ({x | (x IN a) /\\ ((f:A->B) x IN b)})
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  (a:A->bool) SUBSET ({x | (x IN a) /\\ ((f:A->B) x IN b)})
      #|  a:A->bool
      #|  b:B->bool
      #|  f:A->B
      #|  !a b (f:A->B). FINITE b /\\ (INJ f a b) ==> (FINITE a)
      #|  !a b (f:A->B). FINITE b /\\ (BIJ f a b) ==> (FINITE a)
      #|  !a b (f:A->B). FINITE a /\\ (BIJ f a b) ==> (CARD a = (CARD b))
      #|  !(x:num#num) i j. ((FST x = i) /\\ (SND x = j)) <=> (x = (i,j))
      #|  SUC 0
      #|  !(u:A->bool). (SING u ) ==> (CARD u = 1)
      #|  !(x:A). FINITE ({x})
      #|  g:A
      #|  (f:A->num) (g:A)
      #|  !f P.((!(n:num). !(g:A). (f g = n) ==> (P g)) ==> (!g. (P g)))
      #|  f:A->B
      #|  !b. FUN (EMPTY:A->bool) b = { (\\ (u:A). (CHOICE (UNIV:B->bool))) }
      #|  (((t:A)=s) <=> T) \\/ ((t=s) <=> F)
      #|  t:A
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  ~((t:A)=s) ==> ((t=s)=F)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  (t:A) = s
      #|  t:A
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  t:A
      #|  \\ (x:A). if (x = s) then (v:B) else (u x)
      #|  p:(A->B)#B
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  (x:A) = s
      #|  f2:A->B
      #|  f1:A->B
      #|  (x:A) = s
      #|  (f:A->B) s
      #|  g:A->B
      #|  g = \\ x. (if (x=(s:A)) then (CHOICE (UNIV:B->bool)) else (f x)) 
      #|  (f:A->B)
      #|  (A /\\ (A ==> B) /\\ (A ==>C))  ==> ((A/\\ B) /\\ (A /\\ C))
      #|  \\ f. ((\\ x. (if (x=(s:A)) then (CHOICE (UNIV:B->bool)) else (f x))),(f s))
      #|  !a b s. (~((s:A) IN a) ==>\n      (?F.   (BIJ F (FUN (s INSERT a) b)\n           { (u,v) | (u IN (FUN a b)) /\\ ((v:B) IN b) }\n           )))
      #|  FST:((A->B)#B)->(A->B)
      #|  FST:((A->B)#B)->(A->B)
      #|  x:A
      #|  t:A
      #|  t:A
      #|  ~(x=0) ==> (SUC (x -| 1) = x)
      #|  !(a:(A->bool)). ((FINITE a) /\\ (~(a=EMPTY))) ==>\n   (SUC (CARD (a DELETE (CHOICE a))) = (CARD a))
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  B ==> (A==>B)
      #|  (FUN ((a:A->bool) DELETE CHOICE a) (b:B->bool)) HAS_SIZE (CARD b **| (CARD (a DELETE CHOICE a)))
      #|  FINITE (a DELETE CHOICE (a:A->bool))
      #|  F':(A->B)->((A->B)#B)
      #|  CARD (FUN (a:A->bool) (b:B->bool)) = (CARD {u,v | (u:A->B) IN FUN (a DELETE CHOICE a) b /\\ (v:B) IN b})
      #|  F':(A->B)->((A->B)#B)
      #|  {u,v | (u:A->B) IN FUN (a DELETE CHOICE a) b /\\ (v:B) IN b}
      #|  :B
      #|  :(A->B)#B
      #|  :A
      #|  :A->B
      #|  FUN (a:A->bool) (b:B->bool)
      #|  FINITE (FUN (a:A->bool) (b:B->bool))
      #|  !x. (x = (SUC n)) ==> (~(x = 0))
      #|  ~((a:A->bool) = EMPTY)
      #|  (CHOICE (a:A->bool))
      #|  b:B->bool
      #|  ((a:A->bool) DELETE (CHOICE a))
      #|  FUN ((a:A->bool) DELETE CHOICE a) (b:B->bool) HAS_SIZE CARD b **| CARD (a DELETE CHOICE a)
      #|  !n. (SUC n -| 1) = n
      #|  !x. (x = (SUC n)) ==> (~(x = 0))
      #|  CHOICE (a:A->bool) IN a
      #|  CARD ((a:A->bool) DELETE (CHOICE a)) = n
      #|  (a:A->bool) = EMPTY
      #|  :A
      #|  :A->bool
      #|  CARD:(A->bool)->num
      #|  !b a. (FINITE (a:A->bool)) /\\ (FINITE (b:B->bool))\n          ==> ((FUN a b) HAS_SIZE ((CARD b) EXP (CARD a)))
      #|  (a:A->bool) DELETE (CHOICE a)
      #|  drop0 (u:A#B) = SND u
      #|  drop1 (u:A#B#C) = SND (SND u)
      #|  drop2 (u:A#B#C#D) = SND (SND (SND u))
      #|  drop3 (u:A#B#C#D#E) = SND (SND (SND (SND u)))
      #|  part0 (u:A#B) = FST u
      #|  part1 (u:A#B#C) = FST (drop0 u)
      #|  part2 (u:A#B#C#D) = FST (drop1 u)
      #|  part3 (u:A#B#C#D#E) = FST (drop2 u)
      #|  part4 (u:A#B#C#D#E#F) = FST (drop3 u)
      #|  part5 (u:A#B#C#D#E#F#G) =\n   FST (SND (SND (SND (SND (SND u)))))
      #|  part6 (u:A#B#C#D#E#F#G#H) =\n   FST (SND (SND (SND (SND (SND (SND u))))))
      #|  part7 (u:A#B#C#D#E#F#G#H#I) =\n   FST (SND (SND (SND (SND (SND (SND (SND u)))))))
      #|  euclid'euclid_plus:(num->real)->(num->real)->(num->real)
      #|  :A -> B -> B
      #|  euclid_scale t f = \\ (i:num). (t*. (f i))
      #|  euclid'euclid_scale
      #|  euclid_neg f = \\ (i:num). (--. (f i))
      #|  euclid'euclid_neg
      #|  euclid'euclid_minus:(num->real)->(num->real)->(num->real)
      #|  euclid_plus f g = \\ (i:num). (f i) +. (g i)
      #|  euclid n v <=> !m. (n <=| m) ==> (v m = &.0)
      #|  euclidean v <=> ?n. euclid n v
      #|  euclid_minus f g = \\(i:num). (f i) -. (g i)
      #|  euclid0 = \\(i:num). &.0
      #|  coord i (f:num->real) = f i
      #|  dot f g =\n  let (n = (min_num (\\m. (euclid m f) /\\ (euclid m g)))) in\n  sum (0,n) (\\i. (f i)*(g i))
      #|  norm f = sqrt(dot f f)
      #|  d_euclid f g = norm (f - g)
      #|  \\(n,m) f. (sm:num->num->(num->(num->real))->(num->real)) n m f
      #|  (!f n. sm n 0 f = (\\n. &0)) /\\ (!f m n. sm  n (SUC m) f = sm n m f + f(n + m))
      #|  ?sum_vector. (!f n. sum_vector(n,0) f = (\\n. &.0)) /\\\n    (!f m n. sum_vector(n,SUC m) f = sum_vector(n,m) f + f(n + m))
      #|  mk_segment x y = { u | ?a. (&.0 <=. a) /\\ (a <=. &.1) /\\\n        (u = a *# x + (&.1 - a) *# y) }
      #|  mk_open_segment x y = { u | ?a. (&.0 <. a) /\\ (a <. &.1) /\\\n        (u = a *# x + (&.1 - a) *# y) }
      #|  convex S <=> !x y. (S x) /\\ (S y) ==> (mk_segment x y SUBSET S)
      #|  convex_hull S = { u | ?f alpha m. (!n. (n< m) ==> (S (f n))) /\\\n    (sum(0,m) alpha = &.1) /\\ (!n. (n< m) ==> (&.0 <=. (alpha n))) /\\\n    (u = sum_vector(0,m) (\\n. (alpha n) *# (f n)))}
      #|  affine_hull S = { u | ?f alpha m. (!n. (n< m) ==> (S (f n))) /\\\n    (sum(0,m) alpha = &.1) /\\\n    (u = sum_vector(0,m) (\\n. (alpha n) *# (f n)))}
      #|  mk_line x y =\n   {z| ?t. (z = (t *# x) + ((&.1 - t) *# y)) }
      #|  affine S <=> !x y. (S x ) /\\ (S y) ==> (mk_line x y SUBSET S)
      #|  affine_dim n S <=>\n    (?T. (T HAS_SIZE (SUC n)) /\\ (affine_hull T = affine_hull S)) /\\\n    (!T m. (T HAS_SIZE (SUC m)) /\\ (m < n) ==> ~(affine_hull T = affine_hull S))
      #|  collinear S <=> (?n. affine_dim n S /\\ (n < 2))
      #|  coplanar S <=> (?n. affine_dim n S /\\ (n < 3))
      #|  line L <=> (affine L) /\\ (affine_dim 1 L)
      #|  plane P <=> (affine P) /\\ (affine_dim 2 P)
      #|  space R <=> (affine R) /\\ (affine_dim 3 R)
      #|  mk_open_half_set L S  =\n   { u | ?t v c. (L v) /\\ (S c) /\\ (&.0 < t) /\\\n      (u = (t *# (c - v) + (&.1 - t) *# v)) }
      #|  mk_half_set L S  =\n   { u | ?t v c. (L v) /\\ (S c) /\\ (&.0 <=. t) /\\\n      (u = (t *# (c - v) + (&.1 - t) *# v)) }
      #|  mk_angle x y z =\n   (mk_half_set {x} {y}) UNION (mk_half_set {x} {z})
      #|  mk_signed_angle x y z =\n   (mk_half_set {x} {y} , mk_half_set {x} {z})
      #|  mk_convex_cone v (S:(num->real)->bool) =\n    mk_half_set {v} (convex_hull S)
      #|  packing (S:(num->real)->bool) <=>\n        !x y. ( ((S x) /\\ (S y) /\\ ((d_euclid x y) < (&.2))) ==>\n                (x = y))
      #|  saturated_packing S <=>\n        (( packing S) /\\\n        (!z. (affine_hull S z)  ==>\n               (?x. ((S x) /\\ ((d_euclid x z) < (&.2))))))
      #|  cross_product3 v1 v2 =\n        let (x1 = v1 0) and (x2 = v1 1) and (x3 = v1 2) in\n        let (y1 = v2 0) and (y2 = v2 1) and (y3 = v2 2) in\n        (\\k.\n                (if (k=0) then (x2*y3-x3*y2)\n                else if (k=1) then (x3*y1-x1*y3)\n                else if (k=2) then (x1*y2-x2*y1)\n                else (&0)))
      #|  triple_product v1 v2 v3 =\n        dot v1 (cross_product3 v2 v3)
      #|  mk_triangle v1 v2 v3 =\n  (mk_segment v1 v2) UNION (mk_segment v2 v3) UNION (mk_segment v3 v1)
      #|  mk_interior_triangle v1 v2 v3 =\n     mk_open_half_set (mk_line v1 v2) {v3} INTER\n       (mk_open_half_set (mk_line v2 v3) {v1}) INTER\n       (mk_open_half_set (mk_line v3 v1) {v2})
      #|  mk_triangular_region v1 v2 v3 =\n    (mk_triangle v1 v2 v3) UNION (mk_interior_triangle v1 v2 v3)
      #|  !L S. convex (mk_half_set L S)
      #|  !L S . convex (mk_open_half_set L S )
      #|  !S. (affine_dim 0 S) = (SING S)
      #|  !S. (convex (convex_hull S))
      #|  !S T. (convex T) /\\ (S SUBSET T) ==>\n     (convex_hull S) SUBSET T
      #|  !S. (affine (affine_hull S))
      #|  !S T. (affine T) /\\ (S SUBSET T) ==>\n     (affine_hull S) SUBSET T
      #|  !x y. ~(x = y) ==> affine_dim 1 (mk_line x y)
      #|  !S. (affine_hull S) = (affine_hull (convex_hull S))
      #|  !S. (convex_hull S) = (convex_hull (convex_hull S))
      #|  !n. affine_dim n (euclid n)
      #|  !m n T S.\n  (affine_dim m T) /\\ (affine_dim n S) /\\ (T SUBSET S) ==> (m <= n)
      #|  !x y. ~(x = y) ==>\n   (?!L. (L x) /\\ (L y) /\\ (line L))
      #|  !L. (line L) ==>\n  (?f. (BIJ f L UNIV) /\\\n  (!x y. (L x /\\ L y ==> (d_euclid x y = abs(f x -. f y)))))
      #|  !n. (affine_dim n P) ==> (?S.\n  (S SUBSET P) /\\ (S HAS_SIZE n) /\\ (affine_dim n S))
      #|  !P x y. (plane P) /\\ (P x) /\\ (P y) ==>\n  (mk_line x y SUBSET P)
      #|  !S. (S HAS_SIZE 3) ==> (?P. (plane P) /\\\n   (S SUBSET P))
      #|  !S. (S HAS_SIZE 3) ==> (collinear S) \\/\n  (?! P. (plane P) /\\ (S SUBSET P))
      #|  !P Q. (plane P) /\\ (plane Q) ==>\n  (P INTER Q = EMPTY) \\/ (line (P INTER Q)) \\/ (P = Q)
      #|  !P L. (plane P) /\\ (line L) /\\ (L SUBSET P) ==>\n  (?A B. (A INTER B = EMPTY) /\\ (A INTER L = EMPTY) /\\\n    (B INTER L = EMPTY) /\\ (L UNION A UNION B = P) /\\\n   (!c u. (P c) /\\ (u = mk_open_half_set L {c}) ==>\n      (u = A) \\/ (u = B) \\/ (u = L)) /\\\n   (!a b. (A a) /\\ (B b) ==> ~(segment a b INTER L = EMPTY)))
      #|  !R P. (space R) /\\ (plane P) /\\ (P SUBSET R) ==>\n  (?A B. (A INTER B = EMRTY) /\\ (A INTER P = EMRTY) /\\\n    (B INTER P = EMRTY) /\\ (P UNION A UNION B = R) /\\\n   (!c u. (R c) /\\ (u = mk_open_half_set P {c}) ==>\n      (u = A) \\/ (u = B) \\/ (u = P)) /\\\n     (!a b. (A a) /\\ (B b) ==> ~(segment a b INTER L = EMPTY)))
      #|  metric_space (X:A->bool,d:A->A->real)\n   <=>\n   !x y z.\n      (X x) /\\ (X y) /\\ (X z) ==>\n         (((&.0) <=. (d x y)) /\\\n          ((&.0 = d x y) = (x = y)) /\\\n          (d x y = d y x) /\\\n          (d x z <=. d x y + d y z))
      #|  set_translate v X = { z | ?x. (X x) /\\ (z = v + x) }
      #|  set_scale r X = { z | ?x. (X x) /\\ (z = r *# x) }
      #|  mk_rectangle a b = { z | !(i:num). (a i <=. z i) /\\ (z i <. b i) }
      #|  one_vec n = (\\i. if (i<| n) then (&.1) else (&.0))
      #|  mk_cube n k v =\n    let (r = twopow (--: (&: k))) in\n    let (vv = (\\i. (real_of_int (v i)))) in\n     mk_rectangle (r *# vv) (r *# (vv + (one_vec n)))
      #|  inner_cube n k A =\n    { v | (mk_cube n k v SUBSET A) /\\\n      (!i. (n <| i) ==> (&:0 = v i)) }
      #|  outer_cube n k A =\n    { v | ~((mk_cube n k v) INTER A = EMPTY) /\\\n      (!i. (n <| i) ==> (&:0 = v i)) }
      #|  inner_vol n k A =\n    (&. (CARD (inner_cube n k A)))*(twopow (--: (&: (n*k))))
      #|  outer_vol n k A =\n    (&. (CARD (outer_cube n k A)))*(twopow (--: (&: (n*k))))
      #|  euclid_bounded A = (?R. !(x:num->real) i. (A x) ==> (x i <. R))
      #|  vol n A = lim (\\k. outer_vol n k A)
      #|  (+):num->(num->num)
      #|  (-):num->(num->num)
      #|  ( * ):num->(num->num)
      #|  (EXP):num->(num->num)
      #|  (DIV):num->(num->num)
      #|  (MOD):num->(num->num)
      #|  (<):num->(num->bool)
      #|  (<=):num->(num->bool)
      #|  (>):num->(num->bool)
      #|  (>=):num->(num->bool)
      #|  int_add:int->int->int
      #|  int_sub:int->int->int
      #|  int_mul:int->int->int
      #|  int_pow:int->num->int
      #|  int_lt:int->int->bool
      #|  int_le:int->int->bool
      #|  int_gt:int->int->bool
      #|  int_ge:int->int->bool
      #|  int_neg:int->int
      #|  int_of_num:num->int
      #|  int_abs:int->int
      #|  real_add:real->real->real
      #|  real_sub:real->real->real
      #|  real_mul:real->real->real
      #|  real_pow:real->num->real
      #|  real_lt:real->real->bool
      #|  real_le:real->real->bool
      #|  real_gt:real->real->bool
      #|  real_ge:real->real->bool
      #|  real_neg:real->real
      #|  real_of_num:num->real
      #|  real_abs:real->real
      #|  real_add:real->real->real
      #|  real_sub:real->real->real
      #|  real_mul:real->real->real
      #|  real_div:real->real->real
      #|  real_lt:real->real->bool
      #|  real_le:real->real->bool
      #|  real_gt:real->real->bool
      #|  real_ge:real->real->bool
      #|  real_neg:real->real
      #|  real_pow:real->num->real
      #|  real_inv:real->real
      #|  real_abs:real->real
      #|  real_of_num:num->real
      #|  summable (\\n. (f (n+k))) /\\ (suminf (\\n. (f (n+k))) <=. (suminf (\\n. (g (n+k)))))
      #|  (\\n. (f (n+ k))) sums (s - (sum(0,k) f))
      #|  !s f g.  (f sums s) /\\ (summable g) ==>\n    (!k. ((!n. (||. (f (n+k)) <=. (g (n+k)))) ==>\n    ( (s - (sum(0,k) f)) <=. (suminf (\\n. (g (n +| k)))))))
      #|  k:num
      #|  k:num
      #|  k:num
      #|  (--. s -. (--. u) <=. x) ==> (--. x <=. (s -. u))
      #|  (!k. ((!n. (||. ((\\p. (--. (f p))) (n+k))) <=. (g (n+k)))) ==> ((--.s) - (sum(0,k) (\\p. (--. (f p)))) <=. (suminf (\\n. (g (n +k))))))
      #|  !s f g.  (f sums s) /\\ (!n. (||. (f n) <=. (g n))) /\\\n       (summable g) ==>\n    (!k. (abs (s - (sum(0,k) f)) <=. (suminf (\\n. (g (n +| k))))))
      #|  ((&.0 <. (&.n)) /\\ (&.n <=. a)) ==> (inv(a)<=. (inv(&.n)))
      #|  ||.(&.n) = (&.n)
      #|  (a<=.b) ==> (&.n*a <=. (&.n)*b)
      #|  1 <=| n ==> (0 < n)
      #|  (abs((&.4)*.u)<=. (&.4)/(&.9)) /\\ (abs((&.2)*.v)<=. (&.2)/(&.12)) /\\ (abs((&.1)*w) <=. (&.1)/(&.13)) /\\ (abs((&.1)*x) <=. (&.1)/(&.14)) ==> (abs((&.4)*u -(&.2)*v - (&.1)*w - (&.1)*x) <= (&.4/(&.9) +(&.2/(&.12)) + (&.1/(&.13))+ (&.1/(&.14))))
      #|  (&.4/(&.9) +(&.2/(&.12)) + (&.1/(&.13))+ (&.1/(&.14)))
      #|  !n. (1 <=| n) ==> (abs(&4 / &(8 * n + 1) -\n            &2 / &(8 * n + 4) -\n            &1 / &(8 * n + 5) -\n            &1 / &(8 * n + 6)) <= &.622/(&.819))
      #|  pi_fun n = inv (&.16 **. n) *.\n          (&.4 / &.(8 *| n +| 1) -.\n           &.2 / &.(8 *| n +| 4) -.\n           &.1 / &.(8 *| n +| 5) -.\n           &.1 / &.(8 *| n +| 6))
      #|  pi_bound_fun n = if (n=0) then (&.8) else\n    (((&.15)/(&.16))*(inv(&.16 **. n))) 
      #|  &.0 < (&.16)
      #|  ~(k=0) ==> (1<=| k)
      #|  (&.622)/(&.819) <=. (&.15)/(&.16)
      #|  !x y z. (&.0 <. z /\\ (y <=. x) ==> (z*y <=. (z*x)))
      #|  ||.(&.n) = (&.n)
      #|  a*b = b*.a
      #|  !k. abs(pi_fun k) <=. (pi_bound_fun k)
      #|  abs (&.1 / (&. 16)) <. (&.1)
      #|  !k. (\\n. inv (&16 pow k) * inv (&16 pow n)) sums\n         inv (&16 pow k) * &16 / &15
      #|  (b*(a*c) = (b*(&.1))) ==> ((a*b)*c = b)
      #|  (x=y) ==> ((a sums x) ==> (a sums y))
      #|  k:num
      #|  (\\n. (&.15/(&.16)) *. ((inv(&.16)**. k)*. inv(&.16 **. n))) sums ((&.15/(&.16)) *.(inv(&.16**. k)*. ((&.16)/(&.15))))
      #|  0<| k ==> (~(n+k = 0))
      #|  n:num
      #|  (\\n. pi_bound_fun (n+k)) = (\\n. ((&.15/(&.16))* (inv(&.16)**. k) *. inv(&.16 **. n)))
      #|  !k. (0<|k) ==> (\\n. (pi_bound_fun (n+k))) sums (inv(&.16 **. k))
      #|  suminf (\\n. pi_bound_fun (n + k)) = inv (&.16 **. k)
      #|  pi_bound_fun
      #|  pi_fun
      #|  pi
      #|  !k. (0<|k) ==> (abs(pi - (sum(0,k) pi_fun)) <=. (inv(&.16 **. (k))))
      #|  k:num
      #|  2 EXP 4
      #|  !n. inv (&.16 **. n) = (twopow (--: (&:(4*n)))) 
      #|dirac_delta =  |- (#!:fun(fun(num,bool),bool) (\i:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#dirac_delta:fun(num,fun(num,real)) i:num)) (\j:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) i:num) j:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|min_num =  |- (#!:fun(fun(fun(num,bool),bool),bool) (\X:fun(num,bool). ((#=:fun(num,fun(num,bool)) (#min_num:fun(fun(num,bool),num) X:fun(num,bool))) (#@:fun(fun(num,bool),num) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) m:num) X:fun(num,bool))) (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) X:fun(num,bool))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))))))
      #|min_least =  |- (#!:fun(fun(fun(num,bool),bool),bool) (\X:fun(num,bool). (#!:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (X:fun(num,bool) c:num)) ((#/\:fun(bool,fun(bool,bool)) (X:fun(num,bool) (#min_num:fun(fun(num,bool),num) X:fun(num,bool)))) ((#<=:fun(num,fun(num,bool)) (#min_num:fun(fun(num,bool),num) X:fun(num,bool))) c:num)))))))
      #|max_real =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#max_real:fun(real,fun(real,real)) x:real) y:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)) x:real) y:real))))))
      #|min_real =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#min_real:fun(real,fun(real,real)) x:real) y:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) x:real) y:real))))))
      #|deriv =  |- (#!:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#!:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#deriv:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#@:fun(fun(real,bool),real) (\d:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) d:real) x:real))))))))
      #|deriv2 =  |- (#!:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#deriv2:fun(fun(real,real),fun(real,real)) f:fun(real,real))) (#deriv:fun(fun(real,real),fun(real,real)) (#deriv:fun(fun(real,real),fun(real,real)) f:fun(real,real))))))
      #|square_le =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) x:real)) ((#real_mul:fun(real,fun(real,real)) y:real) y:real))))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))
      #|max_num_sequence =  |- (#!:fun(fun(fun(num,num),bool),bool) (\t:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(num,fun(num,bool)) (t:fun(num,num) m:num)) (#NUMERAL:fun(num,num) #_0:num)))))))) (#?:fun(fun(num,bool),bool) (\M:num. (#!:fun(fun(num,bool),bool) (\i:num. ((#<=:fun(num,fun(num,bool)) (t:fun(num,num) i:num)) M:num))))))))
      #|REAL_INV_LT =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. (#!:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) x:real)) y:real)) z:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))))))))))
      #|REAL_MUL_NN =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|ABS_SQUARE =  |- (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(real,bool),bool) (\u:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) u:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) t:real) t:real)) ((#real_mul:fun(real,fun(real,real)) u:real) u:real)))))))
      #|ABS_SQUARE_LE =  |- (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(real,bool),bool) (\u:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) u:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) t:real) t:real)) ((#real_mul:fun(real,fun(real,real)) u:real) u:real)))))))
      #|twopow_eps =  |- (#!:fun(fun(real,bool),bool) (\R:real. (#!:fun(fun(real,bool),bool) (\e:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) R:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) R:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num))))) e:real))))))))
      #|prod_EXISTS =  |- (#?:fun(fun(fun(prod(num,num),fun(fun(num,real),real)),bool),bool) (\prod:fun(prod(num,num),fun(fun(num,real),real)). ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) ((prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))))))
      #|prod_DEF =  |- ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))))
      #|prod =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))
      #|PROD_TWO =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\p:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num)) f:fun(num,real)))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,real)))))))))
      #|ABS_PROD =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real)))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num)))))))))))
      #|PROD_EQ =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) n:num) m:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) r:num)) (g:fun(num,real) r:num)))))) ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|PROD_POS =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) n:num))))) (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))
      #|PROD_POS_GEN =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) n:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))
      #|PROD_ABS =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\m:num. (#real_abs:fun(real,real) (f:fun(num,real) m:num)))))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\m:num. (#real_abs:fun(real,real) (f:fun(num,real) m:num)))))))))))
      #|PROD_ZERO =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\p:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) p:num) ((#+:fun(num,fun(num,num)) n:num) m:num))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) p:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|PROD_MUL =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num))))) ((#real_mul:fun(real,fun(real,real)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|PROD_CMUL =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(real,bool),bool) (\c:real. (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(num,real) n:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) c:real) n:num)) ((#prod:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))))
      #|IN_ELIM_THM' =  |- ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun(fun(bool,fun('A,bool)),bool),bool),bool) (\P:fun(fun(bool,fun('A,bool)),bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (P:fun(fun(bool,fun('A,bool)),bool) (#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A)))))) (P:fun(fun(bool,fun('A,bool)),bool) (\p:bool. (\t:'A. ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) x:'A) t:'A))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A) (p:fun('A,bool) y:'A)) y:'A))))))) (p:fun('A,bool) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun(fun(bool,fun('A,bool)),bool),bool),bool) (\P:fun(fun(bool,fun('A,bool)),bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (P:fun(fun(bool,fun('A,bool)),bool) (#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A)))) x:'A)) (P:fun(fun(bool,fun('A,bool)),bool) (\p:bool. (\t:'A. ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) x:'A) t:'A))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A) (p:fun('A,bool) y:'A)) y:'A))))) x:'A)) (p:fun('A,bool) x:'A))))))) (#!:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (\y:'A. (p:fun('A,bool) y:'A)))) (p:fun('A,bool) x:'A))))))))))
      #|SURJ_IMAGE =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) b:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) a:fun('A,bool))))))))))
      #|SURJ_FINITE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)))) (#FINITE:fun(fun('B,bool),bool) b:fun('B,bool)))))))))
      #|BIJ_INVERSE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (((#INJ:fun(fun('B,'A),fun(fun('B,bool),fun(fun('A,bool),bool))) g:fun('B,'A)) b:fun('B,bool)) a:fun('A,bool)))))))))))
      #|UNIONS_INTERS =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool))) V:fun(fun('A,bool),bool))))))))
      #|INTERS_SUBSET =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\X:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) A:fun('A,bool)) X:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) X:fun(fun('A,bool),bool))) A:fun('A,bool)))))))
      #|sub_union =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) X:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))
      #|IMAGE_SURJ =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) a:fun('A,bool)))))))
      #|SUBSET_PREIMAGE =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) Y:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) X:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) X:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) Y:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool)))))))))))))
      #|UNIONS_INTER =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) A:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool))) U:fun(fun('A,bool),bool))))))))
      #|UNIONS_SUBSET =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) A:fun('A,bool)) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) X:fun('A,bool)))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) X:fun('A,bool)))))))
      #|SUBSET_INTER =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) A:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) B:fun('A,bool))))))))))
      #|EMPTY_EXISTS =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) #EMPTY:fun('A,bool)))) (#?:fun(fun('A,bool),bool) (\u:'A. ((#IN:fun('A,fun(fun('A,bool),bool)) u:'A) X:fun('A,bool)))))))
      #|UNIONS_UNIONS =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) A:fun(fun('A,bool),bool)) B:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool))))))))
      #|UNIONS_IMAGE_UNIONS =  |- (#!:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\X:fun(fun(fun('A,bool),bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#UNIONS:fun(fun(fun(fun('A,bool),bool),bool),fun(fun('A,bool),bool)) X:fun(fun(fun('A,bool),bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun(fun(fun('A,bool),bool),fun('A,bool)),fun(fun(fun(fun('A,bool),bool),bool),fun(fun('A,bool),bool))) #UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool))) X:fun(fun(fun('A,bool),bool),bool))))))
      #|INTERS_SUBSET2 =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (A:fun(fun('A,bool),bool) x:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) X:fun('A,bool)))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))) X:fun('A,bool)))))))
      #|INTERS_EMPTY =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) #EMPTY:fun(fun('A,bool),bool))) #UNIV:fun('A,bool))
      #|preimage =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\Z:fun('B,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) dom:fun('A,bool)) f:fun('A,'B)) Z:fun('B,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%378:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%378:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) dom:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) Z:fun('B,bool)))) x:'A))))))))))))
      #|in_preimage =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(fun('B,bool),bool),bool) (\Z:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) dom:fun('A,bool)) f:fun('A,'B)) Z:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) dom:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) Z:fun('B,bool))))))))))))
      #|supp =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#supp:fun(fun('A,'B),fun('A,bool)) f:fun('A,'B))) (\x:'A. (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#CHOICE:fun(fun('B,bool),'B) #UNIV:fun('B,bool))))))))
      #|func =  |- (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#=:fun(fun(fun('A,'B),bool),fun(fun(fun('A,'B),bool),bool)) ((#func:fun(fun('A,bool),fun(fun('B,bool),fun(fun('A,'B),bool))) a:fun('A,bool)) b:fun('B,bool))) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) a:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) b:fun('B,bool)))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#supp:fun(fun('A,'B),fun('A,bool)) f:fun('A,'B))) a:fun('A,bool)))))))))
      #|reflexive =  |- (#!:fun(fun(fun('A,fun('A,bool)),bool),bool) (\f:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#reflexive:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool)))) (#!:fun(fun('A,bool),bool) (\x:'A. ((f:fun('A,fun('A,bool)) x:'A) x:'A))))))
      #|symmetric =  |- (#!:fun(fun(fun('A,fun('A,bool)),bool),bool) (\f:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#symmetric:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool)))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((f:fun('A,fun('A,bool)) x:'A) y:'A)) ((f:fun('A,fun('A,bool)) y:'A) x:'A)))))))))
      #|transitive =  |- (#!:fun(fun(fun('A,fun('A,bool)),bool),bool) (\f:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#transitive:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool)))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((f:fun('A,fun('A,bool)) x:'A) y:'A)) ((f:fun('A,fun('A,bool)) y:'A) z:'A))) ((f:fun('A,fun('A,bool)) x:'A) z:'A)))))))))))
      #|equivalence_relation =  |- (#!:fun(fun(fun('A,fun('A,bool)),bool),bool) (\f:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#equivalence_relation:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#reflexive:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#symmetric:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool)))) (#transitive:fun(fun('A,fun('A,bool)),bool) f:fun('A,fun('A,bool))))))))
      #|partition_DEF =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\SA:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#partition:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) A:fun('A,bool)) SA:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) SA:fun(fun('A,bool),bool))) A:fun('A,bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) a:fun('A,bool)) SA:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) b:fun('A,bool)) SA:fun(fun('A,bool),bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) a:fun('A,bool)) b:fun('A,bool))))))))))))))
      #|DIFF_DIFF2 =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) X:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) A:fun('A,bool)))) A:fun('A,bool)))))))
      #|GSPEC_THM =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) (P:fun('A,bool) x:'A))))))
      #|CARD_GE_REFL =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#>=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool))))
      #|FINITE_HAS_SIZE_LEMMA =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(num,bool),bool) (\n:num. ((#>=_c:fun(fun(num,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%379:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%379:num) ((#<:fun(num,fun(num,bool)) x:num) n:num)) x:num)))))) s:fun('A,bool)))))))
      #|NUM_COUNTABLE =  |- (#COUNTABLE:fun(fun(num,bool),bool) #UNIV:fun(num,bool))
      #|NUM2_COUNTABLE =  |- (#COUNTABLE:fun(fun(prod(num,num),bool),bool) (#GSPEC:fun(fun(prod(num,num),bool),fun(prod(num,num),bool)) (\GEN%PVAR%380:prod(num,num). (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. (((#SETSPEC:fun(prod(num,num),fun(bool,fun(prod(num,num),bool))) GEN%PVAR%380:prod(num,num)) #T:bool) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num)))))))))
      #|COUNTABLE_UNIONS =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) A:fun(fun('A,bool),bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) a:fun('A,bool)) A:fun(fun('A,bool),bool))) (#COUNTABLE:fun(fun('A,bool),bool) a:fun('A,bool))))))) (#COUNTABLE:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))))))
      #|COUNTABLE_IMAGE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) A:fun('A,bool))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) B:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool))))))) (#COUNTABLE:fun(fun('B,bool),bool) B:fun('B,bool)))))))
      #|COUNTABLE_CARD =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) A:fun('A,bool))) ((#>=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) A:fun('A,bool)) B:fun('B,bool)))) (#COUNTABLE:fun(fun('B,bool),bool) B:fun('B,bool)))))))
      #|COUNTABLE_NUMSEG =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#COUNTABLE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%381:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%381:num) ((#<:fun(num,fun(num,bool)) x:num) n:num)) x:num))))))))
      #|FINITE_COUNTABLE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) A:fun('A,bool))) (#COUNTABLE:fun(fun('A,bool),bool) A:fun('A,bool)))))
      #|num_infinite =  |- (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) #UNIV:fun(num,bool)))
      #|num_SEG_UNION =  |- (#!:fun(fun(num,bool),bool) (\i:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%384:num. (#?:fun(fun(num,bool),bool) (\u:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%384:num) ((#<:fun(num,fun(num,bool)) i:num) u:num)) u:num)))))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%385:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%385:num) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) m:num))))))) #UNIV:fun(num,bool))))
      #|num_above_infinite =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%388:num. (#?:fun(fun(num,bool),bool) (\u:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%388:num) ((#<:fun(num,fun(num,bool)) i:num) u:num)) u:num)))))))))
      #|INTER_FINITE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))
      #|num_above_finite =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(fun(num,bool),bool),bool) (\J:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) J:fun(num,bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%391:num. (#?:fun(fun(num,bool),bool) (\u:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%391:num) ((#<:fun(num,fun(num,bool)) i:num) u:num)) u:num)))))))) (#FINITE:fun(fun(num,bool),bool) J:fun(num,bool)))))))
      #|SUBSET_SUC =  |- (#!:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f:fun(num,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\i:num. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(num,fun('A,bool)) i:num)) (f:fun(num,fun('A,bool)) (#SUC:fun(num,num) i:num)))))) (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) j:num)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(num,fun('A,bool)) i:num)) (f:fun(num,fun('A,bool)) j:num))))))))))
      #|SUBSET_SUC2 =  |- (#!:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f:fun(num,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\i:num. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(num,fun('A,bool)) (#SUC:fun(num,num) i:num))) (f:fun(num,fun('A,bool)) i:num))))) (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) j:num)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(num,fun('A,bool)) j:num)) (f:fun(num,fun('A,bool)) i:num))))))))))
      #|INFINITE_PIGEONHOLE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\I:fun('A,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\B:fun(fun('B,bool),bool). (#!:fun(fun(fun('B,bool),bool),bool) (\C:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%397:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%397:'A) ((#/\:fun(bool,fun(bool,bool)) (I:fun('A,bool) i:'A)) (C:fun('B,bool) (f:fun('A,'B) i:'A)))) i:'A)))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('B,bool),bool),bool) B:fun(fun('B,bool),bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) C:fun('B,bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) B:fun(fun('B,bool),bool)))))) (#?:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) (B:fun(fun('B,bool),bool) b:fun('B,bool))) (#~:fun(bool,bool) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%398:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%398:'A) ((#/\:fun(bool,fun(bool,bool)) (I:fun('A,bool) i:'A)) (((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) C:fun('B,bool)) b:fun('B,bool)) (f:fun('A,'B) i:'A)))) i:'A)))))))))))))))))))
      #|real_FINITE =  |- (#!:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#?:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) a:real)))))))))
      #|UNIONS_DELETE =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool))))))
      #|SUPP =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#SUPP:fun(fun('A,'B),fun('A,bool)) f:fun('A,'B))) (\x:'A. (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#CHOICE:fun(fun('B,bool),'B) #UNIV:fun('B,bool))))))))
      #|FUN =  |- (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#=:fun(fun(fun('A,'B),bool),fun(fun(fun('A,'B),bool),bool)) ((#FUN:fun(fun('A,bool),fun(fun('B,bool),fun(fun('A,'B),bool))) a:fun('A,bool)) b:fun('B,bool))) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) a:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) b:fun('B,bool)))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#SUPP:fun(fun('A,'B),fun('A,bool)) f:fun('A,'B))) a:fun('A,bool)))))))))
      #|compose =  |- (#!:fun(fun(fun('?213386,'?213384),bool),bool) (\f:fun('?213386,'?213384). (#!:fun(fun(fun('?213387,'?213386),bool),bool) (\g:fun('?213387,'?213386). ((#=:fun(fun('?213387,'?213384),fun(fun('?213387,'?213384),bool)) ((#compose:fun(fun('?213386,'?213384),fun(fun('?213387,'?213386),fun('?213387,'?213384))) f:fun('?213386,'?213384)) g:fun('?213387,'?213386))) (\x:'?213387. (f:fun('?213386,'?213384) (g:fun('?213387,'?213386) x:'?213387))))))))
      #|COMP_ASSOC =  |- (#!:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#!:fun(fun(fun(num,num),bool),bool) (\g:fun(num,num). (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#=:fun(fun(num,num),fun(fun(num,num),bool)) ((#compose:fun(fun(num,num),fun(fun(num,num),fun(num,num))) f:fun(num,num)) ((#compose:fun(fun(num,num),fun(fun(num,num),fun(num,num))) g:fun(num,num)) h:fun(num,num)))) ((#compose:fun(fun(num,num),fun(fun(num,num),fun(num,num))) ((#compose:fun(fun(num,num),fun(fun(num,num),fun(num,num))) f:fun(num,num)) g:fun(num,num))) h:fun(num,num)))))))))
      #|COMP_INJ =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#!:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) (((#INJ:fun(fun('B,'C),fun(fun('B,bool),fun(fun('C,bool),bool))) g:fun('B,'C)) t:fun('B,bool)) u:fun('C,bool)))) (((#INJ:fun(fun('A,'C),fun(fun('A,bool),fun(fun('C,bool),bool))) ((#compose:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))) s:fun('A,bool)) u:fun('C,bool)))))))))))))
      #|COMP_SURJ =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#!:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) (((#SURJ:fun(fun('B,'C),fun(fun('B,bool),fun(fun('C,bool),bool))) g:fun('B,'C)) t:fun('B,bool)) u:fun('C,bool)))) (((#SURJ:fun(fun('A,'C),fun(fun('A,bool),fun(fun('C,bool),bool))) ((#compose:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))) s:fun('A,bool)) u:fun('C,bool)))))))))))))
      #|COMP_BIJ =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#!:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#!:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) (((#BIJ:fun(fun('B,'C),fun(fun('B,bool),fun(fun('C,bool),bool))) g:fun('B,'C)) t:fun('B,bool)) u:fun('C,bool)))) (((#BIJ:fun(fun('A,'C),fun(fun('A,bool),fun(fun('C,bool),bool))) ((#compose:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))) s:fun('A,bool)) u:fun('C,bool)))))))))))))
      #|INVERSE_FN =  |- (#?:fun(fun(fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))),bool),bool) (\INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#INJ:fun(fun('B,'A),fun(fun('B,bool),fun(fun('A,bool),bool))) (((INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) b:fun('B,bool)) a:fun('A,bool))) (#!:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) b:fun('B,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) ((((INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)) x:'B))) x:'B))))))))))))))
      #|INVERSE_DEF =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#INJ:fun(fun('B,'A),fun(fun('B,bool),fun(fun('A,bool),bool))) (((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) b:fun('B,bool)) a:fun('A,bool))) (#!:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) b:fun('B,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) ((((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)) x:'B))) x:'B))))))))))))
      #|INVERSE_BIJ =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) (((#BIJ:fun(fun('B,'A),fun(fun('B,bool),fun(fun('A,bool),bool))) (((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) b:fun('B,bool)) a:fun('A,bool)))))))))
      #|INVERSE_XY =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) a:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) b:fun('B,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) ((((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)) y:'B)) x:'A)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))))))))
      #|FINITE_BIJ =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)))) (#FINITE:fun(fun('B,bool),bool) b:fun('B,bool)))))))))
      #|FINITE_INJ =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) b:fun('B,bool))) (((#INJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)))) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool)))))))))
      #|FINITE_BIJ2 =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) b:fun('B,bool))) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)))) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool)))))))))
      #|BIJ_CARD =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) a:fun('A,bool)) b:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))) (#CARD:fun(fun('B,bool),num) b:fun('B,bool))))))))))
      #|PAIR_LEMMA =  |- (#!:fun(fun(prod(num,num),bool),bool) (\x:prod(num,num). (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(num,bool),bool) (\j:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#FST:fun(prod(num,num),num) x:prod(num,num))) i:num)) ((#=:fun(num,fun(num,bool)) (#SND:fun(prod(num,num),num) x:prod(num,num))) j:num))) ((#=:fun(prod(num,num),fun(prod(num,num),bool)) x:prod(num,num)) ((#,:fun(num,fun(num,prod(num,num))) i:num) j:num)))))))))
      #|CARD_SING =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#SING:fun(fun('A,bool),bool) u:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) u:fun('A,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|FINITE_SING =  |- (#!:fun(fun('A,bool),bool) (\x:'A. (#FINITE:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool)))))
      #|NUM_INTRO =  |- (#!:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#!:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun('A,bool),bool) (\g:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) g:'A)) n:num)) (P:fun('A,bool) g:'A))))))) (#!:fun(fun('A,bool),bool) (\g:'A. (P:fun('A,bool) g:'A))))))))
      #|DOMAIN_EMPTY =  |- (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). ((#=:fun(fun(fun('A,'B),bool),fun(fun(fun('A,'B),bool),bool)) ((#FUN:fun(fun('A,bool),fun(fun('B,bool),fun(fun('A,'B),bool))) #EMPTY:fun('A,bool)) b:fun('B,bool))) ((#INSERT:fun(fun('A,'B),fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool))) (\u:'A. (#CHOICE:fun(fun('B,bool),'B) #UNIV:fun('B,bool)))) #EMPTY:fun(fun('A,'B),bool)))))
      #|DOMAIN_INSERT =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) s:'A) a:fun('A,bool)))) (#?:fun(fun(fun(fun('A,'B),prod(fun('A,'B),'B)),bool),bool) (\F:fun(fun('A,'B),prod(fun('A,'B),'B)). (((#BIJ:fun(fun(fun('A,'B),prod(fun('A,'B),'B)),fun(fun(fun('A,'B),bool),fun(fun(prod(fun('A,'B),'B),bool),bool))) F:fun(fun('A,'B),prod(fun('A,'B),'B))) ((#FUN:fun(fun('A,bool),fun(fun('B,bool),fun(fun('A,'B),bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) s:'A) a:fun('A,bool))) b:fun('B,bool))) (#GSPEC:fun(fun(prod(fun('A,'B),'B),bool),fun(prod(fun('A,'B),'B),bool)) (\GEN%PVAR%401:prod(fun('A,'B),'B). (#?:fun(fun(fun('A,'B),bool),bool) (\u:fun('A,'B). (#?:fun(fun('B,bool),bool) (\v:'B. (((#SETSPEC:fun(prod(fun('A,'B),'B),fun(bool,fun(prod(fun('A,'B),'B),bool))) GEN%PVAR%401:prod(fun('A,'B),'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) u:fun('A,'B)) ((#FUN:fun(fun('A,bool),fun(fun('B,bool),fun(fun('A,'B),bool))) a:fun('A,bool)) b:fun('B,bool)))) ((#IN:fun('B,fun(fun('B,bool),bool)) v:'B) b:fun('B,bool)))) ((#,:fun(fun('A,'B),fun('B,prod(fun('A,'B),'B))) u:fun('A,'B)) v:'B))))))))))))))))))
      #|CARD_DELETE_CHOICE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) #EMPTY:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) (#SUC:fun(num,num) (#CARD:fun(fun('A,bool),num) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) a:fun('A,bool)) (#CHOICE:fun(fun('A,bool),'A) a:fun('A,bool)))))) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))))))
      #|FUN_SIZE =  |- (#!:fun(fun(fun('B,bool),bool),bool) (\b:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) b:fun('B,bool)))) ((#HAS_SIZE:fun(fun(fun('A,'B),bool),fun(num,bool)) ((#FUN:fun(fun('A,bool),fun(fun('B,bool),fun(fun('A,'B),bool))) a:fun('A,bool)) b:fun('B,bool))) ((#EXP:fun(num,fun(num,num)) (#CARD:fun(fun('B,bool),num) b:fun('B,bool))) (#CARD:fun(fun('A,bool),num) a:fun('A,bool)))))))))
      #|drop0 =  |- (#!:fun(fun(prod('A,'B),bool),bool) (\u:prod('A,'B). ((#=:fun('B,fun('B,bool)) (#drop0:fun(prod('A,'B),'B) u:prod('A,'B))) (#SND:fun(prod('A,'B),'B) u:prod('A,'B)))))
      #|drop1 =  |- (#!:fun(fun(prod('A,prod('B,'C)),bool),bool) (\u:prod('A,prod('B,'C)). ((#=:fun('C,fun('C,bool)) (#drop1:fun(prod('A,prod('B,'C)),'C) u:prod('A,prod('B,'C)))) (#SND:fun(prod('B,'C),'C) (#SND:fun(prod('A,prod('B,'C)),prod('B,'C)) u:prod('A,prod('B,'C)))))))
      #|drop2 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,'D))),bool),bool) (\u:prod('A,prod('B,prod('C,'D))). ((#=:fun('D,fun('D,bool)) (#drop2:fun(prod('A,prod('B,prod('C,'D))),'D) u:prod('A,prod('B,prod('C,'D))))) (#SND:fun(prod('C,'D),'D) (#SND:fun(prod('B,prod('C,'D)),prod('C,'D)) (#SND:fun(prod('A,prod('B,prod('C,'D))),prod('B,prod('C,'D))) u:prod('A,prod('B,prod('C,'D)))))))))
      #|drop3 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,prod('D,'E)))),bool),bool) (\u:prod('A,prod('B,prod('C,prod('D,'E)))). ((#=:fun('E,fun('E,bool)) (#drop3:fun(prod('A,prod('B,prod('C,prod('D,'E)))),'E) u:prod('A,prod('B,prod('C,prod('D,'E)))))) (#SND:fun(prod('D,'E),'E) (#SND:fun(prod('C,prod('D,'E)),prod('D,'E)) (#SND:fun(prod('B,prod('C,prod('D,'E))),prod('C,prod('D,'E))) (#SND:fun(prod('A,prod('B,prod('C,prod('D,'E)))),prod('B,prod('C,prod('D,'E)))) u:prod('A,prod('B,prod('C,prod('D,'E)))))))))))
      #|part0 =  |- (#!:fun(fun(prod('A,'B),bool),bool) (\u:prod('A,'B). ((#=:fun('A,fun('A,bool)) (#part0:fun(prod('A,'B),'A) u:prod('A,'B))) (#FST:fun(prod('A,'B),'A) u:prod('A,'B)))))
      #|part1 =  |- (#!:fun(fun(prod('A,prod('B,'C)),bool),bool) (\u:prod('A,prod('B,'C)). ((#=:fun('B,fun('B,bool)) (#part1:fun(prod('A,prod('B,'C)),'B) u:prod('A,prod('B,'C)))) (#FST:fun(prod('B,'C),'B) (#drop0:fun(prod('A,prod('B,'C)),prod('B,'C)) u:prod('A,prod('B,'C)))))))
      #|part2 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,'D))),bool),bool) (\u:prod('A,prod('B,prod('C,'D))). ((#=:fun('C,fun('C,bool)) (#part2:fun(prod('A,prod('B,prod('C,'D))),'C) u:prod('A,prod('B,prod('C,'D))))) (#FST:fun(prod('C,'D),'C) (#drop1:fun(prod('A,prod('B,prod('C,'D))),prod('C,'D)) u:prod('A,prod('B,prod('C,'D))))))))
      #|part3 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,prod('D,'E)))),bool),bool) (\u:prod('A,prod('B,prod('C,prod('D,'E)))). ((#=:fun('D,fun('D,bool)) (#part3:fun(prod('A,prod('B,prod('C,prod('D,'E)))),'D) u:prod('A,prod('B,prod('C,prod('D,'E)))))) (#FST:fun(prod('D,'E),'D) (#drop2:fun(prod('A,prod('B,prod('C,prod('D,'E)))),prod('D,'E)) u:prod('A,prod('B,prod('C,prod('D,'E)))))))))
      #|part4 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,prod('D,prod('E,'F))))),bool),bool) (\u:prod('A,prod('B,prod('C,prod('D,prod('E,'F))))). ((#=:fun('E,fun('E,bool)) (#part4:fun(prod('A,prod('B,prod('C,prod('D,prod('E,'F))))),'E) u:prod('A,prod('B,prod('C,prod('D,prod('E,'F))))))) (#FST:fun(prod('E,'F),'E) (#drop3:fun(prod('A,prod('B,prod('C,prod('D,prod('E,'F))))),prod('E,'F)) u:prod('A,prod('B,prod('C,prod('D,prod('E,'F))))))))))
      #|part5 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))),bool),bool) (\u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))). ((#=:fun('F,fun('F,bool)) (#part5:fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))),'F) u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))))) (#FST:fun(prod('F,'G),'F) (#SND:fun(prod('E,prod('F,'G)),prod('F,'G)) (#SND:fun(prod('D,prod('E,prod('F,'G))),prod('E,prod('F,'G))) (#SND:fun(prod('C,prod('D,prod('E,prod('F,'G)))),prod('D,prod('E,prod('F,'G)))) (#SND:fun(prod('B,prod('C,prod('D,prod('E,prod('F,'G))))),prod('C,prod('D,prod('E,prod('F,'G))))) (#SND:fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))),prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))) u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,'G)))))))))))))))
      #|part6 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H))))))),bool),bool) (\u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H))))))). ((#=:fun('G,fun('G,bool)) (#part6:fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H))))))),'G) u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H))))))))) (#FST:fun(prod('G,'H),'G) (#SND:fun(prod('F,prod('G,'H)),prod('G,'H)) (#SND:fun(prod('E,prod('F,prod('G,'H))),prod('F,prod('G,'H))) (#SND:fun(prod('D,prod('E,prod('F,prod('G,'H)))),prod('E,prod('F,prod('G,'H)))) (#SND:fun(prod('C,prod('D,prod('E,prod('F,prod('G,'H))))),prod('D,prod('E,prod('F,prod('G,'H))))) (#SND:fun(prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H)))))),prod('C,prod('D,prod('E,prod('F,prod('G,'H)))))) (#SND:fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H))))))),prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H))))))) u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,'H)))))))))))))))))
      #|part7 =  |- (#!:fun(fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))),bool),bool) (\u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))). ((#=:fun('H,fun('H,bool)) (#part7:fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))),'H) u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))))) (#FST:fun(prod('H,'I),'H) (#SND:fun(prod('G,prod('H,'I)),prod('H,'I)) (#SND:fun(prod('F,prod('G,prod('H,'I))),prod('G,prod('H,'I))) (#SND:fun(prod('E,prod('F,prod('G,prod('H,'I)))),prod('F,prod('G,prod('H,'I)))) (#SND:fun(prod('D,prod('E,prod('F,prod('G,prod('H,'I))))),prod('E,prod('F,prod('G,prod('H,'I))))) (#SND:fun(prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))),prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))) (#SND:fun(prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I))))))),prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I))))))) (#SND:fun(prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))),prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))) u:prod('A,prod('B,prod('C,prod('D,prod('E,prod('F,prod('G,prod('H,'I)))))))))))))))))))
      #|euclid_scale =  |- (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) f:fun(num,real))) (\i:num. ((#real_mul:fun(real,fun(real,real)) t:real) (f:fun(num,real) i:num))))))))
      #|euclid_neg =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))) (\i:num. (#real_neg:fun(real,real) (f:fun(num,real) i:num))))))
      #|euclid_plus =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) (\i:num. ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))))
      #|euclid =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\v:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) v:fun(num,real))) (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(real,fun(real,bool)) (v:fun(num,real) m:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) v:fun(num,real))) (#?:fun(fun(num,bool),bool) (\n:num. ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) v:fun(num,real)))))))
      #|euclid_minus =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) (\i:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))))
      #|euclid0 =  |- ((#=:fun(fun(num,real),fun(fun(num,real),bool)) #euclid'euclid0:fun(num,real)) (\i:num. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))
      #|coord =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\i:num. ((#=:fun(real,fun(real,bool)) ((#euclid'coord:fun(num,fun(fun(num,real),real)) i:num) f:fun(num,real))) (f:fun(num,real) i:num))))))
      #|dot =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#LET:fun(fun(num,real),fun(num,real)) (\n:num. (#LET_END:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))) (#min_num:fun(fun(num,bool),num) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) m:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) m:num) g:fun(num,real)))))))))))
      #|norm =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) (#euclid'norm:fun(fun(num,real),real) f:fun(num,real))) (#sqrt:fun(real,real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real))))))
      #|d_euclid =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) (#euclid'norm:fun(fun(num,real),real) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))
      #|sum_vector_EXISTS =  |- (#?:fun(fun(fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))),bool),bool) (\sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))). ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,fun(num,real)))) (\n:num. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))) (#!:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,fun(num,real)))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,fun(num,real)))) (f:fun(num,fun(num,real)) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))))))
      #|sum_vector =  |- ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,fun(num,real)))) (\n:num. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))) (#!:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,fun(num,real)))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,fun(num,real)))) (f:fun(num,fun(num,real)) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))))
      #|mk_segment =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_segment:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) x:fun(num,real)) y:fun(num,real))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%404:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\u:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%404:fun(num,real)) (#?:fun(fun(real,bool),bool) (\a:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) u:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) a:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:real)) y:fun(num,real))))))))) u:fun(num,real)))))))))))
      #|mk_open_segment =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_open_segment:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) x:fun(num,real)) y:fun(num,real))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%405:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\u:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%405:fun(num,real)) (#?:fun(fun(real,bool),bool) (\a:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) u:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) a:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:real)) y:fun(num,real))))))))) u:fun(num,real)))))))))))
      #|convex =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'convex:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) x:fun(num,real))) (S:fun(fun(num,real),bool) y:fun(num,real)))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_segment:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) x:fun(num,real)) y:fun(num,real))) S:fun(fun(num,real),bool))))))))))
      #|convex_hull =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'convex_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) S:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%406:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\u:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%406:fun(num,real)) (#?:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#?:fun(fun(fun(num,real),bool),bool) (\alpha:fun(num,real). (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (S:fun(fun(num,real),bool) (f:fun(num,fun(num,real)) n:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) alpha:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (alpha:fun(num,real) n:num)))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) u:fun(num,real)) ((#sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\n:num. ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) (alpha:fun(num,real) n:num)) (f:fun(num,fun(num,real)) n:num))))))))))))))) u:fun(num,real)))))))))
      #|affine_hull =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'affine_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) S:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%407:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\u:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%407:fun(num,real)) (#?:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#?:fun(fun(fun(num,real),bool),bool) (\alpha:fun(num,real). (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (S:fun(fun(num,real),bool) (f:fun(num,fun(num,real)) n:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) alpha:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) u:fun(num,real)) ((#sum_vector:fun(prod(num,num),fun(fun(num,fun(num,real)),fun(num,real))) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\n:num. ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) (alpha:fun(num,real) n:num)) (f:fun(num,fun(num,real)) n:num)))))))))))))) u:fun(num,real)))))))))
      #|mk_line =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_line:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) x:fun(num,real)) y:fun(num,real))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%408:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%408:fun(num,real)) (#?:fun(fun(real,bool),bool) (\t:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) z:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) y:fun(num,real))))))) z:fun(num,real)))))))))))
      #|affine =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'affine:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) x:fun(num,real))) (S:fun(fun(num,real),bool) y:fun(num,real)))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_line:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) x:fun(num,real)) y:fun(num,real))) S:fun(fun(num,real),bool))))))))))
      #|affine_dim =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'affine_dim:fun(num,fun(fun(fun(num,real),bool),bool)) n:num) S:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(fun(fun(num,real),bool),bool),bool) (\T:fun(fun(num,real),bool). ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun(fun(num,real),bool),fun(num,bool)) T:fun(fun(num,real),bool)) (#SUC:fun(num,num) n:num))) ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'affine_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) T:fun(fun(num,real),bool))) (#euclid'affine_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) S:fun(fun(num,real),bool))))))) (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\T:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun(fun(num,real),bool),fun(num,bool)) T:fun(fun(num,real),bool)) (#SUC:fun(num,num) m:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))) (#~:fun(bool,bool) ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'affine_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) T:fun(fun(num,real),bool))) (#euclid'affine_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) S:fun(fun(num,real),bool)))))))))))))))
      #|collinear =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'collinear:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#euclid'affine_dim:fun(num,fun(fun(fun(num,real),bool),bool)) n:num) S:fun(fun(num,real),bool))) ((#<:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|coplanar =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'coplanar:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#euclid'affine_dim:fun(num,fun(fun(fun(num,real),bool),bool)) n:num) S:fun(fun(num,real),bool))) ((#<:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|line =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\L:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'line:fun(fun(fun(num,real),bool),bool) L:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'affine:fun(fun(fun(num,real),bool),bool) L:fun(fun(num,real),bool))) ((#euclid'affine_dim:fun(num,fun(fun(fun(num,real),bool),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) L:fun(fun(num,real),bool))))))
      #|plane =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\P:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'plane:fun(fun(fun(num,real),bool),bool) P:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'affine:fun(fun(fun(num,real),bool),bool) P:fun(fun(num,real),bool))) ((#euclid'affine_dim:fun(num,fun(fun(fun(num,real),bool),bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) P:fun(fun(num,real),bool))))))
      #|space =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\R:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'space:fun(fun(fun(num,real),bool),bool) R:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'affine:fun(fun(fun(num,real),bool),bool) R:fun(fun(num,real),bool))) ((#euclid'affine_dim:fun(num,fun(fun(fun(num,real),bool),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) R:fun(fun(num,real),bool))))))
      #|mk_open_half_set =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\L:fun(fun(num,real),bool). (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_open_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) L:fun(fun(num,real),bool)) S:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%409:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\u:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%409:fun(num,real)) (#?:fun(fun(real,bool),bool) (\t:real. (#?:fun(fun(fun(num,real),bool),bool) (\v:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) (L:fun(fun(num,real),bool) v:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) c:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) u:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) c:fun(num,real)) v:fun(num,real)))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) v:fun(num,real)))))))))))))) u:fun(num,real)))))))))))
      #|mk_half_set =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\L:fun(fun(num,real),bool). (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) L:fun(fun(num,real),bool)) S:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%410:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\u:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%410:fun(num,real)) (#?:fun(fun(real,bool),bool) (\t:real. (#?:fun(fun(fun(num,real),bool),bool) (\v:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) (L:fun(fun(num,real),bool) v:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) c:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) u:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) c:fun(num,real)) v:fun(num,real)))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) v:fun(num,real)))))))))))))) u:fun(num,real)))))))))))
      #|mk_angle =  |- (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'mk_angle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool)))) x:fun(num,real)) y:fun(num,real)) z:fun(num,real))) ((#UNION:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) x:fun(num,real)) #EMPTY:fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) y:fun(num,real)) #EMPTY:fun(fun(num,real),bool)))) ((#euclid'mk_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) x:fun(num,real)) #EMPTY:fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) z:fun(num,real)) #EMPTY:fun(fun(num,real),bool)))))))))))
      #|mk_signed_angle =  |- (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#=:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),bool)),fun(prod(fun(fun(num,real),bool),fun(fun(num,real),bool)),bool)) (((#euclid'mk_signed_angle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),prod(fun(fun(num,real),bool),fun(fun(num,real),bool))))) x:fun(num,real)) y:fun(num,real)) z:fun(num,real))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),prod(fun(fun(num,real),bool),fun(fun(num,real),bool)))) ((#euclid'mk_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) x:fun(num,real)) #EMPTY:fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) y:fun(num,real)) #EMPTY:fun(fun(num,real),bool)))) ((#euclid'mk_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) x:fun(num,real)) #EMPTY:fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) z:fun(num,real)) #EMPTY:fun(fun(num,real),bool)))))))))))
      #|mk_convex_cone =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v:fun(num,real). (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_convex_cone:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) v:fun(num,real)) S:fun(fun(num,real),bool))) ((#euclid'mk_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) v:fun(num,real)) #EMPTY:fun(fun(num,real),bool))) (#euclid'convex_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) S:fun(fun(num,real),bool))))))))
      #|packing =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'packing:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) y:fun(num,real))) ((#real_lt:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) x:fun(num,real)) y:fun(num,real))))))))))
      #|saturated_packing =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'saturated_packing:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'packing:fun(fun(fun(num,real),bool),bool) S:fun(fun(num,real),bool))) (#!:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'affine_hull:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) S:fun(fun(num,real),bool)) z:fun(num,real))) (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun(num,real),bool) x:fun(num,real))) ((#real_lt:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) z:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))
      #|cross_product3 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v2:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v1:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'cross_product3:fun(fun(num,real),fun(fun(num,real),fun(num,real))) v1:fun(num,real)) v2:fun(num,real))) ((((#LET:fun(fun(real,fun(real,fun(real,fun(num,real)))),fun(real,fun(real,fun(real,fun(num,real))))) (\x1:real. (\x2:real. (\x3:real. (#LET_END:fun(fun(num,real),fun(num,real)) ((((#LET:fun(fun(real,fun(real,fun(real,fun(num,real)))),fun(real,fun(real,fun(real,fun(num,real))))) (\y1:real. (\y2:real. (\y3:real. (#LET_END:fun(fun(num,real),fun(num,real)) (\k:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x2:real) y3:real)) ((#real_mul:fun(real,fun(real,real)) x3:real) y2:real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x3:real) y1:real)) ((#real_mul:fun(real,fun(real,real)) x1:real) y3:real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x1:real) y2:real)) ((#real_mul:fun(real,fun(real,real)) x2:real) y1:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))) (v2:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (v2:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (v2:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (v1:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (v1:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (v1:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|triple_product =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v1:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v2:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v3:fun(num,real). ((#=:fun(real,fun(real,bool)) (((#euclid'triple_product:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),real))) v1:fun(num,real)) v2:fun(num,real)) v3:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) v1:fun(num,real)) ((#euclid'cross_product3:fun(fun(num,real),fun(fun(num,real),fun(num,real))) v2:fun(num,real)) v3:fun(num,real))))))))))
      #|mk_triangle =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v2:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v3:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v1:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'mk_triangle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool)))) v1:fun(num,real)) v2:fun(num,real)) v3:fun(num,real))) ((#UNION:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_segment:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) v1:fun(num,real)) v2:fun(num,real))) ((#UNION:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_segment:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) v2:fun(num,real)) v3:fun(num,real))) ((#euclid'mk_segment:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) v3:fun(num,real)) v1:fun(num,real)))))))))))
      #|mk_interior_triangle =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v3:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v1:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v2:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'mk_interior_triangle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool)))) v1:fun(num,real)) v2:fun(num,real)) v3:fun(num,real))) ((#INTER:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_open_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_line:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) v1:fun(num,real)) v2:fun(num,real))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) v3:fun(num,real)) #EMPTY:fun(fun(num,real),bool)))) ((#INTER:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_open_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_line:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) v2:fun(num,real)) v3:fun(num,real))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) v1:fun(num,real)) #EMPTY:fun(fun(num,real),bool)))) ((#euclid'mk_open_half_set:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) ((#euclid'mk_line:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) v3:fun(num,real)) v1:fun(num,real))) ((#INSERT:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) v2:fun(num,real)) #EMPTY:fun(fun(num,real),bool))))))))))))
      #|mk_triangular_region =  |- (#!:fun(fun(fun(num,real),bool),bool) (\v1:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v2:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\v3:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'mk_triangular_region:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool)))) v1:fun(num,real)) v2:fun(num,real)) v3:fun(num,real))) ((#UNION:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) (((#euclid'mk_triangle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool)))) v1:fun(num,real)) v2:fun(num,real)) v3:fun(num,real))) (((#euclid'mk_interior_triangle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool)))) v1:fun(num,real)) v2:fun(num,real)) v3:fun(num,real))))))))))
      #|metric_space =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) (X:fun('A,bool) z:'A)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((d:fun('A,fun('A,real)) x:'A) y:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((d:fun('A,fun('A,real)) x:'A) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((d:fun('A,fun('A,real)) y:'A) x:'A))) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) z:'A)) ((#real_add:fun(real,fun(real,real)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((d:fun('A,fun('A,real)) y:'A) z:'A))))))))))))))))))
      #|set_translate =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\X:fun(fun(num,real),bool). (#!:fun(fun(fun(num,real),bool),bool) (\v:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'set_translate:fun(fun(num,real),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) v:fun(num,real)) X:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%411:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%411:fun(num,real)) (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) (X:fun(fun(num,real),bool) x:fun(num,real))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) z:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) v:fun(num,real)) x:fun(num,real))))))) z:fun(num,real)))))))))))
      #|set_scale =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\X:fun(fun(num,real),bool). (#!:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'set_scale:fun(real,fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) r:real) X:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%412:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%412:fun(num,real)) (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) (X:fun(fun(num,real),bool) x:fun(num,real))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) z:fun(num,real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) x:fun(num,real))))))) z:fun(num,real)))))))))))
      #|mk_rectangle =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\b:fun(num,real). ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#euclid'mk_rectangle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) a:fun(num,real)) b:fun(num,real))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%413:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%413:fun(num,real)) (#!:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (a:fun(num,real) i:num)) (z:fun(num,real) i:num))) ((#real_lt:fun(real,fun(real,bool)) (z:fun(num,real) i:num)) (b:fun(num,real) i:num)))))) z:fun(num,real)))))))))))
      #|one_vec =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#euclid'one_vec:fun(num,fun(num,real)) n:num)) (\i:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) i:num) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|mk_cube =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,int),bool),bool) (\v:fun(num,int). (#!:fun(fun(num,bool),bool) (\k:num. ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'mk_cube:fun(num,fun(num,fun(fun(num,int),fun(fun(num,real),bool)))) n:num) k:num) v:fun(num,int))) ((#LET:fun(fun(real,fun(fun(num,real),bool)),fun(real,fun(fun(num,real),bool))) (\r:real. (#LET_END:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) ((#LET:fun(fun(fun(num,real),fun(fun(num,real),bool)),fun(fun(num,real),fun(fun(num,real),bool))) (\vv:fun(num,real). (#LET_END:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) ((#euclid'mk_rectangle:fun(fun(num,real),fun(fun(num,real),fun(fun(num,real),bool))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) vv:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) vv:fun(num,real)) (#euclid'one_vec:fun(num,fun(num,real)) n:num))))))) (\i:num. (#real_of_int:fun(int,real) (v:fun(num,int) i:num))))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) k:num)))))))))))
      #|inner_cube =  |- (#!:fun(fun(num,bool),bool) (\k:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(fun(num,int),bool),fun(fun(fun(num,int),bool),bool)) (((#euclid'inner_cube:fun(num,fun(num,fun(fun(fun(num,real),bool),fun(fun(num,int),bool)))) n:num) k:num) A:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,int),bool),fun(fun(num,int),bool)) (\GEN%PVAR%414:fun(num,int). (#?:fun(fun(fun(num,int),bool),bool) (\v:fun(num,int). (((#SETSPEC:fun(fun(num,int),fun(bool,fun(fun(num,int),bool))) GEN%PVAR%414:fun(num,int)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'mk_cube:fun(num,fun(num,fun(fun(num,int),fun(fun(num,real),bool)))) n:num) k:num) v:fun(num,int))) A:fun(fun(num,real),bool))) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) i:num)) ((#=:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) #_0:num))) (v:fun(num,int) i:num))))))) v:fun(num,int)))))))))))))
      #|outer_cube =  |- (#!:fun(fun(num,bool),bool) (\k:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(fun(num,int),bool),fun(fun(fun(num,int),bool),bool)) (((#euclid'outer_cube:fun(num,fun(num,fun(fun(fun(num,real),bool),fun(fun(num,int),bool)))) n:num) k:num) A:fun(fun(num,real),bool))) (#GSPEC:fun(fun(fun(num,int),bool),fun(fun(num,int),bool)) (\GEN%PVAR%415:fun(num,int). (#?:fun(fun(fun(num,int),bool),bool) (\v:fun(num,int). (((#SETSPEC:fun(fun(num,int),fun(bool,fun(fun(num,int),bool))) GEN%PVAR%415:fun(num,int)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#INTER:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),fun(fun(num,real),bool))) (((#euclid'mk_cube:fun(num,fun(num,fun(fun(num,int),fun(fun(num,real),bool)))) n:num) k:num) v:fun(num,int))) A:fun(fun(num,real),bool))) #EMPTY:fun(fun(num,real),bool)))) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) i:num)) ((#=:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) #_0:num))) (v:fun(num,int) i:num))))))) v:fun(num,int)))))))))))))
      #|inner_vol =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\k:num. ((#=:fun(real,fun(real,bool)) (((#euclid'inner_vol:fun(num,fun(num,fun(fun(fun(num,real),bool),real))) n:num) k:num) A:fun(fun(num,real),bool))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun(fun(num,int),bool),num) (((#euclid'inner_cube:fun(num,fun(num,fun(fun(fun(num,real),bool),fun(fun(num,int),bool)))) n:num) k:num) A:fun(fun(num,real),bool))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) ((#*:fun(num,fun(num,num)) n:num) k:num))))))))))))
      #|outer_vol =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\k:num. ((#=:fun(real,fun(real,bool)) (((#euclid'outer_vol:fun(num,fun(num,fun(fun(fun(num,real),bool),real))) n:num) k:num) A:fun(fun(num,real),bool))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun(fun(num,int),bool),num) (((#euclid'outer_cube:fun(num,fun(num,fun(fun(fun(num,real),bool),fun(fun(num,int),bool)))) n:num) k:num) A:fun(fun(num,real),bool))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) ((#*:fun(num,fun(num,num)) n:num) k:num))))))))))))
      #|euclid_bounded =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'euclid_bounded:fun(fun(fun(num,real),bool),bool) A:fun(fun(num,real),bool))) (#?:fun(fun(real,bool),bool) (\R:real. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) (A:fun(fun(num,real),bool) x:fun(num,real))) ((#real_lt:fun(real,fun(real,bool)) (x:fun(num,real) i:num)) R:real)))))))))))
      #|vol =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). ((#=:fun(real,fun(real,bool)) ((#euclid'vol:fun(num,fun(fun(fun(num,real),bool),real)) n:num) A:fun(fun(num,real),bool))) (#lim:fun(fun(num,real),real) (\k:num. (((#euclid'outer_vol:fun(num,fun(num,fun(fun(fun(num,real),bool),real))) n:num) k:num) A:fun(fun(num,real),bool)))))))))
      #|SER_APPROX1 =  |- (#!:fun(fun(real,bool),bool) (\s:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) s:real)) (#summable:fun(fun(num,real),bool) g:fun(num,real)))) (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num)))) (g:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num)))))) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) s:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) k:num)) f:fun(num,real)))) (#suminf:fun(fun(num,real),real) (\n:num. (g:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num)))))))))))))))
      #|SER_APPROX =  |- (#!:fun(fun(real,bool),bool) (\s:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) s:real)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) n:num))) (g:fun(num,real) n:num))))) (#summable:fun(fun(num,real),bool) g:fun(num,real))))) (#!:fun(fun(num,bool),bool) (\k:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) s:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) k:num)) f:fun(num,real))))) (#suminf:fun(fun(num,real),real) (\n:num. (g:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num))))))))))))))
      #|PI_EST =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))
      #|pi_fun =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#trig'pi_fun:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) n:num))) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|pi_bound_fun =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#trig'pi_bound_fun:fun(num,real) n:num)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) n:num)))))))
      #|PI_EST2 =  |- (#!:fun(fun(num,bool),bool) (\k:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#trig'pi_fun:fun(num,real) k:num))) (#trig'pi_bound_fun:fun(num,real) k:num))))
      #|GP16 =  |- (#!:fun(fun(num,bool),bool) (\k:num. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) k:num))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) n:num))))) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) k:num))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|GP16a =  |- (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) k:num)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. (#trig'pi_bound_fun:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num)))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) k:num))))))
      #|PI_SER =  |- (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) k:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) #pi:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) k:num)) #trig'pi_fun:fun(num,real))))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) k:num))))))
      #|inv_twopow =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) n:num))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = trig'pi_bound_fun trig'pi_fun euclid'vol euclid'euclid_bounded euclid'outer_vol euclid'inner_vol euclid'outer_cube euclid'inner_cube euclid'mk_cube euclid'one_vec euclid'mk_rectangle euclid'set_scale euclid'set_translate euclid'metric_space euclid'mk_triangular_region euclid'mk_interior_triangle euclid'mk_triangle euclid'triple_product euclid'cross_product3 euclid'saturated_packing euclid'packing euclid'mk_convex_cone euclid'mk_signed_angle euclid'mk_angle euclid'mk_half_set euclid'mk_open_half_set euclid'space euclid'plane euclid'line euclid'coplanar euclid'collinear euclid'affine_dim euclid'affine euclid'mk_line euclid'affine_hull euclid'convex_hull euclid'convex euclid'mk_open_segment euclid'mk_segment sum_vector euclid'd_euclid euclid'norm euclid'dot euclid'coord euclid'euclid0 euclid'euclid_minus euclid'euclidean euclid'euclid euclid'euclid_plus euclid'euclid_neg euclid'euclid_scale part7 part6 part5 part4 part3 part2 part1 part0 drop3 drop2 drop1 drop0 INV compose FUN SUPP partition equivalence_relation transitive symmetric reflexive func supp preimage prod deriv2 deriv min_real max_real min_num dirac_delta mark_term TAGB ssqrt interval float twopow nabs GCD DIVIDE integral integrable defint rsum fine gauge tdiv dsize division atn acs asn tan pi root ln cos sin exp diffs differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? ! ==> /\ T =
      #|definitions = 407
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?218030
      #|counter_genvar = _144446:bool
      #|
    ),
  )
}
