#!/bin/sh

vol=$1
for sink in `pacmd list-sinks | grep 'index:' | cut -b12-`; do
	pactl set-sink-volume $sink $vol
done

