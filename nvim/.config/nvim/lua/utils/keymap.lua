local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_deep_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

-- n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
-- i  Insert mode map. Defined using ':imap' or ':inoremap'.
-- v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
-- x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
-- s  Select mode map. Defined using ':smap' or ':snoremap'.
-- c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
-- o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
-- t  Create a mapping that applies only in Terminal mode. Defined using ':tmap' or ':tnoremap'.

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

M.tmap = bind("t", { noremap = false })
M.tnoremap = bind("t")

return M
