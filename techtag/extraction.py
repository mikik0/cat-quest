import sys
import collections
import dbm

from janome.tokenizer import Tokenizer
import termextract.janome
import termextract.core



class Extracter:
    def __init__(self, text, lang):
        self.text = text
        self.lang = lang
    
    def freq(self):
        if self.lang == "ja":
            t = Tokenizer()
            tokenize_text = t.tokenize(self.text)
            frequency = termextract.janome.cmp_noun_dict(tokenize_text)
            return frequency
        elif self.lang == "en":
            freq = {}                           
            sentence = self.text  
            words = sentence.split()            
            for word in words:                  
                if word in freq:                  
                    freq[word] += 1                 
                else:
                    freq[word] = 1
                
            return freq
        else:
            print("The language is not supported.")
    
    def extract(self):
        frequency = self.freq()
        lr = termextract.core.score_lr(
            frequency,
            ignore_words=termextract.janome.IGNORE_WORDS,
            lr_mode=1,
            average_rate=1
        )

        term_imp = termextract.core.term_importance(frequency, lr)

        data_collection = collections.Counter(term_imp)
        extract_list = list()
        for cmp_noun, value in data_collection.most_common():
            # print(termextract.core.modify_agglutinative_lang(cmp_noun), value, sep='\t')
            extract_list.append(termextract.core.modify_agglutinative_lang(cmp_noun))

        return extract_list
