#!/bin/bash

set -eux

apt-get update -yqq
apt-get install -yqq fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c "fisher install edc/bass"
fish -c "fisher install oh-my-fish/theme-clearance"
fish -c "fisher install fisherman/z"
