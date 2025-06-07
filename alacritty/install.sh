#!/bin/bash
TARGET_DIR="$HOME/.config/alacritty"
TARGET="$TARGET_DIR/alacritty.toml"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add alacritty
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu alacritty
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S alacritty
fi

mkdir -p "$TARGET_DIR"
cp alacritty.toml "$TARGET"

echo -e \\x1B[32malacritty successfully installed!

