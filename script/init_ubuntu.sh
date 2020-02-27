#!/bin/bash

readonly char_bold=$'\x1b[1m'
readonly char_underscore=$'\x1b[4m'
readonly char_reset=$'\x1b[m'

readonly log_file=init_ubuntu.log
: > "$log_file"

bold() {
  echo -e "$char_bold$*$char_reset"
}

underscore() {
  echo -e "$char_underscore$*$char_reset"
}

exists_dir() {
  [[ -d "$1" ]]
}

install_pkgs() {
  local task=$1
  shift

  while read -r pkg; do
    "func_$task" "$pkg" 2>&1 >> "$log_file"
    ret=$?

    p="$(bold "$(underscore "$pkg")")"
    if [[ $ret -eq 0 ]]; then
      echo -e "$task: ✅ $p"
    else
      echo -e "$task: ❌ $p"
    fi
  done
}

func_apt() {
  sudo apt-get install -yqq "$1"
}

func_go() {
  go get -u "$1"
}

func_ghq() {
  ghq get -p "$1"
}

func_pip() {
  pip3 install "$1"
}

setup_go() {
  GO_VERSION=1.13.8
  local file=go$GO_VERSION.linux-amd64.tar.gz
  (
    cd /tmp
    curl -sSf https://dl.google.com/go/$file > $file
    sudo tar -C /usr/local -xzf $file
  )
}

echo -e "✨ updating packages ..."
sudo apt-get update -yqq

if exists_dir ~/ドキュメント; then
  LANG=C xdg-user-dirs-gtk-update
fi

git config --global user.email jiroron666@gmail.com
git config --global user.name jiro4989
git config --global ghq.root ~/src
git config --global alias.preq pull-request
git config --global alias.see browse

install_pkgs apt < pkg/ubuntu
setup_go
source $PWD/.zsh/conf.d/env.zsh
install_pkgs go < pkg/go
install_pkgs ghq < pkg/ghq
install_pkgs pip < pkg/pip
./script/init_font.sh

sudo add-apt-repository -y ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

# docker
sudo groupadd docker
sudo usermod -a -G docker jiro4989

# shfmt
curl -sSfL https://github.com/mvdan/sh/releases/download/v3.0.1/shfmt_v3.0.1_linux_amd64 > shfmt
sudo install -o root -g root -m 0755 shfmt /usr/local/bin/shfmt

# Vim
curl -sSf https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/install_dein.sh
bash /tmp/install_dein.sh ~/.cache/dein
curl -sSfL https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > nvim
sudo install -o root -g root -m 0755 nvim /usr/local/bin/nvim

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf > nim.sh
bash nim.sh -y
choosenim update stable
nimble install -y https://github.com/jiro4989/clitools

# Ansible semaphore
./script/init_semaphore.sh

./script/init_vscode.sh
