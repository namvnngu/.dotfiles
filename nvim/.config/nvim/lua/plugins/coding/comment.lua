return {
  {
    "echasnovski/mini.comment",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}
