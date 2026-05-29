" 文字入力中やテキスト変更時にはALEを走らせない
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0

" ファイルを開いたときと、保存したときだけ実行する
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
