#!/bin/bash
sudo apt-get install vim -y
sudo apt-get install vim-gnome -y
sudo apt-get update -y

mkdir bundle
cd bundle
git clone https://github.com/Shougo/neobundle.vim.git
mkdir ~/tmp

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.vimperatorrc ~/.vimperatorrc

mkdir ~/.vim
ln -sf ~/dotfiles/bundle ~/.vim
ln -sf ~/dotfiles/dict ~/.vim
ln -sf ~/dotfiles/vimfiles ~/.vim

# LinuxMintではこっちの設定で機能するように和る
ln -sf ~/dotfiles/vimfiles ~/vimfiles
