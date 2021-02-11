set nu
syntax on
filetype plugin on
set nocompatible
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
"set t_Co=256
set ts=4 
set sw=4
set guifont=Monaco:15
set encoding=utf-8
set fileencodings=utf-8,cp936,gb2312,big5
set autoindent
set ts=4
highlight Comment cterm=italic
"set fileencoding=gb2312
"set termencoding=utf-8


call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'ycm-core/YouCompleteMe'

call plug#end()  

" seoul256:
" "   Range:   233 (darkest) ~ 239 (lightest)
" "   Default: 237
let g:seoul256_background = 238
colo seoul256
" seoul256-light:
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_background = 256
"colo seoul256-light
