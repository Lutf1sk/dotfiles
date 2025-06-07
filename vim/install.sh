#!/bin/bash
TARGET_DIR="$HOME"
TARGET="$TARGET_DIR/.vimrc"

cd $(dirname $0)

if   [ "$MODE" == "alpine" ]; then
	doas apk add vim
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu vim
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S vim
fi

if [ ! -d "$HOME/.vim/ctrlp.vim" ]; then
	mkdir -p "$HOME/.vim"
	git clone https://github.com/kien/ctrlp.vim "$HOME/.vim/ctrlp.vim"
fi

mkdir -p "$TARGET_DIR"
cp vimrc "$TARGET"
cat "vimrc_$MODE" >> "$TARGET" || true

echo -e \\x1B[32mvim successfully installed!

