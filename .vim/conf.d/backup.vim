" backup.vim はVimが生成するスワップファイルの保存先の設定を定義する。
" ===================================================================

" バックアップ保存先が存在しないときはディレクトリを生成する。
let s:tmp_dir = $HOME . "/tmp"
if !isdirectory(s:tmp_dir)
  call mkdir(s:tmp_dir)
endif

" バックアップファイルの生成場所の変更
set directory=$HOME/tmp
set backupdir=$HOME/tmp
set undodir=$HOME/tmp
