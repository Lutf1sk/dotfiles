#!/bin/bash

font_dir="$HOME/.local/share/fonts"

fetch () {
	curl https://lutfisk.net/files/ScriptDeps/font/$1 > $font_dir/$1
}

mkdir -p $font_dir
fetch UbuntuMono-Bold.ttf
fetch UbuntuMono-BoldItalic.ttf
fetch UbuntuMono-Italic.ttf
fetch UbuntuMono-Regular.ttf
