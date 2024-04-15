return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        -- Use the "*" filetype to run linters on all filetypes.
        ["*"] = {},
      },
      -- Override linter options, or add custom linters.
      linters = {},
    },
    config = function(_, opts)
      local lint = require("lint")

      for name, linter in pairs(opts.linters) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] =
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.tbl_deep_extend("force", lint.linters[name], linter)
        else
          lint.linters[name] = linter
        end
      end

      lint.linters_by_ft = opts.linters_by_ft

      local function run_lint()
        local names = lint._resolve_linter_by_ft(vim.bo.filetype)

        -- Add global linters.
        vim.list_extend(names, lint.linters_by_ft["*"] or {})

        -- Filter out linters that don't exist or don't match the condition.
        local ctx = { filename = vim.api.nvim_buf_get_name(0) }
        ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
        names = vim.tbl_filter(function(name)
          local linter = lint.linters[name]
          return linter
            and not (
              type(linter) == "table"
              ---@diagnostic disable-next-line: undefined-field
              and linter.condition
              ---@diagnostic disable-next-line: undefined-field
              and not linter.condition(ctx)
            )
        end, names)

        if #names > 0 then
          lint.try_lint(names)
        end
      end

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = require("utils.misc").debounce(run_lint, 100),
      })
    end,
  },
}
