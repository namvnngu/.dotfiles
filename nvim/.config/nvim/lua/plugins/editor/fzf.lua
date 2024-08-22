return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- git
      {
        "<C-p>",
        "<Cmd>FzfLua git_files<CR>",
        mode = "n",
        desc = "Search files via `git ls-files`",
      },
      -- buffers and files
      {
        "<leader>ff",
        "<Cmd>FzfLua files<CR>",
        mode = "n",
        desc = "Search files via `find` or `fd` on a path",
      },
      {
        "<leader>fb",
        "<Cmd>FzfLua buffers<CR>",
        mode = "n",
        desc = "Open buffers",
      },
      -- search
      {
        "<leader>fs",
        "<Cmd>FzfLua live_grep_glob<CR>",
        mode = "n",
        desc = "live_grep with rg --glob support",
      },
      -- misc
      {
        "<leader>fr",
        "<Cmd>FzfLua resume<CR>",
        mode = "n",
        desc = "Resume last command/query",
      },
    },
    opts = {
      winopts = {
        preview = {
          hidden = "hidden",
        },
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden --iglob=!.git -e",
      },
    },
  },
}
