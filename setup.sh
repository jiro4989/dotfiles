#!/bin/sh

set -eu

pacman -Syyu --noconfirm gcc

curl "https://nim-lang.org/choosenim/init.sh" > init.sh
sh init.sh -y
rm init.sh
export PATH=$PATH:$HOME/.nimble/bin

if [ "$DRY_RUN" = true ]; then
  nim --hints:off -d:dryRun setup
else
  nim --hints:off setup
fi
