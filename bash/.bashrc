# prompt 
PS1='\u \w\n$ '

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
