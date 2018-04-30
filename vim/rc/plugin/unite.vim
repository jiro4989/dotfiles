" 共通のインターフェイスを提供するプラグイン
" ==========================================

" オプション設定"{{{

" インサートモードで開始
let g:unite_enable_start_insert             = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit           = 50
" 大文字小文字を区別しない
let g:unite_enable_ignore_case              = 1
" スマートケース
let g:unite_enable_smart_case               = 1
" file_mruの表示フォーマットを指定。
let g:unite_source_file_mru_filename_format = ''

"}}}

" マッピング "{{{

nnoremap [unite] <Nop>
" プレフィックスキー
nmap <Leader>f [unite]
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーを設定
autocmd FileType unite call s:unite_my_settings()

"}}}

" uniteを開いている間のキーバインド"{{{

function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

"}}}

