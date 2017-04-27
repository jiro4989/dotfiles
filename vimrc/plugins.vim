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
NeoBundle 'https://github.com/Shougo/neocomplete.vim'
NeoBundle 'https://github.com/Shougo/neomru.vim'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/vimfiler.vim'
NeoBundle 'https://github.com/dhruvasagar/vim-table-mode'
NeoBundle 'https://github.com/h1mesuke/vim-alignta'
NeoBundle 'https://github.com/rcmdnk/vim-markdown'
NeoBundle 'https://github.com/tomasr/molokai'
NeoBundle 'https://github.com/tomtom/tcomment_vim'
NeoBundle 'https://github.com/udalov/kotlin-vim'
"NeoBundle 'artur-shaik/vim-javacomplete2'

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
source ~/dotfiles/vimrc/plugins/vim-javacomplete2.vim

