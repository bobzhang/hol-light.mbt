#!/bin/sh
# Build HOL Light's syntax extension (_build/pa_j.cmo) if it is not there.
# The scripts that load upstream sources call this (a fresh checkout or
# worktree has no _build).
set -e
cd "$(dirname "$0")"
eval "$(opam env --switch="${HOL_LIGHT_SWITCH:-hol-light}" --set-switch 2>/dev/null)" || true
H=../../.repos/hol-light
if [ ! -f _build/pa_j.cmo ]; then
  mkdir -p _build
  cp "$H/pa_j/pa_j_4.xx_8.02.ml" _build/pa_j.ml
  (cd _build && ocamlc -safe-string -c \
    -pp "camlp5r pa_lexer.cmo pa_extend.cmo q_MLast.cmo" \
    -I "$(camlp5 -where)" -I "$(ocamlfind query camlp-streams)" pa_j.ml)
fi
