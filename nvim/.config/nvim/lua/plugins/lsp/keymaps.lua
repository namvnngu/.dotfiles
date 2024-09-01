local M = {}

function M.on_attach()
  -- See *lsp-defaults*
  -- NOTE: Inspect require("vim._defaults") to check if the below mappings are
  -- included in the stable Neovim. If yes, then remove the below mappings.

  --- Reference: https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L154
  ---
  --- Default maps for LSP functions.
  ---
  --- These are mapped unconditionally to avoid different behavior depending on whether an LSP
  --- client is attached. If no client is attached, or if a server does not support a capability, an
  --- error message is displayed rather than exhibiting different behavior.
  ---
  --- See |grr|, |grn|, |gra|, |i_CTRL-S|.
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

    vim.keymap.set("i", "<C-S>", function()
      vim.lsp.buf.signature_help()
    end, { desc = "vim.lsp.buf.signature_help()" })
  end

  --- Map [d and ]d to move to the previous/next diagnostic. Map <C-W>d to open a floating window
  --- for the diagnostic under the cursor.
  ---
  --- See |[d-default|, |]d-default|, and |CTRL-W_d-default|.
  do
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = vim.v.count1 })
    end, { desc = "Jump to the next diagnostic in the current buffer" })

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -vim.v.count1 })
    end, { desc = "Jump to the previous diagnostic in the current buffer" })

    vim.keymap.set("n", "]D", function()
      vim.diagnostic.jump({ count = math.huge, wrap = false })
    end, { desc = "Jump to the last diagnostic in the current buffer" })

    vim.keymap.set("n", "[D", function()
      vim.diagnostic.jump({ count = -math.huge, wrap = false })
    end, { desc = "Jump to the first diagnostic in the current buffer" })

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
