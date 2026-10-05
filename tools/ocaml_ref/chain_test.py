#!/usr/bin/env python3
"""Turn the tests of a chain of files into the test blocks of one package.

usage: chain_test.py [--keep] <Dir>    e.g. chain_test.py Complex

A directory loaded in a fixed order (its make.ml; Multivariate's
MAKE_ORDER) has a test per file, and each loads the files before it in a
fresh process: the chain is loaded once per file. This writes the package
<dir>/make with one test file per chain member, NN_<name>_test.mbt, holding
that file's test block and golden unchanged. The test blocks of a package
run in one process, in order, so the chain is loaded once: a block loads
its file (the earlier blocks have loaded what is before it) and compares
the same output as the file's own test did. Two things keep the state what
a fresh process would have: the counters are read, not advanced
(`Log::probe_counters`), and output capture is released before the next
load (`@testkit.release_output`). A test with hand-written checks between
the EXTRA markers stays a test of its own (they may define constants).

The members' own *_ref_test.mbt files are deleted, unless --keep: the
blocks replace them. tools/test.py runs a package's test files in name
order, which the NN_ prefixes make the load order.
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import theory  # noqa: E402

ROOT = theory.ROOT
PROBES = ('  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))\n'
          '  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))\n')


def chain(d):
    return theory.MAKE_ORDER if d == "Multivariate" else [g for g, _ in theory.make_plan(d)]


def main():
    args = [a for a in sys.argv[1:] if a != "--keep"]
    keep = "--keep" in sys.argv
    d = args[0]
    files = chain(d)
    if not files:
        sys.exit(f"{d} has no load order (make.ml)")
    out = os.path.join(ROOT, d.lower(), "make")
    os.makedirs(out, exist_ok=True)
    for old in os.listdir(out):
        if old.endswith("_test.mbt"):
            os.remove(os.path.join(out, old))
    members = []
    for i, f in enumerate(files):
        pkg = theory.pkg_of(f)
        alias = os.path.basename(pkg)
        test = os.path.join(ROOT, pkg, alias + "_ref_test.mbt")
        if not os.path.exists(test):
            sys.exit(f"{f}: no test ({os.path.relpath(test, ROOT)}); translate and check it first")
        text = open(test).read()
        extra = re.search(r"// BEGIN EXTRA[^\n]*\n(.*?)^[^\n]*// END EXTRA", text, re.S | re.M)
        if extra and extra.group(1).strip():
            print(f"{f}: has EXTRA checks, stays a test of its own")
            continue
        head = f'test "{theory.stem(f)} matches {theory.stem(f)}.ml" {{\n'
        if text.count(head) != 1 or text.count(PROBES) != 1:
            sys.exit(f"{f}: not the generated test (tools/ocaml_ref/theory.py)")
        # the names the blocks use are declared once (00_using_test.mbt)
        body = text[text.index("///|\ntest \""):]
        body = body.replace(head, head + "  @testkit.release_output()\n").replace(PROBES, "  log.probe_counters()\n")
        name = f"{i + 1:02d}_{alias}_test.mbt"
        open(os.path.join(out, name), "w").write(
            f"// {f} in its directory's load order: the test block of\n"
            f"// {pkg}/{alias}_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden\n"
            f"// (tools/ocaml_ref/{theory.stem(f).replace('/', '_')}_ref.expected).\n\n" + body)
        members.append(pkg)
        if not keep:
            os.remove(test)
    # the last member imports everything the chain needs
    imports = re.search(r"import \{\n(.*?)\n\}", open(os.path.join(ROOT, members[-1], "moon.pkg")).read(), re.S).group(1)
    lines = [l for l in imports.split("\n") if l.strip()]
    lines += [f'  "bobzhang/hol_light/{p}",' for p in members] + ['  "bobzhang/hol_light/testkit",']
    open(os.path.join(out, "moon.pkg"), "w").write(
        "import {\n" + "\n".join(dict.fromkeys(lines)) + "\n}\n\n"
        'warnings = "-unused_value-unused_trait_bound-unused_package-unused_error_type"\n')
    open(os.path.join(out, "00_using_test.mbt"), "w").write("///|\nusing @testkit {stm, sthm}\n")
    # a package needs a source file
    open(os.path.join(out, "make.mbt"), "w").write(
        f"// {d}/make.ml loads its directory's files in order; this package's tests\n"
        "// check each file as it loads (tools/ocaml_ref/chain_test.py).\n")
    print(f"{d.lower()}/make: {len(members)} test blocks")


if __name__ == "__main__":
    main()
