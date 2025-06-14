#!/bin/bash
DEPENDENCY_URL="https://lutfisk.net/script-dependencies"
FONT_DIR="$HOME/.local/share/fonts"

fetch-font () {
	curl "$DEPENDENCY_URL/font/$1" > "$FONT_DIR/$1"
}

mkdir -p $FONT_DIR
fetch-font Cousine-Bold.ttf
fetch-font Cousine-BoldItalic.ttf
fetch-font Cousine-Italic.ttf
fetch-font Cousine-Regular.ttf

echo -e \\x1B[32mfonts successfully installed!

