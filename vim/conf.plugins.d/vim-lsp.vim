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
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
    autocmd FileType go setlocal omnifunc=lsp#complete
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

let g:lsp_async_completion = 1
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gp :LspHover<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gi :LspImplementation<CR>
nnoremap <silent> gs :split \| :LspDefinition <CR>
nnoremap <silent> gv :vsplit \| :LspDefinition <CR>
