#!/bin/sh
if [ `pidof picom` ]; then
	killall picom
else
	picom -b --config ~/.config/picom/picom.conf
fi
exit
