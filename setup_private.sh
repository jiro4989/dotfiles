#!/bin/bash

# メールソフト
sudo apt-get install sylpheed -y

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

# ワークスペースの作成
mkdir -p ~/workspace/{java,javascript,php,ruby,scala,python}/{dist,lib,proj}
# ユーザフォルダの日本語を英語に変更
LANG=C xdg-user-dirs-gtk-update
