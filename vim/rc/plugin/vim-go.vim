let g:go_bin_path = expand($GOPATH . "/bin")

" GOプログラムの入力補完
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" インポート補完
let g:go_fmt_command = "goimports"

