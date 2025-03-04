#!/bin/bash

MESSAGE=${1:-World}

TOKEN=$(
curl -s -X POST "http://localhost:8080/realms/simple/protocol/openid-connect/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "username=user" \
     -d "password=user" \
     -d "grant_type=password" \
     -d "client_id=simple-client" \
     -d "client_secret=totally-secret" \
| grep -oE '"access_token":"[^"]+"' \
| awk -F'"' '{print $4}'
)

# echo "=== ACCESS TOKEN: ${TOKEN}"

curl --cacert tls.crt "https://localhost/${MESSAGE}" -H "Authorization: Bearer ${TOKEN}"