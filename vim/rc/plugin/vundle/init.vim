set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 追加で導入するプラグイン

Plugin 'Shougo/unite.vim'
source ~/.vim/rc/plugin/unite.vim

Plugin 'Shougo/neocomplete.vim'
source ~/.vim/rc/plugin/neocomplete.vim

Plugin 'Shougo/neomru.vim'

Plugin 'vimwiki/vimwiki'
source ~/.vim/rc/plugin/vimwiki.vim

Plugin 'scrooloose/nerdtree'
source ~/.vim/rc/plugin/nerdtree.vim

" Gitの差分表示
Plugin 'tpope/vim-fugitive'
source ~/.vim/rc/plugin/vim-fugitive.vim

Plugin 'airblade/vim-gitgutter'
source ~/.vim/rc/plugin/vim-gitgutter.vim

" 桁揃え
Plugin 'h1mesuke/vim-alignta'
source ~/.vim/rc/plugin/vim-alignta.vim

Plugin 'mattn/emmet-vim'
source ~/.vim/rc/plugin/emmet-vim.vim

Plugin 'PProvost/vim-ps1'

Plugin 'fatih/vim-go'
source ~/.vim/rc/plugin/vim-go.vim

Plugin 'aklt/plantuml-syntax'

Plugin 'rcmdnk/vim-markdown'
source ~/.vim/rc/plugin/vim-markdown.vim

Plugin 'cespare/vim-toml'

Plugin 'dhruvasagar/vim-table-mode'
source ~/.vim/rc/plugin/vim-table-mode.vim

Plugin 'hail2u/vim-css3-syntax'

Plugin 'pangloss/vim-javascript'

Plugin 'tpope/vim-surround'

" 括弧補完
Plugin 'cohama/lexima.vim'

" ステータスラインの変更
Plugin 'Lokaltog/vim-powerline'

call vundle#end()
filetype plugin indent on

" カスタム設定
"

