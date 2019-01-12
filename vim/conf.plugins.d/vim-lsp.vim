" Python
if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif

" " Go
" if executable('golsp')
"     au User lsp_setup call lsp#register_server({
"        \ 'name': 'golsp',
"        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
"        \ 'whitelist': ['go'],
"        \ })
" endif
