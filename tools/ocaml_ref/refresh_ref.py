#!/usr/bin/env python3
"""Rerun one OCaml reference script and re-embed its output in the test.

usage: refresh_ref.py <name>_ref.ml [<test.mbt>]

Runs tools/ocaml_ref/<name>_ref.ml against upstream with run.sh (which
adapts upstream's notation, forall_reference.py), writes <name>_ref.expected
and embeds it in the test (embed_golden.py). The test defaults to the
`_test.mbt` file the script's header says to keep in sync with.

The MoonBit sources are no longer generated from upstream: edit them
directly, and refresh a reference only when its script changes.
"""
import os
import re
import subprocess
import sys

REF = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(REF))


def main():
    if len(sys.argv) not in (2, 3):
        sys.exit(__doc__)
    ref = os.path.join(REF, os.path.basename(sys.argv[1]))
    if len(sys.argv) == 3:
        test = sys.argv[2]
    else:
        m = re.search(r"in\s+sync\s+with\s+(\S+_test\.mbt)", open(ref).read(2000))
        if not m:
            sys.exit(f"{ref} names no test file; pass it explicitly")
        test = m.group(1)
    res = subprocess.run(["./run.sh", os.path.basename(ref)], cwd=REF,
                         capture_output=True, text=True)
    # run.sh's pipeline hides the toplevel's exit status: refuse to overwrite
    # the golden when the session reported an error
    failed = re.search(r"(?m)^(Exception:|Error:|Cannot find file)", res.stderr)
    if res.returncode != 0 or failed:
        sys.stderr.write(res.stderr)
        sys.exit(res.returncode or 1)
    s = res.stdout.replace("    * HOL-Light syntax in effect *\n\n", "", 1)
    s = re.sub(r"(?m)^CPU time \(user\): .*$", "CPU time (user): <t>", s)
    expected = ref[:-3] + ".expected"
    open(expected, "w").write(s)
    subprocess.run(["python3", os.path.join(REF, "embed_golden.py"), expected,
                    os.path.join(ROOT, test)], check=True)
    print(f"wrote {os.path.relpath(expected, ROOT)}, embedded in {test}")


if __name__ == "__main__":
    main()
