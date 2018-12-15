# dotfiles

設定ファイルを管理する。

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

## vim

設定ファイルはここで管理しているけれど、vimの環境を構築するスクリプトは別で管理
している。リポジトリは[scripts](https://github.com/jiro4989/scripts)で管理。

`scripts/shell/vim.sh`を実行するだけでvimの環境構築は完了する。

## lib/sh

bash/zsh共通の設定を管理
