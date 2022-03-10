#!/bin/sh

pacman -Qnq > packages.txt
pacman -Qmq | grep -v 'brother' > aur.txt
