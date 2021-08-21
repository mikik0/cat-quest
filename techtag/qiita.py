import urllib.request
import json

taglist = list()

headers = {
    'Authorization': 'Bearer 87710c2f7501f3b92c7e90c0f0fa5ff88ffc232e',
}

for i in range(1, 101):
    url = "https://qiita.com/api/v2/tags?page="+str(i)+"&per_page=100&sort=count"

    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req) as res:
        body = json.load(res)
        for v in body:
            if v['followers_count'] > 4:
                taglist.append(v['id'])


print(taglist)
