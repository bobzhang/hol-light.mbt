// Formal_ineqs/taylor/theory/multivariate_taylor-compiled.hl in its directory's load order: the test block of
// formal_ineqs/taylor/theory/multivariate_taylor_compiled/multivariate_taylor_compiled_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_taylor_theory_multivariate_taylor-compiled_ref.expected).

///|
test "Formal_ineqs/taylor/theory/multivariate_taylor-compiled matches Formal_ineqs/taylor/theory/multivariate_taylor-compiled.ml" {
  @testkit.release_output()
  @multivariate_taylor_compiled.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/taylor/theory/multivariate_taylor-compiled"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace(
    "Formal_ineqs/taylor/theory/multivariate_taylor-compiled",
  )
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Multivariate_taylor.IMAGE_DELETE_INJ_COMPAT", () => {
    sthm(@multivariate_taylor_compiled.image_delete_inj_compat())
  })
  log.attempt("Multivariate_taylor.partial", () => {
    sthm(@multivariate_taylor_compiled.partial())
  })
  log.attempt("Multivariate_taylor.all_n", () => {
    sthm(@multivariate_taylor_compiled.all_n())
  })
  log.attempt("Multivariate_taylor.m_lin_approx", () => {
    sthm(@multivariate_taylor_compiled.m_lin_approx())
  })
  log.attempt("Multivariate_taylor.f_lift_neg", () => {
    sthm(@multivariate_taylor_compiled.f_lift_neg_v1())
  })
  log.attempt("Multivariate_taylor.f_lift_scale", () => {
    sthm(@multivariate_taylor_compiled.f_lift_scale_v1())
  })
  log.attempt("Multivariate_taylor.f_lift_add", () => {
    sthm(@multivariate_taylor_compiled.f_lift_add_v1())
  })
  log.attempt("Multivariate_taylor.f_lift_sub", () => {
    sthm(@multivariate_taylor_compiled.f_lift_sub_v1())
  })
  log.attempt("Multivariate_taylor.f_binary_drop", () => {
    sthm(@multivariate_taylor_compiled.f_binary_drop_v1())
  })
  log.attempt("Multivariate_taylor.f_unary_drop", () => {
    sthm(@multivariate_taylor_compiled.f_unary_drop_v1())
  })
  log.attempt("Multivariate_taylor.frechet_compose", () => {
    sthm(@multivariate_taylor_compiled.frechet_compose_v2())
  })
  log.attempt("Multivariate_taylor.frechet_const", () => {
    sthm(@multivariate_taylor_compiled.frechet_const_v2())
  })
  log.attempt("Multivariate_taylor.frechet_id", () => {
    sthm(@multivariate_taylor_compiled.frechet_id_v2())
  })
  log.attempt("Multivariate_taylor.frechet_vmul", () => {
    sthm(@multivariate_taylor_compiled.frechet_vmul_v2())
  })
  log.attempt("Multivariate_taylor.frechet_neg", () => {
    sthm(@multivariate_taylor_compiled.frechet_neg_v2())
  })
  log.attempt("Multivariate_taylor.frechet_scale", () => {
    sthm(@multivariate_taylor_compiled.frechet_scale_v2())
  })
  log.attempt("Multivariate_taylor.frechet_add", () => {
    sthm(@multivariate_taylor_compiled.frechet_add_v2())
  })
  log.attempt("Multivariate_taylor.frechet_sub", () => {
    sthm(@multivariate_taylor_compiled.frechet_sub_v2())
  })
  log.attempt("Multivariate_taylor.differentiable_compose_at", () => {
    sthm(@multivariate_taylor_compiled.differentiable_compose_at_v1())
  })
  log.attempt("Multivariate_taylor.jacobian_compose", () => {
    sthm(@multivariate_taylor_compiled.jacobian_compose_v1())
  })
  log.attempt("Multivariate_taylor.frechet_eq_jacobian", () => {
    sthm(@multivariate_taylor_compiled.frechet_eq_jacobian_v1())
  })
  log.attempt("Multivariate_taylor.REAL_LET_MUL2", () => {
    sthm(@multivariate_taylor_compiled.real_let_mul2_v2())
  })
  log.attempt("Multivariate_taylor.has_derivative_x12", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_x12_v2())
  })
  log.attempt("Multivariate_taylor.lambda_eq_vsum", () => {
    sthm(@multivariate_taylor_compiled.lambda_eq_vsum_v2())
  })
  log.attempt("Multivariate_taylor.has_derivative_lambda", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_lambda_v2())
  })
  log.attempt("Multivariate_taylor.vector2_eq_lambda", () => {
    sthm(@multivariate_taylor_compiled.vector2_eq_lambda_v2())
  })
  log.attempt("Multivariate_taylor.has_derivative_vector2", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_vector2_v2())
  })
  log.attempt("Multivariate_taylor.has_derivative_mul", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_mul_v2())
  })
  log.attempt("Multivariate_taylor.f_eq_lift_drop", () => {
    sthm(@multivariate_taylor_compiled.f_eq_lift_drop_v2())
  })
  log.attempt("Multivariate_taylor.differentiable_mul", () => {
    sthm(@multivariate_taylor_compiled.differentiable_mul_v2())
  })
  log.attempt("Multivariate_taylor.frechet_mul", () => {
    sthm(@multivariate_taylor_compiled.frechet_mul_v2())
  })
  log.attempt("Multivariate_taylor.real_derivative_compose_frechet", () => {
    sthm(@multivariate_taylor_compiled.real_derivative_compose_frechet_v1())
  })
  log.attempt("Multivariate_taylor.real_derivative_compose_jacobian", () => {
    sthm(@multivariate_taylor_compiled.real_derivative_compose_jacobian_v1())
  })
  log.attempt("Multivariate_taylor.diff_imp_real_diff", () => {
    sthm(@multivariate_taylor_compiled.diff_imp_real_diff_v1())
  })
  log.attempt("Multivariate_taylor.diff_direction", () => {
    sthm(@multivariate_taylor_compiled.diff_direction_v1())
  })
  log.attempt("Multivariate_taylor.frechet_direction", () => {
    sthm(@multivariate_taylor_compiled.frechet_direction_v1())
  })
  log.attempt("Multivariate_taylor.real_dir_derivative_frechet", () => {
    sthm(@multivariate_taylor_compiled.real_dir_derivative_frechet_v1())
  })
  log.attempt("Multivariate_taylor.real_dir_derivative_jacobian", () => {
    sthm(@multivariate_taylor_compiled.real_dir_derivative_jacobian_v1())
  })
  log.attempt("Multivariate_taylor.partial_eq_frechet", () => {
    sthm(@multivariate_taylor_compiled.partial_eq_frechet_v1())
  })
  log.attempt("Multivariate_taylor.partial_eq_jacobian", () => {
    sthm(@multivariate_taylor_compiled.partial_eq_jacobian_v1())
  })
  log.attempt("Multivariate_taylor.partial_eq_jacobian_column", () => {
    sthm(@multivariate_taylor_compiled.partial_eq_jacobian_column_v1())
  })
  log.attempt("Multivariate_taylor.partial_eq_jacobian_entry", () => {
    sthm(@multivariate_taylor_compiled.partial_eq_jacobian_entry_v1())
  })
  log.attempt("Multivariate_taylor.partial_eq0", () => {
    sthm(@multivariate_taylor_compiled.partial_eq0_v1())
  })
  log.attempt("Multivariate_taylor.derivative_compose", () => {
    sthm(@multivariate_taylor_compiled.derivative_compose_v1())
  })
  log.attempt("Multivariate_taylor.projection_has_derivative", () => {
    sthm(@multivariate_taylor_compiled.projection_has_derivative_v1())
  })
  log.attempt("Multivariate_taylor.projection_diff", () => {
    sthm(@multivariate_taylor_compiled.projection_diff_v1())
  })
  log.attempt("Multivariate_taylor.frechet_projection", () => {
    sthm(@multivariate_taylor_compiled.frechet_projection_v1())
  })
  log.attempt("Multivariate_taylor.has_derivative_vector_frechet", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_vector_frechet_v1())
  })
  log.attempt("Multivariate_taylor.has_derivative_vector_jacobian", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_vector_jacobian_v1())
  })
  log.attempt("Multivariate_taylor.derivative_vector_jacobian", () => {
    sthm(@multivariate_taylor_compiled.derivative_vector_jacobian_v1())
  })
  log.attempt("Multivariate_taylor.real_derivative_compose_partial", () => {
    sthm(@multivariate_taylor_compiled.real_derivative_compose_partial_v1())
  })
  log.attempt("Multivariate_taylor.real_dir_derivative_partial", () => {
    sthm(@multivariate_taylor_compiled.real_dir_derivative_partial_v1())
  })
  log.attempt("Multivariate_taylor.partial_uni_compose", () => {
    sthm(@multivariate_taylor_compiled.partial_uni_compose_v1())
  })
  log.attempt("Multivariate_taylor.partial_neg", () => {
    sthm(@multivariate_taylor_compiled.partial_neg_v1())
  })
  log.attempt("Multivariate_taylor.partial_scale", () => {
    sthm(@multivariate_taylor_compiled.partial_scale_v1())
  })
  log.attempt("Multivariate_taylor.partial_add", () => {
    sthm(@multivariate_taylor_compiled.partial_add_v1())
  })
  log.attempt("Multivariate_taylor.partial_sub", () => {
    sthm(@multivariate_taylor_compiled.partial_sub_v1())
  })
  log.attempt("Multivariate_taylor.partial_mul", () => {
    sthm(@multivariate_taylor_compiled.partial_mul_v1())
  })
  log.attempt("Multivariate_taylor.derivative_translation", () => {
    sthm(@multivariate_taylor_compiled.derivative_translation_v1())
  })
  log.attempt("Multivariate_taylor.partial_increasing_left", () => {
    sthm(@multivariate_taylor_compiled.partial_increasing_left_v1())
  })
  log.attempt("Multivariate_taylor.partial_decreasing_left", () => {
    sthm(@multivariate_taylor_compiled.partial_decreasing_left_v1())
  })
  log.attempt("Multivariate_taylor.partial_translation", () => {
    sthm(@multivariate_taylor_compiled.partial_translation_v1())
  })
  log.attempt("Multivariate_taylor.partial_rev_translation", () => {
    sthm(@multivariate_taylor_compiled.partial_rev_translation_v1())
  })
  log.attempt("Multivariate_taylor.partial_increasing_right", () => {
    sthm(@multivariate_taylor_compiled.partial_increasing_right_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_error", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_error())
  })
  log.attempt("Multivariate_taylor.m_taylor_partial_error", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_partial_error())
  })
  log.attempt("Multivariate_taylor.partial2", () => {
    sthm(@multivariate_taylor_compiled.partial2())
  })
  log.attempt("Multivariate_taylor.diff2", () => {
    sthm(@multivariate_taylor_compiled.diff2())
  })
  log.attempt("Multivariate_taylor.diff2c", () => {
    sthm(@multivariate_taylor_compiled.diff2c())
  })
  log.attempt("Multivariate_taylor.m_cell_domain", () => {
    sthm(@multivariate_taylor_compiled.m_cell_domain())
  })
  log.attempt("Multivariate_taylor.m_bounded_on_int", () => {
    sthm(@multivariate_taylor_compiled.m_bounded_on_int())
  })
  log.attempt("Multivariate_taylor.diff2_domain", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain())
  })
  log.attempt("Multivariate_taylor.diff2c_domain", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain())
  })
  log.attempt("Multivariate_taylor.real_taylor2_bound", () => {
    sthm(@multivariate_taylor_compiled.real_taylor2_bound_v1())
  })
  log.attempt("Multivariate_taylor.real_taylor1_bound", () => {
    sthm(@multivariate_taylor_compiled.real_taylor1_bound_v1())
  })
  log.attempt("Multivariate_taylor.taylor_error_eq_sum_partial_errors", () => {
    sthm(@multivariate_taylor_compiled.taylor_error_eq_sum_partial_errors_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_imp_diff2", () => {
    sthm(@multivariate_taylor_compiled.diff2c_imp_diff2_v1())
  })
  log.attempt("Multivariate_taylor.diff2_eq_diff2_on_open", () => {
    sthm(@multivariate_taylor_compiled.diff2_eq_diff2_on_open_v1())
  })
  log.attempt("Multivariate_taylor.diff2_imp_real_diff", () => {
    sthm(@multivariate_taylor_compiled.diff2_imp_real_diff_v1())
  })
  log.attempt("Multivariate_taylor.diff2_dir_derivative", () => {
    sthm(@multivariate_taylor_compiled.diff2_dir_derivative_v1())
  })
  log.attempt("Multivariate_taylor.diff2_partial_real_diff", () => {
    sthm(@multivariate_taylor_compiled.diff2_partial_real_diff_v1())
  })
  log.attempt("Multivariate_taylor.in_trans", () => {
    sthm(@multivariate_taylor_compiled.in_trans_v1())
  })
  log.attempt("Multivariate_taylor.open_contains_open_interval", () => {
    sthm(@multivariate_taylor_compiled.open_contains_open_interval_v1())
  })
  log.attempt("Multivariate_taylor.diff2_dir", () => {
    sthm(@multivariate_taylor_compiled.diff2_dir_v1())
  })
  log.attempt("Multivariate_taylor.diff2_dir_derivative2", () => {
    sthm(@multivariate_taylor_compiled.diff2_dir_derivative2_v1())
  })
  log.attempt("Multivariate_taylor.diff2_has_derivative_partial", () => {
    sthm(@multivariate_taylor_compiled.diff2_has_derivative_partial_v1())
  })
  log.attempt("Multivariate_taylor.diff2_derivative_partial", () => {
    sthm(@multivariate_taylor_compiled.diff2_derivative_partial_v1())
  })
  log.attempt("Multivariate_taylor.diff2_real_diff_partial", () => {
    sthm(@multivariate_taylor_compiled.diff2_real_diff_partial_v1())
  })
  log.attempt("Multivariate_taylor.partial_const", () => {
    sthm(@multivariate_taylor_compiled.partial_const_v1())
  })
  log.attempt("Multivariate_taylor.partial_eq0_alt", () => {
    sthm(@multivariate_taylor_compiled.partial_eq0_alt_v1())
  })
  log.attempt("Multivariate_taylor.real_mvt0", () => {
    sthm(@multivariate_taylor_compiled.real_mvt0_v1())
  })
  log.attempt("Multivariate_taylor.mixed_second_partials", () => {
    sthm(@multivariate_taylor_compiled.mixed_second_partials_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_alt", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_alt_v1())
  })
  log.attempt("Multivariate_taylor.y_in_domain", () => {
    sthm(@multivariate_taylor_compiled.y_in_domain_v1())
  })
  log.attempt("Multivariate_taylor.domain_width", () => {
    sthm(@multivariate_taylor_compiled.domain_width_v1())
  })
  log.attempt("Multivariate_taylor.sum_swap1", () => {
    sthm(@multivariate_taylor_compiled.sum_swap1_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_error_eq", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_error_eq_v1())
  })
  log.attempt("Multivariate_taylor.diff2_derivative2_bound", () => {
    sthm(@multivariate_taylor_compiled.diff2_derivative2_bound_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_error_lemma", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_error_lemma_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_upper_bound", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_upper_bound_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_lower_bound", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_lower_bound_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_bounds", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_bounds_v1())
  })
  log.attempt("Multivariate_taylor.diff2_derivative_partial_bound", () => {
    sthm(@multivariate_taylor_compiled.diff2_derivative_partial_bound_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_partial_error_lemma", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_partial_error_lemma_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_upper_partial_bound", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_upper_partial_bound_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_lower_partial_bound", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_lower_partial_bound_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_partial_bounds", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_partial_bounds_v1())
  })
  log.attempt("Multivariate_taylor.differentiable_local_at", () => {
    sthm(@multivariate_taylor_compiled.differentiable_local_at_v1())
  })
  log.attempt("Multivariate_taylor.diff2_scale", () => {
    sthm(@multivariate_taylor_compiled.diff2_scale_v2())
  })
  log.attempt("Multivariate_taylor.diff2_neg", () => {
    sthm(@multivariate_taylor_compiled.diff2_neg_v2())
  })
  log.attempt("Multivariate_taylor.has_derivative_uni_compose", () => {
    sthm(@multivariate_taylor_compiled.has_derivative_uni_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff_uni_compose", () => {
    sthm(@multivariate_taylor_compiled.diff_uni_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_uni_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_uni_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_abs_pos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_abs_pos_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_abs_neg_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_abs_neg_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_pow_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_pow_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_inv_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_inv_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_sqrt_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_sqrt_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_atn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_atn_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_cos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_cos_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_sin_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_sin_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_exp_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_exp_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_log_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_log_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_acs_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_acs_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_asn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_asn_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_matan_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_matan_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2_add", () => {
    sthm(@multivariate_taylor_compiled.diff2_add_v2())
  })
  log.attempt("Multivariate_taylor.diff2_sub", () => {
    sthm(@multivariate_taylor_compiled.diff2_sub_v2())
  })
  log.attempt("Multivariate_taylor.diff2_mul", () => {
    sthm(@multivariate_taylor_compiled.diff2_mul_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_scale", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_scale_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_neg", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_neg_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_inv_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_inv_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_sqrt_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_sqrt_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_abs_pos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_abs_pos_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_abs_neg_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_abs_neg_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_pow_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_pow_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_atn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_atn_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_cos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_cos_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_sin_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_sin_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_exp_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_exp_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_log_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_log_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_acs_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_acs_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_asn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_asn_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_matan_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_matan_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_add", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_add_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_sub", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_sub_v2())
  })
  log.attempt("Multivariate_taylor.diff2_domain_mul", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_mul_v2())
  })
  log.attempt("Multivariate_taylor.diff2_imp_diff", () => {
    sthm(@multivariate_taylor_compiled.diff2_imp_diff_v2())
  })
  log.attempt("Multivariate_taylor.diff2_imp_partial_diff", () => {
    sthm(@multivariate_taylor_compiled.diff2_imp_partial_diff_v2())
  })
  log.attempt("Multivariate_taylor.partial_local", () => {
    sthm(@multivariate_taylor_compiled.partial_local_v2())
  })
  log.attempt("Multivariate_taylor.second_partial_scale", () => {
    sthm(@multivariate_taylor_compiled.second_partial_scale_v2())
  })
  log.attempt("Multivariate_taylor.second_partial_neg", () => {
    sthm(@multivariate_taylor_compiled.second_partial_neg_v2())
  })
  log.attempt("Multivariate_taylor.second_partial_add", () => {
    sthm(@multivariate_taylor_compiled.second_partial_add_v2())
  })
  log.attempt("Multivariate_taylor.second_partial_sub", () => {
    sthm(@multivariate_taylor_compiled.second_partial_sub_v2())
  })
  log.attempt("Multivariate_taylor.second_partial_mul", () => {
    sthm(@multivariate_taylor_compiled.second_partial_mul_v2())
  })
  log.attempt("Multivariate_taylor.second_partial_uni_compose", () => {
    sthm(@multivariate_taylor_compiled.second_partial_uni_compose_v2())
  })
  log.attempt("Multivariate_taylor.real_cont_at_local", () => {
    sthm(@multivariate_taylor_compiled.real_cont_at_local_v1())
  })
  log.attempt("Multivariate_taylor.real_cont_atreal_local", () => {
    sthm(@multivariate_taylor_compiled.real_cont_atreal_local_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_scale", () => {
    sthm(@multivariate_taylor_compiled.diff2c_scale_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_neg", () => {
    sthm(@multivariate_taylor_compiled.diff2c_neg_v2())
  })
  log.attempt("Multivariate_taylor.nth_diff_strong_eq_on_open", () => {
    sthm(@multivariate_taylor_compiled.nth_diff_strong_eq_on_open_v3())
  })
  log.attempt("Multivariate_taylor.diff2_imp_cont", () => {
    sthm(@multivariate_taylor_compiled.diff2_imp_cont_v3())
  })
  log.attempt("Multivariate_taylor.diff2_imp_partial_cont", () => {
    sthm(@multivariate_taylor_compiled.diff2_imp_partial_cont_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_uni_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_uni_compose_v3())
  })
  log.attempt("Multivariate_taylor.real_open_delete", () => {
    sthm(@multivariate_taylor_compiled.real_open_delete_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_inv_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_inv_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_sqrt_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_sqrt_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_abs_pos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_abs_pos_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_abs_neg_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_abs_neg_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_pow_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_pow_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_atn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_atn_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_cos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_cos_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_sin_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_sin_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_exp_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_exp_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_log_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_log_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_acs_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_acs_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_asn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_asn_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_matan_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_matan_compose_v3())
  })
  log.attempt("Multivariate_taylor.diff2c_add", () => {
    sthm(@multivariate_taylor_compiled.diff2c_add_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_sub", () => {
    sthm(@multivariate_taylor_compiled.diff2c_sub_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_mul", () => {
    sthm(@multivariate_taylor_compiled.diff2c_mul_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_scale", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_scale_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_neg", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_neg_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_inv_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_inv_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_sqrt_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_sqrt_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_abs_pos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_abs_pos_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_abs_neg_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_abs_neg_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_pow_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_pow_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_atn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_atn_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_cos_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_cos_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_sin_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_sin_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_exp_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_exp_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_log_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_log_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_acs_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_acs_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_asn_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_asn_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_matan_compose", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_matan_compose_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_add", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_add_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_sub", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_sub_v2())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_mul", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_mul_v2())
  })
  log.attempt("Multivariate_taylor.m_lin_approx_neg", () => {
    sthm(@multivariate_taylor_compiled.m_lin_approx_neg_v1())
  })
  log.attempt("Multivariate_taylor.m_lin_approx_scale", () => {
    sthm(@multivariate_taylor_compiled.m_lin_approx_scale_v1())
  })
  log.attempt("Multivariate_taylor.m_lin_approx_add", () => {
    sthm(@multivariate_taylor_compiled.m_lin_approx_add_v1())
  })
  log.attempt("Multivariate_taylor.m_lin_approx_sub", () => {
    sthm(@multivariate_taylor_compiled.m_lin_approx_sub_v1())
  })
  log.attempt("Multivariate_taylor.m_lin_approx_mul", () => {
    sthm(@multivariate_taylor_compiled.m_lin_approx_mul_v1())
  })
  log.attempt("Multivariate_taylor.second_bounded", () => {
    sthm(@multivariate_taylor_compiled.second_bounded())
  })
  log.attempt("Multivariate_taylor.m_taylor_interval", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_interval())
  })
  log.attempt("Multivariate_taylor.m_taylor_inv_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_inv_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_sqrt_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_sqrt_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_abs_pos_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_abs_pos_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_abs_neg_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_abs_neg_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_pow_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_pow_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_atn_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_atn_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_cos_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_cos_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_sin_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_sin_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_exp_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_exp_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_log_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_log_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_acs_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_acs_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_asn_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_asn_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_matan_compose", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_matan_compose_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_neg", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_neg_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_scale", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_scale_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_add", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_add_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_sub", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_sub_v1())
  })
  log.attempt("Multivariate_taylor.m_taylor_mul", () => {
    sthm(@multivariate_taylor_compiled.m_taylor_mul_v1())
  })
  log.attempt("Multivariate_taylor.REAL_LE_DIV_1", () => {
    sthm(@multivariate_taylor_compiled.real_le_div_1_v1())
  })
  log.attempt("Multivariate_taylor.partial_convex_max", () => {
    sthm(@multivariate_taylor_compiled.partial_convex_max_v1())
  })
  log.attempt("Multivariate_taylor.f_lift_const", () => {
    sthm(@multivariate_taylor_compiled.f_lift_const_v1())
  })
  log.attempt("Multivariate_taylor.f_lift_unary", () => {
    sthm(@multivariate_taylor_compiled.f_lift_unary_v1())
  })
  log.attempt("Multivariate_taylor.diff2_const", () => {
    sthm(@multivariate_taylor_compiled.diff2_const_v1())
  })
  log.attempt("Multivariate_taylor.diff2_domain_const", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_const_v1())
  })
  log.attempt("Multivariate_taylor.partial2_const", () => {
    sthm(@multivariate_taylor_compiled.partial2_const_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_const", () => {
    sthm(@multivariate_taylor_compiled.diff2c_const_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_const", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_const_v1())
  })
  log.attempt("Multivariate_taylor.partial_x_lemma", () => {
    sthm(@multivariate_taylor_compiled.partial_x_lemma_v1())
  })
  log.attempt("Multivariate_taylor.partial_x", () => {
    sthm(@multivariate_taylor_compiled.partial_x_v1())
  })
  log.attempt("Multivariate_taylor.partial2_x", () => {
    sthm(@multivariate_taylor_compiled.partial2_x_v1())
  })
  log.attempt("Multivariate_taylor.diff2_x", () => {
    sthm(@multivariate_taylor_compiled.diff2_x_v1())
  })
  log.attempt("Multivariate_taylor.diff2_domain_x", () => {
    sthm(@multivariate_taylor_compiled.diff2_domain_x_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_x", () => {
    sthm(@multivariate_taylor_compiled.diff2c_x_v1())
  })
  log.attempt("Multivariate_taylor.diff2c_domain_x", () => {
    sthm(@multivariate_taylor_compiled.diff2c_domain_x_v1())
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
      #|Warning: inventing type variables
      #|0..0..1..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..1..3..7..solved at 12
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Formal_ineqs/taylor/theory/multivariate_taylor-compiled quotations (789):
      #|  :real^N
      #|  forall f s a. (forall x. f(x) = f(a) ==> x = a)\n            ==> (IMAGE f (s DELETE a) = (IMAGE f s) DELETE (f a))
      #|  partial i f x = derivative (f o (\\t. (x:real^N) + t % basis i)) (&0)
      #|  (all_n n [] s <=> T) /\\ (all_n n (CONS h t) s <=> s n h /\\ all_n (SUC n) t s)
      #|  :P
      #|  :P
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  (+):num->num->num
      #|  (+):num->num->num
      #|  \\n. n + 1
      #|  \\n. n + 1
      #|  m_lin_approx (f:real^N->real) x f_bounds df_bounds_list <=> \n\t(lift o f) differentiable at x /\\\n\tinterval_arith (f x) f_bounds /\\\n\tall_n 1 df_bounds_list (\\i int. interval_arith (partial i f x) int)
      #|  lift o (\\x. --f x) = (\\x. --(lift o f) x)
      #|  lift o (\\x. c * f x) = (\\x. c % (lift o f) x)
      #|  lift o (\\x. f x + g x) = (\\x. (lift o f) x + (lift o g) x)
      #|  lift o (\\x. f x - g x) = (\\x. (lift o f) x - (lift o g) x)
      #|  (\\t. op (f t) (g t)) o drop = (\\x. op (f (drop x)) (g (drop x)))
      #|  (\\t. op (f t)) o drop = (\\x. op (f (drop x)))
      #|  :real^N -> real^M
      #|  :real^N -> real^M
      #|  :real^N
      #|  :real^N
      #|  f differentiable at (g x) ==>\n\tg differentiable at x ==>\n\tfrechet_derivative (f o g) (at x) = frechet_derivative f (at (g x)) o frechet_derivative g (at x)
      #|  frechet_derivative (\\x. y) (at z) = (\\x. vec 0)
      #|  frechet_derivative (\\x. x) (at y) = (\\x. x)
      #|  frechet_derivative (\\x. drop x % y) (at z) = (\\x. drop x % y)
      #|  f differentiable at x
      #|  frechet_derivative (\\x. --f x) (at x) = (\\y. --frechet_derivative f (at x) y)
      #|  frechet_derivative (\\x. c % f x) (at x) = (\\y. c % frechet_derivative f (at x) y)
      #|  g differentiable at x
      #|  frechet_derivative (\\x. f x + g x) (at x) = \n\t(\\y. frechet_derivative f (at x) y + frechet_derivative g (at x) y)
      #|  frechet_derivative (\\x. f x - g x) (at x) = \n\t(\\y. frechet_derivative f (at x) y - frechet_derivative g (at x) y)
      #|  f differentiable at (g x) ==>\n\tg differentiable at x ==>\n\t(f o g) differentiable at x
      #|  f differentiable at (g x) ==>\n\tg differentiable at x ==>\n\tjacobian (f o g) (at x) = jacobian f (at (g x)) ** jacobian g (at x)
      #|  f differentiable at x ==>\n\tfrechet_derivative f (at x) = (\\h. jacobian f (at x) ** h)
      #|  &0 < w /\\ w <= x /\\ &0 <= y /\\ y < z ==> w * y < x * z
      #|  w = x
      #|  infnorm p = abs (p$1) \\/ infnorm p = abs (p$2)
      #|  &0 < infnorm p
      #|  inv (infnorm p) * infnorm p * e
      #|  x - y:real^2
      #|  (x:real^2)$1 * x$2 - ((y:real^2)$1 * y$2 + y$2 * (x$1 - y$1) + y$1 * (x$2 - y$2)) =\n\t\t(x$2 - y$2) * (x$1 - y$1)
      #|  (lift o (\\x:real^2. x$1 * x$2) has_derivative lift o (\\x. y$2 * x$1 + y$1 * x$2)) (at y)
      #|  forall a b. a = b + a * &1 <=> b = &0
      #|  DISJOINT B {i} /\\ A = B UNION {i}
      #|  A DIFF {i}
      #|  1.. _
      #|  (\\x:A. lambda i. f i x) =  \n\t(\\x. vsum (1..dimindex (:N)) (\\i. f i x % (basis i:real^N)))
      #|  ~P <=> (P <=> F)
      #|  x = i
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  forall f. (\\x:real^N. f i x % (basis i:real^M)) = (\\x. drop ((lift o f i) x) % basis i)
      #|  (forall i. i IN 1..dimindex (:M) ==> (lift o (f i) has_derivative lift o (f' i)) (at (y:real^N))) ==>\n\t(((\\x. lambda i. f i x):real^N->real^M) has_derivative (\\x. lambda i. f' i x) ) (at y)
      #|  1 <= i /\\ i <= 2 <=> i = 1 \\/ i = 2
      #|  (vector [x; y]:real^2) = (lambda i. if i = 1 then x else y)
      #|  ~(2 = 1)
      #|  1 <= i /\\ i <= 2 <=> i = 1 \\/ i = 2
      #|  (lift o f has_derivative lift o f') (at y) ==>\n\t(lift o g has_derivative lift o g') (at y) ==>\n\t((\\x. vector [f x; g x]:real^2) has_derivative (\\x. vector [f' x; g' x]:real^2)) (at y)
      #|  ~P <=> (P <=> F)
      #|  lift o (\\x. f' x * g y + f y * g' x) = \n\t(lift o (\\x:real^2. q$2 * x$1 + q$1 * x$2)) o (\\x. vector [f' x; g' x])
      #|  vector [f y; g y]:real^2
      #|  lift o (\\x. f x * g x) = (lift o (\\p. p$1 * p$2)) o (\\x. vector [f x; g x]:real^2)
      #|  (lift o f has_derivative lift o f') (at y) ==>\n\t(lift o g has_derivative lift o g') (at y) ==>\n\t(lift o (\\x. f x * g x) has_derivative lift o (\\x. f' x * g y + f y * g' x)) (at y)
      #|  f = lift o (drop o f)
      #|  lift o f differentiable (at y) ==>\n\tlift o g differentiable (at y) ==>\n\tlift o (\\x. f x * g x) differentiable (at y)
      #|  frechet_derivative _1 _2
      #|  frechet_derivative _1 _2
      #|  lift o f differentiable at y ==>\n\tlift o g differentiable at y ==>\n\tfrechet_derivative (lift o (\\x. f x * g x)) (at y) =\n\t\t(\\x. g y % frechet_derivative (lift o f) (at y) x + \n\t\t     f y % frechet_derivative (lift o g) (at y) x)
      #|  x = drop x % lift (&1)
      #|  linear f' /\\ linear h'
      #|  (\\x. (drop o (f' o h') o lift) (&1) % x) = f' o h'
      #|  lift o (f o h) o drop = (lift o f) o (h o drop)
      #|  frechet_derivative _1 _2
      #|  frechet_derivative _1 _2
      #|  (lift o f) differentiable at (h t) ==>\n\t(h o drop) differentiable at (lift t) ==>\n\t((f o h) has_real_derivative (drop o (frechet_derivative (lift o f) (at (h t)) o \n\t\t\tfrechet_derivative (h o drop) (at (lift t))) o lift) (&1)) (atreal t)
      #|  (lift o f) differentiable at (h t) ==>\n\t(h o drop) differentiable at (lift t) ==>\n\t((f o h) has_real_derivative (jacobian (lift o f) (at (h t)) ** \n\t\t\t\tjacobian (h o drop) (at (lift t)))$1$1) (atreal t)
      #|  (drop o _ o lift) (&1)
      #|  (lift o f) differentiable at (h t) ==> \n\t(h o drop) differentiable at (lift t) ==>\n\t(f o h) real_differentiable atreal t
      #|  \\x. drop x % e
      #|  (\\t. y + t % e) o drop = (\\x. y + drop x % e)
      #|  ((\\t. y + t % e) o drop) differentiable net
      #|  \\x. drop x % e
      #|  frechet_derivative ((\\t. y + t % e) o drop) (at (lift t)) = (\\x. drop x % e)
      #|  (lift o f) differentiable at (y + t % e) ==>\n\t((f o (\\t. y + t % e)) has_real_derivative \n\t\t(drop (frechet_derivative (lift o f) (at (y + t % e)) e))) (atreal t)
      #|  \\t. y + t % e
      #|  (lift o f) differentiable at (y + t % e) ==>\n\t((f o (\\t. y + t % e)) has_real_derivative \n\t\tdrop (jacobian (lift o f) (at (y + t % e)) ** e)) (atreal t)
      #|  (lift o f) differentiable at (y:real^N) ==>\n\tpartial i f y = drop (frechet_derivative (lift o f) (at y) (basis i))
      #|  basis i:real^N
      #|  &0
      #|  (lift o f) differentiable at y ==>\n\tpartial i f y = drop (jacobian (lift o f) (at y) ** basis i)
      #|  (lift o (f:real^N->real)) differentiable at y ==>\n\ti IN 1..dimindex (:N) ==>\n\tpartial i f y = drop (column i (jacobian (lift o f) (at y)))
      #|  (lift o (f:real^N->real)) differentiable at y ==>\n\ti IN 1..dimindex (:N) ==>\n\tpartial i f y = (jacobian (lift o f) (at y))$1$i
      #|  :real^N
      #|  :num
      #|  derivative (f o (\\t. y)) = derivative (\\t. f y)
      #|  basis i = (vec 0):real^N
      #|  ~(i IN 1..dimindex (:N)) ==>\n\tpartial i f y = &0
      #|  f o g = \\x. f (g x)
      #|  f real_differentiable atreal (g x) ==>\n\tg real_differentiable atreal x ==>\n\tderivative (f o g) x = derivative f (g x) * derivative g x
      #|  lift o (\\x:real^N. x$i) = (\\x. x$i % vec 1)
      #|  i IN 1..dimindex (:N) ==>\n\t(lift o (\\x:real^N. x$i) has_derivative lift o (\\x. x$i)) net
      #|  lift o \\x:real^N. x$i
      #|  i IN 1..dimindex (:N) ==>\n\t(lift o (\\x:real^N. x$i)) differentiable net
      #|  i IN 1..dimindex (:N) ==>\n\tfrechet_derivative (lift o (\\x:real^N. x$i)) (at x)  = lift o (\\x:real^N. x$i)
      #|  lhs = rhs
      #|  (frechet_derivative _1 _2 _3)$i
      #|  (drop o _ o lift) (&1)
      #|  (\\s. h s$i) = (\\x. x$i) o h
      #|  i IN 1..dimindex (:N) ==>\n\t(h o drop) differentiable at (lift t) ==>\n\t((\\s. (h:real->real^N) s$i) has_real_derivative\n\t\t(frechet_derivative (h o drop) (at (lift t)) (lift (&1)))$i) (atreal t)
      #|  \\x:real^N. x$i
      #|  lift (&1) = basis 1
      #|  lhs = rhs
      #|  jacobian _1 _2$i$1
      #|  (frechet_derivative _1 _2 _3)$i
      #|  i IN 1..dimindex (:N) ==>\n\t(h o drop) differentiable at (lift t) ==>\n\t((\\s. (h:real->real^N) s$i) has_real_derivative (jacobian (h o drop) (at (lift t)))$i$1) (atreal t)
      #|  i IN 1..dimindex (:N) ==>\n\t((h:real->real^N) o drop) differentiable at (lift t) ==>\n\tderivative (\\s. h s$i) t = jacobian (h o drop) (at (lift t))$i$1
      #|  lhs = rhs
      #|  sum _ _2
      #|  _$1$1
      #|  (lift o (f:real^N -> real)) differentiable at (h t) ==>\n\t(h o drop) differentiable at (lift t) ==>\n\t((f o h) has_real_derivative\n\t\tsum (1..dimindex (:N)) (\\i. partial i f (h t) * derivative (\\s. h s$i) t)) (atreal t)
      #|  lhs = rhs
      #|  sum _1 _2
      #|  sum _1 _2
      #|  (lift o f) differentiable at (y + t % e) ==>\n\t((f o (\\t. y + t % e)) has_real_derivative\n\t\tsum (1..dimindex (:N)) (\\i. e$i * (partial i f o (\\t. y + t % e)) t)) (atreal t)
      #|  :real^N -> real
      #|  :real^N -> real
      #|  (lift o f) differentiable at y
      #|  u real_differentiable atreal (f y) ==>\n\tpartial i (u o f) y = derivative u (f y) * partial i f y
      #|  partial i (\\x. --f x) y = --partial i f y
      #|  partial i (\\x. c * f x) y = c * partial i f y
      #|  (lift o g) differentiable at y
      #|  partial i (\\x. f x + g x) y = partial i f y + partial i g y
      #|  partial i (\\x. f x - g x) y = partial i f y - partial i g y
      #|  (h o drop) differentiable at (lift (&0))
      #|  h (&0) = y
      #|  (\\x. f x * g x) o h = (\\t. (f o h) t * (g o h) t)
      #|  \\t. y + t % basis i
      #|  partial i (\\x. f x * g x) y = partial i f y * g y + f y * partial i g y
      #|  f real_differentiable atreal x ==>\n\tderivative f x = derivative (f o (\\t. x + t)) (&0)
      #|  :real^N->real
      #|  &0 <= y$j - x$j
      #|  h = g o (\\t'. t + t')
      #|  f o _
      #|  forall t. t IN s ==> (g has_real_derivative (partial j f (y' + t % basis j))) (atreal t within s)
      #|  forall t. t IN s ==> y' + t % basis j IN interval [x,z]
      #|  real_interval [&0, y$j - x$j]
      #|  f y = g (y$j - x$j)
      #|  f y' = g (&0)
      #|  f o (\\t. y' + t % basis j)
      #|  ~(i = j)
      #|  y' = y
      #|  f y' <= f y
      #|  (lambda i. if i = j then x$j else y$i):real^N
      #|  (forall i. i IN 1..dimindex (:N) ==> ~(i = j) ==> u$i = z$i) ==>\n\tu$j = x$j ==>\n\t(forall y. y IN interval [x,z] ==> (lift o f) differentiable at y) ==>\n\t(forall y. y IN interval [x,z] ==> &0 <= partial j f y) ==>\n\t(forall y. y IN interval [x,u] ==> lo <= f y) ==>\n\t(forall y. y IN interval [x,z] ==> lo <= f y)
      #|  i = j
      #|  j IN 1..dimindex (:N)
      #|  i = j
      #|  ~P <=> (P <=> F)
      #|  i = j
      #|  \\t. partial j f (y' + t % basis j)
      #|  &0
      #|  y$j - x$j
      #|  (forall i. i IN 1..dimindex (:N) ==> ~(i = j) ==> u$i = z$i) ==>\n\tu$j = x$j ==>\n\t(forall y. y IN interval [x,z] ==> (lift o f) differentiable at y) ==>\n\t(forall y. y IN interval [x,z] ==> partial j f y <= &0) ==>\n\t(forall y. y IN interval [x,u] ==> f y <= hi) ==>\n\t(forall y. y IN interval [x,z] ==> f y <= hi)
      #|  (\\p. -- f p)
      #|  --hi
      #|  forall net. (\\x. p + x) differentiable net
      #|  lift o f differentiable at (p + y) ==>\n\tpartial i (f o (\\x. p + x)) y = partial i f (p + y)
      #|  forall net. (\\x. p - x) differentiable net
      #|  lift o f differentiable at (p - y) ==>\n\tpartial i (f o (\\x. p - x)) y = --partial i f (p - y)
      #|  forall x z y:real^N. x + z - (x + z - y) = y
      #|  forall x z p. x + z - p = (x + z) - p:real^N
      #|  dP
      #|  forall y. _ y
      #|  forall p. p IN interval [x,z] ==> x + (z - p) IN interval [x,z]
      #|  ~(i = j)
      #|  (forall i. i IN 1..dimindex (:N) ==> ~(i = j) ==> u$i = x$i) ==>\n\tu$j = z$j ==>\n\t(forall y. y IN interval [x,z] ==> (lift o f) differentiable at y) ==>\n\t(forall y. y IN interval [x,z] ==> &0 <= partial j f y) ==>\n\t(forall y. y IN interval [u,z] ==> f y <= hi) ==>\n\t(forall y. y IN interval [x,z] ==> f y <= hi)
      #|  j IN 1..dimindex (:N)
      #|  f o (\\p:real^N. x + (z - p))
      #|  x + (z - u):real^N
      #|  x + z - y:real^N
      #|  FACT 0 = 1 /\\ FACT 1 = 1
      #|  0 <= 1
      #|  FACT (1 + 1) = 2
      #|  i <= 1 <=> i = 0 \\/ i = 1
      #|  0 + 1 = 1 /\\ ~(1 = 0) /\\ 1 + 1 = 2 /\\ ~(2 = 1) /\\ ~(2 = 0)
      #|  \\i. if i = 0 then f else if i = 1 then derivative f else nth_derivative 2 f
      #|  nth_diff_strong_int 2 (&0, &1) f ==>\n\t(forall t. interval_arith t (&0, &1) ==> abs (nth_derivative 2 f t) <= dd_bound) ==>\n\tabs (f (&1) - (f (&0) + derivative f (&0))) <= dd_bound / &2
      #|  1
      #|  real_interval [&0, &1]
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  &0
      #|  &1
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  FACT 1 = 1 /\\ FACT 0 = 1
      #|  0 + 1 = 1 /\\ ~(1 = 0)
      #|  \\i. if i = 0 then f else derivative f
      #|  (forall t. interval_arith t (&0, &1) ==> f real_differentiable atreal t /\\ \n\t\t\tabs (derivative f t) <= d_bound) ==>\n\tabs (f (&1) - f (&0)) <= d_bound
      #|  0
      #|  real_interval [&0, &1]
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  &0
      #|  &1
      #|  ~P <=> (P <=> F)
      #|  m_taylor_error f domain (w:real^N) error <=>\n\tforall x:real^N. x IN interval [domain] ==> sum (1..dimindex (:N)) (\\i. w$i * sum (1..dimindex (:N))\n\t\t(\\j. w$j * abs (partial j (partial i f) x))) <= error
      #|  m_taylor_partial_error f i domain (w:real^N) error <=>\n\t(forall x:real^N. x IN interval[domain] ==>\n\t\tsum (1..dimindex (:N)) (\\j. w$j * abs (partial j (partial i f) x)) <= error)
      #|  (forall i. i IN 1..dimindex (:N) ==> m_taylor_partial_error f i domain w (p_error i) /\\ &0 <= w$i) ==>\n\tsum (1..dimindex (:N)) (\\i. w$i * p_error i) <= error ==>\n\tm_taylor_error f domain (w:real^N) error
      #|  partial2 j i f = partial j (partial i f)
      #|  diff2 f x <=>\n\t?s. open s /\\ x IN s /\\ (forall y. y IN s ==> (lift o f) differentiable at y /\\\n\t\t(forall i. (lift o partial i f) differentiable at y))
      #|  diff2c f x <=> diff2 f x /\\\n\t(forall i j. (lift o partial2 j i f) continuous at x)
      #|  diff2c f x ==> diff2 f x
      #|  diff2 f x <=>\n\t?s. open s /\\ x IN s /\\ (forall y. y IN s ==> diff2 f y)
      #|  diff2 f (x + t % e) ==>\n\tf o (\\t. x + t % e) real_differentiable atreal t
      #|  diff2 f (x + t % e:real^N) ==>\n\tderivative (f o (\\t. x + t % e)) t =\n\tsum (1..dimindex (:N)) (\\i. e$i * (partial i f o (\\t. x + t % e)) t)
      #|  diff2 f (x + t % e:real^N) ==>\n\tpartial i f o (\\t. x + t % e) real_differentiable atreal t
      #|  t SUBSET s ==> x IN t ==> x IN s
      #|  d / &2
      #|  ball (x, d)
      #|  d / &2 * inv (norm e)
      #|  -- (d / &2 * inv (norm e))
      #|  norm y = d / &2
      #|  ((d / &2) * inv(norm e)) % e
      #|  --d
      #|  open s ==> x IN s ==>\n\t?a b. &0 IN real_interval (a, b) /\\ IMAGE (\\t. x + t % e) (real_interval (a, b)) SUBSET s
      #|  norm e = &0
      #|  d / &2
      #|  y - t
      #|  real_interval (p - d, p + d)
      #|  &0 < d
      #|  min (p - (a + t)) (b + t - p)
      #|  \\t. sum (1..dimindex(:N)) (\\i. e$i * (partial i f o (\\t. x + t % e)) t)
      #|  p - t
      #|  x + p % e IN s
      #|  real_interval (a + t, b + t)
      #|  diff2 f (x + t % e:real^N) ==> \n\tnth_diff_strong 2 (f o (\\t. x + t % e)) t
      #|  p - t
      #|  real_interval (a + t, b + t)
      #|  \\t. sum (1..dimindex(:N)) (\\i. e$i * (partial i f o (\\t. x + t % e)) t)
      #|  diff2 f (x + t % e:real^N) ==>\n\tnth_derivative 2 (f o (\\t. x + t % e)) t =\n\tsum (1..dimindex (:N)) (\\i. sum (1..dimindex (:N)) \n\t\t(\\j. e$i * e$j * (partial j (partial i f) o (\\t. x + t % e)) t))
      #|  diff2 f (x + t % e:real^N) ==>\n\t(partial i f o (\\t. x + t % e) has_real_derivative \n\tsum (1..dimindex (:N)) (\\j. e$j * (partial j (partial i f) o (\\t. x + t % e)) t)) (atreal t)
      #|  diff2 f (x + t % e:real^N) ==>\n\tderivative (partial i f o (\\t. x + t % e)) t = \n\t\tsum (1..dimindex (:N)) (\\j. e$j * (partial j (partial i f) o (\\t. x + t % e)) t)
      #|  sum _1 _2
      #|  diff2 f (x + t % e:real^N) ==>\n\tpartial i f o (\\t. x + t % e) real_differentiable atreal t
      #|  (\\x. c) o (\\t. x + t % basis i) = (\\x. c)
      #|  partial i (\\x:real^N. c) = (\\x. &0)
      #|  ~(i IN 1..dimindex (:N)) ==> partial i f = (\\x:real^N. &0)
      #|  forall f f' a. (forall x. abs x <= abs a ==> (f has_real_derivative f' x) (atreal x)) ==>\n\t(?t. abs t <= abs a /\\ f a - f (&0) = f' t * a)
      #|  &0 <= a
      #|  &0
      #|  &0
      #|  \\y:real^2. lift (G (y$1) (y$2) / (y$1 * y$2))
      #|  norm (t1 % basis j:real^N) + norm (t2 % basis i:real^N)
      #|  norm y
      #|  infnorm y < min r (d / &2)
      #|  abs (y$1) <= r /\\ abs (y$2) <= r /\\ abs (y$1) < d / &2 /\\ abs (y$2) < d / &2
      #|  &0 < abs (y$1) /\\ &0 < abs (y$2)
      #|  min r (d / &2)
      #|  ((\\y:real^2. lift (G (y$1) (y$2) / (y$1 * y$2))) --> lift (partial i (partial j f) x)) \n\t\t(at (vec 0) within {y | &0 < y$1 /\\ &0 < y$2})
      #|  norm (t2 % basis j:real^N) + norm (t1 % basis i:real^N)
      #|  norm y
      #|  infnorm y < min r (d / &2)
      #|  abs (y$1) <= r /\\ abs (y$2) <= r /\\ abs (y$1) < d / &2 /\\ abs (y$2) < d / &2
      #|  &0 < abs (y$1) /\\ &0 < abs (y$2)
      #|  min r (d / &2)
      #|  ((\\y:real^2. lift (G (y$1) (y$2) / (y$1 * y$2))) --> lift (partial j (partial i f) x)) \n\t\t(at (vec 0) within {y | &0 < y$1 /\\ &0 < y$2})
      #|  &2 = sqrt (&2 * &2)
      #|  infnorm y * sqrt (&2)
      #|  e * inv(&2) * sqrt(&2)
      #|  infnorm y = e / &2
      #|  &0 < e / (&2)
      #|  forall i. y$i = e / (&2)
      #|  e / &2 % (vec 1:real^2)
      #|  (vec 0:real^2) limit_point_of {y | &0 < y$1 /\\ &0 < y$2}
      #|  forall a. h * a * k = h * k * a
      #|  p = g k - g (&0)
      #|  _1 - _2
      #|  partial i f o (\\k. (x + t3 % basis i) + k % basis j)
      #|  forall h k. abs h <= r /\\ abs k <= r ==>\n\t(?t3 t4. G h k = h * k * partial j (partial i f) (x + t4 % basis j + t3 % basis i) \n\t\t/\\ abs t3 <= abs h /\\ abs t4 <= abs k)
      #|  forall h k. abs h <= r /\\ abs k <= r ==> \n\t\t(?t3. G h k = h * derivative (F2 k) t3 /\\ abs t3 <= abs h)
      #|  forall y e. (f o (\\h. y + h % e)) o (\\t. h + t) = f o (\\t. (y + h % e) + t % e)
      #|  derivative (f o (\\h. x + h % basis i)) h
      #|  forall h k. abs h <= r /\\ abs k <= r ==>\n\tderivative (F2 k) h = partial i f ((x + k % basis j) + h % basis i) - partial i f (x + h % basis i)
      #|  forall k. abs k <= r ==> forall h. abs h <= r ==> (F2 k) real_differentiable atreal h
      #|  forall k. F2 k = (\\h. (f o (\\h. (x + k % basis j) + h % basis i)) h - (f o (\\h. x + h % basis i)) h)
      #|  forall a. k * a * h = h * k * a
      #|  p = g h - g (&0)
      #|  _1 - _2
      #|  partial j f o (\\h. (x + t1 % basis j) + h % basis i)
      #|  forall h k. abs h <= r /\\ abs k <= r ==>\n\t(?t1 t2. G h k = h * k * partial i (partial j f) (x + t1 % basis j + t2 % basis i) \n\t\t/\\ abs t1 <= abs k /\\ abs t2 <= abs h)
      #|  forall h k. abs h <= r /\\ abs k <= r ==> \n\t\t(?t1. G h k = k * derivative (F1 h) t1 /\\ abs t1 <= abs k)
      #|  forall y e. (f o (\\k. y + k % e)) o (\\t. k + t) = f o (\\t. (y + k % e) + t % e)
      #|  derivative (f o (\\k. x + k % basis j)) k
      #|  forall h k. abs h <= r /\\ abs k <= r ==>\n\tderivative (F1 h) k = partial j f ((x + h % basis i) + k % basis j) - partial j f (x + k % basis j)
      #|  forall h. abs h <= r ==> forall k. abs k <= r ==> (F1 h) real_differentiable atreal k
      #|  forall h. F1 h = (\\k. (f o (\\k. (x + h % basis i) + k % basis j)) k - (f o (\\k. x + k % basis j)) k)
      #|  (forall h. abs h <= r ==> x + h % basis i IN s) /\\ (forall k. abs k <= r ==> x + k % basis j IN s)
      #|  abs h + abs k
      #|  e / &3 + e / &3
      #|  e / &3
      #|  ?r. &0 < r /\\ (forall h k. abs h <= r /\\ abs k <= r ==> (x + h % basis i) + k % basis j IN s)
      #|  G = \\h k. F2 k h - F2 k (&0)
      #|  forall h k. (x + k % basis j) + h % basis i = (x + h % basis i) + k % basis j
      #|  \\h k. F1 h k - F1 h (&0)
      #|  \\k h. f ((x + h % basis i) + k % basis j) - f (x + h % basis i)
      #|  \\h k. f ((x + k % basis j) + h % basis i) - f (x + k % basis j)
      #|  diff2c f x ==> partial2 i j f x = partial2 j i f (x:real^N)
      #|  i IN 1..dimindex (:N)
      #|  j IN 1..dimindex (:N)
      #|  h % basis i:real^N
      #|  k % basis j:real^N
      #|  &0
      #|  &0
      #|  F1 h
      #|  derivative (F1 h)
      #|  derivative g
      #|  F2 k
      #|  derivative (F2 k)
      #|  derivative g
      #|  &2
      #|  y$1
      #|  y$2
      #|  y$1
      #|  y$2
      #|  at (vec 0:real^2) within {y:real^2 | &0 < y$1 /\\ &0 < y$2}
      #|  m_cell_domain (x:real^N, z:real^N) (y:real^N) (w:real^N) <=>\n\tforall i. i IN 1..dimindex (:N) ==> x$i <= y$i /\\ y$i <= z$i /\\ max (y$i - x$i) (z$i - y$i) <= w$i
      #|  m_bounded_on_int (f:real^N->real) domain f_bounds <=>\n\tforall x. x IN interval [domain] ==> interval_arith (f x) f_bounds
      #|  diff2_domain domain f <=>\n\tforall x. x IN interval [domain] ==> diff2 f x
      #|  diff2c_domain domain f <=>\n\tforall x. x IN interval [domain] ==> diff2c f x
      #|  diff2c_domain domain f <=> diff2_domain domain f /\\\n\t(forall x. x IN interval [domain] ==> forall i j. (lift o partial2 j i f) continuous at x)
      #|  m_cell_domain domain y w ==> y IN interval [domain]
      #|  m_cell_domain domain y (w:real^N) ==> \n\tp IN interval [domain] ==>\n\tforall i. i IN 1..dimindex (:N) ==> abs (p$i - y$i) <= w$i
      #|  (\\(i,j). g j i) = (\\(i,j). g i j) o f
      #|  j, i
      #|  s1 = IMAGE f s2
      #|  \\(i,j):num#num. j, i
      #|  {i, j | (1 <= i /\\ i <= n) /\\ 1 <= j /\\ j <= i - 1}
      #|  {i, j | (1 <= i /\\ i <= n) /\\ i + 1 <= j /\\ j <= n}
      #|  sum (1..n) (\\i. sum (i + 1..n) (\\j. g i j)) = \n\t\t\tsum (1..n) (\\i. sum (1..i - 1) (\\j. g j i))
      #|  forall a b c. a * b * c = b * a * c
      #|  forall a b c. (a + b) + c = (a + c) + b
      #|  s3 = sum (1..n) (\\i. sum (i + 1..n) (\\j. g i j))
      #|  s3 = sum (1..n) (\\i. sum (1..i - 1) (\\j. g i j))
      #|  sum _1 _2
      #|  s2 = sum (1..n) (\\i. g i i + sum (1..i - 1) (\\j. g i j))
      #|  sum _1 _2
      #|  s1 = sum (1..n) (\\i. sum (1..n) (\\j. g i j))
      #|  sum _1 _2
      #|  dimindex (:N)
      #|  \\i j. w$i * w$j * abs (partial2 j i f x)
      #|  forall g1 g2. (forall x. x IN interval [domain] ==> g1 x = g2 x) ==> \n\t((forall x. x IN interval [domain] ==> g1 x <= error) <=> (forall x. x IN interval [domain] ==> g2 x <= error))
      #|  diff2c_domain domain f ==> \n\t(m_taylor_error f domain (w:real^N) error <=>\n\t(forall x. x IN interval [domain] ==> \n\tsum (1..dimindex (:N)) (\\i. w$i * (w$i * abs (partial2 i i f x)\n\t\t+ &2 * sum (1..i - 1) (\\j. w$j * abs (partial2 j i f x)))) <= error))
      #|  g i
      #|  sum _1 _2
      #|  sum _1 _2
      #|  y + t % (p - y) = (&1 - t) % y + t % p:real^N
      #|  y + t % (p - y) IN interval [domain]
      #|  m_cell_domain domain y (w:real^N) ==>\n\tp IN interval [domain] ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_error f domain w dd_bound ==>\n\t(forall t. interval_arith t (&0, &1) ==> \n\t\tabs (nth_derivative 2 (f o (\\t. y + t % (p - y))) t) <= dd_bound)
      #|  y + t % (p - y) = (&1 - t) % y + t % p:real^N
      #|  forall t. interval_arith t (&0, &1) ==> y + t % (p - y) IN interval [domain]
      #|  m_cell_domain domain y (w:real^N) ==>\n\tp IN interval [domain] ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_error f domain w dd_bound ==>\n\tabs (f p - (f y + sum (1..dimindex (:N)) (\\i. (p - y)$i * partial i f y))) <= dd_bound / &2
      #|  f o (\\t. y + t % (p - y))
      #|  abs s
      #|  (f y + s) + dd_bound / &2
      #|  sum _1 _2
      #|  m_cell_domain domain y (w:real^N) ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_error f domain w dd_bound ==>\n\tf y <= hi ==>\n\thi + sum(1..dimindex (:N)) (\\i. w$i * abs (partial i f y)) + dd_bound / &2 <= hi_bound ==>\n\tforall p. p IN interval [domain] ==> f p <= hi_bound
      #|  forall x y e. abs (x - y) <= e ==> x <= y + e
      #|  --abs s
      #|  (f y + s) - dd_bound / &2
      #|  sum _1 _2
      #|  m_cell_domain domain y (w:real^N) ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_error f domain w dd_bound ==>\n\tlo <= f y ==>\n\tlo_bound <= lo - (sum(1..dimindex (:N)) (\\i. w$i * abs (partial i f y)) + dd_bound / &2) ==>\n\tforall p. p IN interval [domain] ==> lo_bound <= f p
      #|  forall x y e. abs (x - y) <= e ==> y - e <= x
      #|  hi + err_bound
      #|  lo - err_bound
      #|  m_cell_domain domain y (w:real^N) ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_error f domain w dd_bound ==>\n\tinterval_arith (f y) (lo, hi) ==>\n\tsum(1..dimindex (:N)) (\\i. w$i * abs(partial i f y)) + dd_bound / &2 <= err_bound ==>\n\tlo_bound <= lo - err_bound ==>\n\thi + err_bound <= hi_bound ==>\n\tm_bounded_on_int f domain (lo_bound, hi_bound)
      #|  y + t % (p - y) = (&1 - t) % y + t % p:real^N
      #|  y + t % (p - y) IN interval [domain]
      #|  m_cell_domain domain y (w:real^N) ==>\n\tp IN interval [domain] ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_partial_error f i domain w d_bound ==>\n\t(forall t. interval_arith t (&0, &1) ==> \n\t\tabs (derivative (partial i f o (\\t. y + t % (p - y))) t) <= d_bound)
      #|  y + t % (p - y) = (&1 - t) % y + t % p:real^N
      #|  forall t. interval_arith t (&0, &1) ==> y + t % (p - y) IN interval [domain]
      #|  m_cell_domain domain y (w:real^N) ==>\n\tp IN interval [domain] ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_partial_error f i domain w dd_bound ==>\n\tabs (partial i f p - partial i f y) <= dd_bound
      #|  partial i f o (\\t. y + t % (p - y))
      #|  m_cell_domain domain y (w:real^N) ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_partial_error f i domain w dd_bound ==>\n\tpartial i f y <= hi ==>\n\thi + dd_bound <= hi_bound ==>\n\tforall p. p IN interval [domain] ==> partial i f p <= hi_bound
      #|  forall x y e. abs (x - y) <= e ==> x <= y + e
      #|  m_cell_domain domain y (w:real^N) ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_partial_error f i domain w dd_bound ==>\n\tlo <= partial i f y ==>\n\tlo_bound <= lo - dd_bound ==>\n\tforall p. p IN interval [domain] ==> lo_bound <= partial i f p
      #|  forall x y e. abs (x - y) <= e ==> y - e <= x
      #|  m_cell_domain domain y (w:real^N) ==>\n\tdiff2_domain domain f ==>\n\tm_taylor_partial_error f i domain w dd_bound ==>\n\tinterval_arith (partial i f y) (lo, hi) ==>\n\tlo_bound <= lo - dd_bound ==>\n\thi + dd_bound <= hi_bound ==>\n\tm_bounded_on_int (partial i f) domain (lo_bound, hi_bound)
      #|  :real^N -> real
      #|  :real^N -> real
      #|  :real^N
      #|  :real^N#real^N
      #|  f differentiable at x ==>\topen s ==> x IN s ==> (forall y. y IN s ==> g y = f y) ==>\n\t\tg differentiable at x
      #|  diff2 f x ==> diff2 (\\x. c * f x) x
      #|  lift o (\\x. c * partial i f x)
      #|  diff2 f x ==> diff2 (\\x. --f x) x
      #|  --(&1)
      #|  (\\x. u' % f' x) = (\\x. u' % x) o f'
      #|  lift o u o f = (lift o u o drop) o (lift o f)
      #|  (lift o f has_derivative f') (at x) ==>\n\t(u has_real_derivative u') (atreal (f x)) ==>\n\t(lift o u o f has_derivative (\\x. u' % f' x)) (at x)
      #|  \\x. u' % f' x
      #|  lift o f differentiable at x ==> \n\tu real_differentiable atreal (f x) ==>\n\tlift o u o f differentiable at x
      #|  lift o (\\y. derivative u (f y) * partial i f y)
      #|  open r
      #|  {z | z IN s /\\ (lift o f) z IN (IMAGE lift t)}
      #|  diff2 f x ==> nth_diff_strong 2 u (f x) ==> diff2 (u o f) x
      #|  derivative u
      #|  &0 < f x ==> diff2 f x ==> diff2 (abs o f) x
      #|  f x < &0 ==> diff2 f x ==> diff2 (abs o f) x
      #|  diff2 f x ==> diff2 ((\\x. x pow n) o f) x
      #|  ~(f x = &0) ==> diff2 f x ==> diff2 (inv o f) x
      #|  &0 < f x ==> diff2 f x ==> diff2 (sqrt o f) x
      #|  diff2 f x ==> diff2 (atn o f) x
      #|  diff2 f x ==> diff2 (cos o f) x
      #|  diff2 f x ==> diff2 (sin o f) x
      #|  diff2 f x ==> diff2 (exp o f) x
      #|  &0 < f x ==> diff2 f x ==> diff2 (log o f) x
      #|  abs (f x) < &1 ==> diff2 f x ==> diff2 (acs o f) x
      #|  abs (f x) < &1 ==> diff2 f x ==> diff2 (asn o f) x
      #|  -- &1 < f x ==> diff2 f x ==> diff2 (matan o f) x
      #|  s INTER t
      #|  diff2 f x ==> diff2 g x ==> diff2 (\\x. f x + g x) x
      #|  s INTER t
      #|  lift o (\\x. partial i f x + partial i g x)
      #|  diff2 f x ==> diff2 g x ==> diff2 (\\x. f x - g x) x
      #|  s INTER t
      #|  diff2 f x ==> diff2 g x ==> diff2 (\\x. f x * g x) x
      #|  s INTER t
      #|  lift o (\\x. partial i f x * g x + f x * partial i g x)
      #|  diff2_domain domain f
      #|  diff2_domain domain (\\x. c * f x)
      #|  diff2_domain domain (\\x. --f x)
      #|  :real#real
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_not_zero bounds ==> diff2_domain domain (inv o f)
      #|  ~P <=> (P <=> F)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_pos bounds ==> diff2_domain domain (sqrt o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_pos bounds ==> diff2_domain domain (abs o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_neg bounds ==> diff2_domain domain (abs o f)
      #|  diff2_domain domain ((\\x. x pow n) o f)
      #|  diff2_domain domain (atn o f)
      #|  diff2_domain domain (cos o f)
      #|  diff2_domain domain (sin o f)
      #|  diff2_domain domain (exp o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_pos bounds ==> diff2_domain domain (log o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tiabs bounds < &1 ==> diff2_domain domain (acs o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tiabs bounds < &1 ==> diff2_domain domain (asn o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_gt (-- &1) bounds ==> diff2_domain domain (matan o f)
      #|  T
      #|  diff2_domain domain g
      #|  diff2_domain domain (\\x. f x + g x)
      #|  diff2_domain domain (\\x. f x - g x)
      #|  diff2_domain domain (\\x. f x * g x)
      #|  diff2 f x ==> (lift o f) differentiable at x
      #|  diff2 f x ==> (lift o partial i f) differentiable at x
      #|  real_interval (a, b)
      #|  g o (\\t. x + t % basis i)
      #|  (lift o f) differentiable at x ==>\n\topen s ==> x IN s ==> (forall y:real^N. y IN s ==> f y = g y) ==>\n\tpartial i f x = partial i g x
      #|  lift o f
      #|  basis i:real^N
      #|  :num
      #|  :num
      #|  diff2 f x ==> partial2 i j (\\x. c * f x) x = c * partial2 i j f x
      #|  diff2 f x ==> partial2 i j (\\x. --f x) x = --partial2 i j f x
      #|  --(&1)
      #|  s INTER t
      #|  diff2 f x ==> diff2 g x ==> \n\tpartial2 i j (\\x. f x + g x) x = partial2 i j f x + partial2 i j g x
      #|  diff2 f x ==> diff2 g x ==> \n\tpartial2 i j (\\x. f x - g x) x = partial2 i j f x - partial2 i j g x
      #|  s INTER t
      #|  diff2 f x ==> diff2 g x ==> \n\tpartial2 i j (\\x. f x * g x) x = (partial2 i j f x * g x + partial j f x * partial i g x) +\n\t\t(partial i f x * partial j g x + f x * partial2 i j g x)
      #|  lift o (\\y. derivative u (f y) * partial j f y)
      #|  open r
      #|  {z | z IN s /\\ (lift o f) z IN (IMAGE lift t)}
      #|  diff2 f x ==> nth_diff_strong 2 u (f x) ==>\n\tpartial2 i j (u o f) x = (nth_derivative 2 u (f x) * partial i f x) * partial j f x +\n\t\t\t\tderivative u (f x) * partial2 i j f x
      #|  derivative u
      #|  derivative u
      #|  min d0 d1
      #|  g real_continuous at x ==> open s ==> x IN s ==>\n\t(forall y. y IN s ==> f y = g y) ==> f real_continuous at x
      #|  IMAGE lift t
      #|  v o drop
      #|  v real_continuous atreal x ==> real_open t ==> x IN t ==>\n\t(forall y. y IN t ==> u y = v y) ==> u real_continuous atreal x
      #|  :real^N -> real
      #|  :real^N -> real
      #|  :real^N
      #|  :real^N#real^N
      #|  (\\x. c * partial2 j i f x)
      #|  diff2c f x ==> diff2c (\\x. c * f x) x
      #|  diff2c f x ==> diff2c (\\x. --f x) x
      #|  --(&1)
      #|  nth_diff_strong n u x ==>\n\t?s. real_open s /\\ x IN s /\\ (forall y. y IN s ==> nth_diff_strong n u y)
      #|  diff2 f x ==> f real_continuous at x
      #|  diff2 f x ==> (partial i f) real_continuous at x
      #|  2
      #|  derivative u _
      #|  nth_derivative 2 u _1
      #|  (\\x. (nth_derivative 2 u (f x) * partial j f x) * partial i f x + derivative u (f x) * partial2 j i f x)
      #|  open r
      #|  {z | z IN s /\\ (lift o f) z IN (IMAGE lift t)}
      #|  diff2c f x ==> nth_diff_strong 2 u (f x) ==>\n\t(nth_derivative 2 u) real_continuous atreal (f x) ==> diff2c (u o f) x
      #|  real_open s ==> real_open (s DELETE x)
      #|  lift x
      #|  UNIV DELETE (&0)
      #|  \\x. &2 * inv (x pow 3)
      #|  ~(f x = &0) ==> diff2c f x ==> diff2c (inv o f) x
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  (\\x. sqrt (x pow 3)) = (sqrt o (\\x. x pow 3))
      #|  f x
      #|  {x | x > &0}
      #|  \\x. -- inv (&4 * sqrt (x pow 3))
      #|  &0 < f x ==> diff2c f x ==> diff2c (sqrt o f) x
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  f x
      #|  {x | x > &0}
      #|  \\x. &0
      #|  &0 < f x ==> diff2c f x ==> diff2c (abs o f) x
      #|  f x
      #|  {x | x < &0}
      #|  \\x. &0
      #|  f x < &0 ==> diff2c f x ==> diff2c (abs o f) x
      #|  diff2c f x ==> diff2c ((\\x. x pow n) o f) x
      #|  diff2c f x ==> diff2c (atn o f) x
      #|  f x
      #|  diff2c f x ==> diff2c (cos o f) x
      #|  diff2c f x ==> diff2c (sin o f) x
      #|  diff2c f x ==> diff2c (exp o f) x
      #|  f x
      #|  {x | x > &0}
      #|  \\x. -- inv (x pow 2)
      #|  &0 < f x ==> diff2c f x ==> diff2c (log o f) x
      #|  (\\x. sqrt ((&1 - x * x) pow 3)) = sqrt o (\\x. (&1 - x * x) pow 3)
      #|  forall a. &1 - a * a = (&1 - a) * (&1 + a)
      #|  &0 < (&1 - f x * f x) pow 3
      #|  f x
      #|  {x | x < &1} INTER {x | x > -- &1}
      #|  \\x. --(x / sqrt ((&1 - x * x) pow 3))
      #|  abs (f x) < &1 ==> diff2c f x ==> diff2c (acs o f) x
      #|  ~P <=> (P <=> F)
      #|  (\\x. sqrt ((&1 - x * x) pow 3)) = sqrt o (\\x. (&1 - x * x) pow 3)
      #|  forall a. &1 - a * a = (&1 - a) * (&1 + a)
      #|  &0 < (&1 - f x * f x) pow 3
      #|  f x
      #|  {x | x < &1} INTER {x | x > -- &1}
      #|  \\x. x / sqrt ((&1 - x * x) pow 3)
      #|  abs (f x) < &1 ==> diff2c f x ==> diff2c (asn o f) x
      #|  ~P <=> (P <=> F)
      #|  h (f x)
      #|  \\i. -- &1 pow (i + 2) * &((i + 1) * (i + 2)) / &(2 * i + 5)
      #|  real_interval (&0, f x + &1)
      #|  \\x. (&3 / &4 * atn (sqrt x) / (x pow 2 * sqrt x) - &3 / &4 * inv (x pow 2 * (x + &1))) - &1 / &2 * inv (x * (x + &1) pow 2)
      #|  -- &1 < f x ==> diff2c f x ==> diff2c (matan o f) x
      #|  f x < &1
      #|  atn
      #|  ddmatan
      #|  from 0
      #|  &1
      #|  s INTER t
      #|  (\\x. partial2 j i f x + partial2 j i g x)
      #|  diff2c f x ==> diff2c g x ==> diff2c (\\x. f x + g x) x
      #|  diff2c f x ==> diff2c g x ==> diff2c (\\x. f x - g x) x
      #|  s INTER t
      #|  (\\x. (partial2 j i f x * g x + partial i f x * partial j g x) + \n\tpartial j f x  * partial i g x + f x * partial2 j i g x)
      #|  diff2c f x ==> diff2c g x ==> diff2c (\\x. f x * g x) x
      #|  :real^N -> real
      #|  :real^N -> real
      #|  diff2c_domain domain f
      #|  diff2c_domain domain (\\x. c * f x)
      #|  diff2c_domain domain (\\x. --f x)
      #|  :real#real
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_not_zero bounds ==> diff2c_domain domain (inv o f)
      #|  ~P <=> (P <=> F)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_pos bounds ==> diff2c_domain domain (sqrt o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_pos bounds ==> diff2c_domain domain (abs o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_neg bounds ==> diff2c_domain domain (abs o f)
      #|  diff2c_domain domain ((\\x. x pow n) o f)
      #|  diff2c_domain domain (atn o f)
      #|  diff2c_domain domain (cos o f)
      #|  diff2c_domain domain (sin o f)
      #|  diff2c_domain domain (exp o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_pos bounds ==> diff2c_domain domain (log o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tiabs bounds < &1 ==> diff2c_domain domain (acs o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tiabs bounds < &1 ==> diff2c_domain domain (asn o f)
      #|  m_bounded_on_int f domain bounds ==>\n\tinterval_gt (-- &1) bounds ==> diff2c_domain domain (matan o f)
      #|  T
      #|  diff2c_domain domain g
      #|  diff2c_domain domain (\\x. f x + g x)
      #|  diff2c_domain domain (\\x. f x - g x)
      #|  diff2c_domain domain (\\x. f x * g x)
      #|  :real^N -> real
      #|  :real^N -> real
      #|  :real#real
      #|  :(real#real)list
      #|  :real^N
      #|  (lift o f) differentiable at x ==>\n\tinterval_arith (--f x) bounds ==>\n\tall_n 1 d_bounds_list (\\i int. interval_arith (--partial i f x) int) ==>\n\tm_lin_approx (\\x. --f x) x bounds d_bounds_list
      #|  (lift o f) differentiable at x ==>\n\tinterval_arith (c * f x) bounds ==>\n\tall_n 1 d_bounds_list (\\i int. interval_arith (c * partial i f x) int) ==>\n\tm_lin_approx (\\x. c * f x) x bounds d_bounds_list
      #|  (lift o f) differentiable at x ==>\n\t(lift o g) differentiable at x ==>\n\tinterval_arith (f x + g x) bounds ==>\n\tall_n 1 d_bounds_list (\\i int. interval_arith (partial i f x + partial i g x) int) ==>\n\tm_lin_approx (\\x. f x + g x) x bounds d_bounds_list
      #|  (lift o f) differentiable at x ==>\n\t(lift o g) differentiable at x ==>\n\tinterval_arith (f x - g x) bounds ==>\n\tall_n 1 d_bounds_list (\\i int. interval_arith (partial i f x - partial i g x) int) ==>\n\tm_lin_approx (\\x. f x - g x) x bounds d_bounds_list
      #|  (lift o f) differentiable at x ==>\n\t(lift o g) differentiable at x ==>\n\tinterval_arith (f x * g x) bounds ==>\n\tall_n 1 d_bounds_list (\\i int. interval_arith (partial i f x * g x + f x * partial i g x) int) ==>\n\tm_lin_approx (\\x. f x * g x) x bounds d_bounds_list
      #|  second_bounded f domain dd_bounds_list <=>\n\tforall x. x IN interval [domain] ==> all_n 1 dd_bounds_list\n\t\t(\\i list_i. all_n 1 list_i (\\j int. interval_arith (partial2 j i f x) int))
      #|  m_taylor_interval f domain y w f_bounds d_bounds_list dd_bounds_list <=>\n\t\tm_cell_domain domain y w /\\\n\t\tdiff2c_domain domain f /\\\n\t\tm_lin_approx f y f_bounds d_bounds_list /\\\n\t\tsecond_bounded f domain dd_bounds_list
      #|  :real^N -> real
      #|  :real^N -> real
      #|  :real^N
      #|  :real^N
      #|  :real^N
      #|  :real^N
      #|  :real^N#real^N
      #|  :real#real
      #|  :real#real
      #|  :real#real
      #|  :(real#real)list
      #|  :(real#real)list
      #|  :(real#real)list
      #|  :((real#real)list)list
      #|  :((real#real)list)list
      #|  :((real#real)list)list
      #|  m_cell_domain domain y w
      #|  diff2c_domain domain f
      #|  m_bounded_on_int f domain f_bounds ==> interval_not_zero f_bounds ==>\n\tm_lin_approx (inv o f) y bounds d_bounds_list ==>\n\tsecond_bounded (inv o f) domain dd_bounds_list ==>\n\tm_taylor_interval (inv o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> interval_pos f_bounds ==>\n\tm_lin_approx (sqrt o f) y bounds d_bounds_list ==>\n\tsecond_bounded (sqrt o f) domain dd_bounds_list ==>\n\tm_taylor_interval (sqrt o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> interval_pos f_bounds ==>\n\tm_lin_approx (abs o f) y bounds d_bounds_list ==>\n\tsecond_bounded (abs o f) domain dd_bounds_list ==>\n\tm_taylor_interval (abs o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> interval_neg f_bounds ==>\n\tm_lin_approx (abs o f) y bounds d_bounds_list ==>\n\tsecond_bounded (abs o f) domain dd_bounds_list ==>\n\tm_taylor_interval (abs o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx ((\\x. x pow n) o f) y bounds d_bounds_list ==>\n\tsecond_bounded ((\\x. x pow n) o f) domain dd_bounds_list ==>\n\tm_taylor_interval ((\\x. x pow n) o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (atn o f) y bounds d_bounds_list ==>\n\tsecond_bounded (atn o f) domain dd_bounds_list ==>\n\tm_taylor_interval (atn o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (cos o f) y bounds d_bounds_list ==>\n\tsecond_bounded (cos o f) domain dd_bounds_list ==>\n\tm_taylor_interval (cos o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (sin o f) y bounds d_bounds_list ==>\n\tsecond_bounded (sin o f) domain dd_bounds_list ==>\n\tm_taylor_interval (sin o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (exp o f) y bounds d_bounds_list ==>\n\tsecond_bounded (exp o f) domain dd_bounds_list ==>\n\tm_taylor_interval (exp o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> interval_pos f_bounds ==>\n\tm_lin_approx (log o f) y bounds d_bounds_list ==>\n\tsecond_bounded (log o f) domain dd_bounds_list ==>\n\tm_taylor_interval (log o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> iabs f_bounds < &1 ==>\n\tm_lin_approx (acs o f) y bounds d_bounds_list ==>\n\tsecond_bounded (acs o f) domain dd_bounds_list ==>\n\tm_taylor_interval (acs o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> iabs f_bounds < &1 ==>\n\tm_lin_approx (asn o f) y bounds d_bounds_list ==>\n\tsecond_bounded (asn o f) domain dd_bounds_list ==>\n\tm_taylor_interval (asn o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_bounded_on_int f domain f_bounds ==> interval_gt (-- &1) f_bounds ==>\n\tm_lin_approx (matan o f) y bounds d_bounds_list ==>\n\tsecond_bounded (matan o f) domain dd_bounds_list ==>\n\tm_taylor_interval (matan o f) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (\\x. --f x) y bounds d_bounds_list ==>\n\tsecond_bounded (\\x. --f x) domain dd_bounds_list ==>\n\tm_taylor_interval (\\x. --f x) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (\\x. c * f x) y bounds d_bounds_list ==>\n\tsecond_bounded (\\x. c * f x) domain dd_bounds_list ==>\n\tm_taylor_interval (\\x. c * f x) domain y w bounds d_bounds_list dd_bounds_list
      #|  diff2c_domain domain g
      #|  m_lin_approx (\\x. f x + g x) y bounds d_bounds_list ==>\n\tsecond_bounded (\\x. f x + g x) domain dd_bounds_list ==>\n\tm_taylor_interval (\\x. f x + g x) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (\\x. f x - g x) y bounds d_bounds_list ==>\n\tsecond_bounded (\\x. f x - g x) domain dd_bounds_list ==>\n\tm_taylor_interval (\\x. f x - g x) domain y w bounds d_bounds_list dd_bounds_list
      #|  m_lin_approx (\\x. f x * g x) y bounds d_bounds_list ==>\n\tsecond_bounded (\\x. f x * g x) domain dd_bounds_list ==>\n\tm_taylor_interval (\\x. f x * g x) domain y w bounds d_bounds_list dd_bounds_list
      #|  :real^N->real
      #|  &0 < b ==> (a / b <= &1 <=> a <= b)
      #|  DISJOINT ((1..dimindex (:N)) DELETE j) {j}
      #|  1..dimindex (:N) = ((1..dimindex (:N)) DELETE j) UNION {j}
      #|  forall t. t IN s ==> nth_derivative 2 g t = partial2 j j f (y1 + t % basis j)
      #|  h = g o (\\t'. t + t')
      #|  f o _
      #|  forall t. t IN s ==> derivative g t = partial j f (y1 + t % basis j)
      #|  forall t. t IN s ==> nth_diff_strong 2 g t
      #|  forall t. t IN s ==> y1 + t % basis j IN interval [x,z]
      #|  real_interval _
      #|  forall a. &0 < a ==> &0 <= a
      #|  real_interval [&0, z$j - x$j]
      #|  forall a. &0 < a ==> &0 <= a
      #|  &0 <= t /\\ t <= &1 /\\ y$j - x$j = (&1 - t) * &0 + t * (z$j - x$j)
      #|  y$j
      #|  forall a b. &0 < a - b <=> ~(a = b) /\\ b <= a
      #|  &0 < z$j - x$j
      #|  (y$j - x$j) / (z$j - x$j)
      #|  y$j = x$j
      #|  f y2 = g (z$j - x$j)
      #|  f y = g (y$j - x$j)
      #|  y = y1 + (y$j - x$j) % basis j /\\ y2 = y1 + (z$j - x$j) % basis j
      #|  f y1 = g (&0)
      #|  f o (\\t. y1 + t % basis j)
      #|  f y <= max (f y1) (f y2)
      #|  ~(i = j)
      #|  y1 = y
      #|  y1 IN interval [x,u] /\\ y2 IN interval [v,z]
      #|  (lambda i. if i = j then z$j else y$i):real^N
      #|  (lambda i. if i = j then x$j else y$i):real^N
      #|  (forall i. i IN 1..dimindex (:N) ==> ~(i = j) ==> u$i = z$i /\\ v$i = x$i) ==>\n\tu$j = x$j ==> v$j = z$j ==>\n\tdiff2_domain (x,z) f ==>\n\t(forall y. y IN interval [x,z] ==> &0 <= partial2 j j f y) ==>\n\t(forall y. y IN interval [x,u] ==> f y <= hi) ==>\n\t(forall y. y IN interval [v,z] ==> f y <= hi) ==>\n\t(forall y. y IN interval [x,z] ==> f y <= hi)
      #|  i = j
      #|  i = j
      #|  j IN 1..dimindex (:N)
      #|  i = j
      #|  i = j
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  z$j = x$j
      #|  ~P <=> (P <=> F)
      #|  i = j
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  ~P <=> (P <=> F)
      #|  derivative g
      #|  nth_derivative 2 g
      #|  z$j - x$j
      #|  &0
      #|  lift o (\\x. c) = (\\x. lift c)
      #|  lift o (\\x. f x) = (\\x. lift (f x))
      #|  (:real^N)
      #|  diff2 (\\x:real^N. c) x
      #|  diff2_domain domain (\\x:real^N. c)
      #|  partial2 i j (\\x:real^N. c) = (\\x. &0)
      #|  diff2c (\\x:real^N. c) x
      #|  diff2c_domain domain (\\x:real^N. c)
      #|  (\\x. x$k) o (\\t. x + t % basis i) = (\\t. x$k + t * (basis i:real^N)$k)
      #|  partial i (\\x:real^N. x$k) = (\\x. (basis i:real^N)$k)
      #|  k IN 1..dimindex (:N) ==> \n\tpartial i (\\x:real^N. x$k) = (\\x. if i = k then &1 else &0)
      #|  partial2 i j (\\x:real^N. x$k) = (\\x. &0)
      #|  (:real^N)
      #|  k IN 1..dimindex (:N) ==> diff2 (\\x:real^N. x$k) x
      #|  k IN 1..dimindex (:N) ==> diff2_domain domain (\\x:real^N. x$k)
      #|  k IN 1..dimindex (:N) ==> diff2c (\\x:real^N. x$k) x
      #|  k IN 1..dimindex (:N) ==> diff2c_domain domain (\\x:real^N. x$k)
      #|Multivariate_taylor.IMAGE_DELETE_INJ_COMPAT =  |- (#forall:fun(fun(fun('?1,'?2),bool),bool) (\f:fun('?1,'?2). (#forall:fun(fun(fun('?1,bool),bool),bool) (\s:fun('?1,bool). (#forall:fun(fun('?1,bool),bool) (\a:'?1. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('?1,bool),bool) (\x:'?1. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?2,fun('?2,bool)) (f:fun('?1,'?2) x:'?1)) (f:fun('?1,'?2) a:'?1))) ((#=:fun('?1,fun('?1,bool)) x:'?1) a:'?1))))) ((#=:fun(fun('?2,bool),fun(fun('?2,bool),bool)) ((#IMAGE:fun(fun('?1,'?2),fun(fun('?1,bool),fun('?2,bool))) f:fun('?1,'?2)) ((#DELETE:fun(fun('?1,bool),fun('?1,fun('?1,bool))) s:fun('?1,bool)) a:'?1))) ((#DELETE:fun(fun('?2,bool),fun('?2,fun('?2,bool))) ((#IMAGE:fun(fun('?1,'?2),fun(fun('?1,bool),fun('?2,bool))) f:fun('?1,'?2)) s:fun('?1,bool))) (f:fun('?1,'?2) a:'?1))))))))))
      #|Multivariate_taylor.partial =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#derivative:fun(fun(real,real),fun(real,real)) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) (#basis:fun(num,cart(real,'N)) i:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Multivariate_taylor.all_n =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list('?3),fun(fun(num,fun('?3,bool)),bool))) n:num) #NIL:list('?3)) s:fun(num,fun('?3,bool)))) #T:bool)) ((#=:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list('?3),fun(fun(num,fun('?3,bool)),bool))) n:num) ((#CONS:fun('?3,fun(list('?3),list('?3))) h:'?3) t:list('?3))) s:fun(num,fun('?3,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((s:fun(num,fun('?3,bool)) n:num) h:'?3)) (((#all_n:fun(num,fun(list('?3),fun(fun(num,fun('?3,bool)),bool))) (#SUC:fun(num,num) n:num)) t:list('?3)) s:fun(num,fun('?3,bool))))))
      #|Multivariate_taylor.m_lin_approx =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\df_bounds_list:list(prod(real,real)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#=:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) f:fun(cart(real,'N),real)) x:cart(real,'N)) f_bounds:prod(real,real)) df_bounds_list:list(prod(real,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#/\:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(cart(real,'N),real) x:cart(real,'N))) f_bounds:prod(real,real))) (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) df_bounds_list:list(prod(real,real))) (\i:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) int:prod(real,real))))))))))))))))
      #|Multivariate_taylor.f_lift_neg =  |- (#forall:fun(fun(fun('?4,real),bool),bool) (\f:fun('?4,real). ((#=:fun(fun('?4,cart(real,1)),fun(fun('?4,cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun('?4,real),fun('?4,cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:'?4. (#real_neg:fun(real,real) (f:fun('?4,real) x:'?4))))) (\x:'?4. (#vector_neg:fun(cart(real,1),cart(real,1)) (((#o:fun(fun(real,cart(real,1)),fun(fun('?4,real),fun('?4,cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun('?4,real)) x:'?4))))))
      #|Multivariate_taylor.f_lift_scale =  |- (#forall:fun(fun(fun('?5,real),bool),bool) (\f:fun('?5,real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun('?5,cart(real,1)),fun(fun('?5,cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun('?5,real),fun('?5,cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:'?5. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun('?5,real) x:'?5))))) (\x:'?5. ((#%:fun(real,fun(cart(real,1),cart(real,1))) c:real) (((#o:fun(fun(real,cart(real,1)),fun(fun('?5,real),fun('?5,cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun('?5,real)) x:'?5))))))))
      #|Multivariate_taylor.f_lift_add =  |- (#forall:fun(fun(fun('?6,real),bool),bool) (\f:fun('?6,real). (#forall:fun(fun(fun('?6,real),bool),bool) (\g:fun('?6,real). ((#=:fun(fun('?6,cart(real,1)),fun(fun('?6,cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun('?6,real),fun('?6,cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:'?6. ((#real_add:fun(real,fun(real,real)) (f:fun('?6,real) x:'?6)) (g:fun('?6,real) x:'?6))))) (\x:'?6. ((#vector_add:fun(cart(real,1),fun(cart(real,1),cart(real,1))) (((#o:fun(fun(real,cart(real,1)),fun(fun('?6,real),fun('?6,cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun('?6,real)) x:'?6)) (((#o:fun(fun(real,cart(real,1)),fun(fun('?6,real),fun('?6,cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun('?6,real)) x:'?6))))))))
      #|Multivariate_taylor.f_lift_sub =  |- (#forall:fun(fun(fun('?7,real),bool),bool) (\f:fun('?7,real). (#forall:fun(fun(fun('?7,real),bool),bool) (\g:fun('?7,real). ((#=:fun(fun('?7,cart(real,1)),fun(fun('?7,cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun('?7,real),fun('?7,cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:'?7. ((#real_sub:fun(real,fun(real,real)) (f:fun('?7,real) x:'?7)) (g:fun('?7,real) x:'?7))))) (\x:'?7. ((#vector_sub:fun(cart(real,1),fun(cart(real,1),cart(real,1))) (((#o:fun(fun(real,cart(real,1)),fun(fun('?7,real),fun('?7,cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun('?7,real)) x:'?7)) (((#o:fun(fun(real,cart(real,1)),fun(fun('?7,real),fun('?7,cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun('?7,real)) x:'?7))))))))
      #|Multivariate_taylor.f_binary_drop =  |- (#forall:fun(fun(fun('?8,fun('?9,'?10)),bool),bool) (\op:fun('?8,fun('?9,'?10)). (#forall:fun(fun(fun(real,'?8),bool),bool) (\f:fun(real,'?8). (#forall:fun(fun(fun(real,'?9),bool),bool) (\g:fun(real,'?9). ((#=:fun(fun(cart(real,1),'?10),fun(fun(cart(real,1),'?10),bool)) ((#o:fun(fun(real,'?10),fun(fun(cart(real,1),real),fun(cart(real,1),'?10))) (\t:real. ((op:fun('?8,fun('?9,'?10)) (f:fun(real,'?8) t:real)) (g:fun(real,'?9) t:real)))) #drop:fun(cart(real,1),real))) (\x:cart(real,1). ((op:fun('?8,fun('?9,'?10)) (f:fun(real,'?8) (#drop:fun(cart(real,1),real) x:cart(real,1)))) (g:fun(real,'?9) (#drop:fun(cart(real,1),real) x:cart(real,1))))))))))))
      #|Multivariate_taylor.f_unary_drop =  |- (#forall:fun(fun(fun('?11,'?12),bool),bool) (\op:fun('?11,'?12). (#forall:fun(fun(fun(real,'?11),bool),bool) (\f:fun(real,'?11). ((#=:fun(fun(cart(real,1),'?12),fun(fun(cart(real,1),'?12),bool)) ((#o:fun(fun(real,'?12),fun(fun(cart(real,1),real),fun(cart(real,1),'?12))) (\t:real. (op:fun('?11,'?12) (f:fun(real,'?11) t:real)))) #drop:fun(cart(real,1),real))) (\x:cart(real,1). (op:fun('?11,'?12) (f:fun(real,'?11) (#drop:fun(cart(real,1),real) x:cart(real,1))))))))))
      #|Multivariate_taylor.frechet_compose =  |- (#forall:fun(fun(fun(cart(real,'?13),cart(real,'?14)),bool),bool) (\f:fun(cart(real,'?13),cart(real,'?14)). (#forall:fun(fun(fun(cart(real,'?15),cart(real,'?13)),bool),bool) (\g:fun(cart(real,'?15),cart(real,'?13)). (#forall:fun(fun(cart(real,'?15),bool),bool) (\x:cart(real,'?15). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?13),cart(real,'?14)),fun(net(cart(real,'?13)),bool)) f:fun(cart(real,'?13),cart(real,'?14))) (#at:fun(cart(real,'?13),net(cart(real,'?13))) (g:fun(cart(real,'?15),cart(real,'?13)) x:cart(real,'?15))))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?15),cart(real,'?13)),fun(net(cart(real,'?15)),bool)) g:fun(cart(real,'?15),cart(real,'?13))) (#at:fun(cart(real,'?15),net(cart(real,'?15))) x:cart(real,'?15)))) ((#=:fun(fun(cart(real,'?15),cart(real,'?14)),fun(fun(cart(real,'?15),cart(real,'?14)),bool)) ((#frechet_derivative:fun(fun(cart(real,'?15),cart(real,'?14)),fun(net(cart(real,'?15)),fun(cart(real,'?15),cart(real,'?14)))) ((#o:fun(fun(cart(real,'?13),cart(real,'?14)),fun(fun(cart(real,'?15),cart(real,'?13)),fun(cart(real,'?15),cart(real,'?14)))) f:fun(cart(real,'?13),cart(real,'?14))) g:fun(cart(real,'?15),cart(real,'?13)))) (#at:fun(cart(real,'?15),net(cart(real,'?15))) x:cart(real,'?15)))) ((#o:fun(fun(cart(real,'?13),cart(real,'?14)),fun(fun(cart(real,'?15),cart(real,'?13)),fun(cart(real,'?15),cart(real,'?14)))) ((#frechet_derivative:fun(fun(cart(real,'?13),cart(real,'?14)),fun(net(cart(real,'?13)),fun(cart(real,'?13),cart(real,'?14)))) f:fun(cart(real,'?13),cart(real,'?14))) (#at:fun(cart(real,'?13),net(cart(real,'?13))) (g:fun(cart(real,'?15),cart(real,'?13)) x:cart(real,'?15))))) ((#frechet_derivative:fun(fun(cart(real,'?15),cart(real,'?13)),fun(net(cart(real,'?15)),fun(cart(real,'?15),cart(real,'?13)))) g:fun(cart(real,'?15),cart(real,'?13))) (#at:fun(cart(real,'?15),net(cart(real,'?15))) x:cart(real,'?15)))))))))))))
      #|Multivariate_taylor.frechet_const =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'?16),bool),bool) (\z:cart(real,'?16). ((#=:fun(fun(cart(real,'?16),cart(real,'N)),fun(fun(cart(real,'?16),cart(real,'N)),bool)) ((#frechet_derivative:fun(fun(cart(real,'?16),cart(real,'N)),fun(net(cart(real,'?16)),fun(cart(real,'?16),cart(real,'N)))) (\x:cart(real,'?16). y:cart(real,'N))) (#at:fun(cart(real,'?16),net(cart(real,'?16))) z:cart(real,'?16)))) (\x:cart(real,'?16). (#vec:fun(num,cart(real,'N)) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|Multivariate_taylor.frechet_id =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#=:fun(fun(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),cart(real,'N)),bool)) ((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'N)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'N)))) (\x:cart(real,'N). x:cart(real,'N))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) (\x:cart(real,'N). x:cart(real,'N)))))
      #|Multivariate_taylor.frechet_vmul =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,1),bool),bool) (\z:cart(real,1). ((#=:fun(fun(cart(real,1),cart(real,'N)),fun(fun(cart(real,1),cart(real,'N)),bool)) ((#frechet_derivative:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),fun(cart(real,1),cart(real,'N)))) (\x:cart(real,1). ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) (#drop:fun(cart(real,1),real) x:cart(real,1))) y:cart(real,'N)))) (#at:fun(cart(real,1),net(cart(real,1))) z:cart(real,1)))) (\x:cart(real,1). ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) (#drop:fun(cart(real,1),real) x:cart(real,1))) y:cart(real,'N))))))))
      #|Multivariate_taylor.frechet_neg =  |- (#forall:fun(fun(fun(cart(real,'N),cart(real,'M)),bool),bool) (\f:fun(cart(real,'N),cart(real,'M)). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool)) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#=:fun(fun(cart(real,'N),cart(real,'M)),fun(fun(cart(real,'N),cart(real,'M)),bool)) ((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) (\x:cart(real,'N). (#vector_neg:fun(cart(real,'M),cart(real,'M)) (f:fun(cart(real,'N),cart(real,'M)) x:cart(real,'N))))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) (\y:cart(real,'N). (#vector_neg:fun(cart(real,'M),cart(real,'M)) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))) y:cart(real,'N))))))))))
      #|Multivariate_taylor.frechet_scale =  |- (#forall:fun(fun(fun(cart(real,'N),cart(real,'M)),bool),bool) (\f:fun(cart(real,'N),cart(real,'M)). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool)) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun(cart(real,'N),cart(real,'M)),fun(fun(cart(real,'N),cart(real,'M)),bool)) ((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) (\x:cart(real,'N). ((#%:fun(real,fun(cart(real,'M),cart(real,'M))) c:real) (f:fun(cart(real,'N),cart(real,'M)) x:cart(real,'N))))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) (\y:cart(real,'N). ((#%:fun(real,fun(cart(real,'M),cart(real,'M))) c:real) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))) y:cart(real,'N))))))))))))
      #|Multivariate_taylor.frechet_add =  |- (#forall:fun(fun(fun(cart(real,'N),cart(real,'M)),bool),bool) (\f:fun(cart(real,'N),cart(real,'M)). (#forall:fun(fun(fun(cart(real,'N),cart(real,'M)),bool),bool) (\g:fun(cart(real,'N),cart(real,'M)). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool)) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool)) g:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#=:fun(fun(cart(real,'N),cart(real,'M)),fun(fun(cart(real,'N),cart(real,'M)),bool)) ((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) (\x:cart(real,'N). ((#vector_add:fun(cart(real,'M),fun(cart(real,'M),cart(real,'M))) (f:fun(cart(real,'N),cart(real,'M)) x:cart(real,'N))) (g:fun(cart(real,'N),cart(real,'M)) x:cart(real,'N))))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) (\y:cart(real,'N). ((#vector_add:fun(cart(real,'M),fun(cart(real,'M),cart(real,'M))) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))) y:cart(real,'N))) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) g:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))) y:cart(real,'N)))))))))))))
      #|Multivariate_taylor.frechet_sub =  |- (#forall:fun(fun(fun(cart(real,'N),cart(real,'M)),bool),bool) (\f:fun(cart(real,'N),cart(real,'M)). (#forall:fun(fun(fun(cart(real,'N),cart(real,'M)),bool),bool) (\g:fun(cart(real,'N),cart(real,'M)). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool)) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool)) g:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#=:fun(fun(cart(real,'N),cart(real,'M)),fun(fun(cart(real,'N),cart(real,'M)),bool)) ((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) (\x:cart(real,'N). ((#vector_sub:fun(cart(real,'M),fun(cart(real,'M),cart(real,'M))) (f:fun(cart(real,'N),cart(real,'M)) x:cart(real,'N))) (g:fun(cart(real,'N),cart(real,'M)) x:cart(real,'N))))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) (\y:cart(real,'N). ((#vector_sub:fun(cart(real,'M),fun(cart(real,'M),cart(real,'M))) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) f:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))) y:cart(real,'N))) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,'M)))) g:fun(cart(real,'N),cart(real,'M))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))) y:cart(real,'N)))))))))))))
      #|Multivariate_taylor.differentiable_compose_at =  |- (#forall:fun(fun(fun(cart(real,'?17),cart(real,'?18)),bool),bool) (\f:fun(cart(real,'?17),cart(real,'?18)). (#forall:fun(fun(fun(cart(real,'?19),cart(real,'?17)),bool),bool) (\g:fun(cart(real,'?19),cart(real,'?17)). (#forall:fun(fun(cart(real,'?19),bool),bool) (\x:cart(real,'?19). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?17),cart(real,'?18)),fun(net(cart(real,'?17)),bool)) f:fun(cart(real,'?17),cart(real,'?18))) (#at:fun(cart(real,'?17),net(cart(real,'?17))) (g:fun(cart(real,'?19),cart(real,'?17)) x:cart(real,'?19))))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?19),cart(real,'?17)),fun(net(cart(real,'?19)),bool)) g:fun(cart(real,'?19),cart(real,'?17))) (#at:fun(cart(real,'?19),net(cart(real,'?19))) x:cart(real,'?19)))) ((#differentiable:fun(fun(cart(real,'?19),cart(real,'?18)),fun(net(cart(real,'?19)),bool)) ((#o:fun(fun(cart(real,'?17),cart(real,'?18)),fun(fun(cart(real,'?19),cart(real,'?17)),fun(cart(real,'?19),cart(real,'?18)))) f:fun(cart(real,'?17),cart(real,'?18))) g:fun(cart(real,'?19),cart(real,'?17)))) (#at:fun(cart(real,'?19),net(cart(real,'?19))) x:cart(real,'?19)))))))))))
      #|Multivariate_taylor.jacobian_compose =  |- (#forall:fun(fun(fun(cart(real,'?20),cart(real,'?21)),bool),bool) (\f:fun(cart(real,'?20),cart(real,'?21)). (#forall:fun(fun(fun(cart(real,'?22),cart(real,'?20)),bool),bool) (\g:fun(cart(real,'?22),cart(real,'?20)). (#forall:fun(fun(cart(real,'?22),bool),bool) (\x:cart(real,'?22). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?20),cart(real,'?21)),fun(net(cart(real,'?20)),bool)) f:fun(cart(real,'?20),cart(real,'?21))) (#at:fun(cart(real,'?20),net(cart(real,'?20))) (g:fun(cart(real,'?22),cart(real,'?20)) x:cart(real,'?22))))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?22),cart(real,'?20)),fun(net(cart(real,'?22)),bool)) g:fun(cart(real,'?22),cart(real,'?20))) (#at:fun(cart(real,'?22),net(cart(real,'?22))) x:cart(real,'?22)))) ((#=:fun(cart(cart(real,'?22),'?21),fun(cart(cart(real,'?22),'?21),bool)) ((#jacobian:fun(fun(cart(real,'?22),cart(real,'?21)),fun(net(cart(real,'?22)),cart(cart(real,'?22),'?21))) ((#o:fun(fun(cart(real,'?20),cart(real,'?21)),fun(fun(cart(real,'?22),cart(real,'?20)),fun(cart(real,'?22),cart(real,'?21)))) f:fun(cart(real,'?20),cart(real,'?21))) g:fun(cart(real,'?22),cart(real,'?20)))) (#at:fun(cart(real,'?22),net(cart(real,'?22))) x:cart(real,'?22)))) ((#matrix_mul:fun(cart(cart(real,'?20),'?21),fun(cart(cart(real,'?22),'?20),cart(cart(real,'?22),'?21))) ((#jacobian:fun(fun(cart(real,'?20),cart(real,'?21)),fun(net(cart(real,'?20)),cart(cart(real,'?20),'?21))) f:fun(cart(real,'?20),cart(real,'?21))) (#at:fun(cart(real,'?20),net(cart(real,'?20))) (g:fun(cart(real,'?22),cart(real,'?20)) x:cart(real,'?22))))) ((#jacobian:fun(fun(cart(real,'?22),cart(real,'?20)),fun(net(cart(real,'?22)),cart(cart(real,'?22),'?20))) g:fun(cart(real,'?22),cart(real,'?20))) (#at:fun(cart(real,'?22),net(cart(real,'?22))) x:cart(real,'?22)))))))))))))
      #|Multivariate_taylor.frechet_eq_jacobian =  |- (#forall:fun(fun(fun(cart(real,'?23),cart(real,'?24)),bool),bool) (\f:fun(cart(real,'?23),cart(real,'?24)). (#forall:fun(fun(cart(real,'?23),bool),bool) (\x:cart(real,'?23). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?23),cart(real,'?24)),fun(net(cart(real,'?23)),bool)) f:fun(cart(real,'?23),cart(real,'?24))) (#at:fun(cart(real,'?23),net(cart(real,'?23))) x:cart(real,'?23)))) ((#=:fun(fun(cart(real,'?23),cart(real,'?24)),fun(fun(cart(real,'?23),cart(real,'?24)),bool)) ((#frechet_derivative:fun(fun(cart(real,'?23),cart(real,'?24)),fun(net(cart(real,'?23)),fun(cart(real,'?23),cart(real,'?24)))) f:fun(cart(real,'?23),cart(real,'?24))) (#at:fun(cart(real,'?23),net(cart(real,'?23))) x:cart(real,'?23)))) (\h:cart(real,'?23). ((#matrix_vector_mul:fun(cart(cart(real,'?23),'?24),fun(cart(real,'?23),cart(real,'?24))) ((#jacobian:fun(fun(cart(real,'?23),cart(real,'?24)),fun(net(cart(real,'?23)),cart(cart(real,'?23),'?24))) f:fun(cart(real,'?23),cart(real,'?24))) (#at:fun(cart(real,'?23),net(cart(real,'?23))) x:cart(real,'?23)))) h:cart(real,'?23)))))))))
      #|Multivariate_taylor.REAL_LET_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) w:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) w:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) w:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|Multivariate_taylor.has_derivative_x12 =  |- (#forall:fun(fun(cart(real,tybit0(1)),bool),bool) (\y:cart(real,tybit0(1)). (((#has_derivative:fun(fun(cart(real,tybit0(1)),cart(real,1)),fun(fun(cart(real,tybit0(1)),cart(real,1)),fun(net(cart(real,tybit0(1))),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,tybit0(1)),real),fun(cart(real,tybit0(1)),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,tybit0(1)). ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,tybit0(1)),fun(num,real)) x:cart(real,tybit0(1))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#$:fun(cart(real,tybit0(1)),fun(num,real)) x:cart(real,tybit0(1))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,tybit0(1)),real),fun(cart(real,tybit0(1)),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,tybit0(1)). ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,tybit0(1)),fun(num,real)) y:cart(real,tybit0(1))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#$:fun(cart(real,tybit0(1)),fun(num,real)) x:cart(real,tybit0(1))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,tybit0(1)),fun(num,real)) y:cart(real,tybit0(1))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#$:fun(cart(real,tybit0(1)),fun(num,real)) x:cart(real,tybit0(1))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#at:fun(cart(real,tybit0(1)),net(cart(real,tybit0(1)))) y:cart(real,tybit0(1))))))
      #|Multivariate_taylor.lambda_eq_vsum =  |- (#forall:fun(fun(fun(num,fun('A,real)),bool),bool) (\f:fun(num,fun('A,real)). ((#=:fun(fun('A,cart(real,'N)),fun(fun('A,cart(real,'N)),bool)) (\x:'A. (#lambda:fun(fun(num,real),cart(real,'N)) (\i:num. ((f:fun(num,fun('A,real)) i:num) x:'A))))) (\x:'A. ((#vsum:fun(fun(num,bool),fun(fun(num,cart(real,'N)),cart(real,'N))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) ((f:fun(num,fun('A,real)) i:num) x:'A)) (#basis:fun(num,cart(real,'N)) i:num))))))))
      #|Multivariate_taylor.has_derivative_lambda =  |- (#forall:fun(fun(fun(num,fun(cart(real,'N),real)),bool),bool) (\f:fun(num,fun(cart(real,'N),real)). (#forall:fun(fun(fun(num,fun(cart(real,'N),real)),bool),bool) (\f':fun(num,fun(cart(real,'N),real)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('M,bool),num) #UNIV:fun('M,bool))))) (((#has_derivative:fun(fun(cart(real,'N),cart(real,1)),fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (f:fun(num,fun(cart(real,'N),real)) i:num))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (f':fun(num,fun(cart(real,'N),real)) i:num))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))))))) (((#has_derivative:fun(fun(cart(real,'N),cart(real,'M)),fun(fun(cart(real,'N),cart(real,'M)),fun(net(cart(real,'N)),bool))) (\x:cart(real,'N). (#lambda:fun(fun(num,real),cart(real,'M)) (\i:num. ((f:fun(num,fun(cart(real,'N),real)) i:num) x:cart(real,'N)))))) (\x:cart(real,'N). (#lambda:fun(fun(num,real),cart(real,'M)) (\i:num. ((f':fun(num,fun(cart(real,'N),real)) i:num) x:cart(real,'N)))))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))))))))))
      #|Multivariate_taylor.vector2_eq_lambda =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(cart(real,tybit0(1)),fun(cart(real,tybit0(1)),bool)) (#vector:fun(list(real),cart(real,tybit0(1))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) y:real) #NIL:list(real))))) (#lambda:fun(fun(num,real),cart(real,tybit0(1))) (\i:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real) y:real))))))))
      #|Multivariate_taylor.has_derivative_vector2 =  |- (#forall:fun(fun(fun(cart(real,'?25),real),bool),bool) (\f:fun(cart(real,'?25),real). (#forall:fun(fun(fun(cart(real,'?25),real),bool),bool) (\g:fun(cart(real,'?25),real). (#forall:fun(fun(fun(cart(real,'?25),real),bool),bool) (\f':fun(cart(real,'?25),real). (#forall:fun(fun(fun(cart(real,'?25),real),bool),bool) (\g':fun(cart(real,'?25),real). (#forall:fun(fun(cart(real,'?25),bool),bool) (\y:cart(real,'?25). ((#==>:fun(bool,fun(bool,bool)) (((#has_derivative:fun(fun(cart(real,'?25),cart(real,1)),fun(fun(cart(real,'?25),cart(real,1)),fun(net(cart(real,'?25)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?25),real),fun(cart(real,'?25),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?25),real))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?25),real),fun(cart(real,'?25),cart(real,1)))) #lift:fun(real,cart(real,1))) f':fun(cart(real,'?25),real))) (#at:fun(cart(real,'?25),net(cart(real,'?25))) y:cart(real,'?25)))) ((#==>:fun(bool,fun(bool,bool)) (((#has_derivative:fun(fun(cart(real,'?25),cart(real,1)),fun(fun(cart(real,'?25),cart(real,1)),fun(net(cart(real,'?25)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?25),real),fun(cart(real,'?25),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'?25),real))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?25),real),fun(cart(real,'?25),cart(real,1)))) #lift:fun(real,cart(real,1))) g':fun(cart(real,'?25),real))) (#at:fun(cart(real,'?25),net(cart(real,'?25))) y:cart(real,'?25)))) (((#has_derivative:fun(fun(cart(real,'?25),cart(real,tybit0(1))),fun(fun(cart(real,'?25),cart(real,tybit0(1))),fun(net(cart(real,'?25)),bool))) (\x:cart(real,'?25). (#vector:fun(list(real),cart(real,tybit0(1))) ((#CONS:fun(real,fun(list(real),list(real))) (f:fun(cart(real,'?25),real) x:cart(real,'?25))) ((#CONS:fun(real,fun(list(real),list(real))) (g:fun(cart(real,'?25),real) x:cart(real,'?25))) #NIL:list(real)))))) (\x:cart(real,'?25). (#vector:fun(list(real),cart(real,tybit0(1))) ((#CONS:fun(real,fun(list(real),list(real))) (f':fun(cart(real,'?25),real) x:cart(real,'?25))) ((#CONS:fun(real,fun(list(real),list(real))) (g':fun(cart(real,'?25),real) x:cart(real,'?25))) #NIL:list(real)))))) (#at:fun(cart(real,'?25),net(cart(real,'?25))) y:cart(real,'?25)))))))))))))))
      #|Multivariate_taylor.has_derivative_mul =  |- (#forall:fun(fun(fun(cart(real,'?26),real),bool),bool) (\f:fun(cart(real,'?26),real). (#forall:fun(fun(fun(cart(real,'?26),real),bool),bool) (\g:fun(cart(real,'?26),real). (#forall:fun(fun(fun(cart(real,'?26),real),bool),bool) (\f':fun(cart(real,'?26),real). (#forall:fun(fun(fun(cart(real,'?26),real),bool),bool) (\g':fun(cart(real,'?26),real). (#forall:fun(fun(cart(real,'?26),bool),bool) (\y:cart(real,'?26). ((#==>:fun(bool,fun(bool,bool)) (((#has_derivative:fun(fun(cart(real,'?26),cart(real,1)),fun(fun(cart(real,'?26),cart(real,1)),fun(net(cart(real,'?26)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?26),real),fun(cart(real,'?26),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?26),real))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?26),real),fun(cart(real,'?26),cart(real,1)))) #lift:fun(real,cart(real,1))) f':fun(cart(real,'?26),real))) (#at:fun(cart(real,'?26),net(cart(real,'?26))) y:cart(real,'?26)))) ((#==>:fun(bool,fun(bool,bool)) (((#has_derivative:fun(fun(cart(real,'?26),cart(real,1)),fun(fun(cart(real,'?26),cart(real,1)),fun(net(cart(real,'?26)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?26),real),fun(cart(real,'?26),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'?26),real))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?26),real),fun(cart(real,'?26),cart(real,1)))) #lift:fun(real,cart(real,1))) g':fun(cart(real,'?26),real))) (#at:fun(cart(real,'?26),net(cart(real,'?26))) y:cart(real,'?26)))) (((#has_derivative:fun(fun(cart(real,'?26),cart(real,1)),fun(fun(cart(real,'?26),cart(real,1)),fun(net(cart(real,'?26)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?26),real),fun(cart(real,'?26),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'?26). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'?26),real) x:cart(real,'?26))) (g:fun(cart(real,'?26),real) x:cart(real,'?26)))))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?26),real),fun(cart(real,'?26),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'?26). ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f':fun(cart(real,'?26),real) x:cart(real,'?26))) (g:fun(cart(real,'?26),real) y:cart(real,'?26)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'?26),real) y:cart(real,'?26))) (g':fun(cart(real,'?26),real) x:cart(real,'?26))))))) (#at:fun(cart(real,'?26),net(cart(real,'?26))) y:cart(real,'?26)))))))))))))))
      #|Multivariate_taylor.f_eq_lift_drop =  |- (#forall:fun(fun(fun('?27,cart(real,1)),bool),bool) (\f:fun('?27,cart(real,1)). ((#=:fun(fun('?27,cart(real,1)),fun(fun('?27,cart(real,1)),bool)) f:fun('?27,cart(real,1))) ((#o:fun(fun(real,cart(real,1)),fun(fun('?27,real),fun('?27,cart(real,1)))) #lift:fun(real,cart(real,1))) ((#o:fun(fun(cart(real,1),real),fun(fun('?27,cart(real,1)),fun('?27,real))) #drop:fun(cart(real,1),real)) f:fun('?27,cart(real,1)))))))
      #|Multivariate_taylor.differentiable_mul =  |- (#forall:fun(fun(fun(cart(real,'?28),real),bool),bool) (\f:fun(cart(real,'?28),real). (#forall:fun(fun(fun(cart(real,'?28),real),bool),bool) (\g:fun(cart(real,'?28),real). (#forall:fun(fun(cart(real,'?28),bool),bool) (\y:cart(real,'?28). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?28),cart(real,1)),fun(net(cart(real,'?28)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?28),real),fun(cart(real,'?28),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?28),real))) (#at:fun(cart(real,'?28),net(cart(real,'?28))) y:cart(real,'?28)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?28),cart(real,1)),fun(net(cart(real,'?28)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?28),real),fun(cart(real,'?28),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'?28),real))) (#at:fun(cart(real,'?28),net(cart(real,'?28))) y:cart(real,'?28)))) ((#differentiable:fun(fun(cart(real,'?28),cart(real,1)),fun(net(cart(real,'?28)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?28),real),fun(cart(real,'?28),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'?28). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'?28),real) x:cart(real,'?28))) (g:fun(cart(real,'?28),real) x:cart(real,'?28)))))) (#at:fun(cart(real,'?28),net(cart(real,'?28))) y:cart(real,'?28)))))))))))
      #|Multivariate_taylor.frechet_mul =  |- (#forall:fun(fun(fun(cart(real,'?29),real),bool),bool) (\f:fun(cart(real,'?29),real). (#forall:fun(fun(fun(cart(real,'?29),real),bool),bool) (\g:fun(cart(real,'?29),real). (#forall:fun(fun(cart(real,'?29),bool),bool) (\y:cart(real,'?29). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?29),cart(real,1)),fun(net(cart(real,'?29)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?29),real),fun(cart(real,'?29),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?29),real))) (#at:fun(cart(real,'?29),net(cart(real,'?29))) y:cart(real,'?29)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?29),cart(real,1)),fun(net(cart(real,'?29)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?29),real),fun(cart(real,'?29),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'?29),real))) (#at:fun(cart(real,'?29),net(cart(real,'?29))) y:cart(real,'?29)))) ((#=:fun(fun(cart(real,'?29),cart(real,1)),fun(fun(cart(real,'?29),cart(real,1)),bool)) ((#frechet_derivative:fun(fun(cart(real,'?29),cart(real,1)),fun(net(cart(real,'?29)),fun(cart(real,'?29),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?29),real),fun(cart(real,'?29),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'?29). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'?29),real) x:cart(real,'?29))) (g:fun(cart(real,'?29),real) x:cart(real,'?29)))))) (#at:fun(cart(real,'?29),net(cart(real,'?29))) y:cart(real,'?29)))) (\x:cart(real,'?29). ((#vector_add:fun(cart(real,1),fun(cart(real,1),cart(real,1))) ((#%:fun(real,fun(cart(real,1),cart(real,1))) (g:fun(cart(real,'?29),real) y:cart(real,'?29))) (((#frechet_derivative:fun(fun(cart(real,'?29),cart(real,1)),fun(net(cart(real,'?29)),fun(cart(real,'?29),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?29),real),fun(cart(real,'?29),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?29),real))) (#at:fun(cart(real,'?29),net(cart(real,'?29))) y:cart(real,'?29))) x:cart(real,'?29)))) ((#%:fun(real,fun(cart(real,1),cart(real,1))) (f:fun(cart(real,'?29),real) y:cart(real,'?29))) (((#frechet_derivative:fun(fun(cart(real,'?29),cart(real,1)),fun(net(cart(real,'?29)),fun(cart(real,'?29),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?29),real),fun(cart(real,'?29),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'?29),real))) (#at:fun(cart(real,'?29),net(cart(real,'?29))) y:cart(real,'?29))) x:cart(real,'?29))))))))))))))
      #|Multivariate_taylor.real_derivative_compose_frechet =  |- (#forall:fun(fun(fun(cart(real,'?30),real),bool),bool) (\f:fun(cart(real,'?30),real). (#forall:fun(fun(fun(real,cart(real,'?30)),bool),bool) (\h:fun(real,cart(real,'?30)). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?30),cart(real,1)),fun(net(cart(real,'?30)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?30),real),fun(cart(real,'?30),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?30),real))) (#at:fun(cart(real,'?30),net(cart(real,'?30))) (h:fun(real,cart(real,'?30)) t:real)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'?30)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'?30)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?30)))) h:fun(real,cart(real,'?30))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'?30),real),fun(fun(real,cart(real,'?30)),fun(real,real))) f:fun(cart(real,'?30),real)) h:fun(real,cart(real,'?30)))) (((#o:fun(fun(cart(real,1),real),fun(fun(real,cart(real,1)),fun(real,real))) #drop:fun(cart(real,1),real)) ((#o:fun(fun(cart(real,1),cart(real,1)),fun(fun(real,cart(real,1)),fun(real,cart(real,1)))) ((#o:fun(fun(cart(real,'?30),cart(real,1)),fun(fun(cart(real,1),cart(real,'?30)),fun(cart(real,1),cart(real,1)))) ((#frechet_derivative:fun(fun(cart(real,'?30),cart(real,1)),fun(net(cart(real,'?30)),fun(cart(real,'?30),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?30),real),fun(cart(real,'?30),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?30),real))) (#at:fun(cart(real,'?30),net(cart(real,'?30))) (h:fun(real,cart(real,'?30)) t:real)))) ((#frechet_derivative:fun(fun(cart(real,1),cart(real,'?30)),fun(net(cart(real,1)),fun(cart(real,1),cart(real,'?30)))) ((#o:fun(fun(real,cart(real,'?30)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?30)))) h:fun(real,cart(real,'?30))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real))))) #lift:fun(real,cart(real,1)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#atreal:fun(real,net(real)) t:real))))))))))
      #|Multivariate_taylor.real_derivative_compose_jacobian =  |- (#forall:fun(fun(fun(cart(real,'?31),real),bool),bool) (\f:fun(cart(real,'?31),real). (#forall:fun(fun(fun(real,cart(real,'?31)),bool),bool) (\h:fun(real,cart(real,'?31)). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?31),cart(real,1)),fun(net(cart(real,'?31)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?31),real),fun(cart(real,'?31),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?31),real))) (#at:fun(cart(real,'?31),net(cart(real,'?31))) (h:fun(real,cart(real,'?31)) t:real)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'?31)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'?31)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?31)))) h:fun(real,cart(real,'?31))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'?31),real),fun(fun(real,cart(real,'?31)),fun(real,real))) f:fun(cart(real,'?31),real)) h:fun(real,cart(real,'?31)))) ((#$:fun(cart(real,1),fun(num,real)) ((#$:fun(cart(cart(real,1),1),fun(num,cart(real,1))) ((#matrix_mul:fun(cart(cart(real,'?31),1),fun(cart(cart(real,1),'?31),cart(cart(real,1),1))) ((#jacobian:fun(fun(cart(real,'?31),cart(real,1)),fun(net(cart(real,'?31)),cart(cart(real,'?31),1))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?31),real),fun(cart(real,'?31),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?31),real))) (#at:fun(cart(real,'?31),net(cart(real,'?31))) (h:fun(real,cart(real,'?31)) t:real)))) ((#jacobian:fun(fun(cart(real,1),cart(real,'?31)),fun(net(cart(real,1)),cart(cart(real,1),'?31))) ((#o:fun(fun(real,cart(real,'?31)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?31)))) h:fun(real,cart(real,'?31))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#atreal:fun(real,net(real)) t:real))))))))))
      #|Multivariate_taylor.diff_imp_real_diff =  |- (#forall:fun(fun(fun(cart(real,'?32),real),bool),bool) (\f:fun(cart(real,'?32),real). (#forall:fun(fun(fun(real,cart(real,'?32)),bool),bool) (\h:fun(real,cart(real,'?32)). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?32),cart(real,1)),fun(net(cart(real,'?32)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?32),real),fun(cart(real,'?32),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?32),real))) (#at:fun(cart(real,'?32),net(cart(real,'?32))) (h:fun(real,cart(real,'?32)) t:real)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'?32)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'?32)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?32)))) h:fun(real,cart(real,'?32))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) ((#o:fun(fun(cart(real,'?32),real),fun(fun(real,cart(real,'?32)),fun(real,real))) f:fun(cart(real,'?32),real)) h:fun(real,cart(real,'?32)))) (#atreal:fun(real,net(real)) t:real))))))))))
      #|Multivariate_taylor.diff_direction =  |- (#forall:fun(fun(cart(real,'?33),bool),bool) (\y:cart(real,'?33). (#forall:fun(fun(cart(real,'?33),bool),bool) (\e:cart(real,'?33). (#forall:fun(fun(net(cart(real,1)),bool),bool) (\net:net(cart(real,1)). ((#differentiable:fun(fun(cart(real,1),cart(real,'?33)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'?33)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?33)))) (\t:real. ((#vector_add:fun(cart(real,'?33),fun(cart(real,'?33),cart(real,'?33))) y:cart(real,'?33)) ((#%:fun(real,fun(cart(real,'?33),cart(real,'?33))) t:real) e:cart(real,'?33))))) #drop:fun(cart(real,1),real))) net:net(cart(real,1)))))))))
      #|Multivariate_taylor.frechet_direction =  |- (#forall:fun(fun(cart(real,'?34),bool),bool) (\y:cart(real,'?34). (#forall:fun(fun(cart(real,'?34),bool),bool) (\e:cart(real,'?34). (#forall:fun(fun(real,bool),bool) (\t:real. ((#=:fun(fun(cart(real,1),cart(real,'?34)),fun(fun(cart(real,1),cart(real,'?34)),bool)) ((#frechet_derivative:fun(fun(cart(real,1),cart(real,'?34)),fun(net(cart(real,1)),fun(cart(real,1),cart(real,'?34)))) ((#o:fun(fun(real,cart(real,'?34)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'?34)))) (\t:real. ((#vector_add:fun(cart(real,'?34),fun(cart(real,'?34),cart(real,'?34))) y:cart(real,'?34)) ((#%:fun(real,fun(cart(real,'?34),cart(real,'?34))) t:real) e:cart(real,'?34))))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) (\x:cart(real,1). ((#%:fun(real,fun(cart(real,'?34),cart(real,'?34))) (#drop:fun(cart(real,1),real) x:cart(real,1))) e:cart(real,'?34))))))))))
      #|Multivariate_taylor.real_dir_derivative_frechet =  |- (#forall:fun(fun(fun(cart(real,'?35),real),bool),bool) (\f:fun(cart(real,'?35),real). (#forall:fun(fun(cart(real,'?35),bool),bool) (\y:cart(real,'?35). (#forall:fun(fun(cart(real,'?35),bool),bool) (\e:cart(real,'?35). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?35),cart(real,1)),fun(net(cart(real,'?35)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?35),real),fun(cart(real,'?35),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?35),real))) (#at:fun(cart(real,'?35),net(cart(real,'?35))) ((#vector_add:fun(cart(real,'?35),fun(cart(real,'?35),cart(real,'?35))) y:cart(real,'?35)) ((#%:fun(real,fun(cart(real,'?35),cart(real,'?35))) t:real) e:cart(real,'?35)))))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'?35),real),fun(fun(real,cart(real,'?35)),fun(real,real))) f:fun(cart(real,'?35),real)) (\t:real. ((#vector_add:fun(cart(real,'?35),fun(cart(real,'?35),cart(real,'?35))) y:cart(real,'?35)) ((#%:fun(real,fun(cart(real,'?35),cart(real,'?35))) t:real) e:cart(real,'?35)))))) (#drop:fun(cart(real,1),real) (((#frechet_derivative:fun(fun(cart(real,'?35),cart(real,1)),fun(net(cart(real,'?35)),fun(cart(real,'?35),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?35),real),fun(cart(real,'?35),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?35),real))) (#at:fun(cart(real,'?35),net(cart(real,'?35))) ((#vector_add:fun(cart(real,'?35),fun(cart(real,'?35),cart(real,'?35))) y:cart(real,'?35)) ((#%:fun(real,fun(cart(real,'?35),cart(real,'?35))) t:real) e:cart(real,'?35))))) e:cart(real,'?35)))) (#atreal:fun(real,net(real)) t:real)))))))))))
      #|Multivariate_taylor.real_dir_derivative_jacobian =  |- (#forall:fun(fun(fun(cart(real,'?36),real),bool),bool) (\f:fun(cart(real,'?36),real). (#forall:fun(fun(cart(real,'?36),bool),bool) (\y:cart(real,'?36). (#forall:fun(fun(cart(real,'?36),bool),bool) (\e:cart(real,'?36). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?36),cart(real,1)),fun(net(cart(real,'?36)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?36),real),fun(cart(real,'?36),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?36),real))) (#at:fun(cart(real,'?36),net(cart(real,'?36))) ((#vector_add:fun(cart(real,'?36),fun(cart(real,'?36),cart(real,'?36))) y:cart(real,'?36)) ((#%:fun(real,fun(cart(real,'?36),cart(real,'?36))) t:real) e:cart(real,'?36)))))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'?36),real),fun(fun(real,cart(real,'?36)),fun(real,real))) f:fun(cart(real,'?36),real)) (\t:real. ((#vector_add:fun(cart(real,'?36),fun(cart(real,'?36),cart(real,'?36))) y:cart(real,'?36)) ((#%:fun(real,fun(cart(real,'?36),cart(real,'?36))) t:real) e:cart(real,'?36)))))) (#drop:fun(cart(real,1),real) ((#matrix_vector_mul:fun(cart(cart(real,'?36),1),fun(cart(real,'?36),cart(real,1))) ((#jacobian:fun(fun(cart(real,'?36),cart(real,1)),fun(net(cart(real,'?36)),cart(cart(real,'?36),1))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?36),real),fun(cart(real,'?36),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?36),real))) (#at:fun(cart(real,'?36),net(cart(real,'?36))) ((#vector_add:fun(cart(real,'?36),fun(cart(real,'?36),cart(real,'?36))) y:cart(real,'?36)) ((#%:fun(real,fun(cart(real,'?36),cart(real,'?36))) t:real) e:cart(real,'?36)))))) e:cart(real,'?36)))) (#atreal:fun(real,net(real)) t:real)))))))))))
      #|Multivariate_taylor.partial_eq_frechet =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (#drop:fun(cart(real,1),real) (((#frechet_derivative:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))) (#basis:fun(num,cart(real,'N)) i:num)))))))))))
      #|Multivariate_taylor.partial_eq_jacobian =  |- (#forall:fun(fun(fun(cart(real,'?37),real),bool),bool) (\f:fun(cart(real,'?37),real). (#forall:fun(fun(cart(real,'?37),bool),bool) (\y:cart(real,'?37). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?37),cart(real,1)),fun(net(cart(real,'?37)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?37),real),fun(cart(real,'?37),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?37),real))) (#at:fun(cart(real,'?37),net(cart(real,'?37))) y:cart(real,'?37)))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'?37),real),fun(cart(real,'?37),real))) i:num) f:fun(cart(real,'?37),real)) y:cart(real,'?37))) (#drop:fun(cart(real,1),real) ((#matrix_vector_mul:fun(cart(cart(real,'?37),1),fun(cart(real,'?37),cart(real,1))) ((#jacobian:fun(fun(cart(real,'?37),cart(real,1)),fun(net(cart(real,'?37)),cart(cart(real,'?37),1))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?37),real),fun(cart(real,'?37),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?37),real))) (#at:fun(cart(real,'?37),net(cart(real,'?37))) y:cart(real,'?37)))) (#basis:fun(num,cart(real,'?37)) i:num)))))))))))
      #|Multivariate_taylor.partial_eq_jacobian_column =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (#drop:fun(cart(real,1),real) ((#column:fun(num,fun(cart(cart(real,'N),1),cart(real,1))) i:num) ((#jacobian:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),cart(cart(real,'N),1))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))))))))))))))
      #|Multivariate_taylor.partial_eq_jacobian_entry =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) ((#$:fun(cart(real,'N),fun(num,real)) ((#$:fun(cart(cart(real,'N),1),fun(num,cart(real,'N))) ((#jacobian:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),cart(cart(real,'N),1))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))))))))))
      #|Multivariate_taylor.partial_eq0 =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Multivariate_taylor.derivative_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) (g:fun(real,real) x:real)))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) ((#o:fun(fun(real,real),fun(fun(real,real),fun(real,real))) f:fun(real,real)) g:fun(real,real))) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) (g:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)))))))))))
      #|Multivariate_taylor.projection_has_derivative =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(net(cart(real,'N)),bool),bool) (\net:net(cart(real,'N)). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) (((#has_derivative:fun(fun(cart(real,'N),cart(real,1)),fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))) net:net(cart(real,'N))))))))
      #|Multivariate_taylor.projection_diff =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(net(cart(real,'N)),bool),bool) (\net:net(cart(real,'N)). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))) net:net(cart(real,'N))))))))
      #|Multivariate_taylor.frechet_projection =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#=:fun(fun(cart(real,'N),cart(real,1)),fun(fun(cart(real,'N),cart(real,1)),bool)) ((#frechet_derivative:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),fun(cart(real,'N),cart(real,1)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))))))))
      #|Multivariate_taylor.has_derivative_vector_frechet =  |- (#forall:fun(fun(fun(real,cart(real,'N)),bool),bool) (\h:fun(real,cart(real,'N)). (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\s:real. ((#$:fun(cart(real,'N),fun(num,real)) (h:fun(real,cart(real,'N)) s:real)) i:num))) ((#$:fun(cart(real,'N),fun(num,real)) (((#frechet_derivative:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),fun(cart(real,1),cart(real,'N)))) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real))) (#lift:fun(real,cart(real,1)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) i:num)) (#atreal:fun(real,net(real)) t:real))))))))))
      #|Multivariate_taylor.has_derivative_vector_jacobian =  |- (#forall:fun(fun(fun(real,cart(real,'N)),bool),bool) (\h:fun(real,cart(real,'N)). (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\s:real. ((#$:fun(cart(real,'N),fun(num,real)) (h:fun(real,cart(real,'N)) s:real)) i:num))) ((#$:fun(cart(real,1),fun(num,real)) ((#$:fun(cart(cart(real,1),'N),fun(num,cart(real,1))) ((#jacobian:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),cart(cart(real,1),'N))) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#atreal:fun(real,net(real)) t:real))))))))))
      #|Multivariate_taylor.derivative_vector_jacobian =  |- (#forall:fun(fun(fun(real,cart(real,'N)),bool),bool) (\h:fun(real,cart(real,'N)). (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\s:real. ((#$:fun(cart(real,'N),fun(num,real)) (h:fun(real,cart(real,'N)) s:real)) i:num))) t:real)) ((#$:fun(cart(real,1),fun(num,real)) ((#$:fun(cart(cart(real,1),'N),fun(num,cart(real,1))) ((#jacobian:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),cart(cart(real,1),'N))) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Multivariate_taylor.real_derivative_compose_partial =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(real,cart(real,'N)),bool),bool) (\h:fun(real,cart(real,'N)). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) (h:fun(real,cart(real,'N)) t:real)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,1),cart(real,'N)),fun(net(cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,'N)),fun(fun(cart(real,1),real),fun(cart(real,1),cart(real,'N)))) h:fun(real,cart(real,'N))) #drop:fun(cart(real,1),real))) (#at:fun(cart(real,1),net(cart(real,1))) (#lift:fun(real,cart(real,1)) t:real)))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) h:fun(real,cart(real,'N)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) (h:fun(real,cart(real,'N)) t:real))) ((#derivative:fun(fun(real,real),fun(real,real)) (\s:real. ((#$:fun(cart(real,'N),fun(num,real)) (h:fun(real,cart(real,'N)) s:real)) i:num))) t:real))))) (#atreal:fun(real,net(real)) t:real))))))))))
      #|Multivariate_taylor.real_dir_derivative_partial =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) y:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) y:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) e:cart(real,'N)) i:num)) (((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) y:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) t:real))))) (#atreal:fun(real,net(real)) t:real)))))))))))
      #|Multivariate_taylor.partial_uni_compose =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) u:fun(real,real)) (#atreal:fun(real,net(real)) (f:fun(cart(real,'N),real) y:cart(real,'N))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) u:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) u:fun(real,real)) (f:fun(cart(real,'N),real) y:cart(real,'N)))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))))))))))
      #|Multivariate_taylor.partial_neg =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N))) (#real_neg:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N)))))))))))
      #|Multivariate_taylor.partial_scale =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N))) ((#real_mul:fun(real,fun(real,real)) c:real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N)))))))))))))
      #|Multivariate_taylor.partial_add =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N))) ((#real_add:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) y:cart(real,'N))))))))))))))
      #|Multivariate_taylor.partial_sub =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N))) ((#real_sub:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) y:cart(real,'N))))))))))))))
      #|Multivariate_taylor.partial_mul =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N)))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (g:fun(cart(real,'N),real) y:cart(real,'N)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) y:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) y:cart(real,'N)))))))))))))))
      #|Multivariate_taylor.derivative_translation =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) ((#o:fun(fun(real,real),fun(fun(real,real),fun(real,real))) f:fun(real,real)) (\t:real. ((#real_add:fun(real,fun(real,real)) x:real) t:real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|Multivariate_taylor.partial_increasing_left =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\u:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\z:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\lo:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) i:num) j:num))) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) i:num))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) j:num)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) j:num))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) u:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) lo:real) (f:fun(cart(real,'N),real) y:cart(real,'N))))))) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) lo:real) (f:fun(cart(real,'N),real) y:cart(real,'N)))))))))))))))))))))))
      #|Multivariate_taylor.partial_decreasing_left =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\u:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\z:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\hi:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) i:num) j:num))) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) i:num))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) j:num)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) j:num))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) u:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real))))) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real)))))))))))))))))))))
      #|Multivariate_taylor.partial_translation =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) ((#o:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),cart(real,'N)),fun(cart(real,'N),real))) f:fun(cart(real,'N),real)) (\x:cart(real,'N). ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) x:cart(real,'N))))) y:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N)))))))))))))
      #|Multivariate_taylor.partial_rev_translation =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) ((#vector_sub:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) ((#o:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),cart(real,'N)),fun(cart(real,'N),real))) f:fun(cart(real,'N),real)) (\x:cart(real,'N). ((#vector_sub:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) x:cart(real,'N))))) y:cart(real,'N))) (#real_neg:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) ((#vector_sub:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N))))))))))))))
      #|Multivariate_taylor.partial_increasing_right =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\u:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\z:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\hi:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) i:num) j:num))) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) j:num)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) j:num))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) y:cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) u:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real))))) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real)))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_error =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\error:real. ((#=:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) error:real)) (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) x:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) j:num)) (#real_abs:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))))) error:real)))))))))))))
      #|Multivariate_taylor.m_taylor_partial_error =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\error:real. ((#=:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) error:real)) (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) x:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) j:num)) (#real_abs:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) x:cart(real,'N))))))) error:real)))))))))))))))
      #|Multivariate_taylor.partial2 =  |- (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'?38),real),bool),bool) (\f:fun(cart(real,'?38),real). ((#=:fun(fun(cart(real,'?38),real),fun(fun(cart(real,'?38),real),bool)) (((#partial2:fun(num,fun(num,fun(fun(cart(real,'?38),real),fun(cart(real,'?38),real)))) j:num) i:num) f:fun(cart(real,'?38),real))) ((#partial:fun(num,fun(fun(cart(real,'?38),real),fun(cart(real,'?38),real))) j:num) ((#partial:fun(num,fun(fun(cart(real,'?38),real),fun(cart(real,'?38),real))) i:num) f:fun(cart(real,'?38),real))))))))))
      #|Multivariate_taylor.diff2 =  |- (#forall:fun(fun(cart(real,'?39),bool),bool) (\x:cart(real,'?39). (#forall:fun(fun(fun(cart(real,'?39),real),bool),bool) (\f:fun(cart(real,'?39),real). ((#=:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'?39),real),fun(cart(real,'?39),bool)) f:fun(cart(real,'?39),real)) x:cart(real,'?39))) (#?:fun(fun(fun(cart(real,'?39),bool),bool),bool) (\s:fun(cart(real,'?39),bool). ((#/\:fun(bool,fun(bool,bool)) (#open:fun(fun(cart(real,'?39),bool),bool) s:fun(cart(real,'?39),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?39),fun(fun(cart(real,'?39),bool),bool)) x:cart(real,'?39)) s:fun(cart(real,'?39),bool))) (#forall:fun(fun(cart(real,'?39),bool),bool) (\y:cart(real,'?39). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?39),fun(fun(cart(real,'?39),bool),bool)) y:cart(real,'?39)) s:fun(cart(real,'?39),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?39),cart(real,1)),fun(net(cart(real,'?39)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?39),real),fun(cart(real,'?39),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?39),real))) (#at:fun(cart(real,'?39),net(cart(real,'?39))) y:cart(real,'?39)))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#differentiable:fun(fun(cart(real,'?39),cart(real,1)),fun(net(cart(real,'?39)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?39),real),fun(cart(real,'?39),cart(real,1)))) #lift:fun(real,cart(real,1))) ((#partial:fun(num,fun(fun(cart(real,'?39),real),fun(cart(real,'?39),real))) i:num) f:fun(cart(real,'?39),real)))) (#at:fun(cart(real,'?39),net(cart(real,'?39))) y:cart(real,'?39))))))))))))))))))
      #|Multivariate_taylor.diff2c =  |- (#forall:fun(fun(fun(cart(real,'?40),real),bool),bool) (\f:fun(cart(real,'?40),real). (#forall:fun(fun(cart(real,'?40),bool),bool) (\x:cart(real,'?40). ((#=:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'?40),real),fun(cart(real,'?40),bool)) f:fun(cart(real,'?40),real)) x:cart(real,'?40))) ((#/\:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'?40),real),fun(cart(real,'?40),bool)) f:fun(cart(real,'?40),real)) x:cart(real,'?40))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#continuous:fun(fun(cart(real,'?40),cart(real,1)),fun(net(cart(real,'?40)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?40),real),fun(cart(real,'?40),cart(real,1)))) #lift:fun(real,cart(real,1))) (((#partial2:fun(num,fun(num,fun(fun(cart(real,'?40),real),fun(cart(real,'?40),real)))) j:num) i:num) f:fun(cart(real,'?40),real)))) (#at:fun(cart(real,'?40),net(cart(real,'?40))) x:cart(real,'?40)))))))))))))
      #|Multivariate_taylor.m_cell_domain =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\z:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). ((#=:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) y:cart(real,'N)) i:num))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) y:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) i:num))) ((#real_le:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) y:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num))) ((#real_sub:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) y:cart(real,'N)) i:num)))) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num))))))))))))))))
      #|Multivariate_taylor.m_bounded_on_int =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). ((#=:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) x:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(cart(real,'N),real) x:cart(real,'N))) f_bounds:prod(real,real))))))))))))
      #|Multivariate_taylor.diff2_domain =  |- (#forall:fun(fun(prod(cart(real,'?41),cart(real,'?41)),bool),bool) (\domain:prod(cart(real,'?41),cart(real,'?41)). (#forall:fun(fun(fun(cart(real,'?41),real),bool),bool) (\f:fun(cart(real,'?41),real). ((#=:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'?41),cart(real,'?41)),fun(fun(cart(real,'?41),real),bool)) domain:prod(cart(real,'?41),cart(real,'?41))) f:fun(cart(real,'?41),real))) (#forall:fun(fun(cart(real,'?41),bool),bool) (\x:cart(real,'?41). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?41),fun(fun(cart(real,'?41),bool),bool)) x:cart(real,'?41)) (#closed_interval:fun(list(prod(cart(real,'?41),cart(real,'?41))),fun(cart(real,'?41),bool)) ((#CONS:fun(prod(cart(real,'?41),cart(real,'?41)),fun(list(prod(cart(real,'?41),cart(real,'?41))),list(prod(cart(real,'?41),cart(real,'?41))))) domain:prod(cart(real,'?41),cart(real,'?41))) #NIL:list(prod(cart(real,'?41),cart(real,'?41))))))) ((#diff2:fun(fun(cart(real,'?41),real),fun(cart(real,'?41),bool)) f:fun(cart(real,'?41),real)) x:cart(real,'?41))))))))))
      #|Multivariate_taylor.diff2c_domain =  |- (#forall:fun(fun(prod(cart(real,'?42),cart(real,'?42)),bool),bool) (\domain:prod(cart(real,'?42),cart(real,'?42)). (#forall:fun(fun(fun(cart(real,'?42),real),bool),bool) (\f:fun(cart(real,'?42),real). ((#=:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'?42),cart(real,'?42)),fun(fun(cart(real,'?42),real),bool)) domain:prod(cart(real,'?42),cart(real,'?42))) f:fun(cart(real,'?42),real))) (#forall:fun(fun(cart(real,'?42),bool),bool) (\x:cart(real,'?42). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?42),fun(fun(cart(real,'?42),bool),bool)) x:cart(real,'?42)) (#closed_interval:fun(list(prod(cart(real,'?42),cart(real,'?42))),fun(cart(real,'?42),bool)) ((#CONS:fun(prod(cart(real,'?42),cart(real,'?42)),fun(list(prod(cart(real,'?42),cart(real,'?42))),list(prod(cart(real,'?42),cart(real,'?42))))) domain:prod(cart(real,'?42),cart(real,'?42))) #NIL:list(prod(cart(real,'?42),cart(real,'?42))))))) ((#diff2c:fun(fun(cart(real,'?42),real),fun(cart(real,'?42),bool)) f:fun(cart(real,'?42),real)) x:cart(real,'?42))))))))))
      #|Multivariate_taylor.real_taylor2_bound =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) t:real) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) t:real))) dd_bound:real))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Multivariate_taylor.real_taylor1_bound =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\d_bound:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) t:real) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) t:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) t:real))) d_bound:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) d_bound:real))))))
      #|Multivariate_taylor.taylor_error_eq_sum_partial_errors =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(num,real),bool),bool) (\p_error:fun(num,real). (#forall:fun(fun(real,bool),bool) (\error:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#/\:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) (p_error:fun(num,real) i:num))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num))))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) (p_error:fun(num,real) i:num))))) error:real)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) error:real)))))))))))))
      #|Multivariate_taylor.diff2c_imp_diff2 =  |- (#forall:fun(fun(fun(cart(real,'?43),real),bool),bool) (\f:fun(cart(real,'?43),real). (#forall:fun(fun(cart(real,'?43),bool),bool) (\x:cart(real,'?43). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'?43),real),fun(cart(real,'?43),bool)) f:fun(cart(real,'?43),real)) x:cart(real,'?43))) ((#diff2:fun(fun(cart(real,'?43),real),fun(cart(real,'?43),bool)) f:fun(cart(real,'?43),real)) x:cart(real,'?43)))))))
      #|Multivariate_taylor.diff2_eq_diff2_on_open =  |- (#forall:fun(fun(fun(cart(real,'?44),real),bool),bool) (\f:fun(cart(real,'?44),real). (#forall:fun(fun(cart(real,'?44),bool),bool) (\x:cart(real,'?44). ((#=:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'?44),real),fun(cart(real,'?44),bool)) f:fun(cart(real,'?44),real)) x:cart(real,'?44))) (#?:fun(fun(fun(cart(real,'?44),bool),bool),bool) (\s:fun(cart(real,'?44),bool). ((#/\:fun(bool,fun(bool,bool)) (#open:fun(fun(cart(real,'?44),bool),bool) s:fun(cart(real,'?44),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?44),fun(fun(cart(real,'?44),bool),bool)) x:cart(real,'?44)) s:fun(cart(real,'?44),bool))) (#forall:fun(fun(cart(real,'?44),bool),bool) (\y:cart(real,'?44). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?44),fun(fun(cart(real,'?44),bool),bool)) y:cart(real,'?44)) s:fun(cart(real,'?44),bool))) ((#diff2:fun(fun(cart(real,'?44),real),fun(cart(real,'?44),bool)) f:fun(cart(real,'?44),real)) y:cart(real,'?44))))))))))))))
      #|Multivariate_taylor.diff2_imp_real_diff =  |- (#forall:fun(fun(fun(cart(real,'?45),real),bool),bool) (\f:fun(cart(real,'?45),real). (#forall:fun(fun(cart(real,'?45),bool),bool) (\x:cart(real,'?45). (#forall:fun(fun(cart(real,'?45),bool),bool) (\e:cart(real,'?45). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'?45),real),fun(cart(real,'?45),bool)) f:fun(cart(real,'?45),real)) ((#vector_add:fun(cart(real,'?45),fun(cart(real,'?45),cart(real,'?45))) x:cart(real,'?45)) ((#%:fun(real,fun(cart(real,'?45),cart(real,'?45))) t:real) e:cart(real,'?45))))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) ((#o:fun(fun(cart(real,'?45),real),fun(fun(real,cart(real,'?45)),fun(real,real))) f:fun(cart(real,'?45),real)) (\t:real. ((#vector_add:fun(cart(real,'?45),fun(cart(real,'?45),cart(real,'?45))) x:cart(real,'?45)) ((#%:fun(real,fun(cart(real,'?45),cart(real,'?45))) t:real) e:cart(real,'?45)))))) (#atreal:fun(real,net(real)) t:real)))))))))))
      #|Multivariate_taylor.diff2_dir_derivative =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) t:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) e:cart(real,'N)) i:num)) (((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) t:real))))))))))))))
      #|Multivariate_taylor.diff2_partial_real_diff =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) (#atreal:fun(real,net(real)) t:real)))))))))))))
      #|Multivariate_taylor.in_trans =  |- (#forall:fun(fun('?46,bool),bool) (\x:'?46. (#forall:fun(fun(fun('?46,bool),bool),bool) (\s:fun('?46,bool). (#forall:fun(fun(fun('?46,bool),bool),bool) (\t:fun('?46,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?46,bool),fun(fun('?46,bool),bool)) t:fun('?46,bool)) s:fun('?46,bool))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?46,fun(fun('?46,bool),bool)) x:'?46) t:fun('?46,bool))) ((#IN:fun('?46,fun(fun('?46,bool),bool)) x:'?46) s:fun('?46,bool))))))))))
      #|Multivariate_taylor.open_contains_open_interval =  |- (#forall:fun(fun(cart(real,'?47),bool),bool) (\e:cart(real,'?47). (#forall:fun(fun(fun(cart(real,'?47),bool),bool),bool) (\s:fun(cart(real,'?47),bool). (#forall:fun(fun(cart(real,'?47),bool),bool) (\x:cart(real,'?47). ((#==>:fun(bool,fun(bool,bool)) (#open:fun(fun(cart(real,'?47),bool),bool) s:fun(cart(real,'?47),bool))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?47),fun(fun(cart(real,'?47),bool),bool)) x:cart(real,'?47)) s:fun(cart(real,'?47),bool))) (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) ((#SUBSET:fun(fun(cart(real,'?47),bool),fun(fun(cart(real,'?47),bool),bool)) ((#IMAGE:fun(fun(real,cart(real,'?47)),fun(fun(real,bool),fun(cart(real,'?47),bool))) (\t:real. ((#vector_add:fun(cart(real,'?47),fun(cart(real,'?47),cart(real,'?47))) x:cart(real,'?47)) ((#%:fun(real,fun(cart(real,'?47),cart(real,'?47))) t:real) e:cart(real,'?47))))) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) s:fun(cart(real,'?47),bool)))))))))))))))
      #|Multivariate_taylor.diff2_dir =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) t:real))))))))))
      #|Multivariate_taylor.diff2_dir_derivative2 =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) t:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) e:cart(real,'N)) i:num)) ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) e:cart(real,'N)) j:num)) (((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) t:real)))))))))))))))))
      #|Multivariate_taylor.diff2_has_derivative_partial =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) e:cart(real,'N)) j:num)) (((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) t:real))))) (#atreal:fun(real,net(real)) t:real)))))))))))))
      #|Multivariate_taylor.diff2_derivative_partial =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) t:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) e:cart(real,'N)) j:num)) (((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) t:real))))))))))))))))
      #|Multivariate_taylor.diff2_real_diff_partial =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\e:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N))))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) x:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) e:cart(real,'N)))))) (#atreal:fun(real,net(real)) t:real)))))))))))))
      #|Multivariate_taylor.partial_const =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),real),bool)) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). c:real))) (\x:cart(real,'N). (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|Multivariate_taylor.partial_eq0_alt =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))) ((#=:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),real),bool)) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\x:cart(real,'N). (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|Multivariate_taylor.real_mvt0 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) a:real))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) a:real))) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) a:real)) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (f':fun(real,real) t:real)) a:real))))))))))))
      #|Multivariate_taylor.mixed_second_partials =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) j:num) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))))))))))))
      #|Multivariate_taylor.diff2c_domain_alt =  |- (#forall:fun(fun(fun(cart(real,'?48),real),bool),bool) (\f:fun(cart(real,'?48),real). (#forall:fun(fun(prod(cart(real,'?48),cart(real,'?48)),bool),bool) (\domain:prod(cart(real,'?48),cart(real,'?48)). ((#=:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'?48),cart(real,'?48)),fun(fun(cart(real,'?48),real),bool)) domain:prod(cart(real,'?48),cart(real,'?48))) f:fun(cart(real,'?48),real))) ((#/\:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'?48),cart(real,'?48)),fun(fun(cart(real,'?48),real),bool)) domain:prod(cart(real,'?48),cart(real,'?48))) f:fun(cart(real,'?48),real))) (#forall:fun(fun(cart(real,'?48),bool),bool) (\x:cart(real,'?48). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?48),fun(fun(cart(real,'?48),bool),bool)) x:cart(real,'?48)) (#closed_interval:fun(list(prod(cart(real,'?48),cart(real,'?48))),fun(cart(real,'?48),bool)) ((#CONS:fun(prod(cart(real,'?48),cart(real,'?48)),fun(list(prod(cart(real,'?48),cart(real,'?48))),list(prod(cart(real,'?48),cart(real,'?48))))) domain:prod(cart(real,'?48),cart(real,'?48))) #NIL:list(prod(cart(real,'?48),cart(real,'?48))))))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#continuous:fun(fun(cart(real,'?48),cart(real,1)),fun(net(cart(real,'?48)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?48),real),fun(cart(real,'?48),cart(real,1)))) #lift:fun(real,cart(real,1))) (((#partial2:fun(num,fun(num,fun(fun(cart(real,'?48),real),fun(cart(real,'?48),real)))) j:num) i:num) f:fun(cart(real,'?48),real)))) (#at:fun(cart(real,'?48),net(cart(real,'?48))) x:cart(real,'?48))))))))))))))))
      #|Multivariate_taylor.y_in_domain =  |- (#forall:fun(fun(prod(cart(real,'?49),cart(real,'?49)),bool),bool) (\domain:prod(cart(real,'?49),cart(real,'?49)). (#forall:fun(fun(cart(real,'?49),bool),bool) (\y:cart(real,'?49). (#forall:fun(fun(cart(real,'?49),bool),bool) (\w:cart(real,'?49). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'?49),cart(real,'?49)),fun(cart(real,'?49),fun(cart(real,'?49),bool))) domain:prod(cart(real,'?49),cart(real,'?49))) y:cart(real,'?49)) w:cart(real,'?49))) ((#IN:fun(cart(real,'?49),fun(fun(cart(real,'?49),bool),bool)) y:cart(real,'?49)) (#closed_interval:fun(list(prod(cart(real,'?49),cart(real,'?49))),fun(cart(real,'?49),bool)) ((#CONS:fun(prod(cart(real,'?49),cart(real,'?49)),fun(list(prod(cart(real,'?49),cart(real,'?49))),list(prod(cart(real,'?49),cart(real,'?49))))) domain:prod(cart(real,'?49),cart(real,'?49))) #NIL:list(prod(cart(real,'?49),cart(real,'?49)))))))))))))
      #|Multivariate_taylor.domain_width =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) p:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) y:cart(real,'N)) i:num)))) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)))))))))))))))
      #|Multivariate_taylor.sum_swap1 =  |- (#forall:fun(fun(fun(num,fun(num,real)),bool),bool) (\g:fun(num,fun(num,real)). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (\i:num. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (\j:num. ((g:fun(num,fun(num,real)) i:num) j:num)))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (\i:num. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\j:num. ((g:fun(num,fun(num,real)) j:num) i:num))))))))))
      #|Multivariate_taylor.m_taylor_error_eq =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\error:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#=:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) error:real)) (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) x:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) (#real_abs:fun(real,real) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) j:num)) (#real_abs:fun(real,real) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) j:num) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))))))))))) error:real))))))))))))))
      #|Multivariate_taylor.diff2_derivative2_bound =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) t:real) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) f:fun(cart(real,'N),real)) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) y:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) ((#vector_sub:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N))))))) t:real))) dd_bound:real))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_error_lemma =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) p:cart(real,'N))) ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) y:cart(real,'N))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) ((#vector_sub:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N))) i:num)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))))) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_upper_bound =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\hi_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) hi:real) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) (#real_abs:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) hi_bound:real)) (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) p:cart(real,'N))) hi_bound:real)))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_lower_bound =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\lo_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo:real) (f:fun(cart(real,'N),real) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo_bound:real) ((#real_sub:fun(real,fun(real,real)) lo:real) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) (#real_abs:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) lo_bound:real) (f:fun(cart(real,'N),real) p:cart(real,'N)))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_bounds =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\err_bound:real. (#forall:fun(fun(real,bool),bool) (\lo_bound:real. (#forall:fun(fun(real,bool),bool) (\hi_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_taylor_error:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool)))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#$:fun(cart(real,'N),fun(num,real)) w:cart(real,'N)) i:num)) (#real_abs:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) err_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo_bound:real) ((#real_sub:fun(real,fun(real,real)) lo:real) err_bound:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) hi:real) err_bound:real)) hi_bound:real)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) ((#,:fun(real,fun(real,prod(real,real))) lo_bound:real) hi_bound:real)))))))))))))))))))))))))))))
      #|Multivariate_taylor.diff2_derivative_partial_bound =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\d_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) d_bound:real)) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) t:real) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#derivative:fun(fun(real,real),fun(real,real)) ((#o:fun(fun(cart(real,'N),real),fun(fun(real,cart(real,'N)),fun(real,real))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (\t:real. ((#vector_add:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) y:cart(real,'N)) ((#%:fun(real,fun(cart(real,'N),cart(real,'N))) t:real) ((#vector_sub:fun(cart(real,'N),fun(cart(real,'N),cart(real,'N))) p:cart(real,'N)) y:cart(real,'N))))))) t:real))) d_bound:real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_partial_error_lemma =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) p:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))) dd_bound:real)))))))))))))))))))
      #|Multivariate_taylor.m_taylor_upper_partial_bound =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\hi_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) hi:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) hi:real) dd_bound:real)) hi_bound:real)) (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) p:cart(real,'N))) hi_bound:real)))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_lower_partial_bound =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\lo_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo:real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo_bound:real) ((#real_sub:fun(real,fun(real,real)) lo:real) dd_bound:real))) (#forall:fun(fun(cart(real,'N),bool),bool) (\p:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) p:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) lo_bound:real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) p:cart(real,'N)))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_partial_bounds =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\lo_bound:real. (#forall:fun(fun(real,bool),bool) (\hi_bound:real. ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((((#m_taylor_partial_error:fun(fun(cart(real,'N),real),fun(num,fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(real,bool))))) f:fun(cart(real,'N),real)) i:num) domain:prod(cart(real,'N),cart(real,'N))) w:cart(real,'N)) dd_bound:real)) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) y:cart(real,'N))) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo_bound:real) ((#real_sub:fun(real,fun(real,real)) lo:real) dd_bound:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) hi:real) dd_bound:real)) hi_bound:real)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) ((#,:fun(real,fun(real,prod(real,real))) lo_bound:real) hi_bound:real))))))))))))))))))))))))))))
      #|Multivariate_taylor.differentiable_local_at =  |- (#forall:fun(fun(fun(cart(real,'?50),bool),bool),bool) (\s:fun(cart(real,'?50),bool). (#forall:fun(fun(fun(cart(real,'?50),cart(real,'?51)),bool),bool) (\f:fun(cart(real,'?50),cart(real,'?51)). (#forall:fun(fun(fun(cart(real,'?50),cart(real,'?51)),bool),bool) (\g:fun(cart(real,'?50),cart(real,'?51)). (#forall:fun(fun(cart(real,'?50),bool),bool) (\x:cart(real,'?50). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?50),cart(real,'?51)),fun(net(cart(real,'?50)),bool)) f:fun(cart(real,'?50),cart(real,'?51))) (#at:fun(cart(real,'?50),net(cart(real,'?50))) x:cart(real,'?50)))) ((#==>:fun(bool,fun(bool,bool)) (#open:fun(fun(cart(real,'?50),bool),bool) s:fun(cart(real,'?50),bool))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?50),fun(fun(cart(real,'?50),bool),bool)) x:cart(real,'?50)) s:fun(cart(real,'?50),bool))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'?50),bool),bool) (\y:cart(real,'?50). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?50),fun(fun(cart(real,'?50),bool),bool)) y:cart(real,'?50)) s:fun(cart(real,'?50),bool))) ((#=:fun(cart(real,'?51),fun(cart(real,'?51),bool)) (g:fun(cart(real,'?50),cart(real,'?51)) y:cart(real,'?50))) (f:fun(cart(real,'?50),cart(real,'?51)) y:cart(real,'?50))))))) ((#differentiable:fun(fun(cart(real,'?50),cart(real,'?51)),fun(net(cart(real,'?50)),bool)) g:fun(cart(real,'?50),cart(real,'?51))) (#at:fun(cart(real,'?50),net(cart(real,'?50))) x:cart(real,'?50)))))))))))))))
      #|Multivariate_taylor.diff2_scale =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)))))))))
      #|Multivariate_taylor.diff2_neg =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)))))))
      #|Multivariate_taylor.has_derivative_uni_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). (#forall:fun(fun(fun(cart(real,'?52),real),bool),bool) (\f:fun(cart(real,'?52),real). (#forall:fun(fun(real,bool),bool) (\u':real. (#forall:fun(fun(fun(cart(real,'?52),cart(real,1)),bool),bool) (\f':fun(cart(real,'?52),cart(real,1)). (#forall:fun(fun(cart(real,'?52),bool),bool) (\x:cart(real,'?52). ((#==>:fun(bool,fun(bool,bool)) (((#has_derivative:fun(fun(cart(real,'?52),cart(real,1)),fun(fun(cart(real,'?52),cart(real,1)),fun(net(cart(real,'?52)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?52),real),fun(cart(real,'?52),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?52),real))) f':fun(cart(real,'?52),cart(real,1))) (#at:fun(cart(real,'?52),net(cart(real,'?52))) x:cart(real,'?52)))) ((#==>:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) u:fun(real,real)) u':real) (#atreal:fun(real,net(real)) (f:fun(cart(real,'?52),real) x:cart(real,'?52))))) (((#has_derivative:fun(fun(cart(real,'?52),cart(real,1)),fun(fun(cart(real,'?52),cart(real,1)),fun(net(cart(real,'?52)),bool))) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?52),real),fun(cart(real,'?52),cart(real,1)))) #lift:fun(real,cart(real,1))) ((#o:fun(fun(real,real),fun(fun(cart(real,'?52),real),fun(cart(real,'?52),real))) u:fun(real,real)) f:fun(cart(real,'?52),real)))) (\x:cart(real,'?52). ((#%:fun(real,fun(cart(real,1),cart(real,1))) u':real) (f':fun(cart(real,'?52),cart(real,1)) x:cart(real,'?52))))) (#at:fun(cart(real,'?52),net(cart(real,'?52))) x:cart(real,'?52)))))))))))))))
      #|Multivariate_taylor.diff_uni_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). (#forall:fun(fun(fun(cart(real,'?53),real),bool),bool) (\f:fun(cart(real,'?53),real). (#forall:fun(fun(cart(real,'?53),bool),bool) (\x:cart(real,'?53). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'?53),cart(real,1)),fun(net(cart(real,'?53)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?53),real),fun(cart(real,'?53),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?53),real))) (#at:fun(cart(real,'?53),net(cart(real,'?53))) x:cart(real,'?53)))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) u:fun(real,real)) (#atreal:fun(real,net(real)) (f:fun(cart(real,'?53),real) x:cart(real,'?53))))) ((#differentiable:fun(fun(cart(real,'?53),cart(real,1)),fun(net(cart(real,'?53)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?53),real),fun(cart(real,'?53),cart(real,1)))) #lift:fun(real,cart(real,1))) ((#o:fun(fun(real,real),fun(fun(cart(real,'?53),real),fun(cart(real,'?53),real))) u:fun(real,real)) f:fun(cart(real,'?53),real)))) (#at:fun(cart(real,'?53),net(cart(real,'?53))) x:cart(real,'?53)))))))))))
      #|Multivariate_taylor.diff2_uni_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) u:fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) u:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2_abs_pos_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_abs_neg_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_pow_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))))
      #|Multivariate_taylor.diff2_inv_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_sqrt_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_atn_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2_cos_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2_sin_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2_exp_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2_log_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_acs_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_asn_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_matan_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_add =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2_sub =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2_mul =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2_domain_scale =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))))))))))
      #|Multivariate_taylor.diff2_domain_neg =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2_domain_inv_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_sqrt_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_abs_pos_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_abs_neg_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_neg:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_pow_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))))))))))
      #|Multivariate_taylor.diff2_domain_atn_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2_domain_cos_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2_domain_sin_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2_domain_exp_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2_domain_log_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_acs_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_asn_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_matan_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_gt:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) bounds:prod(real,real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2_domain_add =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.diff2_domain_sub =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.diff2_domain_mul =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.diff2_imp_diff =  |- (#forall:fun(fun(fun(cart(real,'?54),real),bool),bool) (\f:fun(cart(real,'?54),real). (#forall:fun(fun(cart(real,'?54),bool),bool) (\x:cart(real,'?54). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'?54),real),fun(cart(real,'?54),bool)) f:fun(cart(real,'?54),real)) x:cart(real,'?54))) ((#differentiable:fun(fun(cart(real,'?54),cart(real,1)),fun(net(cart(real,'?54)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?54),real),fun(cart(real,'?54),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'?54),real))) (#at:fun(cart(real,'?54),net(cart(real,'?54))) x:cart(real,'?54))))))))
      #|Multivariate_taylor.diff2_imp_partial_diff =  |- (#forall:fun(fun(fun(cart(real,'?55),real),bool),bool) (\f:fun(cart(real,'?55),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'?55),bool),bool) (\x:cart(real,'?55). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'?55),real),fun(cart(real,'?55),bool)) f:fun(cart(real,'?55),real)) x:cart(real,'?55))) ((#differentiable:fun(fun(cart(real,'?55),cart(real,1)),fun(net(cart(real,'?55)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'?55),real),fun(cart(real,'?55),cart(real,1)))) #lift:fun(real,cart(real,1))) ((#partial:fun(num,fun(fun(cart(real,'?55),real),fun(cart(real,'?55),real))) i:num) f:fun(cart(real,'?55),real)))) (#at:fun(cart(real,'?55),net(cart(real,'?55))) x:cart(real,'?55))))))))))
      #|Multivariate_taylor.partial_local =  |- (#forall:fun(fun(fun(cart(real,'N),bool),bool),bool) (\s:fun(cart(real,'N),bool). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) (#open:fun(fun(cart(real,'N),bool),bool) s:fun(cart(real,'N),bool))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) x:cart(real,'N)) s:fun(cart(real,'N),bool))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) s:fun(cart(real,'N),bool))) ((#=:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) (g:fun(cart(real,'N),real) y:cart(real,'N))))))) ((#=:fun(real,fun(real,bool)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) x:cart(real,'N)))))))))))))))))
      #|Multivariate_taylor.second_partial_scale =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))) ((#real_mul:fun(real,fun(real,real)) c:real) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))))))))))))))
      #|Multivariate_taylor.second_partial_neg =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))) (#real_neg:fun(real,real) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.second_partial_add =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))) ((#real_add:fun(real,fun(real,real)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) g:fun(cart(real,'N),real)) x:cart(real,'N))))))))))))))))
      #|Multivariate_taylor.second_partial_sub =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))) ((#real_sub:fun(real,fun(real,real)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) g:fun(cart(real,'N),real)) x:cart(real,'N))))))))))))))))
      #|Multivariate_taylor.second_partial_mul =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))) ((#real_add:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))) ((#real_mul:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) x:cart(real,'N))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) g:fun(cart(real,'N),real)) x:cart(real,'N)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) g:fun(cart(real,'N),real)) x:cart(real,'N))))))))))))))))))
      #|Multivariate_taylor.second_partial_uni_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) u:fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#=:fun(real,fun(real,bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) u:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) u:fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N)))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) u:fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))))))))))))))))
      #|Multivariate_taylor.real_cont_at_local =  |- (#forall:fun(fun(fun(cart(real,'?56),real),bool),bool) (\f:fun(cart(real,'?56),real). (#forall:fun(fun(fun(cart(real,'?56),real),bool),bool) (\g:fun(cart(real,'?56),real). (#forall:fun(fun(cart(real,'?56),bool),bool) (\x:cart(real,'?56). (#forall:fun(fun(fun(cart(real,'?56),bool),bool),bool) (\s:fun(cart(real,'?56),bool). ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(cart(real,'?56),real),fun(net(cart(real,'?56)),bool)) g:fun(cart(real,'?56),real)) (#at:fun(cart(real,'?56),net(cart(real,'?56))) x:cart(real,'?56)))) ((#==>:fun(bool,fun(bool,bool)) (#open:fun(fun(cart(real,'?56),bool),bool) s:fun(cart(real,'?56),bool))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?56),fun(fun(cart(real,'?56),bool),bool)) x:cart(real,'?56)) s:fun(cart(real,'?56),bool))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'?56),bool),bool) (\y:cart(real,'?56). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?56),fun(fun(cart(real,'?56),bool),bool)) y:cart(real,'?56)) s:fun(cart(real,'?56),bool))) ((#=:fun(real,fun(real,bool)) (f:fun(cart(real,'?56),real) y:cart(real,'?56))) (g:fun(cart(real,'?56),real) y:cart(real,'?56))))))) ((#real_continuous:fun(fun(cart(real,'?56),real),fun(net(cart(real,'?56)),bool)) f:fun(cart(real,'?56),real)) (#at:fun(cart(real,'?56),net(cart(real,'?56))) x:cart(real,'?56)))))))))))))))
      #|Multivariate_taylor.real_cont_atreal_local =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\v:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) v:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) t:fun(real,bool))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) t:fun(real,bool))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) t:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (u:fun(real,real) y:real)) (v:fun(real,real) y:real)))))) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) u:fun(real,real)) (#atreal:fun(real,net(real)) x:real))))))))))))))
      #|Multivariate_taylor.diff2c_scale =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)))))))))
      #|Multivariate_taylor.diff2c_neg =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)))))))
      #|Multivariate_taylor.nth_diff_strong_eq_on_open =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) n:num) u:fun(real,real)) x:real)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) n:num) u:fun(real,real)) y:real)))))))))))))))
      #|Multivariate_taylor.diff2_imp_cont =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#real_continuous:fun(fun(cart(real,'N),real),fun(net(cart(real,'N)),bool)) f:fun(cart(real,'N),real)) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2_imp_partial_cont =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#real_continuous:fun(fun(cart(real,'N),real),fun(net(cart(real,'N)),bool)) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2c_uni_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\u:fun(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) u:fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) u:fun(real,real))) (#atreal:fun(real,net(real)) (f:fun(cart(real,'N),real) x:cart(real,'N))))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) u:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))))))
      #|Multivariate_taylor.real_open_delete =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) (#real_open:fun(fun(real,bool),bool) ((#DELETE:fun(fun(real,bool),fun(real,fun(real,bool))) s:fun(real,bool)) x:real)))))))
      #|Multivariate_taylor.diff2c_inv_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_sqrt_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_abs_pos_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_abs_neg_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_pow_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))))
      #|Multivariate_taylor.diff2c_atn_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2c_cos_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2c_sin_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2c_exp_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2c_log_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_acs_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_asn_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_matan_compose =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(cart(real,'N),real) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))) x:cart(real,'N))))))))
      #|Multivariate_taylor.diff2c_add =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2c_sub =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2c_mul =  |- (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) f:fun(cart(real,'N),real)) x:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) g:fun(cart(real,'N),real)) x:cart(real,'N))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2c_domain_scale =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))))))))))
      #|Multivariate_taylor.diff2c_domain_neg =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))))))))
      #|Multivariate_taylor.diff2c_domain_inv_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_sqrt_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_abs_pos_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_abs_neg_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_neg:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_pow_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))))))))))
      #|Multivariate_taylor.diff2c_domain_atn_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2c_domain_cos_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2c_domain_sin_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2c_domain_exp_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))))))))
      #|Multivariate_taylor.diff2c_domain_log_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) bounds:prod(real,real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_acs_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_asn_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_matan_compose =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_gt:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) bounds:prod(real,real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))))))))))))
      #|Multivariate_taylor.diff2c_domain_add =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.diff2c_domain_sub =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.diff2c_domain_mul =  |- (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))))))))))))
      #|Multivariate_taylor.m_lin_approx_neg =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N)))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d_bounds_list:list(prod(real,real))) (\i:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))) int:prod(real,real)))))) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))))))))))))))
      #|Multivariate_taylor.m_lin_approx_scale =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N)))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d_bounds_list:list(prod(real,real))) (\i:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_mul:fun(real,fun(real,real)) c:real) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N)))) int:prod(real,real)))))) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))))))))))))))))
      #|Multivariate_taylor.m_lin_approx_add =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d_bounds_list:list(prod(real,real))) (\i:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_add:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) x:cart(real,'N)))) int:prod(real,real)))))) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))))))))))))))))
      #|Multivariate_taylor.m_lin_approx_sub =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d_bounds_list:list(prod(real,real))) (\i:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_sub:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) x:cart(real,'N)))) int:prod(real,real)))))) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))))))))))))))))
      #|Multivariate_taylor.m_lin_approx_mul =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) f:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(cart(real,'N),cart(real,1)),fun(net(cart(real,'N)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun(cart(real,'N),real),fun(cart(real,'N),cart(real,1)))) #lift:fun(real,cart(real,1))) g:fun(cart(real,'N),real))) (#at:fun(cart(real,'N),net(cart(real,'N))) x:cart(real,'N)))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))) bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d_bounds_list:list(prod(real,real))) (\i:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) f:fun(cart(real,'N),real)) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) g:fun(cart(real,'N),real)) x:cart(real,'N))))) int:prod(real,real)))))) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) x:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))))))))))))))))
      #|Multivariate_taylor.second_bounded =  |- (#forall:fun(fun(prod(cart(real,'?57),cart(real,'?57)),bool),bool) (\domain:prod(cart(real,'?57),cart(real,'?57)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). (#forall:fun(fun(fun(cart(real,'?57),real),bool),bool) (\f:fun(cart(real,'?57),real). ((#=:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'?57),real),fun(prod(cart(real,'?57),cart(real,'?57)),fun(list(list(prod(real,real))),bool))) f:fun(cart(real,'?57),real)) domain:prod(cart(real,'?57),cart(real,'?57))) dd_bounds_list:list(list(prod(real,real))))) (#forall:fun(fun(cart(real,'?57),bool),bool) (\x:cart(real,'?57). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'?57),fun(fun(cart(real,'?57),bool),bool)) x:cart(real,'?57)) (#closed_interval:fun(list(prod(cart(real,'?57),cart(real,'?57))),fun(cart(real,'?57),bool)) ((#CONS:fun(prod(cart(real,'?57),cart(real,'?57)),fun(list(prod(cart(real,'?57),cart(real,'?57))),list(prod(cart(real,'?57),cart(real,'?57))))) domain:prod(cart(real,'?57),cart(real,'?57))) #NIL:list(prod(cart(real,'?57),cart(real,'?57))))))) (((#all_n:fun(num,fun(list(list(prod(real,real))),fun(fun(num,fun(list(prod(real,real)),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) dd_bounds_list:list(list(prod(real,real)))) (\i:num. (\list_i:list(prod(real,real)). (((#all_n:fun(num,fun(list(prod(real,real)),fun(fun(num,fun(prod(real,real),bool)),bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) list_i:list(prod(real,real))) (\j:num. (\int:prod(real,real). ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'?57),real),fun(cart(real,'?57),real)))) j:num) i:num) f:fun(cart(real,'?57),real)) x:cart(real,'?57))) int:prod(real,real))))))))))))))))))
      #|Multivariate_taylor.m_taylor_interval =  |- (#forall:fun(fun(cart(real,'?58),bool),bool) (\w:cart(real,'?58). (#forall:fun(fun(cart(real,'?58),bool),bool) (\y:cart(real,'?58). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(fun(cart(real,'?58),real),bool),bool) (\f:fun(cart(real,'?58),real). (#forall:fun(fun(prod(cart(real,'?58),cart(real,'?58)),bool),bool) (\domain:prod(cart(real,'?58),cart(real,'?58)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#=:fun(bool,fun(bool,bool)) (((((((#m_taylor_interval:fun(fun(cart(real,'?58),real),fun(prod(cart(real,'?58),cart(real,'?58)),fun(cart(real,'?58),fun(cart(real,'?58),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) f:fun(cart(real,'?58),real)) domain:prod(cart(real,'?58),cart(real,'?58))) y:cart(real,'?58)) w:cart(real,'?58)) f_bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))) ((#/\:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'?58),cart(real,'?58)),fun(cart(real,'?58),fun(cart(real,'?58),bool))) domain:prod(cart(real,'?58),cart(real,'?58))) y:cart(real,'?58)) w:cart(real,'?58))) ((#/\:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'?58),cart(real,'?58)),fun(fun(cart(real,'?58),real),bool)) domain:prod(cart(real,'?58),cart(real,'?58))) f:fun(cart(real,'?58),real))) ((#/\:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'?58),real),fun(cart(real,'?58),fun(prod(real,real),fun(list(prod(real,real)),bool)))) f:fun(cart(real,'?58),real)) y:cart(real,'?58)) f_bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) (((#second_bounded:fun(fun(cart(real,'?58),real),fun(prod(cart(real,'?58),cart(real,'?58)),fun(list(list(prod(real,real))),bool))) f:fun(cart(real,'?58),real)) domain:prod(cart(real,'?58),cart(real,'?58))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_inv_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_inv:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_sqrt_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sqrt:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_abs_pos_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_abs_neg_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_neg:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #real_abs:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_pow_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_atn_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #atn:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_cos_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #cos:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_sin_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #sin:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_exp_compose =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #exp:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_log_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #log:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_acs_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) f_bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #acs:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_asn_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) f_bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #asn:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_matan_compose =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (((#m_bounded_on_int:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(prod(real,real),bool))) f:fun(cart(real,'N),real)) domain:prod(cart(real,'N),cart(real,'N))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_gt:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) ((#o:fun(fun(real,real),fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) #matan:fun(real,real)) f:fun(cart(real,'N),real))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_neg =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) (\x:cart(real,'N). (#real_neg:fun(real,real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_scale =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_add =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) (\x:cart(real,'N). ((#real_add:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real)))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_sub =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) (\x:cart(real,'N). ((#real_sub:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real)))))))))))))))))))))))))
      #|Multivariate_taylor.m_taylor_mul =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\g:fun(cart(real,'N),real). (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\w:cart(real,'N). (#forall:fun(fun(prod(real,real),bool),bool) (\bounds:prod(real,real). (#forall:fun(fun(list(prod(real,real)),bool),bool) (\d_bounds_list:list(prod(real,real)). (#forall:fun(fun(list(list(prod(real,real))),bool),bool) (\dd_bounds_list:list(list(prod(real,real))). ((#==>:fun(bool,fun(bool,bool)) (((#m_cell_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),bool))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) g:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) ((((#m_lin_approx:fun(fun(cart(real,'N),real),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),bool)))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) y:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) (((#second_bounded:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(list(list(prod(real,real))),bool))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) dd_bounds_list:list(list(prod(real,real))))) (((((((#m_taylor_interval:fun(fun(cart(real,'N),real),fun(prod(cart(real,'N),cart(real,'N)),fun(cart(real,'N),fun(cart(real,'N),fun(prod(real,real),fun(list(prod(real,real)),fun(list(list(prod(real,real))),bool))))))) (\x:cart(real,'N). ((#real_mul:fun(real,fun(real,real)) (f:fun(cart(real,'N),real) x:cart(real,'N))) (g:fun(cart(real,'N),real) x:cart(real,'N))))) domain:prod(cart(real,'N),cart(real,'N))) y:cart(real,'N)) w:cart(real,'N)) bounds:prod(real,real)) d_bounds_list:list(prod(real,real))) dd_bounds_list:list(list(prod(real,real)))))))))))))))))))))))))
      #|Multivariate_taylor.REAL_LE_DIV_1 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)))))))
      #|Multivariate_taylor.partial_convex_max =  |- (#forall:fun(fun(fun(cart(real,'N),real),bool),bool) (\f:fun(cart(real,'N),real). (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\z:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\u:cart(real,'N). (#forall:fun(fun(cart(real,'N),bool),bool) (\v:cart(real,'N). (#forall:fun(fun(real,bool),bool) (\hi:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) i:num) j:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) i:num))) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) v:cart(real,'N)) i:num)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) u:cart(real,'N)) j:num)) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) j:num))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#$:fun(cart(real,'N),fun(num,real)) v:cart(real,'N)) j:num)) ((#$:fun(cart(real,'N),fun(num,real)) z:cart(real,'N)) j:num))) ((#==>:fun(bool,fun(bool,bool)) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) f:fun(cart(real,'N),real))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) j:num) j:num) f:fun(cart(real,'N),real)) y:cart(real,'N))))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) u:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) v:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real))))) (#forall:fun(fun(cart(real,'N),bool),bool) (\y:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(cart(real,'N),fun(fun(cart(real,'N),bool),bool)) y:cart(real,'N)) (#closed_interval:fun(list(prod(cart(real,'N),cart(real,'N))),fun(cart(real,'N),bool)) ((#CONS:fun(prod(cart(real,'N),cart(real,'N)),fun(list(prod(cart(real,'N),cart(real,'N))),list(prod(cart(real,'N),cart(real,'N))))) ((#,:fun(cart(real,'N),fun(cart(real,'N),prod(cart(real,'N),cart(real,'N)))) x:cart(real,'N)) z:cart(real,'N))) #NIL:list(prod(cart(real,'N),cart(real,'N))))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(cart(real,'N),real) y:cart(real,'N))) hi:real)))))))))))))))))))))))))
      #|Multivariate_taylor.f_lift_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun('?59,cart(real,1)),fun(fun('?59,cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun('?59,real),fun('?59,cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:'?59. c:real))) (\x:'?59. (#lift:fun(real,cart(real,1)) c:real)))))
      #|Multivariate_taylor.f_lift_unary =  |- (#forall:fun(fun(fun('?60,real),bool),bool) (\f:fun('?60,real). ((#=:fun(fun('?60,cart(real,1)),fun(fun('?60,cart(real,1)),bool)) ((#o:fun(fun(real,cart(real,1)),fun(fun('?60,real),fun('?60,cart(real,1)))) #lift:fun(real,cart(real,1))) (\x:'?60. (f:fun('?60,real) x:'?60)))) (\x:'?60. (#lift:fun(real,cart(real,1)) (f:fun('?60,real) x:'?60))))))
      #|Multivariate_taylor.diff2_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). c:real)) x:cart(real,'N))))))
      #|Multivariate_taylor.diff2_domain_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). c:real))))))
      #|Multivariate_taylor.partial2_const =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),real),bool)) (((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). c:real))) (\x:cart(real,'N). (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Multivariate_taylor.diff2c_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). c:real)) x:cart(real,'N))))))
      #|Multivariate_taylor.diff2c_domain_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). c:real))))))
      #|Multivariate_taylor.partial_x_lemma =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\i:num. ((#=:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),real),bool)) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num)))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) (#basis:fun(num,cart(real,'N)) i:num)) k:num)))))))
      #|Multivariate_taylor.partial_x =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) k:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#=:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),real),bool)) ((#partial:fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real))) i:num) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num)))) (\x:cart(real,'N). (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) i:num) k:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Multivariate_taylor.partial2_x =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#=:fun(fun(cart(real,'N),real),fun(fun(cart(real,'N),real),bool)) (((#partial2:fun(num,fun(num,fun(fun(cart(real,'N),real),fun(cart(real,'N),real)))) i:num) j:num) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num)))) (\x:cart(real,'N). (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Multivariate_taylor.diff2_x =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) k:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#diff2:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2_domain_x =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) k:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#diff2_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num))))))))
      #|Multivariate_taylor.diff2c_x =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) k:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#diff2c:fun(fun(cart(real,'N),real),fun(cart(real,'N),bool)) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num))) x:cart(real,'N)))))))
      #|Multivariate_taylor.diff2c_domain_x =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(prod(cart(real,'N),cart(real,'N)),bool),bool) (\domain:prod(cart(real,'N),cart(real,'N)). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) k:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((#diff2c_domain:fun(prod(cart(real,'N),cart(real,'N)),fun(fun(cart(real,'N),real),bool)) domain:prod(cart(real,'N),cart(real,'N))) (\x:cart(real,'N). ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) k:num))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = m_taylor_interval second_bounded diff2c_domain diff2_domain m_bounded_on_int m_cell_domain diff2c diff2 partial2 m_taylor_partial_error m_taylor_error m_lin_approx all_n partial cell_domain taylor_interval has_bounded_second_derivative lin_approx nth_diff_strong_int nth_diff_strong nth_diff_weak nth_differentiable_on_int nth_differentiable_on nth_differentiable nth_derivative derivative distn leqif uphalf half HALF double odd iteri iter minn maxn relU preim predD predC predU predI predT pred0 subrel subpred XOR isSome associative idempotent commutative self_inverse rev_left_loop left_loop right_distributive left_commutative right_zero left_id rev_right_loop right_loop left_distributive right_commutative left_zero right_id right_injective left_injective right_inverse left_inverse involutive bijective ocancel pcancel cancel injective pcomp omap obind odflt oapp ssreflect_eq error_mul_f1 error_mul_f2 list_sum2 list_sum ddmatan dmatan matan halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1149
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?61
      #|counter_genvar = _3726288:bool
      #|
    ),
  )
}
