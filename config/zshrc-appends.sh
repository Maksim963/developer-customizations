#  ╔═══════════════════════════════════════════════════════════════════════════╗
#  ║ ███╗   ███╗ █████╗ ██╗  ██╗███████╗    ██████╗███╗   ███╗██████╗ ███████╗ ║
#  ║ ████╗ ████║██╔══██╗╚██╗██╔╝██╔════╝   ██╔════╝████╗ ████║██╔══██╗██╔════╝ ║
#  ║ ██╔████╔██║███████║ ╚███╔╝ ███████╗   ██║     ██╔████╔██║██║  ██║███████╗ ║
#  ║ ██║╚██╔╝██║██╔══██║ ██╔██╗ ╚════██║   ██║     ██║╚██╔╝██║██║  ██║╚════██║ ║
#  ║ ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗███████║   ╚██████╗██║ ╚═╝ ██║██████╔╝███████║ ║
#  ║ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═════╝╚═╝     ╚═╝╚═════╝ ╚══════╝ ║
#  ╚═══════════════════════════════════════════════════════════════════════════╝

# Disable conda's automatic prompt modification (we'll handle it ourselves)
export CONDA_CHANGEPS1=false

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Set name of the theme to load (using custom prompt instead)
# ZSH_THEME="refined"

# Which plugins would you like to load?
plugins=(
  git
  docker
  docker-compose
  kubectl
  brew
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Enable better completion
autoload -U compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git enhancements with scmpuff (after oh-my-zsh)
eval "$(scmpuff init --shell=zsh)"

# Custom prompt with colors and git info
autoload -Uz vcs_info
precmd() { vcs_info }

# Configure git info
zstyle ':vcs_info:git:*' formats '%F{magenta}%b%f'
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST

# Function to get conda env
conda_env_prompt() {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "%F{yellow}($CONDA_DEFAULT_ENV)%f"
    fi
}

# Function to get git branch with emoji
git_branch_prompt() {
    if [[ -n "${vcs_info_msg_0_}" ]]; then
        echo " %F{green}%f ${vcs_info_msg_0_}"
    fi
}

# Clean 3-line prompt: conda + git + time | directory | arrow
PROMPT='$(conda_env_prompt)$(git_branch_prompt) %F{white}[%D{%H:%M:%S}]%f
%F{green}%~%f %(?.%F{white}.%F{red})❯%f '

# Better directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

source <(fzf --zsh)

# Fuzzy finder for cd
cdf() {
  local file

  file=$(fzf)

  if [ -n "$file" ]; then
    cd -- "$(dirname "$file")"
  fi
}

# Make and change directory in one command
mkcd() { mkdir -p "$1" && cd "$1" }

# Type less letter
alias vim=nvim
alias k=kubectl

alias d=docker
alias dps='docker ps'


alias c=cursor

# Where go often
alias workspace="cd ~/workspace"

alias g-="git switch -"
alias gmain="git switch main"
alias gdev="git switch develop"
alias gmaster="git switch master"
alias gswit="git switch"

eval "$(zoxide init zsh)"
fpath=(~/.zsh/completion $fpath)

alias cl=clear
alias timeout=gtimeout
alias tf=terraform

# Rust (Homebrew's rustup is keg-only)
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Postgres client tools (psql, pg_dump)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export PATH="$HOME/.opencode/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

#  ╔════════════════════════════════════════════════════════════════════════════╗
#  ║                 ███████╗██╗███╗   ██╗                                      ║
#  ║                 ██╔════╝██║████╗  ██║                                      ║
#  ║                 █████╗  ██║██╔██╗ ██║                                      ║
#  ║                 ██╔══╝  ██║██║╚██╗██║                                      ║
#  ║                 ██║     ██║██║ ╚████║                                      ║
#  ║                 ╚═╝     ╚═╝╚═╝  ╚═══╝                                      ║
#  ╚════════════════════════════════════════════════════════════════════════════╝