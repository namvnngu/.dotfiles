syntax enable
set termguicolors
set background=dark " Setting dark mode
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Normal ctermbg=NONE guibg=NONE
" let g:gruvbox_contrast_dark='hard'
" autocmd vimenter * ++nested colorscheme gruvbox
" colorscheme green

" Palenight Colortheme
 colorscheme palenight
 let g:lightline = { 'colorscheme': 'palenight' }
 let g:airline_theme = "palenight"

 if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1
