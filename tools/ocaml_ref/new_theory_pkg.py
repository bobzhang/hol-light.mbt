#!/usr/bin/env python3
"""Set up the MoonBit package for a translated HOL Light file.

usage: new_theory_pkg.py <name> <previous package>...

Writes <name>/moon.pkg (importing the hand-ported packages and the given
translated ones) and <name>/init.mbt (loading the theory), and adds the
manifest entry to tools/translator/main.ml.
"""
import sys, os

name, prev = sys.argv[1], sys.argv[2:]
base = ["kernel", "lib", "num", "basics", "nets", "printer", "preterm", "parser", "pp",
        "equal", "bool", "drule", "tactics", "itab", "simp"]
os.makedirs(name, exist_ok=True)
imports = "".join(f'  "bobzhang/hol_light/{p}",\n' for p in base + prev)
open(f"{name}/moon.pkg", "w").write(
    "import {\n" + imports + '  "moonbitlang/core/list",\n}\n\n'
    'import {\n  "bobzhang/hol_light/testkit",\n} for "test"\n\n'
    'warnings = "-unused_value-unused_trait_bound-unused_package-unused_error_type"\n')
open(f"{name}/init.mbt", "w").write(
    f"// {name}.ml: the load steps are generated ({name}.mbt).\n\n///|\nfn init {{\n"
    f'  @parser.begin_theory("{name}")\n  load_steps() catch {{\n'
    f'    e => abort("HOL Light: loading {name}.ml failed: " + e.to_string())\n  }}\n'
    "  @parser.end_theory()\n}\n")
main = "tools/translator/main.ml"
s = open(main).read()
entry = f'    | "{name}.ml" -> ("{name}/{name}.mbt", [])\n'
if entry not in s:
    s = s.replace('    | f -> failwith ("no manifest entry for " ^ f)', entry + '    | f -> failwith ("no manifest entry for " ^ f)')
    open(main, "w").write(s)
