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
    "echasnovski/mini.nvim",
    version = false,
    opts = {
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
        require("mini.starter").sections.recent_files(5, true),
      },
    },
  },
}
