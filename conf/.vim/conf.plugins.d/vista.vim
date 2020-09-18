function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0

" デフォルトの情報ソースをctagsにする
let g:vista_default_executive = 'ctags'
" 特定の言語の場合vim-lspを利用した情報ソースを利用するようにする
let g:vista_executive_for = {
    \ 'go': 'vim_lsp',
    \ 'python': 'vim_lsp',
    \ }

" トグル(アウトラインを非表示の場合は表示、表示済みの場合は非表示に)
nnoremap <silent> <Leader>o :<C-u>Vista!!<CR>
