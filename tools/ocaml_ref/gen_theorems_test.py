#!/usr/bin/env python3
"""Regenerate the theorem-list part of the theorems.ml differential test.

usage: gen_theorems_test.py

Reads the translated theorems/theorems.mbt and rewrites the block between
the BEGIN/END markers in tools/ocaml_ref/theorems_ref.ml and in
theorems/theorems_ref_test.mbt. Then rerun run.sh and embed_golden.py.
"""
import re

src = open('theorems/theorems.mbt').read()
pairs = re.findall(r'/// `([A-Za-z0-9_\']+)`\npub fn ([a-z0-9_]+)\(\) -> @kernel\.Thm', src)


def splice(path, begin, end, lines):
    text = open(path).read()
    i = text.index(begin) + len(begin)
    j = text.index(end)
    open(path, 'w').write(text[:i] + '\n' + ''.join(lines) + text[j:])


splice('tools/ocaml_ref/theorems_ref.ml',
       '(* BEGIN generated theorem list *)', '(* END generated theorem list *)',
       [f'attempt "{o}" (fun () -> sthm {o});;\n' for o, _ in pairs])
splice('theorems/theorems_ref_test.mbt',
       '// BEGIN generated theorem list', '  // END generated theorem list',
       [f'  log.attempt("{o}", () => sthm(@theorems.{n}()))\n' for o, n in pairs])
print(f'{len(pairs)} theorems')
