#!/bin/bash

set -eu

readonly version=v1.4.1

# リダイレクトするときは L
curl -sSfL https://github.com/yuru7/HackGen/releases/download/$version/HackGen_$version.zip > /tmp/font.zip
cd /tmp
unzip font.zip
font_dir=/usr/share/fonts/truetype/hack-gen
if [[ -d $font_dir ]]; then
  exit
fi

sudo install -d -o root -g root -m 0755 $font_dir
cd HackGen*
sudo cp -p HackGen*.ttf $font_dir
sudo git clone https://github.com/googlefonts/noto-emoji /usr/local/src/noto-emoji || true
fc-cache -f -v
