autocmd filetype python nnoremap <leader>pp :!clear && python3 % <CR>
autocmd filetype cpp nnoremap <leader>pp :!clear && g++ -std=c++14 % -O2 -Wall -Wextra -Werror -pedantic -g -o %.out && ./%.out <CR>
autocmd filetype java nnoremap <leader>pp :!clear && javac %:t && java -enableassertions %:t:r<CR>
autocmd filetype cs nnoremap <leader>pp :!clear && dotnet run --project %:p:h<CR>
