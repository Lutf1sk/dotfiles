#!/bin/bash

# ----- set kvantum theme
kvantummanager --set KvFlatRed

# ----- start qt5ct
qt5ct &
killall -w qt5ct
