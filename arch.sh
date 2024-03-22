#!/bin/sh

# ----- install system packages
util="curl"
dev="base-devel git make gcc clang nasm"
terminal="alacritty fish"
window="xorg xorg-xinit i3-gaps i3stats dmenu feh"
sound="wireplumber pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack"

packages="$util $dev $terminal $window $sound"
sudo pacman -S --noconfirm --needed $packages

# ----- install yay
sudo pacman -S --noconfirm --needed go git base-devel
git clone "https://www.github.com/Jguer/yay.git"
make -C yay
sudo make -C yay install

# ----- enable services
systemctl --user enable wireplumber
systemctl --user start wireplumber
systemctl --user enable pipewire
systemctl --user start pipewire
systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse

if [ "$1" == "amdgpu" ]; then
	gpu="xf86-video-amdgpu mesa vulkan-radeon mesa-vdpau glu mesa-vdpau libva-mesa-driver vulkan-mesa-layers"
	lib32_gpu="lib32-mesa lib32-vulkan-radeon lib32-mesa-vdpau lib32-glu lib32-mesa-vdpau lib32-libva-mesa-driver lib32-vulkan-mesa-layers"
	sudo pacman -S --noconfirm --needed $gpu $lib32_gpu
fi

# ----- copy .xinitrc
cp xinitrc ~/.xinitrc

# ----- copy fish config
mkdir -p ~/.config/fish
cp arch_config.fish ~/.config/fish/

# ----- copy picom configs
mkdir -p ~/.config/picom
cp picom/picom.conf ~/.config/picom/
cp picom/toggle-picom.sh ~/.config/picom/

# ----- run distribution independent scripts
bash tools.sh
bash shared.sh
