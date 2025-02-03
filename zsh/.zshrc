# get os
os=$(uname -s)

# add the path to $PATH if it is not already included.
# source: https://superuser.com/a/39995
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# disable color if possible
export NO_COLOR=1

# history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

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
pathadd $HOME/.pixi/bin

# direnv
eval "$(direnv hook zsh)"

# my own
pathadd $HOME/.dotfiles/bin
