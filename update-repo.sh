#!/usr/bin/bash

HYPRLAND_DOTS_DIRS=("hypr" "swaync" "waybar" "anyrun" "wlogout")

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
for dir in ${HYPRLAND_DOTS_DIRS[@]}; do
    if [ -d "./dir" ]; then
        rm -rf ./dir
    fi
done

echo "Done cleaning."

for dotsDir in ${HYPRLAND_DOTS_DIRS[@]}; do
    if [ -d "$HOME/.config/$dotsDir" ]; then 
        cp -r $HOME/.config/$dotsDir ./$dotsDir
    else
        echo "[error] Looks like the ~/.config/$dotsDir dir is in fault! Skipped"
    fi
done

printf "\nDone! You may now push this to the dotfiles repo!\n"

if [ -f /bin/git ]
then
    git status
fi

exit 0
