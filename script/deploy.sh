#!/bin/bash

set -eux

readonly CONFIG_DIR="$PWD/conf"
readonly DOT_CONFIG_DIR="$CONFIG_DIR/.config"
readonly DST_DOT_CONFIG_DIR="$HOME/.config"

# .config
mkdir -p "$DST_DOT_CONFIG_DIR/"
ln -sfn "$DOT_CONFIG_DIR/termite" "$DST_DOT_CONFIG_DIR/"
ln -sfn "$DOT_CONFIG_DIR/i3" "$DST_DOT_CONFIG_DIR/"
ln -sfn "$DOT_CONFIG_DIR/Code" "$DST_DOT_CONFIG_DIR/"
ln -sfn "$DOT_CONFIG_DIR/nvim" "$DST_DOT_CONFIG_DIR/"
#ln -sfn "$DOT_CONFIG_DIR/fish/config.fish" "$DST_DOT_CONFIG_DIR/fish/config.fish"

# home/.*config
ln -sfn "$CONFIG_DIR/.tmux.conf" "$HOME/"
if [[ -d "$HOME/.vim" ]]; then
  rm -rf "$HOME/.vim"
fi
ln -sfn "$CONFIG_DIR/.vim" "$HOME/"
ln -sfn "$CONFIG_DIR/.zshrc" "$HOME/"
ln -sfn "$CONFIG_DIR/.gitconfig" "$HOME/"

# 会社用にリポジトリで管理しないスクリプトが存在するときだけ実行する
if [[ -f secrets.sh ]]; then
  ./secrets.sh
fi
