# Java
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
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
export PATH=$PATH:~/.bin

# キー入力ロックを無効化
stty stop undef

# 画面ロックエイリアスの追加
alias lock='gnome-screensaver-command -l'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jiro/.sdkman"
[[ -s "/home/jiro/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jiro/.sdkman/bin/sdkman-init.sh"

alias glog='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

# プロンプトにgitのブランチ名を表示する
source $HOME/dotfiles/.git-prompt.sh

# プロンプトの表示を変更
export PS1='\[\033[01;33m\][\t]\[\033[00m\] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
