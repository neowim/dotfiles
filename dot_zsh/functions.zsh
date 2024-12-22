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

# Function: create virtual environment using direnv
mkenv() {
    # Ensure we are in a project directory
    if [ ! -d "$PWD" ]; then
        echo "Error: Current directory is invalid. Navigate to a valid project folder."
        return 1
    fi

    # Ensure a venv exists or create one
    if [ ! -d "venv" ]; then
        echo "Creating virtual environment in venv..."
        python -m venv venv || return 1
    fi

    # Create .envrc with the required configuration
    echo "Creating .envrc for direnv..."
    echo -e "export VIRTUAL_ENV=venv\nlayout python3" > .envrc

    # Allow direnv to manage this directory
    echo "Allowing direnv..."
    direnv allow

    # Final output
    echo "✅ .envrc has been created and configured!"
    echo "Environment will automatically activate when you 'cd' into this folder."
}


# Python project initializer function with optional Python version
new_python_project() {
    if [ -z "$1" ]; then
        echo "Usage: new_python_project <project_name> [python_version]"
        return 1
    fi

    PROJECT_NAME=$1
    PYTHON_VERSION=${2:-$(pyenv version-name)}  # Use the provided version or the current global pyenv version

    # Check dependencies
    for cmd in pyenv direnv git; do
        if ! command -v $cmd &> /dev/null; then
            echo "Error: $cmd is not installed. Please install it first."
            return 1
        fi
    done

    # Step 1: Create project directory
    echo "Creating project directory: $PROJECT_NAME"
    mkdir -p "$PROJECT_NAME" && cd "$PROJECT_NAME" || return 1

    # Step 2: Set local Python version
    echo "Setting local Python version to $PYTHON_VERSION"
    if ! pyenv install -s "$PYTHON_VERSION"; then
        echo "Failed to install Python version $PYTHON_VERSION"
        return 1
    fi
    pyenv local "$PYTHON_VERSION"

    # Step 3: Create a .venv virtual environment
    echo "Creating virtual environment in venv..."
    python -m venv venv || return 1

    # Step 4: Configure direnv to use the venv environment
    echo "Configuring direnv..."
    echo -e "export VIRTUAL_ENV=venv\nlayout python3" > .envrc
    direnv allow

    # Step 5: Install basic tools using direnv activation
    echo "Installing essential tools: pip, setuptools, wheel..."
    direnv reload  # Ensures the environment is activated for subsequent steps
    pip install --upgrade pip setuptools wheel || return 1

    # Step 6: Initialize an empty requirements.txt
    echo "Creating an empty requirements.txt"
    touch requirements.txt

    # Step 7: Add a .gitignore
    echo "Adding .gitignore"
    echo -e "__pycache__/\nvenv/\n.direnv/\n*.pyc\n.DS_Store" > .gitignore

    # Step 8: Initialize Git repository
    echo "Initializing Git repository..."
    git init
    git add .python-version .envrc requirements.txt .gitignore
    git commit -m "Initial project setup"

    # Final output
    echo "✅ Project '$PROJECT_NAME' has been initialized!"
    echo "Next steps:"
    echo "  1. Activate the environment by navigating to the project folder: cd $PROJECT_NAME"
    echo "  2. Install packages: pip install <your-packages>"
    echo "  3. Freeze dependencies: pip freeze > requirements.txt"
}
