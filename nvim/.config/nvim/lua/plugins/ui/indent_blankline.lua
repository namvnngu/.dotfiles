return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#7e1b23" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#805c19" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0e538b" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#895729" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#486a2f" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#651f7a" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#296870" })
      end)

      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
}
