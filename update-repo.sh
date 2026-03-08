#!/usr/bin/bash


function Check_current_dir() {
    if ! [[ -f ./utils.sh ]]; then
        Send_log warn "Looks like you're not in the repository directory!\nPlease run this script from the repo directory to avoid problems."
        Send_log "Exiting"
        sleep .5
        exit 1
    fi
}

function Clean_local() {
    Send_log "Cleaning current repo dotfiles..."
    for dir in ${config_dirs[@]}; do
        if [[ -d "./$dir" ]]; then
            rm -rf ./$dir
        fi
    done

    Send_log "Done cleaning."
}

# ---------------
# Checks if $1 is in the ignored files list.
# Returns code 0 if item is in the ignore list, 0 if not
# ---------------
function Check_ignore() {
    for ignore in ${ignored_config_dirs[@]}; do
        [ "$1" == "$ignore" ] && \
            return 0
    done

    return 1
}

function Update_local() {
    XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

    for item in ${config_dirs[@]}; do
        local list=`find "$XDG_CONFIG_HOME/$item" -type f || echo -n`

        if [ -z "$list" ]; then
            Send_log warn "\"$item\" is in fault! We're skipping this one..."
            continue
        fi

        Send_log "Copying item(s) from $item ($XDG_CONFIG_HOME/$item)"
        for file in $list; do
            local dir=`dirname "$file"`
            local base_path=${file#"$XDG_CONFIG_HOME/"} # trims the "~/.config/" part, leaving the relative directory to the repo structure
            local base_dir=`dirname "./$base_path"` # same thing here, but we get the base directory instead of the file name
            
            echo "dir: '$dir' ; base_name: './$base_path' ; base_dir: '$base_dir'"

            # this only works with depth 1 for raw directories or with a full file path, unfortunately
            (Check_ignore "$base_dir" || Check_ignore "$base_path") && \
                continue

            # mkdir if not present
            [ ! -d "$base_dir" ] && \
                mkdir -p "$base_dir"

            #echo "-> \"$file\" : \".$base_path\"" # debuggin'
            cp -f "$file" "./$base_path"
        done
    done
}

Check_current_dir

source ./utils.sh

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
