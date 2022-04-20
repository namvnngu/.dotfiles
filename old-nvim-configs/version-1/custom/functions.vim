""""""""""""""""""
" Trim whitespace
""""""""""""""""""
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_TRIM
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup

"""""""""""
" Templates
"""""""""""
function CG()
    :read $HOME/.config/nvim/templates/CG.cpp
endfunction
function CCP()
    :read $HOME/.config/nvim/templates/CCP.cpp
endfunction
function PG()
    :read $HOME/.config/nvim/templates/PG.py
endfunction
function PCP()
    :read $HOME/.config/nvim/templates/PCP.py
endfunction
function Html()
    :read $HOME/.config/nvim/templates/HTML.html
endfunction
function Java()
    :read $HOME/.config/nvim/templates/Java.java
endfunction

