return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        rust_analyzer = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },
}
