vim.o.background = 'dark'
require('gruvbox').setup({
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  transparent_mode = true,
})
vim.cmd.colorscheme('gruvbox')

-- require('tokyonight').setup({
--   style = 'moon',
--   transparent = true,
--   styles = {
--     comments = { italic = false },
--     keywords = { italic = false },
--   },
-- })
-- vim.cmd.colorscheme('tokyonight')

-- require('github-theme').setup({
--   theme_style = 'dark_default',
--   transparent = true,
--   sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
-- })

-- require('catppuccin').setup({
--   flavour = 'mocha',
--   transparent_background = true,
--   no_italic = true,
-- })
-- vim.cmd.colorscheme('catppuccin')

-- vim.cmd([[
--   set background=dark
--   let g:everforest_background = 'medium'
--   let g:everforest_better_performance = 1
--   let g:everforest_disable_italic_comment = 1
-- ]])
-- vim.cmd.colorscheme('everforest')

-- vim.o.background = 'dark'
-- require('rose-pine').setup({
--   variant = 'moon',
--   disable_background = true,
--   disable_float_background = true,
--   disable_italics = true,
-- })
-- vim.cmd.colorscheme('rose-pine')

-- require('nightfox').setup({
--   options = {
--     transparent = true
--   }
-- })
-- vim.cmd.colorscheme('nightfox')

-- vim.cmd.colorscheme('monotone')

-- Transparent background
-- vim.cmd([[
--   autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
--   autocmd VimEnter * hi NormalFloat ctermbg=NONE guibg=NONE
-- ]])
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', ctermbg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', ctermbg = 'none' })
