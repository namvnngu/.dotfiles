return {
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      {
        "-",
        "<Cmd>Oil<CR>",
        mode = "n",
        desc = "Opens parent directory",
      },
    },
  },
}
