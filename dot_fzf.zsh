# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Use fd (faster than find) as the default command for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .direnv --exclude venv'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude .direnv --exclude venv'

# Customize appearance
export FZF_DEFAULT_OPTS='
  --height=40%
  --layout=reverse
  --border
  --info=inline
  --prompt="Search> "
  --pointer="▶ "
  --marker="✓ "
  --color=fg:#d8dee9,bg:#2e3440,hl:#88c0d0
  --color=fg+:#e5e9f0,bg+:#4c566a,hl+:#8fbcbb
  --color=info:#88c0d0,prompt:#81a1c1,pointer:#bf616a,marker:#ebcb8b
'

# Enable preview for selected files (requires `bat` or `cat`)
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} || cat {}' --preview-window=right:60%:wrap"

# Preview directories with tree (requires `tree`)
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --preview-window=right:60%:wrap"
