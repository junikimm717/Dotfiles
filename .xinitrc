#!/bin/bash

setxkbmap -option caps:escape
brightnessctl set 50%

source "/etc/X11/xinit/xinitrc.d/50-systemd-user.sh"

eval "$(gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

# USE BSPWM ONLY!!! (only place where configs fucking work)
export MANAGER=bspwm
exec $MANAGER    

