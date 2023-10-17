return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      -- variant = "moon", -- dark mode
      variant = "dawn", -- light mode
      disable_background = true,
      disable_float_background = true,
      disable_italics = true,
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      no_italic = true,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      transparent = true,
      theme = "wave",
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme("kanagawa")
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = { transparent = true },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)

      -- dark mode
      -- vim.cmd.colorscheme("carbonfox")

      -- light mode
      vim.cmd.colorscheme("dayfox")
      vim.cmd("highlight @tag.attribute gui=NONE cterm=NONE")
    end,
  },
}
