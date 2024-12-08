# ----------------------------------------
# Custom Zsh Functions
# ------------------------func----------------

# Function to update Zsh plugins and themes
# Description: Updates all Zsh plugins and themes by pulling the latest changes from their respective Git repositories.
# Usage: Run 'update_zsh_plugins' or use the alias 'upzsh' to update all plugins.
function update_zsh_plugins() {
    local plugins_dir="$HOME/.zsh/plugins"
    local themes_dir="$HOME/.zsh/themes"

    # List of plugin directories to update
    local plugins=(
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zsh-completions"
        "zsh-history-substring-search"
    )

    # List of theme directories to update
    local themes=(
        "powerlevel10k"
    )

    echo "Starting plugin update process..."

    # Update plugins
    for plugin in "${plugins[@]}"; do
        echo "----------------------------------------"
        echo "Updating $plugin..."

        if [ -d "$plugins_dir/$plugin" ]; then
            if git -C "$plugins_dir/$plugin" pull --ff-only; then
                echo "$plugin updated successfully."
            else
                echo "Failed to update $plugin. Please check for issues."
            fi
        else
            echo "Plugin directory $plugins_dir/$plugin does not exist."
            echo "Skipping $plugin."
        fi
    done

    # Update themes
    for theme in "${themes[@]}"; do
        echo "----------------------------------------"
        echo "Updating $theme..."

        if [ -d "$themes_dir/$theme" ]; then
            if git -C "$themes_dir/$theme" pull --ff-only; then
                echo "$theme updated successfully."
            else
                echo "Failed to update $theme. Please check for issues."
            fi
        else
            echo "Theme directory $themes_dir/$theme does not exist."
            echo "Skipping $theme."
        fi
    done

    echo "----------------------------------------"
    echo "Plugin and theme update process completed."
}


# Function: mkcd
# Description: Creates a new directory and immediately navigates into it.
# Usage: mkcd <directory_name>
function mkcd() {
    # Check if a directory name was provided
    if [ -z "$1" ]; then
        echo "Usage: mkcd <directory_name>"
        return 1
    fi

    # Create the directory and navigate into it
    mkdir -p "$1" && cd "$1"
}

# Function: extract
# Description: Extracts various types of compressed files using a single command.
# Usage: extract <file_name>
function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "Cannot extract '$1' - unknown format." ;;
        esac
    else
        echo "'$1' is not a valid file."
    fi
}

# Function: weather
# Description: Displays the current weather for a specified location.
# Usage: weather [location]
function weather() {
    local location="${1:-}"
    if [ -n "$location" ]; then
        curl "wttr.in/$location"
    else
        curl wttr.in
    fi
}

# Function: path
# Description: Displays each directory in the PATH variable on a new line.
# Usage: path
function path() {
    echo "$PATH" | tr ':' '\n'
}

# Function: please
# Description: A fun alternative to 'sudo' that responds politely.
# Usage: please <command>
function please() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: please <command>"
        return 1
    fi
    sudo "$@"
}

# Function: killport
# Description: Kills the process running on the specified port
# Usage: killport <port_number>
function killport() {
    if [ -z "$1" ]; then
        echo "Usage: killport <port_number>"
        return 1
    fi
    local pid=$(lsof -ti tcp:"$1")
    if [ -z "$pid" ]; then
        echo "No process found running on port $1"
        return 1
    fi
    echo "Killing process $pid running on port $1"
    kill "$pid" && echo "Process terminated successfully"
}

# Function: gitignore
# Description: Downloads .gitignore templates from gitignore.io
# Usage: gitignore python node rust
function gitignore() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: gitignore <languages...>"
        return 1
    fi
    local items=("$@")
    local url="https://www.toptal.com/developers/gitignore/api/${(j:,:)items}"
    curl -sL "$url" > .gitignore && echo ".gitignore created for: $@"
}

# Function: serve
# Description: Starts a simple HTTP server in the current directory
# Usage: serve [port]
function serve() {
    local port="${1:-8000}"
    if command -v python3 &> /dev/null; then
        python3 -m http.server "$port"
    else
        python -m SimpleHTTPServer "$port"
    fi
}

# Function: cheat
# Description: Get a cheat sheet for a command
# Usage: cheat <command>
function cheat() {
    if [ -z "$1" ]; then
        echo "Usage: cheat <command>"
        return 1
    fi
    curl -s "cheat.sh/$1"
}

# Function: up
# Description: Go up N directories
# Usage: up <number>
function up() {
    local levels=${1:-1}
    local path=""
    for ((i=1; i<=levels; i++)); do
        path="../$path"
    done
    cd "$path"
}

# Function: trash
# Description: Move files to trash instead of permanent deletion
# Usage: trash <file(s)>
function trash() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: trash <file(s)>"
        return 1
    fi
    for file in "$@"; do
        mv "$file" ~/.Trash/ && echo "Moved $file to trash"
    done
}
