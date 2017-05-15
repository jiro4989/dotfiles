" プラグイン管理プラグイン
" ========================

" 変更不要"{{{

if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible               
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"}}}

" プラグインの追加

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tomasr/molokai'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'udalov/kotlin-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'PProvost/vim-ps1'

" 変更不要"{{{

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"}}}

" プラグイン設定ファイルの読み込み
source ~/dotfiles/vimrc/plugins/unite.vim

source ~/dotfiles/vimrc/plugins/neocomplete.vim
source ~/dotfiles/vimrc/plugins/tcomment_vim.vim
source ~/dotfiles/vimrc/plugins/vim-alignta.vim
source ~/dotfiles/vimrc/plugins/vim-markdown.vim
source ~/dotfiles/vimrc/plugins/vim-tabel-mode.vim
source ~/dotfiles/vimrc/plugins/vimfiler.vim

