#!/usr/bin/env bash

source ./utils.sh

trap "printf \"\nOk, quitting beacuse you entered an exit signal. (SIGINT)\n\"; exit 1" SIGINT
trap "printf \"\nOh noo!! Some application just killed the script!\"; exit 2" SIGTERM

XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/.cache"}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
is_full=true

function Backup_previous() {
    echo -n "Would you like to make a backup of the current configuration? [y/n] "
    read answer
    if [[ $answer =~ ^y ]]; then
        Backup_config
    else
        Send_log "Backup skipped"
    fi
    unset answer
}

#########
# Start #
#########

Print_header
echo -e "https://github.com/retrozinndev/.config\n"
sleep .5

echo "Welcome to my dotfiles installation script!"



# Warn user of possible problems that can happen
echo "!!!WARNING!!! By running this, you're assuming total responsability for any issues that may occur with your system."
Send_log warn "It is recommended to backup your configuration files if don't want them wiped!"

echo -n "Continue installation? [y/n] "
read input

if ! [[ $input =~ ^y ]]; then
    printf "Ok, doing as you said! Bye bye!\n"
    exit 0
fi
unset input

Backup_previous

Send_log "You may also want to install colorshell:"
Send_log "https://github.com/retrozinndev/colorshell/wiki/installation"

echo -e "\nThis repo provides the following configurations:"
echo -n "  "
for dir in ${config_dirs[@]}; do
    echo -n "$dir "
done
echo -en "\n"

echo -n "Install all of them? (if not, you'll be prompted for each of the configs) [y/n] "
read answer
[[ ! "$answer" =~ ^y ]] && unset is_full
unset answer

Send_log "Starting installation..."
for dir in ${config_dirs[@]}; do
    dest="$XDG_CONFIG_HOME/$dir"

    if ! [[ "$is_full" == true ]]; then
        echo -n "Install $dir? [y/n] "
        read answer
        if ! [[ "$answer" =~ ^y ]]; then
            Send_log "\"$dir\" skipped!"
            continue
        fi
        unset answer
    fi

    echo "-> Installing $dir in $dest"

    # separate cuz hyprland creates the user config dir again upon deletion
    if [ -d "./$dir" ]; then
        rm -rf $dest
        mkdir -p $dest
        cp -rf ./$dir/* $dest
        continue
    fi

    if [ -f "./$dir" ]; then
        [ -d "$dest" ] && rm -rf $dest

        cp -f ./$dir $dest
        continue
    fi

    Send_log warn "\`$dir\` was skipped: unreachable"
done

echo "Hey, looks like it's finished! Yipee :3"
echo -e "If you find any issue, please report it: https://github.com/retrozinndev/.config/issues"
echo -e "Also, if you installed the zsh config, you might want to source it in your \`.zshrc\`:"
echo -e "source \$XDG_CONFIG_HOME/zsh/rc"
echo -e "\nThanks for using my dotfiles! I really appreciate it ദ്ദി ᗜˬᗜ✧"
echo "Have a great day!"
