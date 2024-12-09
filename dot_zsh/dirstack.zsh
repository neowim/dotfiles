# Directory stack configuration and navigation
#
# Features:
# - Automatically maintains a directory history as you cd around
# - Use 'd' to view numbered directory stack
# - Use 0-5 to jump to any directory in the stack
# - Use 'back' to go to previous directory
# - Use 'cl' to clear the stack
#
# Examples:
# cd ~/Documents     # Adds to stack
# cd ~/Downloads     # Adds to stack
# d                  # Show numbered stack
# 2                  # Jump to directory #2
# back              # Go to previous directory
# cl                # Clear the stack

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

DIRSTACKSIZE=20            # Maximum size of the directory stack.

# Directory stack aliases
alias d='dirs -v'          # List directory stack with numbers
alias 0='cd ~0'            # Switch to directory 0
alias 1='cd ~1'            # Switch to directory 1
alias 2='cd ~2'            # Switch to directory 2
alias 3='cd ~3'            # Switch to directory 3
alias 4='cd ~4'            # Switch to directory 4
alias 5='cd ~5'            # Switch to directory 5
alias back='cd -'          # Go back to previous directory
alias cl='dirs -c'         # Clear the directory stack

# Enhanced cd that maintains the directory stack
cd() {
    if [ "$#" = "0" ]; then
        builtin cd || return
    else
        builtin cd "$@" || return
    fi
    # Only show directory stack if it has more than one entry
    if [ "$(dirs -p | wc -l)" -gt "1" ]; then
        dirs -v
    fi
}
