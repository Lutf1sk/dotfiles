#!/bin/bash
TARGET_DIR="$HOME/.config/wofi"
TARGET="$TARGET_DIR/style.css"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add wofi
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu wofi
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S wofi
fi

mkdir -p "$TARGET_DIR"
cp style.css "$TARGET"

echo -e \\x1B[32mwofi successfully installed!

