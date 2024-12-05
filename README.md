# My Dotfiles Managed by Chezmoi

Welcome to my personal dotfiles repository, managed using [chezmoi](https://www.chezmoi.io). This repository contains my
configuration files for various applications and tools, allowing for a consistent and efficient environment across
multiple machines.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)

## Features

- **Zsh Configuration**: Custom Zsh setup with plugins and themes.
- **Managed with Chezmoi**: Easily manage and deploy dotfiles across different systems.
- **Zsh Plugins**:
      - `zsh-autosuggestions`
      - `zsh-syntax-highlighting`
      - `zsh-completions`
      - `zsh-history-substring-search`
- **Theme**:
      - `powerlevel10k`
- **Custom Functions and Aliases**: Includes useful functions like `update_zsh_plugins`, `mkcd`, `extract`, `weather`,
    `path`, and `please`.
- **Git Configuration**: Personalized Git settings.
- **Vim/Neovim Configuration**: Custom settings and plugins for Vim/Neovim.
- **Tmux Configuration**: Personalized Tmux setup.
- **SSH Configurations**: Secure and convenient SSH configurations.

## Installation

### Prerequisites

- **Chezmoi**: Install chezmoi by following the [official installation guide](https://www.chezmoi.io/install/).
- **Git**: Ensure Git is installed on your system.

### Steps

1. **Clone the Repository with Chezmoi**:

    ```bash
    chezmoi init --apply https://github.com/neowim/dotfiles.git
    ```

## Usage

- **Update Dotfiles**:

    ```bash
    chezmoi update

- **Edit Dotfiles**:

    ```bash
    chezmoi edit <file>

- **Add New Files**:

    ```bash
    chezmoi add <file>

- **Remove Files**:

    ```bash
    chezmoi forget <file>

- **View Changes**:

     ```bash
     chezmoi diff

- **View Help**:

     ```bash
     chezmoi help🔄
