#!/usr/bin/bash

printf "\n"

echo "Running this script will override data in current repo with user configurations."
echo "This script is intended to be used by repository owner(retrozinndev)"

printf "\n"

echo " WARN! Please run this script in it's current directory to avoid problems"
echo "Tip: Press Ctrl + C to stop script"

printf "\n"

if [ ! -f ./update-repo.sh ]
then
    echo "[ERROR] Looks like you're not in the repo directory, please run this script from the dotfiles repository directory."
    printf "Finishing with errors...\n"
    exit 1
fi

echo "Starting in 3... "
sleep 1s
echo "2..."
sleep 1s
echo "1..."
sleep 1s

printf "\n"


echo "[info] Cleaning current repo dotfiles..."
# Modify dirs here when adding something new:
rm -rf ./wofi/ ./waybar/ ./swaync/ ./wlogout ./hyprland/ ./hyprlock ./hypridle ./hyprpaper

echo "Done cleaning."

echo "[info] Copying Hyprland dotfiles... (hyprland, hypridle, hyprlock, hyprpaper)"
cp -r $HOME/.config/hypr ./


echo "[info] Organizing:"
echo "-> Hypridle"
mkdir -p ./hypridle
mv ./hypr/hypridle.conf ./hypridle/

echo "-> Hyprlock"
mkdir -p ./hyprlock
mv ./hypr/hyprlock.conf ./hyprlock/

echo "-> Hyprpaper"
mkdir ./hyprpaper
mv ./hypr/hyprpaper.conf ./hyprpaper/

echo "-> Hyprland: renaming directory"
mv ./hypr ./hyprland

echo "[info] Copying Waybar..."
cp -r $HOME/.config/waybar .

echo "[info] Copying Wofi..."
cp -r $HOME/.config/wofi .

echo "[info] Copying Swaync..."
cp -r $HOME/.config/swaync .

echo "[info] Copying Wlogout..."
cp -r $HOMR/.config/wlogout .

printf "\nDone! You may now push this to the dotfiles repo!\n"

if [ -f /bin/git ]
then
    git status
fi

exit 0
