return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.cspell,
        nls.builtins.diagnostics.cspell.with({
          diagnostic_config = {
            virtual_text = false,
            severity_sort = true,
          },
          disabled_filetypes = { "NvimTree" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["HINT"]
          end,
        }),
      })
    end,
  },
}
