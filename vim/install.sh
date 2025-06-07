#!/bin/sh
TARGET_DIR="$HOME"
TARGET="$TARGET_DIR/.vimrc"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add vim
elif [ "$HOME" == "void"   ]; then
	sudo xbps -S vim
elif [ "$HOME" == "arch"   ]; then
	sudo pacman -S vim
fi

mkdir -p "$TARGET_DIR"
cp vimrc "$TARGET"
cat "vimrc_$MODE" >> "$TARGET" || true

echo -e \\x1B[32mvim successfully installed!

