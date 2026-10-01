#!/usr/bin/env python3
"""Embed an OCaml reference output as the expected `inspect` content.

usage: embed_golden.py <golden.out> <test.mbt>

Replaces the first `inspect(log.buf.to_string()...)` call in <test.mbt> with
one whose `content=` is the golden output verbatim.
"""
import re, sys

golden, test = sys.argv[1], sys.argv[2]
lines = open(golden).read().rstrip("\n").split("\n")
body = "\n".join("      #|" + l for l in lines + [""])

src = open(test).read()
# Either the bare call or a previously embedded one (which ends with the
# `    ),\n  )` produced above; `#|` lines never contain that sequence).
pattern = (r"inspect\((\w+\.(?:buf\.to_string|contents))\(\)\)"
           r"|inspect\(\n    (\w+\.(?:buf\.to_string|contents))\(\),\n    content=\(\n"
           r"(?:      #\|[^\n]*\n)*    \),\n  \)")


def call(m):
    var = m.group(1) or m.group(2)
    return ("inspect(\n    " + var + "(),\n    content=(\n" +
            body + "\n    ),\n  )")


src, n = re.subn(pattern, call, src, count=1)
assert n == 1, "no inspect(<x>.buf.to_string()) call found"
open(test, "w").write(src)
