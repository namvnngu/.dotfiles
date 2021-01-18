call plug#begin('~/.vim/plugged')
" Typescript
	Plug 'leafgarland/typescript-vim'
" Auto-completion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'junegunn/vim-easy-align'
" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
	Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
	Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
" Auto Pair
	Plug 'jiangmiao/auto-pairs'
" NerdCommenter
	Plug 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims = 2
" Vim Surround 
	Plug 'tpope/vim-surround'
" Emmet
	Plug 'mattn/emmet-vim'
" Fuzzy and Files
	Plug 'ctrlpvim/ctrlp.vim'
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
	  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
	  \ }
" Status bar
	Plug 'vim-airline/vim-airline'
" Git
	Plug 'airblade/vim-gitgutter'
" Initialize plugin system
call plug#end()

" General settings
syntax on
set number
let mapleader = ","
let g:user_emmet_leader_key = ','
set term=screen-256color
set autoread
set backspace=indent,eol,start
set guifont=FiraCode\ Nerd\ Font\ Medium\ 11
set relativenumber
set encoding=UTF-8
set smartindent
set noswapfile
set path=**
set wildmenu
set hlsearch
set ignorecase
set nobackup nowritebackup
set smartcase
set incsearch
" always show signcolumns
set signcolumn=yes
colorscheme pablo
set spell spelllang=en_us
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
" Copy and Paste
set clipboard=unnamed

" Compile and run
autocmd filetype python nnoremap <leader>pp :!clear && python3 % <CR>
autocmd filetype cpp nnoremap <leader>pp :!clear && g++ -std=c++14 % -Wall -g -o %.out && ./%.out <CR>
autocmd filetype java nnoremap <leader>pp :!clear && javac %:t && java -enableassertions %:t:r<CR>
autocmd filetype cs nnoremap <leader>pp :!clear && dotnet run --project %:p:h<CR>

" Funny Mappings
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
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

" Templates
function Google()
  :read ~/.vim/templates/Google.cpp
endfunction

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=3  " open in a new tab
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize = 25
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
" augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
" augroup END
function! s:Sync()
  call system("unison -batch /home/user ssh://user@server//home/user")
endfunction

command! Sync :call <SID>Sync()
" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeGitStatusWithFlags = 1
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Cursor Configuration
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-omnisharp',
  \ 'coc-java'
  \]
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
