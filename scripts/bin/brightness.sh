brightnessctl | grep "Current" | awk '{ print $4 }' | sed -E "s/\(|\)|\%//g"
