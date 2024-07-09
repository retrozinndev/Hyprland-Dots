#!/usr/bin/bash

printf "\n";
echo "######################################";
echo "## Retrozinndev's Hyprland Dotfiles ##";
echo "######################################";
printf "\n";


echo "Welcome to my dotfiles installation script!";

# Say that dotfiles aren't ready to use yet and exit
echo "Oh oh! Looks like my Dotfiles aren't ready to use yet! Try again later... exiting.";
printf "\n";
exit 0;


echo -n "Do you want to install the dotfiles? [y/n] ";
read input;

if ($input == "y" || $input == "yes")
then
	install()
else
	exit 0
fi

function install() {
	
	printf "\n";
	echo "Making backup before installing dotfiles...";
	# Do backup steps here
	echo "Finished backup.";
	
	printf "\n";

	echo "Starting dotfiles installation...";
	echo "[info] Installing waybar theme";
	echo "[info] Installing Hyprland configs"
	echo "[info] Installing wofi stylesheet"
	echo "Ah yes! Looks like it's ready to use! If you find any issue, report at: https://github.com/retrozinndev/Hyprland-Dots/issues "
	echo "Thanks for using my dotfiles! I'm really happy for that :3"
}

printf "\n"


