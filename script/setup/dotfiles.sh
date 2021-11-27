#!/bin/bash

set -eux

DOTFILES_BRANCH=${GITHUB_REF/refs?heads?/}
readonly DOTFILES_BRANCH=${DOTFILES_BRANCH:-master}

cd
git clone -b "${DOTFILES_BRANCH}" https://github.com/jiro4989/dotfiles
cd dotfiles
./script/setup/link_config.sh
relma install -f ./conf/releases.json
