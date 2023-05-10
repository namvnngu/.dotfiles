# $PATH
export TERM="xterm-256color"
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/.fzf/bin
export PATH=$PATH:$(go env GOPATH)/bin

# Variables
export FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

# Starship
# PROMPT='%F{cyan}%n%f %~'$'\n$ '
eval "$(starship init zsh)"

# auto-completions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Vim mode
# set -o vi

# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh time
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# z
Z_FOLDER=~/.z.sh
Z_FILE=$Z_FOLDER/z.sh
Z_DATAFILE=$Z_FOLDER/.z

if [ ! -f $Z_FILE ]; then
  git clone --depth 1 https://github.com/rupa/z.git $Z_FOLDER
  chmod +x $Z_FILE
fi
export _Z_DATA=$Z_DATAFILE
source $Z_FILE

# tmux
# tmux source-file ~/.tmux.conf

# n: node version manager
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
