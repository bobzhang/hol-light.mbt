#!/usr/bin/env python3
"""Regenerate the theorem-list part of a translated file's differential test.

usage: gen_theorems_test.py <pkg>   (e.g. theorems, class)

Reads the translated <pkg>/<pkg>.mbt and rewrites the block between the
BEGIN/END markers in tools/ocaml_ref/<pkg>_ref.ml and <pkg>/<pkg>_ref_test.mbt
with one line per theorem value. Then rerun run.sh and embed_golden.py.
"""
import re
import sys

pkg = sys.argv[1] if len(sys.argv) > 1 else 'theorems'
alias = pkg.split('/')[-1]
# optional explicit paths (nested packages: library/prime)
ref = sys.argv[2] if len(sys.argv) > 2 else f'tools/ocaml_ref/{pkg}_ref.ml'
test = sys.argv[3] if len(sys.argv) > 3 else f'{pkg}/{pkg}_ref_test.mbt'
# the translator names a file ending in "test" <name>_ml.mbt (moon's test suffix)
gen = f'{pkg}/{alias}_ml.mbt' if alias.endswith('test') else f'{pkg}/{alias}.mbt'
src = open(gen).read()
# a theorem of a module is listed by its path (`Arith_num.num_def`); one
# its module's signature hides has other text after the name, and is not
pairs = re.findall(r'/// `([A-Za-z0-9_\'.]+)`\npub fn ([a-z0-9_]+)\(\) -> @kernel\.Thm', src)
# a redefined name: OCaml's scripts see only the last definition
last = {o: i for i, (o, _) in enumerate(pairs)}
pairs = [p for i, p in enumerate(pairs) if last[p[0]] == i]


def splice(path, begin, end, lines):
    text = open(path).read()
    i = text.index(begin) + len(begin)
    j = text.index(end)
    open(path, 'w').write(text[:i] + '\n' + ''.join(lines) + text[j:])


splice(ref,
       '(* BEGIN generated theorem list *)', '(* END generated theorem list *)',
       [f'attempt "{o}" (fun () -> sthm {o});;\n' for o, _ in pairs])
splice(test,
       '// BEGIN generated theorem list', '  // END generated theorem list',
       [f'  log.attempt("{o}", () => sthm(@{alias}.{n}()))\n' for o, n in pairs])
print(f'{len(pairs)} theorems')
