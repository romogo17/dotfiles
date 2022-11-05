fish_add_path $HOME/.local/bin

# Go
set -gx GOROOT $(brew --prefix)/opt/go/libexec
set -gx GOPATH $HOME/go

fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# Rust
fish_add_path $HOME/.cargo/bin

