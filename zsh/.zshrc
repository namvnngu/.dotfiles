os=$(uname -s)

# disable color if possible
export NO_COLOR=1

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# vim mode
# set -o vi

# reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# prompt
PROMPT='%n %~'$'\n$ '

# fzf
source <(fzf --zsh)

# nvim
alias nvimn="nvim -u NONE"

# vim
alias vimn="vim -u NONE"

# nnn
alias nnn="nnn -AdeH"

# go
export GOPATH=$HOME/.go

# pixi
export PATH=$PATH:$HOME/.pixi/bin

# direnv
eval "$(direnv hook zsh)"

# my own
export DOTFILES_PATH=$HOME/.dotfiles
export PATH=$PATH:$DOTFILES_PATH/bin
