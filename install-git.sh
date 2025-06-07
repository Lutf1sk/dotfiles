#!/bin/bash
if   [ "$MODE" == "alpine" ]; then
	doas apk add git vim gpg gpg-agent
elif [ "$MODE" == "void"   ]; then
	sudo xbps-install -yu git vim
elif [ "$MODE" == "arch"   ]; then
	sudo pacman -S git vim gpg gpg-agent
fi

git config --global core.editor vim
git config --global commit.gpgsign true
git config --global pull.rebase false
git config --global credential.helper store
git config --global init.defaultBranch main

echo -e \\x1B[32mgit successfully installed!

