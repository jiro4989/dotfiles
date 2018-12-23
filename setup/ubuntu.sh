#!/bin/bash

set -eux

sudo apt update -y

# 全般{{{
# ユーザフォルダの日本語を英語に変更
LANG=C xdg-user-dirs-gtk-update

# キーリピート
xset r rate 300 62

# ビープ音を無効化
sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

# フォント 'Ricty Diminished'
sudo apt-get install -y fonts-ricty-diminished

# デフォルトターミナルの変更
update-alternatives --config x-terminal-emulator

# 日本語入力
sudo apt-get install -y ibus-mozc
#}}}
# ghqでdotfilesを取得 {{{
export GOPATH=$HOME
export PATH=$PATH:$HOME/bin
sudo apt install -y golang-1.10
go get github.com/motemen/ghq
ghq get jiro4989/dotfiles
#}}}
# bash/zsh{{{
my_repo=~/src/github.com/jiro4989
dot_dir="$my_repo/dotfiles"
echo "source $dot_dir/bash/bashrc" >> ~/.bashrc
echo "source $dot_dir/zsh/zshrc" >> ~/.zshrc
#}}}
# git config{{{
git config --global user.email "jiroron666@gmail.com"
git config --global user.name "jiro4989"
git config --global alias.pr "pull-request"
git config --global alias.see "browse"
git config --global ghq.root "~/src"
git config --global commit.template "$dot_dir/git/commit.template"
#}}}
# docker{{{
sudo apt install docker.io

sudo groupadd docker
sudo gpasswd -a $USER docker

sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl enable docker
#}}}
# emacs{{{
sudo apt-get install -y emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -sf $HOME/dotfiles/.spacemacs $HOME/.emacs.d/
#}}}
# go{{{
go get -u github.com/cweill/gotests/...
go get -u github.com/mholt/archiver/cmd/archiver

# TUI
go get -u github.com/fatih/color
go get -u github.com/julienroland/keyboard-termbox
go get -u github.com/mattn/go-colorable
go get -u github.com/nsf/termbox-go

# vim-go
go get -u github.com/nsf/gocode
go get -u golang.org/x/tools/cmd/godoc

# Excel
go get -u github.com/tealeg/xlsx
go get -u github.com/loadoff/excl

go get -u github.com/BurntSushi/toml

# packages version
go get -u github.com/golang/dep/cmd/dep

# github release
go get -u github.com/tcnksm/ghr

# clipboard
go get -u github.com/atotto/clipboard/cmd/gocopy

# Debugger
go get -u github.com/derekparker/delve/cmd/dlv

go get -v github.com/alecthomas/gometalinter
gometalinter --install --update

# coverage
go get -u github.com/axw/gocov/gocov

# count srccode
go get -u github.com/hhatto/gocloc/cmd/gocloc

# クロスコンパイル
go get -u github.com/mitchellh/gox

# シェルのフォーマッタ
go get -u github.com/mvdan/sh/cmd/shfmt

# インクリメンタルサーチIF
go get -u github.com/peco/peco/cmd/peco/...

# docker管理UI
go get -u github.com/skanehira/docui

# リポジトリ管理
go get github.com/motemen/ghq
#}}}
# gtk theme{{{
git clone https://github.com/tliron/install-gnome-themes /tmp/install-gnome-themes
sudo apt install ruby
/tmp/install-gnome-themes/install-gnome-themes

# icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

# app thems
sudo apt install materia-gtk-theme
#}}}
# vim{{{
sudo apt install vim
sudo apt install vim-gnome
ln -snf "$dot_dir/vim" $HOME/.vim
#}}}
# nvim{{{
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
mkdir -p $HOME/.config
ln -snf "$dot_dir/vim" "$HOME/.config/nvim"
#}}}
# atom{{{
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y atom
#}}}

sudo apt upgrade -y
