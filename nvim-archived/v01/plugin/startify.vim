let g:startify_custom_header = [
 \ ' ________   _______   ________  ___      ___ ___  _____ ______      ',
 \ '|\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    ',
 \ '\ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   ',
 \ ' \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \  ',
 \ '  \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \ ',
 \ '   \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\',
 \ '    \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|',
 \]
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]
let g:startify_bookmarks = [
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'f': '~/.config/fish/config.fish' },
            \ ]
" let g:startify_files_number = 5
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:webdevicons_enable_startify = 1

"function! StartifyEntryFormat()
  "return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
"endfunction
