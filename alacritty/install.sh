#!/bin/sh
TARGET_DIR="$HOME/.config/alacritty"
TARGET="$TARGET_DIR/alacritty.toml"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add alacritty
elif [ "$HOME" == "void"   ]; then
	sudo xbps -S alacritty
elif [ "$HOME" == "arch"   ]; then
	sudo pacman -S alacritty
fi

mkdir -p "$TARGET_DIR"
cp alacritty.toml "$TARGET"

echo -e \\x1B[32malacritty successfully installed!

