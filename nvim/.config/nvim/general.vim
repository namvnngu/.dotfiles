let mapleader = " "
set number
set termguicolors
set autoread
set backspace=indent,eol,start
set guifont=FiraCode\ Nerd\ Font:h13
set relativenumber
set encoding=UTF-8
" set spell spelllang=en_us
set nospell

set hlsearch
set incsearch

set wildmenu
set path+=**
set wildmode=longest,list,full

set smartindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

set signcolumn=yes
set nowrap

set nobackup nowritebackup
set noswapfile
set hidden

set noerrorbells
set belloff=all

set clipboard+=unnamedplus
set showmatch
set showmode
set cmdheight=2
set updatetime=300
set shortmess+=c
set colorcolumn=80
set scrolloff=8
set cursorline
set formatoptions+=r

filetype plugin indent on

" Neovide
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_transparency=0.8
