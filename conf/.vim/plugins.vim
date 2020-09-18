function! s:source_conf(conf)
  execute('source ' . g:CONFIG_ROOT_DIR . '/conf.plugins.d/' . a:conf)
endfunction

call plug#begin('~/.vim/plugged')

" ファイラー
Plug 'cocopon/vaffle.vim'
call s:source_conf('vaffle.vim')

" 桁揃え
Plug 'h1mesuke/vim-alignta'
call s:source_conf('vim-alignta.vim')

" 括弧補完
Plug 'cohama/lexima.vim'

" コメントアウト
Plug 'tyru/caw.vim'
call s:source_conf('caw.vim')

" 折りたたみ時のタイトル表示変更
Plug 'LeafCage/foldCC'

" スニペット
Plug 'honza/vim-snippets'

" オートコンプリート + Language Server Protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
call s:source_conf('vim-lsp.vim')
Plug 'prabirshrestha/asyncomplete.vim'
call s:source_conf('asyncomplete.vim')
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
" LSPのシンボル・タグビューワ
Plug 'liuchengxu/vista.vim'
call s:source_conf('vista.vim')

" 差分表示を左端に表示
Plug 'airblade/vim-gitgutter'

" 非同期コードチェック
Plug 'w0rp/ale'

call plug#end()
