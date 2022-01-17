#!/usr/bin/env python3

import subprocess
import re

out = subprocess.run(["brightnessctl"],
capture_output=True).stdout.decode('utf-8')

x = int(re.search('\([0-9]{2}%\)', out).group(0)[1:-2])

icon = ""

if x <= 25:
    icon = "🌔"
elif x <= 50:
    icon = "🌓"
elif x <= 75:
    icon = "🌔"
else:
    icon = "🌕"

print(icon, f"{x}%")
