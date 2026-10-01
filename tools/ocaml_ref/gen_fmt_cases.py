#!/usr/bin/env python3
"""Generate random Format documents for the pp/ differential test.

A document is a string of ops, each separated by '|':
  [Kn   open box of kind K (h v H=hv o=hov b=box) with indent n
  ]     close box
  sW,O  break hint (width W, offset O)
  tX    text X
  n     force_newline
Each case also has a margin and a max_boxes setting. Writes
tools/ocaml_ref/fmt_cases.txt (one case per line: margin;max_boxes;doc).
"""
import random

random.seed(20261001)
words = ["a", "bb", "ccc", "dddd", "eeeeeeee", "f", "gg", "(", ")", "==>",
         "/\\", "!x.", "hhhhhhhhhhhhhhhh", "SUC n", "x + y"]

def doc(depth=0, budget=[0]):
    ops = []
    n = random.randint(8, 20) if depth == 0 else random.randint(1, 6)
    for _ in range(n):
        r = random.random()
        if r < 0.3 and depth < 6:
            kind = random.choice("hvHob")
            ops.append("[%s%d" % (kind, random.randint(0, 4)))
            ops.extend(doc(depth + 1))
            ops.append("]")
        elif r < 0.55:
            ops.append("s%d,%d" % (random.choice([0, 1, 1, 1, 2]), random.randint(0, 3)))
        elif r < 0.58:
            ops.append("n")
        else:
            ops.append("t" + random.choice(words))
    return ops

with open("tools/ocaml_ref/fmt_cases.txt", "w") as f:
    for i in range(300):
        margin = random.choice([10, 20, 30, 40, 78])
        maxb = random.choice([100, 100, 100, 3, 5])
        ops = doc()
        f.write("%d;%d;%s\n" % (margin, maxb, "|".join(ops)))
