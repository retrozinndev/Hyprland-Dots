#!/usr/bin/env bash

source ./utils.sh

trap "printf \"\nOk, quitting beacuse you entered an exit signal. (SIGINT)\n\"; exit 1" SIGINT
trap "printf \"\nOh noo!! Some application just killed the script!\"; exit 2" SIGTERM

XDG_CONFIG_HOME=`[[ -z "$XDG_CONFIG_HOME" ]] && echo "$HOME/.config" || echo "$XDG_CONFIG_HOME"`

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

echo -n "Do you want to start the dotfiles installation? [y/n] "
read input

if ! [[ $input =~ ^y(es)?$ ]]; then
    printf "Ok, doing as you said! Bye bye!\n"
    exit 0
fi

bash <(curl -s https://raw.githubusercontent.com/retrozinndev/colorshell/refs/heads/ryo/install.sh) -y

source ${XDG_CACHE_HOME:-"$HOME/.cache"}/colorshell-installer/utils.sh


for dir in ${config_dirs[@]}; do
    dest=$XDG_CONFIG_HOME/$dir

    Send_log info "-> Installing $dir in $dest"
    mkdir -p `dirname $dest` # create parents

    if [[ -f "./$dir" ]]; then
        cp -rf ./$dir "$dest" # copy dir/file
        continue
    fi

    if [[ -d "./$dir" ]]; then
        cp -rf ./$dir/* $dest
        continue
    fi

    Send_log warn "config \`$dir\` was skipped: not found / not accessible"
done

echo "Ah yes! Looks like it finished, yipee :D"
echo -e "If you find any issue, please report it: https://github.com/retrozinndev/Hyprland-Dots/issues"
    echo "Thanks for using colorshell + my dotfiles! I really appreciate it :P\n"
