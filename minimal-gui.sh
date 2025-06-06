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

# ----- copy pulseaudio config
mkdir -p ~/.config/pulse
cp pulse-daemon.conf ~/.config/pulse/daemon.conf

# ----- copy vim config
cp vimrc ~/.vimrc

# ----- download terminal fonts
FONT_DIR="$HOME/.local/share/fonts"

fetch-font () {
	curl "$DEPENDENCY_URL/font/$1" > "$FONT_DIR/$1"
}

mkdir -p $FONT_DIR
fetch-font Cousine-Bold.ttf
fetch-font Cousine-BoldItalic.ttf
fetch-font Cousine-Italic.ttf
fetch-font Cousine-Regular.ttf

# ----- configure git
git config --global pull.rebase false
git config --global credential.helper store
git config --global init.defaultBranch main

# ----- copy scripts
sudo cp scripts/* /usr/local/bin/
