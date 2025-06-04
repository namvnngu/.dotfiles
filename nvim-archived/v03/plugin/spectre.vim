nnoremap <Leader>S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <Leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <Leader>s <cmd>lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <Leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre
