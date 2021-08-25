call plug#begin('~/.config/nvim/plugged') " Intellisense engine for Vim8 & Neovim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

  " Status line
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

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
  Plug 'hrsh7th/nvim-compe'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'folke/lsp-colors.nvim'
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-lsputils'

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

  " Theme
  Plug 'morhetz/gruvbox'
  Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
