#!/usr/bin/bash

set -e
trap "printf \"\nOk! Quitting beacuse you entered an exit signal.\n\"; exit 1" SIGINT

printf "\n"
echo "######################################"
echo "## Retrozinndev's Hyprland Dotfiles ##"
echo "######################################"
printf "\n"

CONFIG_DIR="$HOME/.config"
DOTFILES_DIRS=("hypr" "waybar" "swaync" "wlogout" "wofi")
DOTFILES_BACKUP_DIR="$HOME/hyprland-dotfiles-bkp"
TRASH_DIR="$HOME/.local/share/Trash/files"

echo "Welcome to my dotfiles installation script!"

# Warn user of possible problems that can happen
echo "WARN! Running this script may cause problems with your system. When continuing, you're confirming that any problem that may happen with your system is of **your** responsability."

function Backup_previous_dotfiles {

    echo "Making backup before installing dotfiles..."
    echo "[info] Creating backup dir in $DOTFILES_BACKUP_DIR"
    
    if [[ -d $DOTFILES_BACKUP_DIR ]]
    then
        echo "Looks like the backup directory already exists!"
        echo -n "Would you like to override it with the current configuration? (Will be moved to Trash dir) [y/n] "
        read override_backup
        printf "\n"
        
        if [[ $override_backup = "y" ]] || [[ $override_backup = "yes" ]]
        then
            echo "Ok! The backup folder will be ovewritten with the current user configuration."
            mv -f $DOTFILES_BACKUP_DIR $TRASH_DIR
        fi
    else
        mkdir $DOTFILES_BACKUP_DIR
    fi
    
    # Make backup of existing configurations
    for dir in ${DOTFILES_DIRS[@]}; do
        if [[ -d "$CONFIG_DIR/$dir" ]]
        then
            echo "-> Making backup of $dir"
            cp -r "$CONFIG_DIR/$dir" $DOTFILES_BACKUP_DIR
        else
            echo "[info] Skipping backup of $dir. It does not exist."
        fi
    done

	echo "Finished backup."
}

function Apply_wallpaper {

    echo -n "Would you also like to apply the Nijika Ijichi wallpaper? [y/n] "
    read input_wallpaper
    printf "\n"

    if [[ $input_wallpaper = "y" ]] || [[ $input_wallpaper = "yes" ]]
    then
        echo "Thanks for using the wallpaper! Oh, remember that I am not the author!"
        echo "Wallpaper source: https://www.wallpaperflare.com/"

        echo "-> Copying Hyprpaper config to ~/.config/hypr"
        cp -f ./hyprpaper/* $CONFIG_DIR/hypr
        echo "-> Copying wallpapers to ~/wallpapers"
        mkdir -p $HOME/wallpapers
        cp ./wallpapers/* $HOME/wallpapers
    else
        echo "Ok! The wallpaper is yours to choose!"
    fi
}

function Apply_dotfiles {
	
	printf "\n"
    Backup_previous_dotfiles
	printf "\n"

	printf "Starting dotfiles installation...\n"

	echo "-> Installing Hypr family"
    # Hypr family(hyprland, hypridle, etc.) steps
    mkdir -p $CONFIG_DIR/hypr
    cp -f ./hyprland/* $CONFIG_DIR/hypr
    cp -f ./hyprlock/* $CONFIG_DIR/hypr
    cp -f ./hypridle/* $CONFIG_DIR/hypr

    echo "-> Installing scripts in ~/.config/hypr/scripts"
    cp -r ./hyprland/scripts $CONFIG_DIR/hypr

	echo "-> Installing Wofi"
    mkdir -p $CONFIG_DIR/wofi
    cp -f ./wofi/* $CONFIG_DIR/wofi

    echo "-> Installing Sway Notification Center"
    mkdir -p $CONFIG_DIR/swaync
    cp -f ./swaync/* $CONFIG_DIR/swaync

    echo "-> Installing Waybar"
    mkdir -p $CONFIG_DIR/waybar
    cp -f ./waybar/* $CONFIG_DIR/waybar
    
    echo "-> Installing Wlogout Menu"
    mkdir -p $CONFIG_DIR/wlogout
    cp -f ./wlogout/* $CONFIG_DIR/wlogout

    # Ask if user wants to apply repo's default wallpaper
    Apply_wallpaper

    echo "Ah yes! Looks like it's ready to use, yay!"
    echo "If you find any issue, please report at: https://github.com/retrozinndev/Hyprland-Dots/issues"
	echo "Thanks for using my dotfiles! I'm really happy with that :3"
    printf "\n"
}

echo -n "Do you want to install the dotfiles? [y/n] "
read input
printf "\n"

if [[ $input = "y" ]] || [[ $input = "yes" ]]
then
	Apply_dotfiles
else
    printf "Ok, doing as you said! Bye bye!\n"
	exit 0
fi

printf "\n"


