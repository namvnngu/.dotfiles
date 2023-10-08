return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_preview_options = { disable_sync_scroll = true }
    end,
    ft = { "markdown" },
  },
}
