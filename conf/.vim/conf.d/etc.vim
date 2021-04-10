" etc.vim は分類に悩んだ雑多な設定を定義する。
" ============================================
"
" その他の設定ファイルに分類するのに悩んだ細かい設定をここに定義する。
"
" 雑多な設定なので、あまりここに設定を定義しすぎてはならない。既存の設定ファイル
" に分類できないか、あるいはここの雑多な設定をまとめて別ファイルに吐き出せないか
" 県とすること。

set autoread    " 外部でファイルに変更があった時に自動で読み込みなおす
set autochdir   " 自動で開いたファイルにcdする
set nobomb      " BOMなしで保存する
set nrformats=  " 0から始まる数字もすべて10進数としてインクリメント可能に変更
set history=200 " コマンドの履歴の保存上限を変更
set backspace=indent,eol,start " なぜかインデントが消せなくなるの対策

" バッファ起動時になぜかIMEが起動してしまっていたので無効化
set iminsert=0
set imsearch=-1

set expandtab    " Tabをスペースに変換
set tabstop=2    " Tab幅
set shiftwidth=2 " 自動挿入されるインデントスペース幅

set textwidth=80      " 文字列の折り返し桁数
set foldmethod=marker " マーカー折り畳みを有効化

" Note: formatoptions+=a を有効にするとunite.vimが正常に動作しなくなるので全てに
" 適用されるようにフラグをセットするのは危険行末に空白を挟むことで自動整形が有効
" になる。
set formatoptions+=c  " コメンド行にのみ適用
set formatoptions+=j  " コメントリーダーを可能な限り削除
set formatoptions+=mM " マルチバイト文字に対応
set formatoptions+=n  " 番号付きリストに対応

