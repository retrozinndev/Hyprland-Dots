#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers"
HYPRPAPER_FILE="$HOME/.config/hypr/hyprpaper.conf"

WALLPAPER_DMENU="anyrun --plugins libstdin.so"

if [[ -z $(ls -A $WALLPAPER_DIR) ]]
then
    exit 1
fi

# Prompt wallpaper list via dmenu
SET_WALLPAPER_NAME="$(ls $WALLPAPER_DIR | $WALLPAPER_DMENU )"
SET_WALLPAPER_FULL="$WALLPAPER_DIR/$SET_WALLPAPER_NAME"

echo $SET_WALLPAPER_NAME

# Check if input wallpaper is empty
if [[ $SET_WALLPAPER_NAME == "" ]] || [[ $SET_WALLPAPER_NAME == " " ]]
then
    echo "No wallpaper has been selected by user!"
    if [ $RANDOM_WALLPAPER_WHEN_EMPTY = true ]
    then
        SET_WALLPAPER_NAME=$(ls $WALLPAPER_DIR | shuf -n 1)
        echo "Selected random wallpaper from $HOME/wallpapers: $SET_WALLPAPER_NAME"
        SET_WALLPAPER_FULL="$WALLPAPER_DIR/$SET_WALLPAPER_NAME"

    else
        echo "Skipping hyprpaper changes and exiting."
        exit 1
    fi
fi

echo "Writing change to hyprpaper"

echo "" > $HYPRPAPER_FILE # Cleans hyprpaper file

echo "\$wallpaper = $SET_WALLPAPER_FULL" >> $HYPRPAPER_FILE
echo "" >> $HYPRPAPER_FILE
echo "splash = true" >> $HYPRPAPER_FILE
echo "preload = \$wallpaper" >> $HYPRPAPER_FILE
echo "wallpaper = , \$wallpaper" >> $HYPRPAPER_FILE

echo "Reloading pywal colorscheme"
wal -q -s -t -i "$SET_WALLPAPER_FULL"

echo "Updating hyprpaper wallpaper"
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$SET_WALLPAPER_FULL"
hyprctl hyprpaper wallpaper ", $SET_WALLPAPER_FULL"

echo "Reloading stylsheet for SwayNC"
swaync-client -rs

exit 0
