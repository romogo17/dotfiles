# Get the Homebrew-managed zsh site-functions on your FPATH
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi