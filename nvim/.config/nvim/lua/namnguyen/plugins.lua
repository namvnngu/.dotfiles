-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- UI
  use('stevearc/dressing.nvim')

  -- Adding color with colorizer
  use('norcalli/nvim-colorizer.lua')

  -- A Git wrapper, Git commands
  use('tpope/vim-fugitive')
  use('f-person/git-blame.nvim')
  use('ThePrimeagen/git-worktree.nvim')

  -- The undo history visualizer
  use('mbbill/undotree')

  -- Dev icons
  use('nvim-tree/nvim-web-devicons')

  -- Insert or delete brackets, parens, quotes in pair
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })

  -- Add/change/delete surrounding delimiter pairs with ease
  use({
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  })

  -- Comment Toggler
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })

  -- Support Emmet for HTML & CSS
  use('mattn/emmet-vim')

  -- Buffer/Tab line
  use({
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = 'nvim-tree/nvim-web-devicons',
  })

  -- Terminal
  use({
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('toggleterm').setup()
    end,
  })

  --- Vim Align
  use('junegunn/vim-easy-align')

  -- Markdown
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  -- Navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  })
  use({
    'nvim-telescope/telescope-file-browser.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
  })
  use({
    'nvim-telescope/telescope-project.nvim',
    requires = {
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope.nvim',
    },
  })
  use('theprimeagen/harpoon')

  -- LSP Plugins
  use('neovim/nvim-lspconfig')
  use('simrat39/symbols-outline.nvim')
  use('jose-elias-alvarez/null-ls.nvim')

  -- Manage LSP servers, DAP servers, linters, and formatters
  use({
    'williamboman/mason.nvim',
    run = ':MasonUpdate', -- :MasonUpdate updates registry contents
  })
  use('williamboman/mason-lspconfig.nvim')

  -- Autocomplete
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')

  -- Snippet
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/vim-vsnip')
  use('rafamadriz/friendly-snippets')

  -- Trouble
  use({
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  })

  -- Neovim Treesitter
  use('nvim-treesitter/nvim-treesitter', {
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  })
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')
  -- use treesitter to auto close and auto rename html tag
  use({
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  })
  -- split/join blocks of code
  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  })

  -- Todos
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  })

  -- Search
  use('windwp/nvim-spectre')

  -- Status Bar
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
  })

  -- Faster Startup
  use({
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end,
  })

  -- Indent Guides
  use('lukas-reineke/indent-blankline.nvim')

  -- Dashboard
  use({
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  })

  -- Folding
  use({
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
  })

  -- Quickfix
  use({ 'kevinhwang91/nvim-bqf', ft = 'qf' })

  -- Split explorer
  use('stevearc/oil.nvim')

  -- Theme
  use('morhetz/gruvbox')
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({ 'catppuccin/nvim', as = 'catppuccin' })
  -- use('Lokaltog/vim-monotone')
  -- use('sainnhe/everforest')
  -- use('projekt0n/github-nvim-theme')
  -- use('folke/tokyonight.nvim')
  -- use('markvincze/panda-vim')
  -- use('drewtempelmeyer/palenight.vim')
  -- use('Yagua/nebulous.nvim')
end)
