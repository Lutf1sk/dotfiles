#!/bin/bash
set -e

# ----- add required repositories
sudo xbps-install -Su void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

# ----- install system packages
util="psmisc curl"
dev="git make gcc clang nasm"
mesa="mesa mesa-dri mesa-vaapi mesa-vdpau"
terminal="alacritty bash"
session="polkit dbus elogind dbus-elogind"
window="sway xorg-server-xwayland xorg-fonts i3status dmenu"
xdg="xdg-desktop-portal xdg-user-dirs xdg-utils"
audio="pipewire alsa-pipewire libjack-pipewire libspa-bluetooth"
gui="firefox pcmanfm-qt pavucontrol-qt qps strawberry"

sudo xbps-install -Suy $util $dev $mesa $terminal $session $window $xdg $audio $gui

# ----- enable services
sudo ln -sf /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -sf /etc/sv/polkitd /var/service/
sudo sv up polkitd

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
cp void_bashrc ~/.bashrc

# ----- run distribution independent scripts
bash tools.sh
bash shared.sh

# ----- append distribution dependent i3 settings
cat i3/void_config >> ~/.config/i3/config
