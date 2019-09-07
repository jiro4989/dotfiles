"スペース2回でCocList
nmap <silent> <Leader>gl :<C-u>CocList<cr>
"スペースhでHover
nmap <silent> <Leader>gh :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <silent> <Leader>gd <Plug>(coc-definition)
"スペースrfでReferences
nmap <silent> <Leader>gr <Plug>(coc-references)
"スペースrnでRename
nmap <silent> <Leader>gn <Plug>(coc-rename)
"スペースfmtでFormat
nmap <silent> <Leader>gf <Plug>(coc-format)
