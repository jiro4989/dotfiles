#!/bin/bash

set -eux

readonly NODE_VERSION=16.9.1

git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH=$PATH:$HOME/.anyenv/bin/anyenv

# 何故かパスが通らず...
anyenv=$HOME/.anyenv/bin/anyenv

mkdir -p "$($anyenv root)/plugins"
yes | $anyenv install --init
git clone https://github.com/znz/anyenv-update.git "$($anyenv root)/plugins/anyenv-update"

$anyenv install nodenv
eval "$($anyenv init -)"
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

npm i -g bash-language-server

$anyenv install pyenv
pip3 install --user cfn-lint
