return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        denols = {
          root_dir = require("lspconfig").util.root_pattern(
            "deno.json",
            "deno.jsonc"
          ),
        },
        ts_ls = {
          root_dir = require("lspconfig").util.root_pattern(
            "package.json",
            "tsconfig.json",
            "jsconfig.json"
          ),
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typescript = function(bufnr)
          return vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
              and { "biome" }
            or { "prettier" }
        end,
        typescriptreact = function(bufnr)
          return vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
              and { "biome" }
            or { "prettier" }
        end,
      },
    },
  },
}
