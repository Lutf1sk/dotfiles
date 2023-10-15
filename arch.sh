#!/bin/sh

dev="base-devel git make gcc clang nasm"
terminal="alacritty fish"
window="xorg xorg-xinit i3-gaps i3stats dmenu feh"
sound="wireplumber pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack"

packages="$dev $terminal $window $sound"

# packages
sudo pacman -S --noconfirm --needed $packages

# yay
sudo pacman -S --noconfirm --needed go git base-devel
git clone "https://www.github.com/Jguer/yay.git"
make -C yay
sudo make -C yay install

# enable services
systemctl --user enable wireplumber
systemctl --user start wireplumber
systemctl --user enable pipewire
systemctl --user start pipewire
systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse

bash tools.sh

if [ "$1" == "amdgpu" ]; then
	gpu="xf86-video-amdgpu mesa vulkan-radeon mesa-vdpau glu mesa-vdpau libva-mesa-driver vulkan-mesa-layers"
	lib32_gpu="lib32-mesa lib32-vulkan-radeon lib32-mesa-vdpau lib32-glu lib32-mesa-vdpau lib32-libva-mesa-driver lib32-vulkan-mesa-layers"
	sudo pacman -S --noconfirm --needed $gpu $lib32_gpu
fi
