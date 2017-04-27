" カラースキーム"{{{

colorscheme molokai
syntax on
set t_Co=256

"}}}

" ツールバースクロールバーの非表示"{{{

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

"}}}

" ウィンドウUI {{{

set columns=130
set lines=40

if has("win32") || has("win64")
  set guifont=MyricaM_M:h12:cSHIFTJIS
else
  set guifont=Monospace\ 16
endif


"}}}

set mouse=a
