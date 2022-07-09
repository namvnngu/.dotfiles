local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  -- Adding color with colorizer & rainbow
  use('norcalli/nvim-colorizer.lua')
  use('luochen1990/rainbow')

  -- A Git wrapper, Git commands
  use('tpope/vim-fugitive')
  use('tveskag/nvim-blame-line')
  use('ThePrimeagen/git-worktree.nvim')

  -- The undo history visualizer for VIM
  use('mbbill/undotree')

  -- Dev icons
  use('kyazdani42/nvim-web-devicons')

  -- A tree explorer
  use('kyazdani42/nvim-tree.lua')

  -- Insert or delete brackets, parens, quotes in pair
  use('jiangmiao/auto-pairs')

  -- Comment Toggler
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Support Emmet for HTML & CSS
  use('mattn/emmet-vim')

  -- Buffer/Tab line
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- Use nvim/vim's builtin terminal in the floating/popup window
  use('voldikss/vim-floaterm')

  --- Vim Align
  use('junegunn/vim-easy-align')

  -- A solid language pack for syntax highlighting
  vim.opt.nocompatible = true
  use('sheerun/vim-polyglot')

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('nvim-telescope/telescope-fzy-native.nvim')

  -- LSP Plugins
  use('neovim/nvim-lspconfig')
  use('simrat39/symbols-outline.nvim')
  use('williamboman/nvim-lsp-installer')
  use('folke/lsp-colors.nvim')
  use('RishabhRD/popfix')
  use('RishabhRD/nvim-lsputils')

  -- Autocomplete
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')

  -- Snippet
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/vim-vsnip')

  -- Trouble
  use('folke/trouble.nvim')

  -- Neovim Tree shitter
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use('nvim-treesitter/playground')

  -- Prettier
  use('sbdchd/neoformat')

  -- Todos
  use('folke/todo-comments.nvim')

  -- Theme
  use('morhetz/gruvbox')
  use('markvincze/panda-vim')
  -- use('drewtempelmeyer/palenight.vim')
  -- use('Pocco81/Catppuccino.nvim')
  -- use('Yagua/nebulous.nvim')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
