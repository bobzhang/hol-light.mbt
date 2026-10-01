#!/bin/sh
# Run the OCaml -> MoonBit translator on an upstream HOL Light file.
#   tools/ocaml_ref/translate.sh <hol file> [loaded-prefix files...]
# The translator (plain OCaml) is loaded before pa_j; HOL Light is then
# loaded with pa_j, and each phrase of the target is typechecked in the live
# environment, translated, and executed.
set -e
cd "$(dirname "$0")"
eval "$(opam env --switch=4.14.1+idea --set-switch 2>/dev/null)" || true
H=../../.repos/hol-light
[ -f _build/holtop ] || ocamlfind ocamlmktop -o _build/holtop
grep -v 'pa_j.cmo' boot.ml > _build/tboot.ml
{
  cat _build/tboot.ml
  echo '#directory "+compiler-libs";;'
  echo "#use \"$PWD/../translator/translator.ml\";;"
  echo '#load "pa_j.cmo";;'
  echo "let _ = Toploop.use_silently Format.std_formatter (Toploop.File \"$PWD/prelude.ml\");;"
  echo "let _ = Translator.main \"$1\";;"
} > _build/tscript.ml
_build/holtop -w -a -alert -all -I "$H" -I _build _build/tscript.ml 2>&1 | grep -v "HOL-Light syntax in effect"
