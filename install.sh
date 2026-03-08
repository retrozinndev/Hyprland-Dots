#!/usr/bin/env bash

source ./utils.sh

trap "printf \"\nOk, quitting beacuse you entered an exit signal. (SIGINT)\n\"; exit 1" SIGINT
trap "printf \"\nOh noo!! Some application just killed the script!\"; exit 2" SIGTERM

XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/.cache"}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

function Backup_previous() {
    Ask "Would you like to make a backup of the current configuration?"
    if [[ $answer =~ ^y.*$ ]]; then
        sh ./backup-dots.sh
    else
        Send_log "backup skipped"
    fi
}

#########
# Start #
#########

Print_header
echo -e "https://github.com/retrozinndev/Hyprland-Dots\n"
sleep .5

echo "Welcome to retrozinndev's dotfiles installation script!"



# Warn user of possible problems that can happen
echo "!!!WARNING!!! By running this script, you assume total responsability for any issues that may occur with your filesystem"
Send_log warn "It is recommended to backup your configuration files if you want to keep them."

echo -n "Do you want to start the dotfiles installation? [y/n] "
read input

if ! [[ $input =~ ^y(es)?$ ]]; then
    printf "Ok, doing as you said! Bye bye!\n"
    exit 0
fi

Send_log "Starting colorshell installation..."
bash <(curl -s https://raw.githubusercontent.com/retrozinndev/colorshell/refs/heads/ryo/install.sh) -y



for dir in ${config_dirs[@]}; do
    local dest="$XDG_CONFIG_HOME/$dir"

    Send_log "-> Installing $dir in $dest"

    if [ -d "./$dir" ]; then
        mkdir -p "$dest"

        cp -rf ./$dir/* $dest
        continue
    fi

    if [[ -f "./$dir" ]]; then
        mkdir -p `dirname $dest`

        cp -rf ./$dir "$dest" # copy dir/file
        continue
    fi

    Send_log warn "Config \`$dir\` was skipped: not found or inaccessible"
done

echo "Ah yes! Looks like it finished, yipee :D"
echo -e "If you find any issue, please report it: https://github.com/retrozinndev/Hyprland-Dots/issues"
    echo "Thanks for using colorshell + my dotfiles! I really appreciate it ദ്ദി ᗜˬᗜ✧\n"
