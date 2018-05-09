" ファイラー機能を追加するプラグイン
" ==================================

" 開いたファイルの場所をカレントディレクトりに変更
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')
"
" キーバインド
nnoremap <Leader><Leader>o :VimFiler <CR>
nnoremap <Leader><Leader>p :VimFilerExplorer .<CR>
nnoremap <C-c> :Unite bookmark<CR>
