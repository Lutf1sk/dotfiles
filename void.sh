#!/bin/bash
set -e

# ----- perform system update, good to keep here in case
#       outdated packages are installed from the iso
sudo xbps-install -Suy xbps
sudo xbps-install -Suy

# ----- add required repositories
sudo xbps-install -Suy void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree


if [ -z "$MINIMAL" ]; then
	# ----- install packages
	util="psmisc curl"
	dev="git make gcc clang nasm"
	mesa="mesa mesa-dri mesa-vaapi mesa-vdpau"
	terminal="alacritty bash neofetch"
	session="polkit dbus elogind dbus-elogind"
	window="sway xorg-server-xwayland xorg-fonts i3status dmenu"
	xdg="xdg-desktop-portal xdg-user-dirs xdg-utils"
	audio="pipewire alsa-pipewire libjack-pipewire libspa-bluetooth"
	gui="firefox pcmanfm-qt pavucontrol-qt qps strawberry"

	sudo xbps-install -Suy $util $dev $mesa $terminal $session $window $xdg $audio $gui

	# ----- enable services
	sudo ln -sf /etc/sv/dbus /var/service/
	sudo ln -sf /etc/sv/polkitd /var/service/

	# ----- set up pipewire
	sudo mkdir -p /etc/pipewire/pipewire.conf.d
	sudo ln -sf /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
	sudo ln -sf /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

	sudo mkdir -p /etc/alsa/conf.d
	sudo ln -sf /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d/
	sudo ln -sf /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/

	# ----- copy sway launch script
	cp sway.sh ~/sway.sh

	# ----- copy .bashrc
	cp bash/bashrc ~/.bashrc
	cat bash/bashrc_void >> ~/.bashrc

	# ----- run distribution independent scripts
	bash tools.sh
	bash shared.sh

	# ----- append distribution dependent i3 settings
	cat i3/void_config >> ~/.config/i3/config
else
	# ----- install packages
	sudo xbps-install -Suy psmisc curl git make gcc clang nasm bash neofetch

	# ----- copy .bashrc
	cp bash/bashrc ~/.bashrc
	cat bash/bashrc_void >> ~/.bashrc

	# ----- run distribution independent scripts
	bash tools.sh

	# ----- set git editor
	git config --global core.editor led
fi

