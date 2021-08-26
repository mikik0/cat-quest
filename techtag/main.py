from caption import Caption
from taglist import taglist
from extraction import Extracter
import psycopg2
import urllib.parse
import datetime



def get_connection():
    # conn = psycopg2.connect("host='localhost' port=5432 dbname=nekoquest_development user=postgres password='password'")
    dsn = "postgresql://postgres:password@localhost:5432/nekoquest_development"
    return psycopg2.connect(dsn)
    


if __name__ == '__main__':
    conn = get_connection()
    conn.autocommit = True
    cur = conn.cursor()

    i = 1
    tagdict = dict()
    for tag in taglist:
        # cur.execute('INSERT INTO tags VALUES (' + str(i) + ',\''+ tag + "\'," + '\'2015-04-07\'' + "," + '\'2015-04-07\'' + ")")
        tagdict[tag] = True
        i += 1

    while True:
        cur.execute('SELECT * FROM tech_tag_events')
        rows = cur.fetchall()

        for row in rows:
            event_id = row[0]
            content_id = row[1]
            youtube_url = row[2]

            cur.execute('DELETE FROM tech_tag_events WHERE id = ' + str(event_id))

            qs = urllib.parse.urlparse(youtube_url).query
            qs_d = urllib.parse.parse_qs(qs)
            if qs_d == "":
                id = youtube_url[youtube_url.rfind('/') + 1:]
            else:
                id = qs_d["v"]

            caption = Caption('en', id).caption()

            extracter = Extracter(caption, 'en')
            extracted = extracter.extract()

            winners = list()
            for candidate in extracted:
                if candidate in tagdict:
                    winners.append(candidate)

            for winner in winners:
                cur.execute('SELECT * FROM tags WHERE name = ' + winner)
                tags = cur.fetchall()
                tag_id = tags[0][0]


                cur.execute('SELECT COUNT(1) AS count FROM tag_contents')
                count = cur.fetchone()
                cur.execute('INSERT INTO tag_contents VALUES ('+ count["count"] + "," + str(tag_id) + "," + str(content_id) + "," + '\'2015-04-07\'' + "," + '\'2015-04-07\'' + ")")

