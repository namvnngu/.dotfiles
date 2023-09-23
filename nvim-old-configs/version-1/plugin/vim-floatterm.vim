let g:floaterm_keymap_new    = '<F5>'
let g:floaterm_keymap_prev   = '<F6>'
let g:floaterm_keymap_next   = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'
let g:floaterm_keymap_kill   = '<F9>'
let g:floaterm_position      = 'bottom'
let g:floaterm_width         = 1.0

hi FloatermBorder guibg=none guifg=orange
hi FloatermNC guibg=gray
nnoremap <Leader>ftbo :hi FloatermBorder guibg=none guifg=orange<CR>
