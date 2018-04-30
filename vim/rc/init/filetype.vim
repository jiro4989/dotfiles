" 拡張子マッピング
au BufNewFile,BufRead *.{kt} setlocal filetype=kotlin
au BufNewFile,BufRead *.ts   setlocal filetype=typescript
au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setlocal filetype=markdown

" タブ設定
au BufNewFile,BufRead *.py     setlocal expandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead Makefile setlocal noexpandtab tabstop=4 shiftwidth=4

" 新規ファイルを開いた時にテンプレートを読み込む
au BufNewFile *.py 0r        $HOME/.vim/template/python.txt
au BufNewFile *.java 0r      $HOME/.vim/template/java.txt
au BufNewFile *.sh,*.bash 0r $HOME/.vim/template/bash.txt
au BufNewFile *.go 0r        $HOME/.vim/template/go.txt

" ファイル内に複数の拡張子が登場するときのシンタックス判定の範囲設定
autocmd FileType jsp,asp,php,xml,perl,html,javascript,css syntax sync minlines=500 maxlines=1000

au FileType markdown setlocal nowrap
au FileType html,xml,fxml setlocal nowrap textwidth=0
