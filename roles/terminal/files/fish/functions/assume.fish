function assume --description 'Allows assume to export AWS environment variables into the shell that called it (https://docs.commonfate.io/granted/internals/shell-alias)'
  source /opt/homebrew/bin/assume.fish $argv;
end