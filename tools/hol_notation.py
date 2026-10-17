"""Source migration for HOL's universal-quantifier spelling.

This is build-time tooling, not an alternative parser accepting legacy input.
The scanner follows HOL's maximal symbolic/alphanumeric tokens, including
underscore tails. Quoted HOL strings and line comments are copied verbatim.
"""
import re

ALNUM = "'abcdefghijklmnopqrstuvwxyz_ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
SYMBOL = "\\!@#$%^&*-+|<=>/?~.:"
IDENT = re.compile(r"(?:_+(?:[A-Za-z'0-9]+|[\\!@#$%^&*+|<=>/?~.:\-]+)?|[A-Za-z'0-9]+|[\\!@#$%^&*+|<=>/?~.:\-]+)(?:_+(?:[A-Za-z'0-9]+|[\\!@#$%^&*+|<=>/?~.:\-]+)?)*")


def _notation(text, old, new):
    result = []
    i = 0
    while i < len(text):
        start = i
        if text.startswith("∃!", i):
            result.append("∃!")
            i += 2
            continue
        if text[i] == '"':
            i += 1
            while i < len(text):
                if text[i] == "\\":
                    i += 2
                elif text[i] == '"':
                    i += 1
                    break
                else:
                    i += 1
            result.append(text[start:i])
            continue
        token = IDENT.match(text, i)
        if token:
            word = token[0]
            i = token.end()
            if word == "//":
                end = text.find("\n", i)
                i = len(text) if end < 0 else end
                result.append(text[start:i])
            elif word == old:
                if (new[0] in ALNUM or new == "∀") and start and text[start - 1] in ALNUM:
                    result.append(" ")
                result.append(new)
                if (new[-1] in ALNUM or new == "∀") and i < len(text) and text[i] in ALNUM:
                    result.append(" ")
            else:
                result.append(word)
        else:
            if text[i] == old:
                if start and text[start - 1] in SYMBOL:
                    result.append(" ")
                result.append(new)
                if i + 1 < len(text) and (text[i + 1] in SYMBOL or text[i + 1] == old):
                    result.append(" ")
            else:
                result.append(text[i])
            i += 1
    return "".join(result)

def universal_notation(text):
    """Replace the standalone HOL token !, preserving all other input."""
    return _notation(_notation(text, "!", "∀"), "forall", "∀")


def upstream_notation(text):
    """Adapt input to the upstream oracle, which still uses ! notation."""
    return _notation(text, "∀", "!")


# The translator emits ordinary calls, including quotations expanded by pa_j.
# HOL-input strings and references to the renamed constant are migrated.
# Diagnostic strings and external-program data are not.
HOL_INPUTS = {
    '@parser.parse_term', '@parser.parse_type', '@lexer.lex',
    '@theorems.intro_tac', '@readable.parse_qproof', '@miz3.parse_qproof',
    'parse_qproof', 'parse_term_v1', 'inner_space_prove', 'full_inner_space_prove',
    '@miz2a.have', '@miz2a.theorem', '@miz2a.otherwise', '@miz2a.from',
    '@q.subgoal_then',
}
CONSTANT_NAMES = {
    '@kernel.mk_const', '@kernel.mk_mconst', '@kernel.new_constant',
    '@kernel.Const', '@kernel.Term::Const', '@basics.mk_mconst',
    '@basics.mk_binder', '@basics.is_binder', '@basics.dest_binder',
    'universalname_c.set', 'exclude_list_c.set',
}
SOURCE_TOKEN = re.compile(r'//[^\n]*|^[ \t]*[#\$]\|[^\n]*|"(?:\\.|[^"\\])*"|(?:@?[A-Za-z_][\w.:]*|[()\[\]{}])', re.M)


def rewrite_embedded_terms(text):
    # Proof scripts/exec-phrase keys can contain OCaml calls with HOL strings.
    # A HOL string literal by itself is still opaque to universal_notation.
    import json
    def term(match):
        value = json.loads(match[2])
        return match[1] + json.dumps(universal_notation(value), ensure_ascii=False)
    return re.sub(r'(\bparse_term\s+)("(?:\\.|[^"\\])*")', term, text)


def rewrite_moonbit(source):
    """Migrate generated HOL inputs and universal-constant references."""
    import json
    stack = []
    previous = ''
    end = 0
    result = []
    for match in SOURCE_TOKEN.finditer(source):
        token = match[0]
        if token.startswith('//') or token.lstrip().startswith(('#|', '$|')):
            continue
        replacement = token
        if token == '(':
            stack.append(previous)
        elif token in '[{':
            stack.append('')
        elif token in ')]}':
            if stack:
                callee = stack.pop()
                if token == ')':
                    previous = callee
                    result.extend((source[end:match.start()], token))
                    end = match.end()
                    continue
        elif token.startswith('"') and ('!' in token or 'forall' in token):
            try:
                text = json.loads(token)
            except ValueError:
                text = None
            if text is not None:
                migrated = text
                if any(name in HOL_INPUTS for name in stack):
                    migrated = universal_notation(text)
                    if any('parse_qproof' in name for name in stack):
                        migrated = rewrite_embedded_terms(migrated)
                elif stack and stack[-1] == '@lib.register_phrase':
                    migrated = rewrite_embedded_terms(text)
                elif text == '!' and (any(name in CONSTANT_NAMES for name in stack) or
                        re.match(r'\s*=>\s*forall_ctximpm?conv\b', source[match.end():])):
                    migrated = '∀'
                elif text == '!' and stack and stack[-1] in {
                    '@printer.parse_as_binder', '@printer.unparse_as_binder',
                    '@lexer.Ident', '@lexer.Lexcode::Ident',
                }:
                    migrated = '∀'
                elif text == 'move: not (!) or (==>)':
                    migrated = 'move: not (∀) or (==>)'
                if text != migrated:
                    replacement = json.dumps(migrated, ensure_ascii=False)
        result.extend((source[end:match.start()], replacement))
        end = match.end()
        previous = token
    result.append(source[end:])
    migrated = ''.join(result)
    # Miz3 has a separate layout-preserving lexer over exploded characters.
    # Recognize the canonical symbol there too, without changing literal or
    # comment handling in its existing token parser.
    migrated = re.sub(
        r'(pub fn rawtoken\((\w+) : @list.List\[String\]\)[^\n]*\{\n)'
        r'  \(rawtoken_c.get\(\)\)\(\2\)\n}',
        lambda m: m[1] + '  match ' + m[2] + ' {\n'
            '    More("∀", tail=rest) => ("∀", rest)\n'
            '    _ => (rawtoken_c.get())(' + m[2] + ')\n  }\n}',
        migrated)
    # Rqe/util's suppressed constants are names, not proof labels or messages.
    migrated = re.sub(r'(suppress\(\)\.val = @list.List\(\[)([^\]]*)(\]\))',
                  lambda m: m[1] + m[2].replace('"!"', '"∀"') + m[3], migrated)

    # Jordan proof scripts select assumptions by precomputed term hashes. Keep
    # the universal constant's symbol code stable across its spelling change.
    # Match only the constant arm of Jordan's custom hash, not string/var hashes.
    return re.sub(
        r'(@kernel.Term::Const\((\w+), (\w+)\) => \{\n)'
        r'(        let \w+ = hash_of_type\(\3\)\n)'
        r'(        @lib.mod63\(@lib.add63\(@lib.mul63\(\w+, )memhash_of_string\(\2\)',
        lambda m: m[1] + m[4] +
            '        // Stable symbol code used by existing Jordan proof labels.\n' +
            '        let symbol_hash = if ' + m[2] +
            ' == "∀" { 33L } else { memhash_of_string(' + m[2] + ') }\n' +
            m[5] + 'symbol_hash', migrated)


if __name__ == '__main__':
    import sys
    from pathlib import Path
    for name in sys.argv[1:]:
        path = Path(name)
        source = path.read_text()
        migrated = rewrite_moonbit(source)
        if path.name == 'readable.mbt':
            migrated = migrated.replace('("∀", "!"), ', '')
        if migrated != source:
            path.write_text(migrated)

