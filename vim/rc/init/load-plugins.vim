call plug#begin('~/.vim/plugged')

" 追加で導入するプラグイン

Plug 'Shougo/unite.vim'
source ~/.vim/rc/plugin/unite.vim

Plug 'Shougo/neocomplete.vim'
source ~/.vim/rc/plugin/neocomplete.vim

Plug 'Shougo/neomru.vim'

" ファイラー
Plug 'cocopon/vaffle.vim'
source ~/.vim/rc/plugin/vaffle.vim

" Gitの差分表示
Plug 'tpope/vim-fugitive'
source ~/.vim/rc/plugin/vim-fugitive.vim

Plug 'airblade/vim-gitgutter'
source ~/.vim/rc/plugin/vim-gitgutter.vim

" 桁揃え
Plug 'h1mesuke/vim-alignta'
source ~/.vim/rc/plugin/vim-alignta.vim

Plug 'mattn/emmet-vim', { 'for':'html' }
autocmd! User emmet-vim source ~/.vim/rc/plugin/emmet-vim.vim
"
Plug 'PProvost/vim-ps1', { 'for':'ps1' }

Plug 'fatih/vim-go', { 'for':'go' }
autocmd! User vim-go source ~/.vim/rc/plugin/vim-go.vim

Plug 'aklt/plantuml-syntax', { 'for':'puml' }

Plug 'rcmdnk/vim-markdown', { 'for':['md', 'markdown'] }
autocmd! User vim-markdown source ~/.vim/rc/plugin/vim-markdown.vim
"
Plug 'cespare/vim-toml', { 'for':'toml' }

Plug 'dhruvasagar/vim-table-mode', { 'for':'markdown' }
autocmd! User vim-table-mode source ~/.vim/rc/plugin/vim-table-mode.vim

Plug 'hail2u/vim-css3-syntax', { 'for':'css' }

" Javascript
" シンタックスハイライトとインデント
Plug 'pangloss/vim-javascript', { 'for':'javascript' }

" メソッド補完
Plug 'mattn/jscomplete-vim', { 'for':'javascript' }
autocmd! User jscomplete-vim source ~/.vim/rc/plugin/jscomplete-vim.vim

" Node.js
" メソッド補完
Plug 'myhere/vim-nodejs-complete', { 'for':'javascript' }
autocmd! User vim-nodejs-complete source ~/.vim/rc/plugin/vim-nodejs-complete.vim

" 括り文字操作
Plug 'tpope/vim-surround'

" 括弧補完
Plug 'cohama/lexima.vim'

" Markdownアウトライナ
Plug 'vim-scripts/VOoM'

" CSVハイライト
Plug 'mechatroner/rainbow_csv'

" Vue
Plug 'posva/vim-vue'

" SQL Formatter
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities', { 'for':'sql' }

Plug 'aklt/plantuml-syntax', {'for':'plantuml'}

" 自作
" Backlog
Plug 'jiro4989/vim-backlog'

call plug#end()
