set expandtab
set tabstop=2
set shiftwidth=2

" キースニペット{{{
" エラーチェック
inorea iferr ret=$?<CR>if [ "$ret" -ne 0 ]; then<CR>: TODO<CR>fi<ESC>k
inorea fori for ((i=0; i<max; i++)); do<CR>: TODO<CR>done<ESC>k
"}}}
