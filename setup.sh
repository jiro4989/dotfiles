#!/bin/sh

set -eu

pacman -Syyu --noconfirm gcc git

cd /tmp
mkdir work
cd $_

curl "https://nim-lang.org/choosenim/init.sh" > init.sh
sh init.sh -y
rm init.sh
export PATH=$PATH:$HOME/.nimble/bin

git clone https://github.com/jiro4989/dotfiles
cd dotfiles
nim --hints:off setup
