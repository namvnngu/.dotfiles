# prompt
PROMPT='%n %~'$'\n$ '

# history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

# paths
add-path() {
  if [[ -d "${1}" ]] && [[ ":${PATH}:" != *":${1}:"* ]]; then
    PATH="${1}:${PATH:+"${PATH}"}"
  fi
}

add-path "${HOME}/bin"
add-path "${HOME}/.local/bin"
add-path "${HOME}/.pixi/bin"

# tools's missing man pages (e.g. mise, pixi)
export MANPATH="${HOME}/.local/share/manx:"

# namtools
export NAMTOOLS_DATA_DIR="${HOME}/.local/share/namtools"

# mise
export MISE_CONFIG_DIR="${HOME}/.config/mise"
export MISE_CACHE_DIR="${HOME}/.local/share/mise/cache"
export MISE_STATE_DIR="${HOME}/.local/share/mise/state"
export MISE_DATA_DIR="${HOME}/.local/share/mise/data"
eval "$("${HOME}"/.local/bin/mise activate zsh)"

# fzf
source <(fzf --zsh)

# go
export GOPATH="${HOME}/.go"

