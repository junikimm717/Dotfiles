#!/bin/zsh
QUIT=$(echo "No\nYes" | dmenu -i -p "Are you sure u want to kill $MANAGER?")

if [[ "$QUIT" == "Yes" ]]; then
    killall $MANAGER
fi

