# If you come from bash you might have to change your $PATH.
export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/llvm/10.0.0_1/bin
export PATH=$PATH:$HOME/Documents/Programming/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

# Variables
export FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/Users/namnguyen/.oh-my-zsh"

# oh-my-zsh Theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# oh-my-zsh Plugins
plugins=(
  git
  dnf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# Z
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Compile and run cpp
ccp()
{
    g++ -std=c++14 $1 -O2 -Wall -Wextra -Werror -pedantic -g -o $2 && ./$2 && echo
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


