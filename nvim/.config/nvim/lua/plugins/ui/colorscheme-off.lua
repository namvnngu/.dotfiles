return {
  {
    "pbrisbin/vim-colors-off",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme off")
      vim.api.nvim_set_hl(0, "Comment", { fg = "#696969", ctermfg = 250, italic = false })
    end,
  },
}
