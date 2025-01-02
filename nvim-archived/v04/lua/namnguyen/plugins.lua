-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- A Git wrapper, Git commands
  use("tpope/vim-fugitive")
  use("ThePrimeagen/git-worktree.nvim")

  -- UI Enhancement
  use("stevearc/dressing.nvim")

  -- The undo history visualizer
  use("mbbill/undotree")

  -- Support Emmet for HTML & CSS
  use("mattn/emmet-vim")

  --- Vim Align
  use("junegunn/vim-easy-align")

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- Navigation
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })
  use("theprimeagen/harpoon")

  -- LSP Plugins
  use("neovim/nvim-lspconfig")
  use("simrat39/symbols-outline.nvim")
  use("nvimtools/none-ls.nvim")
  use({
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup()
    end,
  })

  -- Manage LSP servers, DAP servers, linters, and formatters
  use({
    "williamboman/mason.nvim",
    run = ":MasonUpdate", -- :MasonUpdate updates registry contents
  })
  use("williamboman/mason-lspconfig.nvim")

  -- Autocomplete
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")

  -- Snippet
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use("rafamadriz/friendly-snippets")

  -- Neovim Treesitter
  use("nvim-treesitter/nvim-treesitter", {
    run = function()
      local ts_update =
        require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/playground")
  use("nvim-treesitter/nvim-treesitter-context")
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

  -- Todos
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  })

  -- Search
  use("windwp/nvim-spectre")

  -- Indent Guides
  use("lukas-reineke/indent-blankline.nvim")

  -- Split explorer
  use("stevearc/oil.nvim")

  -- Mini
  use("echasnovski/mini.starter")
  use("echasnovski/mini.comment")

  -- Theme
  use({ "rose-pine/neovim", as = "rose-pine" })
  -- use('ellisonleao/gruvbox.nvim')
  -- use('EdenEast/nightfox.nvim')
  -- use('folke/tokyonight.nvim')
  -- use({ 'catppuccin/nvim', as = 'catppuccin' })
end)
