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
        \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
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

nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>p :LspHover<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>s :split \| :LspDefinition <CR>
nnoremap <silent> <Leader>v :vsplit \| :LspDefinition <CR>
