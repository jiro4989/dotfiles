#!/bin/bash

set -eux

readonly CONFIG_DIR="$PWD/conf"
readonly DOT_CONFIG_DIR="$CONFIG_DIR/.config"
readonly DST_DOT_CONFIG_DIR="$HOME/.config"

# .config
mkdir -p "$DST_DOT_CONFIG_DIR/"
for dir in "$DOT_CONFIG_DIR/"*; do
  # fishだけリンクの仕方が違うのでスキップ
  base="$(basename "$dir")"
  if [[ "$base" =~ ^(fish|\.{1,2})$ ]]; then
    continue
  fi

  ln -sfn "$dir" "$DST_DOT_CONFIG_DIR/"
done

# fish
mkdir -p "$DST_DOT_CONFIG_DIR/fish"
mkdir -p "$DST_DOT_CONFIG_DIR/fish/functions"
for path in config.fish functions/fish_prompt.fish; do
  ln -sfn "$DOT_CONFIG_DIR/fish/$path" "$DST_DOT_CONFIG_DIR/fish/$path"
done

# $HOME/.*rc
# Vimは最初にディレクトリが作られてる場合があるので削除
readonly VIM_DIR="$HOME/.vim"
if [[ -d "$VIM_DIR" ]]; then
  unlink "$VIM_DIR" || true
  rm -rf "$VIM_DIR" || true
fi

# . で始まるファイル/ディレクトリをシンボリックリンク
for dir in "$CONFIG_DIR/".*; do
  # . ディレクトリはスキップ
  base="$(basename "$dir")"
  if [[ "$base" =~ ^(\.config|\.{1,2})$ ]]; then
    continue
  fi

  # .gitconfigはシンボリックリンクしない
  if [[ "$base" =~ ^\.gitconfig$ ]]; then
    continue
  fi

  ln -sfn "$dir" "$HOME/"
done

# .gitconfigはコピーで配置
cp "$CONFIG_DIR/.gitconfig" "$HOME/"

# 会社用にリポジトリで管理しないスクリプトが存在するときだけ実行する
if [[ -f secrets.sh ]]; then
  ./secrets.sh
fi
