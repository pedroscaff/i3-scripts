#!/bin/sh

# cool script, but it is just too slow on a 4K screen and a waste of energy
maim | convert - -blur 20x10 /tmp/screen-lock.png
# maim | convert - -scale 5% -blur 0x2.5 -resize 2000% /tmp/screen-lock.png
# maim | convert - -scale 10% -resize 1000% /tmp/screen-lock.png
i3lock -i /tmp/screen-lock.png
