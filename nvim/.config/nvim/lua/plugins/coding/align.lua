vim.api.nvim_create_user_command(
  "Lma",
  "Lazy load mini.align | echo 'mini.align loaded'",
  { desc = "Load mini.align plugin" }
)

return {
  {
    "echasnovski/mini.align",
    lazy = true,
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
}
