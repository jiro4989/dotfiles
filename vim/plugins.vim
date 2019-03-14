function! s:_source(filename)
  return execute('source ' . g:CONFIG_ROOT_DIR . '/conf.plugins.d/' . a:filename)
endfunction

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     導入するプラグイン設定を記述する範囲
"                            ↓↓↓ ここから ↓↓↓
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1. 全般/共通 {{{

" 統一的UI
Plug 'Shougo/unite.vim'
call s:_source('unite.vim')
Plug 'Shougo/neomru.vim'

" ファイラー
Plug 'cocopon/vaffle.vim'
call s:_source('vaffle.vim')

" 桁揃え
Plug 'h1mesuke/vim-alignta'
call s:_source('vim-alignta.vim')

" 括り文字操作
Plug 'tpope/vim-surround'

" 括弧補完
Plug 'cohama/lexima.vim'

" コメントアウト
Plug 'tyru/caw.vim'
call s:_source('caw.vim')

" 折りたたみ時のタイトル表示変更
Plug 'LeafCage/foldCC'

" ヤンクハイライト
Plug 'machakann/vim-highlightedyank'

" スニペット
Plug 'SirVer/ultisnips'
call s:_source('ultisnips.vim')
Plug 'honza/vim-snippets'

" Language Server Protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
call s:_source('asyncomplete.vim.vim')
Plug 'prabirshrestha/vim-lsp'
call s:_source('vim-lsp.vim')
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
let g:lsp_async_completion = 1

" 差分表示を左端に表示
Plug 'airblade/vim-gitgutter'
call s:_source('vim-gitgutter.vim')
"}}}

" 2. 言語別設定 {{{

" Go
Plug 'fatih/vim-go', { 'for':'go' }
autocmd! User vim-go call s:_source('vim-go.vim')

" Nim
Plug 'zah/nim.vim', { 'for':'nim' }

" HTMLスニペット
Plug 'mattn/emmet-vim', { 'for':'html' }
autocmd! User emmet-vim call s:_source('vim-alignta.vim')

" シンタックスハイライトとインデント
Plug 'pangloss/vim-javascript', { 'for':'javascript' }

" メソッド補完
Plug 'mattn/jscomplete-vim', { 'for':'javascript' }
autocmd! User jscomplete-vim call s:_source('jscomplete-vim.vim')

" CSS3
Plug 'hail2u/vim-css3-syntax', { 'for':'css' }

" PowerShell
Plug 'PProvost/vim-ps1', { 'for':'ps1' }

" Node.js
Plug 'myhere/vim-nodejs-complete', { 'for':'javascript' }
autocmd! User vim-nodejs-complete call s:_source('vim-nodejs-complete.vim')

" Markdown
" アウトライナ
Plug 'vim-scripts/VOoM'

Plug 'rcmdnk/vim-markdown', { 'for':['md', 'markdown'] }
autocmd! User vim-markdown call s:_source('vim-markdown.vim')

Plug 'dhruvasagar/vim-table-mode', { 'for':'markdown' }
autocmd! User vim-table-mode call s:_source('vim-table-mode.vim')

" Markdown形式の目次を自動生成する
Plug 'mzlogin/vim-markdown-toc', { 'for':['md', 'markdown'] }

" TOML
Plug 'cespare/vim-toml', { 'for':'toml' }

" CSVハイライト
Plug 'mechatroner/rainbow_csv'

" Formatter
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities', { 'for':'sql' }

" PlantUML
Plug 'aklt/plantuml-syntax', {'for':'plantuml'}
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            ↑↑↑ ここまで ↑↑↑
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()
