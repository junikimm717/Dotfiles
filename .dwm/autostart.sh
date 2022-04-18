#!/bin/zsh
killall picom
killall dwmblocks
nitrogen --restore &disown
dwmblocks& disown
picom --corner-radius 15&

eww open left
