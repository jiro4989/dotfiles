#!/usr/bin/env zsh

export ZPLUG_HOME="$HOME/.zplug"
source "$ZPLUG_HOME/init.zsh"

# zplugが入ってなければインストール
if [ ! -e "$ZPLUG_HOME" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# インストールチェック
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
