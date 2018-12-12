set encoding=utf-8            " 保存時の文字コード
set fileencoding=utf-8        " 読み込み時の文字コード
set fileencodings=utf-8,cp932 " 読み込み時の文字コード。左が優先
scriptencoding utf-8          " スクリプト内でマルチバイト文字を扱う場合に必要
set fileformats=unix,dos,mac  " 改行コードの自動判別。左が優先
set ambiwidth=double          " □といった文字が崩れる問題の解決

"set runtimepath+=~/.vim/colors
"set runtimepath+=~/.vim/after/ftplugin

runtime! init.d/*.vim

source <sfile>:h/plugin.vim
