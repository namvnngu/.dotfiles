os=$(uname -s)

###############################################################################
# SETTINGS                                                                    #
###############################################################################

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

###############################################################################
# PLUGINS                                                                     #
###############################################################################

# auto suggestions
# ZSH_AUTO_SUGGESTIONS_DIR=$HOME/.zsh/zsh-autosuggestions
# if [[ ! -d $ZSH_AUTO_SUGGESTIONS_DIR ]]; then
#   git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTO_SUGGESTIONS_DIR
# fi
# source $ZSH_AUTO_SUGGESTIONS_DIR/zsh-autosuggestions.zsh

# syntax highlighting
# ZSH_SYNTAX_HIGHLIGHTING_DIR=$HOME/.zsh/zsh-syntax-highlighting
# if [[ ! -d $ZSH_SYNTAX_HIGHLIGHTING_DIR ]]; then
#   git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_SYNTAX_HIGHLIGHTING_DIR
# fi
# source $ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh

# jump around
# Z_DIR=$HOME/.zsh/z
# if [[ ! -d $Z_DIR ]]; then
#   git clone --depth 1 https://github.com/rupa/z $Z_DIR
# fi
# export _Z_DATA=$Z_DIR/.z
# source $Z_DIR/z.sh

###############################################################################
# TOOLS                                                                       #
###############################################################################

# polyglot tool version manager
MISE_DIR=$HOME/.mise
export MISE_CONFIG_DIR=$MISE_DIR/config
export MISE_CACHE_DIR=$MISE_DIR/cache
export MISE_STATE_DIR=$MISE_DIR/state
export MISE_DATA_DIR=$MISE_DIR/data
eval "$(mise activate zsh)"
alias mx="mise exec"
alias mr="mise run"

# fzf
FZF_DIR=$HOME/.fzf
if [[ ! -d $FZF_DIR ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR
  $HOME/.fzf/install
fi
if [[ -f $HOME/.fzf.zsh ]]; then
  source $HOME/.fzf.zsh
fi

# nvim
alias nvimn="nvim -u NONE"

# vim
alias vimn="vim -u NONE"

# nnn
alias nnn="nnn -deH"

# go
export GOPATH=$HOME/.go

# my own
export DOTFILES_PATH=$HOME/.dotfiles
export PATH=$PATH:$DOTFILES_PATH/bin
