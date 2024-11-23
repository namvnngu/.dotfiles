local M = {}

function M.on_attach()
  -- See *lsp-defaults*
  -- NOTE: Inspect require("vim._defaults") to check if the below mappings are
  -- included in the stable Neovim. If yes, then remove the below mappings.

  --- Reference: https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L154
  do
    vim.keymap.set("n", "grn", function()
      vim.lsp.buf.rename()
    end, { desc = "vim.lsp.buf.rename()" })

    vim.keymap.set({ "n", "x" }, "gra", function()
      vim.lsp.buf.code_action()
    end, { desc = "vim.lsp.buf.code_action()" })

    vim.keymap.set("n", "grr", function()
      vim.lsp.buf.references()
    end, { desc = "vim.lsp.buf.references()" })

    vim.keymap.set("n", "gri", function()
      vim.lsp.buf.implementation()
    end, { desc = "vim.lsp.buf.implementation()" })

    vim.keymap.set("n", "gO", function()
      vim.lsp.buf.document_symbol()
    end, { desc = "vim.lsp.buf.document_symbol()" })

    vim.keymap.set({ "i", "s" }, "<C-S>", function()
      vim.lsp.buf.signature_help()
    end, { desc = "vim.lsp.buf.signature_help()" })
  end

  do
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
    end, { desc = "Jump to the next diagnostic in the current buffer" })

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
    end, { desc = "Jump to the previous diagnostic in the current buffer" })

    vim.keymap.set("n", "<C-W>d", function()
      vim.diagnostic.open_float()
    end, { desc = "Show diagnostics under the cursor" })

    vim.keymap.set(
      "n",
      "<C-W><C-D>",
      "<C-W>d",
      { remap = true, desc = "Show diagnostics under the cursor" }
    )
  end
end

return M
