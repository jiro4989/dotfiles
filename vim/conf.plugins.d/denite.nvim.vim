nnoremap [denite] <Nop>

" プレフィックスキー
nmap <Leader>u [denite]

nmap <silent> [denite]h :<C-u>Denite file_mru<CR>i
nmap <silent> [denite]g :<C-u>Denite grep<CR>
nmap <silent> [denite]t :<C-u>Denite filetype<CR>
nmap <silent> [denite]p :<C-u>Denite file_rec<CR>
nmap <silent> [denite]j :<C-u>Denite line<CR>
nmap <silent> [denite]] :<C-u>DeniteCursorWord grep<CR>
nmap <silent> [denite]y :<C-u>Denite neoyank<CR>
nmap <silent> [denite]r :<C-u>Denite -resume<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
