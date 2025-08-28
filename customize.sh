#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

# Get current directory
current_dir=$(pwd)

# Set backup dir
backup_dir="$current_dir/.dotfiles-backup"

install_applications() {
    sudo pacman -S --noconfirm --needed \
        visual-studio-code-bin \
        rsync
}

install_vscode_extensions() {
    echo "Installing VS Code extensions for PHP Web Development"
    code_extensions=(\
        "bmewburn.vscode-intelephense-client" \
        "editorconfig.editorconfig" \
        "mjmlio.vscode-mjml" \
        "wordpresstoolbox.wordpress-toolbox" \
    )

    for extension in "${code_extensions[@]}"; do
        code --install-extension "$extension" --force
    done
}

# Show Shoreline logo
ansi_art='
\e[90m███████ \e[92m██   ██ \e[35m ██████  \e[91m██████  \e[34m███████ \e[95m██      \e[94m██ \e[90m███    ██ \e[94m███████\e[0m 
\e[90m██      \e[92m██   ██ \e[35m██    ██ \e[91m██   ██ \e[34m██      \e[95m██      \e[94m██ \e[90m████   ██ \e[94m██      \e[0m
\e[90m███████ \e[92m███████ \e[35m██    ██ \e[91m██████  \e[34m█████   \e[95m██      \e[94m██ \e[90m██ ██  ██ \e[94m█████ \e[0m
\e[90m     ██ \e[92m██   ██ \e[35m██    ██ \e[91m██   ██ \e[34m██      \e[95m██      \e[94m██ \e[90m██  ██ ██ \e[94m██    \e[0m
\e[90m███████ \e[92m██   ██ \e[35m ██████  \e[91m██   ██ \e[34m███████ \e[95m███████ \e[94m██ \e[90m██   ████ \e[94m███████\e[0m 
'

clear
echo -e "\n$ansi_art\n"

# Install Applications
install_applications

# Install VS Code dev extensions
install_vscode_extensions

# TODO: Setup additional hotkeys by appending to config in `~/.config/hypr/bindings.conf`

# Make backup folder if none exists
mkdir -p $backup_dir

# Sync dotfiles to $HOME directory via rsync and backup
echo "Syncing dotfiles to $HOME and backing up to $backup_dir"

rsync -avz --backup --backup-dir="$backup_dir/" "$current_dir/dotfiles/" "$HOME/"

# Restart hyprland
echo "Restarting Hyprland"
sleep 5
uwsm stop
