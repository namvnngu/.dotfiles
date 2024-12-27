return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        jsonls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        json = { "prettier" },
      },
    },
  },
}
