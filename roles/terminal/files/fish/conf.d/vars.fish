set -gx XDG_CONFIG_DIR $HOME/.config
set -gx EDITOR code
set -gx HOMEBREW_EDITOR code
set -gx KUBE_EDITOR nvim
set -gx DOCKER_DEFAULT_PLATFORM linux/amd64
set -gx DOTFILES $HOME/.dotfiles
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx SSH_KEY_PATH $HOME/.ssh/rsa_id
set -gx GPG_TTY $(tty)
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -gx FZF_CTRL_R_OPTS --reverse
