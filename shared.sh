#!/bin/bash

DEPENDENCY_URL="https://lutfisk.net/files/ScriptDeps/"

# ----- set up user-dirs
mkdir -p ~/.config
cp user-dirs.dirs ~/.config/
mkdir -p ~/img ~/doc ~/src ~/audio ~/dl ~/desktop

# ----- install alacritty config
mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml ~/.config/alacritty/

# ----- install fish config
mkdir -p ~/.config/fish
cp fish/config.fish ~/.config/fish/

# ----- install configs for i3/sway
mkdir -p ~/.config/i3
cp i3/config i3/i3status.conf i3/volumectl.sh ~/.config/i3/

# ----- install picom configs
mkdir -p ~/.config/picom
cp picom/picom.conf ~/.config/picom/
cp picom/toggle-picom.sh ~/.config/picom/

# ----- download terminal fonts
FONT_DIR="$HOME/.local/share/fonts"

fetch-font () {
	curl "$DEPENDENCY_URL/$1" > "$FONT_DIR/$1"
}

mkdir -p $FONT_DIR
fetch-font UbuntuMono-Bold.ttf
fetch-font UbuntuMono-BoldItalic.ttf
fetch-font UbuntuMono-Italic.ttf
fetch-font UbuntuMono-Regular.ttf

# ----- download wallpaper
curl "$DEPENDENCY_URL/wallpaper" > ~/img/wallpaper

# ----- configure git
git config --global pull.rebase false
git config --global core.editor led
git config --global credential.helper store
