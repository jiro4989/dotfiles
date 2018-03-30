set encoding=utf-8            " 保存時の文字コード
set fileencoding=utf-8        " 読み込み時の文字コード
set fileencodings=utf-8,cp932 " 読み込み時の文字コード。左が優先
scriptencoding utf-8          " スクリプト内でマルチバイト文字を扱う場合に必要
set fileformats=unix,dos,mac  " 改行コードの自動判別。左が優先
set ambiwidth=double          " □といった文字が崩れる問題の解決

" マッピングにおけるプレフィックスキー
let mapleader = "\<Space>"
let maplocalleader = ","

" プラグイン設定
set runtimepath+=~/.vim
set runtimepath+=~/.vim/colors
set runtimepath+=~/.vim/after/ftplugin
source ~/.vim/rc/dein/rc.vim

" オプション
" --------------

" UI"{{{

if has("win32") || has("win64")
  colorscheme molokai
else
  colorscheme molokai
  syntax on
  set t_Co=256
endif

set number           " 行番号を表示
set ruler            " カーソルの位置表示
set incsearch        " インクリメンタルサーチ
set hlsearch         " 検索語句のハイライト
set display=lastline " テキストが長すぎて表示しきれない場合でも表示する
set cursorline       " カーソル位置の行番号のハイライト

" 不可視文字の表示
set list
" 不可視文字を表示方法
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示"{{{
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
"}}}
" vimgrepを行った時にQuickFixWindowを開く"{{{
augroup grepopen
  autocmd!
  autocmd QuickfixCmdPost vimgrep cw
augroup END
"}}}
" 開いたファイルをカレントディレクトリに設定"{{{
augroup grlcd
  autocmd!
  autocmd BufEnter * lcd %:p:h
augroup END
"}}}

"}}}
" 保存"{{{
set nobomb " BOMなしで保存する

" バックアップファイルの生成場所の変更
set directory=$HOME/tmp
set backupdir=$HOME/tmp
set undodir=$HOME/tmp

" ファイルエンコーディングや文字コードを表示
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

"}}}
" 編集"{{{

set expandtab    " Tabをスペースに変換
set tabstop=2    " Tab幅
set shiftwidth=2 " 自動挿入されるインデントスペース幅
set nrformats=   " 0から始まる数字もすべて10進数としてインクリメント可能に変更
set history=200  " コマンドの履歴の保存上限を変更
" set clipboard=unnamedplus " クリップボードにコピー
set backspace=indent,eol,start " なぜかインデントが消せなくなるの対策

" バッファ起動時になぜかIMEが起動してしまっていたので無効化
set iminsert=0
set imsearch=-1

"}}}
" 拡張子設定"{{{ 
au BufNewFile,BufRead *.{kt} set filetype=kotlin

" マークダウン拡張子の統一
au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
au BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.ts set filetype=typescript

" 新規ファイルを開いた時にテンプレートを読み込む
au BufNewFile *.py 0r $HOME/.vim/template/python.txt
au BufNewFile *.java 0r $HOME/.vim/template/java.txt
au BufNewFile *.sh,*.bash 0r $HOME/.vim/template/bash.txt

" ファイル内に複数の拡張子が登場するときのシンタックス判定の範囲設定
autocmd FileType jsp,asp,php,xml,perl,html,javascript,css syntax sync minlines=500 maxlines=1000

"}}}
" テキスト整形"{{{

set textwidth=80      " 文字列の折り返し桁数
set foldmethod=marker " マーカー折り畳みを有効化
set formatoptions+=c  " コメンド行にのみ適用
set formatoptions+=j  " コメントリーダーを可能な限り削除
set formatoptions+=mM " マルチバイト文字に対応
set formatoptions+=n  " 番号付きリストに対応

" Note: formatoptions+=a を有効にするとunite.vimが正常に動作しなくなるので全てに
" 適用されるようにフラグをセットするのは危険行末に空白を挟むことで自動整形が有効
" になる。
au FileType markdown,html,xml,fxml setlocal nowrap
au FileType html,xml,fxml setlocal textwidth=0
au FileType python setlocal foldmethod=indent foldnestmax=1

"}}}

" マッピング
" ----------

" 試験運用中"{{{

" 改行のみの行を削除
vnoremap <Leader>d :s/^\n//g<CR>

"}}}


nnoremap <Leader>s :terminal ++close ++curwin<CR>

" 折りたたみ"{{{

" 折りたたみの開閉
nnoremap + za

" 折りたたみの生成
nnoremap <Leader><Leader>f va{zf

"}}}
" 頻出利用コマンドの置き換え"{{{

inoremap jj <Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Escの置き換え
noremap <C-j> <Esc>
noremap! <C-j> <Esc>

" コロンの置き換え
nnoremap <C-n> :

" 一文字削除でヤンクを上書きしない
nnoremap x "_x

" Yコマンドを他のコマンドの規則性に合わせる
nnoremap Y y$

" 行頭行末へ移動
nnoremap <Leader>h ^
nnoremap <Leader>l $

" タブ切り替え
nnoremap <C-l> gt
nnoremap <C-h> gT

" 箇条書き文章の文章番号をインクリメントしてコピー
nnoremap <C-b> yyp<C-a>

" コマンド履歴の切り替え
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"}}}
" 検索 "{{{

" 標準の検索でのエスケープを不要にする
nnoremap / /\v

" 検索ハイライトを消去
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-j><C-j> :nohlsearch<CR>

" vimgrepの検索候補ジャンプ
nnoremap ( :cprevious<CR>
nnoremap ) :cnext<CR>

"}}}
" 置換 "{{{

nnoremap gs :%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>

"}}}
" 整形 "{{{

" 行末の空白を削除
nnoremap <Leader><Leader>d :%s/\s\+$//ge<CR>

" フォーマット
nnoremap <Leader><Leader>i mhgg=G'h

" 80桁目以降をハイライトするオプションの切り替え"{{{

noremap <Plug>(ToggleColorColumn)
      \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
      \   join(range(81, 9999), ',')<CR>
nnoremap <Leader><Leader>c <Plug>(ToggleColorColumn)

"}}}

"}}}
" ウィンドウ幅の操作"{{{

" 行幅の変更
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-

" 列幅の変更
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

"}}}
" テキスト入力"{{{

" 挿入モード終了時にIME状態を保存しない
inoremap <Silent> <Esc> <Esc>
inoremap <Silent> <C-j> <Esc>

" 括弧補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i

" 行末にセミコロンを追加
inoremap <C-l> <ESC>$a;

"}}}
" 危険なコマンドの無効化"{{{

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

"}}}
" vimrcを開く"{{{

nnoremap <Leader><Leader>. :e $HOME/.vimrc<CR>

"}}}
" todoメモを開く{{{
nnoremap <Leader><Leader>t :e ~/Dropbox/note/task/todo.txt<CR>
"}}}
