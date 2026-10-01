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
src = open(f'{pkg}/{pkg}.mbt').read()
pairs = re.findall(r'/// `([A-Za-z0-9_\']+)`\npub fn ([a-z0-9_]+)\(\) -> @kernel\.Thm', src)


def splice(path, begin, end, lines):
    text = open(path).read()
    i = text.index(begin) + len(begin)
    j = text.index(end)
    open(path, 'w').write(text[:i] + '\n' + ''.join(lines) + text[j:])


splice(f'tools/ocaml_ref/{pkg}_ref.ml',
       '(* BEGIN generated theorem list *)', '(* END generated theorem list *)',
       [f'attempt "{o}" (fun () -> sthm {o});;\n' for o, _ in pairs])
splice(f'{pkg}/{pkg}_ref_test.mbt',
       '// BEGIN generated theorem list', '  // END generated theorem list',
       [f'  log.attempt("{o}", () => sthm(@{pkg}.{n}()))\n' for o, n in pairs])
print(f'{len(pairs)} theorems')
