let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-highlight',
  \]

autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <leader>cp :call CocAction('pickColor')<CR>
nnoremap <leader>cr :call CocAction('colorPresentation')<CR>
