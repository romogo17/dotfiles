function code --description "Open Visual Studio Code"
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $argv
end