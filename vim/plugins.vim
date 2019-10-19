" plugins.vim はプラグイン設定のindexである。
" ===========================================
"
" 各プラグインの設定は `conf.plugins.d/*.vim` に記述する。
"
" ここにはプラグインの設定を書いてはならない。設定ファイルをsourceするだけに留め
" ること。

" 変更不要 {{{

function! s:_source(filename)
  return execute('source ' . g:CONFIG_ROOT_DIR . '/conf.plugins.d/' . a:filename)
endfunction

call plug#begin('~/.vim/plugged')

"}}}

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

" スニペット
" Plug 'SirVer/ultisnips'
" call s:_source('ultisnips.vim')
Plug 'honza/vim-snippets'

" オートコンプリート + Language Server Protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
call s:_source('vim-lsp.vim')
Plug 'prabirshrestha/asyncomplete.vim'
call s:_source('asyncomplete.vim.vim')
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'

" 差分表示を左端に表示
Plug 'airblade/vim-gitgutter'
call s:_source('vim-gitgutter.vim')

" 非同期コードチェック
Plug 'w0rp/ale'

"}}}

" 2. 言語別設定 {{{

" Nim
" シンタックス
Plug 'baabelfish/nvim-nim', { 'for':'nim' }
" 補完
Plug 'alaviss/nim.nvim', {'for':'nim'}
call s:_source('nim.nvim.vim')
"autocmd! User nim-nvim call s:_source('nim.nvim.vim')

" HTMLスニペット
Plug 'mattn/emmet-vim', { 'for':'html' }
autocmd! User emmet-vim call s:_source('emmet-vim.vim')

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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for':['md', 'markdown'] }
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

" Jsonnet
Plug 'google/vim-jsonnet'

" }}}

" 3. テスト中の設定 {{{

Plug 'jiro4989/vimquiz.vim'
Plug 'unkontributors/super_unko.vim'

"}}}

" 変更不要 {{{

call plug#end()

"}}}
