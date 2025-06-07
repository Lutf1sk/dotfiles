#!/bin/bash
TARGET_DIR="$HOME/.config/i3"
TARGET="$TARGET_DIR/config"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add sway i3status swaybg playerctl
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu sway i3status swaybg playerctl
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S sway swaybg playerctl i3status
fi

mkdir -p "$TARGET_DIR"
cp config i3status.conf volumectl.sh toggle-keyboard-layout.sh "$TARGET_DIR/"
cat "$MODE""_config" >> "$TARGET" || true

echo -e \\x1B[32mi3 successfully installed!

