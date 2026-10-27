// Translated from upstream Jordan/parse_ext_override_interface.ml; edit this file directly.

///|
/// `unambiguous_interface`
pub fn unambiguous_interface(x1 : Unit) -> Unit raise {
  let _ = x1
  @printer.parse_as_infix("+|", (16L, "right"))
  @printer.parse_as_infix("-|", (18L, "left"))
  @printer.parse_as_infix("*|", (20L, "right"))
  @printer.parse_as_infix("**|", (24L, "left"))
  @printer.parse_as_infix("/|", (22L, "right"))
  @printer.parse_as_infix("%|", (22L, "left"))
  @printer.parse_as_infix("<|", (12L, "right"))
  @printer.parse_as_infix("<=|", (12L, "right"))
  @printer.parse_as_infix(">|", (12L, "right"))
  @printer.parse_as_infix(">=|", (12L, "right"))
  @preterm.override_interface("+|", @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)"))
  @preterm.override_interface("-|", @term_syntax.parse_term("(op_minus : (Num, Num) -> Num)"))
  @preterm.override_interface("*|", @term_syntax.parse_term("(op_star : (Num, Num) -> Num)"))
  @preterm.override_interface("**|", @term_syntax.parse_term("EXP"))
  @preterm.override_interface("/|", @term_syntax.parse_term("DIV"))
  @preterm.override_interface("%|", @term_syntax.parse_term("MOD"))
  @preterm.override_interface("<|", @term_syntax.parse_term("(op_lt : (Num, Num) -> Bool)"))
  @preterm.override_interface("<=|", @term_syntax.parse_term("(op_lt_eq : (Num, Num) -> Bool)"))
  @preterm.override_interface(">|", @term_syntax.parse_term("(op_gt : (Num, Num) -> Bool)"))
  @preterm.override_interface(">=|", @term_syntax.parse_term("(op_gt_eq : (Num, Num) -> Bool)"))
  @printer.parse_as_infix("+:", (16L, "right"))
  @printer.parse_as_infix("-:", (18L, "left"))
  @printer.parse_as_infix("*:", (20L, "right"))
  @printer.parse_as_infix("**:", (24L, "left"))
  @printer.parse_as_infix("<:", (12L, "right"))
  @printer.parse_as_infix("<=:", (12L, "right"))
  @printer.parse_as_infix(">:", (12L, "right"))
  @printer.parse_as_infix(">=:", (12L, "right"))
  @preterm.override_interface("+:", @term_syntax.parse_term("int_add"))
  @preterm.override_interface("-:", @term_syntax.parse_term("int_sub"))
  @preterm.override_interface("*:", @term_syntax.parse_term("int_mul"))
  @preterm.override_interface("**:", @term_syntax.parse_term("int_pow"))
  @preterm.override_interface("<:", @term_syntax.parse_term("int_lt"))
  @preterm.override_interface("<=:", @term_syntax.parse_term("int_le"))
  @preterm.override_interface(">:", @term_syntax.parse_term("int_gt"))
  @preterm.override_interface(">=:", @term_syntax.parse_term("int_ge"))
  @preterm.override_interface("--:", @term_syntax.parse_term("int_neg"))
  @preterm.override_interface("&:", @term_syntax.parse_term("int_of_num"))
  @preterm.override_interface("||:", @term_syntax.parse_term("int_abs"))
  @printer.parse_as_infix("+.", (16L, "right"))
  @printer.parse_as_infix("-.", (18L, "left"))
  @printer.parse_as_infix("*.", (20L, "right"))
  @printer.parse_as_infix("**.", (24L, "left"))
  @printer.parse_as_infix("<.", (12L, "right"))
  @printer.parse_as_infix("<=.", (12L, "right"))
  @printer.parse_as_infix(">.", (12L, "right"))
  @printer.parse_as_infix(">=.", (12L, "right"))
  @preterm.override_interface("+.", @term_syntax.parse_term("real_add"))
  @preterm.override_interface("-.", @term_syntax.parse_term("real_sub"))
  @preterm.override_interface("*.", @term_syntax.parse_term("real_mul"))
  @preterm.override_interface("**.", @term_syntax.parse_term("real_pow"))
  @preterm.override_interface("<.", @term_syntax.parse_term("real_lt"))
  @preterm.override_interface("<=.", @term_syntax.parse_term("real_le"))
  @preterm.override_interface(">.", @term_syntax.parse_term("real_gt"))
  @preterm.override_interface(">=.", @term_syntax.parse_term("real_ge"))
  @preterm.override_interface("--.", @term_syntax.parse_term("real_neg"))
  @preterm.override_interface("&.", @term_syntax.parse_term("real_of_num"))
  @preterm.override_interface("||.", @term_syntax.parse_term("real_abs"))
}

///|
/// `ambiguous_interface`
pub fn ambiguous_interface(x2 : Unit) -> Unit raise {
  let _ = x2
  @preterm.reduce_interface("+|", @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)"))
  @preterm.reduce_interface("-|", @term_syntax.parse_term("(op_minus : (Num, Num) -> Num)"))
  @preterm.reduce_interface("*|", @term_syntax.parse_term("(op_star : (Num, Num) -> Num)"))
  @preterm.reduce_interface("**|", @term_syntax.parse_term("EXP"))
  @preterm.reduce_interface("/|", @term_syntax.parse_term("DIV"))
  @preterm.reduce_interface("%|", @term_syntax.parse_term("MOD"))
  @preterm.reduce_interface("<|", @term_syntax.parse_term("(op_lt : (Num, Num) -> Bool)"))
  @preterm.reduce_interface("<=|", @term_syntax.parse_term("(op_lt_eq : (Num, Num) -> Bool)"))
  @preterm.reduce_interface(">|", @term_syntax.parse_term("(op_gt : (Num, Num) -> Bool)"))
  @preterm.reduce_interface(">=|", @term_syntax.parse_term("(op_gt_eq : (Num, Num) -> Bool)"))
  @preterm.reduce_interface("+:", @term_syntax.parse_term("(op_plus : (Int, Int) -> Int)"))
  @preterm.reduce_interface("-:", @term_syntax.parse_term("(op_minus : (Int, Int) -> Int)"))
  @preterm.reduce_interface("*:", @term_syntax.parse_term("(op_star : (Int, Int) -> Int)"))
  @preterm.reduce_interface("**:", @term_syntax.parse_term("(pow : (Int, Num) -> Int)"))
  @preterm.reduce_interface("<:", @term_syntax.parse_term("(op_lt : (Int, Int) -> Bool)"))
  @preterm.reduce_interface("<=:", @term_syntax.parse_term("(op_lt_eq : (Int, Int) -> Bool)"))
  @preterm.reduce_interface(">:", @term_syntax.parse_term("(op_gt : (Int, Int) -> Bool)"))
  @preterm.reduce_interface(">=:", @term_syntax.parse_term("(op_gt_eq : (Int, Int) -> Bool)"))
  @preterm.reduce_interface("--:", @term_syntax.parse_term("(op_minus_minus : (Int) -> Int)"))
  @preterm.reduce_interface("&:", @term_syntax.parse_term("int_of_num"))
  @preterm.reduce_interface("||:", @term_syntax.parse_term("(abs : (Int) -> Int)"))
  @preterm.reduce_interface("+.", @term_syntax.parse_term("(op_plus : (Real, Real) -> Real)"))
  @preterm.reduce_interface("-.", @term_syntax.parse_term("(op_minus : (Real, Real) -> Real)"))
  @preterm.reduce_interface("*.", @term_syntax.parse_term("(op_star : (Real, Real) -> Real)"))
  @preterm.reduce_interface("**.", @term_syntax.parse_term("(pow : (Real, Num) -> Real)"))
  @preterm.reduce_interface("<.", @term_syntax.parse_term("(op_lt : (Real, Real) -> Bool)"))
  @preterm.reduce_interface("<=.", @term_syntax.parse_term("(op_lt_eq : (Real, Real) -> Bool)"))
  @preterm.reduce_interface(">.", @term_syntax.parse_term("(op_gt : (Real, Real) -> Bool)"))
  @preterm.reduce_interface(">=.", @term_syntax.parse_term("(op_gt_eq : (Real, Real) -> Bool)"))
  @preterm.reduce_interface("--.", @term_syntax.parse_term("(op_minus_minus : (Real) -> Real)"))
  @preterm.reduce_interface("&.", @term_syntax.parse_term("real_of_num"))
  @preterm.reduce_interface("||.", @term_syntax.parse_term("(abs : (Real) -> Real)"))
}

///|
let prioritize_int_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("prioritize_int")

///|
/// `prioritize_int`
pub fn prioritize_int(x : Unit) -> Unit raise {
  (prioritize_int_c.get())(x)
}

///|
let prioritize_num_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("prioritize_num")

///|
/// `prioritize_num`
pub fn prioritize_num(x : Unit) -> Unit raise {
  (prioritize_num_c.get())(x)
}

///|
let prioritize_real_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("prioritize_real")

///|
/// `prioritize_real`
pub fn prioritize_real(x : Unit) -> Unit raise {
  (prioritize_real_c.get())(x)
}

///|
let pop_priority_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("pop_priority")

///|
/// `pop_priority`
pub fn pop_priority(x : Unit) -> Unit raise {
  (pop_priority_c.get())(x)
}

///|
let get_priority_c : @lib.Cell[(Unit) -> String raise] = @lib.Cell::new("get_priority")

///|
/// `get_priority`
pub fn get_priority(x : Unit) -> String raise {
  (get_priority_c.get())(x)
}

///|
/// prioritize_int, prioritize_num, prioritize_real, pop_priority, get_priority
fn step_1() -> Unit raise {
  let v = Ref::{ val: @list.List([]) }
  let prioritize_int : (Unit) -> Unit raise = fn(x3 : Unit) -> Unit raise {
    let _ = x3
    {
      v.val = (v.val).prepend("int")
      ()
    }
    @preterm.overload_interface("+", @term_syntax.parse_term("(op_plus : (Int, Int) -> Int)"))
    @preterm.overload_interface("-", @term_syntax.parse_term("(op_minus : (Int, Int) -> Int)"))
    @preterm.overload_interface("*", @term_syntax.parse_term("(op_star : (Int, Int) -> Int)"))
    @preterm.overload_interface("<", @term_syntax.parse_term("(op_lt : (Int, Int) -> Bool)"))
    @preterm.overload_interface("<=", @term_syntax.parse_term("(op_lt_eq : (Int, Int) -> Bool)"))
    @preterm.overload_interface(">", @term_syntax.parse_term("(op_gt : (Int, Int) -> Bool)"))
    @preterm.overload_interface(">=", @term_syntax.parse_term("(op_gt_eq : (Int, Int) -> Bool)"))
    @preterm.overload_interface("--", @term_syntax.parse_term("(op_minus_minus : (Int) -> Int)"))
    @preterm.overload_interface("pow", @term_syntax.parse_term("(pow : (Int, Num) -> Int)"))
    @preterm.overload_interface("abs", @term_syntax.parse_term("(abs : (Int) -> Int)"))
    @preterm.override_interface("&", @term_syntax.parse_term("int_of_num"))
  }
  let prioritize_num : (Unit) -> Unit raise = fn(x4 : Unit) -> Unit raise {
    let _ = x4
    {
      v.val = (v.val).prepend("num")
      ()
    }
    @preterm.overload_interface("+", @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)"))
    @preterm.overload_interface("-", @term_syntax.parse_term("(op_minus : (Num, Num) -> Num)"))
    @preterm.overload_interface("*", @term_syntax.parse_term("(op_star : (Num, Num) -> Num)"))
    @preterm.overload_interface("<", @term_syntax.parse_term("(op_lt : (Num, Num) -> Bool)"))
    @preterm.overload_interface("<=", @term_syntax.parse_term("(op_lt_eq : (Num, Num) -> Bool)"))
    @preterm.overload_interface(">", @term_syntax.parse_term("(op_gt : (Num, Num) -> Bool)"))
    @preterm.overload_interface(">=", @term_syntax.parse_term("(op_gt_eq : (Num, Num) -> Bool)"))
  }
  let prioritize_real : (Unit) -> Unit raise = fn(x5 : Unit) -> Unit raise {
    let _ = x5
    {
      v.val = (v.val).prepend("real")
      ()
    }
    @preterm.overload_interface("+", @term_syntax.parse_term("real_add"))
    @preterm.overload_interface("-", @term_syntax.parse_term("real_sub"))
    @preterm.overload_interface("*", @term_syntax.parse_term("real_mul"))
    @preterm.overload_interface("/", @term_syntax.parse_term("op_slash"))
    @preterm.overload_interface("<", @term_syntax.parse_term("real_lt"))
    @preterm.overload_interface("<=", @term_syntax.parse_term("real_le"))
    @preterm.overload_interface(">", @term_syntax.parse_term("real_gt"))
    @preterm.overload_interface(">=", @term_syntax.parse_term("real_ge"))
    @preterm.overload_interface("--", @term_syntax.parse_term("real_neg"))
    @preterm.overload_interface("pow", @term_syntax.parse_term("real_pow"))
    @preterm.overload_interface("inv", @term_syntax.parse_term("inv"))
    @preterm.overload_interface("abs", @term_syntax.parse_term("real_abs"))
    @preterm.override_interface("&", @term_syntax.parse_term("real_of_num"))
  }
  let pop_priority : (Unit) -> Unit raise = fn(x6 : Unit) -> Unit raise {
    let _ = x6
    if (Int::to_int64(@lib.length(v.val)) <= 1L) {
      @pp.std_formatter.print_string("priority unchanged\n")
    } else {
      match v.val {
        More(a, tail=More(b, tail=c)) => {
          {
            v.val = c.prepend(b)
            ()
          }
          @pp.std_formatter.print_string(("priority is now " + (b + "\n")))
          match a {
            "num" => @realax.prioritize_num(())
            "int" => @int.prioritize_int(())
            "real" => @realax.prioritize_real(())
            _ => ()
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:187")
      }
    }
  }
  let get_priority : (Unit) -> String raise = fn(x7 : Unit) -> String raise {
    let _ = x7
    if @list.List::is_empty(v.val) {
      "unknown"
    } else {
      match v.val {
        More(a_1, tail=b_1) => a_1
        _ => raise @lib.MatchFailure("tscript.ml:197")
      }
    }
  }
  let (prioritize_int_1, prioritize_num_1, prioritize_real_1, pop_priority_1, get_priority_1) = (prioritize_int, prioritize_num, prioritize_real, pop_priority, get_priority)
  prioritize_int_c.set(prioritize_int_1)
  prioritize_num_c.set(prioritize_num_1)
  prioritize_real_c.set(prioritize_real_1)
  pop_priority_c.set(pop_priority_1)
  get_priority_c.set(get_priority_1)
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
