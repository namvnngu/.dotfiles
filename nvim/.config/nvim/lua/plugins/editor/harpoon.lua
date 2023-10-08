return {
  -- Bookmark
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
      },
    },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
        desc = "Adds file to the harpoon bookmark",
      },
      {
        "<leader>`",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        mode = "n",
        remap = true,
        desc = "Toggles harpoon bookmark",
      },
    },
  },
}
