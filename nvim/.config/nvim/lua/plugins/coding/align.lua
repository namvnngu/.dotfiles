return {
  {
    "echasnovski/mini.align",
    version = false,
    keys = {
      {
        "lma",
        "<cmd>Lazy load mini.align | echo 'mini.align loaded'<cr>",
        mode = "n",
        desc = "Load mini.align plugin",
      },
    },
    config = function(_, opts)
      require("mini.align").setup(opts)
    end,
  },
}
