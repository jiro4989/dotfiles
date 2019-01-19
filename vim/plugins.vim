if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#load_toml(g:CONFIG_ROOT_DIR . '/conf.plugins.d/dein.toml')

  call dein#end()
  call dein#save_state()

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endif

filetype plugin indent on
syntax enable
