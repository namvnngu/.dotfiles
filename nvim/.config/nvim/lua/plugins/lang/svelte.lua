return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {
          ---@diagnostic disable-next-line: unused-local
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
              end,
            })
          end,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        svelte = { "prettier" },
      },
    },
  },
}
