local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

-- :nmap - Display normal mode maps
-- :imap - Display insert mode maps
-- :vmap - Display visual and select mode maps
-- :smap - Display select mode maps
-- :xmap - Display visual mode maps
-- :cmap - Display command-line mode maps
-- :omap - Display operator pending mode maps

M.map = bind("", { noremap = false })
M.noremap = bind("")

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")

M.imap = bind("i", { noremap = false })
M.inoremap = bind("i")

M.vmap = bind("v", { noremap = false })
M.vnoremap = bind("v")

M.smap = bind("s", { noremap = false })
M.snoremap = bind("s")

M.xmap = bind("x", { noremap = false })
M.xnoremap = bind("x")

M.cmap = bind("c", { noremap = false })
M.cnoremap = bind("c")

M.omap = bind("o", { noremap = false })
M.onoremap = bind("o")

return M
