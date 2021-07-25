call plug#begin('~/.config/nvim/plugged')
  " A Git wrapper, Git commands
  Plug 'tpope/vim-fugitive'

  " The undo history visualizer for VIM
  Plug 'mbbill/undotree'

  " Dev icons
  Plug 'ryanoasis/vim-devicons'

  " A tree explorer
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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

  " tsx syntax
  Plug 'ianks/vim-tsx'

  " Use nvim/vim's builtin terminal in the floating/popup window
  Plug 'voldikss/vim-floaterm'

  " Vim Align
  Plug 'junegunn/vim-easy-align'

  " Startify: File Explorer
  Plug 'mhinz/vim-startify'

  " A solid language pack for Vim.
  set nocompatible
  Plug 'sheerun/vim-polyglot'

  " Markdown
  Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

  " LSP Plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'kabouzeid/nvim-lspinstall'

  " Neovim Tree shitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Prettier
  Plug 'sbdchd/neoformat'

  " Theme
  Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
