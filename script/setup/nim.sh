#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work

export PATH=$PATH:$HOME/.nimble/bin

curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh
bash init.sh -y
nimble install -Y subnet || true
