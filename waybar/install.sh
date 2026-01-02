#!/bin/bash
TARGET_DIR="$HOME/.config/waybar/"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add waybar
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu waybar
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S waybar
fi

mkdir -p "$TARGET_DIR"
cp config    "$TARGET_DIR"
cp style.css "$TARGET_DIR"

echo -e \\x1B[32mwaybar successfully installed!

