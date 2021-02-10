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
    polybar -c ~/.config/polybar/config.herbstluft background & sleep 0.5
    polybar -c ~/.config/polybar/config.herbstluft xwindow &
    polybar -c ~/.config/polybar/config.herbstluft battery &
    polybar -c ~/.config/polybar/config.herbstluft backlight &
    polybar -c ~/.config/polybar/config.herbstluft wlan &
    polybar -c ~/.config/polybar/config.herbstluft alsa &
}

#old()
newver

echo "Polybar launched..."
