return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules" },
        preview = false,
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
      },
      extensions = {},
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
    keys = {
      -- git
      {
        "<C-p>",
        "<cmd>Telescope git_files<cr>",
        mode = "n",
        desc = "Fuzzy search through the output of git ls-files command, respects .gitignore",
      },
      {
        "<leader>fgs",
        "<cmd>Telescope git_status<cr>",
        mode = "n",
        desc = "Lists current changes per file with diff preview and add action",
      },
      {
        "<leader>fgb",
        "<cmd>Telescope git_branches<cr>",
        mode = "n",
        desc = "Lists all branches with log preview",
      },

      -- files
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        mode = "n",
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        "<leader>flg",
        "<cmd>Telescope live_grep<cr>",
        mode = "n",
        desc = "Searches for a string in your current working directory and get results live as you type, respects .gitignore.",
      },
      {
        "<leader>fgw",
        function()
          require("telescope.builtin").grep_string({
            search = vim.fn.expand("<cword>"),
          })
        end,
        mode = "n",
        desc = "Searches for the string under your cursor",
      },
      {
        "<leader>fgs",
        function()
          local query = vim.trim(vim.fn.input("Grep For > "))
          local root_dir = vim.trim(vim.fn.input("Root Dir > "))
          require("telescope.builtin").grep_string({
            cwd = #root_dir ~= 0 and root_dir
              or require("telescope.utils").buffer_dir(),
            search = query,
            use_regex = true,
          })
        end,
        mode = "n",
        desc = "Searches for the string within a specific directory",
      },

      -- vim
      {
        "<leader>fbb",
        "<cmd>Telescope buffers<cr>",
        mode = "n",
        desc = "Lists open buffers in current neovim instance",
      },

      -- lsp
      {
        "<leader>fgr",
        "<cmd>Telescope lsp_references<cr>",
        mode = "n",
        desc = "Lists LSP references for word under the cursor",
      },
      {
        "<leader>fgd",
        "<cmd>Telescope lsp_definitions<cr>",
        mode = "n",
        desc = "Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
      },
      {
        "<leader>fdo",
        "<cmd>Telescope diagnostics<cr>",
        mode = "n",
        desc = "Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.",
      },
    },
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
}
