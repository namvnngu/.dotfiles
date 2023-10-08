return {
  -- Search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      {
        "<C-s>",
        function()
          require("spectre").open()
        end,
        mode = "n",
        desc = "Search and replace in files",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        mode = "n",
        desc = "Search the word under cursor in files",
      },
      {
        "<leader>s",
        function()
          require("spectre").open_visual()
        end,
        mode = "v",
        desc = "Search the visual word in files",
      },
    },
  },
}
