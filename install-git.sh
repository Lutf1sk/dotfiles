#!/bin/sh
if   [ "$MODE" == "alpine" ]; then
	doas apk add git vim
elif [ "$HOME" == "void"   ]; then
	sudo xbps -S git vim
elif [ "$HOME" == "arch"   ]; then
	sudo pacman -S git vim
fi

git config --global core.editor vim
git config --global pull.rebase false
git config --global credential.helper store
git config --global init.defaultBranch main

echo -e \\x1B[32mgit successfully installed!

