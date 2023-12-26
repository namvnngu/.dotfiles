return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- git
      {
        "<C-p>",
        "<cmd>FzfLua git_files<cr>",
        mode = "n",
        desc = "Search files via `git ls-files`",
      },
      -- files
      {
        "<leader>ff",
        "<cmd>FzfLua files<cr>",
        mode = "n",
        desc = "Search files via `find` or `fd` on a path",
      },
      -- search
      {
        "<leader>fs",
        "<cmd>FzfLua live_grep_glob<cr>",
        mode = "n",
        desc = "live_grep with rg --glob support",
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
