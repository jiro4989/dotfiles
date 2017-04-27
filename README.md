# dotfiles

vimの環境やubuntuの環境構築するクリプトを管理するリポジトリ

## 注意点

mklinks.batを実行したあと、vimの初回起動時にファイルダウンロードが始まらなかった
場合、ホームディレクトリのパスが異なっているのが原因の時がある。(Win環境の場合)

実行されなかった場合は要確認の後、vimの$homeのディレクトリにファイルとフォルダを
移す必要がある。

自分の実行環境では以下のようになった。

- Windows7の場合

  - %userprofile% -> あり
  - %home%        -> なし

- Windows8の場合

  - %userprofile% -> userdir
  - %home%        -> userdir/Documents

## javaのパス

~/.bashrcファイルに

export JAVA_HOME=/usr/lib/jvm/java-8-oracle

export PATH=$JAVA_HOME/bin:$PATH
