#!/bin/bash
# -*- coding: utf-8 -*-

# $1 展開するtarファイル名
# $2 /usr/localに保存するgoのディレクトリ名 (ex: go-1.9)

set -eux
: $1 $2

tar_filename=$1
go_dirname=/usr/local/$2

tar xzf $tar_filename
sudo mv go /usr/local/$2
sudo ln -sf $go_dirname/bin/go `which go`

echo 'export PATH=$PATH:'$go_dirname'/bin:$GOPATH/bin' >> ~/.bashrc

