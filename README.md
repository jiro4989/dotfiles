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

Ubuntu用

```bash
curl https://raw.githubusercontent.com/jiro4989/dotfiles/master/setup/ubuntu.sh | bash
```

## lib/sh

bash/zsh共通の設定を管理
