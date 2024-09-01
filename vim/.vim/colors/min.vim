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
let s:grey30  = { "gui": "#4e4e4e", "cterm": "239" }

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

call s:highlight("ColorColumn", {
      \ "light": { "bg": s:silver },
      \ "dark" : { "bg": s:silver },
      \ })

call s:highlight("Conceal", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("CurSearch", {
      \ "light": { "fg": s:white, "bg": s:olive },
      \ "dark" : { "fg": s:white, "bg": s:olive },
      \ })

call s:highlight("Cursor", {
      \ "light": { "fg": s:white, "bg": s:black },
      \ "dark" : { "fg": s:black, "bg": s:white },
      \ })
highlight! link lCursor Cursor

highlight! link CursorIM Cursor

call s:highlight("CursorColumn", {
      \ "light": { "bg": s:silver },
      \ "dark" : { "bg": s:grey30 },
      \ })

call s:highlight("CursorLine", {
      \ "light": { "bg": s:silver },
      \ "dark" : { "bg": s:grey30 },
      \ })

call s:highlight("Directory", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("DiffAdd", {
      \ "light": { "fg": s:black, "bg": s:lime },
      \ "dark" : { "fg": s:black, "bg": s:lime },
      \ })
call s:highlight("DiffChange", {
      \ "light": { "fg": s:white, "bg": s:olive },
      \ "dark" : { "fg": s:white, "bg": s:olive },
      \ })
call s:highlight("DiffDelete", {
      \ "light": { "fg": s:white, "bg": s:red },
      \ "dark" : { "fg": s:white, "bg": s:red },
      \ })
call s:highlight("DiffText", {
      \ "light": { "fg": s:black, "bg": s:aqua },
      \ "dark" : { "fg": s:black, "bg": s:aqua },
      \ })

call s:highlight("EndOfBuffer", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

highlight! link TermCursor Cursor

call s:highlight("TermCursorNC", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("ErrorMsg", {
      \ "light": { "fg": s:maroon },
      \ "dark" : { "fg": s:maroon },
      \ })

call s:highlight("WinSeparator", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Folded", {
      \ "light": { "fg": s:grey, "bg": s:silver },
      \ "dark" : { "fg": s:grey, "bg": s:silver },
      \ })

call s:highlight("FoldColumn", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

highlight! link SignColumn FoldColumn

call s:highlight("IncSearch", {
      \ "light": { "fg": s:black, "bg": s:olive },
      \ "dark" : { "fg": s:black, "bg": s:olive },
      \ })

call s:highlight("Substitute", {
      \ "light": { "fg": s:black, "bg": s:yellow },
      \ "dark" : { "fg": s:black, "bg": s:yellow },
      \ })

call s:highlight("LineNr", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr

call s:highlight("CursorLineNr", {
      \ "light": { "fg": s:black, "gui": "bold" },
      \ "dark" : { "fg": s:white, "gui": "bold" },
      \ })

call s:highlight("CursorLineFold", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })
highlight! link CursorLineSign CursorLineFold

call s:highlight("MatchParen", {
      \ "light": { "fg": s:black, "bg": s:grey },
      \ "dark" : { "fg": s:white, "bg": s:grey },
      \ })

call s:highlight("ModeMsg", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("MsgArea", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("MsgSeparator", {
      \ "light": { "fg": s:grey, "bg": s:black },
      \ "dark" : { "fg": s:grey, "bg": s:white },
      \ })

call s:highlight("MoreMsg", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("NonText", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

call s:highlight("Normal", {
      \ "light": { "fg": s:black, "bg": s:white },
      \ "dark" : { "fg": s:white, "bg": s:black },
      \ })

highlight! link NormalFloat Normal

highlight! link FloatBorder Normal

highlight! link FloatTitle Normal

highlight! link FloatFooter Normal

highlight! link NormalNC Normal

call s:highlight("Pmenu", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("PmenuSel", {
      \ "light": { "fg": s:black, "bg": s:grey },
      \ "dark" : { "fg": s:black, "bg": s:grey },
      \ })

call s:highlight("Question", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("QuickFixLine", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Search", {
      \ "light": { "fg": s:black, "bg": s:yellow },
      \ "dark" : { "fg": s:black, "bg": s:yellow },
      \ })

call s:highlight("SnippetTabstop", {
      \ "light": { "fg": s:black, "bg": s:grey },
      \ "dark" : { "fg": s:black, "bg": s:grey },
      \ })

call s:highlight("SpecialKey", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
      \ })

call s:highlight("SpellBad", {
      \ "light": { "fg": s:black, "gui": "underline" },
      \ "dark" : { "fg": s:white, "gui": "underline" },
      \ })

highlight! link SpellCap SpellBad

highlight! link SpellLocal SpellBad

highlight! link SpellRare SpellBad

call s:highlight("StatusLine", {
      \ "light": { "fg": s:white, "bg": s:black },
      \ "dark" : { "fg": s:black, "bg": s:white },
      \ })

call s:highlight("StatusLineNC", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("TabLine", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("TabLineSel", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Title", {
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
      \ })

call s:highlight("Visual", {
      \ "light": { "fg": s:black, "bg": s:silver },
      \ "dark" : { "fg": s:black, "bg": s:silver },
      \ })

call s:highlight("WarningMsg", {
      \ "light": { "fg": s:olive },
      \ "dark" : { "fg": s:olive },
      \ })

call s:highlight("Whitespace", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("WinBar", {
      \ "light": { "fg": s:grey },
      \ "dark" : { "fg": s:grey },
      \ })

call s:highlight("WinBarNC", {
      \ "light": { "fg": s:silver },
      \ "dark" : { "fg": s:silver },
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
      \ "light": { "fg": s:black },
      \ "dark" : { "fg": s:white },
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
      \ "light": { "fg": s:maroon },
      \ "dark" : { "fg": s:maroon },
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
