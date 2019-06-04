" " LSPのlint機能をOFF
" " https://qiita.com/succi0303/items/cd30d0ea40d419d4431c
" " let g:lsp_diagnostics_enabled = 0
" " debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/log/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/log/asyncomplete.log')

" Python
if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif

" Go
if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif

" CSS
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

" Bash
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'whitelist': ['sh'],
        \ })
endif

nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>p :LspHover<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>s :split \| :LspDefinition <CR>
nnoremap <silent> <Leader>v :vsplit \| :LspDefinition <CR>
