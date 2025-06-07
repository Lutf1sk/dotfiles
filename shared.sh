#!/bin/bash
set -e

cd $(dirname $0)

vim/install.sh
./install-git.sh

# ----- download kvantum theme
# sudo mkdir -p /usr/lib64/qt5/plugins/styles
# curl "$DEPENDENCY_URL/libkvantum.so" > _libkvantum.so
# sudo mv _libkvantum.so /usr/lib64/qt5/plugins/styles/libkvantum.so

# ----- set icon theme colors
papirus-folders -C green -u -t Papirus-Dark

# ----- download wallpaper
curl "$DEPENDENCY_URL/wallpaper" > ~/img/wallpaper

# ----- copy scripts
sudo cp scripts/* /usr/local/bin/
