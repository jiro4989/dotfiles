# 個人設定
# 元々用意されている.bashrcの末尾に追加する設定

export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/lib/go-1.9/bin/:$GOPATH/bin

# キー入力ロックを無効化
stty stop undef
