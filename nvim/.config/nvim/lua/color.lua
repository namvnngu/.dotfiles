vim.cmd("colorscheme quiet")

if vim.o.background == "light" then
  -- red
  vim.api.nvim_set_hl(0, "Comment", { fg = "#949494", ctermfg = 246 })
  vim.api.nvim_set_hl(
    0,
    "Normal",
    { fg = "black", bg = "white", ctermfg = "black", ctermbg = "white" }
  )
else
  vim.api.nvim_set_hl(0, "Comment", { fg = "#585858", ctermfg = 240 })
  vim.api.nvim_set_hl(
    0,
    "Normal",
    { fg = "white", bg = "black", ctermfg = "white", ctermbg = "black" }
  )
end
