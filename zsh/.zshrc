# $PATH
export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.fzf/bin


# Variables
export FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

# Starship
PROMPT='%F{cyan}%n%f %~'$'\n$ '
eval "$(starship init zsh)"

# Z
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# auto-completions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Vim mode
set -o vi

# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh time
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# git
function my-branch() {
  git for-each-ref --format=' %(authorname) %09 %(refname)' --sort=authorname | grep -e $1
}

# tmux
tmux source-file ~/.tmux.conf
