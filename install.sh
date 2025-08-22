#!/usr/bin/env bash

source ./utils.sh

trap "printf \"\nOk, quitting beacuse you entered an exit signal. (SIGINT)\n\"; exit 1" SIGINT
trap "printf \"\nOh noo!! Some application just killed the script!\"; exit 2" SIGTERM

XDG_CONFIG_HOME=`[[ -z "$XDG_CONFIG_HOME" ]] && echo "$HOME/.config" || echo "$XDG_CONFIG_HOME"`

function Backup_previous() {
    echo "Would you like to make a backup of the current configuration? [y/n] "
    read answer
    if [[ $answer =~ ^y.*$ ]]; then
        sh ./backup-dots.sh
    else
        Send_log "Skipping backup"
    fi
}

#########
# Start #
#########

Print_header
echo -e "https://github.com/retrozinndev/Hyprland-Dots\n"
sleep .5

echo "Welcome to my dotfiles installation script!"

# Warn user of possible problems that can happen
echo "!!!WARNING!!! By running this script, you assume total responsability for any issues that may occur with your filesystem"

echo -n "Do you want to start the dotfiles installation? [y/n] "
read input

if [[ $input =~ ^y.*$ ]]; then
    Backup_previous
    Send_log "Starting installation...\n"

    [[ -d ./colorshell ]] && \
        git clone https://github.com/retrozinndev/colorshell.git ./colorshell \
    || Send_log "previous colorshell clone found"

    cd ./colorshell && git fetch && git pull \
        || (Send_log err "couldn't fetch remote. try deleting the colorshell directory" && exit 1)

    sh install.sh dots && cd ..

    for dir in ${config_dirs[@]}; do
        dest=$XDG_CONFIG_HOME/$dir

        echo "-> Installing $dir in $dest"
        mkdir -p "$dest" # create parents

        if [[ -f "./$dir" ]]; then
            rm -r "$dest" # delete unused directory
            cp -f ./$dir "$dest" # copy actual file
        else
            cp -rf ./$dir/* "$dest" # force-copy content
        fi
    done

    Send_log "cleaning..."
    rm -r ./colorshell

    echo "Ah yes! Looks like it finished, yay :3"
    echo -e "If you find any issue, please report it in: https://github.com/retrozinndev/Hyprland-Dots/issues"
	echo "Thanks for using my dots and colorshell! I really appreciate that :D"

    printf "\n"
else
    printf "Ok, doing as you said! Bye bye!\n"
	exit 0
fi
