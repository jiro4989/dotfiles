#!/bin/bash

# メールソフトsudo apt-get install sylpheed -y 
# ペイントソフト
sudo apt-get install krita -y

# 画面キャプチャ
sudo apt install kazam -y

# mp4を変換するツール
sudo apt install libav-tools imagemagick

# markdownをdocxを含む様々な拡張子のファイルに変換するソフト
sudo apt-get install pandoc -y

# cui rss reader
sudo apt-get install newsbeuter -y
echo '' > ~/rss.txt

# cui twitter client
sudo apt-get install python-pip -y
pip install --user setuptools
sudo pip install rainbowstream

# mysql
sudo apt-get install mysql-server -y

sudo `which python3` `which python`
sudo `which pip3` `which pip`

# ワークスペースの作成
for d in python java javascript html php ruby scala bash kotlin; do
  for e in dist lib proj tool; do
    mkdir -p ~/workspace/${d}/${e}
  done
done
mkdir -p ~/workspace/mysql/proj

# ユーザフォルダの日本語を英語に変更
LANG=C xdg-user-dirs-gtk-update

# 自分用のツールを配置するディレクトリを生成
mkdir ~/myscripts
# 自分用のスクリプト配置場所にパスを通す
echo 'PATH=$PATH:~/myscripts' >> ~/.bashrc

# メモ置き場
mkdir ~/Documents/note

# kotlinやJVM系のツールをインストールするためのツール
curl -s get.sdkman.io | bash

