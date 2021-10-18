call plug#begin('~/.config/nvim/plugged') " Intellisense engine for Vim8 & Neovim
  " Adding color with colorizer & rainbow
  Plug 'norcalli/nvim-colorizer.lua'

  " A Git wrapper, Git commands
  Plug 'tpope/vim-fugitive'
  Plug 'tveskag/nvim-blame-line'

  " The undo history visualizer for VIM
  Plug 'mbbill/undotree'

  " Dev icons
  Plug 'kyazdani42/nvim-web-devicons'

  " A tree explorer
  Plug 'kyazdani42/nvim-tree.lua'

  " Insert or delete brackets, parens, quotes in pair
  Plug 'jiangmiao/auto-pairs'

  " Comment Toggler
  Plug 'tpope/vim-commentary'

  " Support Emmet for HTML & CSS
  Plug 'mattn/emmet-vim'

  " Buffer/Tab line
  Plug 'akinsho/nvim-bufferline.lua'

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
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'folke/lsp-colors.nvim'
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-lsputils'

  " Autocomplete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'

  " Trouble
  Plug 'folke/trouble.nvim'

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

  " Todos
  Plug 'folke/todo-comments.nvim'

  " Theme
  " Plug 'morhetz/gruvbox'
  " Plug 'drewtempelmeyer/palenight.vim'
  " Plug 'Pocco81/Catppuccino.nvim'
  Plug 'Yagua/nebulous.nvim'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
