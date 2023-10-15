#!/bin/bash

sudo xbps-install -Su void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

base="psmisc"
dev="git make gcc clang nasm"
mesa="mesa mesa-dri mesa-vaapi mesa-vdpau"
session="polkit dbus elogind elogind-dbus"
window="sway xorg-server-xwayland xorg-fonts"
xdg="xdg-desktop-portal xdg-user-dirs xdg-utils"

sudo xbps-install -Su $base $dev $mesa $session $window $xdg

# enable services
sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -s /etc/sv/polkitd /var/service/
sudo sv up polkitd
