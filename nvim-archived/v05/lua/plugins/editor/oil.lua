return {
  {
    "stevearc/oil.nvim",
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      columns = {
        "permissions",
        "size",
        "mtime",
        "birthtime",
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
