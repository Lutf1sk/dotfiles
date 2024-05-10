#!/bin/bash

export SDL_VIDEODRIVER=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export WLR_NO_HARDWARE_CURSORS=1
export WLR_DRM_DEVICES=/dev/dri/card0

export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt5/plugins
# export QT_STYLE_OVERRIDE=kvantum

export SWAY_LOG=/tmp/sway_log
exec >$SWAY_LOG 2>&1

dbus-launch --exit-with-session sway --unsupported-gpu --verbose
killall -w wireplumber pipewire