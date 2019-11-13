#!/bin/bash

set -eu

curl "https://nim-lang.org/choosenim/init.sh" > init.sh
bash init.sh -y
rm init.sh
export PATH=$PATH:$HOME/.nimble/bin
nim --hints:off init
nim --hints:off deploy
