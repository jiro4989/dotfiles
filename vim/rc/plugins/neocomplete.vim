" IDEのあいまい補完を実装するプラグイン
" =====================================
"
" オプション設定"{{{

" neocompleteを使う
let g:neocomplete#enable_at_startup          = 1
" スマートケースを使用する
let g:neocomplete#enable_smart_case          = 1
" アンダーバー補完を使用する
let g:neocomplete#enable_underbar_completion = 1

"}}}
"
" 辞書ファイルのパスを追加"{{{
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'scala' : $HOME . '/.vim/dict/scala.dict',
      \ 'java' : $HOME . '/.vim/dict/java.dict',
      \ 'kotlin' : $HOME . '/.vim/dict/kotlin.dict',
      \ }
"}}}
"
" 変更不要"{{{
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
"}}}
"
" キーバインド"{{{

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

"}}}

