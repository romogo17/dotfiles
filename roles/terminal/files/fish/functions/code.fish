function code --description "Calls Visual Studio Code"
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $argv
end