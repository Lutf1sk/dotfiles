#!/bin/bash
set -e

# ----- perform system update, good to keep here in case
#       outdated packages are installed from the iso
sudo xbps-install -Suy xbps
sudo xbps-install -Suy

if [ "$MINIMAL" != "" ]; then
	# ----- install packages
	sudo xbps-install -Suy psmisc curl git make gcc clang nasm bash neofetch ufw

	# ----- copy .bashrc
	cp bash/bashrc ~/.bashrc
	cat bash/bashrc_void >> ~/.bashrc

	# ----- run distribution independent scripts
	bash tools.sh

	# ----- set git editor
	git config --global core.editor led
else
	# ----- add nonfree and multilib repositories
	sudo xbps-install -Suy void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

	# ----- install packages
	util="psmisc curl"
	dev="git make gcc clang nasm"
	mesa="mesa mesa-dri mesa-vaapi mesa-vdpau"
	terminal="alacritty bash neofetch"
	session="polkit dbus elogind dbus-elogind"
	window="sway xorg-server-xwayland xorg-fonts i3status dmenu"
	xdg="xdg-desktop-portal xdg-user-dirs xdg-utils"
	audio="pipewire alsa-pipewire libjack-pipewire libspa-bluetooth"
	theme="kvantum qt5ct papirus-icon-theme papirus-folders"
	gui="firefox pcmanfm-qt lxqt-archiver pavucontrol-qt qps strawberry"

	sudo xbps-install -Suy $util $dev $mesa $terminal $session $window $xdg $audio $theme $gui

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
fi

host () {
	cut -d ' ' -f 1 <<< $(getent hosts $1)
}

# ----- set up firewall
sudo xbps-install -Suy ufw
sudo ln -sf /etc/sv/ufw /var/service/

sudo ufw enable
sudo ufw default deny incoming

if [ "$STRICT" != "" ]; then
	# ----- deny all outgoing
	sudo ufw default deny outgoing

	# ----- allow outgoing dns traffic
	NAMESERVER="$(cut -d ' ' -f 2 <<< $(cat /etc/resolv.conf | grep nameserver))"
	sudo ufw allow out to $NAMESERVER port 53,853 proto tcp
	sudo ufw allow out to $NAMESERVER port 53,853 proto udp

	# ----- allow outgoing traffic to void repos
	for REPO in "$(xbps-query -L)"; do
		URL=$(cut -d ' ' -f 2 <<< $REPO)
		PROTO=$(cut -d ':' -f 1 <<< $URL)
		ADDR=$(host $(cut -d '/' -f 3 <<< $URL))
		sudo ufw allow out to $ADDR port $PROTO
	done
fi
