return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        clangd = {
          capabilities = { offsetEncoding = { "utf-16" } },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = {
      adapters = {
        codelldb = {
          type = "executable",
          command = "codelldb",
        },
      },
      langs = {
        c = {
          {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
              )
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
        },
      },
    },
  },
}
