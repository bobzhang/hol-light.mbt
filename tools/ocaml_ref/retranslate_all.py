#!/usr/bin/env python3
"""Re-translate every translated package, in load order, with fresh
interfaces: translated packages are set aside and brought back one at a
time (translate, `moon check`, `moon info`), so each translation reads the
current interfaces of the packages before it.

  python3 tools/ocaml_ref/retranslate_all.py          # from the start
  python3 tools/ocaml_ref/retranslate_all.py --resume # after a failure

Stops at the first package that does not compile (its errors are printed);
fix and rerun with --resume. The set-aside packages live in
tools/ocaml_ref/_build/aside/ until they are restored."""
import os
import re
import shutil
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import theory  # noqa: E402

ROOT = theory.ROOT
ASIDE = os.path.join(theory.REF, "_build", "aside")
STATE = os.path.join(theory.REF, "_build", "retranslate_done.txt")


def order():
    files = ["ocaml_set.ml", "ocaml_map.ml"] + [c + ".ml" for c in theory.CORE]
    # library packages, here or set aside
    lib = {d for d in os.listdir(os.path.join(ROOT, "library"))
           if os.path.isdir(os.path.join(ROOT, "library", d))}
    if os.path.isdir(ASIDE):
        lib |= {d[len("library__"):] for d in os.listdir(ASIDE) if d.startswith("library__")}
    lib = sorted(lib)
    seen = set(files)
    for d in lib:
        for f in theory.deps("Library/" + d + ".ml") + ["Library/" + d + ".ml"]:
            if f not in seen:
                seen.add(f)
                files.append(f)
    return files


def pkg(f):
    return {"ocaml_map.ml": "omap", "ocaml_set.ml": "oset"}.get(f) or theory.pkg_of(f)


def errors_in(p):
    out = subprocess.run(["moon", "check"], cwd=ROOT, capture_output=True, text=True)
    text = out.stdout + out.stderr
    errs = re.findall(r"^Error.*(?:\n.*){0,9}", text, re.M)
    mine = [e for e in errs if f"/{p}/" in e]
    return mine, errs


def main():
    files = order()
    resume = "--resume" in sys.argv
    done = set(open(STATE).read().split()) if resume and os.path.exists(STATE) else set()
    if not resume:
        os.makedirs(ASIDE, exist_ok=True)
        for f in files:
            src = os.path.join(ROOT, pkg(f))
            if os.path.isdir(src):
                dst = os.path.join(ASIDE, pkg(f).replace("/", "__"))
                shutil.move(src, dst)
        open(STATE, "w").close()
    for f in files:
        p = pkg(f)
        if f in done:
            continue
        a = os.path.join(ASIDE, p.replace("/", "__"))
        if os.path.isdir(a):
            shutil.move(a, os.path.join(ROOT, p))
        out = subprocess.run(["tools/ocaml_ref/translate.sh", "translate", f], cwd=ROOT,
                             capture_output=True, text=True).stdout
        wrote = [l for l in out.splitlines() if "wrote" in l or "Exception" in l]
        print(f"== {f}: {' '.join(wrote)}", flush=True)
        if not any(" 0 unsupported" in l for l in wrote):
            print("\n".join(l for l in out.splitlines() if "unsupported" in l)[:4000])
            sys.exit(1)
        subprocess.run(["moon", "fmt"], cwd=ROOT, capture_output=True)
        mine, errs = errors_in(p)
        if errs:
            print("\n--\n".join((mine or errs)[:8]))
            sys.exit(1)
        subprocess.run(["moon", "info"], cwd=ROOT, capture_output=True)
        with open(STATE, "a") as s:
            s.write(f + "\n")
    print("all packages re-translated")


if __name__ == "__main__":
    main()
