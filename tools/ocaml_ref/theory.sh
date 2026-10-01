#!/bin/bash
# Translate a theory file, compile it, and run its standard differential
# test (see theory_test.py):  tools/ocaml_ref/theory.sh <name> <deps...>
set -e -o pipefail
cd "$(dirname "$0")/../.."
name=$1; shift
python3 tools/ocaml_ref/new_theory_pkg.py "$name" "$@"
# refresh the other packages' interfaces (the translator reads them) while
# this package's previous output, which may not compile, is set aside
mkdir -p tools/ocaml_ref/_build
rm -rf "tools/ocaml_ref/_build/pkg_$name"
mv "$name" "tools/ocaml_ref/_build/pkg_$name"
moon info >/dev/null 2>&1 || true
mv "tools/ocaml_ref/_build/pkg_$name" "$name"
tools/ocaml_ref/translate.sh translate "$name.ml" | grep "unsupported\|wrote\|Exception" | tee /dev/stderr | grep -q " 0 unsupported" || { echo "UNSUPPORTED ITEMS in $name.ml" >&2; exit 1; }
moon fmt >/dev/null 2>&1 || true
moon check 2>&1 | grep -E "^Error" -A9 | head -60 || true
[ -f "$name/${name}_ref_test.mbt" ] || python3 tools/ocaml_ref/theory_test.py "$name"
moon info >/dev/null 2>&1 || true
python3 tools/ocaml_ref/gen_theorems_test.py "$name"
(cd tools/ocaml_ref && ./run.sh "${name}_ref.ml" > "${name}_ref.expected" 2>&1 || true)
python3 - "$name" <<'PY'
import sys
p=f'tools/ocaml_ref/{sys.argv[1]}_ref.expected'
s=open(p).read().replace("    * HOL-Light syntax in effect *\n\n","",1)
import re
s=re.sub(r"(?m)^CPU time \(user\): .*$", "CPU time (user): <t>", s)
open(p,'w').write(s)
PY
python3 tools/ocaml_ref/embed_golden.py "tools/ocaml_ref/${name}_ref.expected" "$name/${name}_ref_test.mbt"
moon fmt >/dev/null 2>&1 || true
status=0
moon test --target wasm -p "bobzhang/hol_light/$name" > "tools/ocaml_ref/_build/theory_$name.log" 2>&1 || status=$?
grep -v "^ *#|" "tools/ocaml_ref/_build/theory_$name.log" | grep -E "^Error|Total|failed|Diff|^[-+]" -A3 | head -40 || true
exit $status
