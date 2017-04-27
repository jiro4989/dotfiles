@echo off

cd %userprofile%
mkdir tmp

cd %userprofile%"\dotfiles\bundle"
git clone https://github.com/Shougo/neobundle.vim.git

mklink %userprofile%"\.vimrc" %userprofile%"\dotfiles\.vimrc"
mklink %userprofile%"\.gvimrc" %userprofile%"\dotfiles\.gvimrc"
mklink %userprofile%"\.vimperatorrc" %userprofile%"\dotfiles\.vimperatorrc"

mklink /D %userprofile%"\.vim\bundle" %userprofile%"\dotfiles\bundle"
mklink /D %userprofile%"\.vim\dict" %userprofile%"\dotfiles\dict"

mklink /D %userprofile%"\vimfiles" %userprofile%"\dotfiles\vimfiles"
