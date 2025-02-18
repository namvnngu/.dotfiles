return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        cssls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        css = { "prettier" },
      },
    },
  },
}
