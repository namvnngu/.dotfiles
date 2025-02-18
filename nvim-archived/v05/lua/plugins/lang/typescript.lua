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
          single_file_support = true,
          root_dir = require("lspconfig").util.root_pattern(
            "package.json",
            "tsconfig.json",
            "jsconfig.json"
          ),
        },
        biome = {},
        eslint = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typescript = function(bufnr)
          if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
            return {}
          end
          if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
            return { "biome" }
          end
          return { "prettier" }
        end,
        typescriptreact = function(bufnr)
          if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
            return {}
          end
          if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
            return { "biome" }
          end
          return { "prettier" }
        end,
      },
    },
  },
}
