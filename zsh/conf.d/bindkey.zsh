#!/usr/bin/env zsh

# Vi mode
bindkey -v

# ヒストリ検索
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M viins '' history-incremental-search-backward

# ghq管理のディレクトリ配下からリポジトリを検索し、cwdを移動する
__peco_src() {
  local __repo=$(ghq list --full-path | peco)
  if [[ "$__repo" != "" ]]; then
    cd "$__repo"
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

# findの結果をpecoで選択し、ディレクトリを移動する
__peco_cd() {
  local __dir=$(find ./ -path '*/\.*' -name .git -prune -o -type d -print 2> /dev/null | peco)
  if [ -n "$__dir" ]; then
    cd $__dir
  fi
}
zle -N __peco_cd
alias pd=__peco_cd

# findの結果をpecoで選択し、vimで編集する
__peco_edit() {
  local __file=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | peco)
  if [ -n "$__file" ]; then
    ${EDITOR:-vim} $__file
  fi
}
zle -N __peco_edit
alias pe=__peco_edit

# ブランチを切り替える
__peco_git_checkout() {
  local __branch=$(git branch --all | grep -v HEAD | peco)
  if [ -n "$__branch" ]; then
    git checkout $(echo "$__branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  fi
  zle accept-line
}
zle -N __peco_git_checkout
alias pgco=__peco_git_checkout
