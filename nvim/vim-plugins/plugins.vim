call plug#begin('~/.config/nvim/plugged')
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
"Plug 'ryanoasis/vim-devicons'

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
Plug 'drewtempelmeyer/palenight.vim'

" Use nvim/vim's builtin terminal in the floating/popup window
Plug 'voldikss/vim-floaterm'

" Vim Align
Plug 'junegunn/vim-easy-align'

" Startify: File Explorer
Plug 'mhinz/vim-startify'

" Rainbow
Plug 'luochen1990/rainbow'

" A solid language pack for Vim.
set nocompatible
Plug 'sheerun/vim-polyglot'

" Markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
