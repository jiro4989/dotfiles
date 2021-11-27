#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work

wget https://github.com/jiro4989/relma/releases/download/v1.4.0/relma-linux-amd64.tar.gz
tar xzf relma-linux-amd64.tar.gz
install -m 0755 ./relma /usr/local/bin/relma
