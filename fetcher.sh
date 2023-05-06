date_str=$(date +%m_%d_%Y)

# Construct the URL using the current date
url="https://files.tmdb.org/p/exports/movie_ids_${date_str}.json.gz"

# Send the request using curl
curl -O -v "$url"


gunzip "movie_ids_${date_str}.json.gz"
