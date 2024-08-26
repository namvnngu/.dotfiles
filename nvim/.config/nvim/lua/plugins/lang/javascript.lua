return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "javascript" })
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "biome" }
          else
            return { "prettier" }
          end
        end,
        javascriptreact = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "biome" }
          else
            return { "prettier" }
          end
        end,
      },
    },
  },
}
