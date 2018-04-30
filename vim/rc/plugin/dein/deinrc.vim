if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein
let s:deindir  = expand('~/.vim/dein')
let s:toml_dir = expand('~/.vim/rc/plugin/dein')

if dein#load_state(s:deindir)
  call dein#begin(s:deindir)

  "Load TOML
  let s:toml      = s:toml_dir . '/plugins.toml'
  let s:lazy_toml = s:toml_dir . '/plugins_lazy.toml'
  let s:own_toml  = s:toml_dir . '/plugins_own.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:own_toml, {'lazy': 2})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

  " 未インストールの場合はインストール
if dein#check_install()
  call dein#install()
endif
