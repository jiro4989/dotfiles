#!/bin/bash
sudo apt-get install vim -y
sudo apt-get install vim-gnome -y
sudo apt-get update -y

mkdir bundle
cd bundle
git clone https://github.com/Shougo/dein.vim.git
mkdir ~/tmp

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.vimperatorrc ~/.vimperatorrc

mkdir ~/.vim
ln -sf ~/dotfiles/bundle ~/.vim
ln -sf ~/dotfiles/dict ~/.vim
ln -sf ~/dotfiles/vimfiles ~/.vim
ln -sf ~/dotfiles/colors ~/.vim

# LinuxMintではこっちの設定で機能する
ln -sf ~/dotfiles/vimfiles ~/vimfiles

# linuxmintでvim8を使えるようにする。
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

