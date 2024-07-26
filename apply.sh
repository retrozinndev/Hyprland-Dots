#!/usr/bin/bash

printf "\n";
echo "######################################";
echo "## Retrozinndev's Hyprland Dotfiles ##";
echo "######################################";
printf "\n";


echo "Welcome to my dotfiles installation script!"

# Say that dotfiles aren't ready to use yet and exit
echo "Oh oh! Looks like my Dotfiles aren't ready to use yet! Try again later... exiting."
printf "\n"
exit 0

function backup_previous_dotfiles {
    echo "Making backup before installing dotfiles..."
	# Do backup steps here
	echo "Finished backup."
}

function apply_dotfiles {
	
	printf "\n"
    backup_previous_dotfiles
	printf "\n"

	printf "Starting dotfiles installation...\n"

	echo "[info] Installing Hyprland configs"
	echo "[info] Installing wofi stylesheet"
	echo "Ah yes! Looks like it's ready to use! If you find any issue, report at: https://github.com/retrozinndev/Hyprland-Dots/issues "
	echo "Thanks for using my dotfiles! I'm really happy with that :3"
}

echo -n "Do you want to install the dotfiles? [y/n] "
read input

if [[ $input = "y" ]] || [[ $input = "yes" ]]
then
	apply_dotfiles
else
    printf "Ok, doing as you said! Bye bye!\n"
	exit 0
fi

printf "\n"


