" A minimal colorscheme for Vim by Nam
"
" Name:        min.vim
" Description: A minimal colorscheme with mainly black and white
" Version:     0.0.1
" Maintainer:  Nam Nguyen (Viet Nam Nguyen)
" Github:      https://github.com/namvnngu
"

" Initial setup

highlight clear

if exists("syntax on")
  syntax reset
endif

let g:colors_name = "min"

" Colors

let s:black   = { "gui": "#000000", "cterm": "0" }
let s:maroon  = { "gui": "#800000", "cterm": "1" }
let s:green   = { "gui": "#008000", "cterm": "2" }
let s:olive   = { "gui": "#808000", "cterm": "3" }
let s:navy    = { "gui": "#000080", "cterm": "4" }
let s:purple  = { "gui": "#800080", "cterm": "5" }
let s:teal    = { "gui": "#008080", "cterm": "6" }
let s:silver  = { "gui": "#c0c0c0", "cterm": "7" }
let s:grey    = { "gui": "#808080", "cterm": "8" }
let s:red     = { "gui": "#ff0000", "cterm": "9" }
let s:lime    = { "gui": "#00ff00", "cterm": "10" }
let s:yellow  = { "gui": "#ffff00", "cterm": "11" }
let s:blue    = { "gui": "#0000ff", "cterm": "12" }
let s:fuchsia = { "gui": "#ff00ff", "cterm": "13" }
let s:aqua    = { "gui": "#00ffff", "cterm": "14" }
let s:white   = { "gui": "#ffffff", "cterm": "15" }

" Utilities

"" Reference: https://github.com/noahfrederick/vim-hemisu/blob/master/colors/hemisu.vim#L90C1-L99C12
function! s:highlight(group, style)
  let l:variant = a:style[&background]
  execute "highlight" a:group
        \ "guifg="   (has_key(l:variant, "fg")  ? l:variant.fg.gui   : "NONE")
        \ "guibg="   (has_key(l:variant, "bg")  ? l:variant.bg.gui   : "NONE")
        \ "guisp="   (has_key(l:variant, "sp")  ? l:variant.sp.gui   : "NONE")
        \ "gui="     (has_key(l:variant, "gui") ? l:variant.gui      : "NONE")
        \ "ctermfg=" (has_key(l:variant, "fg")  ? l:variant.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(l:variant, "bg")  ? l:variant.bg.cterm : "NONE")
        \ "cterm="   (has_key(l:variant, "gui") ? l:variant.gui      : "NONE")
endfunction

" Builtin highlighting groups, see *highlight-groups*

call s:highlight("Normal", {
      \ "light": { "fg": s:black, "bg": s:white },
      \ "dark" : { "fg": s:white, "bg": s:black },
      \ })

" Builtin syntax groups, see *group-name*

call s:highlight("Comment", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("Constant", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })
highlight! link String    Constant
highlight! link Character Constant
highlight! link Number    Constant
highlight! link Boolean   Constant
highlight! link Float     Constant

call s:highlight("Identifier", {
      \ "light": { "fg": s:black, "gui": "bold" },
      \ "dark" : { "fg": s:white, "gui": "bold" },
      \ })
highlight! link Function Identifier

call s:highlight("Statement", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })
highlight! link Conditional Statement
highlight! link Repeat      Statement
highlight! link Label       Statement
highlight! link Operator    Statement
highlight! link Keyword     Statement
highlight! link Exception   Statement

call s:highlight("PreProc", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })
highlight! link Include   PreProc
highlight! link Define    PreProc
highlight! link Macro     PreProc
highlight! link PreCondit PreProc

call s:highlight("Type", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })
highlight! link StorageClass Type
highlight! link Structure    Type
highlight! link Typedef      Type

call s:highlight("Special", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })
highlight! link SpecialChar    Special
highlight! link Tag            Special
highlight! link Delimiter      Special
highlight! link SpecialComment Special
highlight! link Debug          Special

call s:highlight("Underlined", {
      \ "light": { "fg": s:black, "gui": "underline" },
      \ "dark" : { "fg": s:white, "gui": "underline" },
      \ })

call s:highlight("Ignore", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Error", {
      \ "light": { "fg": s:white, "bg": s:maroon },
      \ "dark" : { "fg": s:white, "bg": s:maroon },
      \ })

call s:highlight("Todo", {
      \ "light": { "fg": s:black, "gui": "bold" },
      \ "dark" : { "fg": s:white, "gui": "bold" },
      \ })

call s:highlight("Added", {
      \ "light": { "fg": s:black, "bg": s:lime },
      \ "dark" : { "fg": s:black, "bg": s:lime },
      \ })
call s:highlight("Changed", {
      \ "light": { "fg": s:black, "bg": s:aqua },
      \ "dark" : { "fg": s:black, "bg": s:aqua },
      \ })
call s:highlight("Removed", {
      \ "light": { "fg": s:white, "bg": s:red },
      \ "dark" : { "fg": s:white, "bg": s:red },
      \ })
