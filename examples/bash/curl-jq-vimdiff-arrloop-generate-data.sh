root="${1/%\//}"
base_url='http://localhost:5173/_/api/v1'
version='675636'
domains=(
    'devtest.pointsbet.com.au'
    'uat.pointsbet.com.au'
    'pointsbet.com.au'
)
paths_array=()

version_id=$(curl "${base_url}/versions" \
    --silent \
    --request POST \
    --header 'Content-Type: application/json' \
    --header 'Accept: application/json' \
    --data "{
        \"version\": \"${version}\",
        \"paths\": []
    }" | jq -r '.id')
echo "Created version ${version_id}"

while IFS= read -r -d '' file; do 
    path="${file/#${root}\//}"
    paths_array+=("\"${path}\"")
    _artifact=$(curl "${base_url}/artifacts" \
        --silent \
        --request POST \
        --header 'Content-Type: multipart/form-data' \
        --header 'Accept: application/json' \
        --form "versionId=${version_id}" \
        --form "path=${path}" \
        --form "file=@${file}" \
        | jq -r '.id')
    echo "Uploaded artifact ${path}"
done < <(find "${root}" -type f  -print0)

paths=$(IFS=, ; echo "${paths_array[*]}")
unset IFS
paths=$(curl "${base_url}/versions/${version_id}" \
    --silent \
    --request PUT \
    --header 'Content-Type: application/json' \
    --header 'Accept: application/json' \
    --data "{
        \"paths\": [${paths}]
    }" | jq -r '.paths[]')
echo "Created version ${version_id}"

for domain in "${domains[@]}"; do
    _host=$(curl "${base_url}/hosts" \
        --silent \
        --request POST \
        --header 'Content-Type: application/json' \
        --header 'Accept: application/json' \
        --data "{
            \"domain\": \"${domain}\",
            \"versionId\": \"${version_id}\"
        }")
    echo "Created host with domain ${domain}"
done


vimdiff \
    <(echo "${paths}" | sort) \
    <(find "${root}" -type f | sort | sed "s|${root}/||")
