date_str=$(date +%m_%d_%Y)

# Construct the URL using the current date
movie_url="https://files.tmdb.org/p/exports/movie_ids_${date_str}.json.gz"
tv_url="https://files.tmdb.org/p/exports/tv_series_ids_${date_str}.json.gz"
# Send the request using curl
curl -O -v "$movie_url"
curl -O -v "$tv_url"

gunzip -c "movie_ids_${date_str}.json.gz" > "movie_ids.json"
gunzip -c "tv_series_ids_${date_str}.json.gz" > "series_ids.json"