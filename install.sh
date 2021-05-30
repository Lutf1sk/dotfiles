#!/bin/sh

base="xorg i3-gaps i3status termite fish base-devel nasm feh pulseaudio"

full="$base qtcreator lxrandr firefox networkmanager neofetch xfce4-taskmanager pavucontrol volumeicon"

if [ $1 == "base" ]; then
	sudo pacman -S --noconfirm --needed $base
fi

if [ $1 == "full" ]; then
	sudo pacman -S --noconfirm --needed $full
fi 

if [ $1 == "yay" ]; then
	sudo pacman -S --noconfirm --needed go git base-devel
	git clone "https://www.github.com/Jguer/yay.git"
	make -C yay
	sudo make -C yay install
fi

if [ $1 == "config" ]; then
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
fi

