#!/bin/sh

pacman -Qenq > packages.txt
pacman -Qemq | grep -v 'brother' > aur.txt
