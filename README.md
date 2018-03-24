# dotfiles
Vimの設定ファイル管理リポジトリ

## javaのパス

~/.bashrcファイルに

export JAVA_HOME=/usr/lib/jvm/java-8-oracle

export PATH=$JAVA_HOME/bin:$PATH

## githubでユーザ名とパスワード名の省略

~/.netrc に下記のテキストを追加。
(内容は必要に応じて変更)

```.netrc
machine github.com
login username
password xxxxxxx
```

