#!/usr/bin/zsh

bat() {
    acpi | awk '{ print $3,$4}' | sed s/\,//g
}
vol() {
    pamixer --get-volume
}
br() {
    brightnessctl | grep "Current" | awk '{ print $4 }' | sed -E "s/\(|\)|\%//g"
}
dt() {
    date | awk '{print $1 " " $2 " " $3}'
}

DELAY=1


while :; do
    echo "$(dt) | BAT: $(bat) | VOL: $(vol) | BR: $(br)| $(network.sh) "
    sleep $DELAY
done
