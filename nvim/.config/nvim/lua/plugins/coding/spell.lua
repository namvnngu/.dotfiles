return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        typos_lsp = {
          init_options = {
            diagnosticSeverity = "Hint",
          },
        },
      },
    },
  },
}
