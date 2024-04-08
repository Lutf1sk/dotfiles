#!/bin/bash

git clone --recursive https://github.com/Lutf1sk/led
sudo make -C led install
mkdir -p ~/.config/led
cp led/example.conf ~/.config/led/led.conf
sudo rm -r led

git clone --recursive https://github.com/Lutf1sk/ldasm
sudo make -C ldasm install
sudo rm -r ldasm

git clone --recursive https://github.com/Lutf1sk/lcloc
sudo make -C lcloc install
sudo rm -r lcloc

git clone --recursive https://github.com/Lutf1sk/lls
sudo make -C lls install
sudo rm -r lls
