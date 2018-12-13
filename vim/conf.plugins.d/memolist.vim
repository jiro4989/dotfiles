" メモの保存先
let g:memolist_path = "$HOME/Dropbox/memo"

" 拡張子タイプ (default markdown)
let g:memolist_memo_suffix = "md"

" 日付書式 (default %Y-%m-%d %H:%M)
let g:memolist_memo_date = "%Y-%m-%d %H:%M:%S"

" tags prompt (default 0)
let g:memolist_prompt_tags = 0

" categories prompt (default 0)
let g:memolist_prompt_categories = 0

" use qfixgrep (default 0)
" let g:memolist_qfixgrep = 1

" use vimfler (default 0)
let g:memolist_vimfiler = 0

" remove filename prefix (default 0)
let g:memolist_filename_prefix_none = 0

" use unite (default 0)
let g:memolist_unite = 1

" use arbitrary unite source (default is 'file')
let g:memolist_unite_source = "file_rec"

" use arbitrary unite option (default is empty)
let g:memolist_unite_option = "-auto-preview -start-insert"

" use denite (default 0)
let g:memolist_denite = 1

" use arbitrary denite source (default is 'file_rec')
let g:memolist_denite_source = "anything"

" use arbitrary denite option (default is empty)
let g:memolist_denite_option = "anything"

" use various Ex commands (default '')
"let g:memolist_ex_cmd = 'CtrlP'
"let g:memolist_ex_cmd = 'NERDTree'

" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','

" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
let g:memolist_delimiter_yaml_start = "---"

" last line string pattern of yaml front matter (default "- - -")
let g:memolist_delimiter_yaml_end  = "---"

nnoremap <Leader>mn :MemoNew<CR>
nnoremap <Leader>ml :MemoList<CR>
nnoremap <Leader>mg :MemoGrep<CR>

