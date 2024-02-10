#!/bin/bash
echo -e 'GET /test.txt HTTP/1.1\r\n\r\n' | \
  openssl s_client \
  -cert <(kubectl -n default get secret test-client-tls -o jsonpath='{.data.tls\.crt}' | base64 -d) \
  -key <(kubectl -n default get secret test-client-tls -o jsonpath='{.data.tls\.key}' | base64 -d) \
  -CAfile <(kubectl -n default get secret test-client-tls -o jsonpath='{.data.ca\.crt}' | base64 -d) \
  -connect localhost:12345 -quiet
