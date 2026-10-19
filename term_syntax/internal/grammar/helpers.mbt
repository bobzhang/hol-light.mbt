// The preterms the grammar's actions build. Names are HOL's interface
// names, so overloading (`+` on num, int and real, ...) is resolved by the
// usual elaboration (@preterm.retypecheck).

///|
/// An identifier the term spells.
fn pvar(name : String) -> @preterm.Preterm {
  @preterm.Varp(name, @preterm.dpty)
}

///|
/// The prefix of a constant the syntax itself stands for (`true`, `&&`,
/// `if`, ...): no binder captures it, and the name resolution
/// (@term_syntax.parse_preterm) removes it.
pub let generated_mark : String = "\u{1}"

///|
fn pconst(name : String) -> @preterm.Preterm {
  @preterm.Varp(generated_mark + name, @preterm.dpty)
}

///|
let semantic_error : Ref[String?] = Ref::{ val: None }

///|
/// Record that the input has no meaning; the parse reports the first one.
fn reject(msg : String) -> Unit {
  if semantic_error.val is None {
    semantic_error.val = Some(msg)
  }
}

///|
/// The first error recorded since the last call, if any.
pub fn take_error() -> String? {
  let e = semantic_error.val
  semantic_error.val = None
  e
}

///|
fn apply(f : @preterm.Preterm, x : @preterm.Preterm) -> @preterm.Preterm {
  @preterm.Combp(f, x)
}

///|
fn applies(
  f : @preterm.Preterm,
  args : @list.List[@preterm.Preterm],
) -> @preterm.Preterm {
  args.fold(init=f, apply)
}

///|
fn binary(
  op : String,
  lhs : @preterm.Preterm,
  rhs : @preterm.Preterm,
) -> @preterm.Preterm {
  apply(apply(pconst(op), lhs), rhs)
}

///|
fn comparison(
  op : String,
  lhs : @preterm.Preterm,
  rhs : @preterm.Preterm,
) -> @preterm.Preterm {
  match op {
    "==" => binary("=", lhs, rhs)
    "!=" => apply(pconst("~"), binary("=", lhs, rhs))
    _ => binary(op, lhs, rhs)
  }
}

///|
fn infix3(
  op : String,
  lhs : @preterm.Preterm,
  rhs : @preterm.Preterm,
) -> @preterm.Preterm {
  match op {
    "/" => binary("/", lhs, rhs)
    _ => {
      reject("operator " + op + " has no HOL meaning")
      lhs
    }
  }
}

///|
fn typed(tm : @preterm.Preterm, ty : @preterm.Pretype) -> @preterm.Preterm {
  if ty == @preterm.dpty {
    tm
  } else {
    @preterm.Typing(tm, ty)
  }
}

///|
fn quantify(
  q : String,
  name : String,
  ty : @preterm.Pretype,
  body : @preterm.Preterm,
) -> @preterm.Preterm {
  apply(pconst(q), @preterm.Absp(typed(pvar(name), ty), body))
}

///|
fn lambdas(
  params : @list.List[(String, @preterm.Pretype?)],
  body : @preterm.Preterm,
) -> @preterm.Preterm {
  params
  .rev()
  .fold(init=body, (b, p) => {
    let v = match p.1 {
      Some(ty) => typed(pvar(p.0), ty)
      None => pvar(p.0)
    }
    @preterm.Absp(v, b)
  })
}

///|
fn cond(
  c : @preterm.Preterm,
  a : @preterm.Preterm,
  b : @preterm.Preterm,
) -> @preterm.Preterm {
  applies(pconst("COND"), @list.List([c, a, b]))
}

///|
fn tuple(es : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  let es = es.to_array()
  let mut t = es[es.length() - 1]
  for i = es.length() - 2; i >= 0; i = i - 1 {
    t = binary(",", es[i], t)
  }
  t
}

///|
fn list(es : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  es.rev().fold(init=pconst("NIL"), (t, e) => binary("CONS", e, t))
}

///|
/// A MoonBit type name as a HOL type: `Bool`, `Num`, `List[A]` name the HOL
/// types bool, num and list (a type constant whose name is capitalised is
/// written as it is); any other name is a type variable.
fn named_type(
  name : String,
  args : @list.List[@preterm.Pretype],
) -> @preterm.Pretype {
  // HOL's unit type is called 1
  if name == "Unit" && (try @kernel.get_type_arity("unit") catch { _ => -1L }) < 0L {
    return @preterm.Ptycon("1", check_arity("1", args))
  }
  let chars = name.to_array()
  let lower = chars[0].to_string().to_lower() +
    String::from_array(chars[1:])
  // `Num` is num; a type constant whose name is capitalised already is
  // written as it is
  let lower = if (try @kernel.get_type_arity(lower) catch { _ => -1L }) < 0L &&
    (try @kernel.get_type_arity(name) catch { _ => -1L }) >= 0L {
    name
  } else {
    lower
  }
  let arity = @kernel.get_type_arity(lower) catch { _ => -1L }
  if arity >= 0L {
    if arity != args.length().to_int64() {
      reject("type " + name + " takes \{arity} arguments")
    }
    @preterm.Ptycon(lower, args.map(fill_hole))
  } else if args.is_empty() {
    @preterm.Utv(name)
  } else {
    reject("unknown type " + name)
    @preterm.Utv(name)
  }
}

///|
fn check_arity(
  name : String,
  args : @list.List[@preterm.Pretype],
) -> @list.List[@preterm.Pretype] {
  if !args.is_empty() {
    abort("type " + name + " takes no arguments")
  }
  args
}

///|
/// `_` inside a type is a fresh type variable for elaboration to solve (one
/// it cannot solve becomes an invented `?n`, as in quotations).
fn fill_hole(ty : @preterm.Pretype) -> @preterm.Pretype {
  if ty == @preterm.dpty {
    @preterm.new_type_var()
  } else {
    ty
  }
}

///|
fn tuple_type(tys : @list.List[@preterm.Pretype]) -> @preterm.Pretype {
  let tys = tys.to_array().map(fill_hole)
  let mut t = tys[tys.length() - 1]
  for i = tys.length() - 2; i >= 0; i = i - 1 {
    t = @preterm.Ptycon("prod", @list.List([tys[i], t]))
  }
  t
}

///|
fn fun_type(
  args : @list.List[@preterm.Pretype],
  res : @preterm.Pretype,
) -> @preterm.Pretype {
  args
  .rev()
  .fold(init=fill_hole(res), (t, a) => {
    @preterm.Ptycon("fun", @list.List([fill_hole(a), t]))
  })
}
