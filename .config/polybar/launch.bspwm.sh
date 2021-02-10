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
    polybar -c ~/.config/polybar/config.bspwm background & sleep 0.5
    polybar -c ~/.config/polybar/config.bspwm bspwm &
    polybar -c ~/.config/polybar/config.bspwm battery &
    polybar -c ~/.config/polybar/config.bspwm backlight &
    polybar -c ~/.config/polybar/config.bspwm wlan &
    polybar -c ~/.config/polybar/config.bspwm alsa &
}

newver

echo "Polybar launched..."
