///|
pub(all) enum Token {
  LIDENT(String)
  UIDENT(String)
  INT(String)
  INFIX1(String)
  INFIX3(String)
  DOT_LIDENT(String)
  TRUE
  FALSE
  IF
  ELSE
  FORALL
  EXISTS
  IMPLIES
  BARBAR
  AMPERAMPER
  PLUS
  MINUS
  STAR
  EXCLAMATION
  LPAREN
  RPAREN
  LBRACKET
  RBRACKET
  LBRACE
  RBRACE
  COMMA
  COLON
  FAT_ARROW
  THIN_ARROW
  UNDERSCORE
  EOF
} derive(Debug)

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend Token with Debug::{to_repr}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    LIDENT(_) => TK_LIDENT
    UIDENT(_) => TK_UIDENT
    INT(_) => TK_INT
    INFIX1(_) => TK_INFIX1
    INFIX3(_) => TK_INFIX3
    DOT_LIDENT(_) => TK_DOT_LIDENT
    TRUE => TK_TRUE
    FALSE => TK_FALSE
    IF => TK_IF
    ELSE => TK_ELSE
    FORALL => TK_FORALL
    EXISTS => TK_EXISTS
    IMPLIES => TK_IMPLIES
    BARBAR => TK_BARBAR
    AMPERAMPER => TK_AMPERAMPER
    PLUS => TK_PLUS
    MINUS => TK_MINUS
    STAR => TK_STAR
    EXCLAMATION => TK_EXCLAMATION
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
    LBRACKET => TK_LBRACKET
    RBRACKET => TK_RBRACKET
    LBRACE => TK_LBRACE
    RBRACE => TK_RBRACE
    COMMA => TK_COMMA
    COLON => TK_COLON
    FAT_ARROW => TK_FAT_ARROW
    THIN_ARROW => TK_THIN_ARROW
    UNDERSCORE => TK_UNDERSCORE
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_LIDENT
  TK_UIDENT
  TK_INT
  TK_INFIX1
  TK_INFIX3
  TK_DOT_LIDENT
  TK_TRUE
  TK_FALSE
  TK_IF
  TK_ELSE
  TK_FORALL
  TK_EXISTS
  TK_IMPLIES
  TK_BARBAR
  TK_AMPERAMPER
  TK_PLUS
  TK_MINUS
  TK_STAR
  TK_EXCLAMATION
  TK_LPAREN
  TK_RPAREN
  TK_LBRACKET
  TK_RBRACKET
  TK_LBRACE
  TK_RBRACE
  TK_COMMA
  TK_COLON
  TK_FAT_ARROW
  TK_THIN_ARROW
  TK_UNDERSCORE
  TK_EOF
}

///|
#deprecated("Use Show::output or Show::to_string instead")
#doc(hidden)
pub extend TokenKind with Show::{output, to_string}

///|
pub impl Show for TokenKind with fn output(self, logger) {
  Logger::write_string(
    logger,
    match self {
      TK_LIDENT => "LIDENT"
      TK_UIDENT => "UIDENT"
      TK_INT => "INT"
      TK_INFIX1 => "INFIX1"
      TK_INFIX3 => "INFIX3"
      TK_DOT_LIDENT => "DOT_LIDENT"
      TK_TRUE => "\"true\""
      TK_FALSE => "\"false\""
      TK_IF => "\"if\""
      TK_ELSE => "\"else\""
      TK_FORALL => "\"∀\""
      TK_EXISTS => "\"∃\""
      TK_IMPLIES => "\"→\""
      TK_BARBAR => "\"||\""
      TK_AMPERAMPER => "\"&&\""
      TK_PLUS => "\"+\""
      TK_MINUS => "\"-\""
      TK_STAR => "\"*\""
      TK_EXCLAMATION => "\"!\""
      TK_LPAREN => "\"(\""
      TK_RPAREN => "\")\""
      TK_LBRACKET => "\"[\""
      TK_RBRACKET => "\"]\""
      TK_LBRACE => "\"{\""
      TK_RBRACE => "\"}\""
      TK_COMMA => "\",\""
      TK_COLON => "\":\""
      TK_FAT_ARROW => "\"=>\""
      TK_THIN_ARROW => "\"->\""
      TK_UNDERSCORE => "\"_\""
      TK_EOF => "EOF"
    }
  )
}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend TokenKind with Debug::{to_repr}

///|
pub impl Debug for TokenKind with fn to_repr(self) {
  match self {
    TK_LIDENT => Repr("LIDENT")
    TK_UIDENT => Repr("UIDENT")
    TK_INT => Repr("INT")
    TK_INFIX1 => Repr("INFIX1")
    TK_INFIX3 => Repr("INFIX3")
    TK_DOT_LIDENT => Repr("DOT_LIDENT")
    TK_TRUE => Repr("true")
    TK_FALSE => Repr("false")
    TK_IF => Repr("if")
    TK_ELSE => Repr("else")
    TK_FORALL => Repr("∀")
    TK_EXISTS => Repr("∃")
    TK_IMPLIES => Repr("→")
    TK_BARBAR => Repr("||")
    TK_AMPERAMPER => Repr("&&")
    TK_PLUS => Repr("+")
    TK_MINUS => Repr("-")
    TK_STAR => Repr("*")
    TK_EXCLAMATION => Repr("!")
    TK_LPAREN => Repr("(")
    TK_RPAREN => Repr(")")
    TK_LBRACKET => Repr("[")
    TK_RBRACKET => Repr("]")
    TK_LBRACE => Repr("{")
    TK_RBRACE => Repr("}")
    TK_COMMA => Repr(",")
    TK_COLON => Repr(":")
    TK_FAT_ARROW => Repr("=>")
    TK_THIN_ARROW => Repr("->")
    TK_UNDERSCORE => Repr("_")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
} derive(Debug)

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend ParseError with Debug::{to_repr}

///|
type YYObj = Error

///|
priv suberror YYObj_Void

///|
priv suberror YYObj_Option_Unit_ {
  YYObj_Option_Unit_(Option[Unit])
}

///|
priv suberror YYObj_String {
  YYObj_String(String)
}

///|
priv suberror YYObj__list_List_String_ {
  YYObj__list_List_String_(@list.List[String])
}

///|
priv suberror YYObj__list_List__preterm_Preterm_ {
  YYObj__list_List__preterm_Preterm_(@list.List[@preterm.Preterm])
}

///|
priv suberror YYObj__list_List__preterm_Pretype_ {
  YYObj__list_List__preterm_Pretype_(@list.List[@preterm.Pretype])
}

///|
priv suberror YYObj__list_List__String___preterm_Pretype___ {
  YYObj__list_List__String___preterm_Pretype___(
    @list.List[(String, @preterm.Pretype?)]
  )
}

///|
priv suberror YYObj__preterm_Preterm {
  YYObj__preterm_Preterm(@preterm.Preterm)
}

///|
priv suberror YYObj__preterm_Pretype {
  YYObj__preterm_Pretype(@preterm.Pretype)
}

///|
type YYState = ((YYSymbol) -> YYDecision)

///|
type YYAction = ((Int, ArrayView[(YYObj, Int, Int)]) -> YYObj)

///|
priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

///|
priv enum YYSymbol {
  T_LIDENT
  T_UIDENT
  T_INT
  T_INFIX1
  T_INFIX3
  T_DOT_LIDENT
  T_TRUE
  T_FALSE
  T_IF
  T_ELSE
  T_FORALL
  T_EXISTS
  T_IMPLIES
  T_BARBAR
  T_AMPERAMPER
  T_PLUS
  T_MINUS
  T_STAR
  T_EXCLAMATION
  T_LPAREN
  T_RPAREN
  T_LBRACKET
  T_RBRACKET
  T_LBRACE
  T_RBRACE
  T_COMMA
  T_COLON
  T_FAT_ARROW
  T_THIN_ARROW
  T_UNDERSCORE
  T_EOF
  NT_term
  NT_pretype
  NT_expr
  NT_block_expr
  NT_if_expr
  NT_quantifier_expr
  NT_quantifier_body_expr
  NT_arrow_fn_expr
  NT_arrow_fn_prefix
  NT_arrow_fn_prefix_no_constraint
  NT_infix_expr
  NT_prefix_expr
  NT_tuple_expr
  NT_non_empty_tuple_elems
  NT_non_empty_tuple_elems_with_prefix
  NT_simple_expr
  NT_atomic_expr
  NT_simple_type
  NT_optional_type_arguments
  NT_type_
  NT_list_commas_expr_
  NT_non_empty_list_commas_expr_
  NT_non_empty_list_commas_type__
  NT_non_empty_list_commas_rev_expr_
  NT_option_COMMA_
  NT_non_empty_list_commas_rev_type__
  EOI
}

///|
// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

///|
// file:///./grammar.mbty
// 60|    expr EOF { $1 }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 150|    "[" list_commas(expr) "]" { list($2) }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Preterm_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  list(_dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 172|    non_empty_list_commas_rev(X) option(",") { $1.rev() }
fn yy_action_2(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1.rev() 
    })
  )
}

///|
// file:///./grammar.mbty
// 151|    simple_expr "(" non_empty_list_commas(expr) ")" { applies($1, $3) }
fn yy_action_3(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  YYObj__preterm_Preterm(
    ({();  applies(_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 124|    "!" prefix_expr { apply(pvar("~"), $2) }
fn yy_action_4(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  YYObj__preterm_Preterm(
    ({();  apply(pvar("~"), _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 132|    "(" expr ":" type_ ")" { typed($2, $4) }
fn yy_action_5(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(_dollar2, _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 94|    "(" arrow_fn_prefix "=>" expr { lambdas($2, $4) }
fn yy_action_6(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__String___preterm_Pretype___(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Preterm(_dollar4)
  YYObj__preterm_Preterm(
    ({();  lambdas(_dollar2, _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 131|    "(" binder ":" type_ ")" { typed(pvar($2), $4) }
fn yy_action_8(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(pvar(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 106|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_10(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_9(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 68|    if_expr { $1 }
fn yy_action_11(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 69|    quantifier_expr { $1 }
fn yy_action_12(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 70|    arrow_fn_expr { $1 }
fn yy_action_13(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 71|    infix_expr { $1 }
fn yy_action_14(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 75|    "{" expr "}" { $2 }
fn yy_action_15(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  YYObj__preterm_Preterm(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./grammar.mbty
// 79|    "if" infix_expr block_expr "else" block_expr { cond($2, $3, $5) }
fn yy_action_16(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  guard! _args[4].0 is YYObj__preterm_Preterm(_dollar5)
  YYObj__preterm_Preterm(
    ({();  cond(_dollar2, _dollar3, _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 80|    "if" infix_expr block_expr "else" if_expr { cond($2, $3, $5) }
fn yy_action_17(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  guard! _args[4].0 is YYObj__preterm_Preterm(_dollar5)
  YYObj__preterm_Preterm(
    ({();  cond(_dollar2, _dollar3, _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 85|    "∃" binder ":" type_ "," quantifier_body_expr { quantify("?", $2, $4, $6) }
fn yy_action_18(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 84|    "∀" binder ":" type_ "," quantifier_body_expr { quantify("forall", $2, $4, $6) }
fn yy_action_19(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 84|    "∀" binder ":" type_ "," quantifier_body_expr { quantify("forall", $2, $4, $6) }
fn yy_action_21(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 85|    "∃" binder ":" type_ "," quantifier_body_expr { quantify("?", $2, $4, $6) }
fn yy_action_22(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 89|    quantifier_expr { $1 }
fn yy_action_23(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 111|    infix_expr "→" infix_expr { binary("==>", $1, $3) }
fn yy_action_24(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("==>", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 112|    infix_expr "||" infix_expr { binary("\\/", $1, $3) }
fn yy_action_25(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("\\/", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 113|    infix_expr "&&" infix_expr { binary("/\\", $1, $3) }
fn yy_action_26(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("/\\", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 114|    infix_expr INFIX1 infix_expr { comparison($2, $1, $3) }
fn yy_action_27(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  comparison(_dollar2, _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 115|    infix_expr "+" infix_expr { binary("+", $1, $3) }
fn yy_action_28(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("+", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 116|    infix_expr "-" infix_expr { binary("-", $1, $3) }
fn yy_action_29(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("-", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 117|    infix_expr "*" infix_expr { binary("*", $1, $3) }
fn yy_action_30(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("*", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 118|    infix_expr INFIX3 infix_expr { infix3($2, $1, $3) }
fn yy_action_31(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  infix3(_dollar2, _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 90|    infix_expr { $1 }
fn yy_action_32(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 106|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_34(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_33(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 107|    binder "," arrow_fn_prefix_no_constraint { $3.prepend($1) }
fn yy_action_35(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List_String_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 141|    binder "," non_empty_tuple_elems_with_prefix { $3.prepend(pvar($1)) }
fn yy_action_36(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(pvar(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 106|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_37(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_9(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 106|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_38(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_33(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 107|    binder "," arrow_fn_prefix_no_constraint { $3.prepend($1) }
fn yy_action_39(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List_String_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 141|    binder "," non_empty_tuple_elems_with_prefix { $3.prepend(pvar($1)) }
fn yy_action_40(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(pvar(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 131|    "(" binder ":" type_ ")" { typed(pvar($2), $4) }
fn yy_action_41(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(pvar(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 99|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_42(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_9(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 99|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_43(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_9(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 99|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_44(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_33(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 101|    binder "," arrow_fn_prefix { $3.prepend(($1, None)) }
fn yy_action_45(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype___(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar3.prepend((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 100|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_46(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_9(_args[2].2, _args[3:3])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 100|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_47(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_33(_args[2].2, _args[3:4])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 102|    binder ":" type_ "," arrow_fn_prefix { $5.prepend(($1, Some($3))) }
fn yy_action_48(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  guard! _args[4].0 is YYObj__list_List__String___preterm_Pretype___(_dollar5)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar5.prepend((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 99|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_49(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_33(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 101|    binder "," arrow_fn_prefix { $3.prepend(($1, None)) }
fn yy_action_50(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype___(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar3.prepend((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 100|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_51(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_9(_args[2].2, _args[3:3])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 100|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_52(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_33(_args[2].2, _args[3:4])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 102|    binder ":" type_ "," arrow_fn_prefix { $5.prepend(($1, Some($3))) }
fn yy_action_53(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard! _args[4].0 is YYObj__list_List__String___preterm_Pretype___(_dollar5)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar5.prepend((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 129|    "(" arrow_fn_prefix_no_constraint { tuple($2.map(pvar)) }
fn yy_action_54(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List_String_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  tuple(_dollar2.map(pvar)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 130|    "(" non_empty_tuple_elems_with_prefix { tuple($2) }
fn yy_action_55(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Preterm_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  tuple(_dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 95|    binder "=>" expr { lambdas(@list.singleton(($1, None)), $3) }
fn yy_action_56(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_7(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  lambdas(@list.singleton((_dollar1, None)), _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 162|    LIDENT { $1 }
fn yy_action_7(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 95|    binder "=>" expr { lambdas(@list.singleton(($1, None)), $3) }
fn yy_action_57(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  lambdas(@list.singleton((_dollar1, None)), _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 163|    UIDENT { $1 }
fn yy_action_20(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 119|    prefix_expr { $1 }
fn yy_action_58(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 123|    "-" prefix_expr { apply(pvar("--"), $2) }
fn yy_action_59(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  YYObj__preterm_Preterm(
    ({();  apply(pvar("--"), _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 136|    expr ioption(",") ")" { @list.singleton($1) }
fn yy_action_60(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_9(_args[0].2, _args[1:1])
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 9|    { None }
fn yy_action_9(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Option_Unit_(
    ({();  None 
    })
  )
}

///|
// file:///./grammar.mbty
// 136|    expr ioption(",") ")" { @list.singleton($1) }
fn yy_action_61(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_33(_args[0].2, _args[1:2])
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 10|    X { Some($1) }
fn yy_action_33(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _dollar1 = ()
  YYObj_Option_Unit_(
    ({();  Some(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 137|    expr "," non_empty_tuple_elems { $3.prepend($1) }
fn yy_action_62(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 142|    non_empty_tuple_elems { $1 }
fn yy_action_63(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 147|    UIDENT %prec prec_apply_non_ident_fn { pvar($1) }
fn yy_action_64(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 148|    LIDENT %prec prec_apply_non_ident_fn { pvar($1) }
fn yy_action_65(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 152|    simple_expr DOT_LIDENT "(" list_commas(expr) ")" { applies(pvar($2), $4.prepend($1)) }
fn yy_action_66(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__list_List__preterm_Preterm_(_dollar4)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  applies(pvar(_dollar2), _dollar4.prepend(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 177|    non_empty_list_commas(X) { $1 }
fn yy_action_67(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 125|    simple_expr { $1 }
fn yy_action_68(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 146|    atomic_expr { $1 }
fn yy_action_69(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 149|    tuple_expr { $1 }
fn yy_action_70(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    non_empty_list_commas_rev(X) "," X { $1.prepend($3) }
fn yy_action_71(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1.prepend(_dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    X { @list.singleton($1) }
fn yy_action_72(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 176|    { @list.List([]) }
fn yy_action_73(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.List([]) 
    })
  )
}

///|
// file:///./grammar.mbty
// 156|    "true" { pvar("T") }
fn yy_action_74(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Preterm(
    ({();  pvar("T") 
    })
  )
}

///|
// file:///./grammar.mbty
// 157|    "false" { pvar("F") }
fn yy_action_75(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Preterm(
    ({();  pvar("F") 
    })
  )
}

///|
// file:///./grammar.mbty
// 158|    INT { pvar($1) }
fn yy_action_76(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 64|    type_ EOF { $1 }
fn yy_action_77(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Pretype(_dollar1)
  YYObj__preterm_Pretype(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 183|    UIDENT optional_type_arguments { named_type($1, $2) }
fn yy_action_78(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  guard! _args[1].0 is YYObj__list_List__preterm_Pretype_(_dollar2)
  YYObj__preterm_Pretype(
    ({();  named_type(_dollar1, _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 188|    "[" non_empty_list_commas(type_) "]" { $2 }
fn yy_action_79(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Pretype_(_dollar2)
  YYObj__list_List__preterm_Pretype_(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./grammar.mbty
// 172|    non_empty_list_commas_rev(X) option(",") { $1.rev() }
fn yy_action_80(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Pretype_(_dollar1)
  YYObj__list_List__preterm_Pretype_(
    ({();  _dollar1.rev() 
    })
  )
}

///|
// file:///./grammar.mbty
// 194|    "(" type_ "," non_empty_list_commas(type_) ")" "->" type_ { fun_type($4.prepend($2), $7) }
fn yy_action_81(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[3].0 is YYObj__list_List__preterm_Pretype_(_dollar4)
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  guard! _args[6].0 is YYObj__preterm_Pretype(_dollar7)
  YYObj__preterm_Pretype(
    ({();  fun_type(_dollar4.prepend(_dollar2), _dollar7) 
    })
  )
}

///|
// file:///./grammar.mbty
// 181|    "(" type_ "," non_empty_list_commas(type_) ")" { tuple_type($4.prepend($2)) }
fn yy_action_82(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[3].0 is YYObj__list_List__preterm_Pretype_(_dollar4)
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  YYObj__preterm_Pretype(
    ({();  tuple_type(_dollar4.prepend(_dollar2)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 195|    "(" type_ ")" "->" type_ { fun_type(@list.singleton($2), $5) }
fn yy_action_83(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  guard! _args[4].0 is YYObj__preterm_Pretype(_dollar5)
  YYObj__preterm_Pretype(
    ({();  fun_type(@list.singleton(_dollar2), _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 182|    "(" type_ ")" { $2 }
fn yy_action_84(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  YYObj__preterm_Pretype(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    non_empty_list_commas_rev(X) "," X { $1.prepend($3) }
fn yy_action_85(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Pretype_(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__preterm_Pretype_(
    ({();  _dollar1.prepend(_dollar3) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 5|    X { Some($1) }
fn yy_action_86(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _dollar1 = ()
  YYObj_Option_Unit_(
    ({();  Some(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 4|    { None }
fn yy_action_87(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Option_Unit_(
    ({();  None 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    X { @list.singleton($1) }
fn yy_action_88(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Pretype(_dollar1)
  YYObj__list_List__preterm_Pretype_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 189|    { @list.List([]) }
fn yy_action_89(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__list_List__preterm_Pretype_(
    ({();  @list.List([]) 
    })
  )
}

///|
// file:///./grammar.mbty
// 184|    "_" { @preterm.dpty }
fn yy_action_90(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Pretype(
    ({();  @preterm.dpty 
    })
  )
}

///|
// file:///./grammar.mbty
// 193|    simple_type { $1 }
fn yy_action_91(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Pretype(_dollar1)
  YYObj__preterm_Pretype(
    ({();  _dollar1 
    })
  )
}

///|
fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (
  YYSymbol, YYObj
) {
  match token {
    LIDENT(data) => (T_LIDENT, YYObj_String(data))
    UIDENT(data) => (T_UIDENT, YYObj_String(data))
    INT(data) => (T_INT, YYObj_String(data))
    INFIX1(data) => (T_INFIX1, YYObj_String(data))
    INFIX3(data) => (T_INFIX3, YYObj_String(data))
    DOT_LIDENT(data) => (T_DOT_LIDENT, YYObj_String(data))
    TRUE => (T_TRUE, YYObj_Void)
    FALSE => (T_FALSE, YYObj_Void)
    IF => (T_IF, YYObj_Void)
    ELSE => (T_ELSE, YYObj_Void)
    FORALL => (T_FORALL, YYObj_Void)
    EXISTS => (T_EXISTS, YYObj_Void)
    IMPLIES => (T_IMPLIES, YYObj_Void)
    BARBAR => (T_BARBAR, YYObj_Void)
    AMPERAMPER => (T_AMPERAMPER, YYObj_Void)
    PLUS => (T_PLUS, YYObj_Void)
    MINUS => (T_MINUS, YYObj_Void)
    STAR => (T_STAR, YYObj_Void)
    EXCLAMATION => (T_EXCLAMATION, YYObj_Void)
    LPAREN => (T_LPAREN, YYObj_Void)
    RPAREN => (T_RPAREN, YYObj_Void)
    LBRACKET => (T_LBRACKET, YYObj_Void)
    RBRACKET => (T_RBRACKET, YYObj_Void)
    LBRACE => (T_LBRACE, YYObj_Void)
    RBRACE => (T_RBRACE, YYObj_Void)
    COMMA => (T_COMMA, YYObj_Void)
    COLON => (T_COLON, YYObj_Void)
    FAT_ARROW => (T_FAT_ARROW, YYObj_Void)
    THIN_ARROW => (T_THIN_ARROW, YYObj_Void)
    UNDERSCORE => (T_UNDERSCORE, YYObj_Void)
    EOF => (T_EOF, YYObj_Void)
  }
}

///|
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_pretype => Shift(yy_state_1)
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_24)
    _ => Error
  }
}

///|
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_type_, yy_action_91)
}

///|
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_type, yy_action_90)
}

///|
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_5)
    NT_optional_type_arguments => Shift(yy_state_23)
    T_RPAREN | T_RBRACKET | T_COMMA | T_EOF =>
      Reduce(0, NT_optional_type_arguments, yy_action_89)
    _ => Error
  }
}

///|
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    NT_type_ => Shift(yy_state_6)
    NT_non_empty_list_commas_rev_type__ => Shift(yy_state_7)
    T_LPAREN => Shift(yy_state_10)
    NT_non_empty_list_commas_type__ => Shift(yy_state_21)
    _ => Error
  }
}

///|
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_list_commas_rev_type__, yy_action_88)
}

///|
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_8)
    NT_option_COMMA_ => Shift(yy_state_20)
    T_RPAREN | T_RBRACKET => Reduce(0, NT_option_COMMA_, yy_action_87)
    _ => Error
  }
}

///|
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    NT_type_ => Shift(yy_state_9)
    T_LPAREN => Shift(yy_state_10)
    T_RPAREN | T_RBRACKET => Reduce(1, NT_option_COMMA_, yy_action_86)
    _ => Error
  }
}

///|
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_list_commas_rev_type__, yy_action_85)
}

///|
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_11)
    _ => Error
  }
}

///|
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_12)
    T_COMMA => Shift(yy_state_15)
    _ => Error
  }
}

///|
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_THIN_ARROW => Shift(yy_state_13)
    T_RPAREN | T_RBRACKET | T_COMMA | T_EOF =>
      Reduce(3, NT_simple_type, yy_action_84)
    _ => Error
  }
}

///|
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_14)
    _ => Error
  }
}

///|
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_type_, yy_action_83)
}

///|
fn yy_state_15(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    NT_type_ => Shift(yy_state_6)
    NT_non_empty_list_commas_rev_type__ => Shift(yy_state_7)
    T_LPAREN => Shift(yy_state_10)
    NT_non_empty_list_commas_type__ => Shift(yy_state_16)
    _ => Error
  }
}

///|
fn yy_state_16(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_17)
    _ => Error
  }
}

///|
fn yy_state_17(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_THIN_ARROW => Shift(yy_state_18)
    T_RPAREN | T_RBRACKET | T_COMMA | T_EOF =>
      Reduce(5, NT_simple_type, yy_action_82)
    _ => Error
  }
}

///|
fn yy_state_18(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_19)
    _ => Error
  }
}

///|
fn yy_state_19(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(7, NT_type_, yy_action_81)
}

///|
fn yy_state_20(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_list_commas_type__, yy_action_80)
}

///|
fn yy_state_21(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_22)
    _ => Error
  }
}

///|
fn yy_state_22(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_optional_type_arguments, yy_action_79)
}

///|
fn yy_state_23(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_simple_type, yy_action_78)
}

///|
fn yy_state_24(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_25)
    _ => Error
  }
}

///|
fn yy_state_25(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_pretype, yy_action_77)
}

///|
fn yy_state_26(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_term => Shift(yy_state_27)
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    NT_expr => Shift(yy_state_191)
    _ => Error
  }
}

///|
fn yy_state_27(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
fn yy_state_28(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atomic_expr, yy_action_76)
}

///|
fn yy_state_29(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atomic_expr, yy_action_75)
}

///|
fn yy_state_30(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atomic_expr, yy_action_74)
}

///|
fn yy_state_31(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_expr => Shift(yy_state_32)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_33)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_41)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    NT_list_commas_expr_ => Shift(yy_state_189)
    T_RBRACKET => Reduce(0, NT_list_commas_expr_, yy_action_73)
    _ => Error
  }
}

///|
fn yy_state_32(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_list_commas_rev_expr_, yy_action_72)
}

///|
fn yy_state_33(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_34)
    NT_option_COMMA_ => Shift(yy_state_188)
    T_RPAREN | T_RBRACKET => Reduce(0, NT_option_COMMA_, yy_action_87)
    _ => Error
  }
}

///|
fn yy_state_34(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_expr => Shift(yy_state_35)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    T_RPAREN | T_RBRACKET => Reduce(1, NT_option_COMMA_, yy_action_86)
    _ => Error
  }
}

///|
fn yy_state_35(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_list_commas_rev_expr_, yy_action_71)
}

///|
fn yy_state_36(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_70)
}

///|
fn yy_state_37(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_69)
}

///|
fn yy_state_38(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_DOT_LIDENT => Shift(yy_state_39)
    T_LPAREN => Shift(yy_state_185)
    T_INFIX1 | T_INFIX3 | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(1, NT_prefix_expr, yy_action_68)
    _ => Error
  }
}

///|
fn yy_state_39(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_40)
    _ => Error
  }
}

///|
fn yy_state_40(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_expr => Shift(yy_state_32)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_33)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_41)
    NT_list_commas_expr_ => Shift(yy_state_42)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    T_RPAREN => Reduce(0, NT_list_commas_expr_, yy_action_73)
    _ => Error
  }
}

///|
fn yy_state_41(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_list_commas_expr_, yy_action_67)
}

///|
fn yy_state_42(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_43)
    _ => Error
  }
}

///|
fn yy_state_43(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_simple_expr, yy_action_66)
}

///|
fn yy_state_44(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_184)
    _ => Error
  }
}

///|
fn yy_state_45(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_65)
}

///|
fn yy_state_46(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_64)
}

///|
fn yy_state_47(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_48)
    NT_expr => Shift(yy_state_49)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_LPAREN => Shift(yy_state_64)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_65)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_66)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    T_UIDENT => Shift(yy_state_168)
    T_LIDENT => Shift(yy_state_180)
    _ => Error
  }
}

///|
fn yy_state_48(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_tuple_elems_with_prefix, yy_action_63)
}

///|
fn yy_state_49(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_50)
    T_RPAREN => Shift(yy_state_54)
    T_COLON => Shift(yy_state_165)
    _ => Error
  }
}

///|
fn yy_state_50(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_51)
    T_RPAREN => Shift(yy_state_52)
    NT_expr => Shift(yy_state_53)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    _ => Error
  }
}

///|
fn yy_state_51(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems, yy_action_62)
}

///|
fn yy_state_52(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems, yy_action_61)
}

///|
fn yy_state_53(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_50)
    T_RPAREN => Shift(yy_state_54)
    _ => Error
  }
}

///|
fn yy_state_54(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_tuple_elems, yy_action_60)
}

///|
fn yy_state_55(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_56)
    _ => Error
  }
}

///|
fn yy_state_56(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_prefix_expr, yy_action_59)
}

///|
fn yy_state_57(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_infix_expr, yy_action_58)
}

///|
fn yy_state_58(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_59)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(1, NT_simple_expr, yy_action_64)
    _ => Error
  }
}

///|
fn yy_state_59(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    NT_expr => Shift(yy_state_60)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    _ => Error
  }
}

///|
fn yy_state_60(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_expr, yy_action_57)
}

///|
fn yy_state_61(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_62)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(1, NT_simple_expr, yy_action_65)
    _ => Error
  }
}

///|
fn yy_state_62(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    NT_expr => Shift(yy_state_63)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    _ => Error
  }
}

///|
fn yy_state_63(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_expr, yy_action_56)
}

///|
fn yy_state_64(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_48)
    NT_expr => Shift(yy_state_49)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_LPAREN => Shift(yy_state_64)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_65)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_66)
    T_UIDENT => Shift(yy_state_67)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    T_LIDENT => Shift(yy_state_158)
    NT_arrow_fn_prefix => Shift(yy_state_162)
    _ => Error
  }
}

///|
fn yy_state_65(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_tuple_expr, yy_action_55)
}

///|
fn yy_state_66(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_tuple_expr, yy_action_54)
}

///|
fn yy_state_67(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_59)
    T_COLON => Shift(yy_state_68)
    T_COMMA => Shift(yy_state_93)
    T_RPAREN => Shift(yy_state_98)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_64)
    _ => Error
  }
}

///|
fn yy_state_68(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_69)
    _ => Error
  }
}

///|
fn yy_state_69(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_70)
    T_RPAREN => Shift(yy_state_92)
    _ => Error
  }
}

///|
fn yy_state_70(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_arrow_fn_prefix => Shift(yy_state_71)
    T_RPAREN => Shift(yy_state_72)
    T_UIDENT => Shift(yy_state_73)
    T_LIDENT => Shift(yy_state_80)
    _ => Error
  }
}

///|
fn yy_state_71(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_53)
}

///|
fn yy_state_72(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_52)
}

///|
fn yy_state_73(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_74)
    T_COMMA => Shift(yy_state_77)
    T_RPAREN => Shift(yy_state_91)
    _ => Error
  }
}

///|
fn yy_state_74(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_75)
    _ => Error
  }
}

///|
fn yy_state_75(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_70)
    T_RPAREN => Shift(yy_state_76)
    _ => Error
  }
}

///|
fn yy_state_76(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_prefix, yy_action_51)
}

///|
fn yy_state_77(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_UIDENT => Shift(yy_state_73)
    NT_arrow_fn_prefix => Shift(yy_state_78)
    T_RPAREN => Shift(yy_state_79)
    T_LIDENT => Shift(yy_state_80)
    _ => Error
  }
}

///|
fn yy_state_78(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_50)
}

///|
fn yy_state_79(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_49)
}

///|
fn yy_state_80(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_81)
    T_COMMA => Shift(yy_state_87)
    T_RPAREN => Shift(yy_state_90)
    _ => Error
  }
}

///|
fn yy_state_81(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_82)
    _ => Error
  }
}

///|
fn yy_state_82(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_83)
    T_RPAREN => Shift(yy_state_86)
    _ => Error
  }
}

///|
fn yy_state_83(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_UIDENT => Shift(yy_state_73)
    T_LIDENT => Shift(yy_state_80)
    NT_arrow_fn_prefix => Shift(yy_state_84)
    T_RPAREN => Shift(yy_state_85)
    _ => Error
  }
}

///|
fn yy_state_84(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_48)
}

///|
fn yy_state_85(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_47)
}

///|
fn yy_state_86(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_prefix, yy_action_46)
}

///|
fn yy_state_87(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_UIDENT => Shift(yy_state_73)
    T_LIDENT => Shift(yy_state_80)
    NT_arrow_fn_prefix => Shift(yy_state_88)
    T_RPAREN => Shift(yy_state_89)
    _ => Error
  }
}

///|
fn yy_state_88(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_45)
}

///|
fn yy_state_89(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_44)
}

///|
fn yy_state_90(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix, yy_action_43)
}

///|
fn yy_state_91(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix, yy_action_42)
}

///|
fn yy_state_92(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(4, NT_arrow_fn_prefix, yy_action_51)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(5, NT_tuple_expr, yy_action_41)
    _ => Error
  }
}

///|
fn yy_state_93(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_48)
    NT_expr => Shift(yy_state_53)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_LPAREN => Shift(yy_state_64)
    NT_arrow_fn_prefix => Shift(yy_state_78)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_94)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_95)
    T_RPAREN => Shift(yy_state_96)
    T_UIDENT => Shift(yy_state_97)
    T_LIDENT => Shift(yy_state_99)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    _ => Error
  }
}

///|
fn yy_state_94(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems_with_prefix, yy_action_40)
}

///|
fn yy_state_95(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_39)
}

///|
fn yy_state_96(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(3, NT_arrow_fn_prefix, yy_action_49)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_arrow_fn_prefix_no_constraint, yy_action_38)
    _ => Error
  }
}

///|
fn yy_state_97(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_59)
    T_COLON => Shift(yy_state_74)
    T_COMMA => Shift(yy_state_93)
    T_RPAREN => Shift(yy_state_98)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_64)
    _ => Error
  }
}

///|
fn yy_state_98(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(2, NT_arrow_fn_prefix, yy_action_42)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(2, NT_arrow_fn_prefix_no_constraint, yy_action_37)
    _ => Error
  }
}

///|
fn yy_state_99(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_62)
    T_COLON => Shift(yy_state_81)
    T_COMMA => Shift(yy_state_100)
    T_RPAREN => Shift(yy_state_157)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_65)
    _ => Error
  }
}

///|
fn yy_state_100(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_48)
    NT_expr => Shift(yy_state_53)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_LPAREN => Shift(yy_state_64)
    NT_arrow_fn_prefix => Shift(yy_state_88)
    T_UIDENT => Shift(yy_state_97)
    T_LIDENT => Shift(yy_state_99)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_101)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_102)
    T_RPAREN => Shift(yy_state_103)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    _ => Error
  }
}

///|
fn yy_state_101(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems_with_prefix, yy_action_36)
}

///|
fn yy_state_102(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_35)
}

///|
fn yy_state_103(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(3, NT_arrow_fn_prefix, yy_action_44)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_arrow_fn_prefix_no_constraint, yy_action_34)
    _ => Error
  }
}

///|
fn yy_state_104(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_UIDENT => Shift(yy_state_105)
    T_LIDENT => Shift(yy_state_139)
    _ => Error
  }
}

///|
fn yy_state_105(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_106)
    _ => Error
  }
}

///|
fn yy_state_106(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_107)
    _ => Error
  }
}

///|
fn yy_state_107(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_108)
    _ => Error
  }
}

///|
fn yy_state_108(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_EXISTS => Shift(yy_state_104)
    NT_infix_expr => Shift(yy_state_109)
    NT_quantifier_expr => Shift(yy_state_126)
    NT_quantifier_body_expr => Shift(yy_state_127)
    T_FORALL => Shift(yy_state_128)
    _ => Error
  }
}

///|
fn yy_state_109(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 => Shift(yy_state_118)
    T_AMPERAMPER => Shift(yy_state_120)
    T_BARBAR => Shift(yy_state_122)
    T_IMPLIES => Shift(yy_state_124)
    T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(1, NT_quantifier_body_expr, yy_action_32)
    _ => Error
  }
}

///|
fn yy_state_110(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_111)
    _ => Error
  }
}

///|
fn yy_state_111(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_infix_expr, yy_action_31)
}

///|
fn yy_state_112(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_113)
    _ => Error
  }
}

///|
fn yy_state_113(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_infix_expr, yy_action_30)
}

///|
fn yy_state_114(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_115)
    _ => Error
  }
}

///|
fn yy_state_115(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_INFIX1 | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_29)
    _ => Error
  }
}

///|
fn yy_state_116(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_117)
    _ => Error
  }
}

///|
fn yy_state_117(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_INFIX1 | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_28)
    _ => Error
  }
}

///|
fn yy_state_118(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_119)
    _ => Error
  }
}

///|
fn yy_state_119(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_27)
    _ => Error
  }
}

///|
fn yy_state_120(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_121)
    _ => Error
  }
}

///|
fn yy_state_121(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 => Shift(yy_state_118)
    T_AMPERAMPER => Shift(yy_state_120)
    T_IMPLIES | T_BARBAR | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_26)
    _ => Error
  }
}

///|
fn yy_state_122(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_123)
    _ => Error
  }
}

///|
fn yy_state_123(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 => Shift(yy_state_118)
    T_AMPERAMPER => Shift(yy_state_120)
    T_BARBAR => Shift(yy_state_122)
    T_IMPLIES | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_25)
    _ => Error
  }
}

///|
fn yy_state_124(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_125)
    _ => Error
  }
}

///|
fn yy_state_125(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 => Shift(yy_state_118)
    T_AMPERAMPER => Shift(yy_state_120)
    T_BARBAR => Shift(yy_state_122)
    T_IMPLIES => Shift(yy_state_124)
    T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_24)
    _ => Error
  }
}

///|
fn yy_state_126(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_quantifier_body_expr, yy_action_23)
}

///|
fn yy_state_127(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_22)
}

///|
fn yy_state_128(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_134)
    _ => Error
  }
}

///|
fn yy_state_129(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_130)
    _ => Error
  }
}

///|
fn yy_state_130(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_131)
    _ => Error
  }
}

///|
fn yy_state_131(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_132)
    _ => Error
  }
}

///|
fn yy_state_132(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_EXISTS => Shift(yy_state_104)
    NT_infix_expr => Shift(yy_state_109)
    NT_quantifier_expr => Shift(yy_state_126)
    T_FORALL => Shift(yy_state_128)
    NT_quantifier_body_expr => Shift(yy_state_133)
    _ => Error
  }
}

///|
fn yy_state_133(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_21)
}

///|
fn yy_state_134(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_135)
    _ => Error
  }
}

///|
fn yy_state_135(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_136)
    _ => Error
  }
}

///|
fn yy_state_136(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_137)
    _ => Error
  }
}

///|
fn yy_state_137(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_EXISTS => Shift(yy_state_104)
    NT_infix_expr => Shift(yy_state_109)
    NT_quantifier_expr => Shift(yy_state_126)
    T_FORALL => Shift(yy_state_128)
    NT_quantifier_body_expr => Shift(yy_state_138)
    _ => Error
  }
}

///|
fn yy_state_138(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_19)
}

///|
fn yy_state_139(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_140)
    _ => Error
  }
}

///|
fn yy_state_140(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_141)
    _ => Error
  }
}

///|
fn yy_state_141(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_142)
    _ => Error
  }
}

///|
fn yy_state_142(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_EXISTS => Shift(yy_state_104)
    NT_infix_expr => Shift(yy_state_109)
    NT_quantifier_expr => Shift(yy_state_126)
    T_FORALL => Shift(yy_state_128)
    NT_quantifier_body_expr => Shift(yy_state_143)
    _ => Error
  }
}

///|
fn yy_state_143(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_18)
}

///|
fn yy_state_144(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_LIDENT => Shift(yy_state_45)
    T_UIDENT => Shift(yy_state_46)
    T_LPAREN => Shift(yy_state_47)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    NT_infix_expr => Shift(yy_state_145)
    _ => Error
  }
}

///|
fn yy_state_145(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 => Shift(yy_state_118)
    T_AMPERAMPER => Shift(yy_state_120)
    T_BARBAR => Shift(yy_state_122)
    T_IMPLIES => Shift(yy_state_124)
    NT_block_expr => Shift(yy_state_146)
    T_LBRACE => Shift(yy_state_150)
    _ => Error
  }
}

///|
fn yy_state_146(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ELSE => Shift(yy_state_147)
    _ => Error
  }
}

///|
fn yy_state_147(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IF => Shift(yy_state_144)
    NT_if_expr => Shift(yy_state_148)
    NT_block_expr => Shift(yy_state_149)
    T_LBRACE => Shift(yy_state_150)
    _ => Error
  }
}

///|
fn yy_state_148(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_if_expr, yy_action_17)
}

///|
fn yy_state_149(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_if_expr, yy_action_16)
}

///|
fn yy_state_150(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_expr => Shift(yy_state_151)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    _ => Error
  }
}

///|
fn yy_state_151(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_152)
    _ => Error
  }
}

///|
fn yy_state_152(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_block_expr, yy_action_15)
}

///|
fn yy_state_153(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_110)
    T_STAR => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_114)
    T_PLUS => Shift(yy_state_116)
    T_INFIX1 => Shift(yy_state_118)
    T_AMPERAMPER => Shift(yy_state_120)
    T_BARBAR => Shift(yy_state_122)
    T_IMPLIES => Shift(yy_state_124)
    T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(1, NT_expr, yy_action_14)
    _ => Error
  }
}

///|
fn yy_state_154(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_expr, yy_action_13)
}

///|
fn yy_state_155(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_expr, yy_action_12)
}

///|
fn yy_state_156(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_expr, yy_action_11)
}

///|
fn yy_state_157(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(2, NT_arrow_fn_prefix, yy_action_43)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(2, NT_arrow_fn_prefix_no_constraint, yy_action_10)
    _ => Error
  }
}

///|
fn yy_state_158(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_62)
    T_COMMA => Shift(yy_state_100)
    T_RPAREN => Shift(yy_state_157)
    T_COLON => Shift(yy_state_159)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_65)
    _ => Error
  }
}

///|
fn yy_state_159(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_160)
    _ => Error
  }
}

///|
fn yy_state_160(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_83)
    T_RPAREN => Shift(yy_state_161)
    _ => Error
  }
}

///|
fn yy_state_161(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(4, NT_arrow_fn_prefix, yy_action_46)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_EOF =>
      Reduce(5, NT_tuple_expr, yy_action_8)
    _ => Error
  }
}

///|
fn yy_state_162(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_163)
    _ => Error
  }
}

///|
fn yy_state_163(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    NT_expr => Shift(yy_state_164)
    _ => Error
  }
}

///|
fn yy_state_164(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_expr, yy_action_6)
}

///|
fn yy_state_165(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_166)
    _ => Error
  }
}

///|
fn yy_state_166(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_167)
    _ => Error
  }
}

///|
fn yy_state_167(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_5)
}

///|
fn yy_state_168(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_59)
    T_COLON => Shift(yy_state_169)
    T_COMMA => Shift(yy_state_172)
    T_RPAREN => Shift(yy_state_175)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_64)
    _ => Error
  }
}

///|
fn yy_state_169(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_170)
    _ => Error
  }
}

///|
fn yy_state_170(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_171)
    _ => Error
  }
}

///|
fn yy_state_171(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_41)
}

///|
fn yy_state_172(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_48)
    NT_expr => Shift(yy_state_53)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_LPAREN => Shift(yy_state_64)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_94)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_95)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    T_RPAREN => Shift(yy_state_173)
    T_UIDENT => Shift(yy_state_174)
    T_LIDENT => Shift(yy_state_176)
    _ => Error
  }
}

///|
fn yy_state_173(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_38)
}

///|
fn yy_state_174(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_59)
    T_COMMA => Shift(yy_state_172)
    T_RPAREN => Shift(yy_state_175)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_64)
    _ => Error
  }
}

///|
fn yy_state_175(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix_no_constraint, yy_action_37)
}

///|
fn yy_state_176(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_62)
    T_COMMA => Shift(yy_state_177)
    T_RPAREN => Shift(yy_state_179)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_65)
    _ => Error
  }
}

///|
fn yy_state_177(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    NT_non_empty_tuple_elems => Shift(yy_state_48)
    NT_expr => Shift(yy_state_53)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_LPAREN => Shift(yy_state_64)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_101)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_102)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    T_UIDENT => Shift(yy_state_174)
    T_LIDENT => Shift(yy_state_176)
    T_RPAREN => Shift(yy_state_178)
    _ => Error
  }
}

///|
fn yy_state_178(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_34)
}

///|
fn yy_state_179(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix_no_constraint, yy_action_10)
}

///|
fn yy_state_180(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_62)
    T_COMMA => Shift(yy_state_177)
    T_RPAREN => Shift(yy_state_179)
    T_COLON => Shift(yy_state_181)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_65)
    _ => Error
  }
}

///|
fn yy_state_181(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_2)
    T_UNDERSCORE => Shift(yy_state_3)
    T_UIDENT => Shift(yy_state_4)
    T_LPAREN => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_182)
    _ => Error
  }
}

///|
fn yy_state_182(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_183)
    _ => Error
  }
}

///|
fn yy_state_183(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_8)
}

///|
fn yy_state_184(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_prefix_expr, yy_action_4)
}

///|
fn yy_state_185(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_28)
    T_FALSE => Shift(yy_state_29)
    T_TRUE => Shift(yy_state_30)
    T_LBRACKET => Shift(yy_state_31)
    NT_expr => Shift(yy_state_32)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_33)
    NT_tuple_expr => Shift(yy_state_36)
    NT_atomic_expr => Shift(yy_state_37)
    NT_simple_expr => Shift(yy_state_38)
    T_EXCLAMATION => Shift(yy_state_44)
    T_MINUS => Shift(yy_state_55)
    NT_prefix_expr => Shift(yy_state_57)
    T_UIDENT => Shift(yy_state_58)
    T_LIDENT => Shift(yy_state_61)
    T_LPAREN => Shift(yy_state_64)
    T_EXISTS => Shift(yy_state_104)
    T_FORALL => Shift(yy_state_128)
    T_IF => Shift(yy_state_144)
    NT_infix_expr => Shift(yy_state_153)
    NT_arrow_fn_expr => Shift(yy_state_154)
    NT_quantifier_expr => Shift(yy_state_155)
    NT_if_expr => Shift(yy_state_156)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_186)
    _ => Error
  }
}

///|
fn yy_state_186(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_187)
    _ => Error
  }
}

///|
fn yy_state_187(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_simple_expr, yy_action_3)
}

///|
fn yy_state_188(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_list_commas_expr_, yy_action_2)
}

///|
fn yy_state_189(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_190)
    _ => Error
  }
}

///|
fn yy_state_190(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_simple_expr, yy_action_1)
}

///|
fn yy_state_191(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_192)
    _ => Error
  }
}

///|
fn yy_state_192(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_term, yy_action_0)
}

///|
fn[T] yy_parse(
  tokens : Array[(Token, Int, Int)], start : YYState, return_ : ((YYObj) -> T),
  initial_pos? : Int
) -> T raise ParseError {
  let mut cursor = 0
  let mut state_stack : @list.List[YYState] = @list.List([start])
  let data_stack : Array[(YYObj, Int, Int)] = []
  let mut last_pos = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut state = start
  let mut lookahead : (YYSymbol, (YYObj, Int, Int), Token?)? = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match state(EOI) {
      (ReduceNoLookahead(_) | Accept) as t => t
      _ =>
        match lookahead {
          Some(la) => state(la.0)
          None =>
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some(
                (symbol, (data, start_pos, end_pos), Some(token))
              )
              state(symbol)
            } else {
              lookahead = Some((EOI, (YYObj_Void, last_pos, last_pos), None))
              state(EOI)
            }
        }
    }
    match decision {
      Accept =>
        ({
          ()
          return return_(data_stack.unsafe_pop().0)
        })
      Shift(next_state) =>
        ({
          ()
          guard! lookahead is Some(la)
          data_stack.push(la.1)
          state_stack = @list.cons(next_state, state_stack)
          last_shifted_state_stack = state_stack
          state = next_state
          last_pos = la.1.2
          lookahead = None
        })
      Reduce(count, symbol, action) | ReduceNoLookahead(count, symbol, action) =>
        ({
          ()
          for count = count, symbol = symbol, action = action {
            let args = data_stack[data_stack.length() - count:]
            let data = action(last_pos, args)
            let (start_pos, end_pos) = if args.length() == 0 {
              (last_pos, last_pos)
            } else {
              (args[0].1, args[args.length() - 1].2)
            }
            for _ in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.unsafe_tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match state(symbol) {
              Accept =>
                ({
                  ()
                  return return_(data_stack.unsafe_pop().0)
                })
              Shift(next_state) =>
                ({
                  ()
                  state_stack = @list.cons(next_state, state_stack)
                  state = next_state
                  break ()
                })
              Reduce(count, symbol, action) | ReduceNoLookahead(
                count, symbol, action
              ) =>
                ({
                  ()
                  continue count, symbol, action
                })
              _ => panic()
            }
          }
        })
      Error =>
        ({
          ()
          let (_, (_, start_pos, end_pos), token) = lookahead.unwrap()
          error(last_shifted_state_stack, token, (start_pos, end_pos))
        })
    }
  }
  panic()
}

///|
fn error(stack : @list.List[YYState], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @list.List[YYState]) {
      match stack {
        Empty => ()
        More(state, ..) =>
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) =>
              ({
                ()
                fn inner_go(stack : @list.List[YYState], count, symbol) {
                  let stack = stack.drop(count)
                  guard! stack is More(state, ..)
                  match state(symbol) {
                    Shift(state) => go(@list.cons(state, stack))
                    Reduce(count, symbol, _) | ReduceNoLookahead(
                      count, symbol, _
                    ) =>
                      inner_go(stack, count, symbol)
                    _ => panic()
                  }
                }
                inner_go(stack, count, symbol)
              })
            Error => ()
          }
      }
    }
    go(stack)
  }
  for term in ([
    (T_LIDENT, TK_LIDENT), (T_UIDENT, TK_UIDENT), (T_INT, TK_INT),
    (T_INFIX1, TK_INFIX1), (T_INFIX3, TK_INFIX3), (T_DOT_LIDENT, TK_DOT_LIDENT),
    (T_TRUE, TK_TRUE), (T_FALSE, TK_FALSE), (T_IF, TK_IF), (T_ELSE, TK_ELSE),
    (T_FORALL, TK_FORALL), (T_EXISTS, TK_EXISTS), (T_IMPLIES, TK_IMPLIES),
    (T_BARBAR, TK_BARBAR), (T_AMPERAMPER, TK_AMPERAMPER), (T_PLUS, TK_PLUS),
    (T_MINUS, TK_MINUS), (T_STAR, TK_STAR), (T_EXCLAMATION, TK_EXCLAMATION),
    (T_LPAREN, TK_LPAREN), (T_RPAREN, TK_RPAREN), (T_LBRACKET, TK_LBRACKET),
    (T_RBRACKET, TK_RBRACKET), (T_LBRACE, TK_LBRACE), (T_RBRACE, TK_RBRACE),
    (T_COMMA, TK_COMMA), (T_COLON, TK_COLON), (T_FAT_ARROW, TK_FAT_ARROW),
    (T_THIN_ARROW, TK_THIN_ARROW), (T_UNDERSCORE, TK_UNDERSCORE),
    (T_EOF, TK_EOF)
  ] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None =>
      ({
        ()
        raise UnexpectedEndOfInput(loc.1, expected)
      })
    Some(token) =>
      ({
        ()
        raise UnexpectedToken(token, loc, expected)
      })
  }
}

///|
pub fn term(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> @preterm.Preterm raise ParseError {
  yy_parse(
    tokens, yy_state_26,
    (it) =>
      ({
        ()
        guard! it is YYObj__preterm_Preterm(result)
        result
      }), initial_pos?
  )
}

///|
pub fn pretype(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> @preterm.Pretype raise ParseError {
  yy_parse(
    tokens, yy_state_0,
    (it) =>
      ({
        ()
        guard! it is YYObj__preterm_Pretype(result)
        result
      }), initial_pos?
  )
}
