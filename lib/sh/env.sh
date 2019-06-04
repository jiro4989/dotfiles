#!/bin/bash

# 日本語を使用
export LANG=ja_JP.UTF-8

# Java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Go
export GOPATH=$HOME
# go mod用
export GO111MODULE=on

# 追加したコマンド系
export PATH=$PATH:$HOME/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# nim
export PATH=$PATH:$HOME/.nimble/bin

# snap
export PATH=/snap/bin:$PATH

# gem
export PATH=$PATH:$HOME/.gem/bin

# nodejs
export PATH=$PATH:$HOME/.npm-global

export EDITOR=nvim
export BROWSER=chromium
export TERMINAL=terminator

export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*" 

# プロンプトの表示を変更
export PS1='\[\033[01;33m\][\t]\[\033[00m\] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

HISTTIMEFORMAT='%Y-%m-%dT%T%z '

export TEXTIMG_EMOJI_DIR=/usr/local/src/noto-emoji/png/128
export TEXTIMG_FONT_FILE=/usr/share/fonts/TTF/HackGen-Regular.ttf

screenfetch
