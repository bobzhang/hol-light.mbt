// Formal_ineqs/trig/cos_eval.hl in its directory's load order: the test block of
// formal_ineqs/trig/cos_eval/cos_eval_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_cos_eval_ref.expected).

///|
test "Formal_ineqs/trig/cos_eval matches Formal_ineqs/trig/cos_eval.ml" {
  @testkit.release_output()
  @cos_eval.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/cos_eval"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/cos_eval")
  log.capture_stdout()
  // BEGIN generated theorem list
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
      #|Formal_ineqs/trig/cos_eval quotations (133):
      #|  (&0 <= lo <=> T) ==> --pi <= lo
      #|  e:num
      #|  n:num
      #|  interval_arith x (float_num F n e, f) \n\t\t\t   ==> x <= f /\\ &0 <= (float_num F n e)
      #|  a - b + &2 * b = a + b
      #|  x - pi
      #|  !x. cos (x - pi) = -- cos x
      #|  a - b = --(b - a)
      #|  !x. cos (pi - x) = -- cos x
      #|  &1
      #|  cos (&2 * pi - x) = cos x
      #|  !x. interval_arith (cos x) (-- &1, &1)
      #|  --k:real
      #|  cos x = cos (x + (&2 * pi) * k)
      #|  cos a1
      #|  cos b1
      #|  interval_arith x (a,b) /\\\n\t\t\t\t   (?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t    /\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t   interval_arith a1 (&0, pi) /\\\n\t\t\t\t   b1 <= pi /\\\n\t\t\t\t   cos a1 <= high /\\ low <= cos b1\n\t\t\t\t   ==> interval_arith (cos x) (low, high)
      #|  x + (&2 * pi) * k <= pi
      #|  --k:real
      #|  cos x = cos (x + (&2 * pi) * k)
      #|  max (cos a1) (cos b1)
      #|  interval_arith x (a,b) /\\\n\t\t\t\t   (?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t    /\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t   interval_arith a1 (&0, pi) /\\\n\t\t\t\t   b1 <= &2 * pi /\\\n\t\t\t\t   cos a1 <= high1 /\\ cos b1 <= high2 /\\\n\t\t\t\t   max high1 high2 = high\n\t\t\t\t       ==> interval_arith (cos x) (-- &1, high)
      #|  a1 - pi = --(pi - a1)
      #|  cos (a1 - pi) = cos (pi - a1)
      #|  b1 <= pi
      #|  cos a1
      #|  k:real
      #|  high:real
      #|  high:real
      #|  b1:real
      #|  a1:real
      #|  b:real
      #|  a:real
      #|  interval_arith x (a,b) /\\\n\t\t\t\t    (?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t     /\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t    interval_arith a1 (&0, pi) /\\\n\t\t\t\t    a1 + b1 <= &2 * pi /\\\n\t\t\t\t    cos a1 <= high\n\t\t\t\t    ==> interval_arith (cos x) (-- &1, high)
      #|  a1 - pi = --(pi - a1)
      #|  cos (a1 - pi) = cos (pi - a1)
      #|  cos b1
      #|  k:real
      #|  high:real
      #|  high:real
      #|  b1:real
      #|  a1:real
      #|  b:real
      #|  a:real
      #|  interval_arith x (a,b) /\\\n\t\t\t\t    (?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t     /\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t    interval_arith a1 (&0, pi) /\\\n\t\t\t\t    b1 <= &2 * pi /\\ &2 * pi <= a1 + b1 /\\\n\t\t\t\t    cos b1 <= high\n\t\t\t\t    ==> interval_arith (cos x) (-- &1, high)
      #|  (a + pi) + b = (a + b) + pi
      #|  (a + pi) + b = (a + b) + pi
      #|  k:real
      #|  b1 + pi
      #|  a1 + pi
      #|  b + pi
      #|  a + pi
      #|  interval_arith x (a,b) /\\\n\t\t\t\t       (?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t\t/\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t       interval_arith a1 (--pi, &0) /\\\n\t\t\t\t       (b1 <= &0 <=> T) /\\\n\t\t\t\t       low <= cos a1 /\\ cos b1 <= high\n\t\t\t\t       ==> interval_arith (cos x) (low, high)
      #|  (a + pi) + b = (a + b) + pi
      #|  (a + pi) + b = (a + b) + pi
      #|  k:real
      #|  --low2
      #|  --low1
      #|  b1 + pi
      #|  a1 + pi
      #|  b + pi
      #|  a + pi
      #|  interval_arith x (a,b) /\\\n\t\t\t\t       (?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t\t/\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t       interval_arith a1 (--pi, &0) /\\\n\t\t\t\t       b1 <= pi /\\\n\t\t\t\t       low1 <= cos a1 /\\ low2 <= cos b1 /\\\n\t\t\t\t       min low1 low2 = low\n\t\t\t\t       ==> interval_arith (cos x) (low, &1)
      #|  (a + pi) + b = (a + b) + pi
      #|  (a + pi) + b = (a + b) + pi
      #|  k:real
      #|  a1 + pi
      #|  b1 + pi
      #|  b + pi
      #|  a + pi
      #|  interval_arith x (a,b) /\\\n\t\t\t\t\t(?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t\t /\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t\tinterval_arith a1 (--pi, &0) /\\\n\t\t\t\t\tb2 = --b1 /\\ (a1 <= b2 <=> T) /\\\n\t\t\t\t\tlow <= cos a1\n\t\t\t\t\t==> interval_arith (cos x) (low, &1)
      #|  (a + pi) + b = (a + b) + pi
      #|  (a + pi) + b = (a + b) + pi
      #|  k:real
      #|  b1 + pi
      #|  a1 + pi
      #|  b + pi
      #|  a + pi
      #|  interval_arith x (a,b) /\\\n\t\t\t\t\t(?k. integer k /\\ a1 <= a + (&2 * pi) * k \n\t\t\t\t\t /\\ b + (&2 * pi) * k <= b1) /\\\n\t\t\t\t\tinterval_arith a1 (--pi, &0) /\\\n\t\t\t\t\tb1 <= pi /\\ b2 = --b1 /\\ (a1 <= b2 <=> F) /\\\n\t\t\t\t\tlow <= cos b1\n\t\t\t\t\t==> interval_arith (cos x) (low, &1)
      #|  cos x <= &1
      #|  -- &1 <= cos x
      #|  interval_arith x (--pi, &0) /\\ y = --x\n      ==> interval_arith y (&0, pi)
      #|  y = --x /\\ cos y <= high ==> cos x <= high
      #|  y = --x /\\ low <= cos y ==> low <= cos x
      #|  --cos t
      #|  interval_arith x (&0, pi) /\\\n     interval_arith pi (lo, hi) /\\\n     hi - x <= t /\\ t <= pi /\\\n     r <= cos t /\\ high = --r\n\t ==> cos x <= high
      #|  --cos t
      #|  interval_arith x (&0, pi) /\\\n     interval_arith pi (lo, hi) /\\\n     t <= lo - x /\\ (&0 <= t <=> T) /\\\n     cos t <= r /\\ low = --r\n\t ==> low <= cos x
      #|  cos x = cos (&2 * pi - x)
      #|  cos t
      #|  interval_arith x (pi, &2 * pi) /\\\n     interval_arith (&2 * pi) (lo, hi) /\\\n     t <= lo - x /\\ (&0 <= t <=> T) /\\\n     cos t <= r\n     ==> cos x <= r
      #|  cos x = cos (&2 * pi - x)
      #|  cos t
      #|  interval_arith x (pi, &2 * pi) /\\\n     interval_arith (&2 * pi) (lo, hi) /\\\n     hi - x <= t /\\ t <= pi /\\\n     r <= cos t\n     ==> r <= cos x
      #|  cos t
      #|  cos x = --cos (x - pi)
      #|  interval_arith x (pi, &2 * pi) /\\\n     interval_arith pi (lo, hi) /\\\n     x - lo <= t /\\ t <= pi /\\\n     r <= cos t /\\ high = --r\n     ==> cos x <= high
      #|  cos t
      #|  cos x = --cos (x - pi)
      #|  interval_arith x (pi, &2 * pi) /\\\n     interval_arith pi (lo, hi) /\\\n     t <= x - hi /\\ (&0 <= t <=> T) /\\\n     cos t <= r /\\ low = --r\n     ==> low <= cos x
      #|  &0
      #|  ?k. integer k /\\ a <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b
      #|  (&2 * pi) * z = z * (&2 * pi)
      #|  z * lo:real
      #|  b - n:real
      #|  (&2 * pi) * z = z * (&2 * pi)
      #|  z * hi:real
      #|  a - m:real
      #|  -- &i
      #|  &i = z /\\ interval_arith (&2 * pi) (lo, hi) /\\ &0 <= lo /\\\n    z * hi <= m /\\ a1 <= a - m /\\\n    n <= z * lo /\\ b - n <= b1\n    ==> ?k. integer k /\\ a1 <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b1
      #|  (&2 * pi) * z = z * (&2 * pi)
      #|  z * hi:real
      #|  b + n:real
      #|  (&2 * pi) * z = z * (&2 * pi)
      #|  z * lo:real
      #|  a + m:real
      #|  &i
      #|  &i = z /\\ interval_arith (&2 * pi) (lo, hi) /\\ &0 <= lo /\\\n    m <= z * lo /\\ a1 <= a + m /\\\n    z * hi <= n /\\ b + n <= b1\n    ==> ?k. integer k /\\ a1 <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b1
      #|  k + &1
      #|  interval_arith (&2 * pi) (lo, hi) /\\\n     a2 <= a1 + lo /\\ b1 + hi <= b2 /\\\n     (?k. integer k /\\ a1 <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b1)\n     ==> (?k. integer k /\\ a2 <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b2)
      #|  interval_arith pi (lo, hi) /\\\n     (a1 <= lo <=> F)\n     ==> lo <= a1 /\\ lo <= pi
      #|  interval_arith (&2 * pi) (lo, hi) /\\\n     m <= a1 + b1 /\\ (lo <= m <=> T) /\\ hi - lo <= t /\\\n     b1 + t <= b2\n     ==> b1 <= b2 /\\ &2 * pi <= a1 + b2
      #|  interval_arith (&2 * pi) (lo, hi) /\\\n     a1 + b1 <= n /\\ (n <= lo <=> T)\n     ==> a1 + b1 <= &2 * pi
      #|  interval_arith (&2 * pi) (lo, hi) /\\ hi - lo <= t /\\\n     m <= a1 + b1 /\\ a1 + b1 <= n /\\ n - m <= r /\\\n     (n <= lo <=> F) /\\ r + t <= z /\\\n     b1 + z <= b2\n     ==> b1 <= b2 /\\ &2 * pi <= a1 + b2
      #|  interval_arith (&2 * pi) (lo, hi) /\\\n     m <= a1 + b1 /\\ (hi <= m <=> T)\n     ==> &2 * pi <= a1 + b1
      #|  k:real
      #|  a2 <= a1 /\\ b1 <= b2 /\\\n     (?k. integer k /\\ a1 <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b1)\n   ==> (?k. integer k /\\ a2 <= a + (&2 * pi) * k /\\ b + (&2 * pi) * k <= b2)
      #|  (&0 <= a1 <=> T) /\\ a1 <= pi ==> interval_arith a1 (&0, pi)
      #|  (&0 <= a1 <=> F) /\\ --pi <= a1 ==> interval_arith a1 (--pi, &0)
      #|  (&0 <= b1 <=> T) /\\ b1 <= pi ==> interval_arith b1 (&0, pi)
      #|  b1 <= pi /\\ (&0 <= a1 <=> F) /\\ b2 = --b1 /\\ (a1 <= b2 <=> F)\n       ==> interval_arith b1 (&0, pi)
      #|  &2 * pi <= a1 + b1 /\\ a1 <= pi /\\ b1 <= &2 * pi\n     ==> interval_arith b1 (pi, &2 * pi)
      #|  (b1 <= &0 <=> T) /\\ (a1 <= b1 <=> T) /\\ --pi <= a1\n     ==> interval_arith b1 (--pi, &0)
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? ! ==> /\ T =
      #|definitions = 1061
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1960907
      #|counter_genvar = _3717854:bool
      #|
    ),
  )
}
