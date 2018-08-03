#!/bin/bash

docker stop hapx || true
docker rm hapx || true
docker build -t myhapx . &&
docker run -it --rm --network test --name haproxy-syntax-check myhapx haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg &&
docker run -p 4445:7778 -p 4444:7777 -d --network test --name hapx myhapx
