#!/usr/bin/env bash

# This script contains useful functions to be used 
# in other scripts from retrozindev's dotfiles.
# ----------
# Made by retrozinndev (João Dias)
# Licensed under the MIT License
# From: https://github.com/retrozinndev/.config


# -------------
# Array containing directory names to be used by 
# retrozinndev/.config install and update
# scripts.
# -------------
config_dirs=(
    "hypr" 
    "kitty" 
    "colorshell" 
    "fastfetch"
    "nvim"
    "zsh"
)
ignored_config_dirs=(
    "hypr/hyprpaper.conf"
)

# -------------
# Sends stdout log with type and message provided 
# in parameters.
# param $1 (optional) log type (err[or], warn[ing]), if not any of list, print as info
# param $2 log message
# -------------
function Send_log() {
    log_message=$2

    case ${1,,} in
        warn | warning)
            color="\e[33m"
            log_type="warning"
            ;;

        err | error)
            color="\e[31m"
            log_type="error"
            is_error=true
            ;;

        *) 
            color="\e[34m"
            log_type="info"
            ;;
    esac

    if [[ -z $2 ]]; then
        log_message=$1
    fi

    [[ -z $is_error ]] && \
        echo -e "${color}[$log_type]\e[0m $log_message" \
    || echo -e "${color}[$log_type]\e[0m $log_message" > /dev/stderr
}

# -------------
# Prints retrozinndev/.config installation 
# script's welcome header on stdout
# -------------
function Print_header() {
    printf "\n"
    echo "#########################"
    echo "## retrozinndev's dots ##"
    echo "#########################"
    printf "\n"
}

# -------------
# Backup configuration dirs listed in utils.sh script
# to $bkp_dir (default: ~/dots.bkp)
# -------------
function Backup_config() {
    local XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
    local bkp_dir="$HOME/dots.bkp"

    Send_log "Creating backup in $bkp_dir"

    if [[ -d $bkp_dir ]]; then
        Send_log "Found existing backup in $bkp_dir!"
        Send_log warn "Looks like a backup already exists!"
        echo -n "Would you like to move it to trash/override it? [y/n] "
        read answer
        
        if [[ $answer =~ "y" ]]; then
            echo "Fine! Previous backup is goning to be moved to trash"
            trash-put $bkp_dir 2>&1 > /dev/null || (Send_log "Couldn't find trash-cli, falling back to the og 'rm'" ; rm -r $bkp_dir)
            return Backup_config $@
        else 
            echo "Ok! Quitting doing backup because it already exists"
            return 1
        fi
    fi

    # Make backup of existing configurations
    for dir in ${config_dirs[@]}; do
        if [[ -d "$XDG_CONFIG_HOME/$dir" ]]
        then
            echo "-> backing up $dir"
            cp -r "$XDG_CONFIG_HOME/$dir" $bkp_dir
        else
            Send_log "$dir backup skipped, not found."
        fi
    done

    Send_log "Backup done!"
}
