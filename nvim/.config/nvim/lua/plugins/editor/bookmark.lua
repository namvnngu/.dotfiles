return {
  {
    "otavioschwanck/arrow.nvim",
    keys = {
      {
        "<leader>`",
        ":echo 'arrow.nvim'",
        mode = "n",
        remap = true,
        desc = "Show bookmark menu",
      },
    },
    opts = {
      show_icons = false,
      always_show_path = true,
      separate_by_branch = true,
      separate_save_and_remove = true,
      leader_key = "<leader>`",
    },
  },
}
