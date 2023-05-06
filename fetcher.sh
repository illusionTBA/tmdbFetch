date_str=$(date +%m_%d_%Y)

# Construct the URL using the current date
movie_url="https://files.tmdb.org/p/exports/movie_ids_${date_str}.json.gz"
tv_url="https://files.tmdb.org/p/exports/tv_series_ids_${date_str}.json.gz"
# Send the request using curl
curl -O -v "$movie_url"
curl -O -v "$tv_url"

echo "Extracting Movie IDs..."
gunzip -c "movie_ids_${date_str}.json.gz" | grep -o '"id":[0-9]*' | awk -F: '{print $2}' | tr '\n' ',' | sed 's/,$//' | awk '{print "{\"ids\":["$0"]}" }' > "movie_ids.json"
echo "Finished extracting Movie IDs."

echo "Extracting TV series IDs..."
gunzip -c "tv_series_ids_${date_str}.json.gz" | grep -o '"id":[0-9]*' | awk -F: '{print $2}' | tr '\n' ',' | sed 's/,$//' | awk '{print "{\"ids\":["$0"]}" }' > "series_ids.json"

echo "Finished extracting TV series IDs."
