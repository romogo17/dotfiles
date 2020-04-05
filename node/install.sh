#!/bin/sh
#
# Node
#
# This installs some of the common dependencies needed for Node

# Check for NVM and install if we don't have it
NVM_DIR="$HOME/.nvm"

if [ ! -d "$HOME/.nvm" ]; then

  echo "Installing NVM for you."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install lts/* --latest-npm

exit 0


