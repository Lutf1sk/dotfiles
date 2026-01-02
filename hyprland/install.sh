#!/bin/bash
TARGET_DIR="$HOME/.config/hypr"
TARGET="$TARGET_DIR/hyprland.conf"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add pipewire pipewire-alsa pipewire-pulse pipewire-jack pipewire-tools wireplumber
	doas apk add hyprland playerctl breeze-cursors
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu hyprland playerctl
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S hyprland playerctl
fi

mkdir -p "$TARGET_DIR"
cp hyprland.conf "$TARGET"
cat "hyprland_$MODE.conf" >> "$TARGET" || true

echo -e \\x1B[32mhyprland successfully installed!

