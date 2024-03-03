return {
  {
    "cbochs/grapple.nvim",
    keys = {
      {
        "<leader>a",
        function()
          require("grapple").toggle()
        end,
        mode = "n",
        desc = "Add file to the bookmark list",
      },
      {
        "<leader>`",
        function()
          require("grapple").toggle_tags()
        end,
        mode = "n",
        desc = "Toggle bookmark",
      },
    },
    opts = {
      icons = false,
      scope = "git_branch",
    },
  },
}
