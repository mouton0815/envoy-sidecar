#!/bin/sh
docker image build -t mouton4711/hello_k8s_backend-envoy ./backend-envoy
docker image build -t mouton4711/hello_k8s_frontend-envoy ./frontend-envoy
