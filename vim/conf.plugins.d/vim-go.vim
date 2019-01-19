let g:go_bin_path = expand($GOPATH . "/bin")

" GOプログラムの入力補完
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" インポート補完
let g:go_fmt_command = "goimports"

" Ctrl-J無効化
let g:go_def_mapping_enabled = 0

" GoTest時の画面分割
let g:go_term_mode = 'split'
