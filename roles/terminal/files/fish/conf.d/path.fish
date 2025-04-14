# Local & Homebrew binaries
fish_add_path --move ~/.local/bin $(brew --prefix)/bin /usr/local/bin

# Go
set -gx GOROOT $(brew --prefix)/opt/go/libexec
set -gx GOPATH $HOME/go

fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# Kubectl Krew
fish_add_path $HOME/.krew/bin

# Java
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
fish_add_path $JAVA_HOME/bin

# Rust
fish_add_path $HOME/.cargo/bin

# Docker
fish_add_path $HOME/.docker/bin

# Node.js
fish_add_path $(brew --prefix)/opt/node*/bin/

# Visual Studio Code
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"