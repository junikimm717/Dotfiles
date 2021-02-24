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
    polybar -c ~/.config/polybar/config background & sleep 0.5
    polybar -c ~/.config/polybar/config.herbstluft xwindow &
    polybar -c ~/.config/polybar/config battery &
    polybar -c ~/.config/polybar/config backlight &
    polybar -c ~/.config/polybar/config wlan &
    polybar -c ~/.config/polybar/config alsa &
}

#old()
newver

echo "Polybar launched..."
