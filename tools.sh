#!/bin/bash

git clone --recursive https://github.com/Lutf1sk/led
sudo make -C led install
sudo rm -r led

git clone --recursive https://github.com/Lutf1sk/ldasm
sudo make -C ldasm install
sudo rm -r ldasm
