#!/bin/bash

set -eux

curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh
bash init.sh -y
nimble install -Y inim bump subnet nimjson
