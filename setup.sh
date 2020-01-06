#!/bin/sh

set -eu

pacman -Syyu --noconfirm git

cd /tmp
mkdir work
cd $_

git clone https://github.com/jiro4989/dotfiles
cd dotfiles
./init.sh
./deploy.sh
