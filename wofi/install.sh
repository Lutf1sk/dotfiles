#!/bin/sh
TARGET_DIR="$HOME/.config/wofi"
TARGET="$TARGET_DIR/style.css"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add wofi
elif [ "$HOME" == "void"   ]; then
	sudo xbps -S wofi
elif [ "$HOME" == "arch"   ]; then
	sudo pacman -S wofi
fi

mkdir -p "$TARGET_DIR"
cp style.css "$TARGET"

echo -e \\x1B[32mwofi successfully installed!

