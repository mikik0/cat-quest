from caption import Caption
from taglist import taglist
from extraction import Extracter

if __name__ == '__main__':
    tagdict = dict()
    for tag in taglist:
        tagdict[tag] = True

    id = '5fXwkTgWrjw'
    caption = Caption('en', id).caption()

    extracter = Extracter(caption, 'en')
    extracted = extracter.extract()

    winner = list()
    for candidate in extracted:
        if candidate in tagdict:
            winner.append(candidate)
    
    print(winner)
