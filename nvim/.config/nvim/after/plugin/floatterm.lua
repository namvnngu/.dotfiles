vim.g["floaterm_keymap_new"]    = "<F5>"
vim.g["floaterm_keymap_prev"]   = "<F6>"
vim.g["floaterm_keymap_next"]   = "<F7>"
vim.g["floaterm_keymap_toggle"] = "<F8>"
vim.g["floaterm_keymap_kill"]   = "<F9>"
vim.g["floaterm_position"]      = "bottom"
vim.g["floaterm_width"]         = 1.0

vim.cmd([[
    hi FloatermBorder guibg=none guifg=orange
    hi FloatermNC guibg=gray
  ]])
