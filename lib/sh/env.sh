#!/bin/bash

# 日本語を使用
export LANG=ja_JP.UTF-8

# Java
export JAVA_HOME=/usr/lib/jvm/java-10-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Go
export GOPATH=$HOME
export PATH=$PATH:/usr/lib/go-1.10/bin

# 追加したコマンド系
export PATH=$PATH:$HOME/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# nim
export PATH=/home/jiro/.nimble/bin:$PATH

export BROWSER=chromium-browser

export EDITOR=vim
export BROWSER=chromium-browser
export TERMINAL=terminator

export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*" 

# プロンプトの表示を変更
export PS1='\[\033[01;33m\][\t]\[\033[00m\] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

HISTTIMEFORMAT='%Y-%m-%dT%T%z '

