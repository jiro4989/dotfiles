if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = $HOME . '/.cache/dein'

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_dir . '/repos/github.com/Shougo/dein.vim')

  let s:plugin_config_dir = g:CONFIG_ROOT_DIR . '/conf.plugins.d'
  let s:config_file       = s:plugin_config_dir . '/dein.toml'
  let s:lazy_config_file  = s:plugin_config_dir . '/dein_lazy.toml'

  " Add or remove your plugins here like this:
  call dein#load_toml(s:config_file,      {'lazy': 0})
  call dein#load_toml(s:lazy_config_file, {'lazy': 1})
  "call dein#load_toml(s:lazy_config_file, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
