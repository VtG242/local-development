#!/opt/homebrew/bin/bash

curl --cacert <(kubectl -n default get secret echo-cert -o jsonpath='{.data.ca\.crt}' | base64 -d) https://echo.mac:30443
