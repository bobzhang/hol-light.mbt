"""Adapt the upstream oracle's surface notation, never its theorem terms.

The upstream kernel and parser still run on their original sources. A temporary
copy of the printer changes only the displayed universal-quantifier spelling;
this lets OCaml's formatter independently check wrapping/parenthesization too.
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
            # Verbose mode already has forall; preserve its registration order.
            words = [w for w in words if w != '!'] if 'forall' in words else [
                'forall' if w == '!' else w for w in words]
            line = 'binders = ' + ' '.join(words) + '\n'
        elif line.startswith(('T: ', 'Y: ')):
            # Only the input label changes. Never rewrite serialized terms or
            # exception separators in the oracle result after the label.
            for old, new in labels:
                if line.startswith(old + ' '):
                    line = new + line[len(old):]
                    break
        yield line


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
    (ref / '_build/parse_cases_legacy.txt').write_text(
        ''.join(upstream_notation(line) for line in
                (ref / 'parse_cases.txt').read_text().splitlines(keepends=True)))


if __name__ == '__main__':
    if sys.argv[1:] == ['--prepare']:
        prepare()
    else:
        sys.stdout.writelines(adapt_output(sys.stdin))
