#!/usr/bin/env python3
"""Port a package's readable-format proofs to MoonBit (temporary tool).

usage: tools/port_readable.py <package dir> [--keep]
  e.g. tools/port_readable.py richterhilbertaxiomgeometry/UniversalPropCartProd

Replaces each `@readable.theorem(@readable.parse_qproof("..."))` of the
package by the equivalent `@readable.prove(...)` program (readable/script.mbt):
1. writes a temporary test that loads the package and prints, for each
   proof, what `@readable.port_theorem` generates (readable/port.mbt);
2. runs it with a large stack (as tools/test.py does);
3. replaces each `⟦phrase⟧` marker by the expression the phrase evaluates,
   from the `register_phrase`/`exec_phrase_N` pairs of the packages, and
   lays out the code;
4. rewrites the package source. The phrases are then unused here and are
   removed with their functions.
"""
import glob
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CALL = re.compile(r'@readable\.theorem\(@readable\.parse_qproof\(("(?:[^"\\]|\\.)*")\)\)')
GEN_TEST = "port_gen_test.mbt"


def sh(cmd, **kw):
    return subprocess.run(cmd, cwd=ROOT, check=True, text=True, **kw)


def main_file(pkg):
    name = os.path.basename(pkg)
    return os.path.join(ROOT, pkg, name + ".mbt")


def generate(pkg, literals):
    alias = os.path.basename(pkg)
    test = os.path.join(ROOT, pkg, GEN_TEST)
    body = ",\n    ".join(literals)
    open(test, "w").write(f'''///|
test "port readable proofs" {{
  @{alias}.load()
  let proofs : Array[String] = [
    {body},
  ]
  for i, p in proofs {{
    println("@@PORT \\{{i}}")
    println(@readable.port_theorem(@readable.parse_qproof(p)))
    println("@@END")
  }}
}}
''')
    try:
        sh(["moon", "test", "--target", "wasm-gc", "--build-only", "-j", "4", "-p",
            "bobzhang/hol_light/" + pkg], capture_output=True)
        exe = glob.glob(os.path.join(ROOT, "_build/wasm-gc/debug/test", pkg, "*.blackbox_test.wasm"))
        assert len(exe) == 1, exe
        args = json.dumps({"package": "bobzhang/hol_light/" + pkg,
                           "file_and_index": [[GEN_TEST, [{"start": 0, "end": 1}]]]})
        r = subprocess.run(["sh", "-c", 'ulimit -s 65520 2>/dev/null; exec "$@"', "sh",
                            "moonrun", "--stack-size", "60000", "--test-args", args, exe[0], "--"],
                           cwd=ROOT, capture_output=True, text=True)
    finally:
        os.remove(test)
    out = r.stdout
    codes = re.findall(r"(?s)@@PORT (\d+)\n(.*?)\n@@END\n", out)
    fails = [l for l in out.splitlines() if l.startswith('{"type":"result"') and json.loads(l).get("message")]
    if fails or len(codes) != len(literals):
        sys.exit(f"generation failed ({len(codes)} of {len(literals)}):\n{out[-3000:]}\n{r.stderr[-3000:]}")
    return [c for _, c in sorted(codes, key=lambda x: int(x[0]))]


# phrases whose translation is an eta-expanded closure, as the function itself
SHORT = {
    "thmtactic_ref := ((MP_TAC): thm -> tactic);;": "th => @tactics.mp_tac(th)",
    "termlist_thm_thm_ref := ((ISPECL): (term list -> thm -> thm));;": "tms => th => @bool.ispecl(tms, th)",
    "termlist_thm_thm_ref := ((SPECL): (term list -> thm -> thm));;": "tms => th => @bool.specl(tms, th)",
    "thmlist_term_thm_ref := ((MESON): (thm list ->term -> thm));;": "ths => tm => @meson.meson(ths, tm)",
}


def phrase_table():
    """phrase text -> (package dir, MoonBit expression)."""
    table = {}
    reg = re.compile(r'@lib\.register_phrase\(("(?:[^"\\]|\\.)*"), (exec_phrase_\d+)\)')
    for f in glob.glob(os.path.join(ROOT, "**/*.mbt"), recursive=True):
        if "/_build/" in f or f.endswith("_test.mbt"):
            continue
        src = open(f).read()
        if "register_phrase" not in src:
            continue
        pkg = os.path.relpath(os.path.dirname(f), ROOT)
        for m in reg.finditer(src):
            text = json.loads(m.group(1))
            fn = re.search(r"pub fn " + m.group(2) + r"\(x\d+ : Unit\) -> Unit raise \{\n  let _ = x\d+\n  \{\n    @readable\.[a-z_]+\(\)\.val = (.*?)\n    \(\)\n  \}\n\}", src, re.S)
            if text in SHORT:
                table[text] = (None, SHORT[text])
            elif fn and "\n" not in fn.group(1):
                table[text] = (pkg, fn.group(1))
    return table


def resolve(code, pkg, table):
    def sub(m):
        text = m.group(1)
        if text not in table:
            sys.exit("no expression for phrase " + text)
        src, expr = table[text]
        if src is not None and src != pkg and not expr.startswith("@"):
            expr = "@" + os.path.basename(src) + "." + expr
        return expr
    return re.sub(r"⟦(.*?)⟧", sub, code)


def layout(code, indent, width=88):
    """Break calls and array literals whose text is too long, one argument
    per line, outside string literals."""
    if len(code) + indent <= width:
        return code
    # split at the first top-level opening bracket
    depth, i, n, in_str = 0, 0, len(code), False
    start = None
    while i < n:
        c = code[i]
        if in_str:
            if c == "\\":
                i += 1
            elif c == '"':
                in_str = False
        elif c == '"':
            in_str = True
        elif c in "([":
            if depth == 0 and start is None:
                start = i
            depth += 1
        elif c in ")]":
            depth -= 1
            if depth == 0 and start is not None:
                end = i
                break
        i += 1
    else:
        return code
    head, inner, close, tail = code[:start + 1], code[start + 1:end], code[end], code[end + 1:]
    args, depth, cur, in_str, j = [], 0, "", False, 0
    while j < len(inner):
        c = inner[j]
        if in_str:
            cur += c
            if c == "\\":
                j += 1
                cur += inner[j]
            elif c == '"':
                in_str = False
        elif c == '"':
            in_str = True
            cur += c
        elif c in "([":
            depth += 1
            cur += c
        elif c in ")]":
            depth -= 1
            cur += c
        elif c == "," and depth == 0:
            args.append(cur.strip())
            cur = ""
        else:
            cur += c
        j += 1
    if cur.strip():
        args.append(cur.strip())
    if not args:
        return code
    pad = " " * (indent + 2)
    body = "".join(pad + layout(a, indent + 2, width) + ",\n" for a in args)
    return head + "\n" + body + " " * indent + close + tail


def remove_phrases(src):
    """Drop the phrase registrations and their translations, which only the
    text format's `exec` used."""
    steps = re.findall(r'///\|\n/// the phrase [^\n]*\nfn (step_\d+)\(\) -> Unit raise \{\n  @lib\.register_phrase\([^\n]*\)\n\}\n\n', src)
    src = re.sub(r'///\|\n/// the phrase [^\n]*\nfn step_\d+\(\) -> Unit raise \{\n  @lib\.register_phrase\([^\n]*\)\n\}\n\n', "", src)
    for st in steps:
        src, n = re.subn(r"\n  " + st + r"\(\)\n", "\n", src, count=1)
        assert n == 1, st
    src = re.sub(r"///\|\n/// `exec_phrase_\d+`\npub fn exec_phrase_\d+\(x\d+ : Unit\) -> Unit raise \{\n.*?\n\}\n\n", "", src, flags=re.S)
    if re.search(r"exec_phrase_\d+", src):
        sys.exit("exec_phrase references remain")
    return src


def main():
    pkg = sys.argv[1].rstrip("/")
    f = main_file(pkg)
    src = open(f).read()
    literals = [m.group(1) for m in CALL.finditer(src)]
    print(f"{pkg}: {len(literals)} proofs")
    codes = generate(pkg, literals)
    table = phrase_table()
    it = iter(codes)

    def replace(m):
        line_start = src.rfind("\n", 0, m.start()) + 1
        indent = len(src[line_start:m.start()]) - len(src[line_start:m.start()].lstrip())
        return layout(resolve(next(it), pkg, table), indent)
    out = CALL.sub(replace, src)
    if "--keep" not in sys.argv:
        out = remove_phrases(out)
    open(f, "w").write(out)
    print(f"rewrote {os.path.relpath(f, ROOT)}")


if __name__ == "__main__":
    main()
