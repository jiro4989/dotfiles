#!/usr/bin/env zsh

# Emacs mode
bindkey -e

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

# ZshではBashのようにhome endが使えないっぽい
# HOME
bindkey "^[[1~" beginning-of-line
# DELETE
bindkey "^[[3~" delete-char
# END
bindkey "^[[4~" end-of-line
