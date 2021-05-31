" Goでgoimportsが自動で走るようにする
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" SQL保存時にフォーマットする
" フォーマットのされ方が微妙だった
" autocmd BufWritePre *.sql :silent call CocAction('runCommand', 'sql.Format')

" Markdown保存時にLinterの指摘を修正する
autocmd BufWritePre *.md :silent call CocAction('runCommand', 'markdownlint.fixAll')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> g<space> <Plug>(coc-format)
