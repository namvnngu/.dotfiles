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
end

return M
