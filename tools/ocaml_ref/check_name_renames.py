#!/usr/bin/env python3
"""Check that the constant and type-constant renames change only names.

usage: check_name_renames.py [<name>_ref.ml ...]

Runs each reference script (by default, every one that loads a file
NAME_PATCHES lists, name_renames.py) twice with run.sh, with
HOL_REF_ORIGINAL_NAMES set and unset (the other renames apply to both).
The renamed run's output must be exactly the original's with every renamed
name replaced (name_renames.renamed_output; these names are global, so on
every line), no new name may occur in the original's and no old one in the
renamed one's. Any other difference, such as an order that follows names
(euclid'dot sorts before euclid0, euclid_dot after it), fails.
"""
import glob
import os
import re
import subprocess
import sys

from name_renames import NAME_PATCHES, HOL_TOKEN, constant_names, old_names, renamed_name, renamed_output
from term_renames import decode_escaped

REF = os.path.dirname(os.path.abspath(__file__))


def run(script, original):
    env = {k: v for k, v in os.environ.items() if not k.startswith('HOL_REF_ORIGINAL_')}
    if original:
        env['HOL_REF_ORIGINAL_NAMES'] = '1'
    env['HOL_REF_MARK_TYPE_CONSTANTS'] = '1'
    res = subprocess.run(['./run.sh', script], cwd=REF, env=env, capture_output=True, text=True)
    if res.returncode != 0:
        sys.exit(f'run.sh {script} failed (exit {res.returncode})')
    return re.sub(r'(?m)^CPU time \(user\): .*$', 'CPU time (user): <t>', res.stdout)


def names(output):
    """The names of constants and type constants in the output (name_renames.
    constant_names), and every name in its quotation traces."""
    found, trace = set(), False
    for line in output.splitlines():
        if re.match(r'.* quotations \(\d+\):$', line):
            trace = True
        elif trace and line.startswith('  '):
            found |= set(HOL_TOKEN.findall(decode_escaped(line[2:])))
            continue
        else:
            trace = False
        found |= set(constant_names(line))
    return found


def check(script):
    original, renamed = run(script, True), run(script, False)
    problems = []
    before, after = names(original), names(renamed)
    olds = {t for t in before if renamed_name(t)}
    clash = {renamed_name(t) for t in olds} & before
    if clash:
        problems.append(f'new names already in the original output: {sorted(clash)[:5]}')
    left = old_names(' '.join(after))
    if left:
        problems.append(f'old names left in the renamed output: {sorted(left)[:5]}')
    expected = renamed_output(original)
    if expected != renamed:
        a, b = expected.splitlines(), renamed.splitlines()
        i = next((i for i, (x, y) in enumerate(zip(a, b)) if x != y), min(len(a), len(b)))
        problems.append(f'output differs at line {i + 1}:\n    expected {a[i][:200] if i < len(a) else "<end>"!r}\n'
                        f'    got      {b[i][:200] if i < len(b) else "<end>"!r}')
    for p in problems:
        print(f'{script}: {p}')
    if not problems:
        print(f'{script}: ok ({len(olds)} names renamed)' if olds else f'{script}: ok (unchanged)')
    return not problems


def main():
    scripts = [os.path.basename(s) for s in sys.argv[1:]] or sorted(
        os.path.basename(s) for s in glob.glob(os.path.join(REF, '*_ref.ml'))
        if any(f'#use "{p}"' in open(s).read() for p in NAME_PATCHES))
    if not all([check(s) for s in scripts]):
        sys.exit(1)


if __name__ == '__main__':
    main()
