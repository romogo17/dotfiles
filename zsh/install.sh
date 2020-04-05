#!/bin/sh
#
# ZSH
#
# This installs some of the common dependencies needed for ZSH

# Check for ZSH and install if we don't have it
if test ! $(which zsh); then

  echo "Installing Oh My Zsh for you"
  sh -c "KEEP_ZSHRC=yes; $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi

exit 0


