#!/usr/bin/bash

source ./utils.sh

Check_current_dir() {
    if ! [[ -f ./utils.sh ]]; then
        Send_log warn "Looks like you're not in the repository directory!\nPlease run this script from the repo directory to avoid problems."
        Send_log "Exiting"
        sleep .5
        exit 1
    fi
}

Clean_local() {
    Send_log "info" "Cleaning current repo dotfiles..."
    for dir in ${config_dirs[@]}; do
        if [[ -d "./$dir" ]]; then
            rm -rf ./$dir
        fi
    done

    echo "Done cleaning."
}

Update_local() {
    for dir in ${config_dirs[@]}; do
        if [[ -d "$XDG_CONFIG_HOME/$dir" ]] || [[ -f "$XDG_CONFIG_HOME/$dir" ]]; then 
            Send_log "Copying ${dir^}"
            cp -r $XDG_CONFIG_HOME/$dir ./$dir
        else
            Send_log "warn" "Looks like the ${dir^} dir is in fault! Skipping..."
        fi
    done
}

Check_current_dir
Print_header

printf "\n"
echo "!!WARNING!! Running this script may override all data in current repo with host configurations."
echo "This script is intended to be used only by the dotfiles owner"
printf "\n"

echo "Please run this script in it's current directory to avoid issues"
echo "Tip: Press Ctrl + C to stop script at any time"

printf "\n"

echo -n "Do you want to update local repository with host configurations? [y/n] "
read answer
if ! [[ $answer =~ y ]]; then
    Send_log "Exiting"
    exit 1
fi

printf "\n"

Clean_local
Update_local

echo "Ok, work's finished here! Have a great day!"

if command -v git > /dev/null 2>&1; then
    git status
fi

exit 0
