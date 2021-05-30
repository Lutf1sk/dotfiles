#!/bin/sh

mkdir ~/.config

# user-dirs
cp user-dirs.dirs ~/.config/
mkdir ~/img
mkdir ~/doc
mkdir ~/src
mkdir ~/audio
mkdir ~/dl
mkdir ~/desktop

# termite
mkdir ~/.config/termite
cp termite/config ~/.config/termite/

# img
cp img/* ~/img/

# fish
mkdir ~/.config/fish
cp fish/config.fish ~/.config/fish/

# i3
mkdir ~/.config/i3
cp i3/config i3/i3status.conf ~/.config/i3/

# I'm going to leave this commented to prevent myself from accidentally overwriting
# my xinitrc when i don't want to.
# xinitrc
# cp xinitrc ~/.xinitrc

