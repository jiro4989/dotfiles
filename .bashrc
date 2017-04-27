# 個人設定
# 元々用意されている.bashrcの末尾に追加する設定
# --------

export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH
export WORKING=~/workspace/java/proj/MVCharacterChipSimulator
export PATH=$PATH:$HOME/tools/bashes

# キー入力ロックを無効化
stty stop undef

alias f='java -jar $1'
alias pvim='gvim $1 -u NONE -N'
alias sb='java -jar ~/tools/scenebuilder-all-8.3.0-all.jar $1'
alias newsbeuter='newsbeuter -u ~/dotfiles/rss.txt'

