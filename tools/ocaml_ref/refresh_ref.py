#!/usr/bin/env python3
"""Rerun one OCaml reference script and re-embed its output in the test.

usage: refresh_ref.py <name>_ref.ml [<test.mbt>]

Runs tools/ocaml_ref/<name>_ref.ml against upstream with run.sh (which
adapts upstream's notation, forall_reference.py), writes <name>_ref.expected
and embeds it in the test (embed_golden.py). The test defaults to the
`_test.mbt` file the script's header says to keep in sync with, or, for a
file whose tests were folded into its directory's chain, the
`<dir>/make/NN_<name>_test.mbt` member. Formal_ineqs tests compare a file's
own output only, so for them only what the target file prints is kept.

The MoonBit sources are no longer generated from upstream: edit them
directly, and refresh a reference only when its script changes.
"""
import glob
import os
import re
import subprocess
import sys

REF = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(REF))
# directories whose tests hold only the target file's own output
OWN_OUTPUT = ("Formal_ineqs/",)
MARKER = "@@refresh_ref: own output follows@@"


def normalize_counters(s):
    """testkit's normalize_counters: invented type variables and pattern
    variables renumbered by order of first appearance."""
    seen, counts = {}, {}

    def sub(m):
        name, prefix = m.group(0), m.group(1)
        if name not in seen:
            counts[prefix] = counts.get(prefix, 0) + 1
            seen[name] = counts[prefix]
        return prefix + str(seen[name])
    return re.sub(r"(\?|GEN%PVAR%)[0-9]+", sub, s)


def find_test(ref, text):
    m = re.search(r"in\s+sync\s+with\s+(\S+_test\.mbt)", text[:2000])
    if not m:
        sys.exit(f"{ref} names no test file; pass it explicitly")
    named = m.group(1)
    if os.path.exists(os.path.join(ROOT, named)):
        return named
    # complex/complexnumbers/complexnumbers_ref_test.mbt ->
    # complex/make/NN_complexnumbers_test.mbt
    parts = named.split("/")
    name = parts[-2]
    found = glob.glob(os.path.join(ROOT, parts[0], "make", f"[0-9]*_{name}_test.mbt"))
    if len(found) != 1:
        sys.exit(f"{named} (from {os.path.basename(ref)}) does not exist; pass the test explicitly")
    return os.path.relpath(found[0], ROOT)


def with_marker(text, target):
    """`text` with MARKER printed just before the target file is loaded."""
    uses = [m for m in re.finditer(r'(?m)^#use "' + re.escape(target) + r'\.(?:ml|hl)";;$', text)]
    if len(uses) != 1:
        sys.exit(f"cannot find the one #use of {target}")
    i = uses[0].start()
    return text[:i] + f'Format.print_flush (); print_endline "{MARKER}";;\n' + text[i:]


def main():
    if len(sys.argv) not in (2, 3):
        sys.exit(__doc__)
    ref = os.path.join(REF, os.path.basename(sys.argv[1]))
    text = open(ref).read()
    test = sys.argv[2] if len(sys.argv) == 3 else find_test(ref, text)
    if not os.path.exists(os.path.join(ROOT, test)):
        sys.exit(f"{test} does not exist")
    traces = re.findall(r'(?m)^show_trace "([^"]+)";;$', text)
    own = bool(traces) and traces[-1].startswith(OWN_OUTPUT)
    script = os.path.basename(ref)
    if own:
        os.makedirs(os.path.join(REF, "_build"), exist_ok=True)
        script = os.path.join("_build", "refresh_" + script)
        open(os.path.join(REF, script), "w").write(with_marker(text, traces[-1]))
    res = subprocess.run(["./run.sh", script], cwd=REF, capture_output=True, text=True)
    if res.returncode != 0:
        sys.stderr.write(res.stdout[-4000:] + res.stderr[-4000:])
        sys.exit(f"run.sh {script} failed (exit {res.returncode}); nothing written")
    s = res.stdout.replace("    * HOL-Light syntax in effect *\n\n", "", 1)
    if own:
        head, sep, s = s.partition(MARKER + "\n")
        if not sep:
            sys.exit("own-output marker missing from the output; nothing written")
    s = re.sub(r"(?m)^CPU time \(user\): .*$", "CPU time (user): <t>", s)
    # fresh-name counters, as testkit's normalize_counters does for the
    # tests that read a Log (others, such as the parser's and printer's,
    # compare their own output exactly)
    if "contents()" in open(os.path.join(ROOT, test)).read():
        s = normalize_counters(s)
    expected = ref[:-3] + ".expected"
    open(expected, "w").write(s)
    subprocess.run(["python3", os.path.join(REF, "embed_golden.py"), expected,
                    os.path.join(ROOT, test)], check=True)
    print(f"wrote {os.path.relpath(expected, ROOT)}, embedded in {test}")


if __name__ == "__main__":
    main()
