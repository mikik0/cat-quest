from caption import Caption
from taglist import taglist

if __name__ == '__main__':
    id = '0iB5IPoTDts'
    caption = Caption('ja', id).caption()
    if caption == "":
        caption = Caption('en', id).caption()
    print(caption)
