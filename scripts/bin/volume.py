#!/usr/bin/env python3

import subprocess

out = subprocess.run(["pamixer", "--get-volume"], capture_output=True).stdout
vol = int(out.strip())

x = ""

if vol == 0:
    x = "🔇"
elif vol <= 30:
    x = "🔈"
elif vol <= 70:
    x = "🔉"
else:
    x = "🔊"

print(x, f'{vol}%')
