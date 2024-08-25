return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end

      local parser_config =
        require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.tsx.filetype_to_parsername = {
        "javascriptreact",
        "javascript.jsx",
        "typescriptreact",
        "typescript.tsx",
      }
    end,
  },

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
        tsserver = {
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
        typescript = { "biome", "prettier", stop_after_first = true },
        typescriptreact = { "biome", "prettier", stop_after_first = true },
      },
    },
  },
}
