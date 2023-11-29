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
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      local eslint_config_files = {
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
      }

      opts.sources = opts.sources or {}

      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.eslint_d.with({
          filetypes = { "svelte" },
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        nls.builtins.formatting.eslint_d.with({
          filetypes = { "svelte" },
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        nls.builtins.diagnostics.eslint_d.with({
          filetypes = { "svelte" },
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),

        nls.builtins.formatting.prettierd.with({
          filetypes = { "svelte" },
          condition = function(utils)
            return not utils.root_has_file(eslint_config_files)
          end,
        }),
      })
    end,
  },
}
