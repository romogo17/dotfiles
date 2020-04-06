#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

# Exit on error
set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

setup_gitconfig () {
  if ! [ -f git/gitconfig.local.symlink ]
  then
    info 'setup gitconfig'

    git_credential_helper='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential_helper='osxkeychain'
    fi

    user ' - What is your git author name?'
    read -e git_authorname
    user ' - What is your git author email?'
    read -e git_authoremail
    user ' - What is your git signing key? https://help.github.com/en/github/authenticating-to-github/managing-commit-signature-verification'
    read -e git_signing_key

    sed -e "s/GIT_AUTHORNAME/$git_authorname/g" \
        -e "s/GIT_AUTHOREMAIL/$git_authoremail/g" \
        -e "s/GIT_SIGNING_KEY/$git_signing_key/g" \
        -e "s/GIT_CREDENTIAL_HELPER/$git_credential_helper/g" \
        git/gitconfig.local.symlink.template > git/gitconfig.local.symlink

    success 'gitconfig'
  fi
}


link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then
        skip=true;
      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_dependencies () {
  # If we're on a Mac, let's install and setup homebrew.
  if [ "$(uname -s)" == "Darwin" ]
  then
    info "installing dependencies"

    # Set macOS defaults
    info " - setting up macOS defaults"
    $DOTFILES_ROOT/macos/set-defaults.sh

    # Install software
    info " - running additional install scripts"
    for installer in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' -not -path '*.git*')
    do
      info "    - found installer script $installer"
      sh -c "${installer}"
    done

  fi
}

setup_gitconfig
install_dotfiles
install_dependencies

echo ''
success 'all installed !'