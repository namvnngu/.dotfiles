if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

"""""""""""
" OPTIONS "
"""""""""""
syntax on

filetype plugin indent on

let mapleader = " "

set autoindent
set autoread
set backspace+=nostop
set breakindent
set clipboard+=unnamedplus,unnamed
set cmdheight=1
set colorcolumn=80
set completeopt=menu,menuone,noselect,noinsert
set copyindent
set cursorline
set expandtab
set fileencoding=utf-8
set foldcolumn=1
set foldenable
set foldlevel=99
set foldlevelstart=99
set foldmethod=manual
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
set history=100
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set nobackup
set noswapfile
set noundofile
set nowrap
set nowritebackup
set number
set omnifunc=syntaxcomplete#Complete
set preserveindent
set pumheight=100
set relativenumber
set scrolloff=8
set shiftround
set shiftwidth=2
set showmode
set showtabline=0
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smartindent
set splitbelow
set splitright
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set tabstop=2
set termguicolors
set timeoutlen=500
set undolevels=10000
set updatetime=50
set viewoptions-=curdir
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum,tagfile
set winminwidth=5

""""""""""
" CURSOR "
""""""""""

" let &t_SI.="\e[5 q" "SI = INSERT mode
" let &t_SR.="\e[4 q" "SR = REPLACE mode
" let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

set ttimeout
set ttimeoutlen=1
set ttyfast

""""""""""""
" MAPPINGS "
""""""""""""

" Move to window
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>

" Resize window
nnoremap <Up> :resize +2<cr>
nnoremap <Down> :resize -2<cr>
nnoremap <Left> :vertical resize -2<cr>
nnoremap <Right> :vertical resize +2<cr>

" Yanking
nnoremap <leader>ya :%y+<cr>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap Y y$

" Buffers
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>ba :bufdo bd<cr>
nnoremap <leader>be :%bd\|e#<cr>

" Better indenting
vnoremap < <gv
vnoremap > >gv

"  Move lines
nnoremap <leader>md :m .+1<cr>==
nnoremap <leader>mu :m .-2<cr>==
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Clear search with <esc>
nnoremap <esc> :noh<cr>

" Keeping it centered and stable
nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Quickfix list
nnoremap <C-j> :cnext<cr>zz
nnoremap <C-k> :cprev<cr>zz

" Location list
nnoremap <leader>J :lnext<cr>zz
nnoremap <leader>K :lprev<cr>zz

" Keybindings for tab navigation with leader and number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Toggle spelling checker
map <F4> :setlocal spell! spelllang=en_us<cr>

" Replace currently selected text with default register without yanking it
xnoremap <leader>p "_dP

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" This is going to get me cancelled
inoremap <C-c> <Esc>

" Replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Make file executable
nnoremap <silent> <leader>x :!chmod +x %<cr>

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Split explorer
nnoremap - :Ex<cr>

" Tab Complete
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
	if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
	  return "\<C-N>"
	else
	  return "\<Tab>"
	endif
endfun

""""""""""""""""
" AUTOCOMMANDS "
""""""""""""""""
autocmd BufWritePre * call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"""""""""
" THEME "
"""""""""

set background=light
" let g:disable_bg = 1
" colorscheme rosepine_moon
colorscheme quiet

autocmd VimEnter * hi Comment gui=NONE cterm=NONE

autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
autocmd VimEnter * hi NonText ctermbg=NONE guibg=NONE
autocmd VimEnter * hi NormalNC ctermbg=NONE guibg=NONE
autocmd VimEnter * hi NormalFloat ctermbg=NONE guibg=NONE
autocmd VimEnter * hi EndOfBuffer ctermbg=NONE guibg=NONE
autocmd VimEnter * hi SignColumn ctermbg=NONE guibg=NONE
autocmd VimEnter * hi FoldColumn ctermbg=NONE guibg=NONE
autocmd VimEnter * hi CursorLine cterm=NONE ctermfg=NONE
autocmd VimEnter * hi CursorLineNr cterm=NONE ctermfg=NONE

" Highlight spelling errors
" autocmd VimEnter * hi SpellBad ctermbg=red guibg=red
" autocmd VimEnter * hi SpellBad cterm=underline
