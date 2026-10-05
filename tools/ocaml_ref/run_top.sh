#!/bin/sh
# Run a reference script against the upstream HOL Light sources.
#   tools/ocaml_ref/run.sh kernel_ref.ml
# Requires the opam switch `hol-light` (or $HOL_LIGHT_SWITCH): OCaml 4.14.1,
# camlp5 8.02.01, num, camlp-streams, ocamlfind (see README.md).
set -e
cd "$(dirname "$0")"
eval "$(opam env --switch="${HOL_LIGHT_SWITCH:-hol-light}" --set-switch 2>/dev/null)" || true
# the bytecode stack limit (in words; the default 1M overflows in
# EC/xzprojective.ml)
export OCAMLRUNPARAM="${OCAMLRUNPARAM:-l=256M}"
H=../../.repos/hol-light
./ensure_pa_j.sh
cat prelude.ml "$1" > _build/body.ml
{ cat boot.ml; echo "let _ = Toploop.use_silently Format.std_formatter (Toploop.File \"$PWD/_build/body.ml\");;"; } > _build/script.ml
_build/holtop -w -a -alert -all -I "$H" -I _build _build/script.ml | grep -v "HOL-Light syntax in effect" | sed "/^$/d"
