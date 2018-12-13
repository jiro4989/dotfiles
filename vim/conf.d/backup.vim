let s:tmp_dir = $HOME . "/tmp"
if !isdirectory(s:tmp_dir)
  call mkdir(s:tmp_dir)
endif

" バックアップファイルの生成場所の変更
set directory=$HOME/tmp
set backupdir=$HOME/tmp
set undodir=$HOME/tmp
