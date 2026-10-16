import unittest
from hol_notation import universal_notation, upstream_notation, rewrite_moonbit
from ocaml_ref.universal_reference import adapt_output, escaped_notation


class NotationTests(unittest.TestCase):
    def test_only_complete_tokens(self):
        self.assertEqual(
            universal_notation('!x. ?!y. !! x !* y !_x x_! ∃!z. P x y'),
            '∀ x. ?!y. !! x !* y !_x x_! ∃!z. P x y')
        self.assertEqual(universal_notation('(!) ! x. P x'), '(∀) ∀ x. P x')

    def test_word_spelling_and_unicode_boundaries(self):
        self.assertEqual(universal_notation('forall x. forall_x x'), '∀ x. forall_x x')
        self.assertEqual(universal_notation('"forall" // forall\nforall x. P x'),
                         '"forall" // forall\n∀ x. P x')
        self.assertEqual(upstream_notation('∀x.∀y.P x y'), '!x. !y.P x y')
        self.assertEqual(upstream_notation('∀∀x'), '! !x')
        self.assertEqual(rewrite_moonbit('@parser.parse_term("forall x. P x")'),
                         '@parser.parse_term("∀ x. P x")')

    def test_strings_and_comments(self):
        text = '!x. "!y. \\"quoted\\"" // !z. comment\n!y. P'
        self.assertEqual(universal_notation(text),
                         '∀ x. "!y. \\"quoted\\"" // !z. comment\n∀ y. P')
        self.assertEqual(universal_notation('"unterminated !x.'), '"unterminated !x.')

    def test_round_trip_to_oracle(self):
        text = '∀ x. (∀) P /\\ ?!y. "∀" = y'
        self.assertEqual(universal_notation(upstream_notation(text)), text)

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
        expected = source.replace('"!x. P x"', '"∀ x. P x"').replace(
            '"!x. "', '"∀ x. "').replace('"![x]; !y"', '"∀[x]; ∀ y"').replace(
            '@kernel.mk_const("!",', '@kernel.mk_const("∀",')
        self.assertEqual(rewrite_moonbit(source), expected)
        self.assertEqual(rewrite_moonbit(expected), expected)

    def test_literal_strings_and_internal_names(self):
        source = r'''@parser.parse_term("\\\"!x. P x\\\"")'''
        self.assertEqual(rewrite_moonbit(source), source)
        self.assertEqual(rewrite_moonbit('@lexer.Ident("!")'), '@lexer.Ident("∀")')
        self.assertEqual(rewrite_moonbit('@kernel.Term::Const("!", ty)'),
                         '@kernel.Term::Const("∀", ty)')
        self.assertEqual(rewrite_moonbit('@tactics.label_tac("!", th)'),
                         '@tactics.label_tac("!", th)')

    def test_generated_constant_name_tables(self):
        for source in [
                '"!" => forall_ctximpconv', '"!" => forall_ctximpmconv',
                'universalname_c.set(fromstring("!"))',
                'exclude_list_c.set(Ref::{ val: @list.List(["!", "?!"]) })',
                'suppress().val = @list.List(["!", "?!"])']:
            self.assertEqual(rewrite_moonbit(source), source.replace('"!"', '"∀"'))

    def test_jordan_persistent_hash_labels(self):
        source = """      @kernel.Term::Const(name, ty) => {
        let type_hash = hash_of_type(ty)
        @lib.mod63(@lib.add63(@lib.mul63(prime220, memhash_of_string(name)), type_hash), prime1220)
      }"""
        migrated = rewrite_moonbit(source)
        self.assertIn('if name == "∀" { 33L }', migrated)
        self.assertIn('else { memhash_of_string(name) }', migrated)
        self.assertEqual(rewrite_moonbit(migrated), migrated)
        variable = source.replace('Term::Const', 'Term::Var')
        self.assertEqual(rewrite_moonbit(variable), variable)

    def test_embedded_exec_key(self):
        source = r'''@lib.register_phrase("parse_term \"!x. P x\"", fn() { () })'''
        self.assertEqual(rewrite_moonbit(source), source.replace('!x.', '∀ x.'))

    def test_reference_terms_not_rewritten(self):
        lines = ['foo quotations (1):\n', '  !x. P x\n',
                 'th = (#!:fun(A,bool) x:A)\n', 'bad ! error\n',
                 'binders = \\ ! ? ?! forall exists\n']
        self.assertEqual(list(adapt_output(lines)),
                         [lines[0], '  \\226\\136\\128 x. P x\n', lines[2], lines[3],
                          'binders = \\ ∀ ? ?! exists\n'])

    def test_reference_escaped_utf8(self):
        self.assertEqual(escaped_notation(r'!x. \226\136\131!y. P x y'),
                         r'\226\136\128 x. \226\136\131!y. P x y')


if __name__ == '__main__':
    unittest.main()
