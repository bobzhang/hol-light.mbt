"""Renames of HOL constants and type constants the term syntax cannot name.

The port names them differently from upstream (issue #140):

- Jordan's local definitions (Jordan/lib_ext.ml's local_definition) are
  constants named package'name (euclid'dot, jordan'top2). They become
  package_name (euclid_dot, jordan_top2): local_definition joins with `_`.

Each listed upstream file is loaded from a copy (forall_reference.py,
unless HOL_REF_ORIGINAL_NAMES is set) built by its checked patches (each
text must occur once) and by renaming the old names in its quotations;
any old name left outside comments, or a new name already used in the
file, fails the copy. check_name_renames.py checks that OCaml's output
changes by exactly these names, which are global: every whole HOL name.
"""
import re

from term_renames import decode_escaped, encode_escaped, hol_spans

LOCAL_DEFINITION = re.compile(r"(euclid|trig|jordan)'([A-Za-z0-9_]+'*)")

NAME_PATCHES = {
    'Jordan/lib_ext.ml': [
        # a package name has no _, so package_name splits one way only
        ('let cname\' = package_name^"\'"^cname in',
         'let cname\' = if String.contains package_name \'_\' then failwith "local_definition: a package name with _" '
         'else package_name^"_"^cname in'),
        # each constant's upstream name, for tactics_fix's hash_of_term
        ('let local_definition package_name tm =',
         'let local_upstream_names = Hashtbl.create 300;;\n\nlet local_definition package_name tm ='),
        ("  let _ = (local_defs := (package_name,(cname,lv'))::(!local_defs)) in",
         "  let _ = (local_defs := (package_name,(cname,lv'))::(!local_defs)) in\n"
         "  let _ = Hashtbl.replace local_upstream_names cname' (package_name^\"'\"^cname) in"),
    ],
    # Jordan's proofs pick hypotheses by hash numbers (UNDH 3313), which
    # hash_of_term computes from constants' names: it hashes a local
    # definition under its upstream name, as the port's does
    'Jordan/tactics_fix.ml': [
        ('(prime220*(memhash_of_string s) + hash_of_type t) mod prime1220',
         '(prime220*(memhash_of_string (try Hashtbl.find local_upstream_names s with Not_found -> s))'
         ' + hash_of_type t) mod prime1220'),
    ],
    'Jordan/misc_defs_and_lemmas.ml': [],
}

HOL_TOKEN = re.compile(r"[A-Za-z0-9_']+")


def renamed_name(name):
    """The new name of the constant or type constant `name`, or None."""
    if m := LOCAL_DEFINITION.fullmatch(name):
        return m[1] + '_' + m[2]
    return None


def rename_tokens(text):
    """`text` with every whole HOL name that is renamed replaced."""
    return HOL_TOKEN.sub(lambda m: renamed_name(m[0]) or m[0], text)


def rename_hol(q, op=False):
    """The HOL (or, with `op`, term-syntax) quotation text q with its renamed
    names replaced: names only, not string literals or comments (a string
    "euclid'dot" is data). With `op`, an op_ spelling of a renamed name too."""
    out, last = [], 0
    for start, end, kind in hol_spans(q):
        if kind != 'name':
            continue
        name = q[start:end]
        new = renamed_name(op_unescaped(name)) if op and OP_NAME.fullmatch(name) else None
        out.append(q[last:start])
        out.append(new or renamed_name(name) or name)
        last = end
    out.append(q[last:])
    return ''.join(out)


def hol_names(q):
    """The names in HOL quotation text (not its strings or comments)."""
    return [q[s:e] for s, e, kind in hol_spans(q) if kind == 'name']


def old_names(text):
    return {t for t in HOL_TOKEN.findall(text) if renamed_name(t)}


def rename_names(text, patches):
    """An upstream file's renamed copy: `patches` applied, then the renamed
    names replaced in its quotations. Fails on an old name left outside
    comments, and on a new name the file already uses."""
    from forall_reference import checked_segments
    segments = checked_segments(text)
    used = {t for kind, piece in segments if kind != 'comment' for t in HOL_TOKEN.findall(piece)}
    for t in old_names(' '.join(piece for kind, piece in segments if kind == 'quotation')):
        assert renamed_name(t) not in used, f'{renamed_name(t)} is already used'
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    out = []
    for kind, piece in checked_segments(text):
        piece = piece.split('\0')[0] if kind == 'string' else piece
        out.append(rename_hol(piece) if kind == 'quotation' else piece)
    text = ''.join(out)
    left = old_names(' '.join(p for k, p in checked_segments(text) if k != 'comment'))
    assert not left, f'old names left outside quotations: {sorted(left)[:5]}'
    return text


# The names of constants and type constants in output check_name_renames.py
# makes (HOL_REF_QUOTED_NAMES, prelude.ml): the results of the script's
# probes (NAME = ...) write them #"name" (escaped), a variable "name" and a
# type variable '"name"; and its constants and types lines list them (name,
# name/arity). A variable or type variable is no such name, nor is text in
# any other line (a failure's message, NAME ! ...): renaming one is a
# difference. Quotation traces are text, renamed as the sources are.
MARKED_NAME = re.compile(r'#"((?:[^"\\]|\\.)*)"')
LISTING = re.compile(r'(constants|types) = ')
RESULT = re.compile(r'\S+ = ')


def listed(kind, item):
    """A listing's item: a constant's name, or a type's name/arity."""
    if kind == 'types':
        name, sep, arity = item.rpartition('/')
        return name, sep + arity
    return item, ''


def constant_names(line):
    """The constants' and type constants' names in a line of output."""
    if m := LISTING.match(line):
        return [listed(m[1], item)[0] for item in line[m.end():].split()]
    if RESULT.match(line):
        return [decode_escaped(n) for n in MARKED_NAME.findall(line)]
    return []


def rename_structural(line):
    if m := LISTING.match(line):
        def item(it):
            name, rest = listed(m[1], it)
            return (renamed_name(name) or name) + rest
        return line[:m.end()] + ' '.join(item(it) for it in line[m.end():].rstrip('\n').split(' ')) + \
            ('\n' if line.endswith('\n') else '')
    if not RESULT.match(line):
        return line
    def one(m):
        new = renamed_name(decode_escaped(m[1]))
        return '#"' + encode_escaped(new) + '"' if new else m[0]
    return MARKED_NAME.sub(one, line)


def renamed_output(output):
    """Reference output (made with HOL_REF_QUOTED_NAMES) with the names
    renamed: trace lines (OCaml-escaped quotation text) decoded first and
    renamed as the sources are; every other line in its constants' and type
    constants' names only. A quotation's text does not say which of its names
    are constants: a free variable spelt like a renamed constant would be
    renamed in the copies and here alike, and differ only in a theorem the
    script prints (in the files renamed, every such name is the constant)."""
    out, trace = [], False
    for line in output.splitlines(keepends=True):
        if re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            trace = True
        elif trace and line.startswith('  '):
            out.append('  ' + encode_escaped(rename_hol(decode_escaped(line[2:].rstrip('\n')))) + '\n')
            continue
        else:
            trace = False
        out.append(rename_structural(line))
    return ''.join(out)


# The port: the term syntax spells a renamed constant op_<package>_prime_...
# (names.mbt's escape), which becomes the plain new name.
CHAR_NAMES = {'dollar': '$', 'dot': '.', 'eq': '=', 'lt': '<', 'gt': '>', 'at': '@', 'q': '?',
              'bang': '!', 'pct': '%', 'amp': '&', 'bar': '|', 'tilde': '~', 'star': '*',
              'plus': '+', 'minus': '-', 'slash': '/', 'bslash': '\\', 'caret': '^', 'hash': '#',
              'prime': "'", 'colon': ':', 'comma': ',', 'us': '_'}
OP_NAME = re.compile(r'(?<![A-Za-z0-9_])op_[A-Za-z0-9_]+')


def op_unescaped(ident):
    return ''.join(CHAR_NAMES.get(p, p) for p in ident[3:].split('_'))


def rename_term_syntax(q):
    """A term-syntax quotation with renamed constants' op_ spellings, and
    any old name, replaced by the new name (not in its strings)."""
    return rename_hol(q, op=True)


MBT_CALL = re.compile(r'(@(parser|term_syntax)\.parse_(term|type)\(")((?:[^"\\\n]|\\.)*)("\))')


def rename_moonbit(text, patches=()):
    """A port source with the names renamed in its quotations (old syntax:
    HOL names; term syntax: op_ spellings too) and `patches` applied. Fails
    on an old name left in any string."""
    from term_renames import mbt_escape, mbt_unescape
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    def call(m):
        body = mbt_unescape(m[4])
        body = rename_term_syntax(body) if m[2] == 'term_syntax' else rename_hol(body)
        return m[1] + mbt_escape(body) + m[5]
    text = MBT_CALL.sub(call, text)
    for s in re.findall(r'"((?:[^"\\\n]|\\.)*)"', text):
        body = mbt_unescape(s)
        assert not old_names(body), f'old name left in a string: {sorted(old_names(body))[:3]}'
        assert not [o for o in OP_NAME.findall(body) if renamed_name(op_unescaped(o))], \
            f'op_ spelling of an old name left: {s[:80]}'
    return text
