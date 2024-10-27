return {
  {
    "echasnovski/mini.align",
    version = false,
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = function()
      require("mini.align").setup()
    end,
  },
}
