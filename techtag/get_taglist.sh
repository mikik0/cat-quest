for ((i=1 ; i<=100 ; i++))
do
curl -H 'Authorization: Bearer xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' 'https://qiita.com/api/v2/tags?page='$i'&per_page=100&sort=count' | jq '.[].id' >> taglist.csv
done
