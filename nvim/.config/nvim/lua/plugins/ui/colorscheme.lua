return {
  {
    "junegunn/seoul256.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.seoul256_background = 256
      vim.cmd("colorscheme seoul256-light")
    end,
  },
}
