#!/usr/bin/env bash

HYPRPAPER_FILE="$HOME/.config/hypr/hyprpaper.conf"
SET_WALLPAPER=$(find $HOME/wallpapers/ | wofi --dmenu --allow-images true)

echo "" > $HYPRPAPER_FILE # Cleans hyprpaper file

echo "\$wallpaper = $SET_WALLPAPER" >> $HYPRPAPER_FILE
echo "" >> $HYPRPAPER_FILE
echo "splash = true" >> $HYPRPAPER_FILE
echo "preload = \$wallpaper" >> $HYPRPAPER_FILE
echo "wallpaper = , \$wallpaper" >> $HYPRPAPER_FILE

if ! [[ $SET_WALLPAPER == "" ]] && ! [[ $SET_WALLPAPER == " " ]]
then
    killall -q hyprpaper
    exec hyprpaper &
fi

exit 0 
