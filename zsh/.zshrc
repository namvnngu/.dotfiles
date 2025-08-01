# get os
os=$(uname -s)

# add the path to $PATH if it is not already included.
add_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1:${PATH:+"$PATH"}"
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

# pixi
add_path "$HOME/.pixi/bin"

# emacs mode
set -o emacs

# fzf
source <(fzf --zsh)

# go
export GOPATH="$HOME/.go"

# search and highlight
alias hl='rg --passthru'

# my own
export DOTFILES_PATH="$HOME/.dotfiles"
add_path "$HOME/.dotfiles/bin"
