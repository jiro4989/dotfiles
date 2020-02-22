#!/bin/bash

set -eux

readonly CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"
ln -sfn "$CONFIG_DIR/termite" "$HOME/.config/"
ln -sfn "$CONFIG_DIR/i3" "$HOME/.config/"
ln -sfn "$CONFIG_DIR/Code" "$HOME/.config/"
ln -sfn "$CONFIG_DIR/nvim" "$HOME/.config/"
#ln -sfn "$CONFIG_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sfn "$PWD/.tmux.conf" "$HOME/"
if [[ -d "$HOME/.vim" ]]; then
  rm -rf "$HOME/.vim"
fi
ln -sfn "$PWD/.vim" "$HOME/"
ln -sfn "$PWD/.zshrc" "$HOME/"
ln -sfn "$PWD/.gitconfig" "$HOME/"

# 会社用にリポジトリで管理しないスクリプトが存在するときだけ実行する
if [[ -f secrets.sh ]]; then
  ./secrets.sh
fi
