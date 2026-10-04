#!/bin/sh
# Run the OCaml -> MoonBit translator on an upstream HOL Light file.
#   tools/ocaml_ref/translate.sh <command> <hol file>
#   tools/ocaml_ref/translate.sh batch <plan file> <after command>
# command: survey (report upstream names with no MoonBit declaration) or
#          translate (write the MoonBit file named in tools/translator/main.ml).
# The translator (plain OCaml) is loaded before pa_j; HOL Light is then
# loaded with pa_j phrase by phrase, recording where each value is defined.
set -e
cd "$(dirname "$0")"
eval "$(opam env --switch="${HOL_LIGHT_SWITCH:-hol-light}" --set-switch 2>/dev/null)" || true
H="$(cd ../../.repos/hol-light && pwd)"
ROOT="$(cd ../.. && pwd)"
[ -f _build/holtop ] || ocamlfind ocamlmktop -o _build/holtop
grep -v 'pa_j.cmo' boot.ml > _build/tboot.ml
{
  cat _build/tboot.ml
  echo '#directory "+compiler-libs";;'
  echo '#load "unix.cma";;'
  echo "#use \"$ROOT/tools/translator/mbti.ml\";;"
  for f in ir translator lower emit main; do
    echo "#use \"$ROOT/tools/translator/$f.ml\";;"
  done
  echo '#load "pa_j.cmo";;'
  echo 'let needs (_:string) = ();;'
  echo 'let loadt (_:string) = ();;'
  echo 'let float_sqrt = sqrt;; let float_fabs = abs_float;;'
  if [ "$1" = batch ]; then
    # $2: a file with the plan: `[ ([pre...], target); ... ]` (batch.py)
    echo "let _ = Main.translate_batch ~hol:\"$H\" ~root:\"$ROOT\" ~after:\"$3\" ($(cat "$2"));;"
  else
    echo "let _ = Main.$1 ~hol:\"$H\" ~root:\"$ROOT\" \"$2\";;"
  fi
} > _build/tscript.ml
_build/holtop -w -a -alert -all -I "$H" -I _build _build/tscript.ml 2>&1 | grep -v "HOL-Light syntax in effect"
