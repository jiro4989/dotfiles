#!/usr/bin/env zsh
#
# ghq管理のディレクトリ配下からリポジトリを検索し、cwdを移動する
__peco_src() {
  local selected_dir
  selected_dir=$(ghq list --full-path | peco)
  if [[ "$selected_dir" != "" ]]; then
    cd "$selected_dir"
  fi
  zle reset-prompt
}
zle -N __peco_src
bindkey "^P" __peco_src
