# vim

Vimの設定ファイル構成を記載。

## ディレクトリ

```bash
tree -L 1 --charset=C 
```

    .
    |-- README.md
    |-- after
    |-- autoload
    |-- colors
    |-- conf.d
    |-- conf.plugins.d
    |-- dict
    |-- gvimrc
    |-- init.vim
    |-- minvimrc
    |-- plugged
    |-- plugins.vim
    |-- template
    |-- vimperatorrc
    |-- vimrc
    `-- vrapperrc

## 設定

| ファイル/ディレクトリ | 説明                                                          |
|-----------------------|---------------------------------------------------------------|
| vimrc                 | 設定の起点。いわゆるindex的な設定                             |
| init.vim              | neovimの設定。実体はvimrcをsourceするだけ                     |
| plugins.vim           | vimrcからsource。プラグイン設定のindex                        |
| conf.d                | vim標準機能の各種設定ファイルを配置                           |
| conf.plugins.d        | vimpluginの各種設定ファイルを配置。ファイル名はpluginname.vim |

## 設定の適用方法

`$HOME/.vim`にこのvimディレクトリのシンボリックリンクを貼るだけで機能する。
配置後はvimのプラグインマネージャで各種プラグインをインストールすれば
プラグイン設定も完了する。

シンボリックリンクを貼るコマンドは下記。

```bash
ln -sfn $HOME/dotfiles/vim $HOME/.vim
```
