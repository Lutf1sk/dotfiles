#!/bin/bash
TARGET_DIR="$HOME"
TARGET="$TARGET_DIR/.bashrc"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add bash
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu bash
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S bash
fi

mkdir -p "$TARGET_DIR"
cp bashrc "$TARGET"
cat "bashrc_$MODE" >> "$TARGET" || true

echo -e \\x1B[32mbash successfully installed!

