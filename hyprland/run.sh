#!/bin/sh

dbus-run-session hyprland
killall -q wireplumber pipewire pipewire-pulse
echo
