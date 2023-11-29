local function set_transparent_bg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
end

return {
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     options = { transparent = true },
  --   },
  --   config = function(_, opts)
  --     require("nightfox").setup(opts)
  --     if vim.o.background == "dark" then
  --       vim.cmd.colorscheme("carbonfox")
  --     else
  --       vim.cmd.colorscheme("dayfox")
  --       vim.cmd("highlight @tag.attribute gui=NONE cterm=NONE")
  --     end
  --   end,
  -- },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     variant = "dawn",
  --     dark_variant = "moon",
  --     disable_background = true,
  --     disable_float_background = true,
  --     disable_italics = true,
  --   },
  --   config = function(_, opts)
  --     require("rose-pine").setup(opts)
  --     vim.cmd.colorscheme("rose-pine")
  --   end,
  -- },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     flavour = "mocha",
  --     transparent_background = true,
  --     no_italic = true,
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     commentStyle = { italic = false },
  --     keywordStyle = { italic = false },
  --     transparent = true,
  --     theme = "wave",
  --   },
  --   config = function(_, opts)
  --     require("kanagawa").setup(opts)
  --     vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "storm",
  --     light_style = "day",
  --     transparent = true,
  --     styles = {
  --       comments = { italic = false },
  --       keywords = { italic = false },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
    config = function(_, opts)
      require("github-theme").setup(opts)
      if vim.o.background == "dark" then
        vim.cmd.colorscheme("github_dark")
      else
        vim.cmd.colorscheme("github_light")
      end
      set_transparent_bg()
    end,
  },
}
