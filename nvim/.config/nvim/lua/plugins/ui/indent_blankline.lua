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
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- dark theme
        -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#7e1b23" })
        -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#805c19" })
        -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0e538b" })
        -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#895729" })
        -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#486a2f" })
        -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#651f7a" })
        -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#296870" })

        -- light theme
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
}
