#!/bin/bash

readonly REPO_ROOT=$HOME/src/github.com/jiro4989

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
export PATH=$HOME/.nimble/bin:$PATH

# snap
export PATH=/snap/bin:$PATH

# gem
export PATH=$PATH:$HOME/.gem/bin

# nodejs
export PATH=$HOME/.npm-global/bin:$PATH

# 自作シェル
export PATH=$PATH:$REPO_ROOT/scripts/bin

# gits
export PATH=$PATH:$REPO_ROOT/gits/bin

# GraalVM
export GRAALVM_HOME=/opt/graalvm/current
export PATH=$PATH:$GRAALVM_HOME/bin

EDITOR=nvim
type $EDITOR >&/dev/null || {
  EDITOR=vim
}

export EDITOR

type chromium >/dev/null 2>&1 && export BROWSER=chromium
type chromium-browser >/dev/null 2>&1 && export BROWSER=chromium-browser
export TERMINAL=terminator

export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*" 

# プロンプトの表示を変更
export PS1='\[\033[01;33m\][\t]\[\033[00m\] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

HISTTIMEFORMAT='%Y-%m-%dT%T%z '

export TEXTIMG_EMOJI_DIR=/usr/local/src/noto-emoji/png/128
export TEXTIMG_FONT_FILE=/usr/share/fonts/truetype/hack-gen/HackGen-Regular.ttf
