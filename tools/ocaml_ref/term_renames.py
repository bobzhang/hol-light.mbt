"""Rename term variables the term syntax cannot write (issue #140).

Some upstream theories name variables like MoonBit keywords (fn, enum, as,
...). The port renames them, keyword to keyword_ (fn -> fn_), in its sources
and in a copy of the upstream file the OCaml reference loads (as
TYPE_RENAMES does for type variables, forall_reference.py), and
check_term_renames.py checks that the reference output changes only by
those names.

A rename maps a stem and its primed variants: fn, fn', fn'' become fn_,
fn_', fn_'' (HOL's variant() adds primes to avoid capture, so a family is
renamed whole). Only term-variable occurrences are renamed: names in HOL
quotations outside type annotations and HOL strings, and the variable-name
string of the callees in NAME_CALLEES. An assumption label (LABEL_TAC
"fn") is another namespace and stays. Anything else naming an old variable
fails, as does a new name already in use anywhere: those need a look.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from hol_notation import IDENT

# upstream file -> {old stem: new stem}
TERM_RENAMES = {
    'Logic/linear.ml': {'final': 'final_'},
}
# upstream file -> [(text, replacement)], each text occurring once, applied
# before the rename (for a name built in code)
TERM_PATCHES = {
}
# callees whose string argument names a term variable, upstream and port
NAME_CALLEES = ('EXPAND_TAC', '@simp.expand_tac')
# callees whose string argument is an assumption label
LABEL_CALLEES = ('LABEL_TAC', 'USE_THEN', 'REMOVE_THEN', 'ASSUME_TAC', 'FIND_ASSUM',
                 '@tactics.label_tac', '@tactics.use_then', '@tactics.remove_then')


def renamed(name, renames):
    """`name` under `renames`, by stem (fn' -> fn_'), or None."""
    stem = name.rstrip("'")
    return renames[stem] + name[len(stem):] if stem in renames else None


def check_renames(renames):
    news = list(renames.values())
    assert len(set(news)) == len(news), 'the renaming is not injective'
    for new in news:
        stem = new.rstrip("'")
        assert stem not in renames and new == stem, f'{new}: a new name must be a fresh stem'


def hol_spans(q):
    """(start, end, kind) for the HOL quotation text q: 'name' tokens (HOL's
    maximal tokens), 'string' literals and 'comment's (// to the end of
    the line)."""
    i = 0
    while i < len(q):
        if q[i] == '"':
            j = i + 1
            while j < len(q) and q[j] != '"':
                j += 2 if q[j] == '\\' else 1
            yield i, j + 1, 'string'
            i = j + 1
            continue
        if q.startswith('//', i):
            j = q.find('\n', i)
            j = len(q) if j < 0 else j
            yield i, j, 'comment'
            i = j
            continue
        m = IDENT.match(q, i)
        if m:
            yield i, m.end(), 'name'
            i = m.end()
        else:
            i += 1


def annotation_ranges(q, renames):
    """The type annotations in q, as HOL reads them (the strict scan: an
    old name the generous one reaches, as in p:A prob_space fn, is a term;
    one in a type position would not parse once renamed)."""
    from forall_reference import annotation_colons, type_annotation_end
    # newlines and tabs separate the parts of a type as spaces do
    flat = re.sub(r'[\n\t\r]', ' ', q)
    return [(k + 1, type_annotation_end(flat, k + 1, renames)) for k in annotation_colons(flat)]


def rename_in_hol(q, renames):
    """Quotation text q with its term variables renamed. A name to rename
    inside a type annotation fails."""
    out, last = [], 0
    ranges = None
    for start, end, kind in hol_spans(q):
        if kind != 'name':
            continue
        new = renamed(q[start:end], renames)
        if new is None:
            continue
        if ranges is None:
            # the scan does not read HOL comments, whose brackets mislead it
            assert '//' not in q, f'a HOL comment in a quotation naming a renamed variable: {q[:60]!r}'
            ranges = annotation_ranges(q, renames)
        assert not any(a <= start < b for a, b in ranges), \
            f'{q[start:end]} in a type annotation: {q[:60]!r}'
        out.append(q[last:start])
        out.append(new)
        last = end
    out.append(q[last:])
    return ''.join(out)


def hol_names(q):
    """The names in q, both as HOL's maximal tokens and as runs of
    alphanumerics (fn_:bool is fn_, :, bool; the scan errs on the side of
    seeing a name), outside HOL strings and comments."""
    names = []
    for s, e, kind in hol_spans(q):
        if kind == 'name':
            names.append(q[s:e])
            names += re.findall(r"[A-Za-z0-9_']+", q[s:e])
    return names


def uses(names, renames, new=False):
    """The names among `names` in an old family (or, with new, a new one)."""
    if new:
        stems = {n.rstrip("'") for n in renames.values()}
        return [n for n in names if n.rstrip("'") in stems]
    return [n for n in names if renamed(n, renames) is not None]


def string_value(piece):
    """An OCaml string, quoted string or character literal's value."""
    from forall_reference import ocaml_unescaped
    if piece.startswith('{'):
        return piece[piece.index('|') + 1:piece.rindex('|')]
    v = ocaml_unescaped(piece[1:-1])
    return re.sub(r'\\(.)', lambda m: {'n': '\n', 't': '\t', 'r': '\r', 'b': '\b'}.get(m[1], m[1]), v)


def callee_before(text, i):
    m = re.search(r'([@A-Za-z_][\w.@]*)\s*\(?\s*$', text[max(0, i - 80):i])
    return m[1] if m else ''


def rename_ocaml(text, renames, patches=()):
    """Upstream OCaml source with its term variables renamed."""
    from forall_reference import ocaml_segments
    check_renames(renames)
    for kind, piece in ocaml_segments(text):
        if kind == 'quotation':
            names = hol_names(piece[1:-1])
        elif kind == 'string':
            names = [string_value(piece)]
        elif kind == 'code':
            names = []
        else:
            continue
        assert not uses(names, renames, new=True), f'a new name is already used: {piece[:60]!r}'
    # patches go in after that check, which they would fail
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    segments = ocaml_segments(text)
    out, at = [], 0
    for kind, piece in segments:
        start, at = at, at + len(piece)
        if kind == 'quotation' and not piece.endswith(':`'):
            piece = '`' + rename_in_hol(piece[1:-1], renames) + '`'
        elif kind == 'string' and renamed(string_value(piece), renames) is not None:
            assert string_value(piece) == piece[1:-1], f'an escaped string names a renamed variable: {piece}'
            callee = callee_before(text, start)
            if callee in NAME_CALLEES:
                piece = '"' + renamed(piece[1:-1], renames) + '"'
            else:
                assert callee in LABEL_CALLEES, f'string {piece} after {callee!r}: rename by a patch'
        elif kind == 'quotation':
            assert not uses(hol_names(piece[1:-2]), renames), f'old name in a type quotation {piece[:60]!r}'
        out.append(piece)
    return ''.join(out)


MBT_STRING = re.compile(r'"((?:[^"\\\n]|\\.)*)"')


def mbt_unescape(s):
    return re.sub(r'\\(u\{[0-9a-fA-F]+\}|.)', lambda m: chr(int(m[1][2:-1], 16)) if m[1].startswith('u{')
                  else {'n': '\n', 't': '\t', 'r': '\r', 'b': '\b', '\\': '\\', '"': '"', "'": "'"}[m[1]], s)


def mbt_escape(s):
    return ''.join({'\n': '\\n', '\t': '\\t', '\r': '\\r', '\b': '\\b', '\\': '\\\\', '"': '\\"'}.get(c, c) for c in s)


def rename_moonbit(text, renames):
    """A MoonBit source with its term variables renamed: in old-syntax
    quotations, and in the name strings of NAME_CALLEES. A term-syntax
    quotation naming an old or new variable fails (the term syntax cannot
    spell the old names; a new one would merge)."""
    check_renames(renames)
    out, last = [], 0
    for m in MBT_STRING.finditer(text):
        body = mbt_unescape(m[1])
        callee = callee_before(text, m.start())
        if callee == '@parser.parse_term':
            names = hol_names(body)
            assert not uses(names, renames, new=True), f'a new name is already used: {body[:60]!r}'
            new = mbt_escape(rename_in_hol(body, renames))
        elif callee == '@term_syntax.parse_term':
            names = re.findall(r"[A-Za-z_][A-Za-z0-9_]*'*", body)
            assert not uses(names, renames) and not uses(names, renames, new=True), \
                f'a term-syntax quotation names a renamed variable: {body[:60]!r}'
            continue
        elif renamed(body, renames) is not None:
            if callee in NAME_CALLEES:
                new = renamed(body, renames)
            else:
                assert callee in LABEL_CALLEES, f'string "{body}" after {callee!r}: rename by hand'
                continue
        else:
            assert not uses([body], renames, new=True), f'string "{body}" is a new name'
            continue
        out.append(text[last:m.start(1)])
        out.append(new)
        last = m.end(1)
    out.append(text[last:])
    return ''.join(out)


def decode_escaped(s):
    """OCaml's String.escaped, undone (trace lines are printed so)."""
    def one(m):
        c = m[0][1:]
        return chr(int(c)) if c.isdigit() else {'n': '\n', 'r': '\r', 't': '\t', 'b': '\b',
                                                 '\\': '\\', '"': '"', "'": "'"}.get(c, c)
    return re.sub(r'\\(?:[0-9]{3}|.)', one, s).encode('latin1').decode('utf-8', errors='surrogateescape')


def encode_escaped(s):
    return ''.join({10: '\\n', 13: '\\r', 9: '\\t', 8: '\\b', 92: '\\\\', 34: '\\"'}.get(
        c, chr(c) if 32 <= c <= 126 else '\\%03d' % c) for c in s.encode('utf-8', errors='surrogateescape'))


# a variable in structural output (prelude.ml's stm): name and primes, then
# its type; a constant has a # before its name, a type variable a quote
def structural_variable(renames):
    stems = '|'.join(map(re.escape, sorted(renames, key=len, reverse=True)))
    return re.compile(r"(?<=[(\\ ])(" + stems + r")('*)(?=:)")


def renamed_output(output, target, renames):
    """Reference output with the term variables of `target`'s quotations
    and theorems renamed: from the line that opens its quotation trace on,
    trace lines as the sources are renamed, and variables in structural
    output. Lines before it come from other files and stay."""
    header = target + ' quotations ('
    var = structural_variable(renames)
    out, scope, trace = [], False, False
    for line in output.splitlines(keepends=True):
        if line.startswith(header):
            scope = trace = True
            out.append(line)
            continue
        if not scope:
            out.append(line)
            continue
        if trace and line.startswith('  '):
            body = line[2:].rstrip('\n')
            out.append('  ' + encode_escaped(rename_in_hol(decode_escaped(body), renames)) + '\n')
            continue
        trace = False
        # a theorem the script prints (NAME = ...); failures and other
        # lines must not change
        out.append(var.sub(lambda m: renames[m[1]] + m[2], line) if re.match(r'\S+ = ', line) else line)
    return ''.join(out)
