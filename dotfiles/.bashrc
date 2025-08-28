# This file is managed via symlink with GNU Stow

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Helper functions

# Connect to WPE with specific key
# ssh-shoreline-wpe install-name ~/.ssh/keyfile
ssh-shoreline-wpe() {
  local install=$1

  if [[ -n $2 ]]; then
    identity_file=$2
  else
    identity_file="~/.ssh/shoreline"
  fi

  ssh -i $identity_file "$install@$install.ssh.wpengine.net"
}

# Aliases
alias vi='nvim'

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"
