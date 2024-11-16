#!/bin/bash

CURRENT_LAYOUT="$(cut -d ':' -f 2 <<< "$(swaymsg -t get_inputs | grep xkb_active_layout_name)")"

if [[ "$CURRENT_LAYOUT" =~ "English (US)" ]]; then
	swaymsg input type:keyboard xkb_layout se
else
	swaymsg input type:keyboard xkb_layout us
fi

