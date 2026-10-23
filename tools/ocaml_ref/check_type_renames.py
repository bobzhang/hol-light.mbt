#!/usr/bin/env python3
"""Check that the type-variable renames change only names.

usage: check_type_renames.py [<name>_ref.ml ...]

Runs each reference script (by default, every one that loads a file
TYPE_RENAMES lists) twice with run.sh: on upstream's own sources and on the
renamed copies (forall_reference.py). It requires the renamed run's output
to be exactly the original's with each renamed type variable's name
replaced (type variables only: a term variable called person keeps its
name): the renames change no proof step, hypothesis order or counter. It also
requires that no old name is left in the renamed run's output (the rename
is complete) and that no new name is already in the original's (no two
type variables merge). These hold whatever the source scan in
forall_reference.py misses.
"""
import glob
import os
import re
import subprocess
import sys

from forall_reference import TYPE_RENAMES, rename_in_quotation

REF = os.path.dirname(os.path.abspath(__file__))
NAME = "A-Za-z0-9_'"


def run(script, original):
    env = dict(os.environ)
    if original:
        env['HOL_REF_ORIGINAL_TYPE_NAMES'] = '1'
    res = subprocess.run(['./run.sh', script], cwd=REF, env=env, capture_output=True, text=True)
    if res.returncode != 0:
        sys.exit(f'run.sh {script} failed (exit {res.returncode})')
    return re.sub(r'(?m)^CPU time \(user\): .*$', 'CPU time (user): <t>', res.stdout)


def type_variable(name):
    """A type variable called `name` in structural output (`'name`; a term
    variable is followed by its type, `'name:bool`)."""
    return re.compile(f"(?<![{NAME}])'" + re.escape(name) + f"(?![{NAME}:])")


def word(name):
    return re.compile(f"(?<![{NAME}])" + re.escape(name) + f"(?![{NAME}])")


def substituted(output, renames):
    """`output` with the type variables renamed, and nothing else: in the
    quotation traces, in the quotations' type annotations (as
    forall_reference.py renames them); elsewhere, where the structural
    printer writes a type variable, as its name after a quote. A term
    variable with an old name keeps it."""
    structural = re.compile(f"(?<![{NAME}])'(" + '|'.join(
        map(re.escape, sorted(renames, key=len, reverse=True))) + f")(?![{NAME}:])")
    out, trace = [], False
    for line in output.splitlines(keepends=True):
        if re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            trace = True
        elif trace and line.startswith('  '):
            out.append(rename_in_quotation(line, renames))
            continue
        else:
            trace = False
        out.append(structural.sub(lambda m: "'" + renames[m[1]], line))
    return ''.join(out)


def check(script):
    text = open(os.path.join(REF, script)).read()
    loaded = [p for p in TYPE_RENAMES if f'#use "{p}"' in text]
    renames = {}
    for path in loaded:
        for old, new in TYPE_RENAMES[path].items():
            if renames.setdefault(old, new) != new:
                sys.exit(f'{script}: {old} is renamed to both {renames[old]} and {new}')
    if len(set(renames.values())) != len(renames):
        sys.exit(f'{script}: the renames together are not injective')
    original, renamed = run(script, True), run(script, False)
    problems = []
    for old, new in renames.items():
        if type_variable(new).search(original):
            problems.append(f'{new} is already a type variable in the original output')
        if type_variable(old).search(renamed) or (old.startswith("'") and word(old).search(renamed)):
            problems.append(f'{old} is left in the renamed output')
    if substituted(original, renames) != renamed:
        problems.append('the renamed output is not the original with the names replaced')
    for p in problems:
        print(f'{script}: {p}')
    if not problems:
        print(f'{script}: ok ({", ".join(f"{o} -> {n}" for o, n in renames.items())})')
    return not problems


def main():
    scripts = [os.path.basename(s) for s in sys.argv[1:]] or sorted(
        os.path.basename(s) for s in glob.glob(os.path.join(REF, '*_ref.ml'))
        if any(f'#use "{p}"' in open(s).read() for p in TYPE_RENAMES))
    if not all([check(s) for s in scripts]):
        sys.exit(1)


if __name__ == '__main__':
    main()
