import sys
import collections
import dbm

from janome.tokenizer import Tokenizer
import termextract.janome
import termextract.core

class Extracter:
    def __init__(self, text):
        self.text = text
    
    def output(self, data):
        data_collection = collections.Counter(data)
        for cmp_noun, value in data_collection.most_common():
            print(termextract.core.modify_agglutinative_lang(cmp_noun), value, sep='\t')

    def extract(self)
        t = Tokenizer()
        tokenize_text = t.tokenize(self.text)
        frequency = termextract.janome.cmp_noun_dict(tokenize_text)
        lr = termextract.core.score_lr(
            frequency,
            ignore_words=termextract.janome.IGNORE_WORDS,
            lr_mode=1,
            average_rate=1
        )

        term_imp = termextract.core.term_importance(frequency, lr)
        return term_imp
