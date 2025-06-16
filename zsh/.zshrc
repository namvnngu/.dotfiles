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

# default editor
if command -v nvim >/dev/null 2>&1; then
  export EDITOR='nvim'
elif command -v vim >/dev/null 2>&1; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# prompt
PROMPT='%n %~'$'\n$ '

# emacs mode
set -o emacs

# fzf
source <(fzf --zsh)

# go
export GOPATH="$HOME/.go"

# pixi
pathadd "$HOME/.pixi/bin"

# search and highlight
alias hl='rg --passthru'

# man
export MANPAGER='nvim +Man!'

# my own
export DOTFILES_PATH="$HOME/.dotfiles"
pathadd "$HOME/.dotfiles/bin"
