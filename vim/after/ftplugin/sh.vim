set expandtab
set tabstop=2
set shiftwidth=2

" エラーチェック
inorea iferr ret=$?<CR>if [[ "$ret" -ne 0 ]]; then<CR>: TODO<CR>fi<ESC>k

" for
inorea fori for ((i=0; i<max; i++)); do<CR>: TODO<CR>done<ESC>k
inorea forj for ((j=0; j<max; j++)); do<CR>: TODO<CR>done<ESC>k
inorea fork for ((k=0; k<max; k++)); do<CR>: TODO<CR>done<ESC>k

" option parser
inorea optp while ((0 < $#)); do<CR>local opt="$1"<CR>shift<CR>case "$opt" in<CR>-h \| --help)<CR>usage<CR>;;<CR>-v \| --version)<CR>echo "$VERSION"<CR>;;<CR>*)<CR>;;<CR>esac<CR>done<ESC>

" generate main
inorea genm main() {<CR>: TODO<CR>}<CR><CR>usage() {<CR>cat <<- EOS<CR>TODO<CR>EOS<CR>}<CR><CR>main ${1+"$@"}<CR>exit $?<ESC>

" 色の低数値を生成する
function! s:add_colors()
  let l:pos = line('.')
  call append(l:pos, "readonly RED=$'\\x1b[31m'")
  call append(l:pos + 1, "readonly GREEN=$'\\x1b[32m'")
endfunction

command! AddColors call s:add_colors()

" テンプレートファイルを開いてカレントバッファを上書きする
function! s:open_template()
  let l:d = expand(g:CONFIG_ROOT_DIR)
  let l:tmpl_file = l:d . "/template/bash_command.sh"
  let l:data = readfile(l:tmpl_file)
  let l:i = 1
  for l:line in l:data
    call setline(l:i, l:line)
    let l:i = l:i + 1
  endfor
endfunction
command! OpenTemplate call s:open_template()

" 保存時にshfmtをかける
function! s:exec_shfmt()
  let l:pos = getcurpos()
  exe "%!shfmt -i 2 -ci -sr"
  exe ":w"
  call setpos('.', l:pos)
endfunction

augroup auto_style
  autocmd!
  autocmd bufWritePost *.sh call s:exec_shfmt()
augroup END
