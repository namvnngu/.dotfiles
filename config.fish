# PATH
set -Ux PATH $HOME/bin:/usr/local/bin $PATH
set -Ux PATH /usr/local/Cellar/llvm/10.0.0_1/bin $PATH
set -Ux PATH $HOME/Documents/Programming/bin $PATH
set -Ux PATH $HOME/.local/bin $PATH
set -Ux PATH $HOME/.composer/vendor/bin $PATH

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