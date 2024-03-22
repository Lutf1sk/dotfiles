#!/bin/bash

mkdir ~/.config

# user-dirs
cp user-dirs.dirs ~/.config/
mkdir ~/img
mkdir ~/doc
mkdir ~/src
mkdir ~/audio
mkdir ~/dl
mkdir ~/desktop

# alacritty
mkdir ~/.config/alacritty
cp alacritty/alacritty.yml ~/.config/alacritty/

# fish
mkdir ~/.config/fish
cp fish/config.fish ~/.config/fish/

# i3
mkdir ~/.config/i3
cp i3/config i3/i3status.conf i3/volumectl.sh ~/.config/i3/

# picom
mkdir ~/.config/picom
cp picom/picom.conf ~/.config/picom/
cp picom/toggle-picom.sh ~/.config/picom/
