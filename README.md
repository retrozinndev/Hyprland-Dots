# Retrozinndev's Hyprland Dots
My personal Hyprland configuration that I use everyday! Some of the colors used are from the [Catppuccin Mocha Palette](https://github.com/catppuccin), go check it out, it's awesome!

<div style="display:flex;justify-content:center;align-items:center;" class="screenshot-container">
 <img style="width:49%;" src="repo/screenshot_desktop.png">
 <img style="width:49%;" src="repo/screenshot_usage.png">
</div>

![Demo Video](https://github.com/retrozinndev/Hyprland-Dots/raw/main/hypr_demo_video.mp4)

> ⚠️ Notice: This repo is not ready to be used yet. And README.md is also not complete, caution if you try to use this repo!

## Requisites
### Waybar
#### Media
In order to make the `custom/media` widget work, you first need the [mediaplayer.py](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) 
script included in the official [Waybar repo](https://github.com/Alexays/Waybar). You can copy this script to the `~/.config/waybar/` directory(if you don't have 
this folder, you can create one with `mkdir ~/.config/waybar`).
After putting the script in place, you need [playerctl](https://github.com/altdesktop/playerctl) to control the media(play/pause, next and previous).

#### Audio
To control the audio, I use [pavucontrol](https://github.com/pulseaudio/pavucontrol), the Waybar's default audio controller. You can use any other of your preference, 
just change the `"on-click"` value inside `"pulseaudio"` in the `config.jsonc` file to your desired application.



## Usage
### Play/pause media
To do that, you can simply click in the Spotify/Media application widget in waybar when some song is playing.

Clicking in the widget will toggle play/pause actions, you need [playerctl](https://github.com/altdesktop/playerctl) in order to make this work.
### Notification Center
About the notification daemon, I chose [swaync](), because it has it's own notification center, and uses gtk css to customize it.

## Installation
In order to install this style right away, just run this installation script:

> ℹ️ Notice: the installation script will make a backup folder containing all previous files in `~/.hyprland-dots/bkp`.

```bash
 $ git clone "https://github.com/retrozinndev/Hyprland-Dots.git"; cd Hyprland-Dots; bash apply.sh
```
## Issues
Got any issue? Please report it at the [Issues Tab](https://github.com/retrozinndev/Hyprland-Dots/issues/new), I'll be happy for helping you out!
