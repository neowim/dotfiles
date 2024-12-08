# ----------------------------------------
# Aliases
# ----------------------------------------

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"  # Go to home directory
alias back="cd -"
alias cfg="cd ~/.config"

# Listing
alias ls="lsd --group-dirs first"
alias la="lsd -Ahl --group-dirs first"  # Show all files with human-readable sizes and long format
alias l="lsd -F --group-dirs first"     # Simple listing with file type indicators
alias ll="lsd -l --group-dirs first"    # Long listing format
alias lt="lsd --tree --group-dirs first"  # Tree view
alias lta="lsd --tree -a --group-dirs first"  # Tree view with hidden files
alias lr="lsd -R --group-dirs first"    # Recursive listing
alias lS="lsd -1 --group-dirs first"    # One file per line
alias ldot="lsd -ld .* --group-dirs first"  # List only dot files
alias lsize="lsd -lS --group-dirs first"  # Sort by size
alias ldate="lsd -lt --group-dirs first"  # Sort by date

# Safer Operations
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# neovim shortcuts
alias vim="nvim"

alias top="htop"
alias cat="bat"

# Chezmoi Shortcuts
alias cm="chezmoi"
alias cms="chezmoi status"
alias cma="chezmoi apply -v"
alias cme="chezmoi edit"
alias cmu="chezmoi update -v"
alias cmd="chezmoi diff"

# Git Shortcuts
alias gst="git status"
alias ga="git add"
alias gcam="git commit -m"
alias gp="git push"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gpl="git pull"
alias grb="git rebase"
alias grs="git reset"
alias grh="git reset --hard"

# Directory Shortcuts
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dev="cd ~/Code"

# System Updates (macOS)
alias brewup="brew update && brew upgrade --greedy && brew cleanup --prune=all && brew doctor"

# Networking
alias myip="curl ifconfig.me"

# Quick Edit and Reload zshrc
alias zshconfig="nano ~/.zshrc"
alias reload="source ~/.zshrc"

# History
alias h="history"

# Disk Usage
alias df="df -h"
alias du="du -h"

# Clear Terminal
alias c="clear"

# Shortcuts
alias please="sudo"

# Python Shortcuts
alias python="python3"
alias py="python3"
alias pip="pip3"

# Clipboard Operations (macOS)
alias pbcopy="pbcopy"
alias pbpaste="pbpaste"

# Open Current Directory in Finder (macOS)
alias o.="open ."

# Extract Archives
alias extract="tar -xvf"

# Grep with Color
alias grep="grep --color=auto"

# IP Config (macOS)
alias ipconfig="ifconfig"

# Docker Shortcuts
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# Modern CLI Tools
alias rg="rg --smart-case"  # ripgrep with smart case
alias fd="fd --hidden --follow"  # modern find
alias ports="lsof -i -P -n | grep LISTEN"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

# Miscellaneous
alias path='echo -e ${PATH//:/\\n}'
alias wx='curl wttr.in'

# Alias for updating Zsh plugins
alias upzsh="update_zsh_plugins"
