# fish_user_paths
set -Ux fish_user_paths $HOME/bin:/usr/local/bin $fish_user_paths
set -Ux fish_user_paths /usr/local/Cellar/llvm/10.0.0_1/bin $fish_user_paths
set -Ux fish_user_paths $HOME/Documents/Programming/bin $fish_user_paths
set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths
set -Ux fish_user_paths $HOME/.composer/vendor/bin $fish_user_paths
set -Ux fish_user_paths $HOME/.fzf/bin $fish_user_paths

# Variables
set FORMAT "ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

# Starship
starship init fish | source

# Compile and run cpp
function ccp
    g++ -std=c++14 $argv[1] -O2 -Wall -Wextra -Werror -pedantic -g -o $argv[2] && ./$argv[2] && echo
end

# Emoji
set -g fish_emoji_width 2

# fff
function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end
