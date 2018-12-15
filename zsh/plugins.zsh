#!/usr/bin/env zsh

export ZPLUG_HOME="$HOME/.zplug"
source "$ZPLUG_HOME/init.zsh"

zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# インストールチェック
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

# zplug load --verbose
zplug load
