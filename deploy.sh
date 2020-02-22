#!/bin/bash

set -eux

mkdir -p "$HOME/.config"
ln -sfn "$PWD/.config/termite" "$HOME/.config/"
ln -sfn "$PWD/.config/i3" "$HOME/.config/"
ln -sfn "$PWD/.config/Code" "$HOME/.config/"
ln -sfn "$PWD/.config/nvim" "$HOME/.config/"
ln -sfn "$PWD/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sfn "$PWD/.tmux.conf" "$HOME/"
ln -sfn "$PWD/.vim" "$HOME/"
ln -sfn "$PWD/.zshrc" "$HOME/"
ln -sfn "$PWD/.gitconfig" "$HOME/"

# 会社用にリポジトリで管理しないスクリプトが存在するときだけ実行する
if [[ -f secrets.sh ]]; then
  ./secrets.sh
fi
