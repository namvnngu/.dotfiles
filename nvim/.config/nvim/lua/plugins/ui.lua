return {
  {
    "stevearc/dressing.nvim",
    lazy = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
  },

  {
    "echasnovski/mini.starter",
    version = false,
    dependencies = {
      "stevearc/oil.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = function(_, opts)
      local starter = require('mini.starter')
      return vim.tbl_deep_extend("force", opts or {}, {
        items = {
          {
            action = "Telescope git_files",
            name = "Git Files",
            section = "Browsing",
          },
          { action = "Oil", name = "Explorer", section = "Browsing" },
          {
            action = "Telescope file_browser",
            name = "File Browser",
            section = "Browsing",
          },
          starter.sections.recent_files(5, true),
        },
      })
    end
  },
}
