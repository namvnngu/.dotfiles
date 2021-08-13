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

# mov to gif
function movgif() {
  movie=$1
  height=$(mdls -name kMDItemPixelHeight ${movie} | grep -o '[0-9]\+')
  width=$(mdls -name kMDItemPixelWidth ${movie} | grep -o '[0-9]\+')
  dimensions="${width}x${height}"
	
  # ffmpeg -i ${movie} -s ${dimensions} -pix_fmt rgb8 -r 1 -f gif output.gif
  ffmpeg -i ${movie} -s ${dimensions} -vf "fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
  gifsicle -O3 output.gif -o output.gif
}