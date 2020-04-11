#!/usr/bin/env bash

set -ex

# Host operating system
HOST_OS=$(uname -s)
# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOTDIR/hosts"
# Main playbook
PLAYBOOK="$ROOTDIR/dotfiles.yml"

if [ "$HOST_OS" == "Darwin" ]; then
  # Check for Homebrew and install if we don't have it
  if test ! $(which brew); then
    echo "Installing Homebrew for you."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  # Update Homebrew recipes
  brew update

  # Check for Ansible and install if we don't have it
  if test ! $(which ansible); then
    echo "Installing Ansible for you."
    brew install ansible
  fi
fi

ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

exit 0