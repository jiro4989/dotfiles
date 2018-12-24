# dotfiles

設定ファイルと環境構築スクリプトを管理する。

## ディレクトリ構成

```bash
tree -dL 2 --charset=C
```

    .
    |-- atom
    |-- bash
    |   `-- conf.plugins.d
    |-- lib
    |   `-- sh
    |-- spacemacs
    |-- vim
    |   |-- after
    |   |-- autoload
    |   |-- colors
    |   |-- conf.d
    |   |-- conf.plugins.d
    |   |-- dict
    |   |-- plugged
    |   `-- template
    `-- zsh
        |-- conf.d
        `-- img

## 環境構築

以下のコマンドを実行.

### Ubuntu

全部の環境構築

```bash
curl https://raw.githubusercontent.com/jiro4989/dotfiles/master/setup/ubuntu.sh | bash
```

部分的に環境構築したい場合

```bash
cd setup
./ubuntu.sh -h
# -> 指定可能なサブコマンドが表示されるのでそれを指定する
#    ex: ./ubuntu.sh vim
```

インストールしたパッケージの入出力

```bash
cd setup

# インストールする
./pkg.sh in ubuntu

# パッケージ一覧をファイル保存する
./pkg.sh out ubuntu
```

## lib/sh

bash/zsh共通の設定を管理
