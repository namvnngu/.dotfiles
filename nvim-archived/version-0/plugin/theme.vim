syntax enable
set termguicolors
set background=dark " Setting dark mode
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Normal ctermbg=NONE guibg=NONE
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Gruvbox
" let g:gruvbox_contrast_dark='hard'
" autocmd vimenter * ++nested colorscheme gruvbox

" Green
" colorscheme green

" Palenight Colortheme
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

let g:palenight_terminal_italics=1

" Rose-pine
colorscheme rose-pine-dark
highlight ColorColumn ctermbg=0 guibg=#bfa3ab
