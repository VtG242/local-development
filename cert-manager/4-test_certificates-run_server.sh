#!/opt/homebrew/bin/bash

openssl verify -CAfile \
<(kubectl -n cert-manager get secret root-secret -o jsonpath='{.data.ca\.crt}' | base64 -d) \
<(kubectl -n default get secret test-server-tls -o jsonpath='{.data.tls\.crt}' | base64 -d)

echo Hello World! > test.txt
openssl s_server \
  -cert <(kubectl -n default get secret test-server-tls -o jsonpath='{.data.tls\.crt}' | base64 -d) \
  -key <(kubectl -n default get secret test-server-tls -o jsonpath='{.data.tls\.key}' | base64 -d) \
  -CAfile <(kubectl -n default get secret test-server-tls -o jsonpath='{.data.ca\.crt}' | base64 -d) \
  -WWW -port 12345  \
  -verify_return_error -Verify 1
