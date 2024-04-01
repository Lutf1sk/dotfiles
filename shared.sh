#!/bin/bash
set -e

DEPENDENCY_URL="https://lutfisk.net/script-dependencies"

# ----- set up user-dirs
mkdir -p ~/.config
cp user-dirs.dirs ~/.config/
mkdir -p ~/img ~/doc ~/src ~/audio ~/dl ~/desktop

# ----- copy alacritty config
mkdir -p ~/.config/alacritty
cp alacritty.toml ~/.config/alacritty/

# ----- copy configs for i3/sway
mkdir -p ~/.config/i3
cp i3/config i3/i3status.conf i3/volumectl.sh ~/.config/i3/

# ----- copy strawberry config
mkdir -p ~/.config/strawberry
cp strawberry.conf ~/.config/strawberry/

# ----- download terminal fonts
FONT_DIR="$HOME/.local/share/fonts"

fetch-font () {
	curl "$DEPENDENCY_URL/font/$1" > "$FONT_DIR/$1"
}

mkdir -p $FONT_DIR
fetch-font UbuntuMono-Bold.ttf
fetch-font UbuntuMono-BoldItalic.ttf
fetch-font UbuntuMono-Italic.ttf
fetch-font UbuntuMono-Regular.ttf

# ----- download kvantum theme
sudo mkdir -p /usr/lib64/qt5/plugins/styles
curl "$DEPENDENCY_URL/libkvantum.so" > _libkvantum.so
sudo mv _libkvantum.so /usr/lib64/qt5/plugins/styles/libkvantum.so

# ----- download wallpaper
curl "$DEPENDENCY_URL/wallpaper" > ~/img/wallpaper

# ----- configure git
git config --global pull.rebase false
git config --global core.editor led
git config --global credential.helper store
git config --global user.email "lutfisk@lutfisk.net"
git config --global user.name "Alex Edin"

# ----- copy scripts
sudo cp scripts/* /usr/local/bin/
