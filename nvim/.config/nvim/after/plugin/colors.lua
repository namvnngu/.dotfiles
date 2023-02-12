-- Transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.cmd([[
--   set background=light
--   let g:gruvbox_contrast_dark='medium'
--   let g:gruvbox_contrast_light='medium'
--   let g:gruvbox_transparent_bg=0
--   colorscheme gruvbox
-- ]])

-- vim.cmd([[
--   let g:tokyonight_transparent=1
--   let g:tokyonight_transparent_sidebar=1
--   colorscheme tokyonight
-- ]])

-- require("github-theme").setup({
-- 	theme_style = "dark_default",
-- 	transparent = true,
-- 	sidebars = { "qf", "vista_kind", "terminal", "packer" },
-- })
--

-- vim.cmd.colorscheme('catppuccin')
-- require('catppuccin').setup({
-- flavour = 'mocha',
-- No need to uncomment transparent_background and custom_highlights
-- transparent_background = true,
-- custom_highlights = function()
-- 	return {
-- 		CursorLine = { bg = "#424450" },
-- 	}
-- end,
-- })

vim.cmd([[
  set background=dark
  let g:everforest_background = 'medium'
  let g:everforest_better_performance = 1
  let g:everforest_disable_italic_comment = 1
  colorscheme everforest
]])
