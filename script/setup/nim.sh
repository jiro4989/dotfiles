#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work

curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh
bash init.sh -y
nimble install -Y inim bump subnet nimjson
