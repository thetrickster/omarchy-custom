#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

# Get current directory
DIR=$(pwd)

# Splash screen
source "$DIR/bash/splash.sh"

# Bash Functions
source "$DIR/bash/functions.sh"

# Install Applications
source "$DIR/bash/install-packages.sh"

# Install VS Code dev extensions
source "$DIR/bash/install-vscode-extensions.sh"

# Sync and backup config dotfiles
source "$DIR/bash/sync-and-backup-dotfiles.sh"

# Restart hyprland
if prompt_yn "Restart Hyprland?" 5 "y"; then
    echo "Restarting Hyprland"
    sleep 5
    uwsm stop
fi
