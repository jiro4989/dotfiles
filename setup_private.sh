#!/bin/bash

# メールソフト
sudo apt-get install sylpheed-i18n -y 
sudo apt-get install sylpheed-doc -y 

# ペイントソフト
sudo apt-get install krita -y

# 画面キャプチャ
sudo apt install kazam -y

# mp4を変換するツール
sudo apt install libav-tools imagemagick -y

# markdownをdocxを含む様々な拡張子のファイルに変換するソフト
sudo apt-get install pandoc -y

# mysql
sudo apt-get install mysql-server -y

# sshリモート接続
sudo apt-get install openssh-server -y

# 標準出力をクリップボードにコピー
sudo apt-get install xsel -y

# リモート接続
sudo apt-get install x11vnc -y

# WINE
sudo apt-get install wine -y

# bashrcの設定を追加
cat ./.bashrc >> ~/.bashrc

# sylpheedの自動アプデに必要なので
sudo apt-get install -y curl

# kotlinやJVM系のツールをインストールするためのツール
curl -s get.sdkman.io | bash

# ユーザフォルダの日本語を英語に変更
LANG=C xdg-user-dirs-gtk-update

# メモ置き場
mkdir ~/Documents/note

# sylpheedのメール通知用
sudo apt-get install -y zenity

# アプリランチャ Ctrl + Spaceで呼び出し
sudo apt-get install -y synapse

# ISO焼き込みコマンドの追加
sudo apt-get install -y growisofs

sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

# ワークスペースの作成
ws=~/workspace
mkdir $ws
cd $ws
mkdir -p projects
git clone https://github.com/jiro4989/scripts.git

