#!/bin/bash

set -eux

cd
git clone https://github.com/jiro4989/dotfiles
cd dotfiles
./link_config.sh
relma install -f ./conf/releases.json
