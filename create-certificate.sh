#!/bin/sh
openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout tls.key -out tls.crt -subj "/CN=localhost"
cp tls.* frontend-envoy/
cp tls.* backend-envoy/