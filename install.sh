#!/bin/sh

base="xorg xorg-xinit dmenu i3-gaps i3status termite fish base-devel nasm feh pulseaudio"

full="$base qtcreator firefox networkmanager neofetch pavucontrol-qt pcmanfm-qt vlc"
full_aur="spotify qps"

if [ "$1" == "base" ]; then
	sudo pacman -S --noconfirm --needed $base
fi

if [ "$1" == "full" ]; then
	sudo pacman -S --noconfirm --needed $full
	yay -S --noconfirm --needed $full_aur
fi 

if [ "$1" == "yay" ]; then
	sudo pacman -S --noconfirm --needed go git base-devel
	git clone "https://www.github.com/Jguer/yay.git"
	make -C yay
	sudo make -C yay install
fi

if [ "$1" == "amdgpu" ]; then
	gpu="xf86-video-amdgpu mesa vulkan-radeon mesa-vdpau glu mesa-vdpau libva-mesa-driver vulkan-mesa-layers"
	lib32_gpu="lib32-mesa lib32-vulkan-radeon lib32-mesa-vdpau lib32-glu lib32-mesa-vdpau lib32-libva-mesa-driver lib32-vulkan-mesa-layers"
	sudo pacman -S --noconfirm --needed $gpu $lib32_gpu
fi

if [ "$1" == "config" ]; then
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

