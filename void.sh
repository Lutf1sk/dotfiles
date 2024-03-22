#!/bin/bash

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

sudo xbps-install -Suy $util $dev $mesa $terminal $session $window $xdg

# ----- enable services
sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -s /etc/sv/polkitd /var/service/
sudo sv up polkitd

# ----- copy .bashrc
cp void_bashrc ~/.bashrc

# ----- run distribution independent scripts
bash tools.sh
bash shared.sh
