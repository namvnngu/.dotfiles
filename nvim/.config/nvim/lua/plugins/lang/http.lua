return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "http" },
    keys = {
      {
        "<leader>rr",
        "<Plug>RestNvim",
        mode = "n",
        desc = "Run the request under the cursor",
      },
      {
        "<leader>rl",
        "<Plug>RestNvimLast",
        mode = "n",
        desc = "Re-run the last request",
      },
      {
        "<leader>rp",
        "<Plug>RestNvimPreview",
        mode = "n",
        desc = "Preview the request cURL command",
      },
    },
  },
}
