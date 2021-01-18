"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                            " VIM SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
let mapleader = " "
set number
set exrc
" set term=screen-256color
set autoread
set backspace=indent,eol,start
" set guifont=FiraCode\ Nerd\ Font\ Medium\ 11
set guifont=Hack\ Nerd\ Font\ Mono:h14
set relativenumber
set hlsearch
set encoding=UTF-8
set smartindent
set path=**
set signcolumn=no
set wildmenu
set nowrap
set nobackup nowritebackup
set noswapfile
set incsearch
set hidden
set spell spelllang=en_us
set noerrorbells
set belloff=all
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamed
set showmatch
set showmode
set shiftround
set cmdheight=2
set updatetime=50
set shortmess+=c
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=#2c2d27
filetype plugin indent on


""""""""""""""""""""""
" Cursor Configuration
""""""""""""""""""""""
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

""""""""""
" Mappings
""""""""""
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <leader>qq :q<CR>
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>ay :%y+<CR>
tnoremap <Esc> <C-\><C-n> "NeoVim
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

""""""""""""""""""
" Trim whitespace
""""""""""""""""""
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_TRIM
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup

"""""""""""
" Templates
"""""""""""
function Google()
    :read ~/.vim/templates/Google.cpp
endfunction
function CP()
    :read ~/.vim/templates/CP.cpp
endfunction
function Html()
    :read ~/.vim/templates/index.html
endfunction


"""""""""""""""""
" Compile and run
"""""""""""""""""
autocmd filetype python nnoremap <leader>pp :!clear && python3 % <CR>
autocmd filetype cpp nnoremap <leader>pp :!clear && g++ -std=c++14 % -O2 -Wall -Wextra -Werror -pedantic -g -o %.out && ./%.out <CR>
autocmd filetype java nnoremap <leader>pp :!clear && javac %:t && java -enableassertions %:t:r<CR>
autocmd filetype cs nnoremap <leader>pp :!clear && dotnet run --project %:p:h<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                              " PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Intellisense engine for Vim8 & Neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A Git wrapper, Git commands
Plug 'tpope/vim-fugitive'

" The undo history visualizer for VIM
Plug 'mbbill/undotree'

" The undo history visualizer for VIM
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A tree explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Dev icons
Plug 'ryanoasis/vim-devicons'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment Toggler
Plug 'scrooloose/nerdcommenter'

" Support Emmet for HTML & CSS
Plug 'mattn/emmet-vim'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" Javascript Syntax
Plug 'ianks/vim-tsx'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Themes
Plug 'morhetz/gruvbox'

" Use nvim/vim's builtin terminal in the floating/popup window
Plug 'voldikss/vim-floaterm'

call plug#end()

"""""""""""""""
" VIM-FLOATERM
"""""""""""""""
let g:floaterm_keymap_new    = '<F6>'
let g:floaterm_keymap_prev   = '<F7>'
let g:floaterm_keymap_next   = '<F8>'
let g:floaterm_keymap_toggle = '<F9>'
let g:floaterm_keymap_kill   = '<F10>'
let g:floaterm_position      = 'bottom'
let g:floaterm_width         = 1.0

hi FloatermBorder guibg=none guifg=orange
hi FloatermNC guibg=gray

""""""""""""
"" UndoTree
""""""""""""
nnoremap <F5> :UndotreeToggle<cr>


"""""""""
"" Theme
"""""""""
syntax enable
set termguicolors
set background=dark " Setting dark mode
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Normal ctermbg=NONE guibg=NONE
" let g:gruvbox_contrast_dark='hard'
" autocmd vimenter * ++nested colorscheme gruvbox

""""""""""
"" Syntax
""""""""""
let g:javascript_plugin_flow = 1
autocmd BufEnter *.{ts,tsx} :set syntax=typescript
autocmd BufLeave *.{ts,tsx} :set syntax=typescript
autocmd BufEnter *.{ejs,cshtml,svelte} :set syntax=html
autocmd BufLeave *.{ejs,cshtml,svelte} :set syntax=html
autocmd BufLeave *.{scss,sass} :set syntax=css


"""""""""
"" Emmet
"""""""""
let g:user_emmet_leader_key = '<C-Z>'


"""""""""
"" FZF
"""""""""
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'


"""""""""""
"" NERDTree
"""""""""""
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1
" autocmd vimenter * NERDTree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusUpdateOnCursorHold = 1


""""""""""""""""
"" Nerdcommenter
""""""""""""""""
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


"""""""""
"" CocCoc
"""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \]
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <leader>cr :CocRestart

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
