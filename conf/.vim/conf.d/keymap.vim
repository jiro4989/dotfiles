" keymap.vim はキーマップを定義する。
" ===================================

" マッピングにおけるプレフィックスキー
let mapleader = "\<Space>"
let maplocalleader = ","

" よく使う{{{

" 一文字削除でヤンクを上書きしない
nnoremap x "_x

" Yコマンドを他のコマンドの規則性に合わせる
nnoremap Y y$

" タブ切り替え
nnoremap <C-l> gt
nnoremap <C-h> gT

" 箇条書き文章の文章番号をインクリメントしてコピー
nnoremap <C-b> yyp<C-a>

" 置換
nnoremap gs :%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>

" ファイル全体のインデント
nnoremap <Leader><Leader>i mhgg=G'h

" クリップボード操作
nnoremap <C-c> V"+y
"nnoremap <C-x> V"+d
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-g> "+p

" TAGで補完を入力
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"}}}

" 検索{{{

"" 標準の検索でのエスケープを不要にする
nnoremap / /\v

"" 検索ハイライトを消去
nnoremap <ESC><ESC> :nohlsearch<CR>

"" vimgrepの検索候補ジャンプ
nnoremap ( :cprevious<CR>
nnoremap ) :cnext<CR>

"}}}

" ウィンドウ幅の操作{{{

"" 行幅の変更
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-

"" 列幅の変更
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

"}}}

" テキスト入力{{{

"" 挿入モード終了時にIME状態を保存しない
inoremap <Silent> <Esc> <Esc>
inoremap <Silent> <C-j> <Esc>

"" 行末にセミコロンを追加
inoremap <C-l> <ESC>$a;

"}}}

" 危険なコマンドの無効化{{{

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

"}}}

" 特別なファイルを開く{{{

"" vimrcを開く
nnoremap <Leader><Leader>. :e $HOME/.vim/vimrc<CR>

"" プラグイン初期化ファイルを開く
nnoremap <Leader><Leader>p :e $HOME/.vim/plugins.vim<CR>
nnoremap <Leader><Leader>d :e $HOME/.vim/conf.plugins.d/dein.toml<CR>
nnoremap <Leader><Leader>D :e $HOME/.vim/conf.plugins.d/dein_lazy.toml<CR>

"}}}

