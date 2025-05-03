return {
  {
    "mfussenegger/nvim-dap",
    opts = {
      adapters = {},
      langs = {},
    },
    config = function(_, opts)
      local dap = require("dap")
      local widgets = require("dap.ui.widgets")

      for adapter, config in pairs(opts.adapters) do
        dap.adapters[adapter] = config
      end

      for lang, configs in pairs(opts.langs) do
        dap.configurations[lang] = configs
      end

      vim.keymap.set("n", "<F1>", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
      vim.keymap.set("n", "<F2>", dap.continue, { desc = "DAP continue" })
      vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP step over" })
      vim.keymap.set("n", "<F4>", dap.step_into, { desc = "DAP step into" })
      vim.keymap.set("n", "<F5>", dap.step_out, { desc = "DAP step out" })
      vim.keymap.set("n", "<F6>", function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, {
        desc = "DAP set logpoint",
      })
      vim.keymap.set("n", "<F7>", dap.repl.toggle, { desc = "DAP toggle REPL" })
      vim.keymap.set({ "n", "v" }, "<F8>", widgets.hover, { desc = "DAP widget hover" })
      vim.keymap.set({ "n", "v" }, "<F9>", widgets.preview, { desc = "DAP widget preview" })
      vim.keymap.set("n", "<F10>", function()
        widgets.centered_float(widgets.frames)
      end, { desc = "DAP widget view frames" })
      vim.keymap.set("n", "<F12>", function()
        widgets.centered_float(widgets.scopes)
      end, { desc = "DAP widget view scopes" })
    end,
  },
}
