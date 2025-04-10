# get os
os=$(uname -s)

# add the path to $PATH if it is not already included.
# source: https://superuser.com/a/39995
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

# vim mode
# set -o vi

# reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# prompt
PROMPT='%n %~'$'\n$ '

# fzf
source <(fzf --zsh)

# nvim
alias nvimn='nvim -u NONE'

# vim
alias vimn='vim -u NONE'

# go
export GOPATH=$HOME/.go

# pixi
pathadd $HOME/.pixi/bin

# man page
export MANPAGER='nvim +Man!'

# search and highlight
alias hl="rg --passthru"

# my own
export DOTFILES_PATH=$HOME/.dotfiles
pathadd $HOME/.dotfiles/bin
