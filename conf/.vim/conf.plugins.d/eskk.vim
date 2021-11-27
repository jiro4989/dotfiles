let s:config_dir = expand('~/.config/eskk')
let s:dict_filename = 'SKK-JISYO.L'
let s:dictfile = s:config_dir . '/' . s:dict_filename

" SKK辞書が無い時はDLしてくる
if !filereadable(s:dictfile)
  call mkdir(s:config_dir, 'p')
  call system('cd ' . s:config_dir . ' && wget http://openlab.jp/skk/dic/' . s:dict_filename . '.gz && gzip -d ' . s:dict_filename . '.gz')
endif

let g:eskk#directory = s:config_dir
let g:eskk#dictionary = { 'path': s:config_dir . "/mydict", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': s:dictfile, 'sorted': 1, 'encoding': 'euc-jp',}

let g:eskk#kakutei_when_unique_candidate = 1 "漢字変換した時に候補が1つの場合、自動的に確定する
let g:eskk#enable_completion = 0             "neocompleteを入れないと、1にすると動作しなくなるため0推奨
let g:eskk#no_default_mappings = 1           "デフォルトのマッピングを削除
let g:eskk#keep_state = 0                    "ノーマルモードに戻るとeskkモードを初期値にする
let g:eskk#egg_like_newline = 1              "漢字変換を確定しても改行しない。

" 三角記号では判別ができないため
let g:eskk#marker_henkan = "[変換]"
let g:eskk#marker_henkan_select = "[選択]"
let g:eskk#marker_okuri = "[送り]"
let g:eskk#marker_jisyo_touroku = "[辞書]"

" 何故か <C-j> を押したらEnterになる。 :verbose imap <C-j> でも見つからない
autocmd VimEnter * imap <C-j> <Plug>(eskk:toggle)
autocmd VimEnter * cmap <C-j> <Plug>(eskk:toggle)
