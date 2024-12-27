return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        csharp_ls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
    },
  },
}
