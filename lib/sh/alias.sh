#!/bin/bash

# ls頻出オプション
alias ls='ls --color=auto'
alias ll='ls -la'
alias llh='ls -lah'

# 画面ロック
alias lock='gnome-screensaver-command -l'

# Gitのログをツリー状にし、ログを1行で出力する
alias glog='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

alias d='docker'
alias dc='docker-compose'

# xdg-openを省略で呼び出す
e() {
  local v=$1
  v=${v:-.}
  xdg-open "$v"
}

# burnout はdockerを全部キレイにする
burnout() {
  docker ps -qa | xargs docker stop | xargs docker rm -f
  docker images -qa | xargs docker rmi
  docker volume prune -f
}

# ターミナルエミュレータの変更
alias change_terminal="sudo update-alternatives --config x-terminal-emulator"

# 最新のヒストリコマンドを一つクリップボードにコピー
alias yy="fc -ln | tail -n 1 | sed -r 's@^\s+@@g' | gocopy"

# ghq管理のディレクトリ配下からリポジトリを検索し、cwdを移動する
peco_src() {
  local selected_dir
  selected_dir=$(ghq list --full-path | peco)
  if [[ "$selected_dir" != "" ]]; then
    cd "$selected_dir"
  fi
}

alias asdoc='docker run --rm -u $(id -u):$(id -g) -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-diagram'
alias asdocp='docker run --rm -u $(id -u):$(id -g) -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -r asciidoctor-diagram'
alias wacomoff='xsetwacom set "Wacom Intuos Pro M Finger touch" Touch off'

# クリップボードのテキストをツイートする
alias ctw='twty "$(xclip -o)"'

# vim
type nvim >& /dev/null && {
  alias v='nvim'
} || {
  alias v='vim'
}

# git
alias g='git'
alias gg='gits'
