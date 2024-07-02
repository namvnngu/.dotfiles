return {
  -- Split explorer
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
        "<cmd>Oil<CR>",
        mode = "n",
        desc = "Opens parent directory",
      },
    },
  },
}
