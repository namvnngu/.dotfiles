# get os
os=$(uname -s)

# add the path to $PATH if it is not already included.
add_path() {
  if [[ -d "${1}" ]] && [[ ":${PATH}:" != *":${1}:"* ]]; then
    PATH="${1}:${PATH:+"${PATH}"}"
  fi
}

# history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

# reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# prompt
PROMPT='%n %~'$'\n$ '

# emacs mode
set -o emacs

# add local bin
add_path "${HOME}/.local/bin"

# namtools
export NAMTOOLS_DATA_DIR="${HOME}/.local/share/namtools"

# manx's man1
export MANPATH="${HOME}/.local/share/manx:"

# pixi
add_path "${HOME}/.pixi/bin"

# mise
export MISE_CONFIG_DIR="${HOME}/.config/mise"
export MISE_CACHE_DIR="${HOME}/.local/share/mise/cache"
export MISE_STATE_DIR="${HOME}/.local/share/mise/state"
export MISE_DATA_DIR="${HOME}/.local/share/mise/data"
eval "$("${HOME}"/.local/bin/mise activate zsh)"

# default editor
if command -v nvim >/dev/null 2>&1; then
  export EDITOR='nvim'
elif command -v vim >/dev/null 2>&1; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# search and highlight
alias hl='rg --passthru'

# fzf
source <(fzf --zsh)

# go
export GOPATH="${HOME}/.go"

