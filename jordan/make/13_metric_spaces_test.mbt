// Jordan/metric_spaces.ml in its directory's load order: the test block of
// jordan/metric_spaces/metric_spaces_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Jordan_metric_spaces_ref.expected).

///|
test "Jordan/metric_spaces matches Jordan/metric_spaces.ml" {
  @testkit.release_output()
  @metric_spaces.load()
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
      "Jordan/misc_defs_and_lemmas", "Jordan/metric_spaces",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Jordan/metric_spaces")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Q_ELIM_THM", () => sthm(@metric_spaces.q_elim_thm()))
  log.attempt("Q_ELIM_THM'", () => sthm(@metric_spaces.q_elim_thm_p()))
  log.attempt("Q_ELIM_THM''", () => sthm(@metric_spaces.q_elim_thm_p_p()))
  log.attempt("DIFF_SUBSET", () => sthm(@metric_spaces.diff_subset()))
  log.attempt("SUBSET_INTERS", () => sthm(@metric_spaces.subset_inters()))
  log.attempt("DIFF_INTER", () => sthm(@metric_spaces.diff_inter()))
  log.attempt("SUB_IMP_INTER", () => sthm(@metric_spaces.sub_imp_inter()))
  log.attempt("SUBSET_UNIONS_INSERT", () => {
    sthm(@metric_spaces.subset_unions_insert())
  })
  log.attempt("UNIONS_DELETE2", () => sthm(@metric_spaces.unions_delete2()))
  log.attempt("finite_subset", () => sthm(@metric_spaces.finite_subset()))
  log.attempt("inters_singleton", () => sthm(@metric_spaces.inters_singleton()))
  log.attempt("delete_empty", () => sthm(@metric_spaces.delete_empty()))
  log.attempt("inters_subset", () => sthm(@metric_spaces.inters_subset()))
  log.attempt("delete_inters", () => sthm(@metric_spaces.delete_inters()))
  log.attempt("EQ_EMPTY", () => sthm(@metric_spaces.eq_empty()))
  log.attempt("UNIONS_EQ_EMPTY", () => sthm(@metric_spaces.unions_eq_empty()))
  log.attempt("INTERS_EQ_EMPTY", () => sthm(@metric_spaces.inters_eq_empty()))
  log.attempt("CARD_SING_CONV", () => sthm(@metric_spaces.card_sing_conv()))
  log.attempt("countable_prod", () => sthm(@metric_spaces.countable_prod()))
  log.attempt("IMAGE_I", () => sthm(@metric_spaces.image_i()))
  log.attempt("EMPTY_NOT_EXISTS", () => sthm(@metric_spaces.empty_not_exists()))
  log.attempt("DIFF_SURJ", () => sthm(@metric_spaces.diff_surj()))
  log.attempt("union_subset", () => sthm(@metric_spaces.union_subset()))
  log.attempt("preimage_disjoint", () => {
    sthm(@metric_spaces.preimage_disjoint())
  })
  log.attempt("preimage_union", () => sthm(@metric_spaces.preimage_union()))
  log.attempt("subset_preimage", () => sthm(@metric_spaces.subset_preimage()))
  log.attempt("preimage_unions", () => sthm(@metric_spaces.preimage_unions()))
  log.attempt("preimage_subset", () => sthm(@metric_spaces.preimage_subset()))
  log.attempt("INTER_THM", () => sthm(@metric_spaces.inter_thm()))
  log.attempt("REAL_SUM_SQUARE_POS", () => {
    sthm(@metric_spaces.real_sum_square_pos())
  })
  log.attempt("twopow_pos", () => sthm(@metric_spaces.twopow_pos()))
  log.attempt("twopow_double", () => sthm(@metric_spaces.twopow_double()))
  log.attempt("min_finite", () => sthm(@metric_spaces.min_finite()))
  log.attempt("min_finite_delta", () => sthm(@metric_spaces.min_finite_delta()))
  log.attempt("union_closed_interval", () => {
    sthm(@metric_spaces.union_closed_interval())
  })
  log.attempt("real_half_LT", () => sthm(@metric_spaces.real_half_lt()))
  log.attempt("real_half_LE", () => sthm(@metric_spaces.real_half_le()))
  log.attempt("real_half_EL", () => sthm(@metric_spaces.real_half_el()))
  log.attempt("real_half_LLE", () => sthm(@metric_spaces.real_half_lle()))
  log.attempt("interval_finite", () => sthm(@metric_spaces.interval_finite()))
  log.attempt("euclid_add_closure", () => {
    sthm(@metric_spaces.euclid_add_closure())
  })
  log.attempt("euclid_scale_closure", () => {
    sthm(@metric_spaces.euclid_scale_closure())
  })
  log.attempt("euclid_neg_closure", () => {
    sthm(@metric_spaces.euclid_neg_closure())
  })
  log.attempt("euclid_sub_closure", () => {
    sthm(@metric_spaces.euclid_sub_closure())
  })
  log.attempt("neg_dim", () => sthm(@metric_spaces.neg_dim()))
  log.attempt("euclid_updim", () => sthm(@metric_spaces.euclid_updim()))
  log.attempt("euclidean_add_closure", () => {
    sthm(@metric_spaces.euclidean_add_closure())
  })
  log.attempt("euclidean_sub_closure", () => {
    sthm(@metric_spaces.euclidean_sub_closure())
  })
  log.attempt("euclidean_scale_closure", () => {
    sthm(@metric_spaces.euclidean_scale_closure())
  })
  log.attempt("euclidean_neg_closure", () => {
    sthm(@metric_spaces.euclidean_neg_closure())
  })
  log.attempt("euclid_add_comm", () => sthm(@metric_spaces.euclid_add_comm()))
  log.attempt("euclid_add_assoc", () => sthm(@metric_spaces.euclid_add_assoc()))
  log.attempt("euclid_lzero", () => sthm(@metric_spaces.euclid_lzero()))
  log.attempt("euclid_rzero", () => sthm(@metric_spaces.euclid_rzero()))
  log.attempt("euclid_ldistrib", () => sthm(@metric_spaces.euclid_ldistrib()))
  log.attempt("euclid_rdistrib", () => sthm(@metric_spaces.euclid_rdistrib()))
  log.attempt("euclid_scale_act", () => sthm(@metric_spaces.euclid_scale_act()))
  log.attempt("euclid_scale_one", () => sthm(@metric_spaces.euclid_scale_one()))
  log.attempt("euclid_neg_sum", () => sthm(@metric_spaces.euclid_neg_sum()))
  log.attempt("trivial_lin_combo", () => {
    sthm(@metric_spaces.trivial_lin_combo())
  })
  log.attempt("dot_euclid", () => sthm(@metric_spaces.dot_euclid()))
  log.attempt("dot_updim", () => sthm(@metric_spaces.dot_updim()))
  log.attempt("dot_nonneg", () => sthm(@metric_spaces.dot_nonneg()))
  log.attempt("dot_comm", () => sthm(@metric_spaces.dot_comm()))
  log.attempt("dot_neg", () => sthm(@metric_spaces.dot_neg()))
  log.attempt("dot_neg2", () => sthm(@metric_spaces.dot_neg2()))
  log.attempt("dot_scale", () => sthm(@metric_spaces.dot_scale()))
  log.attempt("dot_scale_euclidean", () => {
    sthm(@metric_spaces.dot_scale_euclidean())
  })
  log.attempt("dot_scale2", () => sthm(@metric_spaces.dot_scale2()))
  log.attempt("dot_scale2_euclidean", () => {
    sthm(@metric_spaces.dot_scale2_euclidean())
  })
  log.attempt("dot_linear", () => sthm(@metric_spaces.dot_linear()))
  log.attempt("dot_minus_linear", () => sthm(@metric_spaces.dot_minus_linear()))
  log.attempt("dot_linear_euclidean", () => {
    sthm(@metric_spaces.dot_linear_euclidean())
  })
  log.attempt("dot_minus_linear_euclidean", () => {
    sthm(@metric_spaces.dot_minus_linear_euclidean())
  })
  log.attempt("dot_linear2", () => sthm(@metric_spaces.dot_linear2()))
  log.attempt("dot_linear2_euclidean", () => {
    sthm(@metric_spaces.dot_linear2_euclidean())
  })
  log.attempt("dot_minus_linear2", () => {
    sthm(@metric_spaces.dot_minus_linear2())
  })
  log.attempt("dot_minus_linear2_euclidean", () => {
    sthm(@metric_spaces.dot_minus_linear2_euclidean())
  })
  log.attempt("dot_rzero", () => sthm(@metric_spaces.dot_rzero()))
  log.attempt("dot_lzero", () => sthm(@metric_spaces.dot_lzero()))
  log.attempt("dot_zero", () => sthm(@metric_spaces.dot_zero()))
  log.attempt("dot_zero_euclidean", () => {
    sthm(@metric_spaces.dot_zero_euclidean())
  })
  log.attempt("norm_nonneg", () => sthm(@metric_spaces.norm_nonneg()))
  log.attempt("norm_neg", () => sthm(@metric_spaces.norm_neg()))
  log.attempt("cauchy_schwartz", () => sthm(@metric_spaces.cauchy_schwartz()))
  log.attempt("norm_dot", () => sthm(@metric_spaces.norm_dot()))
  log.attempt("norm_triangle", () => sthm(@metric_spaces.norm_triangle()))
  log.attempt("metric_space_zero", () => {
    sthm(@metric_spaces.metric_space_zero())
  })
  log.attempt("metric_space_symm", () => {
    sthm(@metric_spaces.metric_space_symm())
  })
  log.attempt("metric_space_triangle", () => {
    sthm(@metric_spaces.metric_space_triangle())
  })
  log.attempt("metric_subspace", () => sthm(@metric_spaces.metric_subspace()))
  log.attempt("metric_euclidean", () => sthm(@metric_spaces.metric_euclidean()))
  log.attempt("metric_euclid", () => sthm(@metric_spaces.metric_euclid()))
  log.attempt("euclid1_abs", () => sthm(@metric_spaces.euclid1_abs()))
  log.attempt("coord_dirac", () => sthm(@metric_spaces.coord_dirac()))
  log.attempt("dirac_0", () => sthm(@metric_spaces.dirac_0()))
  log.attempt("euclid1_dirac", () => sthm(@metric_spaces.euclid1_dirac()))
  log.attempt("proj", () => sthm(@metric_spaces.proj()))
  log.attempt("proj_euclid1", () => sthm(@metric_spaces.proj_euclid1()))
  log.attempt("d_euclid_n", () => sthm(@metric_spaces.d_euclid_n()))
  log.attempt("norm_n", () => sthm(@metric_spaces.norm_n()))
  log.attempt("proj_d_euclid", () => sthm(@metric_spaces.proj_d_euclid()))
  log.attempt("d_euclid_pos", () => sthm(@metric_spaces.d_euclid_pos()))
  log.attempt("proj_contraction", () => sthm(@metric_spaces.proj_contraction()))
  log.attempt("euclid_dirac", () => sthm(@metric_spaces.euclid_dirac()))
  log.attempt("d_euclid_pow2", () => sthm(@metric_spaces.d_euclid_pow2()))
  log.attempt("D_EUCLID_BOUND", () => sthm(@metric_spaces.d_euclid_bound()))
  log.attempt("metric_translate", () => sthm(@metric_spaces.metric_translate()))
  log.attempt("metric_translate_LEFT", () => {
    sthm(@metric_spaces.metric_translate_left())
  })
  log.attempt("norm_scale", () => sthm(@metric_spaces.norm_scale()))
  log.attempt("norm_scale_vec", () => sthm(@metric_spaces.norm_scale_vec()))
  log.attempt("topology", () => sthm(@metric_spaces.topology()))
  log.attempt("open_DEF", () => sthm(@metric_spaces.open_def()))
  log.attempt("closed", () => sthm(@metric_spaces.closed()))
  log.attempt("closure", () => sthm(@metric_spaces.closure()))
  log.attempt("induced_top", () => sthm(@metric_spaces.induced_top()))
  log.attempt("open_ball", () => sthm(@metric_spaces.open_ball()))
  log.attempt("closed_ball", () => sthm(@metric_spaces.closed_ball()))
  log.attempt("open_balls", () => sthm(@metric_spaces.open_balls()))
  log.attempt("top_of_metric", () => sthm(@metric_spaces.top_of_metric()))
  log.attempt("open_EMPTY", () => sthm(@metric_spaces.open_empty()))
  log.attempt("open_closed", () => sthm(@metric_spaces.open_closed()))
  log.attempt("closed_UNIV", () => sthm(@metric_spaces.closed_univ()))
  log.attempt("top_univ", () => sthm(@metric_spaces.top_univ()))
  log.attempt("empty_closed", () => sthm(@metric_spaces.empty_closed()))
  log.attempt("closed_open", () => sthm(@metric_spaces.closed_open()))
  log.attempt("closed_inter", () => sthm(@metric_spaces.closed_inter()))
  log.attempt("open_nbd", () => sthm(@metric_spaces.open_nbd()))
  log.attempt("open_inters", () => sthm(@metric_spaces.open_inters()))
  log.attempt("top_unions", () => sthm(@metric_spaces.top_unions()))
  log.attempt("top_inter", () => sthm(@metric_spaces.top_inter()))
  log.attempt("open_ball_nonempty", () => {
    sthm(@metric_spaces.open_ball_nonempty())
  })
  log.attempt("open_ball_subset", () => sthm(@metric_spaces.open_ball_subset()))
  log.attempt("open_ball_subspace", () => {
    sthm(@metric_spaces.open_ball_subspace())
  })
  log.attempt("open_ball_empty", () => sthm(@metric_spaces.open_ball_empty()))
  log.attempt("open_ball_intersect", () => {
    sthm(@metric_spaces.open_ball_intersect())
  })
  log.attempt("open_ball_center", () => sthm(@metric_spaces.open_ball_center()))
  log.attempt("open_ball_nonempty_center", () => {
    sthm(@metric_spaces.open_ball_nonempty_center())
  })
  log.attempt("open_ball_neg_radius", () => {
    sthm(@metric_spaces.open_ball_neg_radius())
  })
  log.attempt("open_ball_nest", () => sthm(@metric_spaces.open_ball_nest()))
  log.attempt("open_ball_inter", () => sthm(@metric_spaces.open_ball_inter()))
  log.attempt("BALL_DIST", () => sthm(@metric_spaces.ball_dist()))
  log.attempt("BALL_DIST_CLOSED", () => sthm(@metric_spaces.ball_dist_closed()))
  log.attempt("open_ball_sub_closed", () => {
    sthm(@metric_spaces.open_ball_sub_closed())
  })
  log.attempt("ball_symm", () => sthm(@metric_spaces.ball_symm()))
  log.attempt("ball_subset_ball", () => sthm(@metric_spaces.ball_subset_ball()))
  log.attempt("top_of_metric_unions", () => {
    sthm(@metric_spaces.top_of_metric_unions())
  })
  log.attempt("top_of_metric_empty", () => {
    sthm(@metric_spaces.top_of_metric_empty())
  })
  log.attempt("top_of_metric_open", () => {
    sthm(@metric_spaces.top_of_metric_open())
  })
  log.attempt("top_of_metric_open_balls", () => {
    sthm(@metric_spaces.top_of_metric_open_balls())
  })
  log.attempt("open_ball_open", () => sthm(@metric_spaces.open_ball_open()))
  log.attempt("top_of_metric_nbd", () => {
    sthm(@metric_spaces.top_of_metric_nbd())
  })
  log.attempt("top_of_metric_inter", () => {
    sthm(@metric_spaces.top_of_metric_inter())
  })
  log.attempt("top_of_metric_union", () => {
    sthm(@metric_spaces.top_of_metric_union())
  })
  log.attempt("top_of_metric_top", () => {
    sthm(@metric_spaces.top_of_metric_top())
  })
  log.attempt("closed_ball_closed", () => {
    sthm(@metric_spaces.closed_ball_closed())
  })
  log.attempt("open_ball_nbd", () => sthm(@metric_spaces.open_ball_nbd()))
  log.attempt("closure_closed", () => sthm(@metric_spaces.closure_closed()))
  log.attempt("subset_closure", () => sthm(@metric_spaces.subset_closure()))
  log.attempt("closure_subset", () => sthm(@metric_spaces.closure_subset()))
  log.attempt("closure_self", () => sthm(@metric_spaces.closure_self()))
  log.attempt("closure_close", () => sthm(@metric_spaces.closure_close()))
  log.attempt("closure_open", () => sthm(@metric_spaces.closure_open()))
  log.attempt("image_top", () => sthm(@metric_spaces.image_top()))
  log.attempt("induced_top_support", () => {
    sthm(@metric_spaces.induced_top_support())
  })
  log.attempt("induced_top_top", () => sthm(@metric_spaces.induced_top_top()))
  log.attempt("induced_top_open", () => sthm(@metric_spaces.induced_top_open()))
  log.attempt("induced_trans", () => sthm(@metric_spaces.induced_trans()))
  log.attempt("induced_top_unions", () => {
    sthm(@metric_spaces.induced_top_unions())
  })
  log.attempt("gen", () => sthm(@metric_spaces.gen()))
  log.attempt("top_of_metric_gen", () => {
    sthm(@metric_spaces.top_of_metric_gen())
  })
  log.attempt("gen_subset", () => sthm(@metric_spaces.gen_subset()))
  log.attempt("gen_subspace", () => sthm(@metric_spaces.gen_subspace()))
  log.attempt("gen_induced", () => sthm(@metric_spaces.gen_induced()))
  log.attempt("top_of_metric_induced", () => {
    sthm(@metric_spaces.top_of_metric_induced())
  })
  log.attempt("continuous", () => sthm(@metric_spaces.continuous()))
  log.attempt("metric_continuous_pt", () => {
    sthm(@metric_spaces.metric_continuous_pt())
  })
  log.attempt("metric_continuous", () => {
    sthm(@metric_spaces.metric_continuous())
  })
  log.attempt("metric_continuous_pt_domain", () => {
    sthm(@metric_spaces.metric_continuous_pt_domain())
  })
  log.attempt("metric_continuous_continuous", () => {
    sthm(@metric_spaces.metric_continuous_continuous())
  })
  log.attempt("continuous_induced", () => {
    sthm(@metric_spaces.continuous_induced())
  })
  log.attempt("metric_cont", () => sthm(@metric_spaces.metric_cont()))
  log.attempt("continuous_sum", () => sthm(@metric_spaces.continuous_sum()))
  log.attempt("sequence", () => sthm(@metric_spaces.sequence()))
  log.attempt("converge", () => sthm(@metric_spaces.converge()))
  log.attempt("cauchy_seq", () => sthm(@metric_spaces.cauchy_seq()))
  log.attempt("complete", () => sthm(@metric_spaces.complete()))
  log.attempt("converge_cauchy", () => sthm(@metric_spaces.converge_cauchy()))
  log.attempt("cauchy_seq_cauchy", () => {
    sthm(@metric_spaces.cauchy_seq_cauchy())
  })
  log.attempt("complete_real", () => sthm(@metric_spaces.complete_real()))
  log.attempt("sequence_in", () => sthm(@metric_spaces.sequence_in()))
  log.attempt("proj_cauchy", () => sthm(@metric_spaces.proj_cauchy()))
  log.attempt("complete_euclid", () => sthm(@metric_spaces.complete_euclid()))
  log.attempt("subset_sequence", () => sthm(@metric_spaces.subset_sequence()))
  log.attempt("subset_cauchy", () => sthm(@metric_spaces.subset_cauchy()))
  log.attempt("complete_closed", () => sthm(@metric_spaces.complete_closed()))
  log.attempt("totally_bounded", () => sthm(@metric_spaces.totally_bounded()))
  log.attempt("totally_bounded_subset", () => {
    sthm(@metric_spaces.totally_bounded_subset())
  })
  log.attempt("integer_cube_finite", () => {
    sthm(@metric_spaces.integer_cube_finite())
  })
  log.attempt("FINITE_scaled_lattice", () => {
    sthm(@metric_spaces.finite_scaled_lattice())
  })
  log.attempt("totally_bounded_cube", () => {
    sthm(@metric_spaces.totally_bounded_cube())
  })
  log.attempt("center_FINITE", () => sthm(@metric_spaces.center_finite()))
  log.attempt("open_ball_dist", () => sthm(@metric_spaces.open_ball_dist()))
  log.attempt("totally_bounded_bounded", () => {
    sthm(@metric_spaces.totally_bounded_bounded())
  })
  log.attempt("subsequence_rec", () => sthm(@metric_spaces.subsequence_rec()))
  log.attempt("sequence_subseq", () => sthm(@metric_spaces.sequence_subseq()))
  log.attempt("cauchy_subseq", () => sthm(@metric_spaces.cauchy_subseq()))
  log.attempt("convergent_subseq", () => {
    sthm(@metric_spaces.convergent_subseq())
  })
  log.attempt("dense", () => sthm(@metric_spaces.dense()))
  log.attempt("hausdorff", () => sthm(@metric_spaces.hausdorff()))
  log.attempt("dense_subset", () => sthm(@metric_spaces.dense_subset()))
  log.attempt("dense_open", () => sthm(@metric_spaces.dense_open()))
  log.attempt("countable_dense", () => sthm(@metric_spaces.countable_dense()))
  log.attempt("metric_hausdorff", () => sthm(@metric_spaces.metric_hausdorff()))
  log.attempt("compact", () => sthm(@metric_spaces.compact()))
  log.attempt("closed_compact", () => sthm(@metric_spaces.closed_compact()))
  log.attempt("compact_closed", () => sthm(@metric_spaces.compact_closed()))
  log.attempt("compact_totally_bounded", () => {
    sthm(@metric_spaces.compact_totally_bounded())
  })
  log.attempt("finite_inters", () => sthm(@metric_spaces.finite_inters()))
  log.attempt("cauchy_subseq_sublemma", () => {
    sthm(@metric_spaces.cauchy_subseq_sublemma())
  })
  log.attempt("subseq_cauchy", () => sthm(@metric_spaces.subseq_cauchy()))
  log.attempt("compact_complete", () => sthm(@metric_spaces.compact_complete()))
  log.attempt("countable_cover", () => sthm(@metric_spaces.countable_cover()))
  log.attempt("complete_compact", () => sthm(@metric_spaces.complete_compact()))
  log.attempt("uniformly_continuous", () => {
    sthm(@metric_spaces.uniformly_continuous())
  })
  log.attempt("compact_uniformly_continuous", () => {
    sthm(@metric_spaces.compact_uniformly_continuous())
  })
  log.attempt("image_compact", () => sthm(@metric_spaces.image_compact()))
  log.attempt("metric_bounded", () => sthm(@metric_spaces.metric_bounded()))
  log.attempt("euclid_ball_cube", () => sthm(@metric_spaces.euclid_ball_cube()))
  log.attempt("totally_bounded_euclid", () => {
    sthm(@metric_spaces.totally_bounded_euclid())
  })
  log.attempt("induced_compact", () => sthm(@metric_spaces.induced_compact()))
  log.attempt("compact_euclid", () => sthm(@metric_spaces.compact_euclid()))
  log.attempt("neg_continuous", () => sthm(@metric_spaces.neg_continuous()))
  log.attempt("continuous_comp", () => sthm(@metric_spaces.continuous_comp()))
  log.attempt("compact_max", () => sthm(@metric_spaces.compact_max()))
  log.attempt("homeomorphism", () => sthm(@metric_spaces.homeomorphism()))
  log.attempt("INV_homeomorphism", () => {
    sthm(@metric_spaces.inv_homeomorphism())
  })
  log.attempt("bicont_homeomorphism", () => {
    sthm(@metric_spaces.bicont_homeomorphism())
  })
  log.attempt("open_and_closed", () => sthm(@metric_spaces.open_and_closed()))
  log.attempt("hausdorff_homeomorphsim", () => {
    sthm(@metric_spaces.hausdorff_homeomorphsim())
  })
  log.attempt("d_real", () => sthm(@metric_spaces.d_real()))
  log.attempt("metric_real", () => sthm(@metric_spaces.metric_real()))
  log.attempt("continuous_euclid1", () => {
    sthm(@metric_spaces.continuous_euclid1())
  })
  log.attempt("interval_closed_ball", () => {
    sthm(@metric_spaces.interval_closed_ball())
  })
  log.attempt("interval_euclid1_closed", () => {
    sthm(@metric_spaces.interval_euclid1_closed())
  })
  log.attempt("interval_euclid1_bounded", () => {
    sthm(@metric_spaces.interval_euclid1_bounded())
  })
  log.attempt("interval_euclid1_compact", () => {
    sthm(@metric_spaces.interval_euclid1_compact())
  })
  log.attempt("interval_image", () => sthm(@metric_spaces.interval_image()))
  log.attempt("interval_compact", () => sthm(@metric_spaces.interval_compact()))
  log.attempt("half_open", () => sthm(@metric_spaces.half_open()))
  log.attempt("half_open_above", () => sthm(@metric_spaces.half_open_above()))
  log.attempt("joinf", () => sthm(@metric_spaces.joinf()))
  log.attempt("joinf_cont", () => sthm(@metric_spaces.joinf_cont()))
  log.attempt("neg_cont", () => sthm(@metric_spaces.neg_cont()))
  log.attempt("add_cont", () => sthm(@metric_spaces.add_cont()))
  log.attempt("continuous_scale", () => sthm(@metric_spaces.continuous_scale()))
  log.attempt("continuous_lin_combo", () => {
    sthm(@metric_spaces.continuous_lin_combo())
  })
  log.attempt("connected", () => sthm(@metric_spaces.connected()))
  log.attempt("connected_unions", () => sthm(@metric_spaces.connected_unions()))
  log.attempt("component_DEF", () => sthm(@metric_spaces.component_def()))
  log.attempt("connected_sing", () => sthm(@metric_spaces.connected_sing()))
  log.attempt("component_refl", () => sthm(@metric_spaces.component_refl()))
  log.attempt("component_symm", () => sthm(@metric_spaces.component_symm()))
  log.attempt("component_trans", () => sthm(@metric_spaces.component_trans()))
  log.attempt("connect_real", () => sthm(@metric_spaces.connect_real()))
  log.attempt("connect_image", () => sthm(@metric_spaces.connect_image()))
  log.attempt("path", () => sthm(@metric_spaces.path()))
  log.attempt("const_continuous", () => sthm(@metric_spaces.const_continuous()))
  log.attempt("path_component", () => sthm(@metric_spaces.path_component()))
  log.attempt("path_refl", () => sthm(@metric_spaces.path_refl()))
  log.attempt("path_symm", () => sthm(@metric_spaces.path_symm()))
  log.attempt("path_symm_eq", () => sthm(@metric_spaces.path_symm_eq()))
  log.attempt("path_trans", () => sthm(@metric_spaces.path_trans()))
  log.attempt("loc_path_conn", () => sthm(@metric_spaces.loc_path_conn()))
  log.attempt("path_eq_conn", () => sthm(@metric_spaces.path_eq_conn()))
  log.attempt("open_ball_star", () => sthm(@metric_spaces.open_ball_star()))
  log.attempt("open_ball_path", () => sthm(@metric_spaces.open_ball_path()))
  log.attempt("path_domain", () => sthm(@metric_spaces.path_domain()))
  log.attempt("path_component_subspace", () => {
    sthm(@metric_spaces.path_component_subspace())
  })
  log.attempt("path_component_in", () => {
    sthm(@metric_spaces.path_component_in())
  })
  log.attempt("loc_path_conn_euclid", () => {
    sthm(@metric_spaces.loc_path_conn_euclid())
  })
  log.attempt("loc_path_euclid_cor", () => {
    sthm(@metric_spaces.loc_path_euclid_cor())
  })
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
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..solved at 16
      #|0..0..1..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..3..7..17..38..78..154..261..solved at 356
      #|0..0..0..3..8..20..47..80..solved at 95
      #|0..0..1..5..10..23..61..128..268..505..875..1615..solved at 2815
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..1..2..3..7..solved at 15
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..5..10..19..30..solved at 49
      #|0..0..1..5..11..solved at 20
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..0..2..solved at 6
      #|0..0..2..8..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..12..24..51..117..213..377..solved at 391
      #|0..0..4..13..27..57..135..247..440..solved at 482
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 8
      #|0..0..2..4..14..30..60..solved at 74
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..0..2..solved at 6
      #|0..0..2..8..solved at 12
      #|0..0..2..solved at 5
      #|0..0..1..3..5..11..23..40..73..133..211..337..solved at 532
      #|0..0..0..1..2..3..5..7..9..15..21..27..solved at 57
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..4..10..solved at 17
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..3..7..solved at 15
      #|0..0..2..4..solved at 8
      #|0..0..3..6..solved at 12
      #|0..0..2..4..solved at 8
      #|0..0..solved at 3
      #|0..0..6..12..solved at 19
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..solved at 5
      #|0..0..1..2..5..10..21..44..75..122..192..solved at 213
      #|0..0..1..2..5..10..22..42..74..solved at 88
      #|0..0..1..2..5..10..21..44..75..122..192..solved at 213
      #|0..0..1..3..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..22..33..46..61..solved at 70
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..22..33..46..61..solved at 70
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 9
      #|0..0..1..4..solved at 8
      #|0..0..1..2..8..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..8..19..solved at 27
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..5..9..15..23..31..solved at 44
      #|0..0..1..2..6..11..solved at 24
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..solved at 4
      #|0..0..1..3..8..21..44..solved at 74
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..39..63..solved at 84
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..5..solved at 9
      #|0..0..2..6..14..solved at 23
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..3..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 11
      #|0..0..1..3..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..22..solved at 36
      #|0..0..1..2..solved at 6
      #|0..0..3..6..16..33..59..106..167..solved at 219
      #|0..0..solved at 2
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
      #|0..0..3..6..17..36..65..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..2..4..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..23..36..56..solved at 80
      #|0..0..1..2..3..7..13..23..36..56..solved at 80
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..3..7..solved at 13
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..3..7..12..17..28..40..58..88..126..168..241..solved at 288
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..2..4..8..solved at 14
      #|0..0..2..6..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..12..17..28..solved at 39
      #|0..0..1..3..5..solved at 10
      #|0..0..0..2..solved at 6
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..1..3..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
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
      #|0..0..0..1..solved at 5
      #|0..0..0..1..solved at 5
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..22..solved at 38
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..2..6..solved at 15
      #|0..0..1..5..12..solved at 18
      #|0..0..0..1..4..10..solved at 18
      #|0..0..1..3..6..12..23..41..70..113..solved at 128
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..5..11..21..49..85..173..308..696..1268..3688..7095..solved at 7153
      #|0..0..solved at 2
      #|0..0..1..4..11..30..solved at 73
      #|0..0..1..4..11..30..solved at 73
      #|0..0..2..4..7..solved at 17
      #|0..0..1..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..7..15..solved at 27
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..solved at 15
      #|0..0..1..2..3..solved at 8
      #|0..0..0..2..5..9..14..19..25..32..39..46..57..68..79..solved at 97
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..6..14..solved at 21
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..5..10..solved at 15
      #|0..0..1..solved at 4
      #|0..0..1..4..8..12..16..22..solved at 31
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..7..14..27..47..73..solved at 90
      #|0..0..1..2..3..7..14..27..47..73..solved at 99
      #|0..0..1..2..3..7..solved at 13
      #|0..0..1..2..3..7..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..7..20..38..86..173..solved at 204
      #|0..0..4..8..21..54..110..solved at 143
      #|0..0..3..6..16..37..75..147..280..472..890..1619..2986..solved at 4351
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..23..36..55..76..108..142..190..solved at 304
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..5..12..solved at 45
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..5..12..solved at 18
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..5..12..solved at 18
      #|0..0..solved at 2
      #|0..0..1..3..7..solved at 12
      #|0..0..2..solved at 5
      #|0..0..1..solved at 7
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 15
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..7..solved at 11
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..2..5..11..22..solved at 30
      #|0..0..1..3..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..2..8..19..65..solved at 132
      #|0..0..1..2..8..19..65..solved at 120
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..3..5..10..solved at 18
      #|0..0..1..3..5..10..solved at 16
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..7..8..9..solved at 18
      #|0..0..1..solved at 4
      #|0..0..1..2..3..8..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
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
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..5..10..21..solved at 27
      #|0..0..1..solved at 5
      #|0..0..3..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..4..7..solved at 12
      #|0..0..solved at 2
      #|0..0..2..5..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
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
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..6..solved at 15
      #|0..0..1..2..6..solved at 15
      #|0..0..0..0..3..solved at 8
      #|0..0..2..6..11..solved at 21
      #|0..0..2..5..9..solved at 18
      #|0..0..1..3..6..solved at 11
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..5..9..solved at 15
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..8..solved at 13
      #|0..0..solved at 2
      #|0..0..1..5..solved at 12
      #|0..0..3..9..solved at 13
      #|0..0..2..solved at 5
      #|0..0..3..9..solved at 13
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..8..18..solved at 30
      #|0..0..2..5..8..18..solved at 29
      #|0..0..1..3..5..11..solved at 17
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..13..21..solved at 31
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
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..1..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..3..7..13..29..solved at 38
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..2..8..19..65..solved at 132
      #|0..0..1..2..8..19..65..solved at 120
      #|0..0..1..3..solved at 7
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
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
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
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..5..9..solved at 14
      #|0..0..2..5..solved at 9
      #|0..0..2..5..8..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..5..9..solved at 14
      #|0..0..2..5..solved at 9
      #|0..0..2..5..8..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..2..6..13..30..60..107..184..299..477..761..1152..1727..solved at 1941
      #|0..0..1..2..3..solved at 8
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
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..16..29..solved at 52
      #|0..0..1..2..3..7..14..23..45..71..109..164..229..323..478..solved at 609
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..9..solved at 15
      #|0..0..2..4..6..14..solved at 32
      #|0..0..2..4..8..16..solved at 35
      #|0..0..1..2..3..7..solved at 20
      #|0..0..1..2..solved at 6
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
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..8..16..28..43..solved at 54
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..solved at 2
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
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..solved at 2
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
      #|0..0..2..8..19..42..89..166..321..solved at 491
      #|0..0..2..7..15..33..67..120..233..solved at 333
      #|0..0..1..3..6..14..31..59..125..solved at 153
      #|0..0..2..6..11..solved at 21
      #|0..0..2..5..9..solved at 18
      #|0..0..1..3..6..solved at 11
      #|0..0..1..2..8..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..14..25..42..solved at 51
      #|0..0..1..2..3..7..solved at 14
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..5..12..solved at 18
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
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..4..8..14..solved at 19
      #|0..0..2..4..10..20..33..53..73..93..123..157..195..266..347..432..587..776..969..1231..1674..solved at 2134
      #|0..0..2..4..9..18..30..45..62..79..104..140..180..237..314..395..493..621..753..928..1169..solved at 1408
      #|0..0..1..2..solved at 10
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..16..24..32..solved at 41
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..17..26..35..solved at 49
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..16..24..32..solved at 41
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..17..26..35..solved at 49
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..24..33..44..solved at 69
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..3..6..solved at 12
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..6..12..24..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..12..25..48..solved at 76
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..9..solved at 14
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..10..22..solved at 28
      #|0..0..2..5..10..22..solved at 30
      #|0..0..1..5..11..24..43..67..102..139..214..342..484..712..1131..solved at 1595
      #|0..0..solved at 2
      #|0..0..1..5..11..25..45..70..106..144..221..354..501..734..1162..solved at 1636
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..11..24..43..67..102..139..214..342..484..712..1131..solved at 1564
      #|0..0..1..5..11..25..45..70..106..144..221..354..501..734..1162..solved at 1636
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..0..1..3..5..solved at 11
      #|0..0..1..2..3..5..8..11..16..solved at 24
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
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..20..50..96..157..0..0..5..10..20..50..96..157..0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..20..50..96..157..0..0..5..10..20..50..96..157..0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..3..solved at 8
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
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..2..4..12..22..41..69..106..159..287..444..842..1414..2264..4032..6945..12419..21621..36928..solved at 39581
      #|0..0..1..2..5..9..solved at 16
      #|0..0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..5..solved at 10
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..5..solved at 12
      #|0..0..5..solved at 8
      #|0..0..4..solved at 9
      #|0..0..4..solved at 9
      #|0..0..4..solved at 7
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..4..9..18..29..42..68..solved at 78
      #|0..0..1..4..9..18..29..solved at 36
      #|0..0..1..3..5..9..14..solved at 21
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..solved at 33
      #|0..0..1..2..3..7..13..21..solved at 31
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..3..solved at 7
      #|0..0..1..3..5..10..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Jordan/metric_spaces quotations (1950):
      #|  !P Q R . (?(u:B). (?(x:A). (u = P x) /\\ (Q x)) /\\ (R u)) <=>\n    (?x. (Q x) /\\ R( P x))
      #|  !P Q R. (!(t:B). (?(x:A). P x /\\ (t = Q x)) ==> R t) <=>\n    (!x. P x ==> R (Q x))
      #|  !P Q R. (!(t:B). (?(x:A).  (t = Q x) /\\ P x ) ==> R t) <=>\n    (!x. P x ==> R (Q x))
      #|  !X A (B:A->bool). A SUBSET (X DIFF B) <=>\n         (A SUBSET X) /\\ (A INTER B = EMPTY)
      #|  x:A
      #|  !X (A:A->bool). A SUBSET (INTERS X) <=> (!x. X x ==> (A SUBSET x))
      #|  !P. ({(x:A) | P x} = {}) <=> (!x. ~P x)
      #|  x:A
      #|  !A B (C:A->bool). ((A DIFF B) INTER C = EMPTY) <=>\n         ((A INTER C) SUBSET B)
      #|  !A B (C:A->bool). ((A SUBSET B) ==> (A INTER C) SUBSET B) /\\\n        ((A SUBSET B) ==> (C INTER A) SUBSET B)
      #|  !(A:A->bool) B C. A SUBSET (UNIONS (B INSERT C)) <=>\n           (A DIFF B) SUBSET (UNIONS C)
      #|  !(A:A->bool) B C. (A SUBSET (UNIONS B)) /\\ (A INTER C = EMPTY) ==>\n                (A SUBSET (UNIONS (B DELETE (C))))
      #|  x
      #|  IMAGE x' B
      #|  !A (f:A->B) B. (B SUBSET (IMAGE f A)) /\\ (FINITE B) ==>\n     (?C. (C SUBSET A) /\\ (FINITE C) /\\ (B = IMAGE f C))
      #|  TAGB
      #|  TAGB
      #|  !(A:A->bool). INTERS {A} = A
      #|  (a ==> b) ==> ~(a /\\ ~b)
      #|  x':A
      #|  u:A
      #|  !(A:A->bool) x. (A DELETE x = EMPTY) <=> (~(A = EMPTY) ==> (A = {x}))
      #|  u:A
      #|  TAGB
      #|  !A (B:(A->bool)->bool). A SUBSET B ==> INTERS B SUBSET INTERS A
      #|  INTERS (V DELETE u) SUBSET x
      #|  INTERS (V DELETE u) INTER u SUBSET INTERS (V DELETE u) 
      #|  x = u
      #|  INTERS (V DELETE u) INTER u SUBSET u
      #|  !V (u:A->bool). V u ==> (INTERS V = (INTERS (V DELETE u)) INTER u)
      #|  !(A:A->bool) . (A = EMPTY) <=> (!x. ~(A x))
      #|  x' = {}
      #|  x'
      #|  x
      #|  x
      #|  !x. ~U x
      #|  !(U:(A->bool)->bool). (UNIONS U = {}) <=>\n     ((U = EMPTY) \\/ (U = {EMPTY}))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !((A:(A->bool)->bool)). ((INTERS A) = EMPTY) <=>\n    (!x . ?a.  (A a) /\\ ~(a x))
      #|  (SUC a = 1) <=> (a=0)
      #|  SUC (CARD (X DELETE (CHOICE X)))=1
      #|  ~(0=1)
      #|  ~(X = {})
      #|  CHOICE X
      #|  !X:A->bool. (X HAS_SIZE 1) ==> (SING X)
      #|  (x',x'')
      #|  b
      #|  a
      #|  (\\ (u,v) . (f u,f' v))
      #|  {(m:num,n:num) | T}
      #|  :A
      #|  :num#num
      #|  !(A:A->bool) (B:B->bool). (COUNTABLE A) /\\ (COUNTABLE B) ==>\n   (COUNTABLE {(a,b) | (A a) /\\ (B b) })
      #|  !(A:A->bool). IMAGE I A = A
      #|  !X. (X = {}) <=> (~(?(u:A). X u))
      #|  y:B
      #|  !(f : A->B) X Y. (BIJ f X Y) ==>\n  (! t. (t SUBSET X) ==> ((IMAGE f (X DIFF t)) = (Y DIFF (IMAGE f t))))
      #|  !Z1 Z2 A. ((Z1 UNION Z2) SUBSET (A:A->bool)) <=>\n     (Z1 SUBSET A) /\\ (Z2 SUBSET A)
      #|  !(f:A->B) A B X. (A INTER B = EMPTY) ==>\n    (preimage X f A INTER (preimage X f B) = EMPTY )
      #|  !(f:A->B) A B X Z.\n       (Z SUBSET ((preimage X f A) UNION (preimage X f B))) <=>\n     (Z SUBSET X) /\\ (IMAGE f Z SUBSET (A UNION B))
      #|  !(f:A->B) A X Z. (Z SUBSET (preimage X f A)) <=> (Z SUBSET X) /\\\n        (IMAGE f Z SUBSET A)
      #|  !dom (f:A->B) C. preimage dom f (UNIONS C) =\n     (UNIONS (IMAGE (preimage dom f) C))
      #|  !(f:A->B) X  A B. (A SUBSET B) ==>\n   (preimage X f A SUBSET (preimage X f B))
      #|  !(X:A->bool). ((\\B. B INTER X) = ((INTER) X)) /\\\n    ((\\B. X INTER B) = ((INTER) X))
      #|  !m n x . &.0 <=. sum(m,n) (\\i. (x i)*.(x i))
      #|  n:int
      #|  !n. (&.0 <. twopow(n))
      #|  a*b*cc = (a*cc)*b
      #|  !n. &.2 * (twopow (--: (&: (n+1)))) = twopow (--: (&:n))
      #|  x
      #|  x = CHOICE X
      #|  x = CHOICE X
      #|  if (delta < (CHOICE X)) then delta else (CHOICE X)
      #|  (b ==> ~a ) ==> (a ==> ~b)
      #|  (SUC x = SUC y) ==> (x = y)
      #|  (a /\\ b) ==> (b /\\ a)
      #|  FINITE (X DELETE CHOICE X) /\\ ~(X DELETE CHOICE X = {}) /\\ (X DELETE CHOICE X HAS_SIZE k ) 
      #|  x
      #|  SING X
      #|  SUC 0=1
      #|  k=0
      #|  X DELETE (CHOICE X)
      #|  CARD X
      #|  X
      #|  (!X k. FINITE X /\\ (~(X = EMPTY )) /\\ (X HAS_SIZE k) ==> (?delta. X delta /\\ (!x. X x ==> delta <= x))) ==>(!X. FINITE X /\\ (~(X = EMPTY )) ==> (?delta. X delta /\\ (!x. X x ==> delta <= x)))
      #|  !X.  (FINITE X) /\\ (~(X = EMPTY )) ==>\n     (?delta. (X delta) /\\ (!x. (X x) ==> (delta <=. x)))
      #|  TAGB
      #|  c +. (&.1)
      #|  delta
      #|  ~(X = EMPTY)
      #|  !c X.  (FINITE X) /\\ ( !x. (X x) ==> (c <. x) ) ==>\n     (?delta. (c <. delta) /\\ (!x. (X x) ==> (delta <=. x)))
      #|  !a b c. (a <=. b) /\\ (b <=. c) ==>\n    ({x | a <= x /\\ x < b} UNION {x | b <= x /\\ x <= c} =\n     { x | a <= x /\\ x <= c})
      #|  !x y z. ((x < z/(&.2)) /\\ (y < z/(&.2)) ==> (x + y < z))
      #|  !x y z. ((x < z/(&.2)) /\\ (y <= z/(&.2)) ==> (x + y < z))
      #|  !x y z. ((x <= z/(&.2)) /\\ (y < z/(&.2)) ==> (x + y < z))
      #|  !x y z. ((x <= z/(&.2)) /\\ (y <= z/(&.2)) ==> (x + y <= z))
      #|  j:num
      #|  x:num
      #|  x:num
      #|  (a==>b) /\\ (c==>b) ==> (a \\/ c ==> b)
      #|  c:real
      #|  !a b. ((a:real->bool) = b) ==> (FINITE a ==> FINITE b)
      #|  FINITE {y | ?x. (x IN inter /\\ (y = --.(&. x)))}
      #|  FINITE {y | ?x. (x IN inter /\\ (y = (&. x)))}
      #|  inter = {n | n <=| N}
      #|  !N. FINITE {x | ?j. (abs x = &.j) /\\ (j <=| N)}
      #|  &0 +. (&.0) = (&.0)
      #|  !f g n. (euclid n f) /\\ (euclid n g) ==> (euclid n (f + g))
      #|  t *.(&.0) = (&.0)
      #|  !n t f. (euclid n f) ==> (euclid n ((t:real) *# f))
      #|  (--x = &.0) <=> (x = &.0)
      #|  !f n. (euclid n f) ==> (euclid n (-- f))
      #|  &.0 -. (&.0) = (&.0)
      #|  !f g n. (euclid n f ) /\\ (euclid n g) ==> (euclid n (f - g))
      #|  (x = &.0) <=> (--x = &.0)
      #|  !f n. (euclid n f) = (euclid n (--f))
      #|  !f m n. (m <=| n) /\\ (euclid m f) ==> (euclid n f)
      #|  n' <=| n+n'
      #|  n <=| n+n'
      #|  n+|n'
      #|  (?)
      #|  euclid
      #|  !f g. (euclidean f) /\\ (euclidean g) ==> (euclidean (f+g))
      #|  n' <=| n+n'
      #|  n <=| n+n'
      #|  n+|n'
      #|  (?)
      #|  euclid
      #|  !f g. (euclidean f) /\\ (euclidean g) ==> (euclidean (f-g))
      #|  n:num
      #|  !s f. (euclidean f) ==> (euclidean (s *# f))
      #|  n:num
      #|  !f. (euclidean f) ==> (euclidean (-- f))
      #|  a+.b = b+.a
      #|  !(f:num->real) g. (f + g = g + f)
      #|  (a+.b)+.c = a+b+c
      #|  !(f:num->real) g h. (f + g)+h = f + g + h
      #|  :B
      #|  :real
      #|  :A
      #|  :num
      #|  &.0+a=a
      #|  !f. euclid0 + f = f
      #|  :B
      #|  :real
      #|  :A
      #|  :num
      #|  a+(&.0)=a
      #|  !f. f + euclid0  = f
      #|  a*(b+.c)=a*b+a*c
      #|  !f g r. r *# (f + g) = (r *# f) + (r *# g)
      #|  (a+b)*c= a*c+b*c
      #|  !f r s.  (r+s)*# f  = (r *# f) + (s *# f)
      #|  (a*b)*c = a*(b*c)
      #|  !r s f. r *# (s *# f) = (r *s) *# f
      #|  !f. (&.1) *# f = f
      #|  !x y .  euclid_minus (--x) (--y) = -- (euclid_minus x y)
      #|  !x t.  ((t *# x) + (&.1 - t) *# x = x)
      #|  q >=| q
      #|  (a<=|b) <=> (b >=| a)
      #|  n >=| q
      #|  euclid q f
      #|  (f:num->real) n = (&.0)
      #|  !n. n>=| q  ==> ((\\i. f i *. g i) n = (&.0))
      #|  (u = (&.0)) ==> (x = x + u)
      #|  p:num
      #|  q:num
      #|  q = min_num P
      #|  euclid (min_num (P:num->bool)) f /\\ (euclid (min_num (P:num->bool)) g)
      #|  min_num P <=| p
      #|  (P:num->bool) (p:num)
      #|  (P:num->bool) = \\m. (euclid m f) /\\ (euclid m g)
      #|  !p f g. (euclid p f) /\\ (euclid p g) ==>\n   (dot f g = sum (0,p) (\\i. (f i)* (g i)))
      #|  (&.0)*.a =(&.0)
      #|  (euclid n f) /\\ (euclid n g)
      #|  !f g m n. (m <=|n) /\\ (euclid m f) /\\ (euclid m g) ==>\n   (dot f g = sum (0,n) (\\i. (f i)* (g i)))
      #|  \\i. (f:num->real) i *. f i
      #|  (!n. (&.0 <=. (\\(i:num). f i *. f i) n))
      #|  !f. (&.0 <= (dot f f))
      #|  a/\\b <=> b/\\a
      #|  a*.b = b*.a
      #|  !f g. (dot f g = dot g f)
      #|  (--x) * y = --. (x *y)
      #|  !f g. (dot (--f) g) = --. (dot f g)
      #|  !f g. (dot f (--g)) = --. (dot f g)
      #|  a*.(b*.c) = (a*b)*c
      #|  f:num->real
      #|  s:real
      #|  n:num
      #|  euclid n (\\ (i:num). (s *. f i) ) /\\ (euclid n g)
      #|  !n f g s. (euclid n f) /\\ (euclid n g) ==>\n  (dot (s *# f) g = s *. (dot f g))
      #|  euclid (n+|n') f /\\ euclid (n+n') g
      #|  (n <=| n+n')
      #|  (n' <=| n+n')
      #|  euclid
      #|  !f g s. (euclidean f) /\\ (euclidean g) ==>\n  (dot (s *# f) g = s *. (dot f g))
      #|  !n f g s. (euclid n f) /\\ (euclid n g) ==>\n  (dot f (s *# g) = s *. (dot f g))
      #|  !f g s. (euclidean f) /\\ (euclidean g) ==>\n  (dot f (s *# g) = s *. (dot f g))
      #|  (a+.b)*.c = a*c + b*c
      #|  h:num->real
      #|  (f+g):num->real
      #|  n:num
      #|  h:num->real
      #|  g:num->real
      #|  n:num
      #|  h:num->real
      #|  f:num->real
      #|  n:num
      #|  euclid n (f+g)
      #|  !n f g h. (euclid n f) /\\ (euclid n g) /\\ (euclid n h) ==>\n    ((dot (f + g) h ) = (dot f h) +. (dot g h))
      #|  (a-.b)*.c = a*c - b*c
      #|  h:num->real
      #|  (f-g):num->real
      #|  n:num
      #|  h:num->real
      #|  g:num->real
      #|  n:num
      #|  h:num->real
      #|  f:num->real
      #|  n:num
      #|  euclid n (f-g)
      #|  !n f g h. (euclid n f) /\\ (euclid n g) /\\ (euclid n h) ==>\n    ((dot (f - g) h ) = (dot f h) -. (dot g h))
      #|  n'' <=| n+n'+n''
      #|  (euclid (n+n'+n'') h)
      #|  n' <=| n+n'+n''
      #|  (euclid (n+n'+n'') g)
      #|  n <=| n+n'+n''
      #|  (euclid (n+n'+n'') f)
      #|  euclid
      #|  !f g h. (euclidean f) /\\ (euclidean g) /\\ (euclidean h) ==>\n    ((dot (f + g) h ) = (dot f h) +. (dot g h))
      #|  n'' <=| n+n'+n''
      #|  (euclid (n+n'+n'') h)
      #|  n' <=| n+n'+n''
      #|  (euclid (n+n'+n'') g)
      #|  n <=| n+n'+n''
      #|  (euclid (n+n'+n'') f)
      #|  euclid
      #|  !f g h. (euclidean f) /\\ (euclidean g) /\\ (euclidean h) ==>\n    ((dot (f - g) h ) = (dot f h) -. (dot g h))
      #|  !n f g h. (euclid n f) /\\ (euclid n g) /\\ (euclid n h) ==>\n    ((dot h (f + g)) = (dot h f) +. (dot h g))
      #|  !f g h. (euclidean f) /\\ (euclidean g) /\\ (euclidean h) ==>\n    ((dot h (f + g)) = (dot h f) +. (dot h g))
      #|  !n f g h. (euclid n f) /\\ (euclid n g) /\\ (euclid n h) ==>\n    ((dot h (f - g)) = (dot h f) -. (dot h g))
      #|  !f g h. (euclidean f) /\\ (euclidean g) /\\ (euclidean h) ==>\n    ((dot h (f - g)) = (dot h f) -. (dot h g))
      #|  a*.(&.0) = (&.0)
      #|  (\\ (i:num). (f i *. (&.0))) = (\\ (r:num). (&.0))
      #|  !f. (dot f euclid0) = &.0
      #|  !f. (dot euclid0 f ) = &.0
      #|  euclid n f
      #|  a <=. (&.0) /\\ (&.0 <=. a) ==> (a = (&.0))
      #|  a = (f:num->real) x
      #|  (a+b <=. &.0) ==> ((&.0 <=. a) ==> (b <=. (&.0)))
      #|  (a+.b = &.0) ==> ((&.0 <=. b) ==> (a <=. (&.0)))
      #|  \\ (i:num). f i *. f i
      #|  !a b. (&.0 <=. sum(a,b) (\\ (i:num). f i *. f i))
      #|  0+| x = x
      #|  sum(0,n) (\\ (i:num). f i *. f i) = (&.0)
      #|  n:num
      #|  SUC x
      #|  (x <|n) ==> (SUC x <=| n)
      #|  x <| n \\/ (n <=| x)
      #|  f:num->real
      #|  f:num->real
      #|  n:num
      #|  dot f f = (&.0)
      #|  !f n. (euclid n f) /\\ (dot f f = (&.0)) ==> (f = euclid0)
      #|  euclid
      #|  !f. (euclidean f) /\\ (dot f f = (&.0)) ==> (f = euclid0)
      #|  !f. (&.0 <=. norm f)
      #|  --(--. x) = x
      #|  !f. norm (--f) = norm f
      #|  a:real
      #|  (&.0 <=. (a*.a*.c +. (--.b)*.a*.b)) <=> (a*b*b <=. a*a*c)
      #|  x +. (&.0) = x
      #|  (--. b) *. a*. b + b*.b*.a = (&.0)
      #|  (a *. ((--. b)*.c) = --. (a *. (b*.c)))/\\ (--. ((--. a) *. b) = a *.b )
      #|  (&.2 *. x = x + x)
      #|  c = dot g g
      #|  b = dot f g
      #|  a = dot f f
      #|  (<=.)
      #|  ~(x = &.0) /\\ (&.0 <=. x) ==> (&.0 <. x)
      #|  &.0 <. dot f f
      #|  g:num->real
      #|  f:num->real
      #|  (--.(dot f g)) *# f + (dot f f)*# g
      #|  (a=b)==> (a+.b = a*(&.2))
      #|  (b+. c=e) ==> (a+b+c+d = a+ e+d)
      #|  !a b. (dot (a *# f + b *# g) (a *# f + b *# g)) = a*a*(dot f f) + (&.2)*a*b*(dot f g) + b*b*(dot g g)
      #|  x <=. x
      #|  &.0 *. x = (&.0)
      #|  (f = euclid0 ) \\/ ~(f = euclid0)
      #|  !f g. (euclidean f) /\\ (euclidean g) ==>\n   ((abs(dot f g)) <=. (norm f)*. (norm g))
      #|  dot f f
      #|   --. (dot f g)
      #|  !h. norm(h) * norm(h) = (dot h h)
      #|  x <=. ||. x
      #|  (a=b)/\\ (a<=. e) ==>((a+b+c) <= (c+e+e))
      #|  (b<=.c)==>((a+.b) <=. (a+c))
      #|  (&.0 <=. x) /\\ (&.0 <=. y) ==> (&.0 <= x+y)
      #|  !f g. (euclidean f) /\\ (euclidean g) ==>\n    (norm (f+g) <=. norm(f) + norm(g))
      #|  !(X:A->bool) d a. (metric_space(X,d) /\\ (X a) ==> (d a a = (&.0)))
      #|  !(X:A->bool) d a b. (metric_space(X,d) /\\ (X a) /\\ (X b) ==>\n   (d a b = d b a))
      #|  !(X:A->bool) d a b c. (metric_space(X,d) /\\ (X a) /\\ (X b) /\\ (X c)\n   ==> (d a c <=. d a b +. d b c))
      #|  ( /\\ )
      #|  !X Y d. (Y SUBSET (X:A->bool)) /\\ (metric_space (X,d)) ==>\n    (metric_space (Y,d))
      #|  z:A
      #|  y:A
      #|  x:A
      #|  (x-z) = euclid_plus(x - y)  (y-z)
      #|  x - y = (euclid_neg (y-x))
      #|  (y:num->real) - y = euclid0
      #|  (a = b) <=> (a-.b = (&.0))
      #|  n:num
      #|  x - y = euclid0
      #|  (&.0 = x) <=> (x = (&.0))
      #|  metric_space (euclidean,d_euclid)
      #|  n:num
      #|  euclidean
      #|  !n. metric_space (euclid n,d_euclid)
      #|  0 +| 0 = 0
      #|  &.0 + x = x
      #|  1 = SUC 0
      #|  1
      #|  1
      #|  (x-y):num->real
      #|  (x-y):num->real
      #|  1 <= 1
      #|  euclid 1 (x - y)
      #|  !x y. (euclid 1 x) /\\ (euclid 1 y) ==>\n     ((d_euclid x y) = (abs ((x 0) -. (y 0))))
      #|  !i t. coord i (t *# dirac_delta i ) = t
      #|  !x. (x *# dirac_delta 0) 0 = x
      #|  1<= m ==> (~(0=m))
      #|  (~(0=m))==>(1<=| m)
      #|  n:num
      #|  !x. euclid 1 x <=> (x = (x 0) *# (dirac_delta 0))
      #|  proj i x = (\\j. (if (j=0) then (x (i:num)) else (&.0)))
      #|  !i x. euclid 1 (proj i x)
      #|  n:num
      #|  n:num
      #|  (x-y):num->real
      #|  (x-y):num->real
      #|  euclid n (x - y)
      #|  n <=| n
      #|  !n x y. ((euclid n x) /\\ (euclid n y)) ==> ((d_euclid x y) =\n     sqrt(sum (0,n) (\\i. (x i - y i) * (x i - y i))))
      #|  n
      #|  n
      #|  x
      #|  x
      #|  !n x. ((euclid n x) ) ==> ((norm x) =\n     sqrt(sum (0,n) (\\i. (x i ) * (x i ))))
      #|  n <=| n
      #|  &.0 + x = x
      #|  1 = SUC 0
      #|  1
      #|  !i x y. d_euclid (proj i x) (proj i y) = abs (x i -. y i)
      #|  !x y n. (euclid n x) /\\ (euclid n y) ==> (&.0 <=. d_euclid x y)
      #|  (x:num->real)- y
      #|  (n:num)-i-1
      #|  SUC i
      #|  (x:num->real)- y
      #|  i:num
      #|  0:num
      #|  (a = c) /\\ (&.0 <=. b) ==> (a <=. b+c)
      #|  0 +| i = i
      #|  (a <=. b) /\\ (&.0 <=. c)   ==> (a <=. (b +c))
      #|  ~(n <=| i) ==> (i < n) /\\ (n = (SUC i) + (n-i-1))
      #|  (x = (&.0)) /\\ (&.0 <=. y) ==> (x <=. y)
      #|  n <=| i
      #|  &.0 <=. sum (0,n) (\\i. (x i - y i)*. (x i - y i))
      #|  euclid n (x - y)
      #|  n:num
      #|  !n x y i. (euclid n x) /\\ (euclid n y) ==>\n     abs (x i - (y i)) <=. d_euclid x y
      #|  1 <=| m ==> (~(0=m))
      #|  !x. (euclid 1 (x *# (dirac_delta 0)))
      #|  !n x y. (euclid n x) /\\ (euclid n y) ==>\n     ((d_euclid x y) pow 2 = sum (0,n) (\\i. (x i - y i) * (x i - y i)))
      #|  &.0 <= &.n
      #|  t = x i - (y:num->real) i
      #|  i:num
      #|  !i. ((x:num->real) i -. y i) *. (x i -. y i) <=. eps* eps
      #|  abs (x) <=. eps ==> &.0 <=. eps
      #|  0
      #|  !n x y eps. ((euclid n x) /\\ (euclid n y) /\\\n     (!i. (abs (x i -. y i) <=. eps))) ==>\n    ( d_euclid x y <=. sqrt(&.n)*. eps )
      #|  i:num
      #|  (x + z) - (y + z) = ((x:num->real) - y)
      #|  n:num
      #|  euclid n (euclid_minus (euclid_plus x z) (euclid_plus y z))
      #|  euclid n (euclid_minus x y)
      #|  !n x y z . (euclid n x) /\\ (euclid n y) /\\ (euclid n z) ==>\n   (d_euclid (x + z) (y + z) = d_euclid x y)
      #|  i:num
      #|  (z + x) - (z + y) = ((x:num->real) - y)
      #|  n:num
      #|  euclid n (euclid_minus (euclid_plus z x) (euclid_plus z y))
      #|  euclid n (euclid_minus x y)
      #|  !n x y z . (euclid n x) /\\ (euclid n y) /\\ (euclid n z) ==>\n   (d_euclid (z + x ) (z + y) = d_euclid x y)
      #|  a * a * b = b * (a * a)
      #|  !t t' x . (euclidean x) ==>\n   (d_euclid (t *# x) (t' *# x) =\n        ||. (t - t') * norm(x))
      #|  TAGB
      #|  t*t*b = (t*t)*b
      #|  !n t x x' . (euclid n x) /\\ (euclid n x') ==>\n   (d_euclid (t *# x) (t *# x') = ||. t * d_euclid x x')
      #|  topology_ (U:(A->bool)->bool) <=>\n  (!A B V.  (U EMPTY) /\\\n      ((U A) /\\ (U B) ==> (U (A INTER B))) /\\\n      ((V SUBSET U) ==> (U (UNIONS V))))
      #|  open_ (U:(A->bool)->bool) A = (U A)
      #|  closed_ (U:(A->bool)->bool) B <=>\n    (B SUBSET (UNIONS U)) /\\\n    (open_ U ((UNIONS U) DIFF B))
      #|  closure (U:(A->bool)->bool) A =\n    INTERS { B | (closed_ U B) /\\ (A SUBSET B) }
      #|  induced_top U (A:A->bool) =\n  IMAGE ( \\B. (B INTER A)) U
      #|  open_ball(X,d) (x:A) r = { y | (X x) /\\ (X y) /\\ (d x y <. r) }
      #|  closed_ball (X,d) (x:A) r = { y | (X x) /\\ (X y) /\\ (d x y <=. r) }
      #|  open_balls (X,d) = { B | ?(x:A) r. B = open_ball (X,d) x r}
      #|  top_of_metric ((X:A->bool),d) =\n      { A | ?F. (F SUBSET (open_balls (X,d)))/\\\n     (A = UNIONS F) }
      #|  !(U:(A->bool)->bool). (topology_ U ==> open_ U EMPTY)
      #|  (A:A->bool) SUBSET (UNIONS U)
      #|  !U A. (topology_ (U:(A->bool)->bool)) /\\ (open_ U A) ==>\n     (closed_ U ((UNIONS U) DIFF A))
      #|  a = UNIONS U
      #|  !(U:(A->bool)->bool). (topology_ U ==> closed_ U (UNIONS U))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !(U:(A->bool)->bool). (topology_ U) ==> (U (UNIONS U))
      #|  !(U:(A->bool)->bool).\n     (topology_ U) ==> closed_ U EMPTY
      #|  !(U:(A->bool)->bool) A.  (closed_ U A) ==>\n    (open_ U ((UNIONS U) DIFF A))
      #|  (open_)
      #|   (UNIONS U DIFF INTERS V)= (UNIONS (VCOMP:(A->bool)->bool))
      #|  open_ U (UNIONS (VCOMP:(A->bool)->bool))
      #|  (VCOMP:(A->bool)->bool) SUBSET U
      #|  VCOMP
      #|  VCOMP = IMAGE ((DIFF) (UNIONS (U:(A->bool)->bool))) V
      #|  u:A->bool
      #|  !U V. (topology_ (U:(A->bool)->bool)) /\\ (!a. (V a) ==> (closed_ U a))\n    /\\ ~(V = EMPTY)\n     ==> (closed_ U (INTERS V))
      #|  W = IMAGE B A
      #|  (IMAGE B A) SUBSET U
      #|  B x
      #|  x:A
      #|  UNIONS (IMAGE B A)  = A
      #|  A:A->bool
      #|  !U (A:A->bool). (topology_ U) ==>\n    ((U A) = (!x. ?B. (A x ) ==> ((B SUBSET A) /\\ (B x) /\\ (U B))))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  U
      #|  u
      #|  (INTERS (V DELETE u))
      #|  V DELETE u SUBSET U 
      #|  V={u}
      #|  V DELETE u
      #|  u
      #|  U
      #|  U
      #|  V
      #|  (?n. V HAS_SIZE n)
      #|  !U (V:(A->bool)->bool). (topology_ U) /\\ (V SUBSET U) /\\\n    (FINITE V) /\\ ~(V = EMPTY)  ==>\n                        (U (INTERS V))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !(U:(A->bool)->bool) V. topology_ U /\\ (V SUBSET U) ==> U (UNIONS V)
      #|  !(U:(A->bool)-> bool) A B. topology_ U /\\ (U A) /\\ (U B) ==> (U (A INTER B))
      #|  a:A
      #|  a:A
      #|  a:A
      #|  ( /\\ )
      #|  !(X:A->bool) d a r. (metric_space (X,d)) /\\ (&.0 <. r) /\\ (X a) ==>\n    (a IN (open_ball(X,d) a r))
      #|  !(X:A->bool) d a r. (open_ball (X,d) a r SUBSET X)
      #|  !(X:A->bool) Y d a r. (Y SUBSET X) ==>\n    (open_ball(Y,d) a r SUBSET open_ball(X,d) a r)
      #|  !(X:A->bool) d a r. ~(a IN X) ==> (EMPTY = open_ball (X,d) a r)
      #|  !(X:A->bool) Y d a r. (Y SUBSET X) /\\ (a IN Y) ==>\n   (open_ball(Y,d) a r = (open_ball(X,d) a r INTER Y))
      #|  (!)
      #|  (u <. v-.w) <=> (w +. u <. v)
      #|  (&.0 < r -. s)= (s <. r)
      #|  (IN)
      #|  r -. (d (a:A) (b:A))
      #|  !(X:A->bool) d a b r. (metric_space (X,d)) /\\\n      (a IN (open_ball (X,d) b r)) ==>\n     (?r'. (&.0 <. r') /\\\n         ((open_ball(X,d) a r') SUBSET (open_ball(X,d) b r)))
      #|  x:A
      #|  a:A
      #|  b:A
      #|  (+.)
      #|  (a:A) IN { y | X a /\\ X y /\\ (d a y <. r)}
      #|  !(X:A->bool) d a r. (metric_space(X,d)) ==>\n    ((a IN (open_ball(X,d) a r)) =\n    ~(open_ball(X,d) a r = EMPTY))
      #|  a:A
      #|  x:A
      #|  a:A
      #|  a:A
      #|  x:A
      #|  a:A
      #|  a:A
      #|  a:A
      #|  a:A
      #|  !d r. ~((d <. r) /\\ (r <. (&.0)) /\\ (&.0 <=. d))
      #|  !(X:A->bool) d a r. metric_space(X,d) /\\ (r <. (&.0)) ==>\n    (EMPTY = open_ball(X,d) a r)
      #|  a:A
      #|  x:A
      #|  a:A
      #|  (r<. r') /\\ (a <. r) ==> (a <. r')
      #|  !(X:A->bool) d a r r'. (r <. r') ==>\n   ((open_ball (X,d) a r) SUBSET (open_ball(X,d) a r'))
      #|  (~(r'' <. r''')) ==> ((r''' <. r'') \\/ (r'''=r''))
      #|  (if (r'' <. r''') then (r'') else (r'''))
      #|  r:real
      #|  a:A
      #|  c:A
      #|  d:A->A->real
      #|  X:A->bool
      #|  r':real
      #|  b:A
      #|  c:A
      #|  d:A->A->real
      #|  X:A->bool
      #|  (X:A->bool) (c:A)
      #|  (INTER)
      #|  !(X:A->bool) d a b c r r'. (metric_space (X,d)) /\\ (X a) /\\ (X b) /\\\n  (c IN (open_ball(X,d) a r INTER (open_ball(X,d) b r'))) ==>\n  (?r''. (&.0 <. r'') /\\ (open_ball(X,d) c r'') SUBSET\n    (open_ball(X,d) a r INTER (open_ball(X,d) b r')))
      #|  y:A
      #|  z:A
      #|  x:A
      #|  !X d x y (z:A) r. metric_space(X,d) /\\ open_ball(X,d) z r x /\\\n  open_ball(X,d) z r y ==> d x y <. (&.2 * r)
      #|  y:A
      #|  z:A
      #|  x:A
      #|  !X d x y (z:A) r. metric_space(X,d) /\\ closed_ball(X,d) z r x /\\\n  closed_ball(X,d) z r y ==> d x y <=. (&.2 * r)
      #|  !X d (x:A) r.\n     (open_ball(X,d) x r SUBSET (closed_ball(X,d) x r))
      #|  !X d (x:A) y r. metric_space(X,d) /\\ (X x) /\\ (X y) ==>\n       (open_ball(X,d) x r y = open_ball(X,d) y r x)
      #|  open_ball(X,d) z r x
      #|  X z /\\ X x' /\\ X x
      #|  !X d (x:A) z r. metric_space(X,d) /\\\n       (open_ball(X,d) x r z ) ==>\n    (open_ball(X,d) z r SUBSET (open_ball(X,d) x (&.2 * r)))
      #|  (B:A->bool) IN open_balls (X,d)
      #|  B:A->bool
      #|  (&.0) <. (&.1)
      #|  metric_space
      #|  (IN)
      #|  {(open_ball(X,d) (x:A) (&.1))}
      #|  (x:A) IN X
      #|  open_ball(X,d) (x:A) (&.1)
      #|  !(X:A->bool) d. (metric_space (X,d)) ==>\n    (X = UNIONS (top_of_metric (X,d)))
      #|  x:A
      #|  x:A
      #|  x:A
      #|  EMPTY:(A->bool)->bool
      #|  !(X:A->bool) d.\n   ( (top_of_metric (X,d)) EMPTY)
      #|  !(X:A->bool) d F.\n    (F SUBSET (open_balls (X,d))) ==>\n    ((UNIONS F) IN (top_of_metric(X,d)))
      #|  {(x:A->bool)}
      #|  !(X:A->bool) d.\n    (open_balls (X,d)) SUBSET (top_of_metric(X,d))
      #|  d
      #|  X
      #|  ! (X:A->bool) d x r. (metric_space(X,d)) ==>\n   (top_of_metric (X,d) (open_ball (X,d) x r)) 
      #|  (!)
      #|  (?)
      #|  a:A
      #|  open_ball (X,d) (a:A) (r a)
      #|  a:A
      #|  IMAGE (\\b. (open_ball(X,d) b (r b))) (A:A->bool)
      #|  !s. ((s:A->bool) IN F') ==> (s SUBSET (UNIONS F'))
      #|  r':real
      #|  (a:A) IN open_ball(X,d) x r
      #|  r:real
      #|  x:A
      #|  a:A
      #|  d:A->A->real
      #|  (X:A->bool)
      #|  (t IN open_balls (X:A->bool,d))
      #|  (IN)
      #|  !(X:A->bool) d A. (metric_space (X,d)) ==>\n     ((top_of_metric (X,d) A) <=> ((A SUBSET X) /\\\n    (!a. (a IN A) ==>\n    (?r. (&.0 <. r) /\\ (open_ball(X,d) a r SUBSET A)))))
      #|  x:A
      #|  ~(r<.r') ==> ((r'<. r) \\/ (r'=r))
      #|  if (r<. r') then r else r'
      #|  (IN)
      #|  (IN)
      #|  (INTER)
      #|  (top_of_metric (X,d) (A:A->bool))
      #|  (top_of_metric (X,d) (B:A->bool))
      #|  d:A->A->real
      #|  X:A->bool
      #|  !(X:A->bool) d. (metric_space (X,d)) ==>\n   (!A B. (top_of_metric (X,d) A) /\\ (top_of_metric (X,d) B) ==>\n      (top_of_metric (X,d) (A INTER B)))
      #|  r:real
      #|  (!)
      #|  d:A->A->real
      #|  X:A->bool
      #|  (top_of_metric (X,d)) (t:A->bool)
      #|  d:A->A->real
      #|  X:A->bool
      #|  !(X:A->bool) d. (metric_space(X,d)) ==>\n   (!V. (V SUBSET top_of_metric(X,d)) ==>\n      (top_of_metric(X,d) (UNIONS V)))
      #|  a:A
      #|  !(X:A->bool) d. ( (metric_space (X,d))) ==>\n    (topology_ (top_of_metric (X,d)))
      #|  (closed_ball (X,d) x r) = EMPTY
      #|  ~(&.0 < d x x' - r) ==> (d x x' <=. r)
      #|  d
      #|  X
      #|  d x' y = d y x'
      #|  x'
      #|  y
      #|  x
      #|  y:A
      #|  X x'
      #|  R = (d x x' -. r)
      #|  open_ball(X,d) x' (d x x' -. r)
      #|  X x
      #|  !X d (x:A) r. (metric_space (X,d)) ==>\n     (closed_ (top_of_metric(X,d)) (closed_ball(X,d) x r))
      #|  r'
      #|  r
      #|  x'
      #|  x
      #|  d
      #|  X
      #|  u
      #|  !X d C x. ?e. (metric_space((X:A->bool),d)) /\\ (C x) /\\\n    (top_of_metric (X,d) C) ==>\n   ((&.0 < e) /\\ (open_ball (X,d) x e SUBSET C))
      #|  TAGB
      #|  UNIONS U
      #|  !U (A:A->bool). (topology_ U) /\\ (A SUBSET (UNIONS U))  ==>\n    (closed_ U (closure U A))
      #|  a:A
      #|  !U (A:A->bool). (topology_ U) ==> (A SUBSET (closure U A))
      #|  !U (A:A->bool) B. (topology_ U) /\\ (closed_ U B) /\\ (A SUBSET B)\n    ==> (closure U A SUBSET B)
      #|  !U (A:A->bool). (topology_ U) /\\ (closed_ U A) ==>\n     (closure U A = A)
      #|  !U Z (A:A->bool). (topology_ U) /\\ (Z SUBSET (UNIONS U)) ==>\n     ((A = closure U Z) = ((Z SUBSET A) /\\ (closed_ U A) /\\\n         (!B. (closed_ U B) /\\ ((Z SUBSET B)) ==>\n             (A SUBSET B))))
      #|  A SUBSET (UNIONS U INTER A)
      #|  (UNIONS U) DIFF (B:A->bool)
      #|  (UNIONS U) DIFF (B:A->bool)
      #|  ( A ==> (B <=> C)) ==>   (A /\\ B <=> A /\\ C)
      #|  ( A ==> (B <=> C)) ==>   (A /\\ B <=> A /\\ C)
      #|  !U Z (A:A->bool). (topology_ U) /\\ (Z SUBSET (UNIONS U)) ==>\n     ((A = closure U Z) = ((Z SUBSET A) /\\ (closed_ U A) /\\\n            (!B. (open_ U B) /\\ ((B INTER Z) = EMPTY) ==>\n             ((B INTER A) = EMPTY))))
      #|  UNIONS (Z:(A->bool)->bool)
      #|  (x:A->bool) INTER x'
      #|  (?)
      #|  !(U:(A->bool)->bool) (f:(A->bool)->(B->bool)).\n    ((topology_ U) /\\ (EMPTY = f EMPTY) /\\\n    (!a b. (a IN U) /\\ (b IN U) ==>\n      (((f a) INTER (f b)) = f (a INTER b))) /\\\n    (!V. (V SUBSET U) ==> (UNIONS (IMAGE f V) =f (UNIONS V) )))\n    ==> (topology_ (IMAGE f U))
      #|  !U (C:A->bool). (UNIONS (induced_top U C) = ((UNIONS U) INTER C))
      #|  !U (C:A->bool). (topology_ U) ==> (topology_ (induced_top U C))
      #|  !U (C:A->bool) A. (topology_ U) ==> (induced_top U C A =\n     (?B. (U B) /\\ ((B INTER C) = A)))
      #|  ! U (A:A->bool) B. (topology_ U) /\\ U A /\\ (induced_top U A B) ==>\n    (U B)
      #|  x SUBSET (UNIONS U)
      #|  x
      #|  B SUBSET (UNIONS U)
      #|  !(U:(A->bool)->bool). (topology_ U) ==>\n        ((induced_top U (UNIONS U)) = U)
      #|  gen (X:(A->bool)->bool)\n  = {A | ?Y. (Y SUBSET X) /\\ (A = UNIONS Y)}
      #|  !(X:(A)->bool) d. gen (open_balls(X,d))= (top_of_metric(X,d))
      #|  A:(A->bool)
      #|  UNIONS (IMAGE (Y':(A->bool)->((A->bool)->bool)) (Y:(A->bool)->bool))
      #|  (?)
      #|  !U (V:(A->bool)->bool).  (U SUBSET V) /\\\n     (!A. (A IN V) ==> (?Y. (Y SUBSET U) /\\ (A = UNIONS Y)))\n    ==> (gen U = (gen V))
      #|  (SUBSET)
      #|  (UNIONS)
      #|  UNIONS (Z:(A->bool)->bool)
      #|  IMAGE ((INTER) Y) (F':(A->bool)->bool)
      #|  (INTER)
      #|  (?)
      #|  C:A->bool
      #|  B:A->bool
      #|  !(X:A->bool) Y d. (Y SUBSET X) /\\ (metric_space(X,d)) ==>\n     (induced_top (top_of_metric(X,d)) Y =\n         gen (induced_top (open_balls(X,d)) Y))
      #|  x'':A
      #|  open_ball (Y,d) (x'':A) (s x'')
      #|  IMAGE (\\t. open_ball(Y,d) t (s t) ) ((x:A->bool) INTER Y)
      #|  r':real
      #|  (a:A) IN open_ball(X,d) x' r
      #|  r
      #|  x'
      #|  a
      #|  d
      #|  X
      #|  !(a:A). (a IN x INTER Y) ==> (?s. ((&.0) <. s) /\\ open_ball(Y,d) a s SUBSET (x INTER Y))
      #|  (--.(&.1) <. (&.0))
      #|  open_ball (X,d) (x:A) (--. (&.1))
      #|  open_ball (X,d) (x:A) r
      #|  (Y:A->bool) (x:A)
      #|  A:(A->bool)
      #|  !(X:A->bool) Y d. (Y SUBSET X) /\\ (metric_space (X,d)) ==>\n    (gen (open_balls(Y,d)) = gen (induced_top (open_balls(X,d)) Y))
      #|  !(X:A->bool) Y d. (Y SUBSET X) /\\ (metric_space(X,d)) ==>\n    (induced_top (top_of_metric(X,d)) Y = (top_of_metric(Y,d)))
      #|  continuous (f:A->B) U V <=> !v.\n  (v IN V) ==> (preimage (UNIONS U) f v) IN U
      #|  metric_continuous_pt (f:A->B) (X,dX) ((Y:B->bool),dY) x =\n  !epsilon. ?delta. (((&.0) < epsilon) ==> ((&.0) <. delta) /\\\n    (!y. ((x IN X) /\\ (y IN X) /\\ (dX x y) <. delta) ==>\n     (dY (f x) (f y) <. epsilon)))
      #|  metric_continuous (f:A->B) (X,dX) (Y,dY) <=> !x.\n    metric_continuous_pt f (X,dX) (Y,dY) x
      #|  !f X dX Y dY x .\n   ~(x IN X) ==> (metric_continuous_pt (f:A->B) (X,dX) (Y,dY) x)
      #|  IMAGE
      #|  !x. (X x) ==> (Y ((f:A->B) x))
      #|  open_ball
      #|  y:A
      #|  delta:real
      #|  v IN top_of_metric (Y,dY)
      #|  ?eps. (&.0 <. eps) /\\ (open_ball(Y,dY) ((f:A->B) a) eps SUBSET v)
      #|  preimage
      #|  open_ball(X,dX) (x:A) r
      #|  !(x:A) B. (?A. (x IN A /\\ A SUBSET B)) ==> (x IN B)
      #|  y:A IN B
      #|  r:real
      #|  ?r. (&.0 <. r) /\\ (open_ball(X,dX) (x:A) r SUBSET B)
      #|  B = preimage (UNIONS (top_of_metric (X,dX))) (f:A->B) (open_ball (Y,dY) (f x) epsilon)
      #|  (x:A) IN X
      #|  IMAGE
      #|  (Y:B->bool) ((f:A->B) x )
      #|  (x:A) IN preimage (UNIONS (top_of_metric (X,dX))) f (open_ball (Y,dY) ((f:A->B) x) epsilon)
      #|  open_balls((Y:B->bool),dY)
      #|  !(x:A) B. (?A. (x IN A /\\ A SUBSET B)) ==> (x IN B)
      #|  (open_ball (Y,dY) ((f:A->B) x) epsilon) IN (top_of_metric(Y,dY))
      #|  (x:A) IN X
      #|  !f X Y dX dY. (IMAGE f X SUBSET Y) /\\ (metric_space(X,dX)) /\\ (metric_space(Y,dY))\n    ==>\n   (continuous (f:A->B) (top_of_metric(X,dX)) (top_of_metric(Y,dY))\n   <=> (metric_continuous f (X,dX) (Y,dY)))
      #|  a:A
      #|  a:A
      #|  a:A
      #|  a:A
      #|  a:A
      #|  a:A
      #|  eps:real
      #|  y:A
      #|  y:A
      #|  y:A
      #|  y:A
      #|  y:A
      #|  (f:A->B) y
      #|  !(f:A->B) U V A. (topology_ V) /\\ (continuous f U V) /\\ (V A) ==>\n       (continuous f U (induced_top V A)) 
      #|  x'
      #|  !U X d f. (metric_space(X,d)) /\\ (topology_ U) ==>\n    ((continuous (f:A->B) U (top_of_metric(X,d))) =\n      (!(x:B) r. U (preimage (UNIONS U) f (open_ball (X,d) x r))))
      #|  n:num
      #|  b + C < d ==> (a <= b + C ==> (a < d))
      #|  d_euclid
      #|  euclid n
      #|  d_euclid (f t + (g t)) (f x' + g x') <=. (d_euclid (f t + (g t)) (f x' + g t)) + (d_euclid (f x' + g t) (f x' + g x'))
      #|  !D B C. ((B:A->bool) SUBSET D) ==> ((D SUBSET C) ==> (B SUBSET C))
      #|  UNIONS U
      #|  (\\t. euclid_plus (f t) (g t))
      #|  B
      #|  B = (preimage (UNIONS U) f (open_ball (euclid n,d_euclid) (f t) (r' / &2))) INTER (preimage (UNIONS U) g (open_ball (euclid n,d_euclid) (g t) (r' / &2)))
      #|  open_ball(euclid n,d_euclid) (g t) (r'/(&.2))
      #|  open_ball(euclid n,d_euclid) (f t) (r'/(&.2))
      #|  n
      #|  t:A
      #|  !U (f:A->(num->real)) g n. (topology_ U) /\\\n   (continuous f U (top_of_metric(euclid n,d_euclid))) /\\\n   (continuous g U (top_of_metric(euclid n,d_euclid))) /\\\n   (IMAGE f (UNIONS U) SUBSET (euclid n)) /\\\n   (IMAGE g (UNIONS U) SUBSET (euclid n)) ==>\n   (continuous (\\t. (f t + g t))  U (top_of_metric(euclid n,d_euclid)))
      #|  TAGB
      #|  sequence X (f:num->A) <=> (IMAGE f UNIV) SUBSET X
      #|  converge (X,d) (f:num -> A) <=> (?x. (x IN (X:A->bool)) /\\\n   (!eps. ?n. (&.0 <. eps) ==>\n        (!i. (n <=| i) ==> (d x (f i) <. eps))))
      #|  cauchy_seq (X,d) (f:num->A) <=> (sequence X f) /\\\n    (!eps. ?n. !i j. (&.0 <. eps) /\\\n        (n <= i) /\\ (n <= j) ==> (d (f i) (f j) <. eps))
      #|  complete (X,d) <=> !(f:num->A). cauchy_seq (X,d) f ==>\n    converge (X,d) f
      #|  X ((f:num->A) i) /\\ X x /\\ X (f j)
      #|  sequence
      #|  n <=| j
      #|  n <=| i
      #|   (&.0 <. (eps/(&.2)))
      #|  n:num
      #|  (IN)
      #|  !X d f. metric_space(X,d) /\\ (sequence X f) /\\ (converge((X:A->bool),d) f)\n    ==> cauchy_seq(X,d) f
      #|  eps/(&.2)
      #|  eps/(&.2)
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  (f:num->A) j
      #|  x:A
      #|  (f:num->A) i
      #|  euclid 1 (f (m:num)) /\\ euclid 1 (f (n':num))
      #|  a >=| b <=> b <=| a
      #|  n:num
      #|  !f. (cauchy_seq(euclid 1,d_euclid) f) ==> (cauchy (\\x. (f x 0)))
      #|  e:real
      #|  e:real
      #|  e:real
      #|  n >=| N <=> N <= n
      #|  (IN)
      #|  cauchy_seq
      #|  euclid 1 (f (i:num))
      #|  N:num
      #|  c IN (euclid 1)
      #|  (c:num->real)
      #|  c = \\j. (if (j=0) then (z:real) else (&.0))
      #|  z = lim (\\x. f x 0)
      #|  complete (euclid 1,d_euclid)
      #|  eps:real
      #|  eps:real
      #|  eps:real
      #|  eps:real
      #|  !X (f:num->A) i. sequence X f ==> X (f i)
      #|  n:num
      #|  a <=. b ==> (b <. eps ==> a <. eps)
      #|  d_euclid
      #|  n':num
      #|  sequence (euclid 1) (proj (i:num) o f)
      #|  !i f n. cauchy_seq (euclid n,d_euclid) f ==>\n     (cauchy_seq (euclid 1,d_euclid) ((proj i) o f))
      #|  eps:real
      #|  eps:real
      #|  eps:real
      #|  j:num
      #|  i':num
      #|  j:num
      #|  i':num
      #|  j:num
      #|  i':num
      #|  j:num
      #|  i':num
      #|  0 = n *| 0
      #|  (0<=a)/\\(0<=b) /\\(0<1)  ==> (a <| 1 + a + a + b)
      #|  (1+n)*(1+n)*1 = 1+n+n+n*n
      #|  &.0 <. &.1 + &.n 
      #|  eps pow 2 = eps*eps*(&. 1)
      #|  (b <. c)   ==> ((a <=. b) ==> (a <. c))
      #|  a = (L r 0 - (f:num->num->real) i r)
      #|  b = eps/(&1 + &n)
      #|  r:num
      #|  i:num
      #|  r:num
      #|  (abs (L r 0 - f (i:num) (r:num)) < eps/(&.1 + &.n))
      #|  n +| 0 = n
      #|  c (r:num) = (t:num->num) r
      #|  sum (0,n) (\\i'. (L i' 0 - f (i:num) i') * (L i' 0 - f i i')) <=. sum (0,n) (\\i'. (eps/(&.1 + &.n)) * (eps/(&.1 + &.n)))
      #|  M:num
      #|  m <| n ==> ~(n <= m)
      #|  n:num
      #|  ?M. (!j. (t:num->num) j <=| M)
      #|  t = (\\u. (if (u <| n) then (c u) else (0)))
      #|  i:num
      #|  j:num
      #|  n':num->num
      #|  !(j:num). ?c. !i. (c <=| i) ==> ||. (L j 0 -. f i j) <. eps/(&.1 + &. n)
      #|  !i. euclid n (f (i:num))
      #|  !i j. euclid 1 ((proj i o f) (j:num))
      #|  &.0 <. eps/ (&.1 +. &.n)
      #|  eps/(&.1 +. &. n)
      #|  euclid n (f (n+| n'))
      #|  (&.0 = x) ==> (abs(u - x) = abs(u))
      #|  euclid 1 (proj m (f (n +| n')))
      #|  (x = y) ==> ~(x<y)
      #|  n' <=| n+| n'
      #|  (n:num)+n'
      #|  d_euclid
      #|  !x. ~(x=(&.0)) ==> (&.0 <. abs(x))
      #|  (\\j. ((L:num->num->real) j 0))
      #|  L:num->(num->real)
      #|  !i. converge (euclid 1,d_euclid) (proj i o f)
      #|  !n. complete (euclid n,d_euclid)
      #|  m:num
      #|  abs((L:num->num->real) m 0)
      #|  abs((L:num->num->real) m 0)
      #|  abs((L:num->num->real) m 0)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !(X:A->bool) S f. S SUBSET X /\\ sequence S f ==>\n         sequence X f
      #|  !(X:A->bool) S d f. S SUBSET X /\\ cauchy_seq(S,d) f ==>\n         cauchy_seq(X,d) f
      #|  a = (f:num->num->real) n'
      #|  X = euclid n
      #|  (S:(num->real)->bool) ((f:num->num->real) n')
      #|  (f:num->num->real) n'
      #|  n <=| n
      #|  n':num
      #|  r:real
      #|  x:num->real
      #|  n:num
      #|  TAGB
      #|  ~(x IN S) ==> (x IN (euclid n DIFF S))
      #|  (x:num->real)
      #|  converge(euclid n,d_euclid) f
      #|  cauchy_seq(euclid n,d_euclid) f
      #|  !n S. (closed_ (top_of_metric (euclid n,d_euclid)) S) /\\\n    (S SUBSET (euclid n)) ==>\n     (complete (S,d_euclid))
      #|  TAGB
      #|  totally_bounded ((X:A->bool),d) =\n  (!eps. ?B.  (&.0 <. eps) ==>\n    (FINITE B) /\\\n    (!b. (B b) ==> ?x. b = open_ball(X,d) x eps) /\\\n    (X = UNIONS B))
      #|  c:A->bool
      #|  eps:real
      #|  eps:real
      #|  (a <=. b + c) ==> !e. (b + c <. e ==> (a <. e))
      #|  u:A
      #|  x:A
      #|  v:A
      #|  (X x) /\\ ((X:A->bool) u) /\\ (X v)
      #|  v = (s:(A->bool)->A) b
      #|  b:A->bool
      #|  (b:A->bool) ((s:(A->bool)->A) b)
      #|  (S:A->bool) ((s:(A->bool)->A) b)
      #|  u:A
      #|  (u:A) IN (b INTER S)
      #|  open_ball((S:A->bool),d) (s (b:A->bool)) eps
      #|  b:A->bool
      #|  b:A->bool
      #|  b:A->bool
      #|  (X:A->bool) (u:A)
      #|  u:A
      #|  c:A->bool
      #|  IMAGE (\\c. (open_ball ((S:A->bool),d) ((s) c) eps)) (B:(A->bool)->bool)
      #|  !b. ?s. (?t. (t IN (b:A->bool) INTER S)) ==> (s IN b INTER S)
      #|  &.0 <. eps ==> &.0 <. eps/(&.2)
      #|  eps/(&.2)
      #|  !(X:A->bool) d S. (metric_space (X,d)) /\\ (totally_bounded(X,d))\n      /\\ (S SUBSET X)  ==>\n     (totally_bounded (S,d)) 
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  ~(n <=| q) ==> (q <| n)
      #|  q:num
      #|  \\p. (if (p <| n) then ((x:num->real) p) else (CHOICE UNIV))
      #|  ~(n <=| i) ==> (i <| n)
      #|  i:num
      #|  0
      #|  euclid n x
      #|  !a b. ((a:(num->real)->bool) = b) ==> (FINITE a ==> FINITE b)
      #|  FINITE { y | ?x. x IN fs /\\ (y:(num->real) = G (x:num->real))}
      #|  G = (\\ u. (\\ j. if (n <=| j) then (&.0) else (u j)))
      #|  !(a:num->bool) (b:real->bool). FINITE a /\\ FINITE b ==> (FINITE (FUN a b))
      #|  FINITE (fs:(num->real)->bool)
      #|  gs = { f | (euclid n f) /\\ (!i. (?j. (abs(f i) = &.j) /\\ (j <=| N)))}
      #|  fs = FUN {m | m <| n} {x |  ?j. (abs x = &.j) /\\ (j <=| N)}
      #|  !n N. FINITE { f | (euclid n f) /\\\n       (!i. (?j. (abs(f i) = &.j) /\\ (j <=| N)))}
      #|  &.0 < s' ==> &.0 <=. s'
      #|  s' = inv(s)
      #|  j:num
      #|  abs s = s
      #|  i:num
      #|  &.0 < s ==> ~(s = &.0)
      #|  inv(s) *# c
      #|  c:num->real
      #|  !a b. ((b:A->bool) SUBSET a) ==> (FINITE a ==> FINITE b)
      #|  map:(num->real)->(num->real)
      #|  M:num
      #|  n:num
      #|  M:num
      #|  inv(s)*(&.N)
      #|  map  = ( *# ) s
      #|  !n N s. (&.0 <. s) ==> FINITE {x | euclid n x /\\ (!i. (?j. abs(x i) = s*(&.j)) /\\ (abs(x i) <=. (&.N) ) ) }
      #|  cube:(num->real)->bool
      #|  m = n*|n +| n
      #|  !x. (&.0 <=. x) ==> (sqrt(x) pow 2 = x)
      #|  &.0 <=. &.n
      #|  a*b*c = (a*b)*c
      #|  ~(&.(n+1) = &.0)
      #|  &.n +. &.1
      #|  (t < e *(&.1)) ==> (t <. e)
      #|  b < c ==> ((a<=b) ==> (a < c))
      #|  !u. ~(&.0 <=. u) ==> (&.0 <=. (--. u))
      #|  x+. y = (x -. (--. y))
      #|  --x - y = --(x+.y)
      #|  x':real
      #|  !x. &.0 <=. x ==> abs(&.(cs x)*.s -. x) <=. s
      #|  !x a b. a <=. x /\\ x <. b ==> abs(a - x) <= b -a
      #|  d_euclid cx x <= sqrt(&.n)*s
      #|  &.0 < x ==> &. 0 <=. x
      #|  &.0 <= x ==> (abs x = x)
      #|  !v. (-- v <=. abs(v))
      #|  i:num
      #|  !x. ~(&.0 <= x) ==> (&.0 <= --. x)
      #|  --. (x (i:num))
      #|  &.0 < x ==> &. 0 <=. x
      #|  &.0 <= x ==> (abs x = x)
      #|  ((cs:real->num) (--. (x (i:num))))
      #|  &.0 <= x ==> (abs x = x)
      #|  i:num
      #|  (x:num->real) i
      #|  (&.0 <=. &.(cs ((x:num->real) i)) * s)
      #|  ((cs:real->num) (x (i:num)))
      #|  q = (&.a)*. s
      #|  &.0 <=. &.a *s
      #|  (a:num) = (cs (&.0))
      #|  &.0
      #|  cx IN (euclid n)
      #|  euclid n x
      #|  open_ball(cube,d_euclid) cx eps
      #|  cx:num->real
      #|  cx = \\ (i:num) . if (&.0 <=. (x i)) then &(cs (x i))* s else --. (&.(cs (--. (x i))) * s )
      #|  cs:real->num
      #|  s:real
      #|  cent SUBSET (cube:(num->real)->bool)
      #|  IMAGE (\\c. open_ball(cube,d_euclid) c eps) cent
      #|  cube = {x | euclid n x /\\ (!i. abs(x i) <=. (&.N))}
      #|  FINITE (cent:(num->real)->bool)
      #|  &.0 < s
      #|  s = eps/(&.n +. &.1)
      #|  &.0 <. (&.n +. &.1)
      #|  cent = {x | euclid n x /\\ (!i. (?j. abs(x i) = (eps/(&.n+. &.1))*(&.j)) /\\ (abs(x i) <=. (&.N) ) ) }
      #|  !n N. totally_bounded\n        ({x | euclid n x /\\ (!i. abs(x i) <=. (&.N))},d_euclid)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  m:num
      #|  E= open_ball(X,d) (a:A) eps 
      #|  a = (x:(A->bool)->A) b
      #|  b:A->bool
      #|  a = (x:(A->bool)->A) x'
      #|  (x:(A->bool)->A) x'
      #|  x':(A->bool)
      #|  x':A->bool
      #|  FINITE (IMAGE (x:(A->bool)->A) B)
      #|  C' SUBSET (IMAGE (x:(A->bool)->A) B)
      #|  C':A->bool
      #|  C'={z | (X (z:A)) /\\ (?b. (B (b:A->bool)) /\\ (z = x b))}
      #|  eps:real
      #|  !X d  . metric_space ((X:A->bool),d) /\\ (totally_bounded (X,d))\n   ==> (!eps. (&.0 < eps) ==> (?C. (C SUBSET X) /\\ (FINITE C) /\\ (X = UNIONS (IMAGE (\\x. open_ball(X,d) x eps) C))))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !X d x y r. (open_ball(X,d) x r y) ==> (d (x:A) y <. r)
      #|  (X:A->bool) x'
      #|  x:A
      #|  (x':A)
      #|  (CHOICE (X:A->bool))
      #|  d (CHOICE (X:A->bool)) (x':A) IN (dset:real->bool)
      #|  a +. &.1
      #|  FINITE (dset:real->bool)
      #|  (dset:real->bool) = IMAGE (\\c. (d (CHOICE (X:A->bool)) (c:A))) C
      #|  (X:A->bool) = EMPTY
      #|  CHOICE (X:A->bool)
      #|  &.1
      #|  !(X:A->bool) d. metric_space(X,d) /\\ totally_bounded (X,d) ==>\n    (?a r. X SUBSET (open_ball(X,d) a r))
      #|  x:A
      #|  (n+|2) = 1 + (SUC n)
      #|  &.0 <. r ==> ~(r = &.0)
      #|  &.2 *.r = r*. (&.2)
      #|  (b = c) ==> ((a<. b) ==> (a<c))
      #|  b:A->bool
      #|  (X x) /\\ (X (y:A))
      #|  s' = (CHOICE (J:num->bool))
      #|  J (CHOICE (J:num->bool))
      #|  CHOICE (J:num->bool)
      #|  J = ({i | (C INTER b) ((f:num->A) i)} INTER {i | s <| i})
      #|  ~(FINITE ({i | (C INTER b) ((f:num->A) i)} INTER {i | s <| i}))
      #|  C INTER (b:A->bool)
      #|  C:A->bool
      #|  B:(A->bool)->bool
      #|  f:num->A
      #|  UNIV:num->bool
      #|  --: (&: (n+| 2))
      #|  r*twopow(--: (&:(n+| 2)))
      #|  !(X:A->bool) d f C s n r.\n   metric_space(X,d) /\\ (totally_bounded(X,d)) /\\ (sequence X f) /\\\n   (C SUBSET X) /\\ (&.0 < r) /\\\n   (~FINITE{j| C (f j)} /\\ C(f s) /\\ (!x y. (C x /\\ C y) ==>\n       d x y <. r*twopow(--: (&:n)))) ==>\n   (? C' s'. ((C' SUBSET C) /\\ (s < s') /\\\n   (~FINITE{j| C' (f j)} /\\ C'(f s') /\\ (!x y. (C' x /\\ C' y) ==>\n        d x y <. r*twopow(--: (&:(SUC n)))))))
      #|  TAGB
      #|  !(X:A->bool) f (ss:num->num). (sequence X f) ==>\n    (sequence X (f o ss))
      #|  (c < a) ==> ((a < b) ==> (c < b))
      #|  j:num
      #|  n:num
      #|  i:num
      #|  n:num
      #|  f (sn j)
      #|  f (sn i)
      #|  e2 = R * twopow (--: (&:n))
      #|  j:num
      #|  i:num
      #|  n:num
      #|  n:num
      #|  eps:real
      #|  R:real
      #|  n:num
      #|  R'/e
      #|  !n. &.0 < &.2 pow n
      #|  !R e. ?n. (&.0 <. R)/\\ (&.0 <. e) ==> R*(twopow(--: (&:n))) <. e
      #|  !i j. (i <=| j) ==> (Cn j SUBSET (Cn i))
      #|  n:num
      #|  !n. (Cn n SUBSET X) /\\ (cond (Cn n,sn n) n)
      #|  !(n:num). ((fn n):(A->bool)#num) = (Cn n,sn n)
      #|  ((sn:num->num) 0 = 0) /\\ (Cn 0 = (X:A->bool))
      #|  Cn = (\\i. FST ((fn:num->(A->bool)#num) i))
      #|  sn = (\\i. SND ((fn:num->(A->bool)#num) i))
      #|  (fn:num->(A->bool)#num) n
      #|  n:num
      #|  \\i. (SND ((fn : num->(A->bool)#num) i))
      #|  cs':(((A->bool)#num)->(num->(A->bool)#num))
      #|  ((X:A->bool),0)
      #|  (C':A->bool,s':num)
      #|  cs:(A->bool)#num
      #|  !cs n. ?cs' . (FST cs SUBSET X) /\\ (cond cs n)==>( (FST cs' SUBSET (FST cs)) /\\(SND cs <| ((SND:((A->bool)#num)->num) cs') /\\ (cond cs' (SUC n))) )
      #|  &.0 <. R
      #|  { j | (X:A->bool) (f j) } = (UNIV:num->bool)
      #|  !x. X((f:num->A) x)
      #|   (X SUBSET X) /\\ (cond ((X:A->bool),0) 0)
      #|  R = (&.2)*r'
      #|  cond = (\\ ((C:A->bool),(s:num)) n. ~FINITE{j| C (f j)} /\\ (C(f s)) /\\ (!x y. (C x /\\ C y) ==> d x y <. (&.2*.r')*. twopow(--: (&:n))))
      #|  y:A
      #|  x:A
      #|  ( !(x:A) y.  (X x) /\\ (X y) ==> (d x y <. &.2 *. r'))
      #|  open_ball(X,d) a r SUBSET open_ball(X,d) (a:A) r'
      #|  r' = &.1 +. abs(r)
      #|  &.0 <. (&.1 + abs(r))
      #|  r <. (&.1 + abs(r))
      #|  !(X:A->bool) d f. ((metric_space(X,d))/\\(totally_bounded(X,d)) /\\\n        (sequence X f)) ==>\n     (?ss. (subseq ss) /\\ (cauchy_seq(X,d) (f o ss)))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  ss:num->num
      #|  ?ss. (subseq ss) /\\ (cauchy_seq(X,d) (f o ss))
      #|  !(X:A->bool) d f. metric_space(X,d) /\\ (totally_bounded(X,d)) /\\\n     (complete (X,d)) /\\ (sequence X f)  ==>\n     ((?(ss:num->num). (subseq ss) /\\ (converge (X,d) (f o ss))))
      #|  !U Z. dense U Z <=>\n  (closure U (Z:A->bool) = UNIONS U)
      #|  hausdorff U  <=> (!x y.\n   (UNIONS U (x:A) /\\ UNIONS U y /\\ ~(x = y)) ==>\n   (?A B. (U A) /\\ (U B) /\\ (A x) /\\ (B y) /\\ (A INTER B = EMPTY)))
      #|  !U Z. (topology_ U) /\\ (dense U (Z:A->bool)) ==>\n      (Z SUBSET (UNIONS U))
      #|  B:A->bool
      #|  Z SUBSET (UNIONS U DIFF A)
      #|  !U Z. (topology_ U) /\\ (Z SUBSET (UNIONS U)) ==>\n   (dense U (Z:A->bool) <=>\n    (!A. (open_ U A) /\\ ( (A INTER Z) = EMPTY) ==> (A = EMPTY)))
      #|  z0
      #|  x
      #|  z0
      #|  z0:A
      #|  z0:A
      #|  z0:A
      #|  x IN X
      #|  r:num
      #|  eps:real
      #|  &.1
      #|  ?r. twopow(--: (&:r)) < eps
      #|  eps:real
      #|  x
      #|  ( a /\\ ~b ==> ~c) ==> (a /\\ c ==> b)
      #|  topology_ U /\\ (Z SUBSET (UNIONS U))
      #|  Z = UNIONS (IMAGE z UNIV)
      #|  U = top_of_metric (X,d)
      #|  z
      #|  UNIV:num->bool
      #|  UNIONS (IMAGE z (UNIV:num->bool))
      #|  z:A->bool
      #|  z:A->bool
      #|  (--: (&:r))
      #|  twopow (--: (&:r))
      #|  !r. ?z. (COUNTABLE z) /\\ (z SUBSET X) /\\ (X = UNIONS (IMAGE (\\x. open_ball(X,d) x (twopow(--: (&:r)))) z))
      #|  !(X:A->bool) d. (metric_space(X,d)) /\\ (totally_bounded(X,d)) ==>\n     ?Z. (COUNTABLE Z) /\\ (dense (top_of_metric(X,d)) Z)
      #|  TAGB
      #|  (a <. c) /\\ (b < c) ==> b+a < c + c
      #|  X u
      #|  y
      #|  u
      #|  y
      #|  y
      #|  u
      #|  x
      #|  open_ball(X,d) y (r/(&.2))
      #|  open_ball(X,d) x (r/(&.2))
      #|  &.0 <. r
      #|  r = d x y
      #|  x
      #|  y
      #|  x
      #|  ! (X:A->bool) d. (metric_space(X,d))==>\n    (hausdorff (top_of_metric(X,d)))
      #|  compact U (K:A->bool) <=>\n     (K SUBSET UNIONS U) /\\ (!V. (K SUBSET UNIONS V ) /\\ (V SUBSET U) ==>\n        (?W. (W SUBSET V) /\\ (FINITE W) /\\ (K SUBSET UNIONS W )))
      #|  X = UNIONS U 
      #|  W DELETE A
      #|  V' SUBSET U
      #|  X = UNIONS U 
      #|  K SUBSET UNIONS V'
      #|  V'
      #|  V' = (A INSERT V)
      #|  open_ U A
      #|  A = UNIONS U DIFF S
      #|  !U K (S:A->bool). ((topology_ U) /\\ (compact U K) /\\\n     (closed_ U S) /\\ (S SUBSET K)) ==> (compact U S)
      #|  A u
      #|  x'':A
      #|  x'
      #|  b' = UNIONS (IMAGE B kc)
      #|  a' = INTERS (IMAGE A kc)
      #|  u
      #|  u
      #|  A u
      #|  K x''
      #|  x''
      #|  A x''
      #|  x''
      #|  (a ==> ~b )==> ~(a /\\ b)
      #|  INTERS (IMAGE A kc) INTER (UNIONS (IMAGE B kc)) = EMPTY
      #|  INTERS (IMAGE A kc)
      #|  ~(kc = EMPTY)
      #|  C:A->bool
      #|  K = EMPTY
      #|  kc:A->bool
      #|  y:A
      #|  K SUBSET UNIONS (IMAGE B K) /\\ IMAGE B K SUBSET U
      #|  IMAGE B K
      #|  !y. (K y) ==> (?A B. (U A /\\ U B /\\ A x /\\ B y /\\ (A INTER B = {})))
      #|  C = UNIONS U DIFF K
      #|  !U (K:A->bool). (topology_ U) /\\ (hausdorff U) /\\ (compact U K) ==>\n     (closed_ U K)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  x':A
      #|  W SUBSET top_of_metric (X,d)
      #|  W
      #|  IMAGE (\\x. open_ball (X,d) x eps) X SUBSET open_balls(X,d)
      #|  IMAGE (\\x. open_ball (X,d) x eps) X SUBSET top_of_metric (X,d)
      #|  open_ball (X,d) x eps
      #|  x
      #|  X SUBSET UNIONS (IMAGE (\\x. open_ball (X,d) x eps) X)
      #|  IMAGE (\\x. open_ball(X,d) x eps) X
      #|  !(X:A->bool) d.( metric_space(X,d)) /\\ (compact (top_of_metric(X,d)) X)\n    ==> (totally_bounded (X,d))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  V u
      #|  u
      #|  S
      #|  S:A->bool
      #|  UNIONS (IMAGE (\\r. UNIONS U DIFF r) s') x
      #|  UNIONS W x
      #|  UNIONS U x
      #|  s'
      #|  V SUBSET {EMPTY}
      #|  u
      #|  !u. V u ==> (u = EMPTY)
      #|  V
      #|  UNIONS {} DIFF u
      #|  u
      #|  V = {}
      #|  s'={}
      #|  UNIONS U DIFF a
      #|  a
      #|  x
      #|  UNIONS U SUBSET UNIONS (IMAGE (\\r. UNIONS U DIFF r) V)
      #|  x'
      #|  IMAGE (\\r. UNIONS U DIFF r) V SUBSET U
      #|  IMAGE (\\r. ((UNIONS U) DIFF r)) V
      #|  !U V . (topology_ U) /\\ (compact U (UNIONS U)) /\\ (INTERS V = EMPTY) /\\\n        (!(u:A->bool). (V u) ==> (closed_ U u))\n    ==> (?W. (W SUBSET V) /\\ (FINITE W) /\\ (INTERS W = EMPTY))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  cond
      #|  sn
      #|  Cn
      #|  R
      #|  n:num
      #|  !n. (Cn n SUBSET X) /\\ (cond (Cn n,sn n) n)
      #|  !(n:num). ((fn n):(A->bool)#num) = (Cn n,sn n)
      #|  ((sn:num->num) 0 = 0) /\\ (Cn 0 = (X:A->bool))
      #|  Cn = (\\i. FST ((fn:num->(A->bool)#num) i))
      #|  sn = (\\i. SND ((fn:num->(A->bool)#num) i))
      #|  (fn:num->(A->bool)#num) n
      #|  n:num
      #|  cs':(((A->bool)#num)->(num->(A->bool)#num))
      #|  ((X:A->bool),0)
      #|  (C':A->bool,s':num)
      #|  cs:(A->bool)#num
      #|  !cs n. ?cs' . (FST cs SUBSET X) /\\ (cond cs n)==>( (FST cs' SUBSET (FST cs)) /\\(SND cs <| ((SND:((A->bool)#num)->num) cs') /\\ (cond cs' (SUC n))) )
      #|  &.0 <. R
      #|  { j | (X:A->bool) (f j) } = (UNIV:num->bool)
      #|  !x. X((f:num->A) x)
      #|   (X SUBSET X) /\\ (cond ((X:A->bool),0) 0)
      #|  R = (&.2)*r'
      #|  cond = (\\ ((C:A->bool),(s:num)) n. ~FINITE{j| C (f j)} /\\ (C(f s)) /\\ (!x y. (C x /\\ C y) ==> d x y <. (&.2*.r')*. twopow(--: (&:n))))
      #|  y:A
      #|  x:A
      #|  ( !(x:A) y.  (X x) /\\ (X y) ==> (d x y <. &.2 *. r'))
      #|  open_ball(X,d) a r SUBSET open_ball(X,d) (a:A) r'
      #|  r' = &.1 +. abs(r)
      #|  &.0 <. (&.1 + abs(r))
      #|  r <. (&.1 + abs(r))
      #|  !(X:A->bool) d f. ((metric_space(X,d))/\\(totally_bounded(X,d)) /\\\n        (sequence X f)) ==>\n    (?R Cn sn cond.\n       (&0 < R) /\\\n       (!x y. X x /\\ X y ==> d x y < R) /\\\n       (cond (X,0) 0) /\\\n       (sn 0 = 0) /\\ (Cn 0 = X) /\\\n       (!n. Cn n SUBSET X /\\ cond (Cn n,sn n) n) /\\\n       (!n. Cn (SUC n) SUBSET Cn n /\\ sn n <| sn (SUC n)) /\\\n       (((\\ (C,s). \\n.\n            (~FINITE {j | C (f j)}) /\\\n            (C (f s)) /\\\n           (!x y. (C x /\\ C y) ==> d x y < R * (twopow (--: (&:n))))) =\n       cond)\n    ))
      #|  TAGB
      #|  TAGB
      #|  c = d x (f i)
      #|  b = d x (f (s (n +| n')))
      #|  a = d (f (s (n +| n'))) (f i)
      #|  eps:real
      #|  f i
      #|  f (s(n +| n'))
      #|  x
      #|  d
      #|  X
      #|  n' <=| n +| n'
      #|  n +| n'
      #|  n' <=| s (n +| n')
      #|  i
      #|  s(n +| n')
      #|  n  <=| n +| n'
      #|  n +| n'
      #|  n'
      #|  eps/(&.2)
      #|  eps/(&.2)
      #|  x
      #|  !(X:A->bool) d f s. (metric_space(X,d)) /\\\n    (cauchy_seq (X,d) f) /\\ (subseq s) /\\\n    (converge(X,d) (f o s)) ==> (converge(X,d) f)
      #|  TAGB
      #|  r = R * twopow (--: (&:n))
      #|  ((f o sn) i)  IN closed_ball (X,d) (f (sn n)) (R * twopow (--: (&:n)))
      #|  i:num
      #|  Cn i SUBSET Cn n
      #|  x <. y ==> x <=. y
      #|  n:num
      #|  Cn n SUBSET closed_ball (X,d) (f (sn n)) (R * twopow (--: (&:n)))
      #|  n:num
      #|  closed_ball (X,d) (f (sn n)) (R * twopow (--: (&:n)))
      #|  x <= a ==> ((a < b) ==> (x < b))
      #|  &0 < &2 * R 
      #|  n
      #|  eps
      #|  (&.2)*R
      #|  0
      #|  closed_ball (X,d) (f (sn 0)) (R * twopow (--: (&:0)))
      #|  u
      #|  a:num
      #|  Cn a SUBSET Cn m
      #|  x <. y ==> x <=. y
      #|  m:num
      #|  Cn m SUBSET closed_ball (X,d) (f (sn m)) (R * twopow (--: (&:m)))
      #|  m:num
      #|  m:num
      #|  t
      #|  f (sn a) IN (INTERS W)
      #|  {z | ?n. z = closed_ball (X,d) (f (sn n)) (R * twopow (--: (&:n)))} = IMAGE (\\n. closed_ball (X,d) (f (sn n)) (R * twopow (--: (&:n)))) (UNIV)
      #|  topology_ (top_of_metric (X,d)) /\\ compact (top_of_metric (X,d)) (UNIONS (top_of_metric (X,d))) /\\ (!u. {z | ?n. z = closed_ball (X,d) (f(sn n)) (R * twopow (--: (&:n)))} u ==> closed_ (top_of_metric (X,d)) u)
      #|  {z | ?n. z = closed_ball (X,d) (f(sn n)) (R * twopow (--: (&:n)))}
      #|  top_of_metric(X,d)
      #|  ~(INTERS {z | ?n. z = closed_ball(X,d) (f (sn n)) (R* twopow(--: (&:n)))} =EMPTY)
      #|  sn
      #|  !(X:A->bool) d. metric_space(X,d) /\\\n     (compact (top_of_metric(X,d)) X) ==>\n     (complete(X,d))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  \\ (z,n). A z n
      #|  S
      #|  x
      #|  t
      #|  n + 1
      #|  z
      #|  S (z,n +| 1)
      #|  n+1
      #|  z
      #|  open_ball (X,d) z (twopow (--: (&:(n +| 1)))) SUBSET (open_ball (X,d) x (twopow (--: (&:n))))
      #|  t
      #|  n + 1
      #|  z
      #|  A z (n+1)
      #|  (z,n+1)
      #|  open_ball (X,d) z (twopow (--: (&:(n +| 1)))) x
      #|  X z
      #|  B = open_ball (X,d) x (twopow (--: (&:(n +| 1))))
      #|  ?z. (Z z) /\\ (open_ball(X,d) x (twopow (--: (&:(n+1)))) z)
      #|  open_ball (X,d) x (twopow (--: (&:(n +| 1)))) x
      #|  (open_ball(X,d) x (twopow (--: (&:(n+1)))))
      #|  (--: (&:n))
      #|  x
      #|  d
      #|  X
      #|  r:real
      #|  &.1
      #|  x
      #|  top_of_metric (X,d) t
      #|  x
      #|  n = SND zn
      #|  z = FST zn
      #|  zn:A#num
      #|  zn:A#num
      #|  Azn:A->bool
      #|  IMAGE (\\ (z,n). A z n) S
      #|  A
      #|  !z n. (S (z,n) ==> ?A. Z z /\\ open_ball (X,d) z (twopow (--: (&:n))) SUBSET A /\\ U A)
      #|  I:(A#num) -> (A#num)
      #|  {(z,(n:num)) | (Z z) /\\ (UNIV n)}
      #|  :A
      #|  :A#num
      #|  COUNTABLE S
      #|  S = {(z,n) | ?A. (Z z) /\\ (open_ball(X,d) z (twopow(--: (&:n))) SUBSET A) /\\ U A}
      #|  (?Z. COUNTABLE Z /\\ dense (top_of_metric (X,d)) Z)
      #|  !(X:A->bool) d U. (metric_space(X,d)) /\\ (totally_bounded(X,d)) /\\\n       (X SUBSET (UNIONS U)) /\\ (U SUBSET (top_of_metric(X,d))) ==>\n     (?V. (V SUBSET U) /\\ (X SUBSET (UNIONS V)) /\\ (COUNTABLE V))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  ss(n +| j)
      #|  j <= a /\\ a <= ss(a) ==> (j <=| (ss (a)))
      #|  j
      #|  u
      #|  UNIONS (B (ss (n+| j))) ((a o ss) (n +| j))
      #|  z = ((a o ss) (n +| j))
      #|  (ss (n +| j))
      #|  ((a o ss) (n +| j))
      #|  u ((a o ss) (n +| j) )
      #|  n<=| (n+| a)
      #|  n +| (j)
      #|  r
      #|  x
      #|  top_of_metric(X,d) u
      #|  j <=| j
      #|  j
      #|  u SUBSET (UNIONS (B j))
      #|  j <=| j
      #|  j
      #|  u
      #|  (UNIONS (B j)) x
      #|  j:num
      #|  u
      #|  x
      #|  (?ss. subseq ss /\\ converge (X,d) (a o ss))
      #|  !i. UNIONS (B i) SUBSET X
      #|  UNIONS V' SUBSET X
      #|  {u | u <=| i }
      #|  B i 
      #|  ?i . UNIONS (B i ) = X 
      #|  B = \\i. (IMAGE f { u | (u <=| i )  /\\ V' (f u)}) 
      #|  d
      #|  (?V'. (V' SUBSET V) /\\ (X SUBSET (UNIONS V')) /\\ (COUNTABLE V'))
      #|  !(X:A->bool) d . (metric_space(X,d)) /\\ (totally_bounded(X,d)) /\\\n  (complete (X,d)) ==> (compact (top_of_metric(X,d)) X)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  uniformly_continuous (f:A->B) ((X:A->bool),dX) ((Y:B->bool),dY) <=>\n  (!epsilon. ?delta. (&.0 < epsilon) ==> (&.0 <. delta) /\\\n    (!x y. (X x) /\\ (X y) /\\\n         (dX x y < delta) ==> (dY (f x) (f y) < epsilon)))
      #|  f y
      #|  f x'
      #|  f x
      #|  dY
      #|  Y
      #|  f x'
      #|  f x
      #|  dY
      #|  Y
      #|  dY (f x) (f x') = dY (f x') (f x)
      #|  Y (f x) /\\ Y (f y) /\\ Y (f x')
      #|  x
      #|  y
      #|  x'
      #|  (dY (f x) (f x') <. u0) /\\ (dY (f x') (f y) <. u0) /\\ (dY (f x) (f y) <= (dY (f x) (f x')) + (dY (f x') (f y))) ==> ((dY (f x) (f y)) < u0 + u0)
      #|  X
      #|  (u + u) <= (v +. v) ==> (u <= v)
      #|  ((u <=. v) ==> (a< u)==>(a <v))
      #|  (dX x' x <. u) /\\ (dX x y <. u) /\\ (dX x' y <= dX x' x +. dX x y) ==> (dX x' y <. u + u)
      #|  dX x' y < delta x'
      #|  x'
      #|  ((u <. v) ==> (a< u)==>(a <v))
      #|  dX x' x < delta x'
      #|  y
      #|  x
      #|  delta'/(&.2)
      #|  (FINITE ds) /\\ ( !x. (ds x) ==> (&.0 <. x) )
      #|  ds = IMAGE delta S
      #|  S:A->bool
      #|  open_ball (X,dX) x ((delta x)/(&.2))
      #|  X SUBSET UNIONS cov /\\ cov SUBSET top_of_metric (X,dX)
      #|  !x. (&.0 < (delta x)/(&.2))
      #|  cov
      #|  cov = IMAGE (\\x. open_ball (X,dX) x ((delta x)/(&.2))) X
      #|  epsilon/(&.2)
      #|  !f X dX Y dY. metric_continuous f (X,dX) (Y,dY) /\\ (metric_space(X,dX))\n    /\\ (metric_space(Y,dY)) /\\ (compact(top_of_metric(X,dX)) X) /\\\n    (IMAGE f X SUBSET Y) ==>\n    uniformly_continuous (f:A->B) ((X:A->bool),dX) ((Y:B->bool),dY)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  u'
      #|  u':B->bool
      #|  x'
      #|  V''
      #|  (?V''. V'' SUBSET V' /\\ FINITE V'' /\\ (W = IMAGE (\\v. preimage (UNIONS U) f v) V''))
      #|  cov
      #|  preimage (UNIONS U) f u
      #|  u
      #|  exists u. V' u /\\ u(f x)
      #|  f x
      #|  x
      #|  K SUBSET UNIONS cov
      #|  x'
      #|  cov SUBSET U
      #|  cov = IMAGE (\\v. preimage (UNIONS U) f v ) V'
      #|  !U V (f:A->B) K. (continuous f U V ) /\\\n      (compact U K) /\\ (IMAGE f K SUBSET (UNIONS V))\n  ==> (compact V (IMAGE f K))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  metric_bounded (X,d) <=>\n     ?(x:A) r. X SUBSET (open_ball(X,d) x r)
      #|  euclid n
      #|  d_euclid x' x = d_euclid x x'
      #|  euclid n
      #|  d_euclid x' (\\i. &.0) <=. d_euclid x' x + d_euclid x (\\i. &0)
      #|  n
      #|  euclid n (\\i. &.0)
      #|  i
      #|  (\\(i :num). &.0)
      #|  x'
      #|  n
      #|  N
      #|  N:num
      #|   (d_euclid x (\\i. &.0) +. r)
      #|  !n x r. ?N. (open_ball(euclid n,d_euclid) x r) SUBSET\n      {x | euclid n x /\\ (!i. abs (x i) <= &N)}
      #|  euclid n
      #|  {x | euclid n x /\\ (!i. abs (x i) <= &N)}
      #|  r
      #|  x
      #|  d_euclid
      #|  X
      #|  euclid n
      #|  r
      #|  x
      #|  n
      #|  !X n. (metric_bounded (X,d_euclid) /\\\n    (X SUBSET (euclid n))) ==>\n   (totally_bounded (X,d_euclid))
      #|  R = UNIONS C
      #|  C
      #|  WK
      #|  (INTER) K
      #|  V
      #|  WK:(A->bool)->bool
      #|  K SUBSET UNIONS VK /\\ VK SUBSET induced_top U K
      #|  VK
      #|  VK = IMAGE (\\b. (b INTER K)) V
      #|  x'
      #|  x'
      #|  x'
      #|  x
      #|  K SUBSET UNIONS (IMAGE u W')
      #|  W'
      #|  W':(A->bool)->bool
      #|  K
      #|  u v
      #|  v
      #|  u v
      #|  v
      #|  v:A->bool
      #|  x
      #|  K SUBSET UNIONS (IMAGE u V) /\\ IMAGE u V SUBSET U
      #|  IMAGE u V
      #|  u:(A->bool)->(A->bool)
      #|  !U (K:A->bool). (K SUBSET (UNIONS U)) ==>\n     (compact U K <=> (compact (induced_top U K) K))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  n
      #|  induced_top (top_of_metric(euclid n,d_euclid)) X = top_of_metric(X,d_euclid)
      #|  X SUBSET (UNIONS (top_of_metric (euclid n,d_euclid)))
      #|  metric_space (X,d_euclid)
      #|  top_of_metric (X,d_euclid) = induced_top (top_of_metric(euclid n,d_euclid)) X
      #|  !X n. (X SUBSET euclid n) ==>\n        (compact (top_of_metric(euclid n,d_euclid)) X <=>\n        (closed_ (top_of_metric(euclid n,d_euclid)) X /\\\n        (metric_bounded(X,d_euclid))))
      #|  epsilon
      #|  !n. metric_continuous (euclid_neg) (euclid n,d_euclid) (euclid n,d_euclid)
      #|  TAGB
      #|  VV = UNIONS V
      #|  UU = UNIONS U 
      #|  (a ==> b) ==> ((a /\\ b /\\ c) <=> (a /\\ c ))
      #|  U {x | UNIONS U x /\\ UNIONS V (f x) /\\ w (g (f x))} = U {x | UNIONS U x /\\ w (g (f x))}
      #|  {x | UNIONS V x /\\ w (g x)}
      #|  w 
      #|  w :C->bool
      #|  !(f:A->B) (g:B->C) U V W.\n      continuous f U V /\\ continuous g V W /\\\n      (IMAGE f (UNIONS U) SUBSET (UNIONS V)) ==>\n     continuous (g o f) U W
      #|  f y 0
      #|  x'
      #|  t = sup P
      #|  x
      #|  B = IMAGE f K
      #|  B ==> (~(A /\\ ~B))
      #|  y <. x ==> ((t - y <. u) ==> (t <. u + x))
      #|  1 <=| m <=> (~(0=m))
      #|  1 <=| m <=> (~(0=m))
      #|  (euclid 1 DIFF IMAGE f K) (u *# (dirac_delta 0))
      #|  u
      #|  u:real
      #|  &.0 < x ==> (t - x < t)
      #|  t - r / &2 < t
      #|  t - (r/(&.2)) 
      #|  &.0 < x ==> (&.0 <= x)
      #|  t - (t - (r/(&.2))) = r/(&.2)
      #|  t*(&.0) = (&.0)
      #|  1 <=| m ==> (~(0=m))
      #|  t*(&.0) = (&.0)
      #|  1 <=| m ==> (~(0=m))
      #|  euclid 1 z /\\ euclid 1 ((t - r / &2) *# dirac_delta 0) /\\ d_euclid z ((t - r / &2) *# dirac_delta 0) < r
      #|  (t- (r/(&.2)))*# (dirac_delta 0)
      #|  z
      #|  1 <=| m ==> (~(0=m))
      #|  (euclid 1 DIFF (IMAGE f K)) z
      #|  z = t *# dirac_delta 0
      #|  1
      #|  t *# (dirac_delta 0)
      #|  ~ (IMAGE f K) (t *# (dirac_delta 0))
      #|  u
      #|  ~(x <. x)
      #|  t
      #|  ~(x <. x)
      #|  t
      #|  s 
      #|  ~(s=t) ==> (s<. t) \\/ (t <. s)
      #|  s = t
      #|  (!u. (P u) ==> (u <=. sup P)) /\\ (P (sup P))
      #|  (d_euclid x0 (f x) = abs (x0 0 - (f x 0)))
      #|  fx
      #|  x
      #|  x:A
      #|  fx:num->real
      #|  x0 0 +. r
      #|  r:real
      #|  x0:num->real
      #|  u
      #|  f u 0
      #|  (?s. !y. (?x. P x /\\ y <. x) <=> y <. s)
      #|  P = (IMAGE (coord 0) (IMAGE f K))
      #|  euclid 1 = UNIONS (top_of_metric (euclid 1,d_euclid))
      #|  !(f:A->(num->real)) U K.\n       (continuous f U (top_of_metric(euclid 1,d_euclid))) /\\\n       (IMAGE f K SUBSET (euclid 1)) /\\\n        (compact U K) /\\ ~(K=EMPTY)==>\n     (?x. K x /\\ (!y. (K y) ==> (f y 0 <= f x 0)))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  homeomorphism (f:A->B) U V <=>\n  (BIJ f (UNIONS U) (UNIONS V) ) /\\ (continuous f U V) /\\\n  (!A. (U A) ==> (V (IMAGE f A)))
      #|  (UNIONS U x)
      #|  INV f (UNIONS U) (UNIONS V) t = x
      #|  x
      #|  (INV f (UNIONS U) (UNIONS V) t)
      #|  t:B
      #|  { x | UNIONS V x /\\ u (INV f (UNIONS U) (UNIONS V) x)} = IMAGE f u
      #|  u:A->bool
      #|  !f U V. homeomorphism (f:A-> B) U V ==>\n    (continuous (INV f (UNIONS U) (UNIONS V)) V U)
      #|  (UNIONS U x)
      #|  INV f (UNIONS U) (UNIONS V) t = x
      #|  x
      #|  (INV f (UNIONS U) (UNIONS V) t)
      #|  t:B
      #|  {x | UNIONS V x /\\ A (INV f (UNIONS U) (UNIONS V) x)}= (IMAGE f A) 
      #|  A
      #|  !f U V. (BIJ (f:A->B) (UNIONS U) (UNIONS V)) /\\ (continuous f U V) /\\\n    (continuous (INV  f (UNIONS U) (UNIONS V)) V U) ==>\n     (homeomorphism f U V)
      #|  UNIONS V DIFF IMAGE f (UNIONS U DIFF A) = IMAGE f A
      #|  UNIONS U DIFF A SUBSET UNIONS U /\\ U (UNIONS U DIFF (UNIONS U DIFF A))
      #|  UNIONS U DIFF A
      #|  IMAGE f (UNIONS U DIFF B) = (UNIONS V DIFF IMAGE f B)
      #|  UNIONS U DIFF B
      #|  y:B
      #|  !(f:A->B) U V. (topology_ U) /\\ (topology_ V) /\\\n     (BIJ f (UNIONS U) (UNIONS V)) ==>\n     ((!A. (U A ==> V (IMAGE f A))) <=>\n    (!B. (closed_ U B) ==> (closed_ V (IMAGE f B))))
      #|  U
      #|  B
      #|  UNIONS U
      #|  U
      #|  !f U V. (BIJ (f:A->B) (UNIONS U) (UNIONS V)) /\\ (continuous f U V) /\\\n    (compact U (UNIONS U)) /\\ (hausdorff V) /\\ (topology_ U) /\\\n    (topology_ V) ==> (homeomorphism f U V)
      #|  d_real x y = ||. (x -. y)
      #|  metric_space (UNIV,d_real)
      #|  (a <=. b) ==> ((b <. e) ==> (a <. e))
      #|  epsilon
      #|  n
      #|  i
      #|  !i  n . IMAGE (coord i) (euclid n) SUBSET (UNIV) /\\ metric_space (euclid n,d_euclid) /\\ metric_space (UNIV,d_real)
      #|  !i  n. continuous (coord i)\n    (top_of_metric (euclid n,d_euclid))\n    (top_of_metric (UNIV,d_real))
      #|  TAGB
      #|  (a+b) * C + (b - a) * C = b *(&.2*C)
      #|  (a+ b) /(&.2) + (b - a)/(&.2) = b
      #|  (a+b)*C - (b-a)*C  = a*(&.2*C) 
      #|  (a + b) / &2 - (b - a) / &2 = a
      #|  ((x <=. u + v) <=> (x - v <=. u)) /\\ ((x - u <= v) <=> (x <=. v + u))
      #|  ((a = d) /\\ (b = C))    ==> ((a /\\ b) <=> (C /\\ d))
      #|  t = x 0
      #|  euclid 1 z
      #|  z = ((a + b) / &2 *# dirac_delta 0)
      #|  (a ==> (b <=> d /\\ c))  ==> (a /\\ b <=> d /\\ a /\\ c)
      #|  ((b -a)/(&.2))
      #|  ((a +b)/(&.2)) *# (dirac_delta 0)
      #|  !a b . ? x r. (a <=. b) ==>\n   ({x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b} =\n    (closed_ball(euclid 1,d_euclid)) x r)
      #|  ~(b /\\ C) ==> ~( a /\\ b/\\ C)
      #|  t = x 0 
      #|  {x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b}= EMPTY 
      #|  b
      #|  a
      #|  a <=. b
      #|  !a b. closed_ (top_of_metric (euclid 1,d_euclid))\n {x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b}
      #|  ~(b /\\ C) ==> ~( a /\\ b/\\ C)
      #|  t = x 0 
      #|  {x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b} = EMPTY
      #|  &.0 <=. r
      #|  s = x' 0
      #|  t = x 0
      #|  r + (&.1) 
      #|  x
      #|  a <=. b
      #|  b
      #|  a
      #|  !a b. metric_bounded\n    ({x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b},d_euclid)
      #|  {x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b} SUBSET (euclid 1)
      #|  !a b. compact (top_of_metric(euclid 1,d_euclid))\n    {x | (euclid 1 x) /\\ (a <=. (x 0)) /\\ (x 0 <= b)}
      #|  x *# (dirac_delta 0)
      #|  !a b. {x | a <=. x /\\ (x <= b)} =\n    IMAGE (coord 0) {x | euclid 1 x /\\ a <= x 0 /\\ x 0 <= b}
      #|  (top_of_metric (euclid 1,d_euclid))
      #|  !a b. compact (top_of_metric (UNIV,d_real))\n        {x | a <=. x /\\ (x <=. b)} 
      #|  open_ball (UNIV,d_real) x (a - x)
      #|   {x | x < a}
      #|  top_of_metric (UNIV,d_real)
      #|  !a. top_of_metric(UNIV,d_real ) { x | x <. a}
      #|  open_ball (UNIV,d_real) x (x -. a)
      #|   {x | a <. x}
      #|  top_of_metric (UNIV,d_real)
      #|  !a. top_of_metric(UNIV,d_real ) { x | a <. x}
      #|  joinf (f:real -> A)  g a =\n  (\\ x . (if (x <. a) then (f x) else (g x)))
      #|  preimage (UNIONS (top_of_metric (UNIV,d_real))) g v
      #|  {x | a < x}
      #|  v
      #|  v
      #|  d_real 
      #|  UNIV:real -> bool
      #|  a < x'' ==> (~(x'' <. a))
      #|  a < x'' ==> (~(x'' <. a))
      #|  B
      #|  B = { x | a <. x } INTER (preimage (UNIONS (top_of_metric (UNIV,d_real))) g v)
      #|  preimage (UNIONS (top_of_metric (UNIV,d_real))) f v
      #|  {x | x < a}
      #|  v
      #|  v
      #|  d_real 
      #|  UNIV:real -> bool
      #|  B
      #|  B = { x | x <. a } INTER (preimage (UNIONS (top_of_metric (UNIV,d_real))) f v)
      #|  v
      #|  v
      #|  d_real 
      #|  UNIV:real -> bool
      #|  ~(a<. a)
      #|  B
      #|  B = (preimage (UNIONS (top_of_metric (UNIV,d_real))) f  v) INTER (preimage (UNIONS (top_of_metric (UNIV,d_real)))  g v)
      #|  (x = a) \\/ (x <. a) \\/ (a <. x)
      #|  (preimage (UNIONS (top_of_metric (UNIV,d_real))) (joinf f g a) v)
      #|  top_of_metric (UNIV,d_real)
      #|  !U a  (f:real -> A) g.\n   (continuous f (top_of_metric(UNIV,d_real)) U) /\\\n   (continuous g (top_of_metric(UNIV,d_real)) U) /\\\n   (f a = (g a)) ==>\n   ( (continuous (joinf f g a) (top_of_metric(UNIV,d_real)) U))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  epsilon
      #|  IMAGE ( --. ) (UNIV) SUBSET (UNIV)
      #|  continuous ( --.)\n     (top_of_metric(UNIV,d_real)) (top_of_metric(UNIV,d_real))  
      #|  epsilon
      #|  IMAGE ( (+.) u ) (UNIV) SUBSET (UNIV)
      #|  !u. (continuous ( (+.) u))\n      (top_of_metric(UNIV,d_real)) (top_of_metric(UNIV,d_real))  
      #|  ~(x <= &.1) ==> (&.0 <. x)
      #|  epsilon / norm x
      #|  x' -. y
      #|  x' -. y
      #|  epsilon
      #|  norm x <=. &.1
      #|  euclidean x
      #|  IMAGE (\\t. (t *# x)) (UNIV) SUBSET (euclid n)
      #|  !x n. (euclid n x) ==>\n     (continuous (\\t. (t *# x)) (top_of_metric(UNIV,d_real))\n     (top_of_metric(euclid n,d_euclid)))
      #|  (top_of_metric (UNIV,d_real))
      #|  --.(--. u +. v) = (u -. v)
      #|  (\\t . (&. 1 - t) *# y) = (\\t. t *# y) o ((--.) o ((+.) (--. (&.1))))
      #|  ! x y n. (euclid n x) /\\ (euclid n y) ==>\n    (continuous (\\t. (t *# x + (&.1 - t) *# y))\n     (top_of_metric(UNIV,d_real))\n     (top_of_metric(euclid n,d_euclid)))
      #|  connected U (Z:A->bool) <=>\n   (Z SUBSET (UNIONS U)) /\\\n   (!A B. (U A) /\\ (U B) /\\ (A INTER B = EMPTY ) /\\\n    (Z SUBSET (A UNION B)) ==> ((Z SUBSET A) \\/ (Z SUBSET B)))
      #|  ~((Z2 SUBSET A) /\\ (Z1 SUBSET B))
      #|  ~((Z1 SUBSET A) /\\ (Z2 SUBSET B))
      #|  (~b ==> a)   ==> (a \\/ b)
      #|  B
      #|  A
      #|  B
      #|  A
      #|  !U (Z1:A->bool) Z2. (connected U Z1) /\\ (connected U Z2) /\\\n    ~(Z1 INTER Z2 = EMPTY) ==> (connected U (Z1 UNION Z2))
      #|  component U (x:A) y <=>\n  (?Z. (connected U Z) /\\ (Z x) /\\ (Z y))
      #|  !U (x:A). (UNIONS U x) ==> (connected U {x})
      #|  !U x. (UNIONS U x) ==> (component U x (x:A))
      #|  !U x y.  (component U x y) ==>\n   (component U (y:A) x)
      #|  Z UNION Z'
      #|  y
      #|  connected U (Z UNION Z')
      #|  !U (x:A) y z. (component U x y) /\\ (component U y z) ==>\n   (component U x z)
      #|  {x | a' <=. x /\\ x <=. b'} SUBSET {y | abs (x - y) <. e}
      #|  d ==> (a \\/ b \\/ C\\/ d)
      #|  e
      #|  x
      #|  B
      #|  {x | a' <=. x /\\ x <=. b'} SUBSET {y | abs (x - y) <. e}
      #|  C ==> (a \\/ b \\/ C\\/ d)
      #|  e
      #|  x
      #|  A
      #|  A x
      #|  d_real
      #|  UNIV:real -> bool
      #|   (A UNION B) x
      #|  &.1
      #|  b <. x
      #|  &.1
      #|  x <. a
      #|  d  ==> (a \\/ b \\/ c \\/ d)
      #|  S = {x | b' <=. x /\\ x <=. c}
      #|  R ={x | a' <=. x /\\ x <=. b'}
      #|  S = {x | b' <=. x /\\ x <=. c}
      #|  R ={x | a' <=. x /\\ x <=. b'}
      #|  c  ==> (a \\/ b \\/ c \\/ d)
      #|  (b < b' /\\ b' <=. c ==> b <. c ) /\\ (a' <=. b' /\\ b' <. a ==> a' <. a)
      #|  {x | a' <=. x /\\ x <=. b' } UNION {x | b' <=. x /\\ x <= c  } = { x | a' <=. x /\\ x <=. c }
      #|  {x | b' <=. x /\\ x <=. c  } b'
      #|  {x | a' <=. x /\\ x <=. b' } b'
      #|  b'
      #|  {x | a <=. x /\\ x <=. b} = EMPTY 
      #|  a <=. b
      #|  ~(a <. a)
      #|  b
      #|  a
      #|  ((b ==> c ) /\\ a ) ==> ((a ==> b) ==> c  )
      #|  \\ (u ,v ). ( u <. a) \\/ (b <. v) \\/ ({x | u <=. x /\\ x <=. v } SUBSET A) \\/ ({x | u <=. x /\\ x <=. v } SUBSET B)
      #|  !a b. connected (top_of_metric (UNIV,d_real))\n    {x | a <=. x /\\ x <=. b }
      #|  Z SUBSET preimage (UNIONS U) f A UNION preimage (UNIONS U) f B
      #|  (preimage (UNIONS U) f B)
      #|  (preimage (UNIONS U) f A)
      #|  B
      #|  A
      #|  !f U V Z. (continuous (f:A->B) U V) /\\\n    (IMAGE f Z SUBSET (UNIONS V)) /\\ (connected U Z) ==>\n    (connected V (IMAGE f Z))
      #|  path U x y <=>\n  (?f a b. (continuous f (top_of_metric(UNIV,d_real )) U ) /\\\n    (f a = (x:A)) /\\ (f b = y))
      #|  {x:A | F} = \\x. F
      #|  (a <=> b) ==> a ==> b
      #|  t = UNIONS U
      #|  v y
      #|  !U V y. (topology_ U)  ==>\n    (continuous (\\ (x:A). (y:B)) U V)
      #|  path_component U x y <=>\n  (?f a b. (continuous f (top_of_metric(UNIV,d_real )) U ) /\\ (a <. b) /\\\n    (f a = (x:A)) /\\ (f b = y) /\\\n    (IMAGE f { t | a <=. t /\\ t <=. b } SUBSET (UNIONS U)))
      #|  &.1
      #|  &.0
      #|  (\\ (t:real). x)
      #|  d_real
      #|  UNIV:real ->bool
      #|  !U x.  (UNIONS U x) ==> (path_component U x (x:A))
      #|  --. x''
      #|  x'
      #|  (top_of_metric (UNIV,d_real))
      #|  --. a
      #|  --. b
      #|  f o (--.)
      #|  !U x y . (path_component U x (y:A)) ==> (path_component U y (x:A))
      #|  !U x y . (path_component U x (y:A)) <=> (path_component U y (x:A))
      #|  ~(x' +. b -. a' <. b)
      #|  x' +. b -. a'
      #|  (a' <. b') /\\ (a <. b) /\\ (b <=. x') /\\ (x' <=. b' +. b -. a')
      #|  a' -. b +. x'
      #|  ~(x' <. b)
      #|  t:A
      #|  IMAGE (joinf f (f' o (+.) (a' -. b)) b) {t | b <=. t /\\ t <=. b' + b -. a'}  = IMAGE f' {t | a' <=. t /\\ t <=. b'}
      #|  a <. b ==> a<=. b
      #|  IMAGE f {t | a <=. t /\\ t <. b} SUBSET IMAGE f {t | a <=. t /\\ t <=. b} 
      #|  x'
      #|  t:A
      #|  IMAGE (joinf f (f' o (+.) (a' -. b)) b) {t | a <=. t /\\ t <. b} = IMAGE f {t | a <=. t /\\ t <. b}
      #|  (a' <. b') /\\ (a <. b)
      #|  (a <=. b) /\\ (b <=. (b' + b - a'))
      #|   a' -. b +. b' +. b -. a' = b'
      #|  (a' <. b') /\\ (a <. b)
      #|  ~(b' +. b -. a' <. b)
      #|  (top_of_metric (UNIV,d_real))
      #|  b' +. (b - a')
      #|  a
      #|  joinf f (f' o ((+.) (a' -. b))) b
      #|  !U x y (z:A). (path_component U x y) /\\ (path_component U y z) ==>\n  (path_component U x z)
      #|  loc_path_conn U <=>\n  !A x. (U A) /\\ (A (x:A)) ==>\n       (U (path_component (induced_top U A) x))
      #|  A x
      #|  x
      #|  path_component U x'
      #|  x'
      #|  A x'
      #|  x''
      #|  (UNIONS U)
      #|  (IMAGE (\\z. path_component U z) (Z DIFF A))
      #|  EMPTY:A->bool
      #|  EMPTY:A->bool
      #|  UNIONS U x
      #|  x
      #|  (UNIONS U)
      #|  U A /\\ U B /\\ (A INTER B = {}) /\\ Z SUBSET A UNION B
      #|  B
      #|  B = UNIONS (IMAGE (\\z. (path_component U z)) (Z DIFF A))
      #|  A = path_component U x
      #|  path_component U x
      #|  b
      #|  a
      #|  (top_of_metric (UNIV,d_real))
      #|  IMAGE f {t | a <= t /\\ t <= b}
      #|  y:A
      #|  !U (x:A). (loc_path_conn U) /\\ (topology_ U) ==>\n    (path_component U x = component U x)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (b <= a) ==> ((a < C) ==> (b < C))
      #|  (&.0 <=. t) /\\ (t <=. (&.1)) ==> (||. (&.1 - t) <=. &.1)
      #|  t *# x
      #|  (&.1 - t)*# y
      #|  (&.1 - t) *# x
      #|  n:num
      #|  !x r y t n. (open_ball(euclid n,d_euclid) x r y) /\\\n    (&.0 <=. t) /\\ (t <=. &.1) ==>\n   (open_ball(euclid n,d_euclid) x r ((t *# x + (&.1-t)*#y)))
      #|  (UNIONS (top_of_metric (open_ball (euclid n,d_euclid) x r,d_euclid))) = (open_ball(euclid n,d_euclid) x r)
      #|  euclid n x /\\ euclid n y
      #|  top_of_metric (open_ball (euclid n,d_euclid) x r,d_euclid) = (induced_top(top_of_metric(euclid n,d_euclid)) (open_ball (euclid n,d_euclid) x r))
      #|  &.1
      #|  &.0
      #|  (\\t. (t *# x + (&.1 - t) *# y))
      #|  !x r y n. (open_ball(euclid n,d_euclid) x r y) ==>\n    (path_component\n      (top_of_metric(open_ball(euclid n,d_euclid) x r,d_euclid)) y x)
      #|  b
      #|  a 
      #|  f
      #|  b <=b /\\ ((a < b) ==> (a <= b))
      #|  b <= x' ==> ~(x' < b)
      #|  a <= x' ==> (~(x' < a))
      #|  x' < b ==> x' <= b
      #|  a <= x' ==> (~(x' < a))
      #|  x' < b \\/ (b <= x')
      #|  (a <=a) /\\ ((a < b) ==> (a <= b))
      #|  x' < a \\/ (a <= x')
      #|  x'
      #|  b
      #|  a
      #|  ~(b < b)
      #|  (a < b) ==> (~(b < a))
      #|  ~(a<a)
      #|  b
      #|  a
      #|  joinf (\\t. (f a)) (joinf f (\\t. (f b)) b) a
      #|  !U x (y:A). path_component U x y <=>\n  (?f a b. (continuous f (top_of_metric(UNIV,d_real )) U ) /\\ (a <. b) /\\\n    (f a = (x:A)) /\\ (f b = y) /\\\n    (IMAGE f UNIV SUBSET (UNIONS U)))
      #|  IMAGE f UNIV SUBSET X /\\ IMAGE f UNIV SUBSET Y
      #|  metric_space(Y,d)
      #|  b
      #|  a
      #|  f
      #|  !X Y d (y:A). ((Y SUBSET X) /\\ (metric_space(X,d) /\\ (Y y))) ==>\n    ((path_component(top_of_metric(Y,d)) y) SUBSET\n      (path_component(top_of_metric(X,d)) y))
      #|  (a < b) ==> ((a<=. b) /\\ (b <= b))
      #|  b
      #|  !x (y:A) U. (path_component U x y) ==> (UNIONS U y)
      #|  !A B C. (B:A->bool) SUBSET C ==> (A SUBSET B ==> A SUBSET C)
      #|  !A B C. (A:A->bool) SUBSET B ==> (B SUBSET C ==> A SUBSET C)
      #|  !A B C. (B:A->bool) SUBSET C ==> (A SUBSET B ==> A SUBSET C)
      #|  open_ball (euclid n,d_euclid) a r SUBSET  path_component (top_of_metric ((open_ball(euclid n,d_euclid) a r),d_euclid)) a
      #|  open_ball (euclid n,d_euclid) a r SUBSET path_component (top_of_metric (A',d_euclid)) a
      #|  open_ball (A,d_euclid) a r SUBSET path_component (top_of_metric (A',d_euclid)) a
      #|  r
      #|  a
      #|  A
      #|  top_of_metric(euclid n,d_euclid) A'
      #|  A SUBSET (euclid n)
      #|  A' a
      #|  b <=. b /\\ ((a < b)==> (a <=. b))
      #|  b
      #|  metric_space(A',d_euclid)
      #|  A' SUBSET A
      #|  euclid n
      #|  metric_space (A,d_euclid)
      #|  !n A. (top_of_metric(euclid n,d_euclid)) A ==>\n   (loc_path_conn (top_of_metric(A,d_euclid)))
      #|  !n A . (top_of_metric(euclid n,d_euclid)) A ==>\n     (path_component (top_of_metric(A,d_euclid)) =\n      component (top_of_metric(A,d_euclid)))
      #|Q_ELIM_THM =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\P:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\R:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('B,bool),bool) (\u:'B. ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) u:'B) (P:fun('A,'B) x:'A))) (Q:fun('A,bool) x:'A))))) (R:fun('B,bool) u:'B))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) (R:fun('B,bool) (P:fun('A,'B) x:'A))))))))))))
      #|Q_ELIM_THM' =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\Q:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\R:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#!:fun(fun('B,bool),bool) (\t:'B. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('B,fun('B,bool)) t:'B) (Q:fun('A,'B) x:'A)))))) (R:fun('B,bool) t:'B))))) (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (R:fun('B,bool) (Q:fun('A,'B) x:'A))))))))))))
      #|Q_ELIM_THM'' =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\Q:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\R:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#!:fun(fun('B,bool),bool) (\t:'B. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) t:'B) (Q:fun('A,'B) x:'A))) (P:fun('A,bool) x:'A))))) (R:fun('B,bool) t:'B))))) (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (R:fun('B,bool) (Q:fun('A,'B) x:'A))))))))))))
      #|DIFF_SUBSET =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) B:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) X:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) #EMPTY:fun('A,bool))))))))))
      #|SUBSET_INTERS =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\X:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) X:fun(fun('A,bool),bool)))) (#!:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (X:fun(fun('A,bool),bool) x:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) x:fun('A,bool))))))))))
      #|DIFF_INTER =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) C:fun('A,bool))) #EMPTY:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) C:fun('A,bool))) B:fun('A,bool)))))))))
      #|SUB_IMP_INTER =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) C:fun('A,bool))) B:fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) C:fun('A,bool)) A:fun('A,bool))) B:fun('A,bool))))))))))
      #|SUBSET_UNIONS_INSERT =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) B:fun('A,bool)) C:fun(fun('A,bool),bool))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) C:fun(fun('A,bool),bool))))))))))
      #|UNIONS_DELETE2 =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) C:fun('A,bool))) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) B:fun(fun('A,bool),bool)) C:fun('A,bool)))))))))))
      #|finite_subset =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) B:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool)))) (#FINITE:fun(fun('B,bool),bool) B:fun('B,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) C:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) B:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) C:fun('A,bool))))))))))))))
      #|inters_singleton =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) A:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) A:fun('A,bool))))
      #|delete_empty =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) A:fun('A,bool)) x:'A)) #EMPTY:fun('A,bool))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool)))))))))
      #|inters_subset =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) A:fun(fun('A,bool),bool)) B:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))))))))
      #|delete_inters =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (V:fun(fun('A,bool),bool) u:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) V:fun(fun('A,bool),bool)) u:fun('A,bool)))) u:fun('A,bool))))))))
      #|EQ_EMPTY =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) #EMPTY:fun('A,bool))) (#!:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) (A:fun('A,bool) x:'A)))))))
      #|UNIONS_EQ_EMPTY =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #EMPTY:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))))))
      #|INTERS_EQ_EMPTY =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) (#!:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (A:fun(fun('A,bool),bool) a:fun('A,bool))) (#~:fun(bool,bool) (a:fun('A,bool) x:'A))))))))))
      #|CARD_SING_CONV =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) X:fun('A,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#SING:fun(fun('A,bool),bool) X:fun('A,bool)))))
      #|countable_prod =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) A:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) B:fun('B,bool)))) (#COUNTABLE:fun(fun(prod('A,'B),bool),bool) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%418:prod('A,'B). (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun('B,bool),bool) (\b:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%418:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) (A:fun('A,bool) a:'A)) (B:fun('B,bool) b:'B))) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B))))))))))))))
      #|IMAGE_I =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) #I:fun('A,'A)) A:fun('A,bool))) A:fun('A,bool))))
      #|EMPTY_NOT_EXISTS =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) #EMPTY:fun('A,bool))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\u:'A. (X:fun('A,bool) u:'A)))))))
      #|DIFF_SURJ =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) X:fun('A,bool)) Y:fun('B,bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) X:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) t:fun('A,bool)))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) Y:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))))
      #|union_subset =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\Z1:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z2:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) Z1:fun('A,bool)) Z2:fun('A,bool))) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z1:fun('A,bool)) A:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z2:fun('A,bool)) A:fun('A,bool))))))))))
      #|preimage_disjoint =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) A:fun('B,bool)) B:fun('B,bool))) #EMPTY:fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) B:fun('B,bool)))) #EMPTY:fun('A,bool)))))))))))
      #|preimage_union =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) B:fun('B,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) X:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))) ((#UNION:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) A:fun('B,bool)) B:fun('B,bool)))))))))))))))
      #|subset_preimage =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) X:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))) A:fun('B,bool))))))))))))
      #|preimage_unions =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\C:fun(fun('B,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) dom:fun('A,bool)) f:fun('A,'B)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) C:fun(fun('B,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun(fun('B,bool),fun('A,bool)),fun(fun(fun('B,bool),bool),fun(fun('A,bool),bool))) ((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) dom:fun('A,bool)) f:fun('A,'B))) C:fun(fun('B,bool),bool))))))))))
      #|preimage_subset =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) A:fun('B,bool)) B:fun('B,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) B:fun('B,bool))))))))))))
      #|INTER_THM =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),fun('A,bool)),bool)) (\B:fun('A,bool). ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) X:fun('A,bool)))) (#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)))) ((#=:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),fun('A,bool)),bool)) (\B:fun('A,bool). ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) B:fun('A,bool)))) (#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool))))))
      #|REAL_SUM_SQUARE_POS =  |- (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (x:fun(num,real) i:num)))))))))))
      #|twopow_pos =  |- (#!:fun(fun(int,bool),bool) (\n:int. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#twopow:fun(int,real) n:int))))
      #|twopow_double =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num))))))
      #|min_finite =  |- (#!:fun(fun(fun(real,bool),bool),bool) (\X:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) X:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) X:fun(real,bool)) #EMPTY:fun(real,bool))))) (#?:fun(fun(real,bool),bool) (\delta:real. ((#/\:fun(bool,fun(bool,bool)) (X:fun(real,bool) delta:real)) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (X:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) delta:real) x:real))))))))))
      #|min_finite_delta =  |- (#!:fun(fun(real,bool),bool) (\c:real. (#!:fun(fun(fun(real,bool),bool),bool) (\X:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) X:fun(real,bool))) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (X:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) c:real) x:real)))))) (#?:fun(fun(real,bool),bool) (\delta:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) c:real) delta:real)) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (X:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) delta:real) x:real))))))))))))
      #|union_closed_interval =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. (#!:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real))) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) ((#UNION:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%419:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%419:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) x:real)))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%420:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%420:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) c:real))) x:real))))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%421:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%421:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) c:real))) x:real)))))))))))))
      #|real_half_LT =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. (#!:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|real_half_LE =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. (#!:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|real_half_EL =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. (#!:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|real_half_LLE =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. (#!:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|interval_finite =  |- (#!:fun(fun(num,bool),bool) (\N:num. (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%425:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%425:real) (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) j:num))) ((#<=:fun(num,fun(num,bool)) j:num) N:num))))) x:real))))))))
      #|euclid_add_closure =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))))
      #|euclid_scale_closure =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) f:fun(num,real))))))))))
      #|euclid_neg_closure =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))))))))
      #|euclid_sub_closure =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))))
      #|neg_dim =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))))))))
      #|euclid_updim =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) m:num) f:fun(num,real)))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real)))))))))
      #|euclidean_add_closure =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real)))) (#euclid'euclidean:fun(fun(num,real),bool) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))
      #|euclidean_sub_closure =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real)))) (#euclid'euclidean:fun(fun(num,real),bool) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))
      #|euclidean_scale_closure =  |- (#!:fun(fun(real,bool),bool) (\s:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))))))))
      #|euclidean_neg_closure =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))))))
      #|euclid_add_comm =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) g:fun(num,real)) f:fun(num,real)))))))
      #|euclid_add_assoc =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) g:fun(num,real)) h:fun(num,real))))))))))
      #|euclid_lzero =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) #euclid'euclid0:fun(num,real)) f:fun(num,real))) f:fun(num,real))))
      #|euclid_rzero =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) #euclid'euclid0:fun(num,real))) f:fun(num,real))))
      #|euclid_ldistrib =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) f:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) g:fun(num,real))))))))))
      #|euclid_rdistrib =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(real,bool),bool) (\r:real. (#!:fun(fun(real,bool),bool) (\s:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_add:fun(real,fun(real,real)) r:real) s:real)) f:fun(num,real))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) f:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))))))))))
      #|euclid_scale_act =  |- (#!:fun(fun(real,bool),bool) (\r:real. (#!:fun(fun(real,bool),bool) (\s:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real)))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_mul:fun(real,fun(real,real)) r:real) s:real)) f:fun(num,real)))))))))
      #|euclid_scale_one =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(num,real))) f:fun(num,real))))
      #|euclid_neg_sum =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) x:fun(num,real))) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) y:fun(num,real)))) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) x:fun(num,real)) y:fun(num,real))))))))
      #|trivial_lin_combo =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(real,bool),bool) (\t:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) x:fun(num,real)))) x:fun(num,real))))))
      #|dot_euclid =  |- (#!:fun(fun(num,bool),bool) (\p:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) p:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) p:num) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) p:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))))))))
      #|dot_updim =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) m:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) m:num) g:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))))))))))
      #|dot_nonneg =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real)))))
      #|dot_comm =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) f:fun(num,real)))))))
      #|dot_neg =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))) g:fun(num,real))) (#real_neg:fun(real,real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))))))))
      #|dot_neg2 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) g:fun(num,real)))) (#real_neg:fun(real,real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))))))))
      #|dot_scale =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))) g:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_scale_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))) g:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_scale2 =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) g:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_scale2_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) g:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_linear =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))))
      #|dot_minus_linear =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_sub:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))))
      #|dot_linear_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))
      #|dot_minus_linear_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_sub:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))
      #|dot_linear2 =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_add:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_linear2_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_add:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_minus_linear2 =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_sub:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_minus_linear2_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid'euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_sub:fun(real,fun(real,real)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_rzero =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) #euclid'euclid0:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|dot_lzero =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) #euclid'euclid0:fun(num,real)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|dot_zero =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) f:fun(num,real)) #euclid'euclid0:fun(num,real)))))))
      #|dot_zero_euclidean =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#=:fun(real,fun(real,bool)) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) f:fun(num,real)) #euclid'euclid0:fun(num,real)))))
      #|norm_nonneg =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#euclid'norm:fun(fun(num,real),real) f:fun(num,real)))))
      #|norm_neg =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) (#euclid'norm:fun(fun(num,real),real) (#euclid'euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real)))) (#euclid'norm:fun(fun(num,real),real) f:fun(num,real)))))
      #|cauchy_schwartz =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) (#euclid'norm:fun(fun(num,real),real) f:fun(num,real))) (#euclid'norm:fun(fun(num,real),real) g:fun(num,real)))))))))
      #|norm_dot =  |- (#!:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#euclid'norm:fun(fun(num,real),real) h:fun(num,real))) (#euclid'norm:fun(fun(num,real),real) h:fun(num,real)))) ((#euclid'dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) h:fun(num,real)))))
      #|norm_triangle =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid'euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#euclid'norm:fun(fun(num,real),real) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_add:fun(real,fun(real,real)) (#euclid'norm:fun(fun(num,real),real) f:fun(num,real))) (#euclid'norm:fun(fun(num,real),real) g:fun(num,real)))))))))
      #|metric_space_zero =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (X:fun('A,bool) a:'A))) ((#=:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) a:'A) a:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|metric_space_symm =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun('A,bool),bool) (\b:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) a:'A)) (X:fun('A,bool) b:'A)))) ((#=:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) a:'A) b:'A)) ((d:fun('A,fun('A,real)) b:'A) a:'A)))))))))))
      #|metric_space_triangle =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun('A,bool),bool) (\b:'A. (#!:fun(fun('A,bool),bool) (\c:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) a:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) b:'A)) (X:fun('A,bool) c:'A))))) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) a:'A) c:'A)) ((#real_add:fun(real,fun(real,real)) ((d:fun('A,fun('A,real)) a:'A) b:'A)) ((d:fun('A,fun('A,real)) b:'A) c:'A))))))))))))))
      #|metric_subspace =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))))))))))
      #|metric_euclidean =  |- (#euclid'metric_space:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) #euclid'euclidean:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))
      #|metric_euclid =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#euclid'metric_space:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))
      #|euclid1_abs =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) y:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (y:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|coord_dirac =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(real,bool),bool) (\t:real. ((#=:fun(real,fun(real,bool)) ((#euclid'coord:fun(num,fun(fun(num,real),real)) i:num) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) (#dirac_delta:fun(num,fun(num,real)) i:num)))) t:real)))))
      #|dirac_0 =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) x:real) (#dirac_delta:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) x:real)))
      #|euclid1_dirac =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) x:fun(num,real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#dirac_delta:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|proj =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(num,bool),bool) (\i:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid'proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) x:fun(num,real))) (\j:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) j:num) (#NUMERAL:fun(num,num) #_0:num))) (x:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|proj_euclid1 =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#euclid'proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) x:fun(num,real)))))))
      #|d_euclid_n =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#sqrt:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))))))))))))))
      #|norm_n =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#=:fun(real,fun(real,bool)) (#euclid'norm:fun(fun(num,real),real) x:fun(num,real))) (#sqrt:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (x:fun(num,real) i:num)))))))))))
      #|proj_d_euclid =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) x:fun(num,real))) ((#euclid'proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) y:fun(num,real)))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))))))))))
      #|d_euclid_pos =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))
      #|proj_contraction =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num)))) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))))
      #|euclid_dirac =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) x:real) (#dirac_delta:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) #_0:num))))))
      #|d_euclid_pow2 =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num)))))))))))))
      #|D_EUCLID_BOUND =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(real,bool),bool) (\eps:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real))) (#!:fun(fun(num,bool),bool) (\i:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num)))) eps:real)))))) ((#real_le:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) n:num))) eps:real)))))))))))
      #|metric_translate =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) z:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) x:fun(num,real)) z:fun(num,real))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) y:fun(num,real)) z:fun(num,real)))) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))))
      #|metric_translate_LEFT =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) z:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) z:fun(num,real)) x:fun(num,real))) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) z:fun(num,real)) y:fun(num,real)))) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))))
      #|norm_scale =  |- (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(real,bool),bool) (\t':real. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#euclid'euclidean:fun(fun(num,real),bool) x:fun(num,real))) ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t':real) x:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) t:real) t':real))) (#euclid'norm:fun(fun(num,real),real) x:fun(num,real)))))))))))
      #|norm_scale_vec =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\x':fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x':fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x':fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) t:real)) ((#euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) x':fun(num,real)))))))))))))
      #|topology =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (U:fun(fun('A,bool),bool) B:fun('A,bool)))) (U:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) (U:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))))))))))))))
      #|open_DEF =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (U:fun(fun('A,bool),bool) A:fun('A,bool)))))))
      #|closed =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) B:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) B:fun('A,bool)))))))))
      #|closure =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%426:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%426:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool)))) B:fun('A,bool))))))))))))
      #|induced_top =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) ((#IMAGE:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (\B:fun('A,bool). ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) A:fun('A,bool)))) U:fun(fun('A,bool),bool)))))))
      #|open_ball =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%427:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%427:'A) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) r:real)))) y:'A))))))))))))))
      #|closed_ball =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%428:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%428:'A) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) r:real)))) y:'A))))))))))))))
      #|open_balls =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%429:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%429:fun('A,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) B:fun('A,bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real))))))) B:fun('A,bool)))))))))))
      #|top_of_metric =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%430:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%430:fun('A,bool)) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\F:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) F:fun(fun('A,bool),bool)) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) F:fun(fun('A,bool),bool))))))) A:fun('A,bool)))))))))))
      #|open_EMPTY =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)))))
      #|open_closed =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool)))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) A:fun('A,bool))))))))
      #|closed_UNIV =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))
      #|top_univ =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (U:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))
      #|empty_closed =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)))))
      #|closed_open =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) A:fun('A,bool))))))))
      #|closed_inter =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (V:fun(fun('A,bool),bool) a:fun('A,bool))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) a:fun('A,bool)))))) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))
      #|open_nbd =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#=:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (#!:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (A:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) B:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (B:fun('A,bool) x:'A)) (U:fun(fun('A,bool),bool) B:fun('A,bool)))))))))))))))
      #|open_inters =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) V:fun(fun('A,bool),bool))) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))))))) (U:fun(fun('A,bool),bool) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))
      #|top_unions =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)))) (U:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))
      #|top_inter =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (U:fun(fun('A,bool),bool) B:fun('A,bool))))) (U:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))))))))))
      #|open_ball_nonempty =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r:real)) (X:fun('A,bool) a:'A)))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|open_ball_subset =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) X:fun('A,bool))))))))))
      #|open_ball_subspace =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))))
      #|open_ball_empty =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) X:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|open_ball_intersect =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) Y:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) Y:fun('A,bool))))))))))))))
      #|open_ball_center =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun('A,bool),bool) (\b:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r:real)))) (#?:fun(fun(real,bool),bool) (\r':real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r':real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r':real)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r:real))))))))))))))))
      #|open_ball_nonempty_center =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) #EMPTY:fun('A,bool)))))))))))))
      #|open_ball_neg_radius =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#real_lt:fun(real,fun(real,bool)) r:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|open_ball_nest =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun(real,bool),bool) (\r:real. (#!:fun(fun(real,bool),bool) (\r':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) r:real) r':real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r':real)))))))))))))
      #|open_ball_inter =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\a:'A. (#!:fun(fun('A,bool),bool) (\b:'A. (#!:fun(fun('A,bool),bool) (\c:'A. (#!:fun(fun(real,bool),bool) (\r:real. (#!:fun(fun(real,bool),bool) (\r':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) a:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) b:'A)) ((#IN:fun('A,fun(fun('A,bool),bool)) c:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r':real))))))) (#?:fun(fun(real,bool),bool) (\r'':real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r'':real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) c:'A) r'':real)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r':real)))))))))))))))))))))
      #|BALL_DIST =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) x:'A)) ((((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) y:'A)))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) r:real)))))))))))))))
      #|BALL_DIST_CLOSED =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((((#euclid'closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) x:'A)) ((((#euclid'closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) y:'A)))) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) r:real)))))))))))))))
      #|open_ball_sub_closed =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)) (((#euclid'closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real))))))))))
      #|ball_symm =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) (X:fun('A,bool) y:'A)))) ((#=:fun(bool,fun(bool,bool)) ((((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real) y:'A)) ((((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) y:'A) r:real) x:'A)))))))))))))
      #|ball_subset_ball =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\z:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real) z:'A))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) r:real))))))))))))))
      #|top_of_metric_unions =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))))
      #|top_of_metric_empty =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) #EMPTY:fun('A,bool))))))
      #|top_of_metric_open =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\F:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) F:fun(fun('A,bool),bool)) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) F:fun(fun('A,bool),bool))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))))))
      #|top_of_metric_open_balls =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|open_ball_open =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)))))))))))
      #|top_of_metric_nbd =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#=:fun(bool,fun(bool,bool)) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) X:fun('A,bool))) (#!:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) A:fun('A,bool))) (#?:fun(fun(real,bool),bool) (\r:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r:real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) A:fun('A,bool)))))))))))))))))
      #|top_of_metric_inter =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) A:fun('A,bool))) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) B:fun('A,bool)))) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool)))))))))))))
      #|top_of_metric_union =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))))))))))
      #|top_of_metric_top =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))))
      #|closed_ball_closed =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (((#euclid'closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)))))))))))
      #|open_ball_nbd =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) x:'A)) ((#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) C:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) e:real)) C:fun('A,bool))))))))))))))
      #|closure_closed =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))))))))
      #|subset_closure =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))))))))
      #|closure_subset =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) B:fun('A,bool)))))))))
      #|closure_self =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) A:fun('A,bool)))))))
      #|closure_close =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) Z:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) B:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool)))))))))))))))
      #|closure_open =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) Z:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) Z:fun('A,bool))) #EMPTY:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) A:fun('A,bool))) #EMPTY:fun('A,bool)))))))))))))))
      #|image_top =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),fun('B,bool)),bool),bool) (\f:fun(fun('A,bool),fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) #EMPTY:fun('B,bool)) (f:fun(fun('A,bool),fun('B,bool)) #EMPTY:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) a:fun('A,bool)) U:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) b:fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) (f:fun(fun('A,bool),fun('B,bool)) a:fun('A,bool))) (f:fun(fun('A,bool),fun('B,bool)) b:fun('A,bool)))) (f:fun(fun('A,bool),fun('B,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) a:fun('A,bool)) b:fun('A,bool)))))))))) (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) f:fun(fun('A,bool),fun('B,bool))) V:fun(fun('A,bool),bool)))) (f:fun(fun('A,bool),fun('B,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))))) (#euclid'topology_:fun(fun(fun('B,bool),bool),bool) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) f:fun(fun('A,bool),fun('B,bool))) U:fun(fun('A,bool),bool))))))))
      #|induced_top_support =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) C:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) C:fun('A,bool)))))))
      #|induced_top_top =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) C:fun('A,bool))))))))
      #|induced_top_open =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#=:fun(bool,fun(bool,bool)) (((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) C:fun('A,bool)) A:fun('A,bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) B:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) C:fun('A,bool))) A:fun('A,bool)))))))))))))
      #|induced_trans =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))))) (U:fun(fun('A,bool),bool) B:fun('A,bool)))))))))
      #|induced_top_unions =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) U:fun(fun('A,bool),bool)))))
      #|gen =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\X:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) X:fun(fun('A,bool),bool))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%432:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%432:fun('A,bool)) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Y:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) Y:fun(fun('A,bool),bool)) X:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) Y:fun(fun('A,bool),bool))))))) A:fun('A,bool)))))))))
      #|top_of_metric_gen =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|gen_subset =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) A:fun('A,bool)) V:fun(fun('A,bool),bool))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Y:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) Y:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) Y:fun(fun('A,bool),bool))))))))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))))))))
      #|gen_subspace =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool))) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool)))))))))))
      #|gen_induced =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))))) (#euclid'gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid'open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool)))))))))))
      #|top_of_metric_induced =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real))))))))))))
      #|continuous =  |- (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (#!:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) v:fun('B,bool)) V:fun(fun('B,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) f:fun('A,'B)) v:fun('B,bool))) U:fun(fun('A,bool),bool))))))))))))
      #|metric_continuous_pt =  |- (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((((#euclid'metric_continuous_pt:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('A,bool)))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))) x:'A)) (#!:fun(fun(real,bool),bool) (\epsilon:real. (#?:fun(fun(real,bool),bool) (\delta:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) epsilon:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) delta:real)) (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) X:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) ((dX:fun('A,fun('A,real)) x:'A) y:'A)) delta:real)))) ((#real_lt:fun(real,fun(real,bool)) ((dY:fun('B,fun('B,real)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) epsilon:real)))))))))))))))))))))))
      #|metric_continuous =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). ((#=:fun(bool,fun(bool,bool)) (((#euclid'metric_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) (#!:fun(fun('A,bool),bool) (\x:'A. ((((#euclid'metric_continuous_pt:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('A,bool)))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))) x:'A))))))))))))))
      #|metric_continuous_pt_domain =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) X:fun('A,bool)))) ((((#euclid'metric_continuous_pt:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('A,bool)))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))) x:'A))))))))))))))
      #|metric_continuous_continuous =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) X:fun('A,bool))) Y:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) (#euclid'metric_space:fun(prod(fun('B,bool),fun('B,fun('B,real))),bool) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))))) ((#=:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) (#euclid'top_of_metric:fun(prod(fun('B,bool),fun('B,fun('B,real))),fun(fun('B,bool),bool)) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))))) (((#euclid'metric_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))))))))))))))
      #|continuous_induced =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (V:fun(fun('B,bool),bool) A:fun('B,bool))))) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) ((#euclid'induced_top:fun(fun(fun('B,bool),bool),fun(fun('B,bool),fun(fun('B,bool),bool))) V:fun(fun('B,bool),bool)) A:fun('B,bool))))))))))))
      #|metric_cont =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('B,bool),bool),bool) (\X:fun('B,bool). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\d:fun('B,fun('B,real)). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('B,bool),fun('B,fun('B,real))),bool) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) X:fun('B,bool)) d:fun('B,fun('B,real))))) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool)))) ((#=:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('B,bool),fun('B,fun('B,real))),fun(fun('B,bool),bool)) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) X:fun('B,bool)) d:fun('B,fun('B,real)))))) (#!:fun(fun('B,bool),bool) (\x:'B. (#!:fun(fun(real,bool),bool) (\r:real. (U:fun(fun('A,bool),bool) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) f:fun('A,'B)) (((#euclid'open_ball:fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('B,fun(real,fun('B,bool)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) X:fun('B,bool)) d:fun('B,fun('B,real)))) x:'B) r:real)))))))))))))))))
      #|continuous_sum =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,fun(num,real)),bool),bool) (\f:fun('A,fun(num,real)). (#!:fun(fun(fun('A,fun(num,real)),bool),bool) (\g:fun('A,fun(num,real)). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) f:fun('A,fun(num,real))) U:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) g:fun('A,fun(num,real))) U:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#IMAGE:fun(fun('A,fun(num,real)),fun(fun('A,bool),fun(fun(num,real),bool))) f:fun('A,fun(num,real))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#IMAGE:fun(fun('A,fun(num,real)),fun(fun('A,bool),fun(fun(num,real),bool))) g:fun('A,fun(num,real))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num))))))) (((#euclid'continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) (\t:'A. ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) (f:fun('A,fun(num,real)) t:'A)) (g:fun('A,fun(num,real)) t:'A)))) U:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))))))
      #|sequence =  |- (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) #UNIV:fun(num,bool))) X:fun('A,bool)))))))
      #|converge =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) ((#euclid'converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) X:fun('A,bool))) (#!:fun(fun(real,bool),bool) (\eps:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) i:num)) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) (f:fun(num,'A) i:num))) eps:real)))))))))))))))))))
      #|cauchy_seq =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) (#!:fun(fun(real,bool),bool) (\eps:real. (#?:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) i:num)) ((#<=:fun(num,fun(num,bool)) n:num) j:num)))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) (f:fun(num,'A) i:num)) (f:fun(num,'A) j:num))) eps:real))))))))))))))))))
      #|complete =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(bool,fun(bool,bool)) (#euclid'complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) ((#euclid'converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))))))))))
      #|converge_cauchy =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#euclid'converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))))) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))))))))
      #|cauchy_seq_cauchy =  |- (#!:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'cauchy_seq:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,fun(num,real)),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) f:fun(num,fun(num,real)))) (#cauchy:fun(fun(num,real),bool) (\x:num. ((f:fun(num,fun(num,real)) x:num) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|complete_real =  |- (#euclid'complete:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))
      #|sequence_in =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) (X:fun('A,bool) (f:fun(num,'A) i:num)))))))))
      #|proj_cauchy =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid'cauchy_seq:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,fun(num,real)),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) f:fun(num,fun(num,real)))) ((#euclid'cauchy_seq:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,fun(num,real)),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) ((#o:fun(fun(fun(num,real),fun(num,real)),fun(fun(num,fun(num,real)),fun(num,fun(num,real)))) (#euclid'proj:fun(num,fun(fun(num,real),fun(num,real))) i:num)) f:fun(num,fun(num,real)))))))))))
      #|complete_euclid =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#euclid'complete:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))
      #|subset_sequence =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) X:fun('A,bool))) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) S:fun('A,bool)) f:fun(num,'A)))) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A)))))))))
      #|subset_cauchy =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) X:fun('A,bool))) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) S:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))))))))))
      #|complete_closed =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) S:fun(fun(num,real),bool))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) S:fun(fun(num,real),bool)) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)))) (#euclid'complete:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) S:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))
      #|totally_bounded =  |- (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#!:fun(fun(real,bool),bool) (\eps:real. (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) B:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (B:fun(fun('A,bool),bool) b:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) b:fun('A,bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) eps:real)))))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool)))))))))))))))
      #|totally_bounded_subset =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) X:fun('A,bool))))) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) S:fun('A,bool)) d:fun('A,fun('A,real)))))))))))
      #|integer_cube_finite =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\N:num. (#FINITE:fun(fun(fun(num,real),bool),bool) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%437:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%437:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) (#!:fun(fun(num,bool),bool) (\i:num. (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) i:num))) (#real_of_num:fun(num,real) j:num))) ((#<=:fun(num,fun(num,bool)) j:num) N:num)))))))) f:fun(num,real)))))))))))
      #|FINITE_scaled_lattice =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\N:num. (#!:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) s:real)) (#FINITE:fun(fun(fun(num,real),bool),bool) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%438:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%438:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (#!:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\j:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) ((#real_mul:fun(real,fun(real,real)) s:real) (#real_of_num:fun(num,real) j:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) (#real_of_num:fun(num,real) N:num))))))) x:fun(num,real))))))))))))))
      #|totally_bounded_cube =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\N:num. (#euclid'totally_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%441:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%441:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (#!:fun(fun(num,bool),bool) (\i:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) (#real_of_num:fun(num,real) N:num)))))) x:fun(num,real))))))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))
      #|center_FINITE =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#!:fun(fun(real,bool),bool) (\eps:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) (#?:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) C:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun('A,fun('A,bool)),fun(fun('A,bool),fun(fun('A,bool),bool))) (\x:'A. (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) eps:real))) C:fun('A,bool))))))))))))))))
      #|open_ball_dist =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) r:real))))))))))))
      #|totally_bounded_bounded =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|subsequence_rec =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#!:fun(fun(num,bool),bool) (\s:num. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%447:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%447:num) (C:fun('A,bool) (f:fun(num,'A) j:num))) j:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) (f:fun(num,'A) s:num))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) x:'A)) (C:fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) r:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num)))))))))))))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\C':fun('A,bool). (#?:fun(fun(num,bool),bool) (\s':num. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C':fun('A,bool)) C:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) s:num) s':num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%448:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%448:num) (C':fun('A,bool) (f:fun(num,'A) j:num))) j:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (C':fun('A,bool) (f:fun(num,'A) s':num))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (C':fun('A,bool) x:'A)) (C':fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) r:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) (#SUC:fun(num,num) n:num))))))))))))))))))))))))))))))))))
      #|sequence_subseq =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#!:fun(fun(fun(num,num),bool),bool) (\ss:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) ss:fun(num,num))))))))))
      #|cauchy_subseq =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))))) (#?:fun(fun(fun(num,num),bool),bool) (\ss:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) ss:fun(num,num))) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) ss:fun(num,num)))))))))))))
      #|convergent_subseq =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A)))))) (#?:fun(fun(fun(num,num),bool),bool) (\ss:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) ss:fun(num,num))) ((#euclid'converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) ss:fun(num,num)))))))))))))
      #|dense =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid'closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))
      #|hausdorff =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'hausdorff:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) y:'A)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) (#?:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) B:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (A:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (B:fun('A,bool) y:'A)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) #EMPTY:fun('A,bool))))))))))))))))))
      #|dense_subset =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))
      #|dense_open =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#=:fun(bool,fun(bool,bool)) ((#euclid'dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) Z:fun('A,bool))) #EMPTY:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) #EMPTY:fun('A,bool)))))))))))
      #|countable_dense =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) Z:fun('A,bool))) ((#euclid'dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Z:fun('A,bool))))))))))
      #|metric_hausdorff =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'hausdorff:fun(fun(fun('A,bool),bool),bool) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))))
      #|compact =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\W:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) W:fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) W:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) W:fun(fun('A,bool),bool))))))))))))))))
      #|closed_compact =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) S:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) K:fun('A,bool)))))) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) S:fun('A,bool)))))))))
      #|compact_closed =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'hausdorff:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool)))))))
      #|compact_totally_bounded =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) X:fun('A,bool)))) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|finite_inters =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (V:fun(fun('A,bool),bool) u:fun('A,bool))) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) u:fun('A,bool))))))))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\W:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) W:fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) W:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) W:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool)))))))))))
      #|cauchy_subseq_sublemma =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))))) (#?:fun(fun(real,bool),bool) (\R:real. (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\Cn:fun(num,fun('A,bool)). (#?:fun(fun(fun(num,num),bool),bool) (\sn:fun(num,num). (#?:fun(fun(fun(prod(fun('A,bool),num),fun(num,bool)),bool),bool) (\cond:fun(prod(fun('A,bool),num),fun(num,bool)). ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) R:real)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) (X:fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) R:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((cond:fun(prod(fun('A,bool),num),fun(num,bool)) ((#,:fun(fun('A,bool),fun(num,prod(fun('A,bool),num))) X:fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (sn:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (Cn:fun(num,fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num))) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (Cn:fun(num,fun('A,bool)) n:num)) X:fun('A,bool))) ((cond:fun(prod(fun('A,bool),num),fun(num,bool)) ((#,:fun(fun('A,bool),fun(num,prod(fun('A,bool),num))) (Cn:fun(num,fun('A,bool)) n:num)) (sn:fun(num,num) n:num))) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (Cn:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num))) (Cn:fun(num,fun('A,bool)) n:num))) ((#<:fun(num,fun(num,bool)) (sn:fun(num,num) n:num)) (sn:fun(num,num) (#SUC:fun(num,num) n:num))))))) ((#=:fun(fun(prod(fun('A,bool),num),fun(num,bool)),fun(fun(prod(fun('A,bool),num),fun(num,bool)),bool)) (#GABS:fun(fun(fun(prod(fun('A,bool),num),fun(num,bool)),bool),fun(prod(fun('A,bool),num),fun(num,bool))) (\f:fun(prod(fun('A,bool),num),fun(num,bool)). (#!:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#!:fun(fun(num,bool),bool) (\s:num. ((#GEQ:fun(fun(num,bool),fun(fun(num,bool),bool)) (f:fun(prod(fun('A,bool),num),fun(num,bool)) ((#,:fun(fun('A,bool),fun(num,prod(fun('A,bool),num))) C:fun('A,bool)) s:num))) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%453:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%453:num) (C:fun('A,bool) (f:fun(num,'A) j:num))) j:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) (f:fun(num,'A) s:num))) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) x:'A)) (C:fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) R:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num))))))))))))))))))))) cond:fun(prod(fun('A,bool),num),fun(num,bool)))))))))))))))))))))))))
      #|subseq_cauchy =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#!:fun(fun(fun(num,num),bool),bool) (\s:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) s:fun(num,num))) ((#euclid'converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) s:fun(num,num))))))) ((#euclid'converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))))))))))
      #|compact_complete =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) X:fun('A,bool)))) (#euclid'complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|countable_cover =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) V:fun(fun('A,bool),bool)))))))))))))
      #|complete_compact =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid'complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) X:fun('A,bool)))))))
      #|uniformly_continuous =  |- (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (((#euclid'uniformly_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) (#!:fun(fun(real,bool),bool) (\epsilon:real. (#?:fun(fun(real,bool),bool) (\delta:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) epsilon:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) delta:real)) (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((dX:fun('A,fun('A,real)) x:'A) y:'A)) delta:real)))) ((#real_lt:fun(real,fun(real,bool)) ((dY:fun('B,fun('B,real)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) epsilon:real)))))))))))))))))))))))
      #|compact_uniformly_continuous =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#!:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#!:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'metric_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('B,bool),fun('B,fun('B,real))),bool) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) X:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) X:fun('A,bool))) Y:fun('B,bool))))))) (((#euclid'uniformly_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))))))))))))))
      #|image_compact =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) K:fun('A,bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))))) ((#euclid'compact:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) V:fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) K:fun('A,bool))))))))))))
      #|metric_bounded =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(bool,fun(bool,bool)) (#euclid'metric_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (((#euclid'open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)))))))))))
      #|euclid_ball_cube =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(real,bool),bool) (\r:real. (#?:fun(fun(num,bool),bool) (\N:num. ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid'open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real)) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%462:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%462:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (#!:fun(fun(num,bool),bool) (\i:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) (#real_of_num:fun(num,real) N:num)))))) x:fun(num,real)))))))))))))))
      #|totally_bounded_euclid =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\X:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) X:fun(fun(num,real),bool)) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)))) (#euclid'totally_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))
      #|induced_compact =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#=:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) K:fun('A,bool))) K:fun('A,bool))))))))
      #|compact_euclid =  |- (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\X:fun(fun(num,real),bool). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) X:fun(fun(num,real),bool)) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num))) ((#=:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool))) (#euclid'metric_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))))
      #|neg_continuous =  |- (#!:fun(fun(num,bool),bool) (\n:num. (((#euclid'metric_continuous:fun(fun(fun(num,real),fun(num,real)),fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool))) #euclid'euclid_neg:fun(fun(num,real),fun(num,real))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))
      #|continuous_comp =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun(fun(fun('C,bool),bool),bool),bool) (\W:fun(fun('C,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('B,'C),fun(fun(fun('B,bool),bool),fun(fun(fun('C,bool),bool),bool))) g:fun('B,'C)) V:fun(fun('B,bool),bool)) W:fun(fun('C,bool),bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))))) (((#euclid'continuous:fun(fun('A,'C),fun(fun(fun('A,bool),bool),fun(fun(fun('C,bool),bool),bool))) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))) U:fun(fun('A,bool),bool)) W:fun(fun('C,bool),bool)))))))))))))
      #|compact_max =  |- (#!:fun(fun(fun('A,fun(num,real)),bool),bool) (\f:fun('A,fun(num,real)). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) f:fun('A,fun(num,real))) U:fun(fun('A,bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#IMAGE:fun(fun('A,fun(num,real)),fun(fun('A,bool),fun(fun(num,real),bool))) f:fun('A,fun(num,real))) K:fun('A,bool))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) #EMPTY:fun('A,bool))))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (K:fun('A,bool) x:'A)) (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (K:fun('A,bool) y:'A)) ((#real_le:fun(real,fun(real,bool)) ((f:fun('A,fun(num,real)) y:'A) (#NUMERAL:fun(num,num) #_0:num))) ((f:fun('A,fun(num,real)) x:'A) (#NUMERAL:fun(num,num) #_0:num))))))))))))))))
      #|homeomorphism =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (((#euclid'homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (V:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool)))))))))))))))
      #|INV_homeomorphism =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (((#euclid'homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (((#euclid'continuous:fun(fun('B,'A),fun(fun(fun('B,bool),bool),fun(fun(fun('A,bool),bool),bool))) (((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) V:fun(fun('B,bool),bool)) U:fun(fun('A,bool),bool)))))))))
      #|bicont_homeomorphism =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (((#euclid'continuous:fun(fun('B,'A),fun(fun(fun('B,bool),bool),fun(fun(fun('A,bool),bool),bool))) (((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) V:fun(fun('B,bool),bool)) U:fun(fun('A,bool),bool))))) (((#euclid'homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool)))))))))
      #|open_and_closed =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool))) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))))) ((#=:fun(bool,fun(bool,bool)) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (V:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool))))))) (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#euclid'closed_:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) V:fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) B:fun('A,bool))))))))))))))
      #|hausdorff_homeomorphsim =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'hausdorff:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#euclid'topology_:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool)))))))) (((#euclid'homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool)))))))))
      #|d_real =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#euclid'd_real:fun(real,fun(real,real)) x:real) y:real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))
      #|metric_real =  |- (#euclid'metric_space:fun(prod(fun(real,bool),fun(real,fun(real,real))),bool) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))
      #|continuous_euclid1 =  |- (#!:fun(fun(num,bool),bool) (\i:num. (#!:fun(fun(num,bool),bool) (\n:num. (((#euclid'continuous:fun(fun(fun(num,real),real),fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(real,bool),bool),bool))) (#euclid'coord:fun(num,fun(fun(num,real),real)) i:num)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real)))))))))
      #|interval_closed_ball =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#?:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%469:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%469:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real))))))) (((#euclid'closed_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real)))))))))))
      #|interval_euclid1_closed =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#euclid'closed_:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%471:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%471:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real)))))))))))
      #|interval_euclid1_bounded =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. (#euclid'metric_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%473:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%473:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real))))))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))
      #|interval_euclid1_compact =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#euclid'compact:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%475:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%475:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real)))))))))))
      #|interval_image =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%476:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%476:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real)))))) ((#IMAGE:fun(fun(fun(num,real),real),fun(fun(fun(num,real),bool),fun(real,bool))) (#euclid'coord:fun(num,fun(fun(num,real),real)) (#NUMERAL:fun(num,num) #_0:num))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%477:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%477:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real))))))))))))
      #|interval_compact =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#euclid'compact:fun(fun(fun(real,bool),bool),fun(fun(real,bool),bool)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%478:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%478:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))))))
      #|half_open =  |- (#!:fun(fun(real,bool),bool) (\a:real. ((#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real)))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%480:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%480:real) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)) x:real))))))))
      #|half_open_above =  |- (#!:fun(fun(real,bool),bool) (\a:real. ((#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real)))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%482:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%482:real) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) x:real))))))))
      #|joinf =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#!:fun(fun(fun(real,'A),bool),bool) (\g:fun(real,'A). ((#=:fun(fun(real,'A),fun(fun(real,'A),bool)) (((#euclid'joinf:fun(fun(real,'A),fun(fun(real,'A),fun(real,fun(real,'A)))) f:fun(real,'A)) g:fun(real,'A)) a:real)) (\x:real. (((#COND:fun(bool,fun('A,fun('A,'A))) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)) (f:fun(real,'A) x:real)) (g:fun(real,'A) x:real))))))))))
      #|joinf_cont =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#!:fun(fun(fun(real,'A),bool),bool) (\g:fun(real,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) g:fun(real,'A)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) (g:fun(real,'A) a:real))))) (((#euclid'continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) (((#euclid'joinf:fun(fun(real,'A),fun(fun(real,'A),fun(real,fun(real,'A)))) f:fun(real,'A)) g:fun(real,'A)) a:real)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool)))))))))))
      #|neg_cont =  |- (((#euclid'continuous:fun(fun(real,real),fun(fun(fun(real,bool),bool),fun(fun(fun(real,bool),bool),bool))) #real_neg:fun(real,real)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real)))))
      #|add_cont =  |- (#!:fun(fun(real,bool),bool) (\u:real. (((#euclid'continuous:fun(fun(real,real),fun(fun(fun(real,bool),bool),fun(fun(fun(real,bool),bool),bool))) (#real_add:fun(real,fun(real,real)) u:real)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real)))))))
      #|continuous_scale =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (((#euclid'continuous:fun(fun(real,fun(num,real)),fun(fun(fun(real,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) (\t:real. ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real)))) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))
      #|continuous_lin_combo =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) (((#euclid'continuous:fun(fun(real,fun(num,real)),fun(fun(fun(real,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) (\t:real. ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) y:fun(num,real))))) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))))
      #|connected =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) B:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) #EMPTY:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))))))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) A:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) B:fun('A,bool))))))))))))))
      #|connected_unions =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z1:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z2:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z1:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z2:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) Z1:fun('A,bool)) Z2:fun('A,bool))) #EMPTY:fun('A,bool)))))) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) Z1:fun('A,bool)) Z2:fun('A,bool))))))))))
      #|component_DEF =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (Z:fun('A,bool) x:'A)) (Z:fun('A,bool) y:'A))))))))))))
      #|connected_sing =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))))))))
      #|component_refl =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) x:'A))))))
      #|component_symm =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) x:'A))))))))
      #|component_trans =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) z:'A))) (((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) z:'A))))))))))
      #|connect_real =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#euclid'connected:fun(fun(fun(real,bool),bool),fun(fun(real,bool),bool)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%503:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%503:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))))))
      #|connect_image =  |- (#!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#euclid'connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))))) ((#euclid'connected:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) V:fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))))))))))))
      #|path =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid'path:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) x:'A)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) b:real)) y:'A))))))))))))))))
      #|const_continuous =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#!:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (((#euclid'continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) (\x:'A. y:'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool)))))))))
      #|path_component =  |- (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) b:real)) y:'A)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(real,'A),fun(fun(real,bool),fun('A,bool))) f:fun(real,'A)) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%505:real. (#?:fun(fun(real,bool),bool) (\t:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%505:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) b:real))) t:real))))))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))))))))))))))
      #|path_refl =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) x:'A))))))
      #|path_symm =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) x:'A))))))))
      #|path_symm_eq =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) x:'A))))))))
      #|path_trans =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) z:'A))) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) z:'A))))))))))
      #|loc_path_conn =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid'loc_path_conn:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#!:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (A:fun('A,bool) x:'A))) (U:fun(fun('A,bool),bool) ((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) ((#euclid'induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) x:'A))))))))))
      #|path_eq_conn =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid'loc_path_conn:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#euclid'topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A)) ((#euclid'component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A)))))))
      #|open_ball_star =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(real,bool),bool) (\r:real. (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((((#euclid'open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real) y:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((((#euclid'open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real) ((#euclid'euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid'euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) y:fun(num,real)))))))))))))))
      #|open_ball_path =  |- (#!:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#!:fun(fun(real,bool),bool) (\r:real. (#!:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((((#euclid'open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real) y:fun(num,real))) (((#euclid'path_component:fun(fun(fun(fun(num,real),bool),bool),fun(fun(num,real),fun(fun(num,real),bool))) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (((#euclid'open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))) y:fun(num,real)) x:fun(num,real)))))))))))
      #|path_domain =  |- (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (((#euclid'continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid'top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid'd_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) b:real)) y:'A)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(real,'A),fun(fun(real,bool),fun('A,bool))) f:fun(real,'A)) #UNIV:fun(real,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))))))))))))))
      #|path_component_subspace =  |- (#!:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#!:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#!:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#!:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid'metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (Y:fun('A,bool) y:'A)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real))))) y:'A)) ((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) (#euclid'top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) y:'A)))))))))))
      #|path_component_in =  |- (#!:fun(fun('A,bool),bool) (\x:'A. (#!:fun(fun('A,bool),bool) (\y:'A. (#!:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (((#euclid'path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) y:'A))))))))
      #|loc_path_conn_euclid =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) A:fun(fun(num,real),bool))) (#euclid'loc_path_conn:fun(fun(fun(fun(num,real),bool),bool),bool) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) A:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))
      #|loc_path_euclid_cor =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid'euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))) A:fun(fun(num,real),bool))) ((#=:fun(fun(fun(num,real),fun(fun(num,real),bool)),fun(fun(fun(num,real),fun(fun(num,real),bool)),bool)) (#euclid'path_component:fun(fun(fun(fun(num,real),bool),bool),fun(fun(num,real),fun(fun(num,real),bool))) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) A:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) (#euclid'component:fun(fun(fun(fun(num,real),bool),bool),fun(fun(num,real),fun(fun(num,real),bool))) (#euclid'top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) A:fun(fun(num,real),bool)) #euclid'd_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = euclid'loc_path_conn euclid'path_component euclid'path euclid'component euclid'connected euclid'joinf euclid'd_real euclid'homeomorphism euclid'metric_bounded euclid'uniformly_continuous euclid'compact euclid'hausdorff euclid'dense euclid'totally_bounded euclid'complete euclid'cauchy_seq euclid'converge euclid'sequence euclid'metric_continuous euclid'metric_continuous_pt euclid'continuous euclid'gen euclid'top_of_metric euclid'open_balls euclid'closed_ball euclid'open_ball euclid'induced_top euclid'closure euclid'closed_ euclid'open_ euclid'topology_ euclid'proj trig'pi_bound_fun trig'pi_fun euclid'vol euclid'euclid_bounded euclid'outer_vol euclid'inner_vol euclid'outer_cube euclid'inner_cube euclid'mk_cube euclid'one_vec euclid'mk_rectangle euclid'set_scale euclid'set_translate euclid'metric_space euclid'mk_triangular_region euclid'mk_interior_triangle euclid'mk_triangle euclid'triple_product euclid'cross_product3 euclid'saturated_packing euclid'packing euclid'mk_convex_cone euclid'mk_signed_angle euclid'mk_angle euclid'mk_half_set euclid'mk_open_half_set euclid'space euclid'plane euclid'line euclid'coplanar euclid'collinear euclid'affine_dim euclid'affine euclid'mk_line euclid'affine_hull euclid'convex_hull euclid'convex euclid'mk_open_segment euclid'mk_segment sum_vector euclid'd_euclid euclid'norm euclid'dot euclid'coord euclid'euclid0 euclid'euclid_minus euclid'euclidean euclid'euclid euclid'euclid_plus euclid'euclid_neg euclid'euclid_scale part7 part6 part5 part4 part3 part2 part1 part0 drop3 drop2 drop1 drop0 INV compose FUN SUPP partition equivalence_relation transitive symmetric reflexive func supp preimage prod deriv2 deriv min_real max_real min_num dirac_delta mark_term TAGB ssqrt interval float twopow nabs GCD DIVIDE integral integrable defint rsum fine gauge tdiv dsize division atn acs asn tan pi root ln cos sin exp diffs differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? ! ==> /\ T =
      #|definitions = 439
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?240834
      #|counter_genvar = _200220:bool
      #|
    ),
  )
}
