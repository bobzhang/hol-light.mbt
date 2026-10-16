"""Source migration for HOL's universal-quantifier spelling.

This is build-time tooling, not an alternative parser accepting legacy input.
The scanner follows HOL's maximal symbolic/alphanumeric tokens, including
underscore tails. Quoted HOL strings and line comments are copied verbatim.
"""
import re

ALNUM = "'abcdefghijklmnopqrstuvwxyz_ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
SYMBOL = "\\!@#$%^&*-+|<=>/?~.:"
IDENT = re.compile(r"(?:_+(?:[A-Za-z'0-9]+|[\\!@#$%^&*+|<=>/?~.:\-]+)?|[A-Za-z'0-9]+|[\\!@#$%^&*+|<=>/?~.:\-]+)(?:_+(?:[A-Za-z'0-9]+|[\\!@#$%^&*+|<=>/?~.:\-]+)?)*")


def forall_notation(text):
    """Replace the standalone HOL token !, preserving all other input."""
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
            elif word == "!":
                if start and text[start - 1] in ALNUM:
                    result.append(" ")
                result.append("forall")
                if i < len(text) and text[i] in ALNUM:
                    result.append(" ")
            else:
                result.append(word)
        else:
            result.append(text[i])
            i += 1
    return "".join(result)

# The translator emits ordinary calls, including quotations expanded by pa_j.
# Only string arguments in these HOL-input contexts are migrated. Constants,
# diagnostic strings, serialized terms, and external-program data are not.
HOL_INPUTS = {
    '@parser.parse_term', '@parser.parse_type', '@lexer.lex',
    '@theorems.intro_tac', '@readable.parse_qproof', '@miz3.parse_qproof',
    'parse_qproof', 'parse_term_v1', 'inner_space_prove', 'full_inner_space_prove',
    '@miz2a.have', '@miz2a.theorem', '@miz2a.otherwise', '@miz2a.from',
    '@q.subgoal_then',
}
SOURCE_TOKEN = re.compile(r'//[^\n]*|^[ \t]*[#\$]\|[^\n]*|"(?:\\.|[^"\\])*"|(?:@?[A-Za-z_][\w.:]*|[()\[\]{}])', re.M)


def rewrite_moonbit(source):
    """Migrate generated HOL-input literals without touching other strings."""
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
        elif token.startswith('"') and any(name in HOL_INPUTS for name in stack):
            if '!' in token:
                try:
                    text = json.loads(token)
                except ValueError:
                    text = None
                if text is not None:
                    migrated = forall_notation(text)
                    if text != migrated:
                        replacement = json.dumps(migrated, ensure_ascii=False)
        result.extend((source[end:match.start()], replacement))
        end = match.end()
        previous = token
    result.append(source[end:])
    return ''.join(result)


if __name__ == '__main__':
    import sys
    from pathlib import Path
    for name in sys.argv[1:]:
        path = Path(name)
        source = path.read_text()
        migrated = rewrite_moonbit(source)
        if migrated != source:
            path.write_text(migrated)

