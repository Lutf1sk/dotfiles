#!/bin/bash

sudo xbps-install -Su void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

base="psmisc"
dev="git make gcc clang nasm"
mesa="mesa mesa-dri mesa-vaapi mesa-vdpau"
terminal="alacritty bash"
session="polkit dbus elogind dbus-elogind"
window="sway xorg-server-xwayland xorg-fonts i3status dmenu"
xdg="xdg-desktop-portal xdg-user-dirs xdg-utils"

sudo xbps-install -Su $base $dev $mesa $terminal $session $window $xdg

# enable services
sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -s /etc/sv/polkitd /var/service/
sudo sv up polkitd

# .bashrc
cp void_bashrc ~/.bashrc

bash tools.sh
bash config.sh
bash git-conf.sh
