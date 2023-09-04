#!/bin/sh
openssl req -x509 -newkey rsa:4096 -keyout example-com.key -out example-com.crt -days 365 -nodes -subj "/C=US/ST=LA/L=LA/O=Example/OU=IT/CN=example.com"
cp example-com.* frontend-envoy/
cp example-com.* backend-envoy/