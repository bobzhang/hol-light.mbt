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
call = ("inspect(\n    log.buf.to_string(),\n    content=(\n" + body +
        "\n    ),\n  )")
src = open(test).read()
# Either the bare call or a previously embedded one (which ends with the
# `    ),\n  )` produced above; `#|` lines never contain that sequence).
pattern = (r"inspect\(log\.buf\.to_string\(\)\)"
           r"|inspect\(\n    log\.buf\.to_string\(\),\n    content=\(\n"
           r"(?:      #\|[^\n]*\n)*    \),\n  \)")
src, n = re.subn(pattern, lambda m: call, src, count=1)
assert n == 1, "no inspect(log.buf.to_string()) call found"
open(test, "w").write(src)
