#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config

old() {
    polybar mybar &
}
newver() {
    polybar background & sleep 0.5
    polybar i3 &
    polybar battery &
    polybar backlight &
    polybar wlan &
    polybar alsa &
}

#old()
newver

echo "Polybar launched..."
