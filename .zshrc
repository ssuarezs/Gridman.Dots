# Created by newuser for 5.9

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# fnm (Fast Node Manager)
eval "$(fnm env)"

# fzf (usa .zsh en lugar de .bash si existe)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# .local bin to PATH
source $HOME/.local/bin/env

# ------------ Alias ------------

# Alias terminal
alias ll='ls -la'
alias cls='clear'

# Alias executable
alias vi='nvim'
alias py='python3'
alias tf='terraform'

# Alias git
alias ga='git add'
alias gc='git commit -m'

# Alias docker
alias db='docker build'
alias dcu='docker-compose up'
alias dcd='docker-compose down'

# ---------------------------- Zellij ----------------------------
# Auto-start Zellij if it's not already running and not inside TMUX
if command -v zellij &>/dev/null && [[ -z "$ZELLIJ" ]] && [[ -z "$TMUX" ]] && [[ -z "$TERM_PROGRAM" || "$TERM_PROGRAM" != "WarpTerminal" ]] && [[ -t 1 ]]; then
  zellij
fi


