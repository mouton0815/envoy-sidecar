#!/bin/sh
docker image build --tag mouton4711/kubernetes:backend-envoy ./backend-envoy
docker image build --tag mouton4711/kubernetes:backend-spring ./backend-spring
docker image build --tag mouton4711/kubernetes:backend-golang ./backend-golang
docker image build --tag mouton4711/kubernetes:frontend-envoy ./frontend-envoy
docker image build --tag mouton4711/kubernetes:frontend-nodejs ./frontend-nodejs