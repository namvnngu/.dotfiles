return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        clangd = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cpp = { "clang_format" },
      },
    },
  },
}
