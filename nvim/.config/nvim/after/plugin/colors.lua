-- vim.cmd([[
--   set background=dark
--   let g:gruvbox_contrast_dark='medium'
--   let g:gruvbox_contrast_light='medium'
--   let g:gruvbox_transparent_bg=1
--   colorscheme gruvbox
-- ]])

-- vim.cmd([[
--   let g:tokyonight_transparent=1
--   let g:tokyonight_transparent_sidebar=1
--   colorscheme tokyonight
-- ]])

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

vim.o.background = 'dark'
require('rose-pine').setup({
  variant = 'moon',
  disable_background = true,
  disable_float_background = true,
  disable_italics = true,
})
vim.cmd.colorscheme('rose-pine')

-- vim.cmd.colorscheme('monotone')

-- Transparent background
-- vim.cmd([[
--   autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
--   autocmd VimEnter * hi NormalFloat ctermbg=NONE guibg=NONE
-- ]])
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
