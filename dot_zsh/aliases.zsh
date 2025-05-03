# ----------------------------------------
# Navigation
# ----------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias back="cd -"
alias cfg="cd ~/.config"

# Directory Shortcuts
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dev="cd ~/Dev"

# ----------------------------------------
# Listing
# ----------------------------------------
alias ls="lsd --group-dirs first"
alias l="lsd -F --group-dirs first"      # Simple listing with file type indicators
alias ll="lsd -l --group-dirs first"     # Long listing format
alias la="lsd -Ahl --group-dirs first"   # Show all files with human-readable sizes
alias lt="lsd --tree --group-dirs first" # Tree view
alias lta="lsd --tree -a --group-dirs first"  # Tree view with hidden files
alias lr="lsd -R --group-dirs first"     # Recursive listing
alias lS="lsd -1 --group-dirs first"     # One file per line
alias ldot="lsd -ld .* --group-dirs first"  # List only dot files
alias lsize="lsd -lS --group-dirs first" # Sort by size
alias ldate="lsd -lt --group-dirs first" # Sort by date

# ----------------------------------------
# Git Operations
# ----------------------------------------
alias gs="git status -sb"   # Shorter status output
alias gst="git status"
alias ga="git add"
alias gaa="git add --all"   # Add all changes
alias ginit='git add . && git commit -m "chore: initial commit with project scaffolding"'
alias gcam="git commit -m"
alias gp="git push"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias gd="git difftool"
alias gpl="git pull"
alias grb="git rebase"
alias grs="git reset"
alias grh="git reset --hard"
alias git-diff='git difftool'

# ----------------------------------------
# Docker Operations
# ----------------------------------------
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"  # Cleaner docker ps
alias dcu="docker compose up -d"     # Start in detached mode
alias dcd="docker compose down"      # Stop and remove containers

# ----------------------------------------
# System Operations
# ----------------------------------------
# Safer Operations
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# System Monitoring
alias top="htop"
alias mem="htop -s PERCENT_MEM"      # Show processes by memory usage
alias ports="lsof -i -P -n | grep LISTEN"  # Show listening ports

# System Updates
alias brewup="brew update && brew upgrade --greedy && brew cleanup --prune=all && brew doctor"
alias upzsh="update_zsh_plugins"

# Disk Usage
alias df="df -h"
alias du="du -h"

# ----------------------------------------
# Development Tools
# ----------------------------------------
# Editors
alias vim="nvim"

# Better Defaults
alias cat="bat"

# Python
alias python="python3"
alias py="python3"
alias pip="pip3"
alias npp="new_python_project"

# ----------------------------------------
# Chezmoi
# ----------------------------------------
alias cm="chezmoi"
alias cms="chezmoi status"
alias cma="chezmoi apply -v"
alias cme="chezmoi edit"
alias cmu="chezmoi update -v"
alias cmd="chezmoi diff"

# ----------------------------------------
# Misc Utilities
# ----------------------------------------
# Quick Edit and Reload
alias zshconfig="chezmoi edit ~/.zshrc"
alias reload="source ~/.zshrc"

# Networking
alias myip="curl ifconfig.me"
alias ipconfig="ifconfig"

# Open TWS with ibs
alias tws="/opt/ibc/twsstartmacos.sh -inline"
# macOS Specific

# Common
alias c="clear"
alias h="history | grep -i"
alias extract="tar -xvf"
alias grep="grep --color=auto"
# alias code="cursor --no-sandbox"
