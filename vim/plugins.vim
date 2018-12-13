let s:base_dir = expand('<sfile>:p:h')

function! s:_source(filename)
  return execute('source ' . s:base_dir . '/conf.plugins.d/' . a:filename)
endfunction

call plug#begin('~/.vim/plugged')

" 追加で導入するプラグイン

Plug 'Shougo/unite.vim'
call s:_source('unite.vim')

Plug 'Shougo/neocomplete.vim'
call s:_source('neocomplete.vim')

Plug 'Shougo/neomru.vim'

" ファイラー
Plug 'cocopon/vaffle.vim'
call s:_source('vaffle.vim')

" Gitの差分表示
Plug 'tpope/vim-fugitive'
call s:_source('vim-fugitive.vim')

Plug 'airblade/vim-gitgutter'
call s:_source('vim-gitgutter.vim')

" 桁揃え
Plug 'h1mesuke/vim-alignta'
call s:_source('vim-alignta.vim')

Plug 'mattn/emmet-vim', { 'for':'html' }
autocmd! User emmet-vim call s:_source('vim-alignta.vim')
"
Plug 'PProvost/vim-ps1', { 'for':'ps1' }

Plug 'fatih/vim-go', { 'for':'go' }
autocmd! User vim-go call s:_source('vim-go.vim')

Plug 'aklt/plantuml-syntax', { 'for':'puml' }

Plug 'rcmdnk/vim-markdown', { 'for':['md', 'markdown'] }
autocmd! User vim-markdown call s:_source('vim-markdown.vim')
"
Plug 'cespare/vim-toml', { 'for':'toml' }

Plug 'dhruvasagar/vim-table-mode', { 'for':'markdown' }
autocmd! User vim-table-mode call s:_source('vim-table-mode.vim')

Plug 'hail2u/vim-css3-syntax', { 'for':'css' }

" Javascript
" シンタックスハイライトとインデント
Plug 'pangloss/vim-javascript', { 'for':'javascript' }

" メソッド補完
Plug 'mattn/jscomplete-vim', { 'for':'javascript' }
autocmd! User jscomplete-vim call s:_source('jscomplete-vim.vim')

" Node.js
" メソッド補完
Plug 'myhere/vim-nodejs-complete', { 'for':'javascript' }
autocmd! User vim-nodejs-complete call s:_source('vim-nodejs-complete.vim')

" 括り文字操作
Plug 'tpope/vim-surround'

" 括弧補完
Plug 'cohama/lexima.vim'

" Markdownアウトライナ
Plug 'vim-scripts/VOoM'

" CSVハイライト
Plug 'mechatroner/rainbow_csv'

" SQL Formatter
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities', { 'for':'sql' }

Plug 'aklt/plantuml-syntax', {'for':'plantuml'}

" コメントアウト
Plug 'tyru/caw.vim'
call s:_source('caw.vim')

" 折りたたみタイトル
Plug 'LeafCage/foldCC'

" ヤンクハイライト
Plug 'machakann/vim-highlightedyank'

" Nim
Plug 'zah/nim.vim'

call plug#end()
