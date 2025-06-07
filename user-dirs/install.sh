#!/bin/bash
cd $(dirname $0)

mkdir -p "$HOME/.config"
cp user-dirs.dirs "$HOME/.config/"
mkdir -p "$HOME/img" "$HOME/doc" "$HOME/src" "$HOME/audio" "$HOME/dl" "$HOME/desktop"

echo -e \\x1B[32muser dirs successfully installed!

