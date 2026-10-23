"""Adapt upstream notation and the universal constant's name for comparison.

The upstream kernel still runs on its original source. Temporary parser and
printer copies normalize the spelling at their boundaries. The Boolean theory
copy omits the now-redundant forall alias. Serialized terms
are compared modulo the explicit constant rename; all other structure is kept.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from hol_notation import forall_notation, upstream_notation


def escaped_notation(text):
    def unescape(match):
        c = match[0][1:]
        return chr(int(c)) if c.isdigit() else {
            'n': '\n', 'r': '\r', 't': '\t', 'b': '\b', '\\': '\\', '"': '"',
        }.get(c, c)
    # String.escaped encodes UTF-8 bytes as decimal escapes. Decode them before
    # scanning so existing readable-proof symbols such as ∃! stay intact.
    decoded = re.sub(r'\\(?:[0-9]{3}|.)', unescape, text).encode('latin1').decode(
        'utf-8', errors='surrogateescape')
    converted = forall_notation(decoded)
    if converted == decoded:
        return text
    return ''.join({
        10: '\\n', 13: '\\r', 9: '\\t', 8: '\\b', 92: '\\\\', 34: '\\"',
    }.get(c, chr(c) if 32 <= c <= 126 else '\\%03d' % c)
        for c in converted.encode('utf-8', errors='surrogateescape'))


def adapt_output(lines):
    trace = False
    cases = (Path(__file__).parent / 'parse_cases.txt').read_text().splitlines()
    labels = [(upstream_notation(s), s) for s in cases if s.startswith(('T: ', 'Y: '))]
    labels.sort(key=lambda pair: -len(pair[0]))
    for line in lines:
        if re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            trace = True
        elif trace and line.startswith('  '):
            line = '  ' + escaped_notation(line[2:].rstrip('\n')) + '\n'
        else:
            trace = False
        if line.startswith('binders = '):
            words = line[10:].split()
            # forall now occupies the original canonical binder's position.
            if '!' in words:
                words = ['forall' if w == '!' else w for w in words if w != 'forall']
            line = 'binders = ' + ' '.join(words) + '\n'
        elif line.startswith('constants = '):
            line = 'constants = ' + ' '.join(
                'forall' if w == '!' else w for w in line[12:].split()) + '\n'
        elif line.startswith(('T: ', 'Y: ')):
            # Only the input label changes. Never rewrite serialized terms or
            # exception separators in the oracle result after the label.
            for old, new in labels:
                if line.startswith(old + ' '):
                    line = new + line[len(old):]
                    break
        yield line


# Type variables the port names differently from upstream: type variables are
# capitalized, as MoonBit's type parameters are (issue #140). Each file listed
# is loaded from a copy with these names replaced in its quotations' type
# annotations (rename_type_variables).
TYPE_RENAMES = {
    '100/friendship.ml': {'person': 'Person'},
    'Unity/mk_state_logic.ml': {"'a": 'A', "'b": 'B', "'c": 'C'},
    'Unity/mk_unless.ml': {"'a": 'A'},
    'Unity/mk_ensures.ml': {"'a": 'A'},
    'Unity/mk_leadsto.ml': {"'a": 'A'},
    'Unity/mk_comp_unity.ml': {"'a": 'A'},
}


def renamed_copy(path):
    return '_build/renamed/' + path


def reference_source(source):
    """Route core loads to the temporary copies without editing upstream."""
    for path in TYPE_RENAMES:
        source = source.replace(f'#use "{path}"', f'#use "{renamed_copy(path)}"')
    return source.replace('#use "printer.ml"', '#use "_build/printer_forall.ml"').replace(
        '#use "bool.ml"', '#use "_build/bool_forall.ml"').replace(
        '#use "parser.ml"', '#use "_build/parser_forall.ml"')


HOL_NAME = re.compile(r"[A-Za-z0-9_']+")


def type_annotation_end(q, i):
    """End of the type annotation starting at q[i] (just after a `:`): atoms,
    parenthesized lists and postfix constructors, joined by `->`, `#`, `+`
    or `^`. It may stop early, never late, so a name it misses fails the
    copy rather than being renamed in a term."""
    while True:
        while i < len(q) and q[i] == ' ':
            i += 1
        if q.startswith('(', i):
            depth = 0
            for j in range(i, len(q)):
                depth += {'(': 1, ')': -1}.get(q[j], 0)
                if depth == 0:
                    break
            else:
                return i
            i = j + 1
        else:
            m = HOL_NAME.match(q, i)
            if not m:
                return i
            i = m.end()
        while m := HOL_NAME.match(q, i):  # postfix constructors: (A)list
            i = m.end()
        j = i
        while j < len(q) and q[j] == ' ':
            j += 1
        for op in ('->', '#', '+', '^'):
            if q.startswith(op, j):
                i = j + len(op)
                break
        else:
            return i


def rename_in_quotation(q, renames):
    out, i = [], 0
    while (k := q.find(':', i)) >= 0:
        end = type_annotation_end(q, k + 1)
        out.append(q[i:k + 1])
        out.append(HOL_NAME.sub(lambda m: renames.get(m[0], m[0]), q[k + 1:end]))
        i = end if end > k + 1 else k + 1
    out.append(q[i:])
    return ''.join(out)


def ocaml_segments(text):
    """`text` cut into (kind, piece): 'comment' (nested `(* *)`), 'string',
    'quotation' (backquoted) and 'code'."""
    out, i, start = [], 0, 0
    def emit(kind, j):
        nonlocal start
        if j > start:
            out.append((kind, text[start:j]))
        start = j
    while i < len(text):
        if text.startswith('(*', i):
            emit('code', i)
            depth = 0
            while i < len(text):
                if text.startswith('(*', i):
                    depth, i = depth + 1, i + 2
                elif text.startswith('*)', i):
                    depth, i = depth - 1, i + 2
                    if depth == 0:
                        break
                else:
                    i += 1
            emit('comment', i)
        elif text[i] in '"`':
            emit('code', i)
            close, i = text[i], i + 1
            while i < len(text) and text[i] != close:
                i += 2 if close == '"' and text[i] == '\\' else 1
            i += 1
            emit('string' if close == '"' else 'quotation', i)
        else:
            i += 1
    emit('code', len(text))
    return out


def rename_type_variables(text, renames):
    """`text` (OCaml) with the type variables `renames` maps renamed in the
    type annotations of its quotations. Any other occurrence of an old name
    outside comments, in a quotation's term or in OCaml code or strings
    (`mk_vartype "'a"`), fails: those need adapting by hand."""
    def occurs(name, pieces):
        return any(re.search(r"(?<![A-Za-z0-9_'])" + re.escape(name) + r"(?![A-Za-z0-9_'])", piece)
                   for kind, piece in pieces if kind != 'comment')
    segments = ocaml_segments(text)
    for new in renames.values():
        # a new name already in use would merge two type variables
        assert not occurs(new, segments), f'{new} is already used'
    segments = [(kind, rename_in_quotation(piece, renames) if kind == 'quotation' else piece)
                for kind, piece in segments]
    for old in renames:
        assert not occurs(old, segments), f'{old} occurs outside a type annotation'
    return ''.join(piece for kind, piece in segments)


def prepare():
    root = Path(__file__).resolve().parents[2]
    ref = root / 'tools/ocaml_ref'
    (ref / '_build').mkdir(exist_ok=True)
    printer = (root / '.repos/hol-light/printer.ml').read_text()
    patches = [
        ('let reverse_interface (s0,ty0) =\n',
         'let reverse_interface (s0,ty0) =\n    let spelling = if s0 = "!" then "forall" else s0 in\n'),
        ('if not(!reverse_interface_mapping) then s0 else',
         'if not(!reverse_interface_mapping) then spelling else'),
        ('with Failure _ -> s0 in', 'with Failure _ -> spelling in'),
        ('(fun n  -> mem n (!binder_list)),',
         '(fun n  -> mem n (!binder_list) || n = "forall" && mem "!" (!binder_list)),'),
    ]
    for old, new in patches:
        assert printer.count(old) == 1, 'upstream printer changed: ' + old
        printer = printer.replace(old, new)
    (ref / '_build/printer_forall.ml').write_text(printer)
    # Upstream theories sometimes already spell the binder `forall`. Resolve it
    # directly to the upstream canonical constant, just as the port now does,
    # rather than retaining the alias and its extra type-inference allocations.
    parser = (root / '.repos/hol-light/parser.ml').read_text()
    entry = '  (fun inp ->\n    match inp with\n'
    assert parser.count(entry) == 1, 'upstream term parser changed'
    parser = parser.replace(entry, '  (fun inp ->\n'
        '    let inp = map (function Ident "forall" -> Ident "!" | tok -> tok) inp in\n'
        '    match inp with\n')
    (ref / '_build/parser_forall.ml').write_text(parser)
    boolean = (root / '.repos/hol-light/bool.ml').read_text()
    alias = '  override_interface("forall",`(!):(A->bool)->bool`);\n'
    assert boolean.count(alias) == 1, 'upstream forall alias changed'
    (ref / '_build/bool_forall.ml').write_text(boolean.replace(alias, ''))
    for path, renames in TYPE_RENAMES.items():
        copy = ref / renamed_copy(path)
        copy.parent.mkdir(parents=True, exist_ok=True)
        copy.write_text(rename_type_variables(
            (root / '.repos/hol-light' / path).read_text(), renames))
    (ref / '_build/parse_cases_legacy.txt').write_text(
        ''.join(upstream_notation(line) for line in
                (ref / 'parse_cases.txt').read_text().splitlines(keepends=True)))


if __name__ == '__main__':
    if sys.argv[1:] == ['--prepare']:
        prepare()
    elif sys.argv[1:2] == ['--source']:
        sys.stdout.write(reference_source(''.join(Path(p).read_text() for p in sys.argv[2:])))
    else:
        sys.stdout.writelines(adapt_output(sys.stdin))
