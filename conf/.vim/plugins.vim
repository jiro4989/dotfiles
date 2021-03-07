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
" FIXME: 何故かインストールしていた
" Plug 'vim-scripts/Align'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call s:source_conf('coc.nvim.vim')

" 差分表示を左端に表示
Plug 'airblade/vim-gitgutter'

" 非同期コードチェック
Plug 'w0rp/ale'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call s:source_conf('fzf.vim')

" Nim補完
Plug 'alaviss/nim.nvim', { 'for': ['nim', 'nimble'] }
call s:source_conf('nim.nvim.vim')

" HTMLスニペット
Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

Plug 'PProvost/vim-ps1', { 'for': ['ps1', 'powershell'] }

Plug 'godlygeek/tabular', { 'for': ['markdown', 'md'] }

" Markdown形式の目次を自動生成する
Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown', 'md'] }

Plug 'cespare/vim-toml', { 'for': 'toml' }

" CSVハイライト
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }

Plug 'vim-scripts/SQLUtilities', { 'for': 'sql' }

Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }

Plug 'hashivim/vim-terraform', { 'for': ['terraform', 'tf'] }
call s:source_conf('vim-terraform.vim')

" reStructuredText
Plug 'Rykka/riv.vim', { 'for': 'rst' }

" Clojure
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
call s:source_conf('vim-iced.vim')

call plug#end()
