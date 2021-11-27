#!/bin/bash

set -eux

readonly NODE_VERSION=16.9.1
readonly PYTHON_VERSION=3.9.9

git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH=$PATH:$HOME/.anyenv/bin
mkdir -p "$(anyenv root)/plugins"
yes | anyenv install --init
git clone https://github.com/znz/anyenv-update.git "$(anyenv root)/plugins/anyenv-update"

anyenv install nodenv
eval "$(anyenv init -)"
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

npm i -g bash-language-server

# anyenv install pyenv
# eval "$(anyenv init -)"
# pyenv install $PYTHON_VERSION
# pyenv global $PYTHON_VERSION
# eval "$(anyenv init -)"
# pip install --user cfn-lint
