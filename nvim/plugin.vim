let s:base_dir = expand('<sfile>:p:h')

let s:plugin_dir = s:base_dir.'/plugin.d'

function! s:add_plugin()
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim'     , {'hook_add':s:plugin_dir.'/denite.nvim.vim'})
  call dein#add('Shougo/deoplete.nvim'   , {'hook_add':s:plugin_dir.'/deoplete.nvim.vim', 'on_i':1})
  call dein#add('Shougo/defx.nvim'       , {'hook_add':s:plugin_dir.'defx.nvim.vim'})
  call dein#add('Shougo/neomru.vim')
  call dein#add('tpope/vim-fugitive'     , {'hook_add':s:plugin_dir.'vim-fugitive.vim'})
  call dein#add('airblade/vim-gitgutter' , {'hook_add':s:plugin_dir.'vim-gitgutter.vim'})
  call dein#add('h1mesuke/vim-alignta'   , {'hook_add':s:plugin_dir.'vim-alignta.vim'})
  call dein#add('tpope/vim-surround')
  call dein#add('cohama/lexima.vim')
  call dein#add('tyru/caw.vim'           , {'hook_add':s:plugin_dir.'caw.vim.vim'})
  call dein#add('LeafCage/foldCC')
  call dein#add('machakann/vim-highlightedyank')
endfunction

function! s:add_lazy_plugin()
  let l:lazy_level = 1
endfunction

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " call dein#load_toml(s:base_dir . '/plugin.toml', {'lazy': 0})
  " call dein#load_toml(s:base_dir . '/plugin_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
