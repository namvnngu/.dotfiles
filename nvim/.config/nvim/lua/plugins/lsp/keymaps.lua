local M = {}

function M.on_attach()
  -- See *lsp-defaults*
  -- NOTE: Inspect require("vim._defaults") to check if the below mappings are
  -- included in the stable Neovim. If yes, then remove the below mappings.

  --- Reference: https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L154
  do
    vim.keymap.set(
      "n",
      "grn",
      vim.lsp.buf.rename,
      { desc = "vim.lsp.buf.rename()" }
    )

    vim.keymap.set(
      { "n", "x" },
      "gra",
      vim.lsp.buf.code_action,
      { desc = "vim.lsp.buf.code_action()" }
    )

    vim.keymap.set(
      "n",
      "grr",
      vim.lsp.buf.references,
      { desc = "vim.lsp.buf.references()" }
    )

    vim.keymap.set(
      "i",
      "<C-S>",
      vim.lsp.buf.signature_help,
      { desc = "vim.lsp.buf.signature_help()" }
    )
  end

  do
    vim.keymap.set(
      "n",
      "]d",
      vim.diagnostic.goto_next,
      { desc = "Jump to the next diagnostic in the current buffer" }
    )

    vim.keymap.set(
      "n",
      "[d",
      vim.diagnostic.goto_prev,
      { desc = "Jump to the previous diagnostic in the current buffer" }
    )

    vim.keymap.set(
      "n",
      "<C-W>d",
      vim.diagnostic.open_float,
      { desc = "Show diagnostics under the cursor" }
    )

    vim.keymap.set(
      "n",
      "<C-W><C-D>",
      "<C-W>d",
      { remap = true, desc = "Show diagnostics under the cursor" }
    )
  end
end

return M
