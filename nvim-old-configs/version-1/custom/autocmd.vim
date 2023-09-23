fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
augroup THE_TRIM
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END


augroup MAP_SASS_TO_SCSS
  autocmd!
  autocmd BufRead,BufNewFile *.scss set filetype=sass
augroup END

" Format on save
" autocmd BufWritePre * :Neoformat
" autocmd FileType html autocmd BufWritePre <buffer> call HtmlBeautify()

" In insert mode, no wait for each keystroke of the mapping before aborting it and carrying out the behaviour of the keys typed so far
augroup FAST_ESCAPE
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
augroup END
