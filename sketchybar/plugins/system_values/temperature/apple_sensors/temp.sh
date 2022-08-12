#!/bin/bash
# https://github.com/bohrshaw/apple_sensors

filepath=$(/usr/bin/readlink ~/.local/bin/temp.sh)
${filepath%/*}/temp.py | sort -t, -k2 -r
