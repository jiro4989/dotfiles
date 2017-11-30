" プラグイン設定ファイル

" 変更不要{{{

if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/bundle/dein.vim
let s:deindir = expand('~/.vim/bundle/dein.vim')

if dein#load_state(s:deindir)
  call dein#begin(s:deindir)

  "}}}

  " プラグインの追加{{{

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/vimfiler.vim')
  "call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('h1mesuke/vim-alignta')
  call dein#add('rcmdnk/vim-markdown')
  "call dein#add('tomtom/tcomment_vim')
  call dein#add('udalov/kotlin-vim')
  call dein#add('mattn/emmet-vim')
  "call dein#add('surround.vim')
  call dein#add('PProvost/vim-ps1')
  "call dein#add('leafgarland/typescript-vim.git')
  call dein#add('fatih/vim-go')
  "call dein#add('vim-jp/vim-go-extra')
  call dein#add('keith/swift.vim')

  "}}}

  " 変更不要{{{

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" 未インストールの場合はインストール
if dein#check_install()
  call dein#install()
endif

"}}}

" プラグイン設定ファイルの読み込み
source ~/dotfiles/vimrc/plugins/unite.vim

source ~/dotfiles/vimrc/plugins/neocomplete.vim
source ~/dotfiles/vimrc/plugins/tcomment_vim.vim
source ~/dotfiles/vimrc/plugins/vim-alignta.vim
source ~/dotfiles/vimrc/plugins/vim-markdown.vim
source ~/dotfiles/vimrc/plugins/vim-tabel-mode.vim
source ~/dotfiles/vimrc/plugins/vimfiler.vim

