#!/bin/bash

#pacman -Syyu --noconfirm git

apt-get update -yqq
apt-get install -yqq git ca-certificates

cd /tmp
mkdir work
cd $_

git clone https://github.com/jiro4989/dotfiles
cd dotfiles
#./init.sh
bash ./init_ubuntu.sh
bash ./deploy.sh
