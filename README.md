# Retrozinn's Hyprland Dots
My customized Hyprland configuration that I use everyday!

<div align="center">
<div class="screenshot-container">
 <img width=48% src="repo/screenshot_lockscreen.png">
 <img width=48% src="repo/screenshot_desktop.png">
 <img width=48% src="repo/screenshot_tools.png">
 <img width=48% src="repo/screenshot_usage.png">
</div>
 <br>

 https://github.com/user-attachments/assets/6da4ee8f-56d0-4b2e-9ce7-5d721ad9c943

 <p>(for some reason I was nervous when recording this lol)</p>
</div>
<br>


## 🎨 Colors
All the colors are dynamically based on the current wallpaper! This is possible by using [pywal], a cli tool to generate colorschemes by using an image as a base.

## 🖼️ Wallpapers
When you're at the [Installation](#Installation) process, you can choose to copy my dotfiles' wallpapers folder. If you chose to copy, you can change the current wallpaper by pressing <kbd>SUPER</kbd> + <kbd>W</kbd>, or clicking to change wallpaper in the Control Center.

## Installation
You'll need to have installed all needed packages before installing my dotfiles! Use your package manager to do so. See needed packages on [`Wiki/Dependencies`].

In order to install this style right away, just run this installation script:

> ℹ️ Notice: the installation script will make a backup folder containing all previous files in `~/hyprland-dots-bkp`.

> 💡 Tip: Note the `$` character means that it's recommended to run this command without root privileges.

```nushell
 $ git clone "https://github.com/retrozinndev/Hyprland-Dots.git"; cd Hyprland-Dots; bash apply.sh
```

### ❔ How to Use
See usage and other relevant info on the [Wiki].

### 🎉 Apps
- Browser: [Zen Browser]
- Text Editor: [Neovim], my config is [here](https://github.com/retrozinndev/nvim-conf.lua)
- See more on the [wiki]!

## ❗ Issues
Got any issue? Please create a [new Issue], I'll be happy for helping you out!

## 📜 License
This repo is licensed under the [MIT License].


<!-- References(Other repos / websites) -->
[pywal]: https://github.com/dylanaraps/pywal
[mit license]: https://en.wikipedia.org/wiki/MIT_License
[zen browser]: https://zen-browser.app
[neovim]: https://neovim.io

<!-- Tabs -->
[wiki]: https://github.com/retrozinndev/Hyprland-Dots/wiki
[issues]: https://github.com/retrozinndev/Hyprland-Dots/issues

<!-- Wiki Pages -->
[`wiki/dependencies`]: https://github.com/retrozinndev/Hyprland-Dots/wiki/Dependencies

<!-- Action Links -->
[new issue]: https://github.com/retrozinndev/Hyprland-Dots/issues/new
