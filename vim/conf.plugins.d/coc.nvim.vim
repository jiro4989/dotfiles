" 曖昧検索
nmap <silent> <Leader>cl :<C-u>CocList<cr>

" Hover (document表示)
nmap <silent> <Leader>ch :<C-u>call CocAction('doHover')<cr>

" 関数・変数定義場所へ移動
nmap <silent> <Leader>cd <Plug>(coc-definition)

" 参照先へジャンプ
nmap <silent> <Leader>cr <Plug>(coc-references)

" リネーム
nmap <silent> <Leader>cn <Plug>(coc-rename)

" フォーマット
nmap <silent> <Leader>cf <Plug>(coc-format)
