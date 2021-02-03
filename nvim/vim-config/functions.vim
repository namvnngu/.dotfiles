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
function Google()
    :read $HOME/.config/nvim/templates/Google.cpp
endfunction
function CP()
    :read $HOME/.config/nvim/templates/CP.cpp
endfunction
function Html()
    :read $HOME/.config/nvim/templates/index.html
endfunction
