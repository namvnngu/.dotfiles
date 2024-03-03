return {
  {
    "cbochs/grapple.nvim",
    keys = {
      {
        "<leader>a",
        function()
          local grapple = require("grapple")
          grapple.toggle()

          local filepath = require("utils.file").get_filepath()
          if filepath == nil then
            return
          end

          local notify = require("utils.notify")
          if grapple.exists({ path = filepath }) then
            notify.info("Added bookmark: " .. filepath)
          else
            notify.info("Removed bookmark: " .. filepath)
          end
        end,
        mode = "n",
        desc = "Toggle bookmark",
      },
      {
        "<leader>`",
        function()
          require("grapple").toggle_tags()
        end,
        mode = "n",
        desc = "Toggle bookmark menu",
      },
    },
    opts = {
      icons = false,
      scope = "git_branch",
    },
  },
}
