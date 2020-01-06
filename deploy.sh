#!/bin/bash

set -eux

ln -sfn "$PWD/.config/termite" "$HOME/.config/"
ln -sfn "$PWD/.config/i3" "$HOME/.config/"
ln -sfn "$PWD/.config/Code" "$HOME/.config/"
ln -sfn "$PWD/.config/nvim" "$HOME/.config/"
ln -sfn "$PWD/.tmux.conf" "$HOME/"
ln -sfn "$PWD/.vim" "$HOME/"
ln -sfn "$PWD/.zshrc" "$HOME/"
