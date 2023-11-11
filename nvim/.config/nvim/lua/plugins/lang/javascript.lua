return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "javascript" })
      end
    end,
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
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        nls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        nls.builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),

        nls.builtins.formatting.prettierd.with({
          filetypes = { "javascript" },
          condition = function(utils)
            return not utils.root_has_file(eslint_config_files)
          end,
        }),
      })
    end,
  },
}
