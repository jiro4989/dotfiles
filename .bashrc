# Java
export JAVA_HOME=/usr/lib/jvm/java-10-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/lib/go-1.10/bin:$GOBIN

# SetupScriptDir
export SETUP_SCRIPT_DIR=$HOME/workspace/github/repos/scripts/setup
export GOWORKSPACE=$GOPATH/src/github.com/jiro4989
export BLOG=~/workspace/github/repos/jilog-hugo

# 追加したコマンド系
export PATH=$PATH:~/bin

# キー入力ロックを無効化
stty stop undef

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jiro/.sdkman"
[[ -s "/home/jiro/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jiro/.sdkman/bin/sdkman-init.sh"

# プロンプトにgitのブランチ名を表示する
source $HOME/dotfiles/.git-prompt.sh

# プロンプトの表示を変更
export PS1='\[\033[01;33m\][\t]\[\033[00m\] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

# エイリアス
# ----------

# 画面ロック
alias lock='gnome-screensaver-command -l'
# git log one line
alias glog='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
alias llh='ls -lah'
alias gomydir="cd $GOPATH/src/github.com/jiro4989"

export EDITOR=vim
export BROWSER=chromium
export TERMINAL=terminator

export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*" 

#export QT_DIR="$HOME/Qt"
#export QT_VERSION="5.11.1"
