#!/bin/sh
# Build Mizar Light's syntax extension (Mizarlight/pa_f.ml: infix `by`,
# `st`, `at`, ...) if it is not there. Mizarlight/make.ml loads
# `!hol_dir/Mizarlight/pa_f.cmo`, which upstream's Makefile builds inside
# the HOL Light tree; the sessions' `hol_dir` is _build/hol_dir instead.
set -e
cd "$(dirname "$0")"
eval "$(opam env --switch="${HOL_LIGHT_SWITCH:-hol-light}" --set-switch 2>/dev/null)" || true
H=../../.repos/hol-light
D=_build/hol_dir/Mizarlight
if [ ! -f $D/pa_f.cmo ]; then
  mkdir -p $D
  cp "$H/Mizarlight/pa_f.ml" $D/pa_f.ml
  (cd $D && ocamlfind ocamlc -package camlp5 -c \
    -pp "camlp5r pa_lexer.cmo pa_extend.cmo q_MLast.cmo" -I +camlp5 pa_f.ml 2>/dev/null)
fi
