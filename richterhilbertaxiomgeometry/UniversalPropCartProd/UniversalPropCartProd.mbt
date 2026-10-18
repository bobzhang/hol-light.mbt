// Translated from upstream RichterHilbertAxiomGeometry/UniversalPropCartProd.ml; edit this file directly.

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:11
fn step_1() -> Unit raise {
  @readable.parseasinfix("∉", (11L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:12
fn step_2() -> Unit raise {
  @readable.parseasinfix("∏", (20L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:13
fn step_3() -> Unit raise {
  @readable.parseasinfix("∘", (20L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:14
fn step_4() -> Unit raise {
  @readable.parseasinfix("→", (13L, "right"))
}

///|
/// NOTIN
fn step_5() -> Unit raise {
  notin_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀a l. a ∉ l ⇔ ¬(a ∈ l)")))
}

///|
let notin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOTIN")

///|
/// `NOTIN`
pub fn notin() -> @kernel.Thm {
  notin_c.get()
}

///|
/// CartesianProduct
fn step_6() -> Unit raise {
  cartesianproduct_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀X Y. X ∏ Y = {x,y | x ∈ X ∧ y ∈ Y}")))
}

///|
let cartesianproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CartesianProduct")

///|
/// `CartesianProduct`
pub fn cartesianproduct() -> @kernel.Thm {
  cartesianproduct_c.get()
}

///|
/// FUNCTION
fn step_7() -> Unit raise {
  function_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  FUNCTION α  ⇔  ∃f s t. α = (t, f, s)  ∧\n    (∀x. x IN s ⇒ f x  IN t) ∧ ∀x. x ∉ s ⇒ f x  = @y. T")))
}

///|
let function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNCTION")

///|
/// `FUNCTION`
pub fn function() -> @kernel.Thm {
  function_c.get()
}

///|
/// SOURCE
fn step_8() -> Unit raise {
  source_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  SOURCE α = SND (SND α)")))
}

///|
let source_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOURCE")

///|
/// `SOURCE`
pub fn source() -> @kernel.Thm {
  source_c.get()
}

///|
/// FUN
fn step_9() -> Unit raise {
  fun_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  FUN α = FST (SND α)")))
}

///|
let fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN")

///|
/// `FUN`
pub fn fun() -> @kernel.Thm {
  fun_c.get()
}

///|
/// TARGET
fn step_10() -> Unit raise {
  target_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  TARGET α = FST α")))
}

///|
let target_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARGET")

///|
/// `TARGET`
pub fn target() -> @kernel.Thm {
  target_c.get()
}

///|
/// FunctionSpace
fn step_11() -> Unit raise {
  functionspace_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀s t. s → t = {α | FUNCTION α  ∧  s = SOURCE α  ∧ t = TARGET α}")))
}

///|
let functionspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionSpace")

///|
/// `FunctionSpace`
pub fn functionspace() -> @kernel.Thm {
  functionspace_c.get()
}

///|
/// makeFunction
fn step_12() -> Unit raise {
  makefunction_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀t f s. makeFunction t f s = (t, (λx. if x ∈ s then f x else @y. T), s)")))
}

///|
let makefunction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunction")

///|
/// `makeFunction`
pub fn makefunction() -> @kernel.Thm {
  makefunction_c.get()
}

///|
/// Projection1Function
fn step_13() -> Unit raise {
  projection1function_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Pi1 X Y = makeFunction X FST (X ∏ Y)")))
}

///|
let projection1function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Projection1Function")

///|
/// `Projection1Function`
pub fn projection1function() -> @kernel.Thm {
  projection1function_c.get()
}

///|
/// Projection2Function
fn step_14() -> Unit raise {
  projection2function_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Pi2 X Y = makeFunction Y SND (X ∏ Y)")))
}

///|
let projection2function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Projection2Function")

///|
/// `Projection2Function`
pub fn projection2function() -> @kernel.Thm {
  projection2function_c.get()
}

///|
/// FunctionComposition
fn step_15() -> Unit raise {
  functioncomposition_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀α β.  α ∘ β = makeFunction (TARGET α) (FUN α o FUN β) (SOURCE β)")))
}

///|
let functioncomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionComposition")

///|
/// `FunctionComposition`
pub fn functioncomposition() -> @kernel.Thm {
  functioncomposition_c.get()
}

///|
/// IN_CartesianProduct
fn step_16() -> Unit raise {
  in_cartesianproduct_v1_c.set(@readable.prove(
    "\n  forall X Y x y. x,y IN X prod Y  <=>  x IN X /\\  y IN Y",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            @readable.Thm("CartesianProduct", () => cartesianproduct()),
          ],
        ),
        @readable.by(@readable.fol, [@readable.Thm("PAIR_EQ", () => @pair.pair_eq())]),
      ],
    ),
  ))
}

///|
let in_cartesianproduct_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CartesianProduct")

///|
/// `IN_CartesianProduct`
pub fn in_cartesianproduct_v1() -> @kernel.Thm {
  in_cartesianproduct_v1_c.get()
}

///|
/// IN_CartesianProduct
fn step_22() -> Unit raise {
  in_cartesianproduct_c.set(@readable.prove(
    "\n  forall X Y x y. x,y IN X prod Y  <=>  x IN X /\\  y IN Y",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            @readable.Thm("CartesianProduct", () => cartesianproduct()),
          ],
        ),
        @readable.by(@readable.fol, [@readable.Thm("PAIR_EQ", () => @pair.pair_eq())]),
      ],
    ),
  ))
}

///|
let in_cartesianproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CartesianProduct")

///|
/// `IN_CartesianProduct`
pub fn in_cartesianproduct() -> @kernel.Thm {
  in_cartesianproduct_c.get()
}

///|
/// CartesianFstSnd
fn step_23() -> Unit raise {
  cartesianfstsnd_c.set(@readable.prove(
    "\n  forall pair. pair IN X prod Y  ==>  FST pair IN X /\\  SND pair IN Y",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
        @readable.Thm("IN_CartesianProduct", () => in_cartesianproduct()),
      ],
    ),
  ))
}

///|
let cartesianfstsnd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CartesianFstSnd")

///|
/// `CartesianFstSnd`
pub fn cartesianfstsnd() -> @kernel.Thm {
  cartesianfstsnd_c.get()
}

///|
/// FUNCTION_EQ
fn step_26() -> Unit raise {
  function_eq_c.set(@readable.prove(
    "\n  forall alpha beta. FUNCTION alpha  /\\   FUNCTION beta  /\\   SOURCE alpha = SOURCE beta  /\\ \n    FUN alpha = FUN beta  /\\   TARGET alpha = TARGET beta\n    ==> alpha = beta",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("FUNCTION", () => function()),
        @readable.Thm("SOURCE", () => source()),
        @readable.Thm("TARGET", () => target()),
        @readable.Thm("FUN", () => fun()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let function_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNCTION_EQ")

///|
/// `FUNCTION_EQ`
pub fn function_eq() -> @kernel.Thm {
  function_eq_c.get()
}

///|
/// IN_FunctionSpace
fn step_32() -> Unit raise {
  in_functionspace_c.set(@readable.prove(
    "\n  forall s t alpha. alpha IN s ---> t\n    <=>  FUNCTION alpha  /\\   s = SOURCE alpha  /\\   t = TARGET alpha",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
        @readable.Thm("FunctionSpace", () => functionspace()),
      ],
    ),
  ))
}

///|
let in_functionspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_FunctionSpace")

///|
/// `IN_FunctionSpace`
pub fn in_functionspace() -> @kernel.Thm {
  in_functionspace_c.get()
}

///|
/// makeFunction_EQ
fn step_34() -> Unit raise {
  makefunction_eq_c.set(@readable.prove(
    "\n  forall f g s t.  (forall x. x IN s ==> f x = g x)\n    ==>  makeFunction t f s = makeFunction t g s",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("makeFunction", () => makefunction()),
        @readable.Thm("NOTIN", () => notin()),
        @readable.Thm("FUN_EQ_THM", () => @class.fun_eq_thm()),
      ],
    ),
  ))
}

///|
let makefunction_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunction_EQ")

///|
/// `makeFunction_EQ`
pub fn makefunction_eq() -> @kernel.Thm {
  makefunction_eq_c.get()
}

///|
/// makeFunctionyieldsFUN
fn step_38() -> Unit raise {
  makefunctionyieldsfun_c.set(@readable.prove(
    "\n  forall alpha g t f s.  alpha = makeFunction t f s /\\  g = FUN alpha\n    ==> forall x. x IN s ==> f x = g x",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("makeFunction", () => makefunction()),
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("FUN", () => fun()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let makefunctionyieldsfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunctionyieldsFUN")

///|
/// `makeFunctionyieldsFUN`
pub fn makefunctionyieldsfun() -> @kernel.Thm {
  makefunctionyieldsfun_c.get()
}

///|
/// makeFunctionEq
fn step_39() -> Unit raise {
  makefunctioneq_c.set(@readable.prove(
    "\n  forall alpha beta f g s t.  alpha = makeFunction t f s  /\\  beta = makeFunction t g s  /\\ \n    (forall x. x IN s ==> f x = g x)  ==>  alpha = beta",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("makeFunction", () => makefunction()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let makefunctioneq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunctionEq")

///|
/// `makeFunctionEq`
pub fn makefunctioneq() -> @kernel.Thm {
  makefunctioneq_c.get()
}

///|
/// FunctionSpaceOnSource
fn step_40() -> Unit raise {
  functionspaceonsource_c.set(@readable.prove(
    "\n  forall alpha f s t.  alpha IN s ---> t  /\\   f = FUN alpha\n    ==>  forall x. x IN s ==> f x IN t",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
            @readable.Thm("FUN", () => fun()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let functionspaceonsource_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionSpaceOnSource")

///|
/// `FunctionSpaceOnSource`
pub fn functionspaceonsource() -> @kernel.Thm {
  functionspaceonsource_c.get()
}

///|
/// FunctionSpaceOnOffSource
fn step_42() -> Unit raise {
  functionspaceonoffsource_c.set(@readable.prove(
    "\n  forall alpha f s t.  alpha IN s ---> t  /\\   f = FUN alpha\n    ==>  (forall x. x IN s ==> f x IN t) /\\  forall x. x NOTIN s ==> f x = @y. T",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
            @readable.Thm("FUN", () => fun()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let functionspaceonoffsource_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionSpaceOnOffSource")

///|
/// `FunctionSpaceOnOffSource`
pub fn functionspaceonoffsource() -> @kernel.Thm {
  functionspaceonoffsource_c.get()
}

///|
/// ImpliesTruncatedFunctionSpace
fn step_43() -> Unit raise {
  impliestruncatedfunctionspace_c.set(@readable.prove(
    "\n  forall alpha s t f.  alpha = makeFunction t f s  /\\   (forall x. x IN s ==> f x IN t)\n    ==> alpha IN s ---> t",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("makeFunction", () => makefunction()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let impliestruncatedfunctionspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ImpliesTruncatedFunctionSpace")

///|
/// `ImpliesTruncatedFunctionSpace`
pub fn impliestruncatedfunctionspace() -> @kernel.Thm {
  impliestruncatedfunctionspace_c.get()
}

///|
/// FunFunctionSpaceImplyFunction
fn step_44() -> Unit raise {
  funfunctionspaceimplyfunction_c.set(@readable.prove(
    "\n  forall alpha s t f.  alpha IN s ---> t  /\\   f = FUN alpha  ==>  alpha = makeFunction t f s",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("makeFunction", () => makefunction()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("FUN", () => fun()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("FUN_EQ_THM", () => @class.fun_eq_thm())],
        ),
      ],
    ),
  ))
}

///|
let funfunctionspaceimplyfunction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunFunctionSpaceImplyFunction")

///|
/// `FunFunctionSpaceImplyFunction`
pub fn funfunctionspaceimplyfunction() -> @kernel.Thm {
  funfunctionspaceimplyfunction_c.get()
}

///|
/// UseFunctionComposition
fn step_45() -> Unit raise {
  usefunctioncomposition_c.set(@readable.prove(
    "\n  forall alpha beta u f t g s. alpha = makeFunction u f t  /\\ \n    beta = makeFunction t g s  /\\   beta IN s ---> t\n    ==> alpha _o_ beta = makeFunction u (f o g) s",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("makeFunction", () => makefunction()),
            @readable.Thm("FunctionComposition", () => functioncomposition()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("FUN", () => fun()),
            @readable.Thm("BETA_THM", () => @theorems.beta_thm()),
            @readable.Thm("o_THM", () => @trivia.o_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
          ],
        ),
        @readable.intro_tac(
          "forall [u'] [f'] [t'] [t1] [g1] [s1] [u] [f] [t] [g] [s],\n    Halpha Hbeta Hbeta_st Hs Ht",
        ),
        @readable.have(
          "\n    (forall x. x IN s ==> g x IN t)",
          "g_st",
          @readable.by(
            @readable.fol,
            [@readable.Label("Hbeta_st"), @readable.Label("Hbeta")],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("Halpha"),
            @readable.Rule(@equal.gsym, @readable.Label("Hs")),
            @readable.Label("Hbeta"),
            @readable.Label("g_st"),
          ],
        ),
      ],
    ),
  ))
}

///|
let usefunctioncomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UseFunctionComposition")

///|
/// `UseFunctionComposition`
pub fn usefunctioncomposition() -> @kernel.Thm {
  usefunctioncomposition_c.get()
}

///|
/// PairProjectionFunctions
fn step_50() -> Unit raise {
  pairprojectionfunctions_c.set(@readable.prove(
    "\n  forall X Y. Pi1 X Y IN X prod Y ---> X  /\\   Pi2 X Y IN X prod Y ---> Y",
    @readable.steps(
      [
        @readable.intro_tac("forall X Y"),
        @readable.have(
          "\n    forall pair. pair IN X prod Y  ==>  FST pair IN X  /\\  SND pair IN Y",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Thm("CartesianFstSnd", () => cartesianfstsnd())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("Projection1Function", () => projection1function()),
            @readable.Thm("Projection2Function", () => projection2function()),
            @readable.Prev,
            @readable.Thm(
              "ImpliesTruncatedFunctionSpace",
              () => impliestruncatedfunctionspace(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let pairprojectionfunctions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PairProjectionFunctions")

///|
/// `PairProjectionFunctions`
pub fn pairprojectionfunctions() -> @kernel.Thm {
  pairprojectionfunctions_c.get()
}

///|
/// UniversalPropertyProduct
fn step_55() -> Unit raise {
  universalpropertyproduct_c.set(@readable.prove(
    "\n  forall M A B alpha beta.  alpha IN M ---> A  /\\   beta IN M ---> B\n      ==>  ?!gamma.  gamma IN M ---> A prod B  /\\   Pi1 A B _o_ gamma = alpha  /\\   Pi2 A B _o_ gamma = beta",
    @readable.steps(
      [
        @readable.intro_tac("forall M A B alpha beta, H1"),
        @readable.consider(
          "f g",
          "f = FUN alpha /\\  g = FUN beta    ",
          "fgExist",
          @readable.by(@readable.fol, []),
        ),
        @readable.consider(
          "h",
          "h = \\ x. (f x,g x)    ",
          "hExists",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    forall x. x IN M  ==>  h x IN A prod B",
          "hProd",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("hExists"),
              @readable.Thm("IN_CartesianProduct", () => in_cartesianproduct()),
              @readable.Label("H1"),
              @readable.Label("fgExist"),
              @readable.Thm("FunctionSpaceOnSource", () => functionspaceonsource()),
            ],
          ),
        ),
        @readable.consider(
          "gamma",
          "gamma = makeFunction (A prod B) h  M    ",
          "gammaExists",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    gamma IN M ---> A prod B",
          "gammaFunSpace",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("hProd"),
              @readable.Thm(
                "ImpliesTruncatedFunctionSpace",
                () => impliestruncatedfunctionspace(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    forall x. x IN M  ==>  (FST o h) x = f x  /\\   (SND o h) x = g x",
          "h_fg",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("hExists"),
              @readable.Thm("PAIR", () => @pair.pair()),
              @readable.Thm("o_THM", () => @trivia.o_thm()),
            ],
          ),
        ),
        @readable.have(
          "\n    Pi1 A B _o_ gamma = makeFunction A (FST o h) M  /\\ \n    Pi2 A B _o_ gamma = makeFunction B (SND o h) M",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("Projection1Function", () => projection1function()),
              @readable.Thm("Projection2Function", () => projection2function()),
              @readable.Label("gammaExists"),
              @readable.Label("gammaFunSpace"),
              @readable.Thm("UseFunctionComposition", () => usefunctioncomposition()),
            ],
          ),
        ),
        @readable.have(
          "\n    Pi1 A B _o_ gamma = alpha  /\\   Pi2 A B _o_ gamma = beta",
          "gammaWorks",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("h_fg"),
              @readable.Thm("makeFunction_EQ", () => makefunction_eq()),
              @readable.Label("H1"),
              @readable.Label("fgExist"),
              @readable.Thm(
                "FunFunctionSpaceImplyFunction",
                () => funfunctionspaceimplyfunction(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n   forall theta.  theta IN M ---> A prod B  /\\   Pi1 A B _o_ theta = alpha  /\\   Pi2 A B _o_ theta = beta  ==> theta = gamma",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall theta, thetaWorks"),
              @readable.consider(
                "k",
                "k = FUN theta    ",
                "kExists",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      theta = makeFunction (A prod B) k M",
                "thetaFUNk",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("thetaWorks"),
                    @readable.Prev,
                    @readable.Thm(
                      "FunFunctionSpaceImplyFunction",
                      () => funfunctionspaceimplyfunction(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      alpha = makeFunction A (FST o k) M  /\\   beta = makeFunction B (SND o k) M",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Thm("Projection1Function", () => projection1function()),
                    @readable.Thm("Projection2Function", () => projection2function()),
                    @readable.Label("thetaFUNk"),
                    @readable.Label("thetaWorks"),
                    @readable.Thm(
                      "UseFunctionComposition",
                      () => usefunctioncomposition(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      forall x. x IN M  ==>  f x = (FST o k) x /\\  g x = (SND o k) x",
                "fg_k",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.TermsRule(
                      tms => th => @bool.ispecl(tms, th),
                      ["alpha", " f", " A", " (FST o k)", " M"],
                      @readable.Thm(
                        "makeFunctionyieldsFUN",
                        () => makefunctionyieldsfun(),
                      ),
                    ),
                    @readable.TermsRule(
                      tms => th => @bool.ispecl(tms, th),
                      ["beta", " g", " B", " (SND o k)", " M"],
                      @readable.Thm(
                        "makeFunctionyieldsFUN",
                        () => makefunctionyieldsfun(),
                      ),
                    ),
                    @readable.Prev,
                    @readable.Label("fgExist"),
                  ],
                ),
              ),
              @readable.have(
                "\n      forall x. x IN M ==> k x = ((FST o k) x, (SND o k) x)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Thm("PAIR", () => @pair.pair()),
                    @readable.Thm("o_THM", () => @trivia.o_thm()),
                  ],
                ),
              ),
              @readable.have(
                "\n      forall x. x IN M ==> k x = (f x, g x)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("fg_k"),
                    @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("hExists"),
                  @readable.Label("thetaFUNk"),
                  @readable.Label("gammaExists"),
                  @readable.Prev,
                  @readable.Thm("makeFunctionEq", () => makefunctioneq()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("gammaFunSpace"),
            @readable.Label("gammaWorks"),
            @readable.Prev,
            @readable.Thm("EXISTS_UNIQUE_THM", () => @theorems.exists_unique_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let universalpropertyproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UniversalPropertyProduct")

///|
/// `UniversalPropertyProduct`
pub fn universalpropertyproduct() -> @kernel.Thm {
  universalpropertyproduct_c.get()
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
  step_22()
  step_23()
  step_26()
  step_32()
  step_34()
  step_38()
  step_39()
  step_40()
  step_42()
  step_43()
  step_44()
  step_45()
  step_50()
  step_55()
}
