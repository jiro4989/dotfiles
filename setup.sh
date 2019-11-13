#!/bin/sh

set -eu

pacman -S --no-confirm gcc

curl "https://nim-lang.org/choosenim/init.sh" > init.sh
sh init.sh -y
rm init.sh
export PATH=$PATH:$HOME/.nimble/bin
nim --hints:off setup
