vim.cmd("colorscheme quiet")
if vim.o.background == "light" then
  vim.api.nvim_set_hl(0, "Comment", { fg = "#949494", ctermfg = 246 })
  vim.api.nvim_set_hl(
    0,
    "Normal",
    { fg = "#242424", bg = "#FFFFFF", ctermfg = "black", ctermbg = "white" }
  )
  vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
else
  vim.api.nvim_set_hl(0, "Comment", { fg = "#585858", ctermfg = 240 })
  vim.api.nvim_set_hl(
    0,
    "Normal",
    { fg = "#F3F3F3", bg = "#121212", ctermfg = "white", ctermbg = "black" }
  )
  vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
end

return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       styles = {
  --         bold = true,
  --         italic = false,
  --         transparency = false,
  --       },
  --     })
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },
}
