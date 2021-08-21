from caption import Caption
from taglist import taglist
from extraction import Extracter

if __name__ == '__main__':
    tagdict = dict()
    for tag in taglist:
        tagdict[tag] = True

    id = '0iB5IPoTDts'
    caption = Caption('ja', id).caption()

    extracter = Extracter(caption, 'ja')
    extracted = extracter.extract()

    winner = list()
    for candidate in extracted:
        if candidate in tagdict:
            winner.append(candidate)
    
    print(winner)
