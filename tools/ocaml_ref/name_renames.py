"""Renames of HOL constants and type constants the term syntax cannot name.

The port names them differently from upstream (issue #140):

- Jordan's local definitions (Jordan/lib_ext.ml's local_definition) are
  constants named package'name (euclid'dot, jordan'top2). They become
  package_name (euclid_dot, jordan_top2): local_definition joins with `_`.
- Geometric algebra's pseudo-finite types (define_pseudo_finite_type n) are
  named '0 .. '4, with constants mk_/dest_auto_define_finite_type_'n. They
  become Zero .. Four, and a larger n keeps its name (the term syntax
  writes a type constant capitalised; zero, one, ... would collide with
  type variables such as Multivariate's `one`).

Each listed upstream file is loaded from a copy (forall_reference.py,
unless HOL_REF_ORIGINAL_NAMES is set) built by its checked patches (each
text must occur once) and by renaming the old names in its quotations;
any old name left outside comments, or a new name already used in the
file, fails the copy. check_name_renames.py checks that OCaml's output
changes by exactly these names, which are global: every whole HOL name.
"""
import re

from term_renames import decode_escaped, encode_escaped

PSEUDO_TYPES = {"'0": 'Zero', "'1": 'One', "'2": 'Two', "'3": 'Three', "'4": 'Four'}
LOCAL_DEFINITION = re.compile(r"(euclid|trig|jordan)'([A-Za-z0-9_]+'*)")
PSEUDO_CONSTANT = re.compile(r"(mk|dest)_auto_define_finite_type_('[0-4])")

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
    'Geometric_Algebra/geometricalgebra.ml': [
        # upstream defines 0 .. 4; a larger n keeps upstream's name
        ('let ns = "\'"^string_of_int n in',
         'let ns = if n <= 4 then List.nth ["Zero";"One";"Two";"Three";"Four"] n '
         'else "\'"^string_of_int n in'),
    ],
    'Geometric_Algebra/quaternions.ml': [],
}

HOL_TOKEN = re.compile(r"[A-Za-z0-9_']+")


def renamed_name(name):
    """The new name of the constant or type constant `name`, or None."""
    if name in PSEUDO_TYPES:
        return PSEUDO_TYPES[name]
    if m := LOCAL_DEFINITION.fullmatch(name):
        return m[1] + '_' + m[2]
    if m := PSEUDO_CONSTANT.fullmatch(name):
        return f'{m[1]}_auto_define_finite_type_{PSEUDO_TYPES[m[2]]}'
    return None


def rename_tokens(text):
    """`text` with every whole HOL name that is renamed replaced."""
    return HOL_TOKEN.sub(lambda m: renamed_name(m[0]) or m[0], text)


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
        out.append(rename_tokens(piece) if kind == 'quotation' else piece)
    text = ''.join(out)
    left = old_names(' '.join(p for k, p in checked_segments(text) if k != 'comment'))
    assert not left, f'old names left outside quotations: {sorted(left)[:5]}'
    return text


# The names of constants and type constants in output check_name_renames.py
# makes (HOL_REF_MARK_TYPE_CONSTANTS, prelude.ml): those marked #, and those
# its constants and types lines list. A variable (name:type) or a type
# variable ('name) is no such name: renaming one is a difference.
MARKED_NAME = re.compile(r"(?<=#)[A-Za-z0-9_']+")
LISTING = re.compile(r'(constants|types) = ')


def constant_names(line):
    """The constants' and type constants' names in a line of output."""
    if LISTING.match(line):
        return HOL_TOKEN.findall(line[line.index('=') + 1:])
    return MARKED_NAME.findall(line)


def rename_structural(line):
    if m := LISTING.match(line):
        return line[:m.end()] + rename_tokens(line[m.end():])
    return MARKED_NAME.sub(lambda m: renamed_name(m[0]) or m[0], line)


def renamed_output(output):
    """Reference output (made with HOL_REF_MARK_TYPE_CONSTANTS) with the
    names renamed: trace lines (OCaml-escaped quotation text) decoded first
    and renamed as the sources are; every other line in its constants' and
    type constants' names only."""
    out, trace = [], False
    for line in output.splitlines(keepends=True):
        if re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            trace = True
        elif trace and line.startswith('  '):
            out.append('  ' + encode_escaped(rename_tokens(decode_escaped(line[2:].rstrip('\n')))) + '\n')
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
    any old name, replaced by the new name."""
    def op(m):
        new = renamed_name(op_unescaped(m[0]))
        return new if new else m[0]
    return rename_tokens(OP_NAME.sub(op, q))


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
        body = rename_term_syntax(body) if m[2] == 'term_syntax' else rename_tokens(body)
        return m[1] + mbt_escape(body) + m[5]
    text = MBT_CALL.sub(call, text)
    for s in re.findall(r'"((?:[^"\\\n]|\\.)*)"', text):
        body = mbt_unescape(s)
        assert not old_names(body), f'old name left in a string: {sorted(old_names(body))[:3]}'
        assert not [o for o in OP_NAME.findall(body) if renamed_name(op_unescaped(o))], \
            f'op_ spelling of an old name left: {s[:80]}'
    return text
