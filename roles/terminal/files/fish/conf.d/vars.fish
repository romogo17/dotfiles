set -gx EDITOR code
set -gx HOMEBREW_EDITOR code
set -gx DOTFILES $HOME/.dotfiles
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx SSH_KEY_PATH $HOME/.ssh/rsa_id
set -gx GPG_TTY $(tty)
set -U FZF_CTRL_R_OPTS "--reverse"