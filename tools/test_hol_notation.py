import unittest
from hol_notation import forall_notation, upstream_notation, rewrite_moonbit
from ocaml_ref.forall_reference import adapt_output, escaped_notation


class NotationTests(unittest.TestCase):
    def test_only_complete_tokens(self):
        self.assertEqual(
            forall_notation('!x. ?!y. !! x !* y !_x x_! ∃!z. P x y'),
            'forall x. ?!y. !! x !* y !_x x_! ∃!z. P x y')
        self.assertEqual(forall_notation('(!) ! x. P x'), '(forall) forall x. P x')

    def test_strings_and_comments(self):
        text = '!x. "!y. \\"quoted\\"" // !z. comment\n!y. P'
        self.assertEqual(forall_notation(text),
                         'forall x. "!y. \\"quoted\\"" // !z. comment\nforall y. P')
        self.assertEqual(forall_notation('"unterminated !x.'), '"unterminated !x.')

    def test_round_trip_to_oracle(self):
        text = 'forall x. (forall) P /\\ ?!y. "forall" = y'
        self.assertEqual(forall_notation(upstream_notation(text)), text)

    def test_emitted_literals_and_curried_proof_inputs(self):
        source = '''@parser.parse_term("!x. P x")
@parser.parse_term(("!x. " + p))
@theorems.intro_tac("![x]; !y")
@miz2a.from(@miz2a.st(proof))("!x. P x")
@kernel.mk_const("!", [])
raise Failure("bad!")
let bytes = "!x. unclassified string data"
// @parser.parse_term("!x. comment")
'''
        expected = source.replace('"!x. P x"', '"forall x. P x"').replace(
            '"!x. "', '"forall x. "').replace('"![x]; !y"', '"forall[x]; forall y"').replace(
            '@kernel.mk_const("!",', '@kernel.mk_const("forall",')
        self.assertEqual(rewrite_moonbit(source), expected)
        self.assertEqual(rewrite_moonbit(expected), expected)

    def test_literal_strings_and_internal_names(self):
        source = r'''@parser.parse_term("\\\"!x. P x\\\"")'''
        self.assertEqual(rewrite_moonbit(source), source)
        self.assertEqual(rewrite_moonbit('@lexer.Ident("!")'), '@lexer.Ident("forall")')
        self.assertEqual(rewrite_moonbit('@kernel.Term::Const("!", ty)'),
                         '@kernel.Term::Const("forall", ty)')
        self.assertEqual(rewrite_moonbit('@tactics.label_tac("!", th)'),
                         '@tactics.label_tac("!", th)')

    def test_generated_constant_name_tables(self):
        for source in [
                '"!" => forall_ctximpconv', '"!" => forall_ctximpmconv',
                'universalname_c.set(fromstring("!"))',
                'exclude_list_c.set(Ref::{ val: @list.List(["!", "?!"]) })',
                'suppress().val = @list.List(["!", "?!"])']:
            self.assertEqual(rewrite_moonbit(source), source.replace('"!"', '"forall"'))

    def test_embedded_exec_key(self):
        source = r'''@lib.register_phrase("parse_term \"!x. P x\"", fn() { () })'''
        self.assertEqual(rewrite_moonbit(source), source.replace('!x.', 'forall x.'))

    def test_reference_terms_not_rewritten(self):
        lines = ['foo quotations (1):\n', '  !x. P x\n',
                 'th = (#!:fun(A,bool) x:A)\n', 'bad ! error\n',
                 'binders = \\ ! ? ?! forall exists\n']
        self.assertEqual(list(adapt_output(lines)),
                         [lines[0], '  forall x. P x\n', lines[2], lines[3],
                          'binders = \\ forall ? ?! exists\n'])

    def test_reference_escaped_utf8(self):
        self.assertEqual(escaped_notation(r'!x. \226\136\131!y. P x y'),
                         r'forall x. \226\136\131!y. P x y')


if __name__ == '__main__':
    unittest.main()
