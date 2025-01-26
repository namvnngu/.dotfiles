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

# polyglot tool version manager
MISE_DIR=$HOME/.config/mise
export MISE_CONFIG_DIR=$MISE_DIR/config
export MISE_CACHE_DIR=$MISE_DIR/cache
export MISE_STATE_DIR=$MISE_DIR/state
export MISE_DATA_DIR=$MISE_DIR/data
eval "$(mise activate zsh)"
alias mx="mise exec"
alias mr="mise run"

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

# my own
export DOTFILES_PATH=$HOME/.dotfiles
export PATH=$PATH:$DOTFILES_PATH/bin
